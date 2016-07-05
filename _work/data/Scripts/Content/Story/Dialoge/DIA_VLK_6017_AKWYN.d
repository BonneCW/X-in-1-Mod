INSTANCE DIA_Vlk_6017_AKWYN_Exit (C_Info)
{
    npc         = Vlk_6017_Akwyn;
    nr          = 999;
    condition   = DIA_Vlk_6017_AKWYN_Exit_condition;
    information = DIA_Vlk_6017_AKWYN_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};
FUNC INT DIA_Vlk_6017_akwyn_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vlk_6017_akwyn_Exit_info ()
{
    AI_StopProcessInfos(self);
};


INSTANCE DIA_Vlk_6017_akwyn_hiduei (C_Info)
{
    npc         = Vlk_6017_akwyn;
    nr          = 2;
    condition   = DIA_Vlk_6017_akwyn_hiduei_condition;
    information = DIA_Vlk_6017_Akwyn_hiduei_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hi.";
};

FUNC INT DIA_Vlk_6017_akwyn_hiduei_condition ()
{
    return TRUE;
};

FUNC VOID DIA_Vlk_6017_akwyn_hiduei_info ()
{
    AI_Output(hero,self,"DIA_Vlk_6017_akwyn_hiduei_15_0"); //Hi.
    AI_Output(self,hero,"DIA_Vlk_6017_akwyn_hiduei_15_1"); //Hallo.
    AI_Output(hero,self,"DIA_Vlk_6017_akwyn_hiduei_15_2"); //Was ist deine Aufgabe hier?
    AI_Output(self,hero,"DIA_Vlk_6017_akwyn_hiduei_15_3"); //Ich jage für die Gilde.
    AI_Output(hero,self,"DIA_Vlk_6017_akwyn_hiduei_15_4"); //Was jagst du denn?
    AI_Output(self,hero,"DIA_Vlk_6017_akwyn_hiduei_15_5"); //Wargs.
    AI_Output(self,hero,"DIA_Vlk_6017_akwyn_hiduei_15_6"); //Hier oben vom Plateu lassen sich die Biester, die sich zu nah ans Lager trauen, perfekt erledigen.
};

INSTANCE DIA_Vlk_6017_akwyn_RetonSchickt (C_Info)
{
	npc		= Vlk_6017_akwyn;
	nr		= 2;
	condition	= DIA_Vlk_6017_akwyn_RetonSchickt_condition;
	information	= DIA_Vlk_6017_Akwyn_RetonSchickt_info;
	permanent	= 0;
	important	= 0;
	description	= "Reton meinte, du wolltest mich sehen?";
};

FUNC INT DIA_Vlk_6017_akwyn_RetonSchickt_condition ()
{
	if (Npc_KnowsInfo(hero, DIA_Vlk_6017_akwyn_hiduei))
	&& (Npc_KnowsInfo(hero, DIA_kdw_6019_reton_OrcScoutDead))
	{
		return 1;
	};
};

FUNC VOID DIA_Vlk_6017_akwyn_RetonSchickt_info ()
{
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_RetonSchickt_15_00"); //Reton meinte, du wolltest mich sehen?
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_01"); //Ja, es gibt wirklich etwas, wobei du mir helfen könntest.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_02"); //Du kommst doch viel in der Welt herum, oder nicht?
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_RetonSchickt_15_03"); //Das könnte man so sagen.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_04"); //Wusste ich es doch. Dabei sind dir doch mit Sicherheit einige findige Jäger begegnet, die bereit waren, ihr Wissen mit dir zu teilen, nicht?
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_RetonSchickt_15_05"); //Worauf willst du hinaus?
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_06"); //Ganz einfach: Ich wüsste gern, wie man einem Schattenläufer das Horn abnimmt.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_07"); //Es gibt viele Händler, die für ein solches Horn eine hohe Summe bezahlen würden.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_08"); //Doch im Minental habe ich nur Wölfe und anderes kleines Getier gejagt, darum habe ich vom Ausnehmen der richtig großen Brocken absolut keine Ahnung.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_09"); //Außerdem kann ich hier momentan nicht weg, um mir einen Lehrer zu suchen, der mich diese Kunst lehrt.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_RetonSchickt_07_10"); //Darum würde ich dich bitten, dir das Herausschneiden beibringen zu lassen und es mir dann zu zeigen.
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_RetonSchickt_15_11"); //Ich werde sehen, was sich da machen lässt.

	B_LogEntry	(TOPIC_DGDH_SHADOWHORN, "Akwyn hat mich damit beauftragt, das Entfernen eines Schattenläuferhornes zu lernen und es ihm beizubringen. Jetzt muss ich erstmal einen Lehrer finden ...");
};

