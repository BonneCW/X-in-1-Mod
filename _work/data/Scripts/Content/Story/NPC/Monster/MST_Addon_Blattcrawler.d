//*****************************
//	Minecrawler Prototype
//*****************************

PROTOTYPE Mst_Default_Blattcrawler(C_Npc)			
{
	//----- Monster ----
	name							=	"Fangheuschrecke";
	guild							=	GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLATTCRAWLER;
	level							=	15;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		= 75;
	attribute	[ATR_DEXTERITY]		= 75;
	attribute	[ATR_HITPOINTS_MAX]	= 150;
	attribute	[ATR_HITPOINTS]		= 150;
	attribute	[ATR_MANA_MAX] 		= 0;
	attribute	[ATR_MANA] 			= 0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		= 75;
	protection	[PROT_EDGE]			= 75;
	protection	[PROT_POINT]		= 75;
	protection	[PROT_FIRE]			= 75;
	protection	[PROT_FLY]			= 75;
	protection	[PROT_MAGIC]		= 0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_MINECRAWLER;
	
	//----- Sense & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;
};


//***********
// Visuals
//***********

func void B_SetVisuals_Blattcrawler()
{
	Mdl_SetVisual			(self,	"Blattcrawler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"BlattCrawler_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Minecrawler
//*****************

INSTANCE Blattcrawler	(Mst_Default_Blattcrawler)
{
	B_SetVisuals_Blattcrawler();
	Npc_SetToFistMode(self);
};


prototype MST_FAT_BLATTCRAWLER(C_Npc)
{
	name[0] = "RIesenfangheuschrecke";
	guild = GIL_MINECRAWLER;
	aivar[AIV_MM_REAL_ID] = ID_BLATTCRAWLER;
	level = 80;
	attribute[ATR_STRENGTH] = 200;
	attribute[ATR_DEXTERITY] = 75;
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 220;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_MINECRAWLER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_WuselStart] = OnlyRoutine;
};

func void b_setvisuals_fat_blattcrawler()
{
	Mdl_SetVisual (self, "Blattcrawler.mds");
	Mdl_SetVisualBody (self, "BlattCrawler_Body", DEFAULT, DEFAULT, "", DEFAULT, DEFAULT, -1);
};


instance FAT_BLATTCRAWLER(MST_FAT_BLATTCRAWLER)
{
	b_setvisuals_fat_blattcrawler ();
	Mdl_SetModelScale (self, 1.2, 1.2, 1.2);
	Npc_SetToFistMode (self);
};



// 33 Blattcrawler
INSTANCE Blattcrawler_001(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_002(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_003(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_004(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_005(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_006(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_007(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_008(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_009(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_010(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_011(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_012(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_013(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_014(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_015(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_016(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_017(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_018(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_019(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_020(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_021(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_022(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_023(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_024(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_025(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_026(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_027(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_028(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_029(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_030(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_031(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_032(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};
INSTANCE Blattcrawler_033(Mst_Default_Blattcrawler){B_SetVisuals_Blattcrawler();Npc_SetToFistMode(self);};