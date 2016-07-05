//**********************************************************************************
//	StandardBrief
//**********************************************************************************

INSTANCE StandardBrief		(C_Item)
{
	name 				=	"Brief";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseStandardBrief;
	scemeName			=	"MAP";
	description			= 	"StandardBrief";
};
func void UseStandardBrief ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, "StandardBrief"					);
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla"					);

					Doc_Show		( nDocID );

};

//**********************************************************************************
//	StandardBuch
//**********************************************************************************

INSTANCE StandardBuch (C_ITEM)
{
	name 					=	"StandardBuch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	100;

	visual 					=	"ItWr_Book_02_05.3ds";  					//BUCH VARIATIONEN: ItWr_Book_01.3DS , ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"StandardBuch";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseStandardBuch;
};

	FUNC VOID UseStandardBuch()
	{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Brown_L.tga"  , 0 	); // VARIATIONEN: BOOK_BROWN_L.tga , BOOK_MAGE_L.tga , BOOK_RED_L.tga
					Doc_SetPage 	( nDocID,  1, "Book_Brown_R.tga" , 0	); // VARIATIONEN: BOOK_BROWN_R.tga , BOOK_MAGE_R.tga , BOOK_RED_R.tga

					//1.Seite

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "StandardBuch Seite 1"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla"					);
					//Absatz
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  0, "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");

					//2.Seite
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "StandardBuch Seite 2"	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla"	);
					Doc_PrintLine	( nDocID,  1, ""					);
					//Absatz
					Doc_PrintLines	( nDocID,  1, "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla");
					Doc_Show		( nDocID );
};



//////////////////////////////////////////////////////////////////////////////
//
//	MAPS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_NewWorld (C_Item)
{
	name 		= "Landkarte Khorinis";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 250;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_NewWorld()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_NewWorld);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -28000, 50500, 95500, -42500);
					Doc_Show			(Document);
	};

instance ItWr_Map_NewWorld_City (C_Item)
{
	name 		= "Stadtkarte Khorinis";  // 

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 50;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_NewWorld_City;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_NewWorld_City()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_NewWorld_City);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_NewWorld_City.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "NewWorld\NewWorld.zen");
					Doc_SetLevelCoords	(Document, -6900, 11800, 21600, -9400);
					Doc_Show			(Document);
	};

instance ItWr_Map_OldWorld (C_Item)
{
	name 		= "Landkarte Minental";

	mainflag 	= ITEM_KAT_DOCS;
	flags 		= ITEM_MISSION|ITEM_MULTI;

	value 		= 350;

	visual 		= "ItWr_Map_01.3DS";
	material 	= MAT_LEATHER;

	scemeName	= "MAP";
	on_state[0]	= Use_Map_OldWorld;

	description	= name;
	TEXT[0]		= "";
	TEXT[1]		= "";
	TEXT[5]		= NAME_Value;
	COUNT[5]	= value;
};

	func void Use_Map_OldWorld()
	{
		if (Npc_IsPlayer(self))
		{
			B_SetPlayerMap(ItWr_Map_OldWorld);
		};

		var int Document;
		Document =	Doc_CreateMap		();
					Doc_SetPages		(Document, 1);
					Doc_SetPage 		(Document, 0, "Map_OldWorld.tga", TRUE);  // TRUE = scale to fullscreen
					Doc_SetLevel		(Document, "OldWorld\OldWorld.zen");
					Doc_SetLevelCoords	(Document, -78500, 47500, 54000, -53000);
					Doc_Show			(Document);
	};

