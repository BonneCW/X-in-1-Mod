//*************************
//	Meatbug Prototype
//*************************

PROTOTYPE Mst_Default_Meatbug(C_Npc)			
{
	//----- Monster ----
	name							=	"Fleischwanze";
	guild							=	GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_MEATBUG;
	level							=	1;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	1;
	attribute	[ATR_DEXTERITY]		=	1;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						= 	DAM_EDGE;
	
	//----- Kampf-Taktik ----
//	fight_tactic					= ;		// k‰mpfen nicht!

	//----- Senses & Ranges ----
	Senses			= 	SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_FollowInWater] = FALSE;

	//----- Daily Routine ----
	start_aistate					= ZS_MM_AllScheduler;
		
	aivar[AIV_MM_WuselStart] 		= OnlyRoutine;
};


//***********
//	Visuals
//***********

func void B_SetVisuals_Meatbug()
{
	Mdl_SetVisual			(self,	"Meatbug.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mbg_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);

};


//***************
//	Meatbug    	
//***************

INSTANCE Meatbug	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};





//******************************
// Mission Meatbugs Kapitel 4
//******************************

//***************
//	Meatbug_Brutus1    	
//***************
INSTANCE Meatbug_Brutus1	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};
//***************
//	Meatbug_Brutus2   	
//***************

INSTANCE Meatbug_Brutus2	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};
//***************
//	Meatbug_Brutus3    	
//***************

INSTANCE Meatbug_Brutus3	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};
//***************
//	Meatbug_Brutus4    	
//***************

INSTANCE Meatbug_Brutus4	(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug();
};



prototype MST_DEFAULT_KILLERBUG(C_Npc)
{
	name[0] = "Fleischwanze";
	guild = GIL_HARPY;
	aivar[AIV_MM_REAL_ID] = ID_HARPY;
	level = 1;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 20;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void b_setvisuals_killerbug()
{
	Mdl_SetVisual (self, "Meatbug.mds");
	Mdl_SetVisualBody (self, "Mbg_Body", DEFAULT, DEFAULT, "", DEFAULT, DEFAULT, -1);
};


instance KILLERBUG(MST_DEFAULT_KILLERBUG)
{
	b_setvisuals_killerbug ();
	Npc_SetToFistMode (self);
};


prototype MST_DEFAULT_BUGQUEEN(C_Npc)
{
	name[0] = "Groﬂe Fleischwanze";
	guild = GIL_HARPY;
	aivar[AIV_MM_REAL_ID] = ID_HARPY;
	level = 1;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 1;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 160;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 80;
	protection[PROT_MAGIC] = 80;
	damagetype = DAM_EDGE;
	senses = SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void b_setvisuals_bugqueen()
{
	Mdl_SetVisual (self, "Meatbug.mds");
	Mdl_SetVisualBody (self, "Mbg_Body", DEFAULT, DEFAULT, "", DEFAULT, DEFAULT, -1);
};


instance BUGQUEEN(MST_DEFAULT_BUGQUEEN)
{
	b_setvisuals_bugqueen ();
	Mdl_SetModelScale (self, 5, 5, 5);
	Npc_SetToFistMode (self);
};

instance MEATBUG_PABLO1(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO2(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO3(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO4(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO5(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO6(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO7(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO8(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO9(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};

instance MEATBUG_PABLO10(Mst_Default_Meatbug)
{
	B_SetVisuals_Meatbug ();
};
// 45 Fleischwanzen
INSTANCE Meatbug_001(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_002(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_003(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_004(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_005(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_006(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_007(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_008(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_009(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_010(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_011(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_012(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_013(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_014(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_015(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_016(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_017(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_018(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_019(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_020(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_021(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_022(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_023(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_024(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_025(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_026(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_027(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_028(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_029(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_030(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_031(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_032(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_033(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_034(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_035(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_036(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_037(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_038(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_039(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_040(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_041(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_042(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_043(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_044(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};
INSTANCE Meatbug_045(Mst_Default_Meatbug){B_SetVisuals_Meatbug();};