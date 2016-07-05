
instance VAM_90109_KIRA_NW(Npc_Default)
{
	name[0] = "Kira";
	guild = GIL_DJG;
	id = 90109;
	voice = 17;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	B_SetAttributesToChapter (self, 5);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_Zweihaender3);
	B_SetNpcVisual (self, FEMALE, "Hum_Head_Babe", FaceBabe_N_GreyCloth, BodyTexBabe_N, ITAR_Raven_Addon);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Babe.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 85);
	daily_routine = rtn_start_90109;
};


func void rtn_start_90109()
{
	TA_Stand_ArmsCrossed (17, 0, 5, 0, "NW_CITY_SMFOREST_9000");
	TA_Stand_ArmsCrossed (5, 0, 17, 0, "NW_CITY_SMFOREST_9000");
};