var int Lerne_Einhand;
var int Lerne_Zweihand;
//---------------------------------------------------------------------------------------------------------------------------
//						Einhandkampf
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_EinhandBuch (C_ITEM)
{
	name 					=	"Kampfkunst";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_04.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Die südländische Verteidigung";
	
	TEXT[2] 				=  "Ein Lehrbuch zum Kampf";
	TEXT[3] 				=  "mit Einhandwaffen";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseEinhandBuch;
};

	FUNC VOID UseEinhandBuch()
	{
		if (Lerne_Einhand == FALSE)
		{
			B_RaiseFightTalent (self, NPC_TALENT_1H, 5);
			Print (PRINT_Learn1H);
			Lerne_Einhand = TRUE;
			Snd_Play("Levelup");
		};
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								
					Doc_SetPages	( nDocID,  2 );                        

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

					

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Die südländische Verteidigung"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Der Südländer kämpft nun mehr weniger mit der Kraft des Nordmannes, als mit seiner Behendigkeit. Denn im heißen Klima seiner Heimat, bevorzugt er leichte Rüstungen welche ihm mehr Beweglichkeit erlauben. Durch diesen Umstand hat der Südländer einen ihm angepassten Kampstil entwickelt, der sich auf fundamentale Weise von den uns bekannten unterscheidet. "					);
					
					

					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Das wohl bekannnteste Manöver des Südländers ist wohl der einarmige Block mit rückwärtigen Ausfallschritt. Durch den Ausfallschritt gelingt es ihm, die Kraft des gegnerischen Angriffes zu mildern und so eine hervorragende Ausgangsposition zu erlangen, die zum direkten Gegenangriff genutzt werden kann."	);
					Doc_PrintLine	( nDocID,  1, ""					);
					
					
					Doc_Show		( nDocID );
};
//---------------------------------------------------------------------------------------------------------------------------
//						Zweihandkampf
//---------------------------------------------------------------------------------------------------------------------------
INSTANCE ItWr_ZweihandBuch (C_ITEM)
{
	name 					=	"Kampftaktik ";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	5000;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Der Doppelblock";
	
	TEXT[2] 				=  "Ein Lehrbuch zum Kampf";
	TEXT[3] 				=  "mit Zweihandwaffen";
	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseZweihandBuch;
};

	FUNC VOID UseZweihandBuch()
	{
		if (Lerne_Zweihand == FALSE)
		{
			B_RaiseFightTalent (self, NPC_TALENT_2H, 5);
			Print (PRINT_Learn2H);
			Lerne_Zweihand = TRUE;
			Snd_Play("Levelup");
		};
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Der Doppelblock"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Das Abblocken der gegnerischen Klinge, mit einer beidhändig geführten Waffe, kann bei ausreichender Kraft dazu genutzt werden, sämtlichen Schwung des Angriffes aufzuhalten und den Gegner zu zwingen seien begonnene Kombination abrupt zu beenden. "					);
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Die daraufhin meist folgende Stagnation des Gegners sollte entschlossen genutzt werden, um selbst die Initiative zu ergreifen und den Gegner mit gekonnten Schlägen in die Niederlage zu treiben.    "	);
					
					Doc_Show		( nDocID );
};


INSTANCE ItWr_Urkunde		(C_Item)
{
  name 				=	"Urkunde";
  
  mainflag 			=	ITEM_KAT_DOCS;
  flags = ITEM_MISSION;
  
  value 				=	0;
  
  visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
  material 			=	MAT_LEATHER;
  on_state[0]			=   UseUrkunde;
  scemeName			=	"MAP";
  description			= 	"Eine Abstammungsurkunde der Erzbarone";
};

func void UseUrkunde ()
{
  var int nDocID;
  
  nDocID = Doc_Create ();// DocManager
  Doc_SetPages(nDocID,1);//wieviel Pages
  Doc_SetPage(nDocID, 0, "letters.TGA", 0);
  Doc_SetFont(nDocID, 0, FONT_BookHeadline);// -1 -> all pages
  Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);// 0 -> margins are in pixels
  Doc_PrintLines(nDocID, 0, "Erzbarone - Abstammung");
  Doc_SetFont(nDocID, 0, FONT_Book); 	// -1 -> all pages
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Hiermit bestätige ich, Erzbaron Garingor IX, das Mud, mein einziger Sohn, meinen gesamten Besitz, d.h. die Insel Khorinis inklusive dem Minental und des dort gefundenen Erzes, erben soll.");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Garingor IX, Erzbaron und treuer Diener seiner Majestät des Königs Rhobar I");
  Doc_Show(nDocID);
};

//Ernennung zum Stadthalten, von Mud
INSTANCE ItWr_Stadthalter	(C_Item)
{
  name 				=	"Ernennungs-Urkunde";
  
  mainflag 			=	ITEM_KAT_DOCS;
  flags = ITEM_MISSION;
  
  value = 0;
  
  visual = "ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
  material = MAT_LEATHER;
  on_state[0] = UseStadthalter;
  scemeName = "MAP";
  description =	"Ernennungsurkunde zum Statthalter";
};

func void UseStadthalter ()
{
  var int nDocID;
  
  nDocID = Doc_Create ();// DocManager
  Doc_SetPages(nDocID,1);//wieviel Pages
  Doc_SetPage(nDocID, 0, "letters.TGA", 0);
  Doc_SetFont(nDocID, 0, FONT_BookHeadline);// -1 -> all pages
  Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);// 0 -> margins are in pixels
  Doc_PrintLines(nDocID, 0, "Stadthalterernennung");
  Doc_SetFont(nDocID, 0, FONT_Book); 	// -1 -> all pages
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Vom heutigen Tage an, solange es mir beliebt, soll der Besitzer dieser Urkunde mein Statthalter in der Stadt Khorines sein. Sein Wort sei in meinem Namen Befehl!");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Mud I, Erzbaron und treuer Diener seiner Majestät des Königs Rhobar I");
  Doc_Show(nDocID);
};

