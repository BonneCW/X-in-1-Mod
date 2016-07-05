
instance VAM_90103_KIRA(Npc_Default)
{
	name[0] = "Kira";
	guild = GIL_NONE;
	id = 90103;
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
	daily_routine = rtn_start_90103;
};


func void rtn_start_90103()
{
	TA_Sleep (15, 0, 20, 0, "ADW_VAMPIR_06");
	TA_Stand_Eating (20, 0, 21, 30, "ADW_VALLEY_PATH_058_CAVE_09");
	TA_Sit_Bench (21, 30, 1, 0, "ADW_VAMPIR_02");
	TA_Practice_Sword (1, 0, 4, 30, "ADW_VALLEY_PATH_058_CAVE_07");
	TA_Smoke_Joint (4, 30, 7, 0, "ADW_VAMPIR_00");
	TA_Sit_Bench (7, 0, 12, 0, "ADW_VAMPIR_02");
	TA_Stand_Drinking (12, 0, 15, 0, "ADW_VALLEY_PATH_058_CAVE_09");
};

func void rtn_tot_90103()
{
	TA_Sleep (8, 0, 20, 0, "TOT");
	TA_Sleep (20, 0, 8, 0, "TOT");
};

