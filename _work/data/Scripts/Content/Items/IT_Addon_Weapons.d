/*
	
	10 neue Waffen
	
	Magierstab rot, blau, gold
	Zweihandkeule, Einhandkeule (Holz, Stein) 
	Steinhammer (Maya TX) klein (einhand), groß (zweihand)
	
	Sichelstab (Zweihand, Stab mit Sichelklinge)
	
	Hackmesser (machete) Einhand- Zweihand
	
		
	
	
	
	ItMW_Addon_Knife01 //Wolfsmesser//Razormesser// +3 Von Cavalorn
	ItMW_Addon_Sichel01 //goldene Sichel + 3	 //versteckt Lobart umgebung	
	ItMW_Addon_Stab01 //Magierstab, Stab der Feuermagier  KAP1 
	ItMW_Addon_Stab02 //Stab der Wassermagier			  KAP2	Addonworld
	ItMW_Addon_Stab03 //Zauberstab 						  ab KAP1  Klosterkauf
	ItMW_Addon_Stab04 //Sichelstab, Ulthar's Stab		  ab KAP1  Klosterkauf
	ItMW_Addon_Stab05 //Goldener Zauberstab				  ab KAP1  Klosterkauf	
	
	
	
	
	ItMW_Addon_Hacker_1h_01 //Machete					  ab KAP1 zu kaufen		+3
	ItMW_Addon_Hacker_2h_01 //Große Machete				  ab KAP1 zu kaufen     +3
	ItMW_Addon_Keule_1h_01 //Keule, Windknecht			  finden ab kap 1			
	ItMW_Addon_Keule_2h_01 //Große Keule, Sturmknecht     finden in Addonworld
	
	
	
		
*/

