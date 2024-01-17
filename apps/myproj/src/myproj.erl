%%%-------------------------------------------------------------------
%% @doc myproj public API
%% @end
%%%-------------------------------------------------------------------

-module(myproj).

-include("common.hrl").
-export([start/0, stop_game_server/0, stop/0]).


start() ->
    %% inets 这个在erl参数里面加了  说明inets启动的时候会帮我们启动  asn1 public_key？
    %% ok = start_application(crypto), crypto 这个在erl参数里面加了
    %% ok = start_application(asn1),
    %%  ok = start_application(public_key),
    %% ssl 依赖上面那三个
    %% ok = start_application(ssl),     ssl 这个在erl参数里面加了
    %% ranch 依赖ssl
    start_application(ranch),
    ok = start_application(cowlib),
    %%  ok = start_application(cowboy),
    %% ok = start_application(sasl),
    start_application(?MODULE),
    ?DEBUG("game server:~p end", [start]),
    ok.


stop_game_server() ->
    Result =
        case config:is_center(myproj) of
            true ->
                ok = yg:stop_applications([sasl, myproj]),
                done;
            false ->
                catch gen_server:cast(mod_kernel, {set_load, 9999999999}),
                ok = mod_login:stop_all(),
                timer:sleep(30 * 1000),
                ok = yg:stop_applications([sasl, myproj]),
                done
        end,
    case Result of
        error ->
            stop_error;
        done ->
            ?DEBUG("game server:~p stop.", [q]),
            init:stop()
    end.

stop() ->
    ?DEBUG("game stop:~p end", [qqq]),
    ok.

start_application(App) ->
    case application:start(App) of
        ok -> ok;
        {error, Reason} ->
            ?DEBUG("application:~p start error:~p end", [App, Reason]),
            init:stop()
    end.
%% internal functions
