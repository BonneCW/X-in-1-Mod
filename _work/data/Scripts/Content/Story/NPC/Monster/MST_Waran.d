//**********************
//	Waran Prototype		
//**********************

PROTOTYPE Mst_Default_Waran(C_Npc)			
{
	//----- Monster ----
	name							=	"Waran";
	guild							=	GIL_WARAN;
	aivar[AIV_MM_REAL_ID]			= 	ID_WARAN;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100;
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100;
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf Taktik ----
	fight_tactic	=	FAI_WARAN;

	//----- Sense & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;

	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//************
//	Visuals
//************

func void B_SetVisuals_Waran()
{
	Mdl_SetVisual			(self,	"Waran.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"War_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Waran    	
//**************

INSTANCE Waran	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

//Addon


INSTANCE BeachWaran1	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};


INSTANCE BeachWaran2	(Mst_Default_Waran)
{
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

INSTANCE WaranTransform	(Mst_Default_Waran)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

// 54 Warane
INSTANCE Waran_001(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_002(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_003(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_004(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_005(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_006(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_007(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_008(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_009(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_010(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_011(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_012(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_013(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_014(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_015(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_016(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_017(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_018(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_019(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_020(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_021(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_022(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_023(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_024(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_025(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_026(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_027(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_028(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_029(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_030(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_031(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_032(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_033(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_034(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_035(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_036(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_037(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_038(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_039(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_040(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_041(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_042(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_043(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_044(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_045(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_046(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_047(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_048(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_049(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_050(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_051(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_052(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_053(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};
INSTANCE Waran_054(Mst_Default_Waran){B_SetVisuals_Waran();Npc_SetToFistMode(self);};