//-------------------------------------------------------
//	Addon Waffen  Wolfsmesser
//-------------------------------------------------------
INSTANCE ItMW_Addon_Knife01 (C_Item)
{	
	name 				=	"Wolfsmesser";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Wolfsmesser;

	damageTotal  		= 	Damage_Wolfsmesser;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsmesser;		
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsmesser;
	visual 				=	"ItMw_012_1h_Knife_02.3DS";

	description			=   name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab01 (C_Item)
{	
	name 				=	"Magierstab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab01;

	damageTotal  		= 	Damage_Stab01;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab01;	
	
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2]  		=	Condition_Stab01;
	visual 				=	"ItMW_MageStaff_Good_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF1";

	description			= 	"Stab der Feuermagier";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab02 (C_Item)
{	
	name 				=	"Zauberstab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab02;

	damageTotal  		= 	Damage_Stab02;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab02;		
	
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	Condition_Stab02;
	visual 				=	"ItMW_MageStaff_Good_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF2";

	description			= 	name;

	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab03 (C_Item)
{	
	name 				=	"Wasserstab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab03;

	damageTotal  		= 	Damage_Stab03;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab03;	
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2]  		=	Condition_Stab03;
	visual 				=	"ItMW_MageStaff_Blades_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF3";

	description			= 	"Stab der Wassermagier";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab04 (C_Item)
{	
	name 				=	"Ulthar's Stab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab04;

	damageTotal  		= 	Damage_Stab04;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab04;	
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2]  		=	Condition_Stab04;
	visual 				=	"ItMW_MageStaff_Good_2H_02.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF4";

	description			= 	"Ulthar verzauberte diesen Stab";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Stab05 (C_Item)
{	
	name 				=	"Taifun";
	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Stab05;

	damageTotal  		= 	Damage_Stab05;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Stab05;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2]  		=	Condition_Stab05;
	visual 				=	"ItMW_MageStaff_Blades_2H_01.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF5";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Mana_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_1h_01 (C_Item) 
{	
	name 				=	"Machete";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Machete;

	damageTotal			= 	Damage_Machete;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Machete;	
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Machete;
	visual 				=	"ItMw_1H_Machete_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_1h_02 (C_Item) 
{	
	name 				=	"Alte Machete";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltMachete;

	damageTotal			= 	Damage_AltMachete;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_AltMachete;	
	
	on_equip			=	Equip_1H_02;
	on_unequip			=	UnEquip_1H_02;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_AltMachete;
	visual 				=	"ItMw_1H_Machete_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_2h_01 (C_Item) 
{	
	name 				=	"Riesenmachete";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Hacker;

	damageTotal			= 	Damage_Hacker;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Hacker;	
	
	on_equip			=	Equip_2H_03;
	on_unequip			=	UnEquip_2H_03;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Hacker;
	visual 				=	"ItMw_2H_Machete_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMW_Addon_Hacker_2h_02 (C_Item) 
{	
	name 				=	"Alte Riesenmachete";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_AltHacker;

	damageTotal			= 	Damage_AltHacker;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_AltHacker;	
	
	on_equip			=	Equip_2H_02;
	on_unequip			=	UnEquip_2H_02;
	
	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_AltHacker;
	visual 				=	"ItMw_2H_Machete_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMW_Addon_Keule_1h_01 (C_Item)
{	
	name 				=	"Windknecht";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Windknecht;

	damageTotal  		= 	Damage_Windknecht;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Windknecht;		
	
	on_equip			=	UnEquip_1H_10; //MALUS WAFFE MUSS umgekehrt sein.  
	on_unequip			=	Equip_1H_10;   //!!!
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Windknecht;
	visual 				=	"ItMW_Club_1H_01.3DS";

	description			= name;
	
	TEXT[0]				= NAME_Damage;					COUNT[0]	= damageTotal;
	
	TEXT[2]				= NAME_ADDON_MALUS_1H;			COUNT[2]	= Waffenbonus_10;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
INSTANCE ItMW_Addon_Keule_2h_01 (C_Item)//Sturmknecht 2h Holzkeule
{	
	name 				=	"Sturmknecht";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Sturmknecht;

	damageTotal  		= 	Damage_Sturmknecht;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_Sturmknecht;		
	
	on_equip			=	UnEquip_2H_10;//MALUS WAFFE MUSS umgekehrt sein. 
	on_unequip			=	Equip_2H_10; //erhöhen 
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sturmknecht;
	visual 				=	"ItMW_Club_2H_01.3DS";

	description			= 	name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_MALUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
INSTANCE ItMw_FrancisDagger_Mis (C_Item)
{	
	name 				=	"Guter Dolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal  		= 	Damage_VLKDolch;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;	
	
	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	
};

// *****************************************************
INSTANCE ItMw_RangerStaff_Addon (C_Item)
{	
	name 				=	"Kampfstab des 'Rings des Wassers'";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_RangerStaff;

	damageTotal  		= 	Damage_RangerStaff;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_RangerStaff;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_RangerStaff;
	visual 				=	"ItMw_020_2h_Nov_Staff_01.3DS"; 

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//*********************************************************

INSTANCE ItMw_Addon_PIR2hAxe (C_Item)
{	
	name 				=	"Plankenbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR2hAxe;

	damageTotal  		= 	Damage_PIR2hAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR2hAxe;
	visual 				=	"ItMw_070_2h_axe_heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*********************************************************
INSTANCE ItMw_Addon_PIR2hSword (C_Item)
{	
	name 				=	"Enterschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR2hSword;

	damageTotal  		= 	Damage_PIR2hSword;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR2hSword;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*********************************************************
INSTANCE ItMw_Addon_PIR1hAxe (C_Item)
{	
	name 				=	"Enteraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR1hAxe;

	damageTotal  		= 	Damage_PIR1hAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR1hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR1hAxe;
	visual 				=	"ItMw_030_1h_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
//*********************************************************
INSTANCE ItMw_Addon_PIR1hSword (C_Item)
{	
	name 				=	"Entermesser";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PIR1hSword;

	damageTotal  		= 	Damage_PIR1hSword;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_PIR1hSword;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PIR1hSword;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// *****************************************************
INSTANCE ItMw_Addon_BanditTrader (C_Item)
{	
	name 				=	"Degen der Banditen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_BanditTrader;

	damageTotal  		= 	Damage_VLKSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKSchwert;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_VLKSchwert;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;

	TEXT[1]				= 	"Der Buchstabe 'F.' ist in den Knauf geritzt.";

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *******************
// Skinenrs Waffe 
// *******************
INSTANCE ItMw_Addon_Betty (C_Item)
{	
	name 				=	"Betty";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Betty;

	damageTotal  		= 	Damage_Betty;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

////////////////////////////////////////////////////////////////////////////////
//
//	Magische Waffen
//

instance ItRw_Addon_MagicArrow (C_Item)
{
	name 				=	"Magischer Pfeil";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW | ITEM_MULTI;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_ARROW";

	// FIXME_Noki: Werte
	value 				=	Value_Pfeil;

	visual 				=	"ItRw_Arrow.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "";					COUNT[0]	= ;
//	TEXT[1]				= "";					COUNT[1]	= ;
//	TEXT[2]				= NAME_Damage;			COUNT[2]	= damageTotal;
//	TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
//	TEXT[4]				= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


instance ItRw_Addon_FireArrow (C_Item)
{
	name 				=	"Feuerpfeil";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_BOW | ITEM_MULTI;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_FIREARROW";

	// FIXME_Noki: Werte
	value 				=	Value_Pfeil;

	visual 				=	"ItRw_Arrow.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "";					COUNT[0]	= ;
//	TEXT[1]				= "";					COUNT[1]	= ;
//	TEXT[2]				= NAME_Damage;			COUNT[2]	= damageTotal;
//	TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
//	TEXT[4]				= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


instance ItRw_Addon_MagicBow (C_Item)
{
	name 				=	"Magischer Bogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_MagicBow;

	damageTotal			=	Damage_MagicBow;
	damagetype			=	DAM_MAGIC;
	munition			=	ItRw_Addon_MagicArrow;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_BOW";

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_MagicBow;
	visual 				=	"ItRw_Bow_H_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


instance ItRw_Addon_FireBow (C_Item)
{
	name 				=	"Feuerbogen";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_BOW;
	material 			=	MAT_WOOD;

	value 				=	Value_FireBow;

	damageTotal			=	Damage_FireBow;
	damagetype			=	DAM_MAGIC;
	munition			=	ItRw_Addon_FireArrow;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_FIREBOW";

	cond_atr[2]   		= 	ATR_DEXTERITY;
	cond_value[2]  		= 	Condition_FireBow;
	visual 				=	"ItRw_Bow_H_04.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


////////////////////////////////////////////////////////////////////////////////

instance ItRw_Addon_MagicBolt (C_Item)
{
	name 				=	"Magischer Bolzen";

	mainflag 			=	ITEM_KAT_MUN;
	flags 				=	ITEM_CROSSBOW | ITEM_MULTI;

	value 				=	Value_Bolzen;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_BOLT";

	visual 				=	"ItRw_Bolt.3ds";
	material 			=	MAT_WOOD;

	description			= name;
//	TEXT[0]				= "";					COUNT[0]	= ;
//	TEXT[1]				= "";					COUNT[1]	= ;
//	TEXT[2]				= NAME_Damage;			COUNT[2]	= damageTotal;
//	TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
//	TEXT[4]				= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};

instance ItRw_Addon_MagicCrossbow (C_Item)
{
	name 				=	"Magische Armbrust";

	mainflag 			=	ITEM_KAT_FF;
	flags 				=	ITEM_CROSSBOW;
	material 			=	MAT_WOOD;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_CROSSBOW";

	value 				=	Value_MagicCrossbow;

	damageTotal			= 	Damage_MagicCrossbow;
	damagetype			=	DAM_MAGIC;
	munition			=	ItRw_Addon_MagicBolt;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_MagicCrossbow;
	visual 				=	"ItRw_Crossbow_H_01.mms";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

instance ITMW_2H_TIMESWORD(C_Item)
{
	name = "Schwert der Zeit";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 140;
	damagetype = DAM_BLUNT;
	range = Range_Stab03;
	on_equip = matrix;
	on_unequip = nomatrix;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMW2htimesword.3DS";
	effect = "SPELLFX_MAGESTAFF3";
	description = "Schwert der Zeit";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Eine selbstgeschmiedete Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_1H_TIMESWORD(C_Item)
{
	name = "Schwert der Zeit";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 2500;
	damageTotal = 120;
	damagetype = DAM_BLUNT;
	range = 60;
	on_equip = matrix;
	on_unequip = nomatrix;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMW1htimesword.3DS";
	effect = "SPELLFX_MAGESTAFF3";
	description = "Schwert der Zeit";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Eine selbsgeschmiedete Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};


func void matrix()
{
	if (Npc_IsPlayer (self))
	{
		Wld_StopEffect ("SLOW_MOTION2");
		Wld_PlayEffect ("SLOW_MOTION2", self, self, 0, 0, 0, FALSE);
	};
};

func void nomatrix()
{
	if (Npc_IsPlayer (self))
	{
		Wld_StopEffect ("SLOW_MOTION2");
	};
};


instance ITMW_1H_BLUTSCHWERT(C_Item)
{
	name = "Blutschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 120;
	damageTotal = 80;
	damagetype = DAM_BLUNT;
	range = 70;
	on_equip = mehr_hp1;
	on_unequip = altes_hp1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	visual = "ItMw_050_1H_Sword_05.3ds";
	description = "Blutschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Die Waffe eines Vampirs";
	text[5] = NAME_Value;
	count[5] = value;
};


func void mehr_hp1()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 60;
};

func void altes_hp1()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 60;
	if (self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITMW_1H_BLUTDEGEN(C_Item)
{
	name = "Blutdegen";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 140;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 70;
	on_equip = mehr_hp1;
	on_unequip = altes_hp1;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 45;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[4] = "Der Degen eines Vampirs";
	text[5] = NAME_Value;
	count[5] = value;
};


var int code;

instance ITMW_TODESAXT(C_Item)
{
	name = "Die Axt des Todes";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = 550;
	damageTotal = 100;
	damagetype = DAM_EDGE;
	range = 100;
	effect = "SPELLFX_FIRESWORDBLACK";
	on_equip = wiederbelebung;
	on_unequip = wiederbelebungzurueck;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 90;
	visual = "ItMw_060_2H_Axe_Heavy_01.3ds";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Diese Axt beeinflusst den Tod";
	text[5] = NAME_Value;
	count[5] = value;
};


func void wiederbelebung()
{
	TODESAXT = TRUE;
};

func void wiederbelebungzurueck()
{
	TODESAXT = FALSE;
};


instance ITMW_FIRESWORD(C_Item)
{
	name = "Feuerschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 130;
	damagetype = DAM_BLUNT;
	range = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	visual = "ItMw_055_2H_Sword_Light_05.3ds";
	effect = "SPELLFX_FIRESWORD";
	description = "Feuerschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ICESWORD(C_Item)
{
	name = "Eisschwert";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 120;
	damagetype = DAM_BLUNT;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 80;
	visual = "itmwicesword.3ds";
	effect = "SPELLFX_MAGESTAFF5";
	description = "Eisschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_VAMPIRSCHWERT(C_Item)
{
	name = "Vampirklinge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 500;
	damageTotal = 200;
	damagetype = DAM_BLUNT;
	range = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 100;
	visual = "ItMw_055_2H_Sword_Light_05.3ds";
	effect = "SPELLFX_WEAKGLIMMER_RED";
	on_equip = vammpr;
	on_unequip = vammprno;
	description = "Vampirklinge";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};


func void vammpr()
{
	if (Npc_IsPlayer(self))
	{
		VAMMA = TRUE;
	};
};

func void vammprno()
{
	if (Npc_IsPlayer(self))
	{
		VAMMA = FALSE;
	};
};

INSTANCE ItMW_MOD_SCHWERT1 (C_Item)
{	
	name 				=	"Schattentöter";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	10000;

	damageTotal  		= 	200;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;		
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsmesser;
	visual 				=	"FANTASYSCHWERT.3DS";

	description			=   name;

TEXT[1]				= "Eine uralte legendäre Waffe";	
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



INSTANCE ItMW_MOD_Sense1 (C_Item)
{	
	name 				=	"Lichtvertreiber";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	10000;

	damageTotal  		= 	200;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;		
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsmesser;
	visual 				=	"SENSE.3DS";

	description			=   name;

TEXT[1]				= "ItMw_012_1H_Scythe_01.3ds";	
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_MOD_CHANGER1 (C_Item)
{	
	name 				=	"Seelenfänger";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsmesser;		
	
	on_equip = Equip_Changer_01;
        on_unequip = UnEquip_Changer_01;

	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsmesser;
	visual 				=	"DarkDagger.3DS";

	description			=   name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_Changer_01()
{
Npc_GetInvItem (self, ItMW_MOD_CHANGER1 ); //füllt die globale Variable 'item' mit dem entsprechendem Bogen

if (Npc_HasItems (hero, ItMi_MOD_Darkpearl) >= 1) // Hier wird abgefragt, ob man den Alternativen Munitionstyp dabei hat
{
item.effect = "SPELLFX_FIREBOW"; //Falls ja, wird hier der munition flag auf die entsprechende Munition gesetzt ('item' wurde ja oben bereits "befüllt")
Wld_PlayEffect("spellFX_Innoseye",  self, self, 0, 0, 0, FALSE );
Wld_PlayEffect("spellFX_LIGHTSTAR_RED",  self, self, 0, 0, 0, FALSE );
Snd_Play ("DEM_Warn");
}
else
{
item.visual = "DarkDagger.3DS"; //Falls nein, wird einfach wieder der normale Pfeil gesetzt
};
};

FUNC VOID UnEquip_Changer_01() //In dieser Funktion muss hierfür nichts stehen, aber sie kann für diverse andere Dinge verwendet werden
{
Npc_GetInvItem (self, ItMW_MOD_CHANGER1 ); //füllt die globale Variable 'item' mit dem entsprechendem Bogen
if (Npc_HasItems (hero, ItMi_MOD_Darkpearl) >= 1) // Hier wird abgefragt, ob man den Alternativen Munitionstyp dabei hat

{
item.effect = "SPELLFX_FIRESWORDBLACK"; //Falls nein, wird einfach wieder der normale Pfeil gesetzt


};
};
