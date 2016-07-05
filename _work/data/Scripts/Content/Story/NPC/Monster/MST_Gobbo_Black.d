//*************************
//	BlackGobbo Prototype	
//*************************

PROTOTYPE Mst_Default_Gobbo_Black(C_NPC)			
{
	//----- Monster ----
	name							=	"schwarzer Goblin";
	guild							=	GIL_GOBBO;
	aivar[AIV_MM_REAL_ID]			= 	ID_GOBBO_BLACK;
	level							=	8;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_GOBBO;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;	
};


//***************
//	Visuals
//***************

func void B_SetVisuals_Gobbo_Black()
{
	Mdl_SetVisual			(self,	"Gobbo.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Gob_Body",		1,			DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


// ***********
// Black Gobbo   	
// ***********

INSTANCE Gobbo_Black (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};

// ***********
// Gobbo_DaronsStatuenKlauer   	
// ***********
INSTANCE Gobbo_DaronsStatuenKlauer (Mst_Default_Gobbo_Black)
{
	B_SetVisuals_Gobbo_Black();
	CreateInvItems (self, ItMi_LostInnosStatue_Daron, 1);									
	Npc_SetToFightMode (self, ItMw_1h_Bau_Mace); //Waffe ist nur Optik - Schaden wird NUR über STR bestimmt (Gobbo ist als Monster im Fistmode)
};
INSTANCE Gobbo_Black_001(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_002(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_003(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_004(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_005(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_006(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_007(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_008(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_009(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_010(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_011(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_012(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_013(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_014(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_015(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_016(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_017(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_018(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_019(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_020(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_021(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_022(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_023(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_024(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_025(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_026(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_027(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_028(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_029(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_030(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_031(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_032(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_033(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_034(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_035(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_036(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_037(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_038(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_039(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_040(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_041(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_042(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_043(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_044(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_045(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_046(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_047(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_048(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_049(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_050(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_051(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_052(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_053(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_054(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_055(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_056(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_057(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_058(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_059(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_060(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_061(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_062(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_063(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_064(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_065(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_066(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_067(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_068(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
INSTANCE Gobbo_Black_069(Mst_Default_Gobbo_Black){B_SetVisuals_Gobbo_Black();Npc_SetToFightMode (self, ItMw_1h_Bau_Mace);};
