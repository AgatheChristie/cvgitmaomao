
%%===================================================
%%作    者：泰奇  http://www.baidu.com  QQ：544682223
%%创建时间：2024-01-24 17:53:01
%%备    注：此代码为工具生成 请勿手工修改
%%===================================================

-module(base_guild).
-include("common.hrl").

-export([get/1]).

get(1) -> #{
   id => 1,
   create_coin => 80000,
   create_guild_card => [28300,1],
   default_position => 12,
   donate_money_ratio => 100,
   donate_contribution_card_ratio => 10,
   guild_skill_storage_base => 0.25,
   guild_skill_exp_base => 0.02,
   guild_member_base => 50,
   guild_level_limit => 10,
   guild_warehouse_base => 25 
};
get(_Id) ->
    ?ERROR("get base_guild error ~p~n", [_Id]), 
    undefined.
