
instance SLD_40010_BEROX(Npc_Default)
{
	name[0] = "Berox";
	guild = GIL_SLD;
	id = 40010;
	voice = 4;
	flags = 0;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter (self, 4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Sld_Bow);
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_FatBald", Face_P_Gilbert, BodyTex_N, itar_sld_M);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Militia.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 70);
	daily_routine = rtn_start_40010;
};


func void rtn_start_40010()
{
	TA_Stand_ArmsCrossed (21, 0, 2, 0, "NW_BIGFARM_KITCHEN_OUT_02");
	TA_Practice_Sword (2, 0, 4, 0, "NW_BIGFARM_PATH_05");
	TA_Stand_Eating (4, 0, 21, 0, "NW_BIGFARM_KITCHEN_09");
};

func void rtn_ork_40010()
{
	TA_Stand_ArmsCrossed (8, 0, 10, 0, "NW_CITY_SMFOREST_9000");
	TA_Stand_ArmsCrossed (10, 0, 8, 0, "NW_CITY_SMFOREST_9000");
};

