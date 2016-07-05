instance DIA_JAREK_EXIT(C_Info)
{
	npc = kdf_512_jarek;
	nr = 999;
	condition = dia_jarek_exit_condition;
	information = dia_jarek_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jarek_exit_condition()
{
	return TRUE;
};

func void dia_jarek_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_JAREK_HELLO(C_Info)
{
	npc = kdf_512_jarek;
	nr = 1;
	condition = dia_jarek_hello_condition;
	information = dia_jarek_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jarek_hello_condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_jarek_hello_info()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output (self, other, "DIA_Jarek_Hello_10_00");	//Wie kann ich dir helfen, Novize?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Jarek_Hello_10_01");	//Wie kann ich dir helfen, Bruder?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output (self, other, "DIA_Jarek_Hello_10_02");	//Die ehrenvollen Streiter Innos verirren sich selten in diese Räume.
		AI_Output (self, other, "DIA_Jarek_Hello_10_03");	//Dennoch befürchte ich, das ich dir leider nicht werde helfen können.
	}
	else
	{
		AI_Output (self, other, "DIA_Jarek_Hello_10_04");	//(misstrauisch) Was suchst du hier?
	};
};


instance DIA_JAREK_ARBEIT(C_Info)
{
	npc = kdf_512_jarek;
	nr = 2;
	condition = dia_jarek_arbeit_condition;
	information = dia_jarek_arbeit_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was ist Deine Aufgabe hier im Kloster?";
};


func int dia_jarek_arbeit_condition()
{
	if ((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_jarek_arbeit_info()
{
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_00");	//Ich studiere die heiligen Schriften Innos.
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_01");	//Weiterhin helfe ich den Dienern Innos, eine bessere Konzentration zu entwickeln.
	AI_Output (other, self, "DIA_Jarek_Arbeit_10_02");	//Wozu benötigt man eine bessere Konzentration?
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_03");	//Mit dem Schwur des Feuers und den ersten Runen liegt noch ein weiter Weg vor dem angehenden Magier.
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_04");	//Wer seine Runen einfach ins Blaue nutzt, muss sich nicht wundern, wenn er nach zwei Feuerbällen Kopfschmerzen hat und erst nach einer Nacht Ruhe wieder Zaubern kann.
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_05");	//Das gibt sich zwar mit zunehmender Erfahrung, jedoch erforsche ich Möglichkeiten, schon beim Zaubern übermässige Anstrengungen zu vermeiden.
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_06");	//Dies erreicht man durch eine bessere Konzentration auf die angewandte Rune.
	AI_Output (self, other, "DIA_Jarek_Arbeit_10_07");	//Wenn du es wünscht kann ich dir einige Grundlagen zeigen.
	Log_CreateTopic (Topic_KlosterTeacher, LOG_NOTE);
	B_LogEntry (Topic_KlosterTeacher, "Meister Jarek kann mir zeigen, wie ich mich beim Zaubern besser Konzentrieren kann.");
};


instance DIA_JAREK_TEACHER(C_Info)
{
	npc = kdf_512_jarek;
	nr = 3;
	condition = dia_jarek_teacher_condition;
	information = dia_jarek_teacher_info;
	important = FALSE;
	permanent = TRUE;
	description = "Kannst du mir was beibringen. ";
};


func int dia_jarek_teacher_condition()
{
	if ((other.guild == GIL_KDF) && (other.attribute[ATR_REGENERATEMANA] != REGENERATE_TIME_GRAD_1))
	{
		return TRUE;
	};
};

func void dia_jarek_teacher_info()
{
	AI_Output (self, other, "DIA_Jarek_Teacher_10_00");	//Ich kann dir zeigen, wie man sich schneller von Zaubern erholt.
	Info_ClearChoices (dia_jarek_teacher);
	Info_AddChoice (dia_jarek_teacher, Dialog_Back, dia_jarek_teacher_back);
	Info_AddChoice (dia_jarek_teacher, B_BuildLearnString ("Mana Regeneration II", B_GetLearnCostTalent (other, NPC_TALENT_REGENERATE, 1)), dia_jarek_teacher_regenerate_1);
	if (other.attribute[ATR_REGENERATEMANA] != REGENERATE_TIME_GRAD_0)
	{
		Info_AddChoice (dia_jarek_teacher, B_BuildLearnString ("Mana Regeneration I", B_GetLearnCostTalent (other, NPC_TALENT_REGENERATE, 0)), dia_jarek_teacher_regenerate_0);
	};
};

func void dia_jarek_teacher_regenerate_0()
{
	b_teachplayertalentregenerate (self, other, 0);
	Info_ClearChoices (dia_jarek_teacher);
};

func void dia_jarek_teacher_regenerate_1()
{
	b_teachplayertalentregenerate (self, other, 1);
	Info_ClearChoices (dia_jarek_teacher);
};

func void dia_jarek_teacher_back()
{
	Info_ClearChoices (dia_jarek_teacher);
};

