
instance BAU_105_MAGIT(Npc_Default)
{
	name[0] = "Magit";
	guild = GIL_BAU;
	id = 105;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter (self, 1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem (self, ItMw_1h_Sld_Sword);
	B_SetNpcVisual (self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_MidBauBlonde, BodyTexBabe_N, ITAR_VlkBabe_L);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Babe.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 10);
	daily_routine = rtn_start_105;
};


func void rtn_start_105()
{
	TA_Stand_ArmsCrossed (6, 0, 23, 0, "NW_CITY_MAINSTREET_01");
	TA_Stand_ArmsCrossed (23, 0, 6, 0, "NW_CITY_MAINSTREET_01");
};

