//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Dyrian_EXIT   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 999;
	condition   = DIA_Dyrian_EXIT_Condition;
	information = DIA_Dyrian_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Dyrian_Hello   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_Hello_Condition;
	information = DIA_Dyrian_Hello_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_Hello_Condition()
{
	if  (Npc_IsInState (self, ZS_Talk))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	&&  (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Hello_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Hello_13_00"); //(traurig) Was willst du?
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Dyrian_Wurst(C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr			= 3;
	condition	= DIA_Dyrian_Wurst_Condition;
	information	= DIA_Dyrian_Wurst_Info;
	permanent	= FALSE;
	description = "Ich verteile gerade Würste.";
};                       

FUNC INT DIA_Dyrian_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Dyrian_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Dyrian_Wurst_15_00"); //Ich verteile gerade Würste.
	AI_Output (self, other, "DIA_Dyrian_Wurst_13_01"); //Danke. Hoffentlich wird das nicht meine letzte Wurst sein, die ich hier bekomme.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Was machst Du hier? 
//**************************************************************************
INSTANCE DIA_Dyrian_Job   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Job_Condition;
	information = DIA_Dyrian_Job_Info;
	permanent   = FALSE;
	description = "Was machst Du hier?";
};
FUNC INT DIA_Dyrian_Job_Condition()
{	
	if Npc_KnowsInfo (hero,DIA_Dyrian_Hello)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Job_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Job_15_00"); //Was machst du hier?
	AI_Output (self ,other,"DIA_Dyrian_Job_13_01"); //Ich habe gegen die Gebote der Gemeinschaft verstoßen.
	AI_Output (self ,other,"DIA_Dyrian_Job_13_02"); //Jetzt warte ich auf die Entscheidung des Hohen Rates, ob ich im Kloster bleiben darf.
};
//**************************************************************************
//	Wieso sollst Du das Kloster denn verlassen?
//**************************************************************************

INSTANCE DIA_Dyrian_WhatDone   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_WhatDone_Condition;
	information = DIA_Dyrian_WhatDone_Info;
	permanent   = FALSE;
	description = "Erzähl mir, was passiert ist.";
};
FUNC INT DIA_Dyrian_WhatDone_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Dyrian_Job))
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_WhatDone_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_WhatDone_15_00"); //Erzähl mir, was passiert ist.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_01"); //Ich habe beim Fegen in den Räumen der Magier ein Buch mitgenommen, um es später zu lesen.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_02"); //Meister Hyglas hat es natürlich sofort bemerkt und mich nach dem Buch gefragt.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_03"); //Aus Angst vor Bestrafung habe ich es geleugnet - aber als ich später mit dem Buch in meiner Kammer war, hat er mich erwischt.
	AI_Output (self ,other,"DIA_Dyrian_WhatDone_13_04"); //Er war ziemlich aufgebracht und hat den Hohen Rat informiert. Jetzt beraten sie, ob ich bleiben kann.
};

