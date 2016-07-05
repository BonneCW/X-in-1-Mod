// *********************
// Gobbo_Green Prototype
// *********************

prototype Mst_Default_Gobbo_Green (C_NPC)			
{
	// ------ Monster -----
	name							=	"Goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_GREEN;
	level							=	4;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	0;

	// ------ Damage Types ------						//entweder EIN damagetype oder mehrere damage[x], die dann addiert werden und getrennten R�stungsabzug bekommen
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	// ------ Kampf-Taktik ------
	fight_tactic	=	FAI_GOBBO;
	
	// ------ senses & ranges ------
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	// ------ Daily Routine ------
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


// *****************
// 		Visuals
// *****************

func void B_SetVisuals_Gobbo_Green()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		0,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


// ***********
// Green Gobbo
// ***********

INSTANCE Gobbo_Green (Mst_Default_Gobbo_Green)
{
	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR �ber STR bestimmt (Gobbo ist als Monster im Fistmode)
};


// *****************
// Young Green Gobbo
// *****************

INSTANCE YGobbo_Green (Mst_Default_Gobbo_Green)
{
	level							=	3;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	// ------ Protection ------
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	fight_tactic	=	FAI_MONSTER_COWARD;

	B_SetVisuals_Gobbo_Green();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR �ber STR bestimmt (Gobbo ist als Monster im Fistmode)
};

INSTANCE Gobbo_Green_001(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_002(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_003(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_004(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_005(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_006(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_007(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_008(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_009(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_010(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_011(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_012(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_013(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_014(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_015(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_016(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_017(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_018(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_019(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_020(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_021(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_022(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_023(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_024(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_025(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_026(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_027(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_028(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_029(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_030(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_031(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Green_032(Mst_Default_Gobbo_Green){B_SetVisuals_Gobbo_Green();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};







