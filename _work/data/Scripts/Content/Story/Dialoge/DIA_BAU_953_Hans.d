
instance DIA_HANS_EXIT(C_Info)
{
	npc = BAU_953_Bauer;
	nr = 999;
	condition = dia_hans_exit_condition;
	information = dia_hans_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hans_exit_condition()
{
	return TRUE;
};

func void dia_hans_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_HANS_FLEISCH(C_Info)
{
	npc = BAU_953_Bauer;
	nr = 24;
	condition = dia_hans_fleisch_condition;
	information = dia_hans_fleisch_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hans_fleisch_condition()
{
	return TRUE;
};

func void dia_hans_fleisch_info()
{
	AI_Output (self, other, "Dia_Hans_Fleisch_ruhe_01");	//Hey, du!
	AI_Output (other, self, "Dia_Hans_Fleisch_ruhe_00");	//Ich?
	AI_Output (self, other, "Dia_Hans_Fleisch_ruhe_02");	//Ja, du scheinst nicht von hier zu sein.
	Info_ClearChoices (dia_hans_fleisch);
	Info_AddChoice (dia_hans_fleisch, "Lass mich in Ruhe!", dia_hans_fleisch_ruhe);
	Info_AddChoice (dia_hans_fleisch, "Was willst du?", dia_hans_fleisch_what);
};

func void dia_hans_fleisch_ruhe()
{
	AI_Output (other, self, "Dia_Hans_Fleisch_ruhe_03");	//Lass mich in Ruhe!
	AI_Output (self, other, "Dia_Hans_Fleisch_ruhe_04");	//Wie du willst!
	Info_ClearChoices (dia_hans_fleisch);
	AI_StopProcessInfos (self);
};

func void dia_hans_fleisch_what()
{
	AI_Output (other, self, "Dia_Hans_Fleisch_what_00");	//Was willst du?
	AI_Output (self, other, "Dia_Hans_Fleisch_what_01");	//Du könntest mir einen kleinen Gefallen tun:
	AI_Output (self, other, "Dia_Hans_Fleisch_what_02");	//Lobart hat als Strafe für etwas, was dich nicht zu interessieren braucht, meine Nahrungsration gekürzt.
	AI_Output (self, other, "Dia_Hans_Fleisch_what_03");	//Nur ein halbes Stück Brot am Tag! Ich sterbe vor Hunger!
	AI_Output (other, self, "Dia_Hans_Fleisch_what_04");	//Und was soll ich machen?
	AI_Output (self, other, "Dia_Hans_Fleisch_what_05");	//Ganz einfach: Besorge mir 5 Stück gebratenes Fleisch.
	AI_Output (self, other, "Dia_Hans_Fleisch_what_06");	//Mir ist völlig egal wie du drankommst, wenn du verstehst was ich meine.
	AI_Output (self, other, "Dia_Hans_Fleisch_what_07");	//Aber kein Wort zu Lobart oder jemand Anderem.
	AI_Output (other, self, "Dia_Hans_Fleisch_what_08");	//Ich werd sehen was ich machen kann!
	Log_CreateTopic (HUNGRIGER_BAUER, LOG_MISSION);
	Log_SetTopicStatus (HUNGRIGER_BAUER, LOG_Running);
	HANSFLEISCH = TRUE;
	B_LogEntry (HUNGRIGER_BAUER, "Der Bauer Hans ist ziemlich hungrig. Ich soll ihm 5 Stück gebratenes Fleisch besorgen.");
	Info_ClearChoices (dia_hans_fleisch);
	AI_StopProcessInfos (self);
};


instance DIA_HANS_FLEISCH_IST_DA(C_Info)
{
	npc = BAU_953_Bauer;
	nr = 654;
	condition = dia_hans_fleisch_ist_da_condition;
	information = dia_hans_fleisch_ist_da_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe das Fleisch";
};


func int dia_hans_fleisch_ist_da_condition()
{
	if ((Npc_HasItems (other, ItFoMutton) >= 5) && (HANSFLEISCH == TRUE))
	{
		return TRUE;
	};
};

func void dia_hans_fleisch_ist_da_info()
{
	AI_Output (other, self, "Dia_Hans_Fleisch_ist_da_00");	//Ich habe das Fleisch
	B_GiveInvItems (other, self, ItFoMutton, 5);
	AI_Output (self, other, "Dia_Hans_Fleisch_ist_da_01");	//Danke! Danke!
	B_UseItem (self, ItFoMutton);
	AI_Output (self, other, "Dia_Hans_Fleisch_ist_da_02");	//Ich kann dir nicht viel geben, aber ich habe vor einiger Zeit eine seltsame Pflanze gefunden.
	AI_Output (self, other, "Dia_Hans_Fleisch_ist_da_03");	//Sie scheint ziemlich selten zu sein. Vielleicht kannst du sie in der Stadt für viel Gold verkaufen.
	B_GiveInvItems (self, other, ItPl_Perm_Herb, 1);
	Log_SetTopicStatus (HUNGRIGER_BAUER, LOG_SUCCESS);
	B_GivePlayerXP (100);
	AI_StopProcessInfos (self);
};

