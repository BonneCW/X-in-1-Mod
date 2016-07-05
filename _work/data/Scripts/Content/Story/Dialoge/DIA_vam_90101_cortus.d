
instance DIA_CORTUS_EXIT(C_Info)
{
	npc = vam_90101_cortus;
	nr = 999;
	condition = dia_cortus_exit_condition;
	information = dia_cortus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_cortus_exit_condition()
{
	return TRUE;
};

func void dia_cortus_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_CORTUS_HALLO(C_Info)
{
	npc = vam_90101_cortus;
	nr = 998;
	condition = dia_cortus_hallo_condition;
	information = dia_cortus_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_cortus_hallo_condition()
{
	if (SC_Ist_Ein_Vampir == TRUE)
	{
		return TRUE;
	};
};

func void dia_cortus_hallo_info()
{
	AI_Output (self, other, "Dia_Cortus_hallo_00");	//Willkommen Fremder!
	AI_Output (self, other, "Dia_Cortus_hallo_01");	//Ah, ich sp�re, dass du auch ein Vampir bist! Du kommst von der anderen Seite?
	AI_Output (other, self, "Dia_Cortus_hallo_02");	//Ja, wer...
	B_GivePlayerXP (250);
	AI_Output (self, other, "Dia_Cortus_hallo_03");	//Ich bin Cortus, vom Blood-Clan. Am besten du gehst direkt zu unserem Anf�hrer Drusus.
	AI_Output (self, other, "Dia_Cortus_hallo_04");	//Es wird ihn bestimmt interessieren, dass es auf der anderen Seite auch Vampire gibt. Von welchem Clan bist du?
	Info_ClearChoices (dia_cortus_hallo);
	Info_AddChoice (dia_cortus_hallo, "Ich geh�re dem Silver-Clan an.", dia_cortus_hallo_silver);
	Info_AddChoice (dia_cortus_hallo, "Ich geh�re keinem Clan an.", dia_cortus_hallo_keiner);
};

func void dia_versteck()
{
	AI_Output (other, self, "Dia_Cortus_hallo_10");	//Wo finde ich Drusus?
	AI_Output (self, other, "Dia_Cortus_hallo_11");	//Er ist in unserem Versteck. Dazu gehst du nach S�dosten an einer alten Ruine vorbei, bis du zu einer alten Holzbr�cke gelangst.
	AI_Output (self, other, "Dia_Cortus_hallo_12");	//Unter der Br�cke befindet sich eine alte H�hle, entweder du nimmst den nat�rlichen Weg, der an einpaar Ruinen vorbei nach unten f�hrt
	AI_Output (self, other, "Dia_Cortus_hallo_13");	//oder du ben�tzt die Leitern, aber pass auf dass du nicht runterf�llst. In der H�hle findest dann du unser Versteck.
	Info_ClearChoices (dia_cortus_hallo);
	AI_StopProcessInfos (self);
	Log_CreateTopic (BLOODCLAN, LOG_MISSION);
	Log_SetTopicStatus (BLOODCLAN, LOG_Running);
	B_LogEntry (BLOODCLAN, "Um den Anf�hrer des jharkendarischen Vampir-Clans zu finden muss ich nach S�dosten, an einer Ruine vorbei bis zu einer Holzbr�cke gehen. Unter der Br�cke ist eine H�hle, in der sich der Anf�hrer befindet.");
	Npc_ExchangeRoutine (self, "Gammel");
};

func void dia_cortus_hallo_silver()
{
	AI_Output (other, self, "Dia_Cortus_hallo_05");	//Ich geh�re dem Silver-Clan an.
	AI_Output (self, other, "Dia_Cortus_hallo_06");	//Silver-Clan? Noch nie geh�rt. Aber vielleicht wei� Drusus mehr.
	Info_ClearChoices (dia_cortus_hallo);
	dia_versteck ();
};

func void dia_cortus_hallo_keiner()
{
	AI_Output (other, self, "Dia_Cortus_hallo_07");	//Ich geh�re kienem Clan an.
	AI_Output (self, other, "Dia_Cortus_hallo_08");	//Du bist noch ohne Clan? Dann solltest du dich uns anschlie�en, wir brauchen dringen neue Mitglieder.
	Info_ClearChoices (dia_cortus_hallo);
	dia_versteck ();
};


instance DIA_CORTUS_PORTAL(C_Info)
{
	npc = vam_90101_cortus;
	nr = 1;
	condition = dia_cortus_portal_condition;
	information = dia_cortus_portal_info;
	important = FALSE;
	permanent = TRUE;
	description = "Warum gehst du nicht durch das Portal?";
};


func int dia_cortus_portal_condition()
{
	if (Npc_KnowsInfo (hero, dia_cortus_hallo) && (CORTUS_BDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cortus_portal_info()
{
	AI_Output (other, self, "Dia_Cortus_portal_00");	//Warum gehst du nicht durch das Portal?
	AI_Output (self, other, "Dia_Cortus_portal_01");	//Also die Protaltechnik ist mir nicht ganz geheuer. Vielleicht erfahre ich durch die Schriften hier mehr dar�ber.
};


var int cortus_banditen;

instance DIA_CORTUS_BANDITEN(C_Info)
{
	npc = vam_90101_cortus;
	nr = 800;
	condition = dia_cortus_banditen_condition;
	information = dia_cortus_banditen_info;
	important = FALSE;
	permanent = FALSE;
	description = "Drusus hat einen neuen Befehl";
};


func int dia_cortus_banditen_condition()
{
	if (CORTUS_BDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_cortus_banditen_info()
{
	AI_Output (other, self, "Dia_Cortus_Banditen_00");	//Drusus hat einen neuen Befehl.
	AI_Output (self, other, "Dia_Cortus_Banditen_01");	//Was gibts?
	AI_Output (other, self, "Dia_Cortus_Banditen_02");	//Du sollst mich bei einer Sache mit den Banditen unterst�tzen.
	CORTUS_BANDITEN = TRUE;
};


var int tick2;

instance DIA_CORTUS_RUESSI(C_Info)
{
	npc = vam_90101_cortus;
	nr = 799;
	condition = dia_cortus_ruessi_condition;
	information = dia_cortus_ruessi_info;
	important = FALSE;
	permanent = TRUE;
	description = "Hier nimm eine R�stung";
};


func int dia_cortus_ruessi_condition()
{
	if (Npc_KnowsInfo (other, dia_cortus_banditen) && (TICK2 != TRUE))
	{
		return TRUE;
	};
};

func void dia_cortus_ruessi_info()
{
	AI_Output (other, self, "Dia_Cortus_Banditen_03");	//Hier nimm eine R�stung, damit sie glauben du w�rst einer von ihnen:
	Info_ClearChoices (dia_cortus_ruessi);
	Info_AddChoice (dia_cortus_ruessi, Dialog_Back, dia_cortus_banditen_back);
	if (Npc_HasItems (other, ItAr_BDT_M) > 0)
	{
		Info_AddChoice (dia_cortus_ruessi, "Mittlere Banditenr�stung", dia_cortus_banditen_m);
	};
	if (Npc_HasItems (other, ItAr_BDT_H) > 0)
	{
		Info_AddChoice (dia_cortus_ruessi, "Schwere Banditenr�stung", dia_cortus_banditen_h);
	};
	if (Npc_HasItems (other, ITAR_Thorus_Addon) > 0)
	{
		Info_AddChoice (dia_cortus_ruessi, "Garder�stung", dia_cortus_banditen_g);
	};
};

func void dia_cortus_banditen_back()
{
	AI_Output (other, self, "Dia_eremit_Banditen_33");	//Warte noch einen Moment.
	Info_ClearChoices (dia_cortus_ruessi);
};

func void dia_cortus_banditen_m()
{
	B_GiveInvItems (other, self, ItAr_BDT_M, 1);
	AI_EquipArmor (self, ItAr_BDT_M);
	RUESSI_GIVEN = TRUE;
	TICK2 = TRUE;
	Info_ClearChoices (dia_cortus_ruessi);
};

func void dia_cortus_banditen_h()
{
	B_GiveInvItems (other, self, ItAr_BDT_H, 1);
	AI_EquipArmor (self, ItAr_BDT_H);
	RUESSI_GIVEN = TRUE;
	TICK2 = TRUE;
	Info_ClearChoices (dia_cortus_ruessi);
};

func void dia_cortus_banditen_g()
{
	B_GiveInvItems (other, self, ITAR_Thorus_Addon, 1);
	AI_EquipArmor (self, ITAR_Thorus_Addon);
	RUESSI_GIVEN = TRUE;
	TICK2 = TRUE;
	Info_ClearChoices (dia_cortus_ruessi);
};


instance DIA_CORTUS_LAGER(C_Info)
{
	npc = vam_90101_cortus;
	nr = 2;
	condition = dia_cortus_lager_condition;
	information = dia_cortus_lager_info;
	important = FALSE;
	permanent = FALSE;
	description = "Wir treffen uns dann im Lager";
};


func int dia_cortus_lager_condition()
{
	if ((RUESSI_GIVEN == TRUE) && Npc_KnowsInfo (hero, dia_cortus_banditen))
	{
		return TRUE;
	};
};

func void dia_cortus_lager_info()
{
	AI_Output (other, self, "Dia_Cortus_Banditen_Lager_00");	//Wir treffen uns dann im Lager!
	AI_Output (self, other, "Dia_Cortus_Banditen_Lager_01");	//Okay! Wenn es Nacht ist.
	self.guild = GIL_STRF;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self, "LAGER");
};


instance DIA_CORTUS_LAGERINFO(C_Info)
{
	npc = vam_90101_cortus;
	nr = 72;
	condition = dia_cortus_lagerinfo_condition;
	information = dia_cortus_lagerinfo_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wie ist die Lage?";
};


func int dia_cortus_lagerinfo_condition()
{
	if (JEMAND_DA == TRUE)
	{
		return TRUE;
	};
};

func void dia_cortus_lagerinfo_info()
{
	AI_Output (other, self, "Dia_Cortus_Lagerinfo_00");	//Wie ist die Lage?
	AI_Output (self, other, "Dia_Cortus_Lagerinfo_01");	//Alles ruhig!
	AI_StopProcessInfos (self);
};

