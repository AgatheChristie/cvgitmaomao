%%%----------------------------------------------------------------------
%%%
%%% @date 2016-04-19
%%% 协议的自动生成头文件
%%% @end
%%%
%%%----------------------------------------------------------------------
-ifndef(PROTOBUF_HRL).
-define(PROTOBUF_HRL, true).

%% 协议中的bit长度
-define(PROTOBUF_MSG_LEN, 16).
%% 协议中的bit序列号长度
-define(PROTOBUF_SEQ_LEN, 16).
%% 协议中的bit协议号长度
-define(PROTOBUF_MSG_ID, 32).
%% 协议中的role_id长度
-define(PROTOBUF_ROLE_ID_LEN, 32).

%% websocket的数据类型
-define(WEBSOCKET_FRAGMENT, 0).
-define(WEBSOCKET_TEXT, 1).
-define(WEBSOCKET_BINARY, 2).
-define(WEBSOCKET_CLOSE, 8).
-define(WEBSOCKET_PING, 9).
-define(WEBSOCKET_PONG, 10).

%% 公共协议
-define(NOT_PUBLIC_PROTO, 0).
-define(IS_PUBLIC_PROTO, 1).

%% 加密模式
-define(ENCRYPT_NOT_TYPE, 0).                                             %% 不用加密
-define(ENCRYPT_TYPE_FIRST, 1).                                           %% 普通的异或加解密,只处理第一个包(登陆前信息)
-define(ENCRYPT_TYPE_NORMAL, 2).                                          %% 普通的异或加解密
-define(ENCRYPT_TYPE_RC4, 3).                                             %% RC4加解密
-define(ENCRYPT_TYPE_MAPPING, 4).                                         %% 密码映射表加密

%% 加密模式列表
-define(ENCRYPT_TYPE_LIST, []).


%% 所有加密列表
-define(ENCRYPT_INFO_LIST, encrypt_info_list).
%% 生成加密key的随机范围
-define(ENCRYPT_NORMAL_NUM, 32).

%% 协议号的范围
-define(PROTOBUF_MOD_NUM, 10000).

%% 协议组合
-record(sys_protobuf_pb, {
    pb_mod = "",                                                          %% 协议模块
    encode_pb = "",                                                       %% encode协议模块
    decode_pb = "",                                                       %% decode协议模块
    cor_cmd_id = 0,                                                       %% 对应协议id
    is_public = 0,                                                        %% 是否公共协议
    pb_record = none                                                      %% 对应record
}).

%% 整形错误协议
-record(failure_msg_int, {
    code = 0,                                                             %% 错误码
    int_values = []                                                       %% 整形值数组
}).

%% 字符串错误协议
-record(failure_msg_string, {
    code = 0,                                                             %% 错误码
    string_values = []                                                    %% 字符串值数组
}).

%% 混合错误协议
-record(failure_msg_mix, {
    code = 0,                                                             %% 错误码
    int_values = [],                                                      %% 整形值数组
    string_values = []                                                    %% 字符串值数组
}).

%% 加密信息
-record(encrypt_info, {
    encrypt_type = 0,                                                     %% 加密类型
    encrypt_index = 0,                                                    %% 序号
    encrypt_key = "",                                                     %% 加密key
    mapping_list = [],
    encrypt_mapping = [],                                                 %% 加密密码表
    dencrypt_mapping = []                                                 %% 解密密码表
}).

-endif. % GEN_PROTO_HRL
