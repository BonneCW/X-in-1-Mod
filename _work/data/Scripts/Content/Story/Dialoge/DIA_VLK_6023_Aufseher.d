INSTANCE DIA_Vlk_6023_aufseher_Exit (C_Info) // Fucking Chaosdialog!!
{
    npc         = Vlk_6023_aufseher;
    nr          = 999;
    condition   = DIA_Vlk_6023_aufseher_Exit_condition;
    information = DIA_Vlk_6023_aufseher_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "ENDE";
};
FUNC INT DIA_Vlk_6023_aufseher_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vlk_6023_aufseher_Exit_info ()
{
    AI_StopProcessInfos(self);
};


INSTANCE DIA_Vlk_6023_aufseher_hiduei (C_Info)
{
    npc         = Vlk_6023_aufseher;
    nr          = 2;
    condition   = DIA_VLK_6023_aufseher_hiduei_condition;
    information = DIA_Vlk_6023_aufseher_hiduei_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hi.";
};


FUNC INT DIA_Vlk_6023_aufseher_hiduei_condition ()
{

    return TRUE;

};
FUNC VOID DIA_Vlk_6023_aufseher_hiduei_info ()
{
 	AI_Output(other,self,"DIA_Vlk_6023_aufseher_hiduei_15_0"); //Hi.
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_hiduei_15_1"); //Hallo.
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_hiduei_15_2"); //Was ist deine Aufgabe hier?
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_hiduei_15_3"); //Ich passe auf, dass die Arbeiter auch die Arbeit machen, für die sie bezahlt werden.  	
};

INSTANCE DIA_Vlk_6023_aufseher_wielaufts (C_Info)
{
    npc         = Vlk_6023_aufseher;
    nr          = 2;
    condition   = DIA_VLK_6023_aufseher_wielaufts_condition;
    information = DIA_Vlk_6023_aufseher_wielaufts_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Wie läufts?";
};

FUNC INT DIA_Vlk_6023_aufseher_wielaufts_condition ()
{
    return TRUE;
};

FUNC VOID DIA_Vlk_6023_aufseher_wielaufts_info ()
{
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_wielaufts_15_0"); //Wie läufts?
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_wielaufts_15_1"); //Gut. Bisher hat noch niemand seine Arbeit vernachlässigt.
};

INSTANCE DIA_Vlk_6023_aufseher_wielauftsj (C_Info)
{
    npc         = Vlk_6023_aufseher;
    nr          = 2;
    condition   = DIA_VLK_6023_aufseher_wielauftsj_condition;
    information = DIA_Vlk_6023_aufseher_wielauftsj_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Wie läufts JETZT?";
};

FUNC INT DIA_Vlk_6023_aufseher_wielauftsj_condition ()
{
IF ( Npc_KnowsInfo(other,DIA_kdw_6019_reton_kapiteldrei))
   
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_6023_aufseher_wielauftsj_info ()
{
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_wielauftsj_15_0"); //Wie läufts JETZT?
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_wielauftsj_15_1"); //Beschissen! Da sitzt ein verdammter Minecrawler in unsrer schönen Mine!
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_wielauftsj_15_2"); //Toll! Dann geh rein und mach ihn platt!
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_wielauftsj_15_3"); //NEIN! Da bringen mich keine zehn Wargs rein!
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_wielauftsj_15_4"); //Soll ich dir den Sold kürzen?
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_wielauftsj_15_5"); //Mach doch... solang ich da nicht rein muss...

	Wld_InsertNpc	(aminecrawler, "HL_MC");

	Log_CreateTopic (TOPIC_malert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_malert, LOG_RUNNING);
	B_LogEntry (TOPIC_malert,"Die Buddler haben sich von einem Minecrawler aus der Mine vertreiben lassen und natürlich bleibt es wieder an mir das verdammte Ding zu beseitigen. Hat Lee auch so Probleme?");
};

INSTANCE DIA_Vlk_6023_aufseher_wielauftsjnm (C_Info)
{
    npc         = Vlk_6023_aufseher;
    nr          = 2;
    condition   = DIA_VLK_6023_aufseher_wielauftsjnm_condition;
    information = DIA_Vlk_6023_aufseher_wielauftsjnm_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "So, das Vieh is tot.";
};
FUNC INT DIA_Vlk_6023_aufseher_wielauftsjnm_condition ()
{
IF ( Npc_KnowsInfo(other,DIA_Vlk_6023_aufseher_wielauftsj))
&&  Npc_IsDead(aminecrawler) 
   
{
    return TRUE;
};
};
FUNC VOID DIA_Vlk_6023_aufseher_wielauftsjnm_info ()
{
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_wielauftsjnm_15_0"); //So, das Vieh is tot.
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_wielauftsjnm_15_1"); //Danke, aber das hätte ich auch geschafft.
	AI_Output(other,self,"DIA_Vlk_6023_aufseher_wielauftsjnm_15_2"); //Halt deine Fresse und beweg deinen Arsch in die Mine!
	AI_Output(self,other,"DIA_Vlk_6023_aufseher_wielauftsjnm_15_3"); //Okay...
 
	MIS_malert = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_malert, LOG_SUCCESS);
	B_CheckLog();

	B_GivePlayerXP (500);    //xp verteilung
	Npc_ExchangeRoutine (self, "START");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6001_mythrilarbeiter, "START");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6002_mythrilarbeiter, "START");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6003_mythrilarbeiter, "START");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6004_mythrilarbeiter, "START");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6008_Soeldner, "START");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6009_Soeldner, "START");  //Routinenwechsel
};