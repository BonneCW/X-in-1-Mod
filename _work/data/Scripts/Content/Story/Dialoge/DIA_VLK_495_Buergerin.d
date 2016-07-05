
instance DIA_MAGD_EXIT(C_Info)
{
	npc = VLK_495_Buergerin;
	nr = 999;
	condition = dia_magd_exit_condition;
	information = dia_magd_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_magd_exit_condition()
{
	return TRUE;
};

func void dia_magd_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_MAGD_SKILL(C_Info)
{
	npc = VLK_495_Buergerin;
	nr = 1;
	condition = dia_magd_skill_condition;
	information = dia_magd_skill_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_magd_skill_condition()
{
	return TRUE;
};

func void watere()
{
	AI_Output (self, other, "Dia_Magd_skill_03");	//Mhmm... Gut, wenn sich die Dinge ‰ndern erz‰hls mir.
	AI_StopProcessInfos (self);
};

func void dia_magd_skill_info()
{
	AI_Output (self, other, "Dia_Magd_skill_00");	//Huch, ein Fremder! Du kommst wohl auﬂerhalb der Stadt?
	AI_Output (self, other, "Dia_Magd_skill_01");	//Das Leben dort drauﬂen muss ziemlich gef‰hrlich sein, ¸berall wilde Tiere und Monster!
	AI_Output (self, other, "Dia_Magd_skill_02");	//Ist es wirklich so gef‰hrlich, wie man sagt?
	Info_ClearChoices (dia_magd_skill);
	Info_AddChoice (dia_magd_skill, "Sich drauﬂen zu bewegen ist absoluter Selbstmord (Gegner 0.3 mal so stark)", dia_magd_skill_very_easy);
	Info_AddChoice (dia_magd_skill, "Es ist sehr gef‰hrlich da drauﬂen (Gegner 0.5 mal so stark)", dia_magd_skill_easy);
	Info_AddChoice (dia_magd_skill, "Wenn man vorsichtig ist, droht keine Gafahr (normale Gegnerst‰rke)", dia_magd_skill_normal);
	Info_AddChoice (dia_magd_skill, "Die meisten Viecher sind harmlos (Gegner 2 mal so stark)", dia_magd_skill_hard);
	Info_AddChoice (dia_magd_skill, "Die Monster sind so ungef‰hrlich wie Fliegen (Gegner 3 mal so stark)", dia_magd_skill_hardcore);
};

func void dia_magd_skill_very_easy()
{
	AI_Output (other, self, "Dia_Magd_skill_very_easy_00");	//Sich drauﬂen zu bewegen ist absoluter Selbstmord!
	MFAKTOR = 3;
	Info_ClearChoices (dia_magd_skill);
	watere ();
};

func void dia_magd_skill_easy()
{
	AI_Output (other, self, "Dia_Magd_skill_easy_00");	//Es ist sehr gef‰hrlich da drauﬂen!
	MFAKTOR = 5;
	Info_ClearChoices (dia_magd_skill);
	watere ();
};

func void dia_magd_skill_normal()
{
	AI_Output (other, self, "Dia_Magd_skill_normal_00");	//Wenn man vorsichtig ist, droht keine Gafahr!
	MFAKTOR = 10;
	Info_ClearChoices (dia_magd_skill);
	watere ();
};

func void dia_magd_skill_hard()
{
	AI_Output (other, self, "Dia_Magd_skill_hard_00");	//Die meisten Viecher sind harmlos!
	MFAKTOR = 20;
	Info_ClearChoices (dia_magd_skill);
	watere ();
};

func void dia_magd_skill_hardcore()
{
	AI_Output (other, self, "Dia_Magd_skill_hardcore_00");	//Die Monster sind so ungef‰hrlich, wie Fliegen !
	MFAKTOR = 30;
	Info_ClearChoices (dia_magd_skill);
	watere ();
};


instance DIA_MAGD_SET(C_Info)
{
	npc = VLK_495_Buergerin;
	nr = 1;
	condition = dia_magd_set_condition;
	information = dia_magd_set_info;
	important = FALSE;
	permanent = TRUE;
	description = "Die Dinge haben sich ge‰ndert:";
};


func int dia_magd_set_condition()
{
	if (Npc_KnowsInfo (other, dia_magd_skill))
	{
		return TRUE;
	};
};

func void dia_magd_set_info()
{
	AI_Output (other, self, "Dia_Magd_set_00");	//Die Dinge haben sich ge‰ndert:
	Info_ClearChoices (dia_magd_set);
	Info_AddChoice (dia_magd_set, "Sich drauﬂen zu bewegen ist absoluter Selbstmord (Gegner 0.3 mal so stark)", dia_magd_set_very_easy);
	Info_AddChoice (dia_magd_set, "Es ist sehr gef‰hrlich da drauﬂen (Gegner 0.5 mal so stark)", dia_magd_set_easy);
	Info_AddChoice (dia_magd_set, "Wenn man vorsichtig ist, droht keine Gafahr (normale Gegnerst‰rke)", dia_magd_set_normal);
	Info_AddChoice (dia_magd_set, "Die meisten Viecher sind harmlos (Gegner 2 mal so stark)", dia_magd_set_hard);
	Info_AddChoice (dia_magd_set, "Die Monster sind so ungef‰hrlich wie Fliegen (Gegner 3 mal so stark)", dia_magd_set_hardcore);
};

func void dia_magd_set_very_easy()
{
	AI_Output (other, self, "Dia_Magd_skill_very_easy_00");	//Sich drauﬂen zu bewegen ist absoluter Selbstmord!
	MFAKTOR = 3;
	Info_ClearChoices (dia_magd_set);
	watere ();
};

func void dia_magd_set_easy()
{
	AI_Output (other, self, "Dia_Magd_skill_easy_00");	//Es ist sehr gef‰hrlich da drauﬂen!
	MFAKTOR = 5;
	Info_ClearChoices (dia_magd_set);
	watere ();
};

func void dia_magd_set_normal()
{
	AI_Output (other, self, "Dia_Magd_skill_normal_00");	//Wenn man vorsichtig ist, droht keine Gafahr!
	MFAKTOR = 10;
	Info_ClearChoices (dia_magd_set);
	watere ();
};

func void dia_magd_set_hard()
{
	AI_Output (other, self, "Dia_Magd_skill_hard_00");	//Die meisten Viecher sind harmlos!
	MFAKTOR = 20;
	Info_ClearChoices (dia_magd_set);
	watere ();
};

func void dia_magd_set_hardcore()
{
	AI_Output (other, self, "Dia_Magd_skill_hardcore_00");	//Die Monster sind so ungef‰hrlich, wie Fliegen !
	MFAKTOR = 30;
	Info_ClearChoices (dia_magd_set);
	watere ();
};

