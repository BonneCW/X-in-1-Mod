//*************************
//	Giant_Bug Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Bug(C_Npc)			
{
	//----- Monster ----
	name							=	"Feldräuber";
	guild							=	GIL_GIANT_BUG;
	aivar[AIV_MM_REAL_ID]			= 	ID_GIANT_BUG;
	level							=	8;
 
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	40;
	attribute	[ATR_HITPOINTS_MAX]	=	80;
	attribute	[ATR_HITPOINTS]		=	80;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	40;
	protection	[PROT_EDGE]			=	40;
	protection	[PROT_POINT]		=	40;
	protection	[PROT_FIRE]			=	40;
	protection	[PROT_FLY]			=	40;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage TYpes ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	= 	FAI_GIANT_BUG;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = FALSE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Bug()
{
	Mdl_SetVisual			(self,	"Giant_Bug.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Bug_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Giant_Bug    
//***************

INSTANCE Giant_Bug	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};


//**************************************
//	junge Giant_Bug   (für Spielstart) 	
//**************************************

INSTANCE YGiant_Bug	(Mst_Default_Giant_Bug)
{
	//----- Monster ----
	name							=	"Junger Feldräuber";
	level							=	2;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	//----- Kampf-Taktik ----
	fight_tactic					= FAI_GIANT_BUG;

	//----- Visuals ----
	B_SetVisuals_Giant_Bug();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};


INSTANCE YGiant_Bug_VinoRitual1	(Mst_Default_Giant_Bug)
{
	//----- Monster ----
	name							=	"Junger Feldräuber";
	level							=	4;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	10;
	protection	[PROT_EDGE]			=	10;
	protection	[PROT_POINT]		=	10;
	protection	[PROT_FIRE]			=	10;
	protection	[PROT_FLY]			=	10;
	protection	[PROT_MAGIC]		=	0;

	//----- Kampf-Taktik ----
	fight_tactic					= FAI_GIANT_BUG;

	//----- Visuals ----
	B_SetVisuals_Giant_Bug();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};

INSTANCE YGiant_Bug_VinoRitual2	(Mst_Default_Giant_Bug)
{
	//----- Monster ----
	name							=	"Junger Feldräuber";
	level							=	4;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	10;
	attribute	[ATR_DEXTERITY]		=	10;
	attribute	[ATR_HITPOINTS_MAX]	=	40;
	attribute	[ATR_HITPOINTS]		=	40;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;

	//----- Kampf-Taktik ----
	fight_tactic					= FAI_GIANT_BUG;

	//----- Visuals ----
	B_SetVisuals_Giant_Bug();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};

//**************************************
//	Lobarts_Giant_Bug s   (für Miliz Aufnahmemission) 	
//**************************************

INSTANCE Lobarts_Giant_Bug1	(Mst_Default_Giant_Bug)	
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Lobarts_Giant_Bug2	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Lobarts_Giant_Bug3	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Lobarts_Giant_Bug4	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Lobarts_Giant_Bug5	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Lobarts_Giant_Bug6	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Lobarts_Giant_Bug7	(Mst_Default_Giant_Bug)
{
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};

INSTANCE Giant_BugTransform	(Mst_Default_Giant_Bug)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Giant_Bug();
	Npc_SetToFistMode(self);
};
INSTANCE Giant_Bug_001(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_002(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_003(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_004(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_005(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_006(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_007(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_008(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_009(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_010(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_011(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_012(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_013(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_014(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_015(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_016(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_017(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_018(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_019(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_020(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_021(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_022(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_023(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_024(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_025(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_026(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_027(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_028(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_029(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_030(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_031(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_032(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_033(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_034(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_035(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_036(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_037(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_038(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_039(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_040(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_041(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_042(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_043(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_044(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_045(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_046(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_047(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_048(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_049(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_050(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_051(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_052(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_053(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_054(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_055(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_056(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_057(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_058(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_059(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_060(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_061(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_062(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_063(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_064(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_065(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_066(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_067(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_068(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_069(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_070(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_071(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_072(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_073(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_074(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_075(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_076(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_077(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_078(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_079(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_080(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_081(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_082(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_083(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
INSTANCE Giant_Bug_084(Mst_Default_Giant_Bug){B_SetVisuals_Giant_Bug();Npc_SetToFistMode(self);};