//**************************************************************************
//	Kann ich dir irgendwie helfen?
//**************************************************************************
INSTANCE DIA_Dyrian_CanHelp   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_CanHelp_Condition;
	information = DIA_Dyrian_CanHelp_Info;
	permanent   = TRUE;
	description = "Kann ich dir irgendwie helfen?";
};
FUNC INT DIA_Dyrian_CanHelp_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Job)
	&&	(MIS_RUNE == FALSE)
	&&	(MIS_SCHNITZELJAGD == FALSE)
	&&	(MIS_GOLEM == FALSE)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_CanHelp_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_CanHelp_15_00"); //Kann ich dir irgendwie helfen?
	AI_Output (self ,other,"DIA_Dyrian_CanHelp_13_01"); //Nein, ich bin der Gnade Innos' und der der Magier ausgeliefert.
};
//**************************************************************************
//	SC hat die Prüfung des Feuers angenommen und mit Hyglas gesprochen
//**************************************************************************
INSTANCE DIA_Dyrian_Scroll   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 1;
	condition   = DIA_Dyrian_Scroll_Condition;
	information = DIA_Dyrian_Scroll_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Dyrian_Scroll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	||	(MIS_RUNE == LOG_RUNNING)
	||	(MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Dyrian_Scroll_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_00"); //Hey, hast du tatsächlich die Prüfung des Feuers gefordert?
	AI_Output (other,self ,"DIA_Dyrian_Scroll_15_01"); //Ja. Und ich habe vor, sie zu bestehen.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_13_02"); //Gut - vielleicht kann ich dir dabei helfen. Ich kann dir eine sehr nützliche Spruchrolle geben. Einen SCHLAF-Zauber. Interessiert?

	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Nein, ich brauche deine Hilfe nicht.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Was willst du dafür?",DIA_Dyrian_Scroll_How);
	Info_AddChoice (DIA_Dyrian_Scroll,"Was kann ich damit machen?",DIA_Dyrian_Scroll_What);
};
FUNC VOID DIA_Dyrian_Scroll_What ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_00"); //Was kann ich damit machen?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_01"); //Mit diesem Zauber kannst du Menschen für kurze Zeit in einen magischen Schlaf versetzen. Allerdings nur, wenn ihr Wille schwächer ist als deiner.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_02"); //Das kann sehr nützlich sein, wenn dir jemand im Weg steht ...
	AI_Output (other,self ,"DIA_Dyrian_Scroll_What_15_03"); //Und woher weiß ich, ob derjenige einen schwächeren Willen hat?
	AI_Output (self,other ,"DIA_Dyrian_Scroll_What_13_04"); //Bei den Magiern brauchst du es gar nicht erst zu versuchen. Aber die meisten Novizen wirst du schlafen legen können.
};
FUNC VOID DIA_Dyrian_Scroll_No ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_No_15_00"); //Nein, ich brauche deine Hilfe nicht.
	AI_Output (self,other ,"DIA_Dyrian_Scroll_No_13_01"); //Du kannst jederzeit zu mir kommen, wenn du es dir anders überlegen solltest.
	Info_ClearChoices (DIA_Dyrian_Scroll);
};
FUNC VOID DIA_Dyrian_Scroll_How ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_How_15_00"); //Was willst du dafür?
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_01"); //Jedem Magier steht bei der Aufnahme ein Wunsch zu.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_How_13_02"); //Und wenn du tatsächlich die Prüfung des Feuers bestehst, dann kannst du dich dafür einsetzen, dass ich im Kloster bleiben darf.
	
	Info_ClearChoices (DIA_Dyrian_Scroll);
	Info_AddChoice (DIA_Dyrian_Scroll,"Nein, ich brauche deine Hilfe nicht.",DIA_Dyrian_Scroll_No);
	Info_AddChoice (DIA_Dyrian_Scroll,"Okay, gib mir die Spruchrolle. ",DIA_Dyrian_Scroll_Yes);
	
};
FUNC VOID DIA_Dyrian_Scroll_Yes ()
{
	AI_Output (other,self ,"DIA_Dyrian_Scroll_Yes_15_00"); //Okay, gib mir die Spruchrolle.
	AI_Output (self ,other,"DIA_Dyrian_Scroll_Yes_13_01"); //Viel Glück während deiner Prüfung. Möge Innos dir beistehen.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
	Log_CreateTopic (Topic_DyrianDrin,LOG_MISSION);
	Log_SetTopicStatus (Topic_DyrianDrin,LOG_RUNNING);
	B_LogEntry (Topic_DyrianDrin,"Dyrian hat mir eine Schlaf - Spruchrolle gegeben. Dafür will er, das ich mich dafür einsetze, das er im Kloster bleiben darf, falls ich Magier werde. ");
	Info_ClearChoices (DIA_Dyrian_Scroll);
	
};
//**************************************************************************
//	Doch Scroll nehmen
//**************************************************************************
INSTANCE DIA_Dyrian_Doch   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 4;
	condition   = DIA_Dyrian_Doch_Condition;
	information = DIA_Dyrian_Doch_Info;
	permanent   = TRUE;
	description = "Ich hab's mir überlegt. Gib mir den Schlaf-Zauber.";
};
FUNC INT DIA_Dyrian_Doch_Condition()
{	
	if Npc_KnowsInfo(hero,DIA_Dyrian_Scroll)
	&& (MIS_HelpDyrian != LOG_RUNNING)
	&& (other.guild == GIL_NOV)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Dyrian_Doch_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Doch_15_00"); //Ich hab's mir überlegt. Gib mir den Schlaf-Zauber.
	AI_Output (self ,other,"DIA_Dyrian_Doch_13_01"); //Gut, wenn du die Prüfung bestehst, setzt du dich dafür ein, dass ich im Kloster bleiben kann.
	
	B_GiveInvItems (self,other,ItSc_Sleep,1);
	MIS_HelpDyrian = LOG_RUNNING;
};
//*****************************************************************************
//			SC trifft Dyrian, nach Aufnahme und der ist noch im KLoster
//*****************************************************************************
INSTANCE DIA_Dyrian_HelloAgain   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 2;
	condition   = DIA_Dyrian_HelloAgain_Condition;
	information = DIA_Dyrian_HelloAgain_Info;
	permanent   = FALSE;
	important  	= TRUE;
};
FUNC INT DIA_Dyrian_HelloAgain_Condition()
{
	if  Npc_IsInState (self, ZS_Talk)
	&& (other.guild == GIL_KDF)
	&& (MIS_HelpDyrian == LOG_SUCCESS)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HelloAgain_Info()
{
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_00"); //(freudestrahlend) Danke, du hast mich gerettet!
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_01"); //(erschrocken) Oh - verzeih mir Meister- ich wollte nicht aufdringlich erscheinen.
	AI_Output (self ,other,"DIA_Dyrian_HelloAgain_13_02"); //(ehrerbietend) Ich danke dir dafür, dass ich im Kloster bleiben darf. Mein Leben wird sich von nun an ändern ...
	
	B_GivePlayerXP (XP_Ambient); 	
	AI_StopProcessInfos (self); 
};

//*****************************************************************************
//			Wie gehts? //Info für Magier Success 
//*****************************************************************************
func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output (other,self ,"DIA_Dyrian_HowIsIt_15_00"); //Wie geht's?
};