INSTANCE DIA_Vlk_6017_akwyn_KnowsShadownHorn (C_Info)
{
	npc		= Vlk_6017_akwyn;
	nr		= 2;
	condition	= DIA_Vlk_6017_akwyn_KnowsShadownHorn_condition;
	information	= DIA_Vlk_6017_Akwyn_KnowsShadownHorn_info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einen Jäger getroffen ...";
};

FUNC INT DIA_Vlk_6017_akwyn_KnowsShadownHorn_condition ()
{
	if (Npc_KnowsInfo(hero, DIA_Vlk_6017_akwyn_RetonSchickt))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Vlk_6017_akwyn_KnowsShadownHorn_info ()
{
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_15_00"); //Ich habe einen Jäger getroffen ...
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_07_01"); //Und?
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_15_02"); //Er wusste zufällig, wie man einem Schattenläufer sein Horn abnimmt. Und er war zufällig bereit, es mir zu zeigen.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_07_03"); //Großartig, dann können wir uns ja jetzt auf den Weg machen!
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_15_04"); //Äh, moment. Auf den Weg?
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_07_05"); //Natürlich. Oder dachtest du, man lernt sowas nur durch reines Reden?
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_15_06"); //Äh ...
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_07_07"); //Na also. Ich habe die Gegend ausgekundschaftet und dabei schon einen Schattenläufer in der Nähe des Lagers ausfindig machen können.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_KnowsShadownHorn_07_08"); //Folge mir einfach!

	B_LogEntry	(TOPIC_DGDH_SHADOWHORN, "Ich soll mich zusammen mit Akwyn auf den Weg machen, um einen Schattenläufer zu erlegen. Er will selbst sehen, wie man das Horn entfernt.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SHADOWHORN");

	Wld_InsertNpc	(Shadowbeast_Akwyn,	"NW_FOREST_PATH_80_1");
};

INSTANCE DIA_Vlk_6017_akwyn_ShadownHornFertig (C_Info)
{
	npc		= Vlk_6017_akwyn;
	nr		= 2;
	condition	= DIA_Vlk_6017_akwyn_ShadownHornFertig_condition;
	information	= DIA_Vlk_6017_Akwyn_ShadownHornFertig_info;
	permanent	= 0;
	important	= 1;
};

FUNC INT DIA_Vlk_6017_akwyn_ShadownHornFertig_condition ()
{
	if (Npc_KnowsInfo(hero, DIA_Vlk_6017_akwyn_KnowsShadownHorn))
	&& (Npc_IsDead(Shadowbeast_Akwyn))
	&& (Npc_HasItems(Shadowbeast_Akwyn, ItAt_ShadowHorn) == 0)
	{
		return 1;
	};
};

FUNC VOID DIA_Vlk_6017_akwyn_ShadownHornFertig_info ()
{
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_ShadownHornFertig_07_00"); //So macht man das also! Ist ja gar nicht so schwer ...
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_ShadownHornFertig_15_01"); //Stimmt.
	AI_Output(self, hero, "DIA_Vlk_6017_akwyn_ShadownHornFertig_07_02"); //Naja, danke jedenfalls, dass du mir das gezeigt hast.
	AI_Output(hero, self, "DIA_Vlk_6017_akwyn_ShadownHornFertig_15_03"); //Kein Problem, gern geschehen.

	B_LogEntry	(TOPIC_DGDH_SHADOWHORN, "Ich habe Akwyn gezeigt, wie man einem Schattenläufer das Horn nimmt.");
	Log_SetTopicStatus	(TOPIC_DGDH_SHADOWHORN, LOG_SUCCESS);

	B_GivePlayerXP	(150);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};
    