//Ernennung zum Stadthalten, von Garond
INSTANCE ItWr_Stadthalter2	(C_Item)
{
  name 				=	"Ernennungs-Urkunde";
  
  mainflag 			=	ITEM_KAT_DOCS;
  flags = ITEM_MISSION;
  
  value = 0;
  
  visual = "ItWr_Scroll_02.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
  material = MAT_LEATHER;
  on_state[0] = UseStadthalter2;
  scemeName = "MAP";
  description =	"Ernennungsurkunde zum Statthalter";
};

func void UseStadthalter2 ()
{
  var int nDocID;
  
  nDocID = Doc_Create ();// DocManager
  Doc_SetPages(nDocID,1);//wieviel Pages
  Doc_SetPage(nDocID, 0, "letters.TGA", 0);
  Doc_SetFont(nDocID, 0, FONT_BookHeadline);// -1 -> all pages
  Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);// 0 -> margins are in pixels
  Doc_PrintLines(nDocID, 0, "Stadthalterernennung");
  Doc_SetFont(nDocID, 0, FONT_Book); 	// -1 -> all pages
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Vom heutigen Tage an, solange es mir beliebt, soll der Besitzer dieser Urkunde mein Statthalter in der Stadt Khorines sein. Sein Wort sei in meinem Namen Befehl!");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Mud I, Erzbaron und treuer Diener seiner Majestät des Königs Rhobar I");
  Doc_PrintLine(nDocID, 0,"");
  Doc_PrintLines(nDocID, 0, "Ich habe die Rechtmäßigkeit des Erzbarons bestätigt und beglaubige hiermit diese Urkunde.");
  Doc_PrintLines(nDocID, 0, "Garond, Paladin des Königs und Streiter Innos, Kommandant der Expedition im Minental");
  Doc_Show(nDocID);
};

INSTANCE ItWr_CreaturePatch (C_Item)
{
  name = "Beschwörungen für Fortgeschrittene";
  mainflag = ITEM_KAT_DOCS;
  flags = ITEM_MISSION;
  value = 0;
  visual = "ItWr_Book_02_05.3ds";
  material = MAT_LEATHER;
  on_state[0] = UseCreaturePatch;
  scemeName = "MAP";
  description = "Beschwörungen für Fortgeschrittene von Mon. Ster";
};

func void UseCreaturePatch ()
{
  var int nDocID;
  nDocID = Doc_Create ();
  Doc_SetPages(nDocID,2);
  Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
  Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);
  Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1);
  Doc_SetFont(nDocID, 0, FONT_BookHeadline);
  Doc_PrintLine(nDocID, 0, "");
  Doc_PrintLines(nDocID, 0, "Beschwörerkunst");
  Doc_SetFont(nDocID, 0, FONT_Book);
  Doc_PrintLine(nDocID, 0, "");
  Doc_PrintLines(nDocID, 0, "Dem einfachen Magnus mag es reichen, wenn er in der Lage ist, Wesen anderer sphärischer Zustände zu rufen und für kurze Zeit in unserer Welt zu halten, doch die wahren Meister dieses Fachs können die stoffliche Erscheinung nahezu ewig in dieser Welt halten.");
  Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
  Doc_SetFont(nDocID, 1, FONT_Book);
  Doc_PrintLine(nDocID, 1, "");
  Doc_PrintLines(nDocID, 1, "Ich habe die wichtigsten Grundregeln in diesem Buch vermerkt. Außerdem habe ich, um dem Laien zu helfen, ein wenige Magische Energie in dieses Buch gegeben, so dass es dem Besitzer den Umgang mit diesem Stoff erleichtert.");
  Doc_Show(nDocID);
};

INSTANCE ItWr_Regenerate (C_Item)
{
  name = "Meditationstechniken";
  mainflag = ITEM_KAT_DOCS;
  flags = ITEM_MISSION;
  value = 0;
  visual = "ItWr_Book_02_05.3ds";
  material = MAT_LEATHER;
  on_state[0] = UseRegenerate;
  scemeName = "MAP";
  description = "Die Kunst der Regeneration, ein Lehrbuch für angehende Magier.";
};