INSTANCE DIA_Dyrian_HowIsIt   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_HowIsIt_Condition;
	information = DIA_Dyrian_HowIsIt_Info;
	permanent   = TRUE;
	description = "Wie geht's?";
};
FUNC INT DIA_Dyrian_HowIsIt_Condition()
{
	if Npc_KnowsInfo (other,DIA_Dyrian_HelloAgain)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_01"); //Gut. Die Arbeit macht mir viel Freude, Meister.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Wie gehts? //Info für alle anderen 
//*****************************************************************************
INSTANCE DIA_Dyrian_other   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_other_Condition;
	information = DIA_Dyrian_other_Info;
	permanent   = TRUE;
	description = "Wie geht's?";
};
FUNC INT DIA_Dyrian_other_Condition()
{
	if (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_NONE)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output (self ,other,"DIA_Dyrian_HowIsIt_13_02"); //Ich danke Innos, dass ich hier im Kloster sein darf.
	
	AI_StopProcessInfos (self);	
};
//*****************************************************************************
//			Dyrian steht in Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_Kneipe   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_Kneipe_Condition;
	information = DIA_Dyrian_Kneipe_Info;
	permanent   = TRUE;
	description = "Wie geht's?";
};
FUNC INT DIA_Dyrian_Kneipe_Condition()
{
	if  (MIS_HelpDyrian == LOG_FAILED)
	&&  (other.guild == GIL_KDF)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_Kneipe_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_15_00"); //Wie geht's?
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_01"); //Das fragst du mich noch? Ich habe alle meine Hoffnungen auf dich gesetzt, aber du hast mich sitzen lassen.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_13_02"); //Jetzt bleibt mir nur noch der Alkohol. Und du bist Schuld daran!
	
	Info_ClearChoices (DIA_Dyrian_Kneipe);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Hier hast Du 5 Gold.",DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Ich kann alles erklären.",DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice (DIA_Dyrian_Kneipe,"Pass auf was du sagst!",DIA_Dyrian_Kneipe_ShutUp);
		
};

