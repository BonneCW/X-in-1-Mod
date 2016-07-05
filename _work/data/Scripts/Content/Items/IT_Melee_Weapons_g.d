var int u2ise;
var int uise;
var int hitcounter;
const int absorbedenemy		= 0;
var int sise;
INSTANCE ItMw_uriziel_u  (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_4;	
	
	
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	0;
	visual 				=	"ItMw_110_2h_sword_smith_05.3DS";

	description			= name;
        TEXT[1]				= "Das Schwert ist stumpf und der Edelstein matt und kraftlos";		
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItMw_uriziel  (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_4;	
	
	on_equip		=	Equip_up;
	on_unequip		=	UnEquip_up;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	0;
	visual 				=	"uriziel.3ds";

	description			= name;
        TEXT[1]				= "Das legendäre Uriziel";		
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damagetotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


FUNC VOID Equip_up()
	{
        uise = TRUE;
	
        };
	
        FUNC VOID UnEquip_up()
	{
        uise = FALSE;
	 
       	
	};


INSTANCE ItMw_uriziel2  (C_Item) 
{	
	name 				=	"URIZIEL";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal			= 	170;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_4;	
	
	on_equip		=	Equip_u2p;
	on_unequip		=	UnEquip_u2p;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	0;
	visual 				=	"uriziel2.3ds";

	description			= name;
        TEXT[1]				= "Das legendäre Uriziel ist nun bis zum Anschlag voll mit magischer Energie";		
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damagetotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


	FUNC VOID Equip_u2p()
	{
        u2ise = TRUE;

	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_10);
		B_MeleeWeaponChange(0, Waffenbonus_10, 0);
	};
	
        };
	
        FUNC VOID UnEquip_u2p()
	{
        u2ise = FALSE;
	 
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_10);
		B_MeleeWeaponUndoChange();
	};
       	
	};

INSTANCE ItMw_GHS (C_Item)
{	
	name 				=	"Schwert des Gildenherren";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=  0;

	damageTotal  		= 	60;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	0;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Retonsschwert (C_Item)
{	
	name 				=	"Retons Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	25;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_012_1h_Sword_short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_norhammer(C_Item)
{	
	name 				=	"Schmiedehammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	Damage_Schmiedehammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schmiedehammer;
	visual 				=	"ItMw_010_1h_sledgehammer_01.3DS";

	description			= name;
TEXT[1]				= "Ein großes 'N' ist in den Hammerkopf eingraviert";	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

instance ItRw_marvinbogen (C_Item)
{
	name 				=	"Bogen für Marvin";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	100;

	damageTotal			=	Damage_Jagdbogen;
	damagetype			=	DAM_POINT;
	munition			=	ItRw_Arrow;

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_Jagdbogen;
	visual 				=	"ItRw_Bow_M_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_marvinschwert (C_Item)
{	
	name 				=	"Schwert für Marvin";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				= 100;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_innosdolch (C_Item)
{	
	name 				=	"Innosdolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;
effect				=	"SPELLFX_FIREBOW";
	value 				=	Value_VLKDolch;

	damageTotal  		= 	Damage_VLKDolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_adanosdolch (C_Item)
{	
	name 				=	"Adanosdolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;
effect				=	"SPELLFX_CROSSBOW";
	value 				=	Value_VLKDolch;

	damageTotal  		= 	Damage_VLKDolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_beliardolch (C_Item)
{	
	name 				=	"Beliardolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;
effect				= 	"SPELLFX_FIRESWORDBLACK";
	value 				=	Value_VLKDolch;

	damageTotal  		= 	Damage_VLKDolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


INSTANCE ItMw_saphiel (C_Item)
{	
	name 				=	"Saphiel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	10000;

	damageTotal  		= 	150;
	damagetype 			=	DAM_EDGE;
	range    			=  	170;		
	on_equip		=	Equip_s;
	on_unequip		=	UnEquip_s;
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	100;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Absorbiert gegnerische Energie und stärkt Träger";		
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_s()
	{
        sise = TRUE;
	
        };
	
        FUNC VOID UnEquip_s()
	{
        sise = FALSE;
	 
       	
	};