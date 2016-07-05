
instance VAM_90102_DRUSUS(Npc_Default)
{
	name[0] = "Drusus";
	guild = GIL_NONE;
	id = 90102;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	B_SetAttributesToChapter (self, 6);
	attribute[ATR_MANA_MAX] = 666666;
	fight_tactic = FAI_HUMAN_MASTER;
	B_CreateAmbientInv (self);
	CreateInvItems (self, itru_sumwarg, 1);
	B_SetNpcVisual (self, MALE, "Hum_Head_Psionic", Face_N_Tough_Okyl, BodyTex_N, ITAR_Xardas);
	Mdl_SetModelFatness (self, 1);
	Mdl_ApplyOverlayMds (self, "Humans_Mage.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 85);
	daily_routine = rtn_start_90102;
};


func void rtn_start_90102()
{
	TA_Potion_Alchemy (17, 0, 20, 0, "ADW_VALLEY_PATH_058_CAVE_13");
	TA_Practice_Magic (20, 0, 23, 0, "ADW_VALLEY_PATH_058_CAVE_13");
	TA_Pray_Innos_FP (23, 0, 1, 0, "ADW_VAMPIR_04");
	TA_Sit_Bench (1, 0, 4, 0, "ADW_VAMPIR_01");
	TA_Sleep (4, 0, 15, 0, "ADW_VAMPIR_06");
	TA_Stand_Drinking (15, 0, 17, 0, "ADW_VALLEY_PATH_058_CAVE_222");
};

func void rtn_eremit_90102()
{
	TA_Smalltalk (12, 35, 17, 0, "ADW_VAMPIR_06");
	TA_Potion_Alchemy (17, 0, 20, 0, "ADW_VALLEY_PATH_058_CAVE_13");
	TA_Pray_Innos_FP (20, 0, 1, 0, "ADW_VAMPIR_04");
	TA_Stand_Drinking (1, 0, 4, 0, "ADW_VALLEY_PATH_058_CAVE_222");
	TA_Sleep (4, 0, 12, 35, "ADW_VAMPIR_06");
};

func void rtn_tot_90102()
{
	TA_Sleep (8, 0, 20, 0, "TOT");
	TA_Sleep (20, 0, 8, 0, "TOT");
};

