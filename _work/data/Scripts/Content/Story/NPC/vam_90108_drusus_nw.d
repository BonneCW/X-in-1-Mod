
instance VAM_90108_DRUSUS_NW(Npc_Default)
{
	name[0] = "Drusus";
	guild = GIL_DJG;
	id = 90108;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	B_SetAttributesToChapter (self, 6);
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv (self);
	CreateInvItems (self, itru_sumwarg, 1);
	B_SetNpcVisual (self, MALE, "Hum_Head_Psionic", Face_N_Tough_Okyl, BodyTex_N, ITAR_Xardas);
	Mdl_SetModelFatness (self, 1);
	Mdl_ApplyOverlayMds (self, "Humans_Mage.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 85);
	daily_routine = rtn_start_90108;
};


func void rtn_start_90108()
{
	TA_Stand_ArmsCrossed (17, 0, 5, 0, "NW_CITY_SMFOREST_9100");
	TA_Stand_ArmsCrossed (5, 0, 17, 0, "NW_CITY_SMFOREST_9100");
};

