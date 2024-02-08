%% Author: lzz
%% Created: 2010-11-29
%% Description: 敏感词处理
-module(lib_words_ver).

%%
%% Include files
%%
-include("common.hrl").
-include("record.hrl").


-export([
    words_ver/1
    , words_filter/1
    , words_ver_name/1
    , check_chat_content/1
    , check_chat_content_len/2
    , check_chat_content_len3/2
    , words_ver_i/2
    , check/1
]).

%%
%% API Functions
%%
%% -----------------------------------------------------------------
%% 敏感词处理
%% -----------------------------------------------------------------
words_filter(Words_for_filter) -> Words_for_filter.
%%words_filter(Words_for_filter) ->
%%	Words_List = data_words:get_words_verlist(),
%%	binary:bin_to_list(lists:foldl(fun(Kword, Words_for_filter0)->
%%										   re:replace(Words_for_filter0,Kword,"*",[global,caseless,{return, binary}])
%%								   end,
%%								   Words_for_filter,Words_List)).

words_ver(_Words_for_ver) -> true.
%%words_ver(Words_for_ver) ->
%%	Words_List = data_words:get_words_verlist(),
%%	words_ver_i(Words_List , Words_for_ver).

words_ver_i([], _Words_for_ver) ->
    true;
words_ver_i([W | L], Words_for_ver) ->
    case re:run(Words_for_ver, W, [caseless]) of
        nomatch -> words_ver_i(L, Words_for_ver);
        _ -> false
    end.

words_ver_name(Words_for_ver) ->
    Words_List = data_words:get_words_verlist_name(),
    words_ver_i_name(Words_List, Words_for_ver).

words_ver_i_name([], _Words_for_ver) ->
    true;
words_ver_i_name([W | L], Words_for_ver) ->
    case re:run(Words_for_ver, W, [caseless]) of
        nomatch -> words_ver_i_name(L, Words_for_ver);
        _ -> false
    end.


check(Str) ->
    case is_valid_utf8(Str) of
        true ->
%%			do_check(Str, ets_keyword_index, <<>>) =:= true;
            true;
        false ->
            false
    end.

is_valid_utf8(String) when is_list(String) ->
    Bin = list_to_binary(String),
    is_valid_utf8(Bin);

is_valid_utf8(Bin) when is_binary(Bin) ->
    case unicode:characters_to_binary(Bin, utf8) of
        {error, _, _} ->
            false;
        {incomplete, _, _} ->
            false;
        _NewString ->
            check_utf8_byte_size_valid(Bin)
    end.

%% @doc 判断 utf8 字符里面有没有字符的长度是 大于 4个字节的
check_utf8_byte_size_valid(<<>>) -> true;
check_utf8_byte_size_valid(<<H:8, Rest/binary>>) when H =< 127 ->
    check_utf8_byte_size_valid(Rest);
check_utf8_byte_size_valid(<<H:8, _B:1/binary, Rest/binary>>) when H >= 192, H =< 223 ->
    check_utf8_byte_size_valid(Rest);   %% 2位
check_utf8_byte_size_valid(<<H:8, _B:2/binary, Rest/binary>>) when H >= 224, H =< 239 ->
    check_utf8_byte_size_valid(Rest);   %% 3位
check_utf8_byte_size_valid(_Bin) -> false.


%% 检查聊天内容长度
check_chat_content_len(PChatParts, Result) ->
    check_chat_content_len2(PChatParts, false, Result).

check_chat_content_len2([], IsCheck, Result) ->
    check_chat_content_len3(IsCheck, Result);
check_chat_content_len2([PChatPart | TPChatParts], IsCheck, Result) ->
    #p_chat_part{
        type = Type,
        content = Content
    } = PChatPart,
    case Type =:= 0 of
        true ->
            NewResult = Content ++ Result,
            check_chat_content_len2(TPChatParts, true, NewResult);
        _ ->
            check_chat_content_len2(TPChatParts, IsCheck, Result)
    end.

check_chat_content(Content) ->
    check_chat_content_len3(false, Content).

%% 分类处理
%% 有文字的
check_chat_content_len3(true, Content) ->
    check_chat_content_len4(Content, 1, 50);
%% 没有文字的
check_chat_content_len3(false, Content) ->
    check_chat_content_len4(Content, 0, 50).

check_chat_content_len4(Content, MinNum, MaxNum) ->
    ?ASSERT(util:is_text_valid(Content, MinNum, MaxNum), ?T("聊天内容长度不合法")).
