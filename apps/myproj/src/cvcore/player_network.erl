%%%-------------------------------------------------------------------
%%% @author pan hao
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. 12月 2019 17:49
%%%-------------------------------------------------------------------
-module(player_network).

%% API
-export([]).

-export([init/2]).
-export([websocket_init/1]).
-export([websocket_handle/2]).
-export([websocket_info/2]).
-export([terminate/3]).


-record(client, {
    player_pid = none,
    player_id = 0,
    account = "",
    ip = <<>>,
    is_doing_request = false,
    messages_to_client = [],
    low_messages_to_client = [],
    requests_unprocessed = []
}).


-include("common.hrl").
-include("protobuf.hrl").



-define(MAX_UNPROCESSED_MSG, 10).   %% requests_unprocessed 最大个数, 超过这个个数，active 设为false
-define(IDLE_TIMEOUT, 120000).   %% 客户端在这个时间内没有发消息过来则会断开链接 单位 毫秒

init(Req, _HandlerOpts) ->
    Ip = get_client_ip(Req),
    {cowboy_websocket, Req, #{ip => Ip}, #{idle_timeout => ?IDLE_TIMEOUT}}.

websocket_init(_State = #{ip := Ip}) ->
    ?DEBUG("new client connect, ip:[~p]~n ", [Ip]),
    {ok, #client{ip = Ip}}.

routing(_Client, MsgId, Binary) ->
    try
        SysProtobufPb = pb_convert:get(MsgId),
        #sys_protobuf_pb{pb_mod = Protobuf, decode_pb = DecodePb} = SysProtobufPb,
        DataBin = Protobuf:DecodePb(Binary),
        {ok, MsgId, DataBin}
    catch
        T:R ->
            ?ERROR(("编码时发生错误~w:~w MsgId:~w record:~w"), [T, R, MsgId, qqq]),
            routing_error
    end.


%% @doc 处理客户端发过来的消息, websocket_handle 函数返回值支持的结果，可以在 cowboy_websocket:handle_call 查看
%%websocket_handle({binary, Msg = <<WWW:32, Cmd:32, Body/binary>>}, Client = #client{requests_unprocessed = Requests,
%%    player_pid = PlayerPid, player_id = _PlayerId}) ->
%%%%    ?DEBUG("websocket handle when ~p ~p,~n", [need_save_request(Client), length(Requests) + 1]),
%%    %% @doc 打印客户端发来的消息
%%    %%?PRINT_MSG_RECEIVED(PlayerId, Cmd, Body),
%%    case routing(111, Cmd, Body) of
%%        {ok, ?NET_NIU_ROLE_LOGIN_C2S, _Data} ->
%%            ?DEBUG("receive other data ~p, ~p, ~p,~n", [WWW, Cmd, _Data]),
%%%%            handle_login(Cmd, Data, Client);
%%            ok;
%%        _Other when is_pid(PlayerPid) ->
%%            case need_save_request(Client) of
%%                true ->
%%                    Reply = case length(Requests) > ?MAX_UNPROCESSED_MSG of
%%                                true ->
%%                                    %% @doc 返回 active false ,cowboy_websocket 不会受到tcp 的数据
%%                                    [{active, false}];
%%                                false -> ok
%%                            end,
%%                    {Reply, Client#client{requests_unprocessed = Requests ++ [{binary, Msg}]}};
%%                false ->
%%                    case erlang:is_process_alive(PlayerPid) of
%%                        true ->
%%                            %% 将消息发到逻辑进程处理
%%                            gen_server:cast(PlayerPid, {packet, Cmd, Body}),
%%                            {ok, Client#client{is_doing_request = true}};
%%                        false ->
%%                            ?ERROR("receive other data ~p, ~p,~n", [Cmd, Body]),
%%                            {ok, Client}
%%                    end
%%            end;
%%        _ ->
%%            ?DEBUG("receive other data ~p, ~p, ~p,~n", [WWW, Cmd, Body]),
%%            {ok, Client}
%%    end;

websocket_handle(pong, Client = #client{player_id = _PlayerId}) ->
    {ok, Client};

websocket_handle(ping, Client = #client{player_id = _PlayerId}) ->
    {ok, Client};

websocket_handle(_Data, Client = #client{player_id = PlayerId}) ->
    ?ERROR("[~p] websocket handle other data ~p ~n", [PlayerId, _Data]),
    {ok, Client}.

%% @doc 会存在 is_doing_request 是 false  且 requests_unprocessed 不是空的情况吗
%% @doc 好像不存在吧
need_save_request(_Client = #client{is_doing_request = true}) -> true;
need_save_request(_Client = #client{requests_unprocessed = Requests}) when Requests =/= [] -> true;
need_save_request(_Client) -> false.

%% 处理游戏内发过来的消息
websocket_info({send_to_client, Bin, Priority}, Client = #client{is_doing_request = true,
    messages_to_client = MessageList, low_messages_to_client = HPMessageList}) ->
    %%?DEBUG("message list length ~w~n",[length(MessageList) + 1]),
    Client1 = case Priority of
                  ?PROTOCOL_ORDER_NORMAL ->
                      Client#client{messages_to_client = [{binary, Bin} | MessageList]};
                  ?PROTOCOL_ORDER_LOW ->
                      Client#client{low_messages_to_client = [{binary, Bin} | HPMessageList]}
              end,
    {ok, Client1};

websocket_info({send_to_client, Bin, _Priority}, Client = #client{is_doing_request = false,
    player_id = _PlayerId}) ->
    %%?PRINT_MSG_SEND(PlayerId, [{binary, Bin}]),
    {reply, {binary, Bin}, Client};

websocket_info({read_next}, Client = #client{
    player_pid = PlayerPid,
    player_id = PlayerId,
    messages_to_client = MessageList0,
    low_messages_to_client = LowMessageList,
    requests_unprocessed = Requests}) ->
    MessageList = lists:reverse(LowMessageList ++ MessageList0),
    case Requests of
        [] ->
            {reply, MessageList, Client#client{is_doing_request = false,
                messages_to_client = [], low_messages_to_client = []}};
        [{binary, <<Cmd:16, Body/binary>>} | TailMsg] ->
            case is_pid(PlayerPid) andalso erlang:is_process_alive(PlayerPid) of
                true ->
                    gen_server:cast(PlayerPid, {packet, Cmd, Body}),
                    NewClient = Client#client{is_doing_request = true,
                        messages_to_client = [],
                        low_messages_to_client = [],
                        requests_unprocessed = TailMsg},
                    case TailMsg of
                        [] ->
                            %% @doc active 设成 true 这个时候又可以重新从 tcp 获取数据
                            {[{active, true} | MessageList], NewClient};
                        _ ->
                            {reply, MessageList, NewClient}
                    end;
                false ->
                    ?ERROR("[~p]player pid not exist when read next [~p]~n", [PlayerId, PlayerPid]),
                    {stop, Client}
            end
    end;

websocket_info({'DOWN', _MonitorRef, process, Pid, Why}, Client = #client{player_pid = Pid}) ->
    case Why =:= normal of
        true ->
            ok;
        false ->
            ?DEBUG("logic process ~p stop with reason ~p,~n", [Pid, Why])
    end,
    {stop, Client};

websocket_info({set_debug, TF}, Client) ->
    put('@is_debug', TF),
    {ok, Client};

websocket_info(login_conflict, Client) ->
    {stop, Client};

websocket_info(_Info, Client) ->
    ?DEBUG("other websocket info ~p,~n", [_Info]),
    {ok, Client}.

terminate(Reason, _Req, #client{player_id = PlayerId, account = Account}) ->
    ?DEBUG("~p player network terminate ~p,~p~n", [PlayerId, Account, Reason]),
    %% player_online_mgr:network_detach(PlayerId, self()),
    ok.


%% @doc 处理login_request 协议
%%handle_login(Cmd, Data, Client = #client{player_id = 0, ip = Ip}) ->
%%    try Data of
%%%%        LoginRequest = #login_request{svr_id = SvrId, account = Account, is_reconnect = IsReconnect,
%%%%            language = Language, platform = Platform, args = Args} ->
%%   LoginRequest = #net_niu_role_login_c2s{sn = Sn, acc_id = Accid, acc_name = Accname,
%%    ts_tamp = TsTamp, ticket = Ticket} ->
%%            ?DEBUG("login request ~p ~n", [LoginRequest]),
%%            try can_login(LoginRequest, Ip) of
%%                {false, Status} ->
%%
%%                    Reply = #login_reply{status = Status},
%%                    {reply, {binary, erl_protocol:encode(Reply)}, Client};
%%                {true, PlayerId} ->
%%                    IsReady = ?IF(IsReconnect =:= ?FALSE, false, true),
%%                    ready_login(Client, PlayerId, Account, SvrId, Ip, IsReady, Language, IsReconnect,
%%                        Platform, false, Args)
%%            catch throw : Code ->
%%                Packet = ?ENCODE_ERROR(login_reply, Code),
%%                {reply, {binary, Packet}, Client}
%%            end
%%    catch _T:_E:_S ->
%%        ?ERROR("handle login error when decode ~p,~p Ip ~p ~n", [Cmd, Body, Ip]),
%%        {stop, Client}
%%    end;
%%handle_login(_Cmd, _Body, Client) ->
%%    {ok, Client}.
%%
%%
%%ready_login(Client, PlayerId, Account, SvrId, Ip, IsReady, Language, IsReconnect, Platform, IsNew, Args) ->
%%    Args1 = parse_login_args(Args),
%%    case catch player_online_mgr:player_login(PlayerId, Account, SvrId, self(), Ip,
%%        #{is_ready => IsReady, language => Language, is_reconnect => IsReconnect, channel => Platform,
%%            args => Args1, is_new => IsNew}) of
%%        {ok, LogicProcess} when is_pid(LogicProcess) ->
%%            player_dict:save_player_id(PlayerId),
%%            erlang:monitor(process, LogicProcess),
%%            {ok, Client#client{player_id = PlayerId,
%%                player_pid = LogicProcess, is_doing_request = true}};
%%        Other ->
%%            ?ERROR("player login error ~p~n", [Other]),
%%            {stop, Client}
%%    end.
%%
%%parse_login_args(<<>>) -> #{};
%%parse_login_args(Args) when is_binary(Args) -> jiffy:decode(Args, [return_maps]);
%%parse_login_args(_Args) -> #{}.
%%
%%can_login(#login_request{account = Account, svr_id = SvrId, time = Time, sign = Sign, bg_login_key = BgKey}, Ip) ->
%%    ?ASSERT(player_login_lib:check_account(Account, Time, Sign, BgKey), ?ERROR_ACCOUNT_ERROR),
%%    ?ASSERT(player_login_lib:is_svr_valid(SvrId), ?ERROR_LOGIN_SERVER_ERROR),
%%    %%账号是否被封禁
%%    ?ASSERT(not player_login_lib:is_freeze_account(Account), ?ERROR_KICK_TYPE_BY_FREEZE),
%%    %%ip是否被封禁
%%    ?ASSERT(not player_login_lib:is_freeze_ip(Ip), ?ERROR_KICK_TYPE_BY_FREEZE),
%%    case player_login_lib:account_exist(Account, SvrId) of
%%        false ->
%%            {false, ?LOGIN_STATUS_PLAYER_NOT_EXIST};
%%        {true, PlayerId} ->
%%            ?ASSERT(player_login_lib:can_login(PlayerId), ?ERROR_KICK_TYPE_BY_FREEZE),
%%            {true, PlayerId}
%%    end.

get_client_ip(Req) ->
    case cowboy_req:header(<<"x-real-ip">>, Req, <<>>) of
        <<>> ->
            {Ip, _Port} = cowboy_req:peer(Req),
            util:ip_to_binary(Ip);
        RealIp -> RealIp
    end.
