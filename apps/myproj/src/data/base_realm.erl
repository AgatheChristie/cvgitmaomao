
%%===================================================
%%作    者：泰奇  http://www.baidu.com  QQ：544682223
%%创建时间：2024-01-24 17:51:20
%%备    注：此代码为工具生成 请勿手工修改
%%===================================================

-module(base_realm).
-include("common.hrl").

-export([get/1]).

get(1) -> #{
   id => 1,
   name => <<("女娲")/utf8>> 
};
get(2) -> #{
   id => 2,
   name => <<("神农")/utf8>> 
};
get(3) -> #{
   id => 3,
   name => <<("伏羲")/utf8>> 
};
get(100) -> #{
   id => 100,
   name => <<("新手")/utf8>> 
};
get(_Id) ->
    ?ERROR("get base_realm error ~p~n", [_Id]), 
    undefined.
