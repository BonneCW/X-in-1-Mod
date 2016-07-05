//*************************
//	Eiswolf Prototype
//*************************

PROTOTYPE Mst_Default_Icewolf(C_Npc)			
{
	//----- Monster ----
	name							=	"Eiswolf";
	guild							=	GIL_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_Icewolf;
	level							=	15;		
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	300;	
	attribute	[ATR_HITPOINTS]		=	300;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	150;
	protection	[PROT_EDGE]			=	150;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	150;
	protection	[PROT_FLY]			=	150;
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


//*************
//	Visuals
//*************


func void B_SetVisuals_Icewolf()
{
	Mdl_SetVisual			(self, "Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SnoWol_Body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Eiswolf
//************

INSTANCE Icewolf	(Mst_Default_Icewolf)
{
	B_SetVisuals_Icewolf();
	Npc_SetToFistMode(self);
	CreateInvItems (self, ItFoMuttonRaw, 1);
};

instance SUMMONED_ICEWOLF(Mst_Default_Icewolf)
{
	name[0] = "Beschworener Eiswolf";
	guild = GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID] = id_summoned_icewolf;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Icewolf ();
	Npc_SetToFistMode (self);
};

INSTANCE Icewolf_001(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_002(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_003(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_004(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_005(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_006(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_007(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_008(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_009(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_010(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_011(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_012(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_013(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_014(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_015(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_016(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_017(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_018(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_019(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_020(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_021(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_022(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_023(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
INSTANCE Icewolf_024(Mst_Default_Icewolf){B_SetVisuals_Icewolf();Npc_SetToFistMode(self);CreateInvItems (self, ItFoMuttonRaw, 1);};
