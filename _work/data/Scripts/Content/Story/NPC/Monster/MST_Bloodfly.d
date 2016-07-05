//********************
//	Bloodfly Prototype
//********************

PROTOTYPE Mst_Default_Bloodfly(C_Npc)			
{
	//----- Monster -----
	name							=	"Blutfliege";
	guild							=	GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID]			= 	ID_BLOODFLY;
	level							=	4;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	20;
	attribute	[ATR_DEXTERITY]		=	20;
	attribute	[ATR_HITPOINTS_MAX]	=	40; 
	attribute	[ATR_HITPOINTS]		=	40;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Ptotection ----
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	20;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
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
	fight_tactic	= 	FAI_BLOODFLY;
	
	//----- Senses & Ranges ----
	senses			= 	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_SHORT;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter]	= FALSE;
	
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_WuselStart] 	= OnlyRoutine;	
};

//******************
//		Visuals
//******************

func void B_SetVisuals_Bloodfly()
{
	Mdl_SetVisual			(self,	"Bloodfly.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Blo_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*************
//	Bloodfly   
//*************

INSTANCE Bloodfly	(Mst_Default_Bloodfly)
{
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};

//*************
//	YBloodfly   
//*************

INSTANCE YBloodfly	(Mst_Default_Bloodfly)
{
	name							=	"Kleine Blutfliege";
	
	level							=	3;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	5;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	20;
	attribute	[ATR_HITPOINTS]		=	20; 
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protection ----
	protection	[PROT_BLUNT]		=	0;
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0;
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	0;
		
	B_SetVisuals_Bloodfly();
	Mdl_SetModelScale(self, 0.9, 0.9, 0.9);
	Npc_SetToFistMode(self);
};
//*************
//	Sleepfly (schlafende Blutfliege)   
//*************

INSTANCE Sleepfly	(Mst_Default_Bloodfly)
{
	//----- Daily Routine ----	
	start_aistate				= ZS_MM_AllScheduler;
	
	aivar[AIV_MM_SleepStart] 	= OnlyRoutine;	
	
	B_SetVisuals_Bloodfly();
	Npc_SetToFistMode(self);
};
INSTANCE Bloodfly_001(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_002(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_003(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_004(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_005(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_006(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_007(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_008(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_009(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_010(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_011(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_012(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_013(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_014(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_015(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_016(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_017(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_018(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_019(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_020(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_021(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_022(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_023(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_024(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_025(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_026(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_027(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_028(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_029(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_030(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_031(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_032(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_033(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_034(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_035(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_036(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_037(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_038(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_039(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_040(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_041(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_042(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_043(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_044(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_045(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_046(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_047(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_048(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_049(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_050(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_051(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_052(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_053(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_054(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_055(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_056(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_057(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_058(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_059(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_060(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_061(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_062(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_063(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_064(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_065(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_066(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_067(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_068(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_069(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_070(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_071(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_072(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_073(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_074(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_075(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_076(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_077(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_078(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_079(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_080(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_081(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_082(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_083(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_084(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_085(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_086(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_087(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_088(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_089(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_090(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_091(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_092(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_093(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_094(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_095(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_096(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_097(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_098(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_099(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_100(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_101(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_102(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_103(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_104(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_105(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_106(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_107(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_108(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_109(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_110(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_111(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_112(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_113(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_114(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_115(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_116(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_117(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_118(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_119(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_120(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_121(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_122(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_123(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_124(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_125(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_126(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_127(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_128(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_129(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
INSTANCE Bloodfly_130(Mst_Default_Bloodfly){B_SetVisuals_Bloodfly();Npc_SetToFistMode(self);};
