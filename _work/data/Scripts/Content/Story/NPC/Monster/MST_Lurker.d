//************************
//	Lurker Prototype
//************************

PROTOTYPE Mst_Default_Lurker(C_Npc)			
{
	//----- Monster ----
	name							=	"Lurker";
	guild							=	GIL_LURKER;
	aivar[AIV_MM_REAL_ID]			= 	ID_LURKER;
	level							=	12;
	
	//----- Attributes ----
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	120;
	attribute	[ATR_HITPOINTS]		=	120;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	60;
	protection	[PROT_EDGE]			=	60;
	protection	[PROT_POINT]		=	60;
	protection	[PROT_FIRE]			=	60;
	protection	[PROT_FLY]			=	60;
	protection	[PROT_MAGIC]		=	0;
	
	//----- Damage Types----
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_LURKER;
	
	//----- Senses & Ranges ----
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_AllScheduler;

	aivar[AIV_MM_RoamStart] 	= OnlyRoutine;
};

//**************
//	Visuals
//**************

//---------------------------------------------------
func void B_SetVisuals_Lurker()
{
	Mdl_SetVisual			(self,	"Lurker.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Lur_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//*************
//	Lurker
//*************

INSTANCE Lurker	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

//*************
//	Kervos Lurker
//*************

INSTANCE Kervo_Lurker1	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;	//Joly: damit sie nicht in Kervos Höhle rennen.
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker2	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker3	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker4	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker5	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};

INSTANCE Kervo_Lurker6	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
	aivar[AIV_MaxDistToWp]			= 500;
	aivar[AIV_OriginalFightTactic] 	= FAI_LURKER;
};


//Addon
//Beachlurker

INSTANCE BeachLurker1	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE BeachLurker2	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE BeachLurker3	(Mst_Default_Lurker)
{
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};

INSTANCE LurkerTransform	(Mst_Default_Lurker)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Lurker();
	Npc_SetToFistMode(self);
};
INSTANCE Lurker_001(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_002(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_003(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_004(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_005(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_006(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_007(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_008(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_009(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_010(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_011(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_012(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_013(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_014(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_015(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_016(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_017(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_018(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_019(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_020(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_021(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_022(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_023(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_024(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_025(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_026(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_027(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_028(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_029(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_030(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_031(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_032(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_033(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_034(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_035(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_036(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_037(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_038(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_039(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_040(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_041(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_042(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_043(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_044(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_045(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_046(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_047(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_048(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_049(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_050(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
INSTANCE Lurker_051(Mst_Default_Lurker){B_SetVisuals_Lurker();Npc_SetToFistMode(self);};
