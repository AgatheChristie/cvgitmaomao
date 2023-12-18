%%%----------------------------------------------------------------------
%%%
%%% @date  2016.08.02
%%%  协议打印
%%%
%%%----------------------------------------------------------------------
-module(protobuf_print).

-include("protobuf.hrl").
-include("common.hrl").

-include("pb_model.hrl").
-include("pb_convert.hrl").

-export([
    try_s2c_print/2
    , s2c_print/2
    , try_c2s_print/5
    , print/5
    , print2/6
    , http_print/6
]).

%% s2c的打印协议
-ifdef(PRODUCT).
try_s2c_print(_GwRoleId, _Bin) ->
    next.
-else.
try_s2c_print(GwRoleId, Bin) ->
    ?TRY_CATCH(s2c_print(GwRoleId, Bin)).

s2c_print(GwRoleId, [H | _T] = Bin) when is_binary(H) ->
    {ok, MsgId, MsgSeq, Req} = protobuf:unpack_s2c(Bin),
    %% 打印接收的信息
    print(GwRoleId, <<"s2c">>, MsgId, MsgSeq, Req);
s2c_print(GwRoleId, Data) ->
    lists:foreach(fun(Bin) -> s2c_print(GwRoleId, Bin) end, Data).
-endif.

%% 打印协议
-ifdef(PRODUCT).
try_c2s_print(_RoleId, _LoginIp, _MsgId, _MsgSeq, _Req) ->
    next.
-else.
try_c2s_print(RoleId, LoginIp, MsgId, MsgSeq, Req) ->
    ?TRY_CATCH(print(RoleId, LoginIp, MsgId, MsgSeq, Req)).
-endif.

%% tcp协议打印
-ifdef(PRODUCT).
%% 协议打印
print(_RoleId, _LoginIp, _Ip, _MsgId, _MsgSeq, _R) ->
    next.
-else.
print(RoleId, LoginIp, MsgId, MsgSeq, Req) ->
    MsgMod = protobuf:calc_msg_model(MsgId),
    print2(RoleId, LoginIp, MsgMod, MsgId, MsgSeq, Req).

print2(_RoleId, _IP, _MsgMode, ?PUBLIC_SUCCESS_S2C, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?PUBLIC_FAILURE_S2C, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?NET_HEART_C2S, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, ?PB_MODEL_NET, _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?ROLE_UPDATE_MONEY_S2C = _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?ROLE_UPDATE_ATTR_S2C = _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?BAG_INFO_C2S = _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?BAG_INFO_S2C = _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?BAG_ADD_S2C = _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?BAG_UPDATE_S2C = _MsgId, _MsgSeq, _R) ->
    next;
print2(_RoleId, _IP, _MsgMode, ?BAG_DELETE_S2C = _MsgId, _MsgSeq, _R) ->
    next;

print2(_RoleId, _IP, ?PB_MODEL_TEAM = _MsgMode, _MsgId, _MsgSeq, _R) ->
    next;
%%print2(_RoleId, _Ip, _MsgMode, _MsgId, _MsgSeq, _R) ->
%%    pass.

print2(_RoleId, _IP, _MsgMode, _MsgId, _MsgSeq, _R) ->
    ?DEBUG(("~-15..\.s....~3..\ w ~7..\ w ~3..\ w role_id:~w ~w"), [_IP, _MsgMode, _MsgId, _MsgSeq, _RoleId, _R]).
-endif.

%% http协议打印
-ifdef(PRODUCT).
http_print(_RoleId, _Ip, _MsgId, _MsgSeq, _R) ->
    pass.
-else.
http_print(_RoleId, _IP, ?PB_MODEL_NET, _MsgId, _MsgSeq, _R) ->
    next;
http_print(_RoleId, _IP, MsgMode, MsgId, MsgSeq, _R) ->
    ?DEBUG(("~-15..\.s....~3..\ w ~7..\ w ~3..\ w role_id:~w ~w"), [_IP, MsgMode, MsgId, MsgSeq, _RoleId, _R]).
-endif.