INSTANCE DIA_Vlk_6017_Akwyn_Wargfelle (C_Info)
{
    npc         = Vlk_6017_akwyn;
    nr          = 3;
    condition   = DIA_Vlk_6017_Akwyn_Wargfelle_condition;
    information = DIA_Vlk_6017_Akwyn_Wargfelle_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hast du Wargfelle?";
};

FUNC INT DIA_Vlk_6017_Akwyn_Wargfelle_condition ()
{
 IF ( Npc_KnowsInfo(hero,DIA_Vlk_60000_Nor_ruessi))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Vlk_6017_Akwyn_Wargfelle_info ()
{
	AI_Output(hero,self,"DIA_Vlk_6017_Akwyn_Wargfelle_15_1"); //Hast du Wargfelle?
	AI_Output(self,hero,"DIA_Vlk_6017_Akwyn_Wargfelle_15_2"); //Ja klar. Wie viele brauchst du denn?
	AI_Output(hero,self,"DIA_Vlk_6017_Akwyn_Wargfelle_15_3"); //Fünf Stück.
	AI_Output(self,hero,"DIA_Vlk_6017_Akwyn_Wargfelle_15_4"); //Ok, hier nimm.
	AI_Output(hero,self,"DIA_Vlk_6017_Akwyn_Wargfelle_15_5"); //Du willst mir gar nix dafür abknöpfen?
	AI_Output(self,hero,"DIA_Vlk_6017_Akwyn_Wargfelle_15_6"); //Selbstverständlich nicht. Meinem Vorgesetzten was für ein paar läppische Wargfelle abknöpfen...
	B_GiveInvItems(self,hero,ITat_wargfur,5); 
};    
    
INSTANCE DIA_Vlk_6017_akwyn_beibringen (C_Info)
{
    npc         = Vlk_6017_akwyn;
    nr          = 4;
    condition   = DIA_Vlk_6017_akwyn_beibringen_condition;
    information = DIA_Vlk_6017_akwyn_beibringen_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Kannst du mir was beibringen oder was verkaufen?";
};

FUNC INT DIA_VLK_6017_akwyn_beibringen_condition ()
{
IF ( Npc_KnowsInfo(hero,DIA_Vlk_6017_akwyn_hiduei))
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_6017_akwyn_beibringen_info ()
{
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_beibringen_15_0"); //Kannst du mir was beibringen oder was verkaufen?
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_beibringen_15_1"); //Nein, ich kann dir nichts verkaufen.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_beibringen_15_2"); //Aber ich kann dir eine Jagdrüstung schenken, wenn du uns ein bisschen unter die Arme greifst.
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_beibringen_15_3"); //(seufzt) Ok, was soll ich machen?
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_beibringen_15_4"); //Siehst du den Wolf da unten? Das Biest ist geschickt. Es weicht andauernd meinen Pfeilen aus und ich kann nicht runter hier, weil ich aufpassen muss, dass nicht noch mehr davon kommen.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_beibringen_15_5"); //Kannst du das Vieh beseitigen?
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_beibringen_15_6"); //Und beibringen werde ich dir nur was, wenn du zu uns gehörst. Dann jedoch kann ich dich in den Jagdfertigkeiten und im Bogenschießen unterweisen.
  
	Wld_InsertNpc (akwynwolf,"FP_ROAM_NW_FOREST_PATH_35_01_01");              
      
	Log_CreateTopic (TOPIC_jagdr, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_jagdr, LOG_RUNNING);
	B_LogEntry (TOPIC_jagdr,"Wenn ich Akwyn ein wenig unter die Arme greife schenkt er mir eine vernünftige Jagdrüstung");
    
	B_LogEntry (TOPIC_jagdr,"Akwyn möchte, dass ich den geschickten Wolf nahe dem Plateu töte.");    
}; 
    
