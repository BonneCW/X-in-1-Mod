//****************************
//	Firedragon Prototype		
//****************************

PROTOTYPE Mst_Default_Dragon_Fire(C_Npc)			
{
	name							= "Feuerdrache";
	guild							= GIL_DRAGON;
	aivar[AIV_MM_REAL_ID]			= ID_DRAGON_FIRE;
	level							= 500;
	
	bodyStateInterruptableOverride = TRUE;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	250;
	attribute	[ATR_DEXTERITY]		=	200;
	attribute	[ATR_HITPOINTS_MAX]	=	1500;
	attribute	[ATR_HITPOINTS]		=	1500;
	attribute	[ATR_MANA_MAX] 		=	1000;
	attribute	[ATR_MANA] 			=	1000;
	
	//------ Protections ----	
	protection	[PROT_BLUNT]		=	220;
	protection	[PROT_EDGE]			=	250;
	protection	[PROT_POINT]		=	200;	
	protection	[PROT_FIRE]			=	IMMUNE;
	protection	[PROT_FLY]			=	170;	
	protection	[PROT_MAGIC]		=	250;
	
	//------ Damage Types ----	
	damagetype 						=	DAM_FIRE|DAM_FLY;
//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
	damage		[DAM_INDEX_FIRE]	=	149;
	damage		[DAM_INDEX_FLY]		=	1; //Opfer fliegt für Fire+Fly
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----	
	fight_tactic	=	FAI_DRAGON;
	
	//----- Sense & Ranges ----	
	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_DRAGON_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;

	//aivar[AIV_MaxDistToWp]		= 700;
	aivar[AIV_OriginalFightTactic] 	= FAI_DRAGON;
	
	//----- Daily Routine ----
	start_aistate				= ZS_MM_Rtn_DragonRest;

	aivar[AIV_MM_RestStart] 	= OnlyRoutine;
};


//******************
//	Visuals
//******************

func void B_SetVisuals_Dragon_Fire()
{
	Mdl_SetVisual			(self,	"Dragon.mds");
	//								Body-Mesh				Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Dragon_FIRE_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//*****************
//	Firedragon
//*****************

INSTANCE Dragon_Fire	(Mst_Default_Dragon_Fire)
{
	name				=	"Feomathar";
	flags				= 	NPC_FLAG_IMMORTAL;
	B_SetVisuals_Dragon_Fire();
	Npc_SetToFistMode(self);
};

//**************************
//	Firedragon Dragonisland
//*************************

INSTANCE Dragon_Fire_Island	(Mst_Default_Dragon_Fire)
{
	name				=	"Feodaron";
	flags				   			= 	NPC_FLAG_IMMORTAL;
	B_SetVisuals_Dragon_Fire();
	Npc_SetToFistMode(self);
};

instance SUMMONED_DRAGON(Mst_Default_Dragon_Fire)
{
	name = "Drache";
	guild = GIL_SUMMONED_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_SUMMONED_DRAGON;
	level = 0;
	bodyStateInterruptableOverride = TRUE;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 200;
	attribute[ATR_HITPOINTS_MAX] = 1300;
	attribute[ATR_HITPOINTS] = 1300;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 250;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 230;
	protection[PROT_FIRE] = IMMUNE;
	protection[PROT_FLY] = 170;
	protection[PROT_MAGIC] = 200;
	damagetype = DAM_FIRE | DAM_FLY;
	damage[DAM_INDEX_FIRE] = 149;
	damage[DAM_INDEX_FLY] = 1;
	fight_tactic = FAI_DRAGON;
	aivar[AIV_OriginalFightTactic] = FAI_DRAGON;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_PARTYMEMBER] = TRUE;
	B_SetAttitude (self, ATT_FRIENDLY);
	start_aistate = ZS_MM_Rtn_Summoned;
	B_SetVisuals_Dragon_Fire ();
	Npc_SetToFistMode (self);
};
