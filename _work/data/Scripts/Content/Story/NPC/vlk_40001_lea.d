
instance VLK_40001_LEA(Npc_Default)
{
	name[0] = "Lea";
	guild = GIL_VLK;
	id = 40001;
	voice = 17;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter (self, 3);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv (self);
	EquipItem (self, ItMw_1h_Mil_Sword);
	B_SetNpcVisual (self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ITAR_VlkBabe_H);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Babe.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 85);
	daily_routine = rtn_start_40001;
};


func void rtn_start_40001()
{
	TA_Stand_ArmsCrossed (21, 0, 4, 0, "NW_CITY_MERCHANT_SHOP01_FRONT_02_B");
	TA_Sleep (4, 0, 21, 0, "NW_CITY_HOTEL_BED_07");
};

func void rtn_latsch_40001()
{
	TA_Stand_Eating (21, 0, 22, 0, "NW_CITY_MERCHANT_PATH_28_D");
	TA_Stand_ArmsCrossed (22, 0, 23, 0, "NW_CITY_MERCHANT_PATH_31");
	TA_Stand_Drinking (23, 0, 1, 0, "NW_CITY_MERCHANT_PATH_33_B");
	TA_Stand_ArmsCrossed (1, 0, 2, 0, "NW_CITY_MERCHANT_PATH_20");
	TA_Smoke_Waterpipe (2, 0, 4, 0, "NW_CITY_RAUCH_05");
	TA_Sleep (4, 0, 21, 0, "NW_CITY_HOTEL_BED_07");
};

func void rtn_ork_40001()
{
	TA_Stand_ArmsCrossed (8, 0, 10, 0, "NW_CITY_SMFOREST_92");
	TA_Stand_ArmsCrossed (10, 0, 8, 0, "NW_CITY_SMFOREST_92");
};