INSTANCE DIA_Vlk_6017_akwyn_vtot (C_Info)
{
    npc         = Vlk_6017_akwyn;
    nr          = 4;
    condition   = DIA_Vlk_6017_akwyn_vtot_condition;
    information = DIA_Vlk_6017_akwyn_vtot_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Das Vieh ist tot.";
};

FUNC INT DIA_VLK_6017_akwyn_vtot_condition ()
{
IF ( Npc_KnowsInfo(hero,DIA_Vlk_6017_akwyn_beibringen))
&&  Npc_IsDead(akwynwolf) 
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_6017_akwyn_vtot_info ()
{
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_vtot_15_0"); //Ich habe den Wolf getötet.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_vtot_15_1"); //Danke.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_vtot_15_2"); //Aber wenn du die Rüstung möchtest, musst du noch etwas für mich erledigen.
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_vtot_15_3"); //(seufzt) Ok, was soll ich machen?
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_vtot_15_4"); //Nor braucht Wolfsfelle, aber ich habe nicht genug davon. Ich brauche noch fünf Wolfsfelle.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_vtot_15_5"); //Bosper in der Stadt kann dir beibringen, wie du Viechern das Fell abziehst. 
             
	B_GivePlayerXP (250);  

	B_LogEntry (TOPIC_jagdr,"Ich habe den Wolf getötet, aber Akwyn will, dass ich noch etwas für ihn erledige.");    

	B_LogEntry (TOPIC_jagdr,"Akwyn will jetzt auch noch fünf Wolfsfelle.");    
}; 

INSTANCE DIA_Vlk_6017_akwyn_Felle (C_Info)
{
    npc         = Vlk_6017_akwyn;
    nr          = 4;
    condition   = DIA_Vlk_6017_akwyn_Felle_condition;
    information = DIA_Vlk_6017_akwyn_Felle_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich habe die Wolfsfelle.";
};

FUNC INT DIA_VLK_6017_akwyn_Felle_condition ()
{
IF ( Npc_KnowsInfo(hero,DIA_Vlk_6017_akwyn_vtot))
&&  ( Npc_HasItems(hero,ItAt_wolfFur) >= 5) 
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_6017_akwyn_Felle_info ()
{
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_Felle_15_0"); //Ich habe die Wolfsfelle.

	B_GiveInvItems(hero,self,ITAT_wolfFUR,5);

	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_Felle_15_1"); //Danke.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_Felle_15_2"); //Aber wenn du die Rüstung möchtest musst du...
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_Felle_15_3"); //(sauer) ... dir die Kehle aufschlitzen lassen?
	AI_Output(hero,self,"DIA_Vlk_6017_akwyn_Felle_15_4"); //Das lässt sich einrichten.
	AI_Output(self,hero,"DIA_Vlk_6017_akwyn_Felle_15_5");//Ähm, ok... e-es gibt kein Problem.

	CreateInvItems(self, ItAr_Mol2, 1);
	B_GiveInvItems(self,hero,ITar_mol2,1); 
         
	B_GivePlayerXP (250);  

	B_LogEntry (TOPIC_jagdr,"Ich habe Akwyn gedroht und schon hat er mir die Rüstung gegeben. Übrigens war es seine eigene Rüstung, die er mir gegeben hat. Schätze er hate nie eine Zweite.");

   	MIS_jagdr = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_jagdr, LOG_SUCCESS);
	B_CheckLog();     
}; 

instance DIA_Akwyn_TEACHHUNTING		(C_INFO)
{
	npc		 = 	Vlk_6017_akwyn;
	nr          = 5;
	condition	 = 	DIA_Akwyn_TEACHHUNTING_Condition;
	information	 = 	DIA_Akwyn_TEACHHUNTING_Info;
	permanent	= TRUE;
	description	 = 	"Was kannst du mir beibringen?";
};