FUNC VOID DIA_Dyrian_Kneipe_Gold ()
{
	AI_Output	(other,self ,"DIA_Dyrian_Kneipe_Gold_15_00"); //Hier hast du 5 Goldstücke.
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_01"); //(aufgeregt) 5 Gold? Du gibst mir 5 Gold. Dafür, dass du mein Leben zerstört hast?
	AI_Output 	(self ,other,"DIA_Dyrian_Kneipe_Gold_13_02"); //Ich werde mir all dein Gold nehmen!
	
	AI_StopProcessInfos (self);
	B_Attack (self,other,AR_NONE, 0); 
};

FUNC VOID DIA_Dyrian_Kneipe_CanExplain ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_CanExplain_15_00"); //Ich kann alles erklären.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_01"); //Spar dir deine billigen Ausreden.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_CanExplain_13_02"); //Du lügst, wenn du den Mund aufmachst. Jetzt lass mich in Ruhe.
	
	AI_StopProcessInfos (self);
};

FUNC VOID DIA_Dyrian_Kneipe_ShutUp ()
{
	AI_Output (other,self ,"DIA_Dyrian_Kneipe_ShutUp_15_00"); //Pass auf, was du sagst.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_01"); //Ja, droh mir nur. Es wird dir nicht nützen.
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_02"); //Ich werde der ganzen Welt erzählen, was du für ein scheinheiliger Kerl bist! Sobald ich diese Flasche ausgetrunken habe ...
	AI_Output (self ,other,"DIA_Dyrian_Kneipe_ShutUp_13_03"); //Jetzt geh mir aus den Augen, du widerst mich an!

	AI_StopProcessInfos (self);
};
//*****************************************************************************
//			Wie gehts? //Info nachher Kneipe
//*****************************************************************************
INSTANCE DIA_Dyrian_nachher   (C_INFO)
{
	npc         = NOV_604_Dyrian;
	nr          = 3;
	condition   = DIA_Dyrian_nachher_Condition;
	information = DIA_Dyrian_nachher_Info;
	permanent   = TRUE;
	description = "Wie sieht's aus?";
};
FUNC INT DIA_Dyrian_nachher_Condition()
{
	if  Npc_KnowsInfo (other,DIA_Dyrian_Kneipe)
	
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Dyrian_nachher_Info()
{
	AI_Output (other,self ,"DIA_Dyrian_nachher_15_00"); //Wie sieht's aus?
	AI_Output (self ,other,"DIA_Dyrian_nachher_13_01"); //Ach, lass mich bloß in Ruhe! Mit dir will ich nichts mehr zu tun haben!
	AI_StopProcessInfos (self);	
};
 
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Dyrian_PICKPOCKET (C_INFO)
{
	npc			= NOV_604_Dyrian;
	nr			= 900;
	condition	= DIA_Dyrian_PICKPOCKET_Condition;
	information	= DIA_Dyrian_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Dyrian_PICKPOCKET_Condition()
{
	C_Beklauen (10, 15);
};
 
FUNC VOID DIA_Dyrian_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_BACK 		,DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};
	
func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Dyrian_PICKPOCKET);
};
// Der Weg aus dem Kloster (oder "Geschenkter Wein")
const string Geschenkter_Wein = "Weinverkauf";
var int Weinverkauf; //1-Wein bekommen, 2-Wein verkauft, 3-Fertig
instance DIA_Dyrian_RausHier (C_INFO)
{
  npc = NOV_604_Dyrian;
  nr = 2;
  condition = DIA_Dyrian_RausHier_Condition;
  information = DIA_Dyrian_RausHier_Info;
  permanent = TRUE;
  description = "Warum stehst du hier rum?";
};

