
instance VLK_419_Buerger(Npc_Default)
{
	name[0] = "Ardoc Kahr";
	guild = GIL_PUBLIC;
	id = 419;
	voice = 14;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter (self, 6);
	attribute[ATR_MANA_MAX] = 6666665;
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv (self);
	CreateInvItems (self, itru_transwarg, 1);
	B_SetNpcVisual (self, MALE, "Hum_Head_Bald", Face_N_Tough_Okyl, BodyTex_N, ITAR_Governor);
	Mdl_SetModelFatness (self, 2);
	Mdl_ApplyOverlayMds (self, "Humans_Arrogance.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 80);
	daily_routine = Rtn_Start_419;
};


func void Rtn_Start_419()
{
	TA_Read_Bookstand (21, 0, 22, 30, "NW_CITY_UPTOWN_HUT_03_03");
	TA_Sit_Throne (22, 30, 4, 0, "NW_CITY_UPTOWN_HUT_03_SIT");
	TA_Sleep (4, 0, 21, 0, "NW_CITY_UPTOWN_HUT_03_BED");
};

func void rtn_ork_419()
{
	TA_Stand_ArmsCrossed (8, 0, 10, 0, "NW_CITY_SMFOREST_9100");
	TA_Stand_ArmsCrossed (10, 0, 8, 0, "NW_CITY_SMFOREST_9100");
};

