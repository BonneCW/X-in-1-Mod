
instance ANTROX(Npc_Default)
{
	name[0] = "Antrox";
	npcType = NPCTYPE_FRIEND;
	guild = GIL_FRIENDLY_ORC;
	level = 999;
	voice = 5;
	id = 101101;
	flags = NPC_FLAG_IMMORTAL;
	attribute[ATR_STRENGTH] = 45;
	attribute[ATR_DEXTERITY] = 35;
	attribute[ATR_MANA_MAX] = 50;
	attribute[ATR_MANA] = 50;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	Mdl_SetVisual (self, "HumanS.mds");
	Mdl_SetVisualBody (self, "Ske_Fly_Body", 1, DEFAULT, "", 1, DEFAULT, -1);
	fight_tactic = FAI_HUMAN_STRONG;
	daily_routine = rtn_start_101101;
};


func void rtn_start_101101()
{
	TA_Smalltalk (8, 0, 23, 0, "NW_MAGECAVE_RUNE");
	TA_Smalltalk (23, 0, 8, 0, "NW_MAGECAVE_RUNE");
};

