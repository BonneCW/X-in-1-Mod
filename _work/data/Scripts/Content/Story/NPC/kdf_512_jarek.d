
instance KDF_512_JAREK(Npc_Default)
{
	name[0] = "Jarek";
	guild = GIL_KDF;
	id = 512;
	voice = 10;
	flags = 0;
	npcType = npctype_main;
	B_SetAttributesToChapter (self, 6);
	fight_tactic = FAI_HUMAN_STRONG;
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_Thief", Face_L_NormalBart02, BodyTex_N, ItAr_KDF_L);
	Mdl_SetModelFatness (self, -2);
	Mdl_ApplyOverlayMds (self, "Humans_Mage.mds");
	Mdl_SetModelScale (self, 1, 0.95, 1);
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 30);
	daily_routine = rtn_start_512;
};


func void rtn_start_512()
{
	TA_Read_Bookstand (8, 0, 23, 0, "NW_MONASTERY_RUNEMAKER_05");
	TA_Read_Bookstand (8, 0, 23, 0, "NW_MONASTERY_RUNEMAKER_05");
};