func void UseRegenerate ()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == FALSE)
    	{
      		if (hero.lp>4)
		{
	  		hero.lp = hero.lp - 5;
	  		Npc_SetTalentSkill(hero, NPC_TALENT_REGENERATE, 1);
	  		Npc_SetTalentSkill(hero, NPC_TALENT_FIREMASTER, 1);

	  		if (hero.level<6)
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 10;
	      			hero.attribute[ATR_REGENERATEMANA] = 10;
	    		};
	  		if ((hero.level>5)&&(hero.level<11))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 8;
	      			hero.attribute[ATR_REGENERATEMANA] = 8;
	    		};
	  		if ((hero.level>10)&&(hero.level<21))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 6;
	      			hero.attribute[ATR_REGENERATEMANA] = 6;
	    		};
	  		if ((hero.level>20)&&(hero.level<31))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 4;
	      			hero.attribute[ATR_REGENERATEMANA] = 4;
	    		};
	  		if ((hero.level>30))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 2;
	      			hero.attribute[ATR_REGENERATEMANA] = 2;
	    		};

	  		PrintScreen("Regeneration gelernt", -1, -1, FONT_ScreenSmall, 10);
	  		Snd_Play("LevelUp");
		}
      		else
		{
	  		PrintScreen("Nicht genügend Lernpunkte (5)", -1, -1, FONT_ScreenSmall, 10);
		};
    	}
  	else
    	{
      		if (hero.lp>9)
		{
	  		if ((hero.level<6)&&(hero.attribute[ATR_REGENERATEHP] == 10))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 8;
	      			hero.attribute[ATR_REGENERATEMANA] = 8;
	      			hero.lp = hero.lp - 10;
	      			PrintScreen("Regeneration gemeistert", -1, -1, FONT_ScreenSmall, 10);
	      			Snd_Play("LevelUp");
	    		};
	  		if ((hero.level>5)&&(hero.level<11)&&(hero.attribute[ATR_REGENERATEHP] == 8))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 6;
	      			hero.attribute[ATR_REGENERATEMANA] = 6;
	      			hero.lp = hero.lp - 10;
	      			PrintScreen("Regeneration gemeistert", -1, -1, FONT_ScreenSmall, 10);
	      			Snd_Play("LevelUp");
	    		};
	  		if ((hero.level>10)&&(hero.level<21)&&(hero.attribute[ATR_REGENERATEHP] == 6))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 4;
	      			hero.attribute[ATR_REGENERATEMANA] = 4;
	      			hero.lp = hero.lp - 10;
	      			PrintScreen("Regeneration gemeistert", -1, -1, FONT_ScreenSmall, 10);
	      			Snd_Play("LevelUp");
	    		};
	  		if ((hero.level>20)&&(hero.level<31)&&(hero.attribute[ATR_REGENERATEHP] == 4))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 2;
	      			hero.attribute[ATR_REGENERATEMANA] = 2;
	     			hero.lp = hero.lp - 10;
	      			PrintScreen("Regeneration gemeistert", -1, -1, FONT_ScreenSmall, 10);
	      			Snd_Play("LevelUp");
	    		};
	  		if ((hero.level>30)&&(hero.attribute[ATR_REGENERATEHP] == 2))
	    		{
	      			hero.attribute[ATR_REGENERATEHP] = 1;
	      			hero.attribute[ATR_REGENERATEMANA] = 1;
	      			hero.lp = hero.lp - 10;
	      			PrintScreen("Regeneration gemeistert", -1, -1, FONT_ScreenSmall, 10);
	      			Snd_Play("LevelUp");
	    		};
		}
      		else
		{
	  		PrintScreen("Nicht genügend Lernpunkte (10)", -1, -1, FONT_ScreenSmall, 10);
		};
    	};
};


instance ITWR_TIMESWORD(C_Item)
{
	name = "Magische Schwerter - Band 1";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Magische Schwerter - Band 1";
	text[2] = "Ein Buch über magische";
	text[3] = "Schwerter";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usetimesword;
};


func void usetimesword()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Das Schwert der Zeit");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Legenden erzählen von einem mächtigen Schwert. Es war anscheinend komplett aus Schwarzem Erz gefertigt und ermöglichte dem Träger eine Beeinflussung der Zeit.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Die genaue Wirkung ist unbekannt, genauso die genaue Bauweise, Gelehrte vermuten, dass sich ein Schriftstück mit einer genauen Anleitung noch irgendwo auf Khorinis befindet.");
	Doc_Show (nDocID);
};


instance ITWR_VAMKLINGE(C_Item)
{
	name = "Die Vampirklinge";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Buch";
	text[2] = "Buch über die ";
	text[3] = "Vampirklinge";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usevampklinge;
};


func void usevampklinge()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Die Vampirklinge");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Die Vampirklinge ist ein magisches und mächtiges Schwert. In der Hand eines Vampirs ist sie die Zerstörung schlechthin. Doch diese Waffe hat auch einen Nachteil: Solange die Waffe angelegt ist, verbraucht sie in kurzen Abständen die Blutvorräte des Vampirs. Somit sollte man sie nur für kurze Zeit einsetzen.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Herstellung");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "2 Stück Stahl werden mit 3 Portionen Blut und einem Brocken Erz verarbeitet. Dabei ist darauf zu achten, dass die Klinge mit regelmäßigen präzisen Schlagen bearbeitet wird.");
	Doc_Show (nDocID);

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		SC_CAN_VAMPIRKLINGE = TRUE;
	};
};


