//**************************
//	Scavenger Prototype
//**************************

PROTOTYPE Mst_Default_Scavenger(C_Npc)			
{
	//----- Monster ----
	name							=	"Scavenger";
	guild							=	GIL_SCAVENGER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SCAVENGER;
	level							=	7;

	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	35;
	attribute	[ATR_DEXTERITY]		=	35;
	attribute	[ATR_HITPOINTS_MAX]	=	70;
	attribute	[ATR_HITPOINTS]		=	70;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	35;
	protection	[PROT_EDGE]			=	35;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	35;
	protection	[PROT_FLY]			=	35;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
	//damage		[DAM_INDEX_BLUNT]	=	0;
	//damage		[DAM_INDEX_EDGE]	=	30;	
	//damage		[DAM_INDEX_POINT]	=	0;
	//damage		[DAM_INDEX_FIRE]	=	0;
	//damage		[DAM_INDEX_FLY]		=	0;
	//damage		[DAM_INDEX_MAGIC]	=	0;
	
	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_SCAVENGER;

	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Dailay Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= 22;	
	aivar[AIV_MM_SleepEnd]		= 6;
	aivar[AIV_MM_EatGroundStart]= 6;
	aivar[AIV_MM_EatGroundEnd]	= 22;
};


//****************
//	Visuals
//****************
	
func void B_SetVisuals_Scavenger()
{
	Mdl_SetVisual			(self,	"Scavenger.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sca_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//***************
//	Scavenger 
//***************

INSTANCE Scavenger	(Mst_Default_Scavenger)
{
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

INSTANCE ScavengerTransform	(Mst_Default_Scavenger)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Scavenger();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

INSTANCE Scavenger_001(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_002(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_003(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_004(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_005(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_006(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_007(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_008(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_009(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_010(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_011(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_012(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_013(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_014(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_015(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_016(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_017(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_018(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_019(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_020(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_021(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_022(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_023(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_024(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_025(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_026(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_027(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_028(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_029(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_030(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_031(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_032(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_033(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_034(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_035(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_036(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_037(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_038(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_039(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_040(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_041(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_042(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_043(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_044(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_045(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_046(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_047(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_048(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_049(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_050(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Scavenger_051(Mst_Default_Scavenger){B_SetVisuals_Scavenger();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};





