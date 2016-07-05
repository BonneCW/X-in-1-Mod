
instance OW_SPAEHER(Npc_Default)

{

	name[0] = "Späher";

	guild = GIL_MIL;

	id = 99900;

	voice = 1;

	flags = 0;

	npcType = NPCTYPE_OCAMBIENT;

	attribute[ATR_STRENGTH] = 10;

	attribute[ATR_DEXTERITY] = 10;

	attribute[ATR_MANA_MAX] = 0;

	attribute[ATR_MANA] = 0;

	attribute[ATR_HITPOINTS_MAX] = 1;

	attribute[ATR_HITPOINTS] = 1;

	fight_tactic = FAI_HUMAN_COWARD;

	CreateInvItems (self, ItMi_OldCoin, 1);

	B_SetNpcVisual (self, MALE, "Hum_Head_Bald", Face_B_Normal01, BodyTex_B, ItAr_BDT_M);

	Mdl_SetModelFatness (self, 2);

	Mdl_ApplyOverlayMds (self, "Humans_Militia.mds");

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 30);

	daily_routine = rtn_start_99900;

};




func void rtn_start_99900()

{

	TA_Stand_Guarding (8, 0, 22, 0, "SPAWN_OW_BLOODFLY_C3");

	TA_Stand_Guarding (22, 0, 8, 0, "SPAWN_OW_BLOODFLY_C3");
};