func int DIA_Dyrian_RausHier_Condition ()
{
  if ((other.guild == GIL_Bad) && (Npc_HasItems(other, Holy_Hammer_Mis) == 1) && Hammer_holen)
    {
      return true;
    };
  return false;
};

func void DIA_Dyrian_RausHier_Info ()
{
  AI_Output(other, self, "DIA_Dyrian_RausHier_01"); //Warum stehst du hier rum?
  AI_Output(self, other, "DIA_Dyrian_RausHier_02"); //Ich soll für Meister Gorax Wein zur Toten Harpie bringen, aber der Weg dahin ist voller wilder Tiere.
  Info_ClearChoices(DIA_Dyrian_RausHier);
  Info_AddChoice(DIA_Dyrian_RausHier, "Kann ich dir irgendwie helfen?", DIA_Dyrian_RausHier_Help);
  Info_AddChoice(DIA_Dyrian_RausHier, "Das ist nicht mein Problem.", DIA_Dyrian_RausHier_NotMyProb);
};

func void DIA_Dyrian_RausHier_Help ()
{
  AI_Output(other, self, "DIA_Dyrian_RausHier_03"); //Kann ich dir irgendwie helfen?
  AI_Output(self, other, "DIA_Dyrian_RausHier_04"); //Klar, du könntest für mich zur Taverne gehen, machst du's?
  Info_ClearChoices(DIA_Dyrian_RausHier);
  Info_AddChoice(DIA_Dyrian_RausHier, "Warum nicht, gib mir den Wein!", DIA_Dyrian_RausHier_Give);
  Info_AddChoice(DIA_Dyrian_RausHier, "Ich habe leider gerade keine Zeit.", DIA_Dyrian_RausHier_NoTime);
};

func void DIA_Dyrian_RausHier_Give ()
{
  AI_Output(other, self, "DIA_Dyrian_RausHier_05"); //Warum nicht, gib mir den Wein!
  AI_Output(self, other, "DIA_Dyrian_RausHier_06"); //Hier!
  CreateInvItems(self, ItFo_wine, 6);
  B_GiveInvItems(self, other, ItFo_wine, 6);
  LOG_CreateTopic(Geschenkter_Wein, LOG_MISSION);
  LOG_SetTopicStatus(Geschenkter_Wein, LOG_RUNNING);
  B_LogEntry(Geschenkter_Wein, "Der Novize Dyrian hat mir 6 Flaschen Wein gegeben, die ich in der Taverne 'Zur Toten Harpie' verkaufen soll.");
  B_LogEntry(B5_9000_Mage_Prüfung, "Ich habe den Hammer und auch einen Weg aus dem Kloster.");
  AI_Output(self, other, "DIA_Dyrian_RausHier_07"); //Ich habe sogar einen Zauber parat, der dich direkt zur Taverne bringt, dann brauchst du den Weg nur einmal machen.
  AI_StopProcessInfos(self);
  LOG_CreateTopic(Geschenkter_Wein, LOG_MISSION);
  LOG_SetTopicStatus(Geschenkter_Wein, LOG_RUNNING);
  B_LogEntry(Geschenkter_Wein, "Der Novize Dyrian hat mir 6 Flaschen Wein gegeben, die ich in der Taverne 'Zur Toten Harpie' verkaufen soll.");
  //AI_StartState(self, ZS_TeleportHero, 0, "NW_TAVERNE_GREGSBENCH");
  //AI_StartState(self, ZS_Stand_WP, 0, "");
  AI_StartState(self, ZS_TeleportHero_Taverne, 0, "");
  Weinverkauf = 1;
};

