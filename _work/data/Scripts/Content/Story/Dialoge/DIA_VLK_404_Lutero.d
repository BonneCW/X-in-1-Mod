// ************************************************************
// 			  				   EXIT 
// ************************************************************

var int first_time;

INSTANCE DIA_Lutero_EXIT(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 999;
	condition	= DIA_Lutero_EXIT_Condition;
	information	= DIA_Lutero_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Lutero_EXIT_Condition()
{
		return TRUE;
};

FUNC VOID DIA_Lutero_EXIT_Info()
{
	if ((FIRST_TIME == FALSE) && (other.guild != GIL_KDF))
	{
		AI_Output (self, other, "Dia_Luttero_wolfe_00");	//Warte mal! Ich bin mir sicher du würdest einen gut bezahlten Job nicht ablehnen.
		AI_Output (other, self, "Dia_Luttero_wolfe_01");	//Worum gehts?
		AI_Output (self, other, "Dia_Luttero_wolfe_02");	//Einer meiner Kunden will einen Pelzmantel haben, aber keinen einfachen: Er will einen Pelzmantel aus den Fellen schwarzer Wölfe.
		AI_Output (other, self, "Dia_Luttero_wolfe_03");	//Schwarze Wölfe?
		AI_Output (self, other, "Dia_Luttero_wolfe_04");	//Ja, schwarze Wölfe. Ihr Pelz ist besonders wertvoll, weil sie vom Aussterben bedroht sind. Aber gerüchten zufolge müsste es noch einige Exemplare auf Khorinis geben.
		AI_Output (self, other, "Dia_Luttero_wolfe_05");	//Wenn du es schaffst mir die Felle von 3 Schwarzen Wölfen zu bringen, werde ich dich reich entlohnen.
		AI_Output (other, self, "Dia_Luttero_wolfe_06");	//Ich werd sehen was sich machen lässt.
		Log_CreateTopic (SCHWARZE_WOELFE, LOG_MISSION);
		Log_SetTopicStatus (SCHWARZE_WOELFE, LOG_Running);
		B_LogEntry (SCHWARZE_WOELFE, "Der Händler Lutero hat mir den Job gegeben einige schwarze Wölfe zu finden und ihm die Felle zu bringen. Er will 3 Felle haben.");
		FIRST_TIME = TRUE;
	};	
	AI_StopProcessInfos	(self);
	
	if (Lutero_Krallen == LOG_RUNNING)
	&& (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE)
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
	
};


instance DIA_LUTTERO_WOLFE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 123;
	condition = dia_luttero_wolfe_condition;
	information = dia_luttero_wolfe_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich habe die Felle";
};


func int dia_luttero_wolfe_condition()
{
	if ((Npc_HasItems (other, itat_blackfur) >= 3) && (FIRST_TIME == TRUE))
	{
		return TRUE;
	};
};

func void dia_luttero_wolfe_info()
{
	AI_Output (other, self, "Dia_Luttero_wolfe_08");	//Ich habe die Felle
	B_GiveInvItems (other, self, itat_blackfur, 3);
	AI_Output (self, other, "Dia_Luttero_wolfe_09");	//Gut gemacht! Du hast dir deine Belohnung verdient! Hier nimm das Gold!
	B_GiveInvItems (self, other, ItMi_Gold, 400);
	Log_SetTopicStatus (SCHWARZE_WOELFE, LOG_SUCCESS);
};
//************************************************************
//	Hallo
//************************************************************
INSTANCE DIA_Lutero_Hallo(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Hallo_Condition;
	information	= DIA_Lutero_Hallo_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_Hallo_Condition()
{	
	if ((other.guild != GIL_NONE)
	|| (other.guild != GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Hallo_Info()
{	
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_00"); //Mein Name ist Lutero. Ich handle mit den verschiedensten Sachen.
	AI_Output (other ,self,"DIA_Lutero_Hallo_15_01"); //Welche Ware bietest du an?
	AI_Output (self ,other,"DIA_Lutero_Hallo_13_02"); //Nun, vor allem seltene und ausgefallene Dinge. Bisher ist es mir immer gelungen, die Wünsche meiner Kunden zu erfüllen.
	
	Log_CreateTopic (TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader, "Lutero handelt mit ausgefallenen und seltenen Gegenständen im oberen Viertel."); 
};
//************************************************************
//	GetLost
//************************************************************
INSTANCE DIA_Lutero_GetLost(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_GetLost_Condition;
	information	= DIA_Lutero_GetLost_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Lutero_GetLost_Condition()
{	
	if ((other.guild == GIL_NONE)
	|| (other.guild == GIL_NOV)) 	
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_GetLost_Info()
{	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_00"); //Verschwinde Bursche! Hast du nichts zu tun? Dann such dir Arbeit - aber woanders!
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_GetLost_13_01"); //Was willst du, Novize? Solltest du nicht im Kloster sein?
	};
	AI_StopProcessInfos (self);
};
//************************************************************
//	Snapper
//************************************************************
INSTANCE DIA_Lutero_Snapper(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Snapper_Condition;
	information	= DIA_Lutero_Snapper_Info;
	permanent	= FALSE;
	description = "Suchst du bestimmte Gegenstände?";
};                       

FUNC INT DIA_Lutero_Snapper_Condition()
{	
	if (other.guild != GIL_NONE)
	&& (other.guild != GIL_NOV) 	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Snapper_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_00"); //Suchst du bestimmte Gegenstände?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_01"); //Ja, für meinen derzeitigen Auftrag benötige ich die Krallen eines Snappers.
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_02"); //Aber keine einfachen Krallen. Es muss schon was Besonderes sein. Die Krallen einer mächtigen Bestie, die viele Männer getötet hat, oder etwas Derartiges.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_03"); //Wo finde ich Snapper?
	AI_Output (self ,other,"DIA_Lutero_Snapper_13_04"); //Es gibt ein paar hier auf der Insel, die meisten hausen jedoch im Minental.
	AI_Output (other ,self,"DIA_Lutero_Snapper_15_05"); //Und was springt für mich dabei raus?
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_06"); //Ich kann dir einen Runenstein besorgen.
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_07"); //Ich kann dir einen Ring der Unbezwingbarkeit besorgen.
	};
	AI_Output (other ,self,"DIA_Lutero_Hello_15_08"); //Ich werde mal sehen, was sich machen lässt.
	
	Log_CreateTopic (Topic_Lutero,LOG_MISSION);
	Log_SetTopicStatus (Topic_Lutero,LOG_RUNNING);
	B_LogEntry (Topic_Lutero,"Der Händler Lutero sucht nach Krallen eines besonders mächtigen Snappers.");
	
	Lutero_Krallen = LOG_RUNNING;
};
//************************************************************
//	Kralle abliefern
//************************************************************
INSTANCE DIA_Lutero_Kralle(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Kralle_Condition;
	information	= DIA_Lutero_Kralle_Info;
	permanent	= FALSE;
	description = "Ich habe besondere Snapperkrallen für dich. ";
};                       

FUNC INT DIA_Lutero_Kralle_Condition()
{	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	&& (Npc_KnowsInfo (other, DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Kralle_Info()
{	
	AI_Output (other ,self,"DIA_Lutero_Kralle_15_00"); //Ich habe besondere Snapperkrallen für dich.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP (XP_Ambient);
	AI_Output (self ,other,"DIA_Lutero_Kralle_13_01"); //Das wird meinen Kunden freuen.
	B_GiveInvItems (other, self, ItAt_ClawLeader,1);
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_02"); //Den Runenstein habe ich allerdings nicht hier. Aber ich weiß, wo er liegt.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_03"); //Wenn du von der Stadt zur Herberge gehst, kommst du unter einer Brücke hindurch.
		AI_Output (self ,other,"DIA_Lutero_Hello_13_04"); //Dort, in einer Höhle, hat ein Freund von mir einen Runenstein in einer Truhe hinterlegt. Hier ist der Schlüssel.
		B_GiveInvItems (self, other, ITKE_RUNE_MIS,1); 
	}
	else
	{
		AI_Output (self ,other,"DIA_Lutero_Hello_13_05"); //Hier ist der Ring, den ich dir versprochen habe.
		B_GiveInvItems (self, other, ItRi_Prot_Total_01,1);
	};
};
//************************************************************
//	Trade
//************************************************************
INSTANCE DIA_Lutero_Trade(C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 5;
	condition	= DIA_Lutero_Trade_Condition;
	information	= DIA_Lutero_Trade_Info;
	permanent	= TRUE;
	description = "Zeig mir deine Ware.";
	trade		= TRUE;
};                       
FUNC INT DIA_Lutero_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Lutero_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Lutero_Trade_Info()
{	
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Lutero_Trade_15_00"); //Zeig mir deine Ware.
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lutero_PICKPOCKET (C_INFO)
{
	npc			= VLK_404_Lutero;
	nr			= 900;
	condition	= DIA_Lutero_PICKPOCKET_Condition;
	information	= DIA_Lutero_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Lutero_PICKPOCKET_Condition()
{
	C_Beklauen (58, 65);
};
 
FUNC VOID DIA_Lutero_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lutero_PICKPOCKET);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_BACK 		,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};
	
func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lutero_PICKPOCKET);
};


