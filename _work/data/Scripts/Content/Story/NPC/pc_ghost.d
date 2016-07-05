
instance PC_GHOST(Npc_Default)
{
	name[0] = "Seele";
	guild = GIL_DJG;
	id = 2005;
	voice = 15;
	flags = NPC_FLAG_GHOST;
	level = 0;
	npcType = npctype_main;
	bodyStateInterruptableOverride = TRUE;
	exp = 0;
	exp_next = 90000;
	lp = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_IgnoresArmor] = TRUE;
	attribute[ATR_STRENGTH] = 0;
	attribute[ATR_DEXTERITY] = 0;
	attribute[ATR_MANA_MAX] = 40;
	attribute[ATR_MANA] = 40;
	attribute[ATR_HITPOINTS_MAX] = 2;
	attribute[ATR_HITPOINTS] = 10;
	attribute[ATR_REGENERATEHP] = 3;
	attribute[ATR_REGENERATEMANA] = 2;
	Mdl_SetVisual (self, "HUMANS.MDS");
	Mdl_SetVisualBody (self, "hum_body_Naked0", 9, 0, "Hum_Head_Pony", Face_N_Player, 0, NO_ARMOR);
	fight_tactic = FAI_HUMAN_STRONG;
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK, 1);
	Npc_SetTalentSkill (self, NPC_TALENT_ACROBAT, 1);
	Npc_SetTalentSkill (self, NPC_TALENT_FIREMASTER, 1);
	Npc_SetTalentSkill (self, NPC_TALENT_REGENERATE, 1);
	B_SetFightSkills (self, 50);
	Npc_PercEnable (self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable (self, PERC_ASSESSWARN, B_AssessWarn);
	Npc_PercEnable (self, PERC_ASSESSTALK, B_AssessTalk);
	B_ClearPerceptions (self);
	daily_routine = rtn_start_5554;
};


func void rtn_start_5554()
{
	Npc_PercEnable (self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable (self, PERC_ASSESSWARN, B_AssessWarn);
	Npc_PercEnable (self, PERC_ASSESSTALK, B_AssessTalk);
	TA_Follow_Player (8, 0, 23, 0, "XXX");
	TA_Follow_Player (23, 0, 8, 0, "XXX");
};