instance ITWR_VAMPIRSET(C_Item)
{
	name = "Das Vampirset";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Buch";
	text[2] = "Buch über das ";
	text[3] = "Vampirset";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usevampsset;
};


func void usevampsset()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Das Vampirset");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Es gibt viele Legenden um mächtige Artefakte, eines von ihnen ist die Legende um das Vampirset. Es besteht aus 2 Ringen und einem Amulett. Einzeln getragen, haben sie keine Wirkung, aber gemeinsam entfesseln sie eine ungeheure magische Kraft.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Diese Kraft erlaubt es dem Vampir, sich unbedeckt im Sonnenlicht aufzuhalten, ohne zu verbrennen. Doch nachwievor ist die Existenz des Sets nicht gewiss.");
	Doc_Show (nDocID);
};


instance ITWR_VAMSCHWERT(C_Item)
{
	name = "Das Blutschwert";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Buch";
	text[2] = "Buch über das ";
	text[3] = "Blutschwert";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usevamschwert;
};


func void usevamschwert()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Das Blutschwert");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Das Blutschwert ist die perfekte Waffe für einen Vampir: Sie ist leich zu führen und trotzdem effektiv. Das besondere an der Waffe ist, dass bei jedem Schlag dem Gegner Leben abgesogen und auf den Träger transferiert wird.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Herstellung");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "1 Stückrohstahl wird mit 2 Portionen Blut übergossen und zu einem leichten Schwert bearbeitet. Natürlich kann ein kundiger Schmied daraus auch einen Degen fertigen.");
	Doc_Show (nDocID);

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		SC_CAN_VAMPIRSCHWERT = TRUE;
	};
};


instance ITWR_VAMLEGENDS(C_Item)
{
	name = "Vamirlegenden";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Buch";
	text[2] = "Buch über ";
	text[3] = "Vampirlegenden";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usevamlegends;
};


func void usevamlegends()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Vampirlegenden");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Legenden zufolge soll es Vampire gegeben haben, die ohne das Trinken von Blut überleben konnten: Sie waren frei von diesem Zwang. Doch es ist nicht geklärt wie sie das gemacht haben. Die einen vermuten Magie, die anderen Alchemie und wieder andere reine Willenskraft.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Trank des Blutes");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Ein altes Rezept zur Herstellung eines Trankes, der das Blut ersetzen kann ist uns erhalten:");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Um den Trank herzustellen muss man ein Feuerkraut und eine Blauflieder zerreiben und in etwas Milch geben.");
	Doc_Show (nDocID);

	if (SC_IST_EIN_VAMPIR == TRUE)
	{		
		SC_CAN_VAMPERSATZ = TRUE;
	};
};


instance ITWR_ELEMTARSWORDS(C_Item)
{
	name = "Magische Schwerter - Band 2";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Magische Schwerter - Band 2";
	text[2] = "Ein Buch über magische";
	text[3] = "Schwerter";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useelementarswords;
};


func void useelementarswords()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Das Feuerschwert");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Das Feuerschwert war einst im Besitz eines Hochrangigen Feldherrn. Es brannte ununterbrochen und ließ seine Genger in Flammen Aufgehen. Doch das Schwert ging nach einem Überfall der Orks verloren. ");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Das Eisschwert");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Eine Legende erzählt von einem Eisschwert, einer Magischen Waffe, die einst die vier mächtigsten Wassermagier erschufen. Die Waffe besteht aus Eis und lässt jeden der getroffen wird zu Eis erstarren. Doch leider ist nicht bekannt ob die Legende war ist.");
	Doc_Show (nDocID);
};


instance ITWR_SUMDRAGON(C_Item)
{
	name = "Drachen";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Drachen";
	text[2] = "Ein Buch über";
	text[3] = "Drachen";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usedragon;
};


func void usedragon()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Drachenbschwörung");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Viele glauben, Drachen wären ein Märchen, doch es gibt sie wirklich. Sie leben verborgen vor unseren Augen irgondwo da draußen.  Sie dienen Beliar und sind die Führer seiner Armeen.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Beschwörung");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "Nur ein sehr mächtiger Magier, der in den 6. Kreis aufgenommen wurde und die Beschwörungskunst beherrscht, ist in der Lage selber Drachen zu beschwören. Er kann sich die entsprechende Rune bauen, indem er 1 Drachenei, 1 Piole Drachenblut und 1 Drachenschuppe mit einem Runenstein verbindet.");
	Doc_Show (nDocID);

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		SC_CAN_BAUEN_DRAGONRUNE = TRUE;
	};
};


