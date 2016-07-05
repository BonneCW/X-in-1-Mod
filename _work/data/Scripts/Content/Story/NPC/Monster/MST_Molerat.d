//***************************
//	Molerat Prototype	
//***************************

PROTOTYPE Mst_Default_Molerat(C_Npc)			
{
	//----- Monster ----
	name							=	"Molerat";
	guild							=	GIL_MOLERAT;
	aivar[AIV_MM_REAL_ID]			= 	ID_MOLERAT;
	level							=	5;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	25;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	50;
	attribute	[ATR_HITPOINTS]		=	50;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	25;
	protection	[PROT_EDGE]			=	25;
	protection	[PROT_POINT]		=	25;	
	protection	[PROT_FIRE]			=	25;
	protection	[PROT_FLY]			=	25;	
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
	fight_tactic	=	FAI_MOLERAT;
	
	//----- Senses & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};


//*************
//	Visuals
//*************

func void B_SetVisuals_Molerat()
{
	Mdl_SetVisual			(self,	"Molerat.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Mol_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*****************
//	Molerat	
//*****************
INSTANCE Molerat	(Mst_Default_Molerat)
{
	B_SetVisuals_Molerat();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 2);
};
INSTANCE Molerat_001(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_002(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_003(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_004(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_005(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_006(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_007(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_008(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_009(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_010(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_011(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_012(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_013(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_014(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_015(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_016(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_017(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_018(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_019(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_020(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_021(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_022(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_023(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_024(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_025(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_026(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_027(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
INSTANCE Molerat_028(Mst_Default_Molerat){B_SetVisuals_Molerat();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 2);};
