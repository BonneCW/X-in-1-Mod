//********************
//	Keiler Prototype														
//********************

PROTOTYPE Mst_Default_Keiler(C_Npc)			
{
	//----- Monster ----
	name							=	"Keiler";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_Keiler;
	level							=	6;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	50;
	attribute	[ATR_DEXTERITY]		=	50;
	attribute	[ATR_HITPOINTS_MAX]	=	100;
	attribute	[ATR_HITPOINTS]		=	100;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	50;
	protection	[PROT_EDGE]			=	50;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	50;
	protection	[PROT_FLY]			=	50;
	protection	[PROT_MAGIC]		=	0;

	//---- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WOLF;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;	
};


//************
//	Visuals
//************


func void B_SetVisuals_Keiler()
{
	Mdl_SetVisual			(self,"Keiler.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Keiler_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Keiler    	
//************

INSTANCE Keiler	(Mst_Default_Keiler)
{
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};

INSTANCE Keiler_001(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_002(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_003(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_004(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_005(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_006(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_007(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_008(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_009(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_010(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_011(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_012(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_013(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_014(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_015(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_016(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_017(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_018(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_019(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_020(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_021(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_022(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_023(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_024(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Keiler_025(Mst_Default_Keiler){B_SetVisuals_Keiler();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};



INSTANCE retonsKeiler	(Mst_Default_Keiler)
{
	name							=	"Groﬂer Keiler";
	B_SetVisuals_Keiler();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 5);
	
	attribute	[ATR_STRENGTH]		=	100;
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	

};