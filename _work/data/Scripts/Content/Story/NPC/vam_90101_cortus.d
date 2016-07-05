
instance VAM_90101_CORTUS(Npc_Default)
{
	name[0] = "Cortus";
	guild = GIL_NONE;
	id = 90101;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	B_SetAttributesToChapter (self, 4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem (self, ItMw_1h_Sld_Sword);
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_Thief", Face_P_Tough_Torrez, BodyTex_P, ITAR_Raven_Addon);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Arrogance.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 65);
	daily_routine = rtn_start_90101;
};


func void rtn_start_90101()
{
	TA_Stand_ArmsCrossed (8, 0, 10, 0, "ADW_PORTALTEMPEL_07");
	TA_Stand_ArmsCrossed (10, 0, 8, 0, "ADW_PORTALTEMPEL_07");
};

func void rtn_gammel_90101()
{
	TA_Read_Bookstand (8, 0, 10, 0, "ADW_PORTALTEMPEL_03C");
	TA_Read_Bookstand (10, 0, 8, 0, "ADW_PORTALTEMPEL_03C");
};

func void rtn_lager_90101()
{
	TA_Stand_ArmsCrossed (21, 0, 2, 0, "BL_INN_04");
	TA_Stand_ArmsCrossed (2, 0, 21, 0, "ADW_PORTALTEMPEL_07");
};

func void rtn_lager_2_90101()
{
	TA_Stand_ArmsCrossed (21, 0, 2, 0, "BL_INN_04");
	TA_Stand_ArmsCrossed (2, 0, 21, 0, "BL_INN_CORNER_02");
};

func void rtn_tot_90101()
{
	TA_Sleep (8, 0, 20, 0, "TOT");
	TA_Sleep (20, 0, 8, 0, "TOT");
};

