%%%-------------------------------------------------------------------
%% @doc myproj public API
%% @end
%%%-------------------------------------------------------------------

-module(myproj_app).

-behaviour(application).

-export([start/2, start_websocket/0, start_supervisor/1, start_mod/1,stop/1]).
-include("common.hrl").


start(_StartType, _StartArgs) ->
    case yg_server_sup:start_link() of
        {ok, SupPid} ->
            case false of
                true ->
                    1;
                false ->
                    start_game_server()
            end,

            {ok, SupPid};
        Err ->
            ?DEBUG("Err:~p end",[Err]),
            Err
    end.

start_game_server() ->
    awdawf(),
    start_mod(reloader),
    %% start_websocket(),


    ok.

start_websocket() ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", player_network, []}
        ]}
    ]),
    Port = config:get_websocket_port(myproj),
    {ok, _} = cowboy:start_clear(websocket, [{port, Port}, {nodelay, false}], #{
        env => #{dispatch => Dispatch}
    }),
    ?DEBUG("server listen on ~p,~n",[Port]),
    ok.

start_mod(ModName) ->
    start_mod(ModName, worker).

start_supervisor(SupervisorName) ->
    start_mod(SupervisorName, supervisor).

start_mod(ModName, Type) ->
    case supervisor:start_child(yg_server_sup,
        {ModName, {ModName, start_link, []},
            permanent, 5000, Type, [ModName]}) of
        {error, Error} ->
            ?ERROR("start ~p error, ~p,~n", [ModName, Error]);
        _ ->
            ok
    end.


awdawf() ->
    ping_gateway(),
    Tabs = [?ETS_SYSTEM_INFO, ?ETS_MONITOR_PID, ?ETS_STAT_SOCKET, ?ETS_STAT_DB],
    init_ets(Tabs),
    [Port, Node_id, _Acceptor_num, _Max_connections] = config:get_tcp_listener(myproj),
    [Ip] = config:get_tcp_listener_ip(myproj),
    yg_timer:start(yg_server_sup),
    yg_server:start([Ip, tool:to_integer(Port), tool:to_integer(Node_id)]),
    ok.

stop(_State) ->
    void.

ping_gateway() ->
    case config:get_gateway_node(myproj) of
        undefined -> no_action;
        Gateway_node ->
            catch net_adm:ping(Gateway_node)
    end.

init_ets([]) ->
    ok;
init_ets([Tab | L]) ->
    ets:new(Tab, [set, public, named_table, ?ETSRC, ?ETSWC]),
    init_ets(L).


%%start(_StartType, _StartArgs) ->
%%    case myproj_sup:start_link() of
%%        {ok, Pid} ->
%%            server_start(),
%%            {ok, Pid};
%%        Err ->
%%            Err
%%    end.
%%
%%
%%stop(_State) ->
%%    ok.

%% internal functions
