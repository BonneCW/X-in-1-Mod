
instance NONE_99001_FREMDER(Npc_Default)
{
	name[0] = "Fremder";
	guild = GIL_NONE;
	id = 99001;
	voice = 19;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	bodyStateInterruptableOverride = TRUE;
	B_SetAttributesToChapter (self, 3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem (self, ItMw_1h_Vlk_Dagger);
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, itar_vampir2);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Mage.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 80);
	daily_routine = rtn_start_99001;
};


func void rtn_start_99001()
{
	TA_Stand_Dementor (8, 0, 23, 0, "NW_XARDAS_TOWER_02");
	TA_Stand_Dementor (23, 0, 8, 0, "NW_XARDAS_TOWER_02");
};

func void rtn_gammel_99001()
{
	TA_Stand_Dementor (8, 0, 23, 0, "GAMMELPLATZNW11");
	TA_Stand_Dementor (23, 0, 8, 0, "GAMMELPLATZNW11");
};

