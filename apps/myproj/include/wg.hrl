%% coding: latin-1
%%%----------------------------------------------------------------------
%%%
%%% @copyright wg
%%%
%%% @author songze.me@gmail.com
%%% wg header file used by user
%%%
%%%----------------------------------------------------------------------
-ifndef(WG_HRL).
-define(WG_HRL, true).

-define(ERROR(F),io:format("%% [~w~w:~w] "++F++"~n",[self(),?MODULE,?LINE])).
-define(ERROR(F,A),io:format("%% [~w~w:~w] "++F++"~n",[self(),?MODULE,?LINE|A])).

-endif. % WG_HRL
