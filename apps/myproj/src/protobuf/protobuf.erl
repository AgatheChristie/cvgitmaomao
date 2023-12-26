%%%----------------------------------------------------------------------
%%%
%%% @date  2016.08.02
%%%  协议处理基本共用模块
%%   所有proto_xxx模块中
%%%  de_xxx 函数参数为binary返回值为{ok, record}
%%%  en_xxx 函数参数为term返回值为iodata
%%% @end
%%%
%%%----------------------------------------------------------------------
-module(protobuf).


-include("protobuf.hrl").
-include("common.hrl").
-include("pb_model.hrl").
-include("pb_convert.hrl").
-include("protobuf_pb.hrl").
-include("ecode.hrl").
-include("global.hrl").


-compile(export_all).
-compile(nowarn_export_all).


%% 对消息进行编码,非心跳包处理
s2c_pack(MsgId, MsgCode, _MsgSeq, SendMsg) ->
    try
        {NewMsgId, Protobuf, EncodeFun, NewRecord} = s2c_pack2(MsgId, MsgCode, SendMsg),
        Bin = Protobuf:EncodeFun(NewRecord),
        L = iolist_size(Bin) + ?HEADER_LENGTH,
%%        ?DEBUG("L:~p end",[L]),
%%        D = byte_size(Bin) + ?HEADER_LENGTH,
%%        ?DEBUG("D:~p end",[D]),
        S2CBin = <<L:32, NewMsgId:32, Bin/binary>>,
        protobuf_print:try_s2c_print(67, S2CBin),
        {ok, S2CBin}
    catch
        T:R ->
            ?ERROR(("编码时发生错误~w:~w MsgId:~w record:~p"), [T, R, MsgId, SendMsg]),
            s2c_pack_err
    end.

%% 协议转换
s2c_pack2(MsgId, MsgCode, SendMsg) ->
    SysProtobufPb = pb_convert:get(MsgId),
    #sys_protobuf_pb{
        pb_mod = Protobuf,
        encode_pb = EncodePb,
        is_public = IsPublic
    } = SysProtobufPb,
    %% 判断是否成功协议
    case MsgCode of
        ?E_OK ->
            %% 判断是否走公共接口
            case IsPublic =:= ?IS_PUBLIC_PROTO of
                true ->
                    NewMsgId = ?PUBLIC_SUCCESS_S2C,
                    NewSysProtobufPb = pb_convert:get(NewMsgId),
                    #sys_protobuf_pb{
                        pb_mod = NewProtobuf,
                        encode_pb = NewEncodeFun
                    } = NewSysProtobufPb,
                    {NewMsgId, NewProtobuf, NewEncodeFun, #public_success_s2c{}};
                false ->
                    {MsgId, Protobuf, EncodePb, SendMsg}
            end;
        _ ->
            NewMsgId = ?PUBLIC_FAILURE_S2C,
            NewSysProtobufPb = pb_convert:get(NewMsgId),
            #sys_protobuf_pb{
                pb_mod = NewProtobuf,
                encode_pb = NewEncodeFun
            } = NewSysProtobufPb,
            NewRecord = s2c_failure_record(MsgCode, MsgId),
            {NewMsgId, NewProtobuf, NewEncodeFun, NewRecord}
    end.

%% 对s2c进行解码,记录track日志使用
unpack_s2c([], Result) ->
    Result;
unpack_s2c([BinData | TBinDatas], Result) ->
    {ok, MsgId, MsgSeq, DataBin} = protobuf:unpack_s2c(BinData),
    NewResult = Result ++ [{MsgId, MsgSeq, DataBin}],
    unpack_s2c(TBinDatas, NewResult).

unpack_s2c(<<_Len:?PROTOBUF_MSG_LEN, MsgId:?PROTOBUF_MSG_ID, Rest/binary>>) ->
    case catch check_unpack_s2c(MsgId, Rest) of
        {ok, DataBin} ->
            {ok, MsgId, 0, DataBin};
        _E ->
            ?ERROR("封包协议出错:~w ~w", [MsgId, _E]),
            {ok, MsgId, 0, <<>>}
    end.

check_unpack_s2c(MsgId, Rest) ->
    SysProtobufPb = pb_convert:get(MsgId),
    #sys_protobuf_pb{
        pb_mod = Protobuf,
        decode_pb = DecodePb
    } = SysProtobufPb,
    DataBin = Protobuf:DecodePb(Rest),
    {ok, DataBin}.

%% 公共失败协议record
s2c_failure_record(MsgCode, _MsgId) when is_integer(MsgCode) ->
    #public_failure_s2c{ecode = MsgCode};
s2c_failure_record({MsgCode}, _MsgId) ->
    #public_failure_s2c{ecode = MsgCode};
s2c_failure_record(#failure_msg_int{code = MsgCode, int_values = IntValues}, _MsgId) ->
    #public_failure_s2c{ecode = MsgCode, int_values = IntValues};
s2c_failure_record(#failure_msg_string{code = MsgCode, string_values = StringValues}, _MsgId) ->
    #public_failure_s2c{ecode = MsgCode, string_values = StringValues};
s2c_failure_record(#failure_msg_mix{code = MsgCode, int_values = IntValues, string_values = StringValues}, _MsgId) ->
    #public_failure_s2c{ecode = MsgCode, int_values = IntValues, string_values = StringValues};

s2c_failure_record(MsgCode, MsgId) ->
    ?ERROR("协议号:~w的返回值出错:~w", [MsgId, MsgCode]),
    #public_failure_s2c{ecode = ?E_ERROR_HANLE}.

%% 根据协议号计算协议模块
calc_msg_model(MsgId) ->
    MsgId div 10000.