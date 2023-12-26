%% Author: lzz
%% Created: 2010-11-29
%% Description: 凝神修炼相关数值
-module(data_exc).

%%
%% Include files
%%


%%
%% Exported Functions
%%
 -compile(export_all).
 -compile(nowarn_export_all).

%% API Functions
%%
%%	get_exc_cost(Type, Level)
%% 当前等级凝神修炼所耗 Type:修炼类型(coin,gold,speedup,speedup_hour)
%%
%%	get_exc_gain(Type, Gtype, Level)
%% 当前等级凝神修炼所得 Type:修炼类型(coin,gold)，Gtype：收获类型 (exp,spr) 

get_exc_cost(Type, Level) ->
	case Type of
		1 -> Type1 = gold;
		bcoin -> Type1 = coin;
		2 -> Type1 = coin;
		3 -> Type1 = speedup;
		4 -> Type1 = speedup_hour;
		_ -> Type1 = Type
	end,
	case Type1 of
		coin -> %% 当前等级凝神修炼所耗铜币（10min）
			case Level of
				26	->20200;
				27	->20700;
				28	->21100;
				29	->21500;
				30	->39900;
				31	->40800;
				32	->41700;
				33	->42500;
				34	->43400;
				35	->59100;
				36	->60400;
				37	->61700;
				38	->63000;
				39	->64200;
				40	->67700;
				41	->69200;
				42	->70700;
				43	->72100;
				44	->73600;
				45	->82000; 
				46	->84000; 
				47	->85000; 
				48	->86000; 
				49	->87000; 
				50	->91000; 
				51	->93000; 
				52	->95000; 
				53	->98000; 
				54	->100000;
				55	->122000;
				56	->125000;
				57	->128000;
				58	->131000;
				59	->134000;
				60	->131000;
				61	->135000;
				62	->138000;
				63	->141000;
				64	->144000;
				65	->164000;
				66	->168000;
				67	->172000;
				68	->176000;
				69	->181000;
				70	->200700;
				71	->200800;
				72	->200900;
				73	->205100;
				74	->209300;
				75	->243000;
				76	->248300;
				77	->253600;
				78	->258900;
				79	->264200;
				80	->264300;
				81	->264300;
				82	->266400;
				83	->267500;
				84	->272900;
				85	->308600;
				86	->315300;
				87	->322000;
				88	->328700;
				89	->335400;
				90	->320100;
				91	->327000;
				92	->334000;
				93	->341000;
				94	->347900;
				95	->384600;
				96	->393000;
				97	->401300;
				98	->409700;
				99	->418100;
				_-> 999999
			end;
		gold -> %% 当前等级凝神修炼所耗元宝（10min）100倍
			case Level of
				26	->20;
				27	->21;
				28	->21;
				29	->22;
				30	->40;
				31	->41;
				32	->42;
				33	->43;
				34	->43;
				35	->59;
				36	->60;
				37	->62;
				38	->63;
				39	->64;
				40	->68;
				41	->69;
				42	->71;
				43	->72;
				44	->74;
				45	->82; 
				46	->84; 
				47	->85; 
				48	->86; 
				49	->87; 
				50	->91; 
				51	->93; 
				52	->95; 
				53	->98; 
				54	->100;
				55	->122;
				56	->125;
				57	->128;
				58	->131;
				59	->134;
				60	->131;
				61	->135;
				62	->138;
				63	->141;
				64	->144;
				65	->164;
				66	->168;
				67	->172;
				68	->176;
				69	->181;
				70	->202;
				71	->203;
				72	->204;
				73	->205;
				74	->209;
				75	->243;
				76	->248;
				77	->254;
				78	->259;
				79	->264;
				80	->265;
				81	->265;
				82	->266;
				83	->267;
				84	->273;
				85	->309;
				86	->315;
				87	->322;
				88	->329;
				89	->335;
				90	->320;
				91	->327;
				92	->334;
				93	->341;
				94	->348;
				95	->385;
				96	->393;
				97	->401;
				98	->410;
				99	->418;
				_-> 999999
			end;			
		speedup -> %% 当前等级加速10分钟凝神修炼所耗元宝
			case Level of
				26	->4;
				27	->4;
				28	->4;
				29	->4;
				30	->5;
				31	->5;
				32	->5;
				33	->5;
				34	->6;
				35	->6;
				36	->6;
				37	->7;
				38	->7;
				39	->7;
				40	->8;
				41	->8;
				42	->8;
				43	->9;
				44	->9;
				45	->9;
				46	->10;
				47	->10;
				48	->11;
				49	->11;
				50	->12;
				51	->12;
				52	->13;
				53	->13;
				54	->14;
				55	->15;
				56	->15;
				57	->16;
				58	->16;
				59	->17;
				60	->18;
				61	->18;
				62	->19;
				63	->19;
				64	->20;
				65	->21;
				66	->21;
				67	->22;
				68	->22;
				69	->23;
				70	->24;
				71	->24;
				72	->25;
				73	->25;
				74	->26;
				75	->27;
				76	->27;
				77	->28;
				78	->28;
				79	->29;
				80	->30;
				81	->30;
				82	->31;
				83	->31;
				84	->32;
				85	->33;
				86	->33;
				87	->34;
				88	->34;
				89	->35;
				90	->36;
				91	->36;
				92	->37;
				93	->37;
				94	->38;
				95	->39;
				96	->39;
				97	->40;
				98	->40;
				99	->41;
				_-> 999999
			end;
		speedup_hour -> %% 当前等级加速60分钟凝神修炼所耗元宝
			case Level of
				26	->18;
				27	->19;
				28	->20;
				29	->21;
				30	->23;
				31	->25;
				32	->27;
				33	->29;
				34	->31;
				35	->33;
				36	->35;
				37	->37;
				38	->39;
				39	->41;
				40	->43;
				41	->45;
				42	->47;
				43	->49;
				44	->51;
				45	->53;
				46	->56;
				47	->59;
				48	->62;
				49	->65;
				50	->68;
				51	->71;
				52	->74;
				53	->77;
				54	->80;
				55	->84;
				56	->88;
				57	->92;
				58	->95;
				59	->98;
				60	->101;
				61	->104;
				62	->107;
				63	->110;
				64	->113;
				65	->116;
				66	->119;
				67	->122;
				68	->125;
				69	->128;
				70	->132;
				71	->136;
				72	->140;
				73	->144;
				74	->148;
				75	->152;
				76	->156;
				77	->160;
				78	->164;
				79	->168;
				80	->172;
				81	->176;
				82	->180;
				83	->184;
				84	->188;
				85	->192;
				86	->196;
				87	->200;
				88	->204;
				89	->208;
				90	->211;
				91	->214;
				92	->217;
				93	->220;
				94	->223;
				95	->227;
				96	->231;
				97	->235;
				98	->239;
				99	->243;
				_-> 999999
		end
	end.				



