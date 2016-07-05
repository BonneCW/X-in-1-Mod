INSTANCE DIA_Vlk_6016_copper_Exit (C_Info)
{
    npc         = Vlk_6016_copper;
    nr          = 999;
    condition   = DIA_Vlk_6016_copper_Exit_condition;
    information = DIA_Vlk_6016_copper_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};

FUNC INT DIA_Vlk_6016_copper_Exit_condition ()
{
    return TRUE;
};

FUNC VOID DIA_Vlk_6016_copper_Exit_info ()
{
    AI_StopProcessInfos(self);
};

INSTANCE DIA_Vlk_6016_copper_hiduei (C_Info)
{
    npc         = Vlk_6016_copper;
    nr          = 2;
    condition   = DIA_Vlk_6016_copper_hiduei_condition;
    information = DIA_Vlk_6016_copper_hiduei_info;
    permanent   = FALSE;
    important   = TRUE;
};

FUNC INT DIA_Vlk_6016_copper_hiduei_condition ()
{
    return TRUE;
};

FUNC VOID DIA_Vlk_6016_copper_hiduei_info ()
{
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_0"); //He du! Warte mal!
	AI_Output(other,self,"DIA_Vlk_6016_copper_hiduei_15_1"); //Ich?
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_2"); //Ja genau, es ist ja sonst niemand hier.
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_3"); //Mein Auftraggeber hat mir gesagt, dass ich hier auf jemanden warten soll.
	AI_Output(other,self,"DIA_Vlk_6016_copper_hiduei_15_4"); //Aha. Und wer ist dein Auftraggeber?
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_5"); //Er heißt Reton.
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_6"); //Er hat gesagt, dass ich den Typ, der hier vorbei kommt, zu ihm schicken soll. 
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_7"); //Das bist dann wohl du.
	AI_Output(other,self,"DIA_Vlk_6016_copper_hiduei_15_8"); //Und wo ist dieser Reton?
	AI_Output(self,other,"DIA_Vlk_6016_copper_hiduei_15_9"); //Er sagt, er wird am Leuchtturm auf dich warten.

	Log_CreateTopic (TOPIC_reton, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_reton, LOG_RUNNING);
	B_LogEntry (TOPIC_reton,"Ein Typ bei Xardas Turm hat mir gesagt, dass beim Leuchtturm ein Typ namens Reton auf mich wartet.");
};

INSTANCE DIA_Vlk_6016_copper_waffe (C_Info)
{
    npc         = Vlk_6016_copper;
    nr          = 2;
    condition   = DIA_Vlk_6016_copper_waffe_condition;
    information = DIA_Vlk_6016_copper_waffe_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hast du Ausrüstung für mich?";
};

FUNC INT DIA_Vlk_6016_copper_waffe_condition ()
{
    return TRUE;
};

FUNC VOID DIA_Vlk_6016_copper_waffe_info ()
{
	AI_Output(other,self,"DIA_Vlk_6016_copper_waffe_15_0"); //Hast du Ausrüstung für mich? 
	AI_Output(self,other,"DIA_Vlk_6016_copper_waffe_15_1"); //Gut, dass du das fragst. Reton hat mir ein Kurzschwert für dich mitgegeben.
	AI_Output(self,other,"DIA_Vlk_6016_copper_waffe_15_2"); //Du sollst es ihm wiedergeben, wenn du es nicht mehr brauchst.

	B_GiveInvItems (self, other, ItMw_Retonsschwert, 1);

	Log_CreateTopic (TOPIC_retonschwert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_retonschwert, LOG_RUNNING);
	B_LogEntry (TOPIC_retonschwert,"Copper hat mir ein Schwert gegeben, das Reton gehört. Ich soll es ihm zurückgeben, wenn ich es nicht mehr brauche.");
};

INSTANCE DIA_Vlk_6016_copper_w (C_Info)
{
    npc         = Vlk_6016_copper;
    nr          = 2;
    condition   = DIA_Vlk_6016_copper_w_condition;
    information = DIA_Vlk_6016_copper_w_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Wie gehts?";
};
FUNC INT DIA_Vlk_6016_copper_w_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vlk_6016_copper_w_info ()
{
    AI_Output(other,self,"DIA_Vlk_6016_copper_w_15_0"); //Wie gehts? 
    AI_Output(self,other,"DIA_Vlk_6016_copper_w_15_1"); //Grauenhaft! Du weißt gar nicht, wie langweilig es ist, den Turm hier zu bewachen. 
};

   