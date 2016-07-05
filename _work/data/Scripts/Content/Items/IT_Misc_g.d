INSTANCE ItMi_MFokus (C_Item)
{
	name 				=	"Mythril-Fokus";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Focus.3DS";
	material 			=	MAT_STONE;

	wear			= 	WEAR_EFFECT;
	effect			=	"SPELLFX_MANAPOTION"; 

	description			= 	name;

};

INSTANCE ItMi_MPacket(C_Item)
{
	name 				=	"Mythril-Päckchen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_ORESTEEL (C_Item)
{
	name 				=	"Erzstahl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRaw;

	visual 				=	"ItMiSwordraw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				=	NAME_Value;	
	COUNT[5]			= 	value;
};