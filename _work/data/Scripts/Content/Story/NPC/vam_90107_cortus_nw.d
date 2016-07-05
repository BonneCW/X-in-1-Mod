
instance VAM_90107_CORTUS_NW(Npc_Default)
{
	name[0] = "Cortus";
	guild = GIL_DJG;
	id = 90107;
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
	Mdl_ApplyOverlayMds (self, "Humans_Mage.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 65);
	daily_routine = rtn_start_90107;
};


func void rtn_start_90107()
{
	TA_Stand_ArmsCrossed (8, 0, 10, 0, "NW_CITY_SMFOREST_92");
	TA_Stand_ArmsCrossed (10, 0, 8, 0, "NW_CITY_SMFOREST_92");
};

