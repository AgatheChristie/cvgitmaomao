%% coding: latin-1
%%%----------------------------------------------------------------------
%%%
%%% @author: 
%%% @doc: 协议id转换(encode使用) (自动生成,请勿编辑！)
%%%
%%%----------------------------------------------------------------------
-ifndef(S2S_CONVERT_HRL).
-define(S2S_CONVERT_HRL, true).
-define(NET_HEART_S2S , 1011001). %% 心跳
-define(NET_BEFORE_S2S , 1011002). %% 登陆前期信息
-define(NET_NIU_ROLE_LOGIN_S2S , 1011003). %% 登陆
-define(NET_NIU_ROLE_ENTER_S2S , 1011004). %% 进入游戏
-define(SETTING_ALL_S2S , 1021001). %% 获取设置
-define(SETTING_SET_S2S , 1021002). %% 设置内容
-define(SETTING_SET_MORE_S2S , 1021003). %% 批量设置内容
-define(SETTING_DEL_S2S , 1021004). %% 取消设置内容
-define(SETTING_DEL_MORE_S2S , 1021005). %% 批量取消设置内容
-define(LOGIN_SELECT_S2S , 1031001). %% 选择角色
-define(LOGIN_RELOGIN_S2S , 1031002). %% 重登陆
-define(ROLE_INFO_S2S , 1041001). %% 玩家信息
-define(ROLE_RENAME_S2S , 1041006). %% 改名
-define(ROLE_CHANGE_HEAD_PORTRAIT_S2S , 1041007). %% 换头像
-define(ROLE_CHANGE_CHAT_FRAME_S2S , 1041009). %% 换气泡
-define(ROLE_SELECT_CAMP_S2S , 1041011). %% 选择势力
-define(ROLE_CAMP_DEATH_SELECT_CAMP_S2S , 1041012). %% 灭国后选择势力
-define(ROLE_CHANGE_RESUME_S2S , 1041013). %% 修改个人简介
-define(ROLE_PLAYER_DETAIL_INFO_S2S , 1041018). %% 查看详细玩家实力
-define(ROLE_ASK_ATTENDANCE_S2S , 1041020). %% 玩家请求签到
-define(ROLE_NIU_INFO_S2S , 1041022). %% 玩家信息
-define(ROLE_MIX_GUIDE_INFO_S2S , 1051002). %% 获取引导信息
-define(ROLE_MIX_COMPLETE_GUIDE_S2S , 1051003). %% 记录引导信息
-define(ROLE_MIX_COLLECT_LOG_S2S , 1051005). %% 玩家打点信息
-define(ROLE_MIX_BUY_DECREE_DEAL_S2S , 1051006). %% 购买政令操作
-define(ROLE_MIX_RESOURCE_SWAP_S2S , 1051009). %% 资源互换
-define(ROLE_MIX_DAILY_INFO_S2S , 1051010). %% 日常活跃信息
-define(ROLE_MIX_DAILY_POINT_AWARD_S2S , 1051011). %% 领取活跃点奖励
-define(ROLE_MIX_MONTH_CARD_S2S , 1051014). %% 月卡信息
-define(ROLE_MIX_MONTH_CARD_RECEIVE_S2S , 1051015). %% 月卡领奖
-define(ROLE_MIX_ADD_INFO_S2S , 1051016). %% 加成信息
-define(ROLE_MIX_SIGN_INFO_S2S , 1051020). %% 个人标记信息
-define(ROLE_MIX_SIGN_ADD_S2S , 1051021). %% 个人标记增加
-define(ROLE_MIX_SIGN_DEL_S2S , 1051022). %% 个人标记删除
-define(ROLE_MIX_ACTOR_CAPITULATE_INFO_S2S , 1051023). %% 武将劝降信息
-define(ROLE_MIX_ACTOR_CAPITULATE_S2S , 1051025). %% 武将劝降
-define(ROLE_MIX_MJ_CHALLENGE_INFO_S2S , 1051026). %% 名将挑战信息
-define(ROLE_MIX_MJ_CHALLENGE_BATTLE_S2S , 1051027). %% 名将挑战开启战役
-define(OTHER_SIMPLE_INFO_S2S , 1061001). %% 其他人信息
-define(OTHER_DETAIL_INFO_S2S , 1061002). %% 查看他人详细信息
-define(CHAT_INFO_S2S , 1071002). %% 获取聊天信息
-define(CHAT_WORLD_S2S , 1071004). %% 世界聊天信息
-define(CHAT_NIU_WORLD_S2S , 1071005). %% 世界聊天信息
-define(CHAT_CAMP_S2S , 1071007). %% 势力聊天信息
-define(CHAT_LEAGUE_S2S , 1071008). %% 联盟聊天信息
-define(CHAT_PRIVATE_S2S , 1071010). %% 私人聊天信息
-define(CHAT_PRIVATE_INFO_S2S , 1071011). %% 获取私聊未读信息
-define(CHAT_PRIVATE_READ_S2S , 1071012). %% 私聊已读信息
-define(BAG_INFO_S2S , 1081001). %% 背包信息
-define(BAG_NIU_LIST_S2S , 1081002). %% 背包信息
-define(BAG_NIU_WEAR_EQUIP_S2S , 1081003). %% 背包信息
-define(BAG_NIU_DROP_EQUIP_S2S , 1081004). %% 背包信息
-define(BAG_NIU_CLEAN_S2S , 1081005). %% 背包信息
-define(BAG_NIU_SHOP_S2S , 1081006). %% 背包信息
-define(BAG_NIU_BUY_S2S , 1081007). %% 背包信息
-define(BAG_BUY_GRID_S2S , 1081011). %% 购买格子
-define(BAG_ITEM_USE_S2S , 1081013). %% 使用物品
-define(BAG_ITEM_COMPOSE_S2S , 1081014). %% 合成物品
-define(BAG_ITEM_QIANGHUA_S2S , 1081015). %% 强化装备物品
-define(BAG_ITEM_DELIVER_S2S , 1081016). %% 道具交付
-define(BAG_ITEM_SELL_S2S , 1081017). %% 出售物品
-define(PAY_CONFIG_INFO_S2S , 1091002). %% 所有充值档次信息
-define(PAY_ORDER_S2S , 1091004). %% 充值下单
-define(PAY_ORDER_OTHER_S2S , 1091005). %% 给别人充值下单
-define(PAY_ORDER_ITEM_S2S , 1091006). %% 使用道具下单
-define(PAY_LOG_INFO_S2S , 1091007). %% 充值日志信息
-define(RANK_INFO_S2S , 1101001). %% 排行榜信息
-define(ICON_INFO_S2S , 1111001). %% 图标信息
-define(RED_DOT_INFO_S2S , 1121001). %% 红点信息
-define(MAIL_INFO_S2S , 1131001). %% 邮件信息
-define(MAIL_READ_S2S , 1131003). %% 查看邮件
-define(MAIL_AWARD_S2S , 1131005). %% 邮件领奖
-define(MAIL_DELETE_S2S , 1131007). %% 删除邮件
-define(ACTIVITY_INFO_S2S , 1141001). %% 活动信息
-define(ACTIVITY_AWARD_S2S , 1141007). %% 领取奖励
-define(SHOP_INFO_S2S , 1161001). %% 商店信息
-define(SHOP_BUY_S2S , 1161002). %% 商店购买
-define(SHOP_BUY_ALL_S2S , 1161003). %% 商店购买全部
-define(SHOP_REFRESH_S2S , 1161004). %% 手动刷新
-define(TASK_INFO_S2S , 1171001). %% 任务信息
-define(TASK_COMMIT_S2S , 1171004). %% 提交任务
-define(TASK_TOUCH_TERM_S2S , 1171007). %% 触发子项
-define(TASK_ACCEPT_S2S , 1171008). %% 接受任务
-define(TASK_CAMP_INFO_S2S , 1171009). %% 国家任务信息
-define(SCENE_CITY_INFO_S2S , 1191001). %% 所有城池精简信息
-define(SCENE_CITY_DETAIL_S2S , 1191003). %% 点击查看单个城池详细信息
-define(SCENE_CITY_DETAIL_CLOSE_S2S , 1191004). %% 退出查看单个城池详细信息
-define(SCENE_CITY_MON_RANK_S2S , 1191007). %% 查看击杀守军排行
-define(SCENE_START_ORDER_S2S , 1191009). %% 队伍下达指令
-define(SCENE_CANCEL_ORDER_S2S , 1191010). %% 队伍取消指令
-define(SCENE_TEAM_INFO_S2S , 1191014). %% 场景队伍详细信息
-define(SCENE_FIGHT_DETAIL_S2S , 1191016). %% 点击查看战况
-define(SCENE_FIGHT_DETAIL_CLOSE_S2S , 1191017). %% 退出查看战况
-define(SCENE_ADD_FIGHT_S2S , 1191018). %% 突袭
-define(SCENE_ADD_QUICK_S2S , 1191019). %% 冲锋
-define(SCENE_LOOK_FIGHT_SORT_S2S , 1191020). %% 点击查看对战详情
-define(SCENE_CLOSE_FIGHT_SORT_S2S , 1191021). %% 退出查看对战详情
-define(SCENE_WILD_MON_INFOS_S2S , 1191029). %% 沙盘野怪信息
-define(SCENE_WILD_MON_DETAIL_S2S , 1191030). %% 沙盘野怪详情
-define(SCENE_CAIWA_PLOTS_INFOS_S2S , 1191032). %% 采挖地块信息
-define(SCENE_CAIWA_EFFECT_S2S , 1191040). %% 采挖加成
-define(SCENE_SUPPLY_INFO_S2S , 1191041). %% 补给信息
-define(SCENE_SUPPLY_BEGIN_S2S , 1191042). %% 开始补给
-define(SCENE_SUPPLY_ALL_STOP_S2S , 1191043). %% 补给一键取消
-define(SCENE_SUPPLY_STOP_S2S , 1191044). %% 补给取消
-define(ACTOR_INFO_S2S , 1201001). %% 武将信息
-define(ACTOR_DETAIL_INFO_S2S , 1201006). %% 武将详细信息
-define(ACTOR_STAR_S2S , 1201008). %% 武将进阶
-define(ACTOR_RESET_POINT_S2S , 1201010). %% 武将洗点
-define(ACTOR_ATTR_ADD_POINT_S2S , 1201012). %% 武将属性点加点
-define(ACTOR_USE_EXP_ITEM_S2S , 1201016). %% 使用经验书
-define(ACTOR_SKILL_INFO_S2S , 1201018). %% 查看武将技能信息
-define(ACTOR_SKILL_ACTIVE_S2S , 1201019). %% 武将技能激活
-define(ACTOR_SKILL_LEVEL_S2S , 1201020). %% 武将普通技能升级
-define(ACTOR_RESET_SKILL_S2S , 1201022). %% 重置武将普通技能
-define(ACTOR_WEAR_SKILL_S2S , 1201023). %% 武将穿戴普通技能
-define(ACTOR_TAKE_OFF_SKILL_S2S , 1201024). %% 武将脱下普通技能
-define(ACTOR_REPLACE_SKILL_S2S , 1201025). %% 武将替换普通技能
-define(ACTOR_UNIQUE_SKILL_INFO_S2S , 1201026). %% 查看武将必杀技信息
-define(ACTOR_ACTIVATE_UNIQUE_SKILL_S2S , 1201027). %% 激活武将必杀技
-define(ACTOR_LEARN_UNIQUE_SKILL_S2S , 1201028). %% 学习武将必杀技
-define(ACTOR_LEVEL_UNIQUE_SKILL_S2S , 1201029). %% 武将必杀技升级
-define(ACTOR_RESET_UNIQUE_SKILL_S2S , 1201030). %% 重置武将必杀技
-define(ACTOR_RECOVER_UNIQUE_SKILL_S2S , 1201031). %% 复原武将必杀技
-define(ACTOR_RUB_UNIQUE_SKILL_S2S , 1201032). %% 武将必杀技拓印
-define(ACTOR_MAIN_SKILL_INFO_S2S , 1201034). %% 查看武将主将技能信息
-define(ACTOR_REPLACE_MAIN_SKILL_S2S , 1201035). %% 武将替换主将技
-define(ACTOR_MAIN_SKILL_UNLOCK_S2S , 1201036). %% 武将主将技解锁
-define(ACTOR_APPOINT_INFO_S2S , 1201038). %% 查看委任信息
-define(ACTOR_APPOINT_UP_S2S , 1201040). %% 委任武将
-define(ACTOR_APPOINT_DOWN_S2S , 1201041). %% 卸任武将
-define(ACTOR_APPOINT_REPLACE_S2S , 1201042). %% 替换武将
-define(ACTOR_DETAIL_ATTR_S2S , 1201043). %% 查看武将属性信息
-define(ACTOR_BUBING_S2S , 1201046). %% 点击补兵
-define(ACTOR_ZHUANHUA_S2S , 1201047). %% 武将转化
-define(ACTOR_CALL_INFO_S2S , 1201049). %% 点击召唤
-define(ACTOR_ACTIVATE_S2S , 1201050). %% 武将激活
-define(RESOURCE_INFO_S2S , 1211001). %% 资源信息
-define(RESOURCE_WUWEITU_INFO_S2S , 1211002). %% 资源五维图信息
-define(RESOURCE_LAND_S2S , 1211003). %% 资源地信息
-define(RESOURCE_DISTRIBUTE_FARMER_S2S , 1211004). %% 资源地分配役工
-define(ARMY_SET_STATUS_S2S , 1221001). %% 兵种设置状态
-define(ARMY_OPEN_S2S , 1221005). %% 兵种开启
-define(TEAM_INFO_S2S , 1231001). %% 队伍信息
-define(TEAM_ACTOR_UP_S2S , 1231008). %% 上阵武将
-define(TEAM_ACTOR_DOWN_S2S , 1231009). %% 下阵武将
-define(TEAM_ACTOR_REPLACE_S2S , 1231010). %% 替换武将
-define(TEAM_ACTOR_EXCHANGE_S2S , 1231011). %% 互换武将
-define(TEAM_MAJOR_SKILL_ACTOR_REPLACE_S2S , 1231015). %% 主将技武将替换
-define(FIGHT_NET_HEART_S2S , 1241001). %% 心跳
-define(FIGHT_SINGLE_FIGHT_OPERATION_S2S , 1241002). %% 单场战斗操作
-define(BUILD_INFO_S2S , 1251001). %% 城建信息
-define(BUILD_UPGRADE_S2S , 1251002). %% 城建升级
-define(BATTLE_NOT_END_INFO_S2S , 1261001). %% 未结束手操战役信息(掉线重连用)
-define(BATTLE_NOT_END_DETAIL_S2S , 1261002). %% 未结束手操战役详情(掉线重连用)
-define(BATTLE_NEW_BATTLE_S2S , 1261003). %% 开启新战役
-define(BATTLE_SINGLE_FIGHT_OPERATION_S2S , 1261005). %% 单场战斗操作
-define(BATTLE_RETREAT_S2S , 1261008). %% 撤退
-define(BATTLE_REPORT_S2S , 1261009). %% 战报列表
-define(BATTLE_REPORT_READ_S2S , 1261010). %% 查看战报
-define(BATTLE_REPORT_DETAIL_S2S , 1261011). %% 查看战报详情
-define(BATTLE_REPORT_DEAL_S2S , 1261012). %% 战报处理
-define(BATTLE_FIX_MON_INFO_S2S , 1261014). %% 固定怪物信息
-define(BUILD_MIX_ZHENGBING_INFO_S2S , 1271001). %% 查看征兵信息
-define(BUILD_MIX_ZHENGBING_ACTION_S2S , 1271002). %% 点击征兵
-define(BUILD_MIX_ZHENGBING_CANCEL_S2S , 1271003). %% 取消征兵
-define(BUILD_MIX_ZHENGBING_AUTO_S2S , 1271007). %% 自动征兵
-define(BUILD_MIX_TAXES_INFO_S2S , 1271009). %% 查看赋税信息
-define(BUILD_MIX_LEVY_S2S , 1271010). %% 强征
-define(ZHENXING_SET_STATUS_S2S , 1281001). %% 阵型设置状态
-define(ZHENXING_STUDY_S2S , 1281002). %% 阵型学习
-define(LEAGUE_INFO_S2S , 1301001). %% 联盟信息
-define(LEAGUE_OTHER_INFO_S2S , 1301002). %% 查看联盟信息
-define(LEAGUE_LIST_S2S , 1301003). %% 联盟列表信息
-define(LEAGUE_LOG_S2S , 1301004). %% 联盟日志信息
-define(LEAGUE_DONATE_S2S , 1301005). %% 捐献
-define(LEAGUE_INVITE_S2S , 1301006). %% 邀请玩家
-define(LEAGUE_APPLY_INFO_S2S , 1301007). %% 联盟申请信息
-define(LEAGUE_INVITE_INFO_S2S , 1301008). %% 联盟受邀信息
-define(LEAGUE_DEAL_INVITE_INFO_S2S , 1301009). %% 联盟受邀信息
-define(LEAGUE_CREATE_S2S , 1301012). %% 创建联盟
-define(LEAGUE_APPLY_S2S , 1301013). %% 申请入会
-define(LEAGUE_DEAL_APPLY_S2S , 1301014). %% 操作申请列表
-define(LEAGUE_QUIT_S2S , 1301015). %% 退出
-define(LEAGUE_KICK_S2S , 1301016). %% 踢人
-define(LEAGUE_APPOINT_S2S , 1301019). %% 任命操作
-define(LEAGUE_DEMISE_S2S , 1301020). %% 禅让
-define(LEAGUE_BREAK_DEMISE_S2S , 1301021). %% 中断禅让
-define(LEAGUE_DELATE_S2S , 1301022). %% 弹劾
-define(LEAGUE_JOIN_INFO_S2S , 1301024). %% 查看申请限制信息
-define(LEAGUE_APPLY_CONDITION_S2S , 1301025). %% 改变联盟申请条件
-define(LEAGUE_NOTICE_BOARD_S2S , 1301026). %% 联盟公告内容
-define(LEAGUE_LEAVE_S2S , 1301029). %% 离开联盟界面
-define(LEAGUE_CHANGE_ICON_S2S , 1301031). %% 更改联盟图标
-define(LEAGUE_JOIN_QUICK_S2S , 1301033). %% 快速加入联盟
-define(LEAGUE_MAIL_SEND_S2S , 1301035). %% 发送邮件
-define(LEAGUE_RESIGN_S2S , 1301037). %% 辞职
-define(LEAGUE_CANCEL_APPLY_S2S , 1301038). %% 取消申请入会
-define(LEAGUE_DIPLOMACY_INFO_S2S , 1301039). %% 外交信息
-define(LEAGUE_JIEJIAO_APPLY_S2S , 1301042). %% 结交申请
-define(LEAGUE_DEAL_JIEJIAO_S2S , 1301043). %% 处理结交
-define(LEAGUE_BREAK_JIEJIAO_S2S , 1301044). %% 中断结交
-define(LEAGUE_REMOVE_FRIENDSHIP_S2S , 1301045). %% 解除友盟
-define(LEAGUE_BREAK_REMOVE_FRIENDSHIP_S2S , 1301046). %% 打断解除友盟
-define(XUNMA_INFO_S2S , 1311001). %% 驯马信息
-define(XUNMA_START_S2S , 1311002). %% 驯马开始
-define(XUNMA_CANCEL_S2S , 1311004). %% 驯马取消
-define(XUNMA_REWARD_S2S , 1311005). %% 驯马奖励
-define(XUNMA_COST_S2S , 1311006). %% 驯马消耗
-define(DUANZAO_START_S2S , 1321001). %% 锻造开始
-define(DUANZAO_COST_S2S , 1321002). %% 锻造消耗
-define(EQUIP_INFO_S2S , 1331001). %% 装备信息
-define(EQUIP_WEAR_S2S , 1331003). %% 穿戴装备
-define(EQUIP_TAKE_OFF_S2S , 1331004). %% 脱下装备
-define(EQUIP_STRENGTHEN_S2S , 1331005). %% 装备强化
-define(EQUIP_REFORGE_S2S , 1331006). %% 装备重铸
-define(EQUIP_QUENCH_S2S , 1331007). %% 装备淬火
-define(PLOT_INFO_S2S , 1341001). %% 地块信息
-define(PLOT_CANCEL_ORDER_S2S , 1341002). %% 地块取消指令
-define(PLOT_DETECT_S2S , 1341004). %% 地块侦查
-define(PLOT_ABANDON_S2S , 1341006). %% 地块放弃
-define(PLOT_BUILD_S2S , 1341008). %% 地块建造
-define(PLOT_BUILD_REMOVE_S2S , 1341010). %% 地块建筑拆除
-define(PLOT_BUILD_UPGRADE_S2S , 1341012). %% 地块建筑升级
-define(PLOT_RESTORE_INFO_S2S , 1341018). %% 守军恢复信息
-define(PLOT_MOVE_S2S , 1341019). %% 地块迁移
-define(PLOT_BUILD_NOW_COMPLETE_S2S , 1341021). %% 地块建造秒升
-define(PLOT_BUILD_UPGRADE_NOW_COMPLETE_S2S , 1341022). %% 地块建筑升级秒升
-define(SEARCH_INFO_S2S , 1351001). %% 寻访次数信息
-define(SEARCH_GOODS_S2S , 1351002). %% 寻访卡包
-define(TRAINING_INFO_S2S , 1361001). %% 练兵信息
-define(TRAINING_START_INFO_S2S , 1361002). %% 开始练兵
-define(TRAINING_QUIT_INFO_S2S , 1361003). %% 中止练兵
-define(TRAINING_LEAVE_INFO_S2S , 1361005). %% 下阵练兵信息
-define(FRIEND_INFO_S2S , 1371001). %% 好友信息
-define(FRIEND_NIU_INFO_S2S , 1371002). %% 好友信息
-define(FRIEND_NIU_APPLY_S2S , 1371003). %% 申请好友
-define(FRIEND_NIU_HUIY_S2S , 1371004). %% 申请好友
-define(FRIEND_NIU_ABANDON_S2S , 1371005). %% 删除好友
-define(FRIEND_ABANDON_S2S , 1371006). %% 删除好友
-define(FRIEND_SEARCH_S2S , 1371008). %% 好友信息查找
-define(FRIEND_AGREE_APPLY_S2S , 1371009). %% 同意好友申请
-define(FRIEND_REJECT_APPLY_S2S , 1371010). %% 拒绝好友申请
-define(FRIEND_BLACK_S2S , 1371011). %% 拉黑好友
-define(FRIEND_APPLY_S2S , 1371012). %% 申请好友
-define(ACHIEVE_INFO_S2S , 1381001). %% 成就信息
-define(ACHIEVE_COMMIT_S2S , 1381002). %% 提交成就
-define(ACHIEVE_POINT_AWARD_S2S , 1381003). %% 领取成就点奖励
-define(TREND_INFO_S2S , 1391001). %% 大势信息
-define(TREND_TERM_INFO_S2S , 1391003). %% 大势子项信息
-define(TREND_TERM_AWARD_S2S , 1391004). %% 大势子项领奖
-define(TREND_ALL_TERM_INFO_S2S , 1391005). %% 获取所有大势子项信息
-define(FB_INFO_S2S , 1401001). %% 关卡信息
-define(FB_MON_INFO_S2S , 1401002). %% 关卡怪物部队信息
-define(FB_START_S2S , 1401003). %% 关卡开始挑战
-define(FB_TEAM_INFO_S2S , 1401006). %% 队伍信息
-define(FB_TEAM_ACTOR_UP_S2S , 1401010). %% 上阵武将
-define(FB_TEAM_ACTOR_DOWN_S2S , 1401011). %% 下阵武将
-define(FB_TEAM_ACTOR_EXCHANGE_S2S , 1401012). %% 互换武将
-define(CAMP_OVERVIEW_INFO_S2S , 1411001). %% 查看国家总览界面
-define(CAMP_MEMBER_INFO_S2S , 1411002). %% 国家成员列表
-define(CAMP_KING_ELECTION_INFO_S2S , 1411003). %% 国主竞逐信息
-define(CAMP_LEADER_BORN_SEC_S2S , 1411004). %% 开服产生国主倒计时
-define(CAMP_POST_INFO_S2S , 1411005). %% 国家官员信息
-define(CAMP_OPERATE_LISTS_S2S , 1411006). %% 国家禅让任命列表
-define(CAMP_CLOSE_INFO_S2S , 1411007). %% 关闭国家信息界面
-define(CAMP_OPEN_INFO_S2S , 1411008). %% 打开国家信息界面
-define(CAMP_TODAY_RANK_INFO_S2S , 1411009). %% 查看国家今日排行界面
-define(CAMP_APPOINT_S2S , 1411010). %% 任命操作
-define(CAMP_REMOVE_S2S , 1411011). %% 罢免操作
-define(CAMP_MODIFY_NOTICE_S2S , 1411012). %% 修改公告
-define(CAMP_RESIGN_S2S , 1411013). %% 辞职操作
-define(CAMP_RELEASE_TOKEN_S2S , 1411014). %% 发布法令
-define(CAMP_UNSPEAK_S2S , 1411015). %% 禁言操作
-define(CAMP_CANCEL_UNSPEAK_S2S , 1411016). %% 解禁言操作
-define(CAMP_IMPEACH_S2S , 1411017). %% 弹劾操作
-define(CAMP_DEMISE_S2S , 1411018). %% 国家君主禅让
-define(CAMP_QUIT_DEMISE_S2S , 1411019). %% 取消禅让
-define(CAMP_POST_APPLY_INFO_S2S , 1411020). %% 官员申请信息
-define(CAMP_POST_APPLY_S2S , 1411023). %% 申请官员
-define(CAMP_DEAL_POST_APPLY_S2S , 1411024). %% 操作申请列表
-define(CAMP_POST_ALL_REFUSE_S2S , 1411025). %% 国家官职全部拒绝
-define(CAMP_CAPACITY_INFO_S2S , 1411032). %% 国家国库信息
-define(CAMP_DONATE_S2S , 1411033). %% 捐献
-define(CAMP_LOG_S2S , 1411034). %% 国家日志信息
-define(CAMP_WELFARE_INFO_S2S , 1411037). %% 国家福利信息
-define(CAMP_WELFARE_BOX_AWARD_S2S , 1411042). %% 宝箱领奖
-define(CAMP_WELFARE_TREASURE_AWARD_S2S , 1411046). %% 宝藏领奖
-define(CAMP_SCIENCE_INFO_S2S , 1411048). %% 国家科技信息
-define(CAMP_SCIENCE_SUPPORT_S2S , 1411049). %% 国家科技支援
-define(CAMP_SCIENCE_STUDY_S2S , 1411050). %% 国家科技研究
-define(CAMP_SCIENCE_RECOMMEND_S2S , 1411054). %% 设置推荐科技id
-define(CAMP_SCIENCE_TOKEN_INFO_S2S , 1411055). %% 国家法令信息
-define(CAMP_SCIENCE_TOKEN_ACTIVE_S2S , 1411057). %% 国家法令激活
-define(CAMP_ALL_CAMP_STATUS_S2S , 1411061). %% 所有国家状态
-define(CAMP_SIGN_INFO_S2S , 1411064). %% 国家标记信息
-define(CAMP_SIGN_ADD_S2S , 1411065). %% 增加国家标记
-define(CAMP_SIGN_DEL_S2S , 1411066). %% 删除国家标记
-define(CAMP_BUILDUP_INFO_S2S , 1411069). %% 集结信息
-define(CAMP_ATTACK_BUILDUP_S2S , 1411070). %% 攻城集结
-define(CAMP_ATTACK_BUILDUP_ABORT_S2S , 1411071). %% 攻城集结终止
-define(CAMP_FALING_INFO_S2S , 1411073). %% 国家法令信息
-define(CAMP_FALING_SEND_S2S , 1411074). %% 发送国家法令
-define(CAMP_FALING_DELETE_S2S , 1411076). %% 删除国家法令
-define(CAMP_FAR_ARMY_INFO_S2S , 1411077). %% 远征军信息
-define(VOTE_INFO_S2S , 1421001). %% 投票信息
-define(VOTE_START_S2S , 1421002). %% 发起投票
-define(VOTE_SELECT_S2S , 1421003). %% 投票
-define(GOVERN_INFO_S2S , 1431001). %% 治理信息
-define(GOVERN_CLOSE_INFO_S2S , 1431002). %% 关闭治理信息界面
-define(GOVERN_OPEN_INFO_S2S , 1431003). %% 打开治理信息界面
-define(GOVERN_POLICY_TOKEN_S2S , 1431005). %% 使用城池令
-define(PUBLIC_ARMY_S2S , 1441001). %% 公共兵种信息
-define(PUBLIC_ARMY_UPGRADE_S2S , 1441002). %% 公共兵种升级
-define(ACTIVITY_LIMIT_INFO_S2S , 1451001). %% 个人限时活动信息
-define(ACTIVITY_LIMIT_BUY_S2S , 1451002). %% 购买活动礼包
-define(ACTIVITY_LIMIT_RECEIVE_S2S , 1451006). %% 领取活动礼包
-define(LOTTERY_INFO_S2S , 1461001). %% 卡包信息
-define(LOTTERY_ACT_S2S , 1461002). %% 寻访
-define(LOTTERY_STAGE_AWARD_S2S , 1461004). %% 领取阶段奖励
-define(CAMP_ACTIVITY_INFO_S2S , 1471001). %% 国家活动信息
-define(CAMP_ACTIVITY_MIX_RANK_INFO_S2S , 1471003). %% 灭国排行榜信息
-define(CAMP_ACTIVITY_XLFJ_INFO_S2S , 1471004). %% 寻龙分金信息
-define(CAMP_ACTIVITY_XLFJ_DISCLOSE_S2S , 1471007). %% 寻龙分金揭开
-define(CAMP_ACTIVITY_XLFJ_GET_TIPS_S2S , 1471008). %% 寻龙分金获取提示
-define(CAMP_WGFK_CLOSE_S2S , 1481001). %% 关闭国家亡国富库面板
-define(CAMP_WGFK_OPEN_S2S , 1481002). %% 打开国家亡国富库面板
-define(CAMP_WGFK_INFO_S2S , 1481003). %% 亡国富库信息
-define(CAMP_WGFK_ACT_ROB_S2S , 1481008). %% 亡国富库开始抢宝
-define(PRIVILEGE_INFO_S2S , 1491001). %% 特权信息
-define(DECLARE_INFO_S2S , 1501001). %% 宣战信息
-define(DECLARE_SELECT_S2S , 1501004). %% 选择城池
-define(DECLARE_KILL_RANK_S2S , 1501005). %% 宣战杀敌榜
-define(CRUSADE_INFO_S2S , 1511001). %% 群雄讨董信息
-define(CRUSADE_KILL_RANK_S2S , 1511003). %% 群雄讨董杀敌榜
-define(SINGLE_EVENT_INFO_S2S , 1521001). %% 单人事件信息
-define(SINGLE_EVENT_OPEN_S2S , 1521005). %% 单人事件打开
-define(SINGLE_EVENT_EXIT_S2S , 1521006). %% 单人事件退出
-define(SINGLE_EVENT_START_S2S , 1521007). %% 单人事件开始
-define(SINGLE_EVENT_CANCEL_S2S , 1521008). %% 单人事件中止
-define(TAVERN_INFO_S2S , 1531001). %% 酒馆比武信息
-define(TAVERN_START_S2S , 1531002). %% 酒馆比武开始挑战
-define(GAME_WIN_INFO_S2S , 1541001). %% 游戏结算发奖信息
-define(NZBZ_ROLE_RANK_S2S , 1551001). %% 南征北战个人排行榜
-define(NZBZ_CAMP_RANK_S2S , 1551002). %% 南征北战国家排行榜
-define(SINGLE_GAME_INFO_S2S , 1561001). %% 小游戏信息
-define(SINGLE_GAME_RESULT_S2S , 1561002). %% 小游戏结果
-define(GUILD_INFO_S2S , 1571001). %% 工会信息
-define(GUILD_LIST_INFO_S2S , 1571002). %% 工会列表信息
-define(GUILD_MEM_LIST_S2S , 1571003). %% 工会成员列表信息
-define(GUILD_APPLY_S2S , 1571004). %% 工会申请加入
-define(GUILD_INVITE_S2S , 1571005). %% 工会邀请加入
-define(GUILD_INVITE_HUIY_S2S , 1571006). %% 工会邀请加入
-define(GUILD_APPLY_LIST_S2S , 1571007). %% 工会申请列表
-define(GUILD_CREATE_S2S , 1571008). %% 工会创建
-define(GUILD_APPLY_APPROVE_S2S , 1571009). %% 工会审批
-define(GUILD_KICKOUT_S2S , 1571013). %% 工会踢出
-define(GUILD_QUIT_S2S , 1571014). %% 工会退出
-define(GUILD_ANNOUNCE_S2S , 1571015). %% 工会宣言
-endif. %% S2S_CONVERT_HRL