instance ITWR_WOERTERBUCH(C_Item)
{
	name = "Wörterbuch-Nordisch";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	description = "Wörterbuch-Nordisch";
	text[2] = "Ein Buch über die Sprache";
	text[3] = "Nordmars";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = usewbok;
};


func void usewbok()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Red_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Nordisch");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "Alkash     Bier");
	Doc_PrintLine (nDocID, 0, "antu       weise, alt");
	Doc_PrintLine (nDocID, 0, "ben        gut");
	Doc_PrintLine (nDocID, 0, "Contat     Haus");
	Doc_PrintLine (nDocID, 0, "dub        Baum");
	Doc_PrintLine (nDocID, 0, "et         und");
	Doc_PrintLine (nDocID, 0, "esta       erlangen");
	Doc_PrintLine (nDocID, 0, "fiza       fern");
	Doc_PrintLine (nDocID, 0, "Foral      Werk, Kunst");
	Doc_PrintLine (nDocID, 0, "Garsan     Ort, Stelle");
	Doc_PrintLine (nDocID, 0, "Gatai      Schiff");
	Doc_PrintLine (nDocID, 0, "gax        Tier");
	Doc_PrintLine (nDocID, 0, "gede       trinken");
	Doc_PrintLine (nDocID, 0, "gi         ist");
	Doc_PrintLine (nDocID, 0, "Herkol     Anführer");
	Doc_PrintLine (nDocID, 0, "Heydu      Hallo");
	Doc_PrintLine (nDocID, 0, "hota       wollen");
	Doc_PrintLine (nDocID, 0, "i      diese(r, s)");
	Doc_PrintLine (nDocID, 0, "invi       Suchen, fragen");
	Doc_PrintLine (nDocID, 0, "Jaratas    Musik, Spaß	");
	Doc_PrintLine (nDocID, 0, "Junak      Baum");
	Doc_PrintLine (nDocID, 0, "Landok     Berg");
	Doc_PrintLine (nDocID, 0, "latai      zwei");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "   ");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "      ");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "lombi      warten, denken");
	Doc_PrintLine (nDocID, 1, "Mag        Mann, Mensch");
	Doc_PrintLine (nDocID, 1, "mosa       Bild");
	Doc_PrintLine (nDocID, 1, "neri       Holz");
	Doc_PrintLine (nDocID, 1, "Neska      Macht");
	Doc_PrintLine (nDocID, 1, "Olar       Stein");
	Doc_PrintLine (nDocID, 1, "pla        stellen");
	Doc_PrintLine (nDocID, 1, "Ralok      Spruch, Segen");
	Doc_PrintLine (nDocID, 1, "Reko       Fluss");
	Doc_PrintLine (nDocID, 1, "sholat     kaufen");
	Doc_PrintLine (nDocID, 1, "siln       stark");
	Doc_PrintLine (nDocID, 1, "Soraka     Frau");
	Doc_PrintLine (nDocID, 1, "sto        Hundert");
	Doc_PrintLine (nDocID, 1, "swatri     sehen");
	Doc_PrintLine (nDocID, 1, "sweta      heilig");
	Doc_PrintLine (nDocID, 1, "tra        zwischen");
	Doc_PrintLine (nDocID, 1, "uri        benutzen");
	Doc_PrintLine (nDocID, 1, "Vatas      Leben, Geburt");
	Doc_PrintLine (nDocID, 1, "ve         treffen");
	Doc_PrintLine (nDocID, 1, "Werata     Symbol, Statue");
	Doc_PrintLine (nDocID, 1, "Zakon      Recht");
	Doc_PrintLines (nDocID, 1, " ");
	Doc_Show (nDocID);
};


var int onetimea1;
var int onetimea2;
var int onetimea3;
var int onetimea4;
var int onetimea5;
var int onetimea6;

instance ANTROX_1(C_Item)
{
	name = "Antrox";
	mainflag = ITEM_KAT_POTIONS;
	flags = 0;
	value = 200;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemeName = "MAP";
	effect = "SPELLFX_WEAKGLIMMER_RED";
	description = "Buch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useantrox_1;
};


func void useantrox_1()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Antrox");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 0, "Ich strandete auf dieser Insel. Nur ich überlebte. Meine Begleiter fanden dort ein nasses Grab.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_Show (nDocID);
	if (ONETIMEA1 == FALSE)
	{
		Wld_InsertItem (antrox_2, "FP_ANTROX_1");
		ONETIMEA1 = TRUE;
	};
};


instance ANTROX_2(C_Item)
{
	name = "Antrox";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	scemeName = "MAP";
	description = "Buch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useantrox_2;
};


