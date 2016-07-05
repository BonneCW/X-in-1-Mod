INSTANCE  ItMi_TempelTorKey_wrong (C_ITEM)
{	
	name 				=	"Steintafel des Quarhodron";
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION|ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_StonePlate_Read_06.3ds";	 
	material 			=	MAT_STONE;
	scemeName			=	"MAP";
	on_state[0]			=	Use_TempelTorKey_wrong;

	TEXT[2]		= "Der Schlüssel zum Tempel Adanos.";
	TEXT[3]		= "Die Tafel ist beschädigt";

};
func void Use_TempelTorKey_wrong ()
{	
B_LogEntry (VAM_KEY,"Die Tafel, die ich von Quahodron erhalten habe, ist beschädigt. Vielleicht kann aber Drusus etwas damit anfangen.");
	var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "Maya_Stoneplate_03.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, ""					);
					Doc_PrintLine	( nDocID,  0, ""					);
					//Doc_PrintLines	( nDocID,  0, "  Eligam Shameris"					); 
				
					//Doc_PrintLine	( nDocID,  0, "  Jhehedra Akhantar"
					Doc_PrintLine	( nDocID,  0, "  Jhehedra A.(!,o; "					); 
 
 					Doc_Show		( nDocID ); 
};

INSTANCE ItWr_Translation		(C_Item)
{
	name 				=	"Übersetzung";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=   Use_translat;
	scemeName			=	"MAP";
	description			=  	"Übersetzung";
	
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";

	
};
func void Use_translat ()
{   
 
	var int nDocID;
		
		nDocID = 	Doc_Create		();
					Doc_SetPages	(nDocID,  1);
					Doc_SetPage		(nDocID,  0, "letters.TGA", 0);
					Doc_SetFont		(nDocID, -1, FONT_Book);
					Doc_SetMargins	(nDocID, -1, 50, 50, 50, 50, 1);
					Doc_PrintLine	(nDocID,  0, ""													);
								
					Doc_PrintLines	(nDocID,  0, "Geehrter Talog"								);
					Doc_PrintLines	(nDocID,  0, ""													);
					Doc_PrintLines	(nDocID,  0, "Ich muss dir für das Drachengebäu-Rezept danken. Enfach nur 3 Piolen Drachenblut, mit etwas Snapperkraut und Sumpfhaizähnen mischen");
					Doc_PrintLines	(nDocID,  0, "und schon erhält man einen Trank der ungeheure Kräfte verleiht.");
					Doc_PrintLines	(nDocID,  0, " Leider ist es ziemlich schwierig die Drachen dafür aufzutreiben.");
					Doc_PrintLine	(nDocID,  0, ""							);
					Doc_PrintLine	(nDocID,  0, "Mit blutigen Grüßen"													);
					Doc_PrintLine	(nDocID,  0, "    Sadrax"						);
					Doc_Show		(nDocID);
		SC_learn_BLooddrink = TRUE;
};