func int DIA_Akwyn_TEACHHUNTING_Condition ()
{
	if (hero.guild == GIL_STRF)
	|| (hero.guild == GIL_BAU)
		{
				return TRUE;
		};
};

func void DIA_Akwyn_TEACHHUNTING_Info ()
{
	AI_Output			(hero, self, "DIA_Akwyn_TEACHHUNTING_15_00"); //Was kannst du mir beibringen?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	||(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE))
	{
		AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_03_01"); //Kommt darauf an, was du wissen willst.

		Info_AddChoice		(DIA_Akwyn_TEACHHUNTING, DIALOG_BACK, DIA_Akwyn_TEACHHUNTING_BACK);
		
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		{ 
			Info_AddChoice	(DIA_Akwyn_TEACHHUNTING, B_BuildLearnString ("Zähne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Akwyn_TEACHHUNTING_Teeth);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{ 
			Info_AddChoice	(DIA_Akwyn_TEACHHUNTING, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Akwyn_TEACHHUNTING_Claws);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		{ 
			Info_AddChoice	(DIA_Akwyn_TEACHHUNTING, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Akwyn_TEACHHUNTING_Fur);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
		{ 
			Info_AddChoice	(DIA_Akwyn_TEACHHUNTING, B_BuildLearnString ("Blutfliegenstachel",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)),  DIA_Akwyn_TEACHHUNTING_BFSting);
		};
		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
		{ 
			Info_AddChoice	(DIA_Akwyn_TEACHHUNTING, B_BuildLearnString ("Blutfliegenflügel",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)),  DIA_Akwyn_TEACHHUNTING_BFWing);
		};
	}
	else
	{
		AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_03_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon weißt. Tut mir Leid.
	};
};

func void DIA_Akwyn_TEACHHUNTING_BACK()
{
	Info_ClearChoices	(DIA_Akwyn_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Akwyn_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Claws))
		{
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Claws_03_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Claws_03_01"); //Die Haltung deiner Hand sollte etwas verschränkt sein. Mit einem kräftigen Ruck trennst du dann die Klaue ab.
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Claws_03_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem Händler.
		
		};

		Info_ClearChoices	(DIA_Akwyn_TEACHHUNTING);
		Info_AddChoice		(DIA_Akwyn_TEACHHUNTING, DIALOG_BACK, DIA_Akwyn_TEACHHUNTING_BACK);
		
};

// ------ Fell abziehen ------
func void DIA_Akwyn_TEACHHUNTING_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Teeth))
		{
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Teeth_03_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Zähne. Du fährst mit deinem Messer in seinem Maul um das Gebiss.
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Teeth_03_01"); //Dann trennst es geschickt mit einem Ruck vom Schädel des Tieres.
	
			
		};

	Info_ClearChoices	(DIA_Akwyn_TEACHHUNTING);
	Info_AddChoice		(DIA_Akwyn_TEACHHUNTING, DIALOG_BACK, DIA_Akwyn_TEACHHUNTING_BACK);
};

// ------ Fell abziehen ------
func void DIA_Akwyn_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_Fur))
		{
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Fur_03_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterläufen des Tieres vornimmst.
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_Fur_03_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
		};

	Info_ClearChoices	(DIA_Akwyn_TEACHHUNTING);
	Info_AddChoice		(DIA_Akwyn_TEACHHUNTING, DIALOG_BACK, DIA_Akwyn_TEACHHUNTING_BACK);
};

