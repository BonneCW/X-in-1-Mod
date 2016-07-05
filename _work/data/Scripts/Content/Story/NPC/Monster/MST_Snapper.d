//***********************
//	Snapper Prototype	
//***********************

PROTOTYPE Mst_Default_Snapper(C_Npc)			
{
	//---- Monster ----
	name							=	"Snapper";
	guild							=	GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	12;

	//----- Attribute ----	
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

	//----- Damage Types ----	
	damagetype 						=	DAM_EDGE;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_SNAPPER;

	//----- Senses & Ranges ----	
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;
	
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= TRUE;

	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_RestStart]		= OnlyRoutine;
};


//*******************
//	Visuals
//*******************

	
func void B_SetVisuals_Snapper()
{
	Mdl_SetVisual			(self,	"Snapper.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Sna_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//**************
//	Snapper    	
//**************

INSTANCE Snapper	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};


//**************
//	Spezielle Snapper    	
//**************

//---------------OW Newmine---------------------

INSTANCE NewMine_Snapper1	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper2	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper3	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper4	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper5	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper6	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper7	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_Snapper8	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE NewMine_LeadSnapper	(Mst_Default_Snapper)	//OW NewMineMission Kill_Snapper: Bilgot weiß von einem Leittier, das muß tot -> Fajeths Auftrag erledigt! 
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
	name	=	"Rudelführer";
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	60;
	attribute	[ATR_DEXTERITY]		=	60;
	attribute	[ATR_HITPOINTS_MAX]	=	160;
	attribute	[ATR_HITPOINTS]		=	160;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----	
	protection	[PROT_BLUNT]		=	30;
	protection	[PROT_EDGE]			=	30;
	protection	[PROT_POINT]		=	20;		
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	30;
	protection	[PROT_MAGIC]		=	0;
	
	CreateInvItems (self, ItAt_ClawLeader,1);
};

//**************
//	Grimbald Snapper   	(Trollarea)	
//**************

INSTANCE Grimbald_Snapper1	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE Grimbald_Snapper2	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

INSTANCE Grimbald_Snapper3	(Mst_Default_Snapper)
{
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};
INSTANCE SnapperTransform	(Mst_Default_Snapper)
{
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_StopMagicTransform);
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};

//**************
//	Summoned Snapper
//**************

INSTANCE Summoned_Snapper	(Mst_Default_Snapper)
{
	name							=	"Beschworener Snapper";
	guild							=	GIL_SUMMONEDZOMBIE;
	aivar[AIV_MM_REAL_ID]			= 	ID_SNAPPER;
	level							=	0; //10
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	90;
	attribute	[ATR_DEXTERITY]		=	90;
	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	90;
	protection	[PROT_EDGE]			=	90;
	protection	[PROT_POINT]		=	90;
	protection	[PROT_FIRE]			=	90;
	protection	[PROT_FLY]			=	90;
	protection      [PROT_MAGIC]                    =        0;
	
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	start_aistate = ZS_MM_Rtn_Summoned;
	
	B_SetVisuals_Snapper();
	Npc_SetToFistMode(self);
};
INSTANCE Snapper_001(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_002(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_003(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_004(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_005(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_006(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_007(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_008(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_009(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_010(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_011(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_012(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_013(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_014(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_015(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_016(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_017(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_018(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_019(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_020(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_021(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_022(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_023(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_024(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_025(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_026(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_027(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_028(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_029(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_030(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_031(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_032(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_033(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_034(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_035(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_036(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_037(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_038(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_039(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_040(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_041(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_042(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_043(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_044(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_045(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_046(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_047(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_048(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_049(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_050(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_051(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_052(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_053(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_054(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_055(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_056(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_057(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_058(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_059(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_060(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
INSTANCE Snapper_061(Mst_Default_Snapper){B_SetVisuals_Snapper();Npc_SetToFistMode(self);};