func void useantrox_2()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Antrox");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 0, "Das Licht brannte nicht. doch die Aussicht war überwältigend");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_Show (nDocID);
	if (ONETIMEA2 == FALSE)
	{
		Wld_InsertItem (antrox_3, "NW_LIGHTHOUSE_IN_18");
		ONETIMEA2 = TRUE;
	};
};


instance ANTROX_3(C_Item)
{
	name = "Antrox";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	scemeName = "MAP";
	description = "Buch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useantrox_3;
};


func void useantrox_3()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Antrox");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 0, "Ein Relikt längst vergangener Zeiten. Doch der Himmel war verdeckt.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_Show (nDocID);
	if (ONETIMEA3 == FALSE)
	{
		Wld_InsertItem (antrox_4, "NW_FOREST_PATH_62_ORNA");
		ONETIMEA3 = TRUE;
	};
};


instance ANTROX_4(C_Item)
{
	name = "Antrox";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	scemeName = "MAP";
	description = "Buch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useantrox_4;
};


func void useantrox_4()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Antrox");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 0, "Hier am Zentrum liegen reiche Leute gut geschützt.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_Show (nDocID);
	if (ONETIMEA4 == FALSE)
	{
		Wld_InsertItem (antrox_5, "NW_FARM2_TAVERNCAVE1_02");
		ONETIMEA4 = TRUE;
	};
};


instance ANTROX_5(C_Item)
{
	name = "Antrox";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	scemeName = "MAP";
	description = "Buch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useantrox_5;
};


func void useantrox_5()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Antrox");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 0, "Das Wasser bringt leben. Doch es trennt die Ufer.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_Show (nDocID);
	if (ONETIMEA5 == FALSE)
	{
		Wld_InsertItem (antrox_6, "FP_NW_ITEM_TROLL_03");
		ONETIMEA5 = TRUE;
	};
};


instance ANTROX_6(C_Item)
{
	name = "Antrox";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	effect = "SPELLFX_WEAKGLIMMER_RED";
	scemeName = "MAP";
	description = "Buch";
	text[5] = NAME_Value;
	count[5] = value;
	on_state[0] = useantrox_6;
};


func void useantrox_6()
{
	var int nDocID;
	nDocID = Doc_Create ();
	Doc_SetPages (nDocID, 2);
	Doc_SetPage (nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage (nDocID, 1, "Book_Brown_R.tga", 0);
	Doc_SetMargins (nDocID, 0, 275, 20, 30, 20, 1);
	Doc_SetFont (nDocID, 0, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLines (nDocID, 0, "Antrox");
	Doc_SetFont (nDocID, 0, FONT_Book);
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 0, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 0, "Die 5 blauen Lichtsäulen waren das Letzte, was ich als Lebender sah.");
	Doc_SetMargins (nDocID, -1, 30, 20, 275, 20, 1);
	Doc_SetFont (nDocID, 1, FONT_BookHeadline);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_SetFont (nDocID, 1, FONT_Book);
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_PrintLine (nDocID, 1, "");
	Doc_PrintLines (nDocID, 1, "");
	Doc_Show (nDocID);
	if (ONETIMEA6 == FALSE)
	{
		Wld_InsertNpc (antrox, "NW_MAGECAVE_RUNE");
		ONETIMEA6 = TRUE;
	};
};


INSTANCE ItWr_UBuch1 (C_ITEM)
{
	name 					=	"Ein altes Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	10;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Ein sehr altes Buch über Untote";
	
	TEXT[2] 				=  "Das scheint der erste Band zu sein";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseUBuch1;
};

	FUNC VOID UseUBuch1()
	{
		
		
			
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Das Untoten-Set"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "In einer längst vergangenen Zeit fürchteten die Menschen Angriffe der Untoten. Es waren nicht jene seelenlosen Exemplare aus heutiger Zeit sonder Wesen mit einem Bewusstsein. Sie verbrachten auch nicht ihr gesamtes Dasein in Höhlen und Grabstätten , nein sie waren eine zivilisierte Kultur. Jedoch führten sie Krieg gegen die Menschen."					);
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Doch eines Tages erschien ein Mann ohne Namen. Er trug 3 geweihte Artefakte die allen Untoten den Tod brachten. Der Namenlose tötete im Alleingang annähernd sämtliche Untote. Die die Überlebten trauten sich nie wieder aus ihren Wäldern und Höhlen heraus und verloren sämtliches Bewusstsein. Diese Wesen sind die Untoten wie wir sie heute kennen."	);
					
					Doc_Show		( nDocID );
};


INSTANCE ItWr_UBuch2 (C_ITEM)
{
	name 					=	"Ein altes Buch";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	10;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Ein sehr altes Buch über Untote";
	
	TEXT[2] 				=  "Das scheint der zweite Band zu sein";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseUBuch2;
};

	FUNC VOID UseUBuch2()
	{
		
		
			
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Das Untoten-Set"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Doch auch besagter Held starb unter der grossen Anstrengung. Sein Leichnahm wurde unter Khorinis begraben wo später die Hafenstadt gebaut wurde. Allerdings waren die Artefakte damals schon verschwunden. Man vermutet dass die Überlebenden Untoten sich ihrer bemächtigt haben ohne um ihre Kraft bescheid zu wissen."					);
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "  Augenzeugenberichten zu folge flohen die Untoten zu einer Kapelle in der Nähe des Hofes des Grossbauern, zu einer Höhle in der Nähe der Wegkreuzung der Wege die zum Grossbauern und zum Kloster führen, in die Wälder Nahe des alten Leuchtturms und zu einer Höhle in der Nähe eines sehr seltsamen Steinkreises."	);
					
					Doc_Show		( nDocID );
};

