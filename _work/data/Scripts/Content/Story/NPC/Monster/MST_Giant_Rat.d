//*************************
//	Giant_Rat Prototype		
//*************************

PROTOTYPE Mst_Default_Giant_Rat(C_Npc)			
{
	//----- Monster ----
	name							=	"Riesenratte";
	guild							=	GIL_Giant_Rat;
	aivar[AIV_MM_REAL_ID]			= 	ID_Giant_Rat;
	level							=	3;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	15;
	attribute	[ATR_DEXTERITY]		=	15;
	attribute	[ATR_HITPOINTS_MAX]	=	30;
	attribute	[ATR_HITPOINTS]		=	30;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	15;
	protection	[PROT_EDGE]			=	15;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	15;
	protection	[PROT_FLY]			=	15;
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
	fight_tactic	= 	FAI_GIANT_RAT;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart]		= OnlyRoutine;
};


//************
//	Visuals
//************

func void B_SetVisuals_Giant_Rat()
{
	Mdl_SetVisual			(self,	"Giant_Rat.mds");
	//								Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Giant_Rat_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Giant_Rat    
//***************

INSTANCE Giant_Rat	(Mst_Default_Giant_Rat)
{
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};


//**************************************
//	junge Giant_Rat   (für Spielstart) 	
//**************************************

INSTANCE YGiant_Rat	(Mst_Default_Giant_Rat)
{
	//----- Monster ----
	name							=	"junge Riesenratte";
	aivar[AIV_MM_REAL_ID]			= 	ID_Young_Giant_Rat;
	level							=	3;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	10;
	attribute	[ATR_HITPOINTS]		=	10;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	5;
	protection	[PROT_EDGE]			=	5;
	protection	[PROT_POINT]		=	5;
	protection	[PROT_FIRE]			=	5;
	protection	[PROT_FLY]			=	5;
	protection	[PROT_MAGIC]		=	0;

	//----- Kampf-Taktik ----
	fight_tactic					= FAI_MONSTER_COWARD;

	//----- Visuals ----
	B_SetVisuals_Giant_Rat();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

INSTANCE Giant_RatTransform	(Mst_Default_Giant_Rat)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Giant_Rat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};
// 61 Ratten
INSTANCE Giant_Rat_001 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_002 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_003 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_004 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_005 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_006 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_007 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_008 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_009 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_010 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_011 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_012 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_013 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_014 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_015 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_016 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_017 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_018 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_019 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_020 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_021 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_022 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_023 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_024 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_025 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_026 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_027 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_028 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_029 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_030 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_031 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_032 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_033 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_034 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_035 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_036 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_037 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_038 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_039 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_040 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_041 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_042 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_043 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_044 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_045 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_046 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_047 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_048 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_049 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_050 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_051 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_052 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_053 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_054 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_055 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_056 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_057 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_058 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_059 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_060 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Giant_Rat_061 (Mst_Default_Giant_Rat){B_SetVisuals_Giant_Rat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};

