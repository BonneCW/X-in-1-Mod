//********************
//	Wolf Prototype														
//********************

PROTOTYPE Mst_DOG(C_Npc)			
{
	//----- Monster ----
	name							=	"Draco";
	guild							=	GIL_SUMMONED_WOLF;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_WOLF;
	level							=	0;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	40;
	attribute	[ATR_DEXTERITY]		=	35;
	attribute	[ATR_HITPOINTS_MAX]	=	180;
	attribute	[ATR_HITPOINTS]		=	180;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	20;
	protection	[PROT_EDGE]			=	20;
	protection	[PROT_POINT]		=	-1;
	protection	[PROT_FIRE]			=	20;
	protection	[PROT_FLY]			=	20;
	protection	[PROT_MAGIC]		=	5;

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
	start_aistate				= ZS_dog;
	
	
	//aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY); 
	
	
};


//************
//	Visuals
//************


func void B_SetVisuals_DOG()
{
	Mdl_SetVisual			(self,"Wolf.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Wol_Body",		1,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


//************
//	Wolf    	
//************

INSTANCE DOG	(Mst_DOG)
{
	B_SetVisuals_DOG();
	Npc_SetToFistMode(self);
	
};

INSTANCE DOG_Addon	(Mst_DOG)
{
	B_SetVisuals_DOG();
	Npc_SetToFistMode(self);
	
};

INSTANCE DOG_OW	(Mst_DOG)
{
	B_SetVisuals_DOG();
	Npc_SetToFistMode(self);
	
};

INSTANCE DOG_DI	(Mst_DOG)
{
	B_SetVisuals_DOG();
	Npc_SetToFistMode(self);
	
};