INSTANCE ItWr_sBuch (C_ITEM)
{
	name 					=	"Tagebuch eines Schwarzmagiers";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	10;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Tagebuch eines Schwarzmagiers";
	
	TEXT[2] 				=  "";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseSBuch;
};

	FUNC VOID UseSBuch()
	{
		
		
			
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Saphiel"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "218. Tag: Ich habe es geschafft! Ich habe ein Schwert erschaffen welches einen Teil jedes Gottes in sich trägt! Ich habe es Saphiel getauft. Morge werde ich es testen. 219. Tag: Dieses Schwert ist ZU mächtig! Es absorbiert anscheinend die Kraft der getöteten Monster und transferiert sie auf den Träger. Jedoch scheint es einen Teil der Kraft zu behalten."					);
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Ich befürchte es könnte sich gegen den Träger richten wenn es zu viel Kraft gesammelt hat. 220. Tag: Ich habe versucht das Schwert zu zerstören, aber es ist weder zu zerbrechen noch einzuschmelzen. Ich habe daraufhin versucht ihm die göttliche Macht zu nehmen und dabei festgestellt, dass diese sich vervielfältigt hat. Ich war gerade so in der Lage ihm einen Teil zu entziehen."	);
					
					Doc_Show		( nDocID );
};

INSTANCE ItWr_sBuch2 (C_ITEM)
{
	name 					=	"Tagebuch eines Schwarzmagiers";

	mainflag 				=	ITEM_KAT_DOCS;
	flags 					=	0;

	value 					=	10;

	visual 					=	"ItWr_Book_02_03.3ds";  					
	material 				=	MAT_LEATHER;

	scemeName				=	"MAP";
	description				= 	"Tagebuch eines Schwarzmagiers";
	
	TEXT[2] 				=  "Anscheinend ist das das zweite Buch";

	TEXT[5]					= 	NAME_Value;
	COUNT[5]				= 	value;
	on_state[0]				=	UseSBuch2;
};

	FUNC VOID UseSBuch2()
	{
		
		
			
		
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;								// DocManager
					Doc_SetPages	( nDocID,  2 );                         //wieviel Pages

					Doc_SetPage 	( nDocID,  0, "Book_Red_L.tga"  , 0 	); 
					Doc_SetPage 	( nDocID,  1, "Book_Red_R.tga" , 0	); 

				

 					Doc_SetMargins	( nDocID,  0,  275, 20, 30, 20, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline	   			); 	// -1 -> all pages
 					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "Saphiel"	);
					Doc_SetFont 	( nDocID,  0, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLines	( nDocID,  0, "221. Tag: Ich habe die entzogene Kraft in 3 Dolche gebannt. Mit diesen Dolchen werde ich Saphiel sicher in einer abgelegenen Höhle in einem kleinen Tal nahe den Bergen versiegeln. Um das Siegel zu öffnen benötigt man die 3 Dolche. Daher habe ich mich darum gekümmert dass die Dolche sicher verwahrt sind."					);
					
					Doc_SetMargins	( nDocID, -1, 30, 20, 275, 20, 1   		);  //  0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
					Doc_SetFont 	( nDocID,  1, FONT_BookHeadline	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, ""	);
					Doc_SetFont 	( nDocID,  1, FONT_Book	   			); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLine	( nDocID,  1, ""					);
					Doc_PrintLines	( nDocID,  1, "Den Dolch der die Kraft Innos in sich trägt verbarg ich in der geheimen Bibliothek unter dem Kloster. Ausser mir kennt nur Xardas die alte Bibliothek. Den Adanos-Dolch brachte ich in die Kammern Adanos. Niemand ausser mir weiss, wie man dort unverletzt hinein kommt, geschweige denn, dass sie existieren. Den Dolch der die schwarze Magie Beliars in sich birgt brachte ich zum alten Steinkreis im Wald."	);
					
					Doc_Show		( nDocID );
};
