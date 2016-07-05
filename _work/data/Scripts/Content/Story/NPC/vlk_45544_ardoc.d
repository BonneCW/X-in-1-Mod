
instance VLK_45544_ARDOC(Npc_Default)
{
	name[0] = "Ardoc Sorn";
	guild = GIL_VLK;
	id = 45544;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	B_SetAttributesToChapter (self, 1);
	fight_tactic = FAI_HUMAN_COWARD;
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_Bald", Face_P_Weak_Ulf_Wohlers, BodyTex_P, ITAR_Governor);
	Mdl_SetModelFatness (self, 2);
	Mdl_ApplyOverlayMds (self, "Humans_Arrogance.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 60);
	daily_routine = rtn_start_45544;
};


func void rtn_start_45544()
{
	TA_Read_Bookstand (8, 0, 23, 0, "NW_CITY_CORNELIUS");
	TA_Read_Bookstand (23, 0, 8, 0, "NW_CITY_CORNELIUS");
};

func void rtn_flee_45544()
{
	TA_FleeToWp (8, 0, 23, 0, "NW_XARDAS_BANDITS_LEFT");
	TA_FleeToWp (23, 0, 8, 0, "NW_XARDAS_BANDITS_LEFT");
};

func void rtn_prison_45544()
{
	TA_Stand_Guarding (8, 0, 23, 0, "NW_CITY_HABOUR_KASERN_PRISON_BORKA");
	TA_Stand_Guarding (23, 0, 8, 0, "NW_CITY_HABOUR_KASERN_PRISON_BORKA");
};

