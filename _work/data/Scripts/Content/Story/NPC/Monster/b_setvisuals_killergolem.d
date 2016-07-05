
prototype MST_DEFAULT_KILLERGOLEM(C_Npc)
{
	name[0] = "Golem";
	guild = GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID] = ID_STONEGOLEM;
	level = 30;
	attribute[ATR_STRENGTH] = 90;
	attribute[ATR_DEXTERITY] = 125;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 150;
	protection[PROT_POINT] = IMMUNE;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = IMMUNE;
	protection[PROT_MAGIC] = IMMUNE;
	damagetype = DAM_FLY;
	fight_tactic = FAI_STONEGOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

func void b_setvisuals_killergolem()
{
	Mdl_SetVisual (self, "Golem.mds");
	Mdl_SetVisualBody (self, "Gol_Body", DEFAULT, DEFAULT, "", DEFAULT, DEFAULT, -1);
};


instance KILLERGOLEM(MST_DEFAULT_KILLERGOLEM)
{
	b_setvisuals_killergolem ();
	Mdl_SetModelScale (self, 0.3, 0.3, 0.3);
	Npc_SetToFistMode (self);
};