get_exc_gain(Type, Gtype, Level) ->
	case Type of
		1 -> Type1 = gold;
		2 -> Type1 = coin;
		_ -> Type1 = Type
	end,
	case Type1 of
		coin ->
			case Gtype of
				exp -> %% 当前等级凝神修炼获得经验（铜币修炼）/min
					case Level of
						26->274;  
						27->274;  
						28->317;  
						29->362;  
						30->591;  
						31->772;  
						32->775;  
						33->844;  
						34->928;  
						35->943;  
						36->961;  
						37->1030; 
						38->1051; 
						39->1097; 
						40->1109; 
						41->1143; 
						42->1180; 
						43->1199; 
						44->1212; 
						45->1711; 
						46->1755; 
						47->1782; 
						48->1788; 
						49->1795; 
						50->2812; 
						51->2967; 
						52->3101; 
						53->3222; 
						54->3319; 
						55->3766; 
						56->3885; 
						57->4264; 
						58->4453; 
						59->4621; 
						60->4728; 
						61->4786; 
						62->5157; 
						63->5172; 
						64->5367; 
						65->5780; 
						66->5965; 
						67->6162; 
						68->6353; 
						69->6529; 
						70->6555; 
						71->6779; 
						72->7460; 
						73->7930; 
						74->7951; 
						75->7958; 
						76->7961; 
						77->7968; 
						78->8348; 
						79->8486; 
						80->8850; 
						81->8962; 
						82->9019; 
						83->9178; 
						84->9203; 
						85->9320; 
						86->9407; 
						87->9444; 
						88->9550; 
						89->9658; 
						90->9750; 
						91->9826; 
						92->9830; 
						93->9888; 
						94->10008;
						95->10212;
						96->10615;
						97->10993;
						98->11334;
						99->11663;
						_-> 0
					end;
				spr -> %% 当前等级凝神修炼获得灵力（铜币修炼）/min
					case Level of
						26->110; 
						27->110; 
						28->127; 
						29->145; 
						30->236; 
						31->309; 
						32->310; 
						33->338; 
						34->371; 
						35->377; 
						36->384; 
						37->412; 
						38->420; 
						39->439; 
						40->444; 
						41->457; 
						42->472; 
						43->480; 
						44->485; 
						45->684; 
						46->702; 
						47->713; 
						48->715; 
						49->718; 
						50->1125;
						51->1187;
						52->1240;
						53->1289;
						54->1328;
						55->1506;
						56->1554;
						57->1706;
						58->1781;
						59->1848;
						60->1891;
						61->1914;
						62->2063;
						63->2069;
						64->2147;
						65->2312;
						66->2386;
						67->2465;
						68->2541;
						69->2612;
						70->2622;
						71->2712;
						72->2984;
						73->3172;
						74->3180;
						75->3183;
						76->3184;
						77->3187;
						78->3339;
						79->3394;
						80->3540;
						81->3585;
						82->3608;
						83->3671;
						84->3681;
						85->3728;
						86->3763;
						87->3778;
						88->3820;
						89->3863;
						90->3900;
						91->3930;
						92->3932;
						93->3955;
						94->4003;
						95->4085;
						96->4246;
						97->4397;
						98->4534;
						99->4665;
						_-> 0
					end
			end;
		gold ->
			case Gtype of
				exp -> %% 当前等级凝神修炼获得经验（元宝修炼）/min
					case Level of
						26->302;  
						27->302;  
						28->349;  
						29->399;  
						30->651;  
						31->850;  
						32->853;  
						33->929;  
						34->1021; 
						35->1038; 
						36->1058; 
						37->1133; 
						38->1157; 
						39->1207; 
						40->1220; 
						41->1258; 
						42->1298; 
						43->1319; 
						44->1334; 
						45->1883; 
						46->1931; 
						47->1961; 
						48->1967; 
						49->1975; 
						50->3094; 
						51->3264; 
						52->3412; 
						53->3545; 
						54->3651; 
						55->4143; 
						56->4274; 
						57->4691; 
						58->4899; 
						59->5084; 
						60->5201; 
						61->5265; 
						62->5673; 
						63->5690; 
						64->5904; 
						65->6358; 
						66->6562; 
						67->6779; 
						68->6989; 
						69->7182; 
						70->7211; 
						71->7457; 
						72->8206; 
						73->8723; 
						74->8747; 
						75->8754; 
						76->8758; 
						77->8765; 
						78->9183; 
						79->9335; 
						80->9735; 
						81->9859; 
						82->9921; 
						83->10096;
						84->10124;
						85->10252;
						86->10348;
						87->10389;
						88->10505;
						89->10624;
						90->10725;
						91->10809;
						92->10813;
						93->10877;
						94->11009;
						95->11234;
						96->11677;
						97->12093;
						98->12468;
						99->12830;
						_-> 0
					end;
				spr -> %% 当前等级凝神修炼获得灵力（元宝修炼）/min
					case Level of
						26->121; 
						27->121; 
						28->140; 
						29->160; 
						30->260; 
						31->340; 
						32->341; 
						33->372; 
						34->408; 
						35->415; 
						36->423; 
						37->453; 
						38->463; 
						39->483; 
						40->488; 
						41->503; 
						42->519; 
						43->528; 
						44->534; 
						45->753; 
						46->772; 
						47->784; 
						48->787; 
						49->790; 
						50->1238;
						51->1306;
						52->1365;
						53->1418;
						54->1460;
						55->1657;
						56->1710;
						57->1876;
						58->1960;
						59->2034;
						60->2080;
						61->2106;
						62->2269;
						63->2276;
						64->2362;
						65->2543;
						66->2625;
						67->2712;
						68->2796;
						69->2873;
						70->2884;
						71->2983;
						72->3282;
						73->3489;
						74->3499;
						75->3502;
						76->3503;
						77->3506;
						78->3673;
						79->3734;
						80->3894;
						81->3944;
						82->3968;
						83->4038;
						84->4050;
						85->4101;
						86->4139;
						87->4156;
						88->4202;
						89->4250;
						90->4290;
						91->4324;
						92->4325;
						93->4351;
						94->4404;
						95->4494;
						96->4671;
						97->4837;
						98->4987;
						99->5132;
						_-> 0
					end
			end
end.