// ------ Blutfliegenstachel ------
func void DIA_Akwyn_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_BFSting))
		{
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_BFSting_03_00"); //Die Fliege hat am Rücken eine weiche Stelle.
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_BFSting_03_01"); //Wenn du dort mit der Hand gegen drückst, fährt der Stachel sehr weit aus und du kannst ihn mit dem Messer abtrennen.
			
		};

	Info_ClearChoices	(DIA_Akwyn_TEACHHUNTING);
	Info_AddChoice		(DIA_Akwyn_TEACHHUNTING, DIALOG_BACK, DIA_Akwyn_TEACHHUNTING_BACK);
};
// ------ Blutfliegenflügel ------
func void DIA_Akwyn_TEACHHUNTING_BFWing ()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, hero, TROPHY_BFWing))
		{
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_BFWing_03_00"); //Die Flügel einer Blutfliege entfernst du am besten mit einem Hieb einer scharfen Klinge sehr nah am Körper der Fliege.
			AI_Output			(self, hero, "DIA_Akwyn_TEACHHUNTING_BFWing_03_01"); //Du musst nur darauf achten, dass du das feine Gewebe der Flügel nicht verletzt. Sie sind nichts mehr wert, wenn du es nicht vorsichtig machst.

		};

	Info_ClearChoices	(DIA_Akwyn_TEACHHUNTING);
	Info_AddChoice		(DIA_Akwyn_TEACHHUNTING, DIALOG_BACK, DIA_Akwyn_TEACHHUNTING_BACK);
};

instance DIA_Akwyn_TeachBow (C_INFO)
{
	npc		 	= Vlk_6017_akwyn;
	nr		 	= 8;
	condition	= DIA_Akwyn_TeachBow_Condition;
	information	= DIA_Akwyn_TeachBow_Info;
	permanent 	= TRUE;
	description	= "Ich will mehr übers Bogenschießen lernen.";
};

func int DIA_Akwyn_TeachBow_Condition ()
{
	if (hero.guild == GIL_STRF)
	|| (hero.guild == GIL_BAU)
	{
		return TRUE;
	};
};

func void DIA_Akwyn_TeachBow_Info ()
{
	AI_Output (hero, self, "DIA_Akwyn_TeachBow_15_00"); //Ich will mehr übers Bogenschießen lernen.
	AI_Output (self, hero, "DIA_Akwyn_TeachBow_08_01"); //Was soll ich dir beibringen?
	
	Info_ClearChoices (DIA_Akwyn_TeachBow);
	Info_AddChoice (DIA_Akwyn_TeachBow, DIALOG_BACK, DIA_Akwyn_TeachBow_Back);
	Info_AddChoice (DIA_Akwyn_TeachBow, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1))	,DIA_Akwyn_TeachBow_Bow_1);
	Info_AddChoice (DIA_Akwyn_TeachBow, B_BuildLearnString(PRINT_LearnBow5 , B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 5)),DIA_Akwyn_TeachBow_Bow_5);
};

FUNC VOID DIA_Akwyn_TeachBow_Back ()
{
	Info_ClearChoices (DIA_Akwyn_TeachBow);
};

FUNC VOID DIA_Akwyn_TeachBow_BOW_1 ()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 90);
	
	Info_ClearChoices (DIA_Akwyn_TeachBow);
	Info_AddChoice (DIA_Akwyn_TeachBow, DIALOG_BACK, DIA_Akwyn_TeachBow_Back);
	Info_AddChoice (DIA_Akwyn_TeachBow, B_BuildLearnString(PRINT_LearnBow1 , B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1))	,DIA_Akwyn_TeachBow_Bow_1);
	Info_AddChoice (DIA_Akwyn_TeachBow, B_BuildLearnString(PRINT_LearnBow5 , B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 5)),DIA_Akwyn_TeachBow_Bow_5);
};

FUNC VOID DIA_Akwyn_TeachBow_BOW_5 ()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 5, 90);
	
	Info_ClearChoices (DIA_Akwyn_TeachBow);
	Info_AddChoice (DIA_Akwyn_TeachBow, DIALOG_BACK, DIA_Akwyn_TeachBow_Back);
	Info_AddChoice (DIA_Akwyn_TeachBow, B_BuildLearnString(PRINT_LearnBow1 , B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1))	,DIA_Akwyn_TeachBow_BOW_1);
	Info_AddChoice (DIA_Akwyn_TeachBow, B_BuildLearnString(PRINT_LearnBow5 , B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 5)),DIA_Akwyn_TeachBow_BOW_5);
};