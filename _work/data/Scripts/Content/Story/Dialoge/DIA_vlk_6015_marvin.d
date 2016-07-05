INSTANCE DIA_vlk_6015_marvin_Exit (C_Info)
{
    npc         = vlk_6015_marvin;
    nr          = 999;
    condition   = DIA_vlk_6015_marvin_Exit_condition;
    information = DIA_vlk_6015_marvin_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};

FUNC INT DIA_vlk_6015_marvin_Exit_condition ()
{
    return TRUE;
};

FUNC VOID DIA_vlk_6015_marvin_EXIT_info ()
{
    AI_StopProcessInfos(self);
};


INSTANCE DIA_vlk_6015_marvin_hiduei (C_Info)
{
    npc         = vlk_6015_marvin;
    nr          = 2;
    condition   = DIA_vlk_6015_marvin_hiduei_condition;
    information = DIA_vlk_6015_marvin_hiduei_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hi.";
};
FUNC INT DIA_vlk_6015_marvin_hiduei_condition ()
{
    return TRUE;
};
FUNC VOID DIA_vlk_6015_marvin_hiduei_info ()
{
	AI_Output(other,self,"DIA_vlk_6015_marvin_hiduei_15_0"); //Hi.
	AI_Output(self,other,"DIA_vlk_6015_marvin_hiduei_15_1"); //Hi.
	AI_Output(other,self,"DIA_vlk_6015_marvin_hiduei_15_2"); //Was machst du hier draußen?
	AI_Output(self,other,"DIA_vlk_6015_marvin_hiduei_15_3"); //Die Idioten da in der Stadt haben mich und meine Jungs rausgeworfen.
	AI_Output(other,self,"DIA_vlk_6015_marvin_hiduei_15_4"); //Wieso denn das?
	AI_Output(self,other,"DIA_vlk_6015_marvin_hiduei_15_5"); //Wir hatten uns mit der Diebesgilde angelegt. 
	AI_Output(self,other,"DIA_vlk_6015_marvin_hiduei_15_6"); //Großer Fehler. Die haben uns einfach einen Mord angehängt.
	AI_Output(self,other,"DIA_vlk_6015_marvin_hiduei_15_7"); //Aber wir haben nicht vor hier zu bleiben.
	AI_Output(self,other,"DIA_vlk_6015_marvin_hiduei_15_8"); //Vielleicht weißt du ja, wo wir jetzt hin können?
};

INSTANCE DIA_vlk_6015_marvin_mg (C_Info)
{
    npc         = vlk_6015_marvin;
    nr          = 2;
    condition   = DIA_vlk_6015_marvin_mg_condition;
    information = DIA_vlk_6015_marvin_mg_info;
    permanent   = FALSE;
    important   =  FALSE;
    description = "Du könntest in die Gilde eintreten.";
};

FUNC INT DIA_vlk_6015_marvin_mg_condition ()
{
IF ( Npc_KnowsInfo(other,DIA_vlk_6015_marvin_hiduei))
&& ( Npc_KnowsInfo(other,DIA_kdw_6019_reton_s))
{
    return TRUE;
};
};

FUNC VOID DIA_vlk_6015_marvin_mg_info ()
{
	AI_Output(other,self,"DIA_vlk_6015_marvin_mg_15_0"); //Du könntest in die Gilde eintreten.
	AI_Output(self,other,"DIA_vlk_6015_marvin_mg_15_1"); //Die Gilde?
	AI_Output(other,self,"DIA_vlk_6015_marvin_mg_15_2"); //Ja, wir haben unser Lager beim Leuchtturm.
	AI_Output(self,other,"DIA_vlk_6015_marvin_mg_15_3"); //Na gut aber du musst uns erst ein paar Sachen besorgen.
	AI_Output(other,self,"DIA_vlk_6015_marvin_mg_15_4"); //(seufzt) Was denn?
	AI_Output(self,other,"DIA_vlk_6015_marvin_mg_15_5"); //Wir brauchen drei neue Schwerter, drei neue Bögen und 500 Goldmünzen.
	AI_Output(other,self,"DIA_vlk_6015_marvin_mg_15_6"); //Wofür denn das alles?
	AI_Output(self,other,"DIA_vlk_6015_marvin_mg_15_7"); //Die Schwerter hier sind zu schwer, die Sehnen unserer Bögen sind fast zerissen und Gold kann man immer gebrauchen.
	AI_Output(other,self,"DIA_vlk_6015_marvin_mg_15_8"); //Wo soll ich das ganze Zeug herbekommen?
	AI_Output(self,other,"DIA_vlk_6015_marvin_mg_15_9"); //Schau mal bei Bosper und Hakon. 

	Log_CreateTopic (TOPIC_afm, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_afm, LOG_RUNNING);
	B_LogEntry (TOPIC_afm,"Ich soll für Marvin einiges besorgen. Er will drei Bögen von Bosper, drei Schwerter von Hakon und 500 Goldmünzen, damit er in die Gilde eintritt.");
};

INSTANCE DIA_vlk_6015_marvin_mgd (C_Info)
{
    npc         = vlk_6015_marvin;
    nr          = 2;
    condition   = DIA_vlk_6015_marvin_mgd_condition;
    information = DIA_vlk_6015_marvin_mgd_info;
    permanent   = FALSE;
    important   =  FALSE;
    description = "Hier hast du das Zeug.";
};

FUNC INT DIA_vlk_6015_marvin_mgd_condition ()
{
IF ( Npc_KnowsInfo(other,DIA_vlk_6015_marvin_mg))
&& ( Npc_HasItems(other,Itmi_GOLD) >= 500)
&& ( Npc_HasItems(other,ItMw_marvinschwert) >= 3)
&& ( Npc_HasItems(other,ItRw_marvinbogen) >= 3)
{
    return TRUE;
};
};

FUNC VOID DIA_vlk_6015_marvin_mgd_info ()
{
	AI_Output(other,self,"DIA_vlk_6015_marvin_mgd_15_0"); //Hier hast du das Zeug.
	AI_Output(self,other,"DIA_vlk_6015_marvin_mgd_15_1"); //Ah, sehr gut.
	AI_Output(other,self,"DIA_vlk_6015_marvin_mgd_15_2"); //Wirst du jetzt in die Gilde eintreten?
	AI_Output(self,other,"DIA_vlk_6015_marvin_mgd_15_3"); //Ja. Wir sind schon auf dem Weg.

	B_GiveInvItems(other,self,ITmi_gold,500);
	B_GiveInvItems(other,self,ItRw_marvinbogen,3);
	B_GiveInvItems(other,self,ItMw_marvinschwert,3);

	MIS_afm = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_afm, LOG_SUCCESS);
	B_CheckLog();
	B_GivePlayerXP (500);
	Npc_ExchangeRoutine (self, "START"); 
	Npc_ExchangeRoutine (VLK_6013_Soeldner, "START"); 
	Npc_ExchangeRoutine (VLK_6014_Soeldner, "START"); 
};