func void DIA_Dyrian_RausHier_NoTime ()
{
  AI_Output(other, self, "DIA_Dyrian_RausHier_08"); //Ich habe leider gerade keine Zeit.
  AI_Output(self, other, "DIA_Dyrian_RausHier_09"); //Das ist schade, ich denke aber, dass ich immernoch hier bin, wenn du wieder Zeit hast.
  AI_StopProcessInfos(self);
};

func void DIA_Dyrian_RausHier_NotMyProb ()
{
  AI_Output(other, self, "DIA_Dyrian_RausHier_10"); //Das ist nicht mein Problem.
  AI_Output(self, other, "DIA_Dyrian_RausHier_11"); //Na dann nicht, wenn du nicht willst.
  AI_StopProcessInfos(self);
};

//Weinverkauf 2.Teil
instance Dyrian_Wein (C_Info)
{
  npc = NOV_604_Dyrian;
  nr = 2;
  permanent = false;
  important = true;
  condition = Dyrian_Wein_Condition;
  information = Dyrian_Wein_Info;
  description = "";
};

func int Dyrian_Wein_Condition ()
{
  	if (Kapitel > 2)
	&& (Weinverkauf == 1)
    	{
      		return true;
    	};
};

func void Dyrian_Wein_Info ()
{
  AI_Output(self, other, "Dyrian_Wein_01"); //Da bist du ja endlich! Ich dachte schon, du kommst garnicht mehr wieder. 
  AI_Output(other, self, "Dyrian_Wein_02"); //(genervt) Was willst du?
  AI_Output(self, other, "Dyrian_Wein_03"); //Hey, nun tu mal nicht so genervt! Du hast mir versprochen den Wein zu Orlan zu bringen! Und jetzt will ich das Gold dafür haben!
  Info_ClearChoices(Dyrian_Wein);
  Info_AddChoice(Dyrian_Wein, "Hier hast du dein Gold. (120 Gold geben)", Dyrian_Wein_Gold);
  Info_AddChoice(Dyrian_Wein, "Lass mich in Ruhe mit deinem Wein!", Dyrian_Wein_Kein_Gold);
};

func void Dyrian_Wein_Kein_Gold ()
{
  AI_Output(other, self, "Dyrian_Wein_07"); //Lass mich in Ruhe mit deinem Wein!
  AI_Output(self, other, "Dyrian_Wein_08"); //Weißt du was Gorax mit mir macht wenn ich ihm das erzählen muss?
  AI_Output(self, other, "Dyrian_Wein_09"); //Aber ich werde nicht alleine leiden müssen!
  LOG_SetTopicStatus(Geschenkter_Wein, LOG_FAILED);
  AI_StopProcessInfos(self);
  B_Attack(self, other, AR_NONE, 1); //Greift er den Spieler noch an!
};

func void Dyrian_Wein_Gold ()
{
  if (Npc_HasItems(other, ItMi_Gold) >= 120)
    {
      B_GiveInvItems(other, self, ItMi_Gold, 120);
      AI_Output(other, self, "Dyrian_Wein_04"); //Hier hast du dein Gold.
      AI_Output(self, other, "Dyrian_Wein_10"); //Danke! Jetzt kann ich endlich diese Aufgabe beenden!
      B_GivePlayerXP(XP_Ambient);
      LOG_SetTopicStatus(Geschenkter_Wein, LOG_SUCCESS);
      AI_StopProcessInfos(self);
      Npc_ExchangeRoutine(self, "Favour"); //Darf im Kloster arbeiten.
    }
  else
    {
      AI_Output(other, self, "Dyrian_Wein_05"); //Ich würde dir das Gold ja geben, aber ich habe es nicht mehr.
      AI_Output(self, other, "Dyrian_Wein_06"); //WAS? Du hast das ganze Gold versoffen? Und dann wagst du dich wieder her?
      Dyrian_Wein_Kein_Gold();
    };
};
