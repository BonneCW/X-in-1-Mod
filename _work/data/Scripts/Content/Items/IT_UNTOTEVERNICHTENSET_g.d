var int Ringonee;
var int Ringtwoe;
var int Amulette;
var int skeletonkiller;

INSTANCE  ItRi_UT1 (C_Item)  //in Quarhodrons grab
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_STR_01;

	visual 			=	"ItRi_Prot_Total_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_UT1;
	on_unequip		=	UnEquip_ItRi_UT1;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Ring der Untoten";

	
	TEXT[3]			= "gehört zum legendären Untoten-Set";
	
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;


	
};

	FUNC VOID Equip_ItRi_UT1()
	{
        Ringonee = TRUE;
	if (RINGTWOE == TRUE)
        && (AMULETTE == TRUE)	
	{
      
        SKELETONKILLER = TRUE;
Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",  self, self, 0, 0, 0, FALSE );
	};
        };
	
        FUNC VOID UnEquip_ItRi_UT1()
	{
        Ringonee = FALSE;
	if (skeletonkiller == TRUE)
        {	
	
        skeletonkiller = FALSE;
        Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
        };
       	
	};

INSTANCE  ItRi_UT2 (C_Item)  //in Quarhodrons grab
{
	name 			=	NAME_Ring;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_RING;

	value 			=	Value_ItRi_Addon_STR_01;

	visual 			=	"ItRi_Prot_Total_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItRi_UT2;
	on_unequip		=	UnEquip_ItRi_UT2;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Ring der Untoten";

	
	TEXT[3]			= "gehört zum legendären Untoten-Set";
	
	
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;


	
};

	FUNC VOID Equip_ItRi_UT2()
	{
        Ringtwoe = TRUE;
	if (RINGONEE == TRUE)
        && (AMULETTE == TRUE)
        {
        SKELETONKILLER = TRUE	;
	
Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",  self, self, 0, 0, 0, FALSE );
	};
        };
	FUNC VOID UnEquip_ItRi_UT2()
	{
Ringtwoe = FALSE;
	if (SKELETONKILLER == TRUE)
        {	
	
        skeletonkiller = FALSE;	
        Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
        };
       
	};

//ItAm_Prot_Mage_01.3ds

INSTANCE  ItAm_UT(C_Item)  //Joly: verteilt RAKEPLACE[19]
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	Value_ItAm_Addon_MANA;

	visual 			=	"ItAm_Prot_Mage_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_ItAm_UT;
	on_unequip		=	UnEquip_ItAm_UT;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_ITEMGLIMMER"; 

	description		=  "Amulett der Untoten";

	TEXT[3]			= "gehört zum legendären Set der Untoten";
	
	 
	
};

	FUNC VOID Equip_ItAm_UT()
	{
AMULETTE = TRUE;
	if (RINGTWOE == TRUE)
        && (RINGONEE == TRUE)
        {
        
        SKELETONKILLER = TRUE ; 
          Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		AI_PlayAni (self,"T_MAGRUN_2_HEASHOOT");	
		AI_StandUp (self);
        Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",  self, self, 0, 0, 0, FALSE );
        };
           
	};
	FUNC VOID UnEquip_ItAm_UT()
	{
        AMULETTE = FALSE;
	if (SKELETONKILLER == TRUE)
        {
      
        SKELETONKILLER = FALSE;
        Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
	Snd_Play 	("MFX_FEAR_CAST" );
        };
       
	};