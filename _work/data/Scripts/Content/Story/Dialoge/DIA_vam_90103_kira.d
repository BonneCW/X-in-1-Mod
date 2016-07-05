
instance DIA_KIRA_EXIT(C_Info)
{
	npc = vam_90103_kira;
	nr = 999;
	condition = dia_kira_exit_condition;
	information = dia_kira_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_kira_exit_condition()
{
	return TRUE;
};

func void dia_kira_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_KIRA_WELCOME(C_Info)
{
	npc = vam_90103_kira;
	nr = 998;
	condition = dia_kira_welcome_condition;
	information = dia_kira_welcome_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_kira_welcome_condition()
{
	return TRUE;
};

func void dia_kira_welcome_info()
{
	AI_Output (self, other, "Dia_Kira_Welcome_00");	//Wer...? Du? Du bist ein Vampir? Ich glaub's nicht!
	AI_Output (other, self, "Dia_Kira_Welcome_01");	//Ich auch nicht...
	AI_Output (self, other, "Dia_Kira_Welcome_02");	//Bist du durch das Portal gekommen? Wie diese Wassermagier?
	AI_Output (other, self, "Dia_Kira_Welcome_03");	//Ja.
	AI_Output (self, other, "Dia_Kira_Welcome_04");	//Du solltest mit Drusus reden, ich glaube, dass das ganze ihn interessieren würde.
	AI_Output (self, other, "Dia_Kira_Welcome_05");	//Außerdem brauchen wir neue Mitglieder, Rodan hat den Schlaf nicht überlebt.
	AI_Output (other, self, "Dia_Kira_Welcome_06");	//Schlaf?
	AI_Output (self, other, "Dia_Kira_Welcome_07");	//Drusus wird es dir erklären. Er ist sehr weise, sprich mit ihm.
	AI_Output (self, other, "Dia_Kira_Welcome_08");	//Achja: Ich bin übrigens Kira. Wenn du willst, kann ich dir den Umgang mit Schwertern beibringen.
	B_GivePlayerXP (250);
};


var int daydo;

instance DIA_KIRA_CLANAUFNAHME(C_Info)
{
	npc = vam_90103_kira;
	nr = 990;
	condition = dia_kira_clanaufnahme_condition;
	information = dia_kira_clanaufnahme_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_kira_clanaufnahme_condition()
{
	if (VAMPIRGILDE_ADW == TRUE)
	{
		return TRUE;
	};
};

func void dia_kira_clanaufnahme_info()
{
	AI_Output (self, other, "Dia_Kira_Clanaufnahme_00");	//Hey, willkommen im Clan, Kleiner!
	AI_Output (self, other, "Dia_Kira_Clanaufnahme_01");	//Hier, ein kleines Willkommensgeschenk von mir!
	B_GivePlayerXP (100);
	B_GiveInvItems (self, other, ItRu_Fear, 1);
	DAYDO = Wld_GetDay ();
};


instance DIA_KIRA_QUEST(C_Info)
{
	npc = vam_90103_kira;
	nr = 80;
	condition = dia_kira_quest_condition;
	information = dia_kira_quest_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_kira_quest_condition()
{
	if (Npc_KnowsInfo (other, dia_kira_clanaufnahme) && (DAYDO < Wld_GetDay ()))
	{
		return TRUE;
	};
};

func void dia_kira_quest_info()
{
	AI_Output (self, other, "Dia_Kira_Quest_00");	//Hey, warte mal! Ich hab da was zu tun für dich.
	AI_Output (other, self, "Dia_Kira_Quest_01");	//Was gibts?
	AI_Output (self, other, "Dia_Kira_Quest_02");	//Kurz vor der Flut, fanden wir eine seltsame Steintafel in einer Sprache, die wohl älter war, als die jharkendarische Kultur.
	AI_Output (self, other, "Dia_Kira_Quest_03");	//Wir versuchten sie zu übersetzen, doch ohne erfolg. Das einzige, was wir herausbekamen war, dass sich der Text um Blut dreht.
	AI_Output (self, other, "Dia_Kira_Quest_04");	//Cortus hat uns berichtet, dass die Magier, die hierher gekommen sind anscheinend einen Sprachgelehrten unter sich haben.
	AI_Output (other, self, "Dia_Kira_Quest_05");	//Ja, ich kenne ihn, er heißt Myxir.
	AI_Output (self, other, "Dia_Kira_Quest_06");	//Gut, vielleicht kann er da was machen. Die Tafel liegt irgendwo in der Bibliothek.
	AI_Output (self, other, "Dia_Kira_Quest_07");	//Viel Glück und pass auf deinen Rücken auf!
	AI_StopProcessInfos (self);
	Log_CreateTopic (Language, LOG_MISSION);
	Log_SetTopicStatus (Language, LOG_Running);
	B_LogEntry (Language, "Kira, hat mich gebeten eine fremdsprachige Tafel aus der Bibliothek zu holen und den Wassermagier zu bitten sie zu übersetzen.");
};


instance DIA_KIRA_TAFEL_TRANSLATET(C_Info)
{
	npc = vam_90103_kira;
	nr = 78;
	condition = dia_kira_tafel_translatet_condition;
	information = dia_kira_tafel_translatet_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe die Übersetzung!";
};


func int dia_kira_tafel_translatet_condition()
{
	if (Npc_HasItems (other, itwr_translation) >= 1)
	{
		return TRUE;
	};
};

func void dia_kira_tafel_translatet_info()
{
	AI_Output (other, self, "Dia_Kira_Tafel_translatet_00");	//Ich habe die Übersetzung!
	AI_Output (self, other, "Dia_Kira_Tafel_translatet_01");	//Tatsächlich! Dieser Text ist mehr als interessant.
	AI_Output (self, other, "Dia_Kira_Tafel_translatet_02");	//Du hast uns einen großen Dienst erwiesen!
	Log_SetTopicStatus (Language, LOG_SUCCESS);
	B_GivePlayerXP (500);
};


var int kira_merke2h;

instance DIA_KIRA_TEACH(C_Info)
{
	npc = vam_90103_kira;
	nr = 997;
	condition = dia_kira_teach_condition;
	information = dia_kira_teach_info;
	permanent = TRUE;
	description = "Unterrichte mich!";
};


func int dia_kira_teach_condition()
{
	return TRUE;
};

func void dia_kira_teach_info()
{
	AI_Output (other, self, "DIA_Addon_Henry_Teach_15_00");	//Unterrichte mich!
	KIRA_MERKE2H = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices (dia_kira_teach);
	Info_AddChoice (dia_kira_teach, Dialog_Back, dia_kira_teach_back);
	Info_AddChoice (dia_kira_teach, B_BuildLearnString (PRINT_Learn2h1, B_GetLearnCostTalent (other, NPC_TALENT_2H, 1)), dia_kira_teach_2h_1);
	Info_AddChoice (dia_kira_teach, B_BuildLearnString (PRINT_Learn2h5, B_GetLearnCostTalent (other, NPC_TALENT_2H, 1) * 5), dia_kira_teach_2h_5);
};

func void dia_kira_teach_back()
{
	if (other.HitChance[NPC_TALENT_2H] >= 60)
	{
		AI_Output (self, other, "DIA_kira_Teach_Back_00");	//Du bist wirklich gut geworden.
	};
	Info_ClearChoices (dia_kira_teach);
};

func void dia_kira_teach_2h_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 60);
	Info_ClearChoices (dia_kira_teach);
	Info_AddChoice (dia_kira_teach, Dialog_Back, dia_kira_teach_back);
	Info_AddChoice (dia_kira_teach, B_BuildLearnString (PRINT_Learn2h1, B_GetLearnCostTalent (other, NPC_TALENT_2H, 1)), dia_kira_teach_2h_1);
	Info_AddChoice (dia_kira_teach, B_BuildLearnString (PRINT_Learn2h5, B_GetLearnCostTalent (other, NPC_TALENT_2H, 1) * 5), dia_kira_teach_2h_5);
};

func void dia_kira_teach_2h_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 60);
	Info_ClearChoices (dia_kira_teach);
	Info_AddChoice (dia_kira_teach, Dialog_Back, dia_kira_teach_back);
	Info_AddChoice (dia_kira_teach, B_BuildLearnString (PRINT_Learn2h1, B_GetLearnCostTalent (other, NPC_TALENT_2H, 1)), dia_kira_teach_2h_1);
	Info_AddChoice (dia_kira_teach, B_BuildLearnString (PRINT_Learn2h5, B_GetLearnCostTalent (other, NPC_TALENT_2H, 1) * 5), dia_kira_teach_2h_5);
};

