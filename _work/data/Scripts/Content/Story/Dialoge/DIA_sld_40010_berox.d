instance DIA_BEROX_EXIT(C_Info)
{
	npc = sld_40010_berox;
	nr = 999;
	condition = dia_berox_exit_condition;
	information = dia_berox_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_berox_exit_condition()
{
	return TRUE;
};

func void dia_berox_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_BEROX_RITUAL(C_Info)
{
	npc = sld_40010_berox;
	nr = 998;
	condition = dia_berox_ritual_condition;
	information = dia_berox_ritual_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hast du das Ritualmesser?";
};


func int dia_berox_ritual_condition()
{
	if (Npc_KnowsInfo (other, dia_ardok_kahr_blutritual_4) && (DIMITRI_RITUAL == FALSE) && (VAMPIRGILDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_berox_ritual_info()
{
	AI_Output (other, self, "Dia_Berox_Ritual_00");	//Hast du das Ritualmesser?
	AI_Output (self, other, "Dia_Berox_Ritual_01");	//Welches Ritualmesser? Achja! Richtig! Das Ritualmesser für das Blutritual.
	AI_Output (other, self, "Dia_Berox_Ritual_02");	//Ja! Hast du es?
	AI_Output (self, other, "Dia_Berox_Ritual_03");	//Nein, also ich hab das nicht. Frag mal Dimitri.
	AI_Output (other, self, "Dia_Berox_Ritual_04");	//Werde ich.
	B_GivePlayerXP (20);
	BEROX_RITUAL = TRUE;
};


instance DIA_BEROX_BRUDER(C_Info)
{
	npc = sld_40010_berox;
	nr = 800;
	condition = dia_berox_bruder_condition;
	information = dia_berox_bruder_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ardoc hat mir eine Frage wegen seinem Bruder gestellt...";
};


func int dia_berox_bruder_condition()
{
	if ((BROTHERSDEATH == TRUE) && (VAMPIRGILDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_berox_bruder_info()
{
	AI_Output (other, self, "Dia_Berox_Bruder_00");	//Ardoc hat mir eine Frage wegen seinem Bruder gestellt...
	AI_Output (self, other, "Dia_Berox_Bruder_01");	//Es geht wohl um die Frageprüfung.
	AI_Output (other, self, "Dia_Berox_Bruder_02");	//Genau! Wann starb sein Bruder?
	AI_Output (self, other, "Dia_Berox_Bruder_03");	//Nee, kleiner, so einfach geht das nicht! Streng mal deinen Kopf an!
	AI_Output (self, other, "Dia_Berox_Bruder_04");	//Ich trau dir genug Grips zu das Rätsel selbst zu lösen!
};


instance DIA_BEROX_JOINSLD(C_Info)
{
	npc = sld_40010_berox;
	nr = 400;
	condition = dia_berox_joinsld_condition;
	information = dia_berox_joinsld_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ich will mich den Söldnern anschließen!";
};


func int dia_berox_joinsld_condition()
{
	if ((other.guild == GIL_NONE) && (BEROX_STIMME == FALSE))
	{
		return TRUE;
	};
};

func void dia_berox_joinsld_info()
{
	AI_Output (other, self, "Dia_Berox_joinsld_00");	//Ich will mich den Söldnern anschließen!
	if (VAMPIRGILDE == FALSE)
	{
		AI_Output (self, other, "Dia_Berox_joinsld_01");	//Und? Beweis uns einfach was du draufhast. Dann bist du dabei.
	}
	else
	{
		AI_Output (self, other, "Dia_Berox_joinsld_02");	//Ardoc hat dich in unseren Clan aufgenommen! Natürlich werde ich für deine Aufnahme bei den Söldnern stimmen!
		B_GivePlayerXP (100);
		BEROX_STIMME = TRUE;
	};
};


var int berox_merke1h;
var int berox_labercount;

instance DIA_BEROX_TEACH(C_Info)
{
	npc = sld_40010_berox;
	nr = 997;
	condition = dia_berox_teach_condition;
	information = dia_berox_teach_info;
	permanent = TRUE;
	description = "Kannst du mich trainieren?";
};


func int dia_berox_teach_condition()
{
	return TRUE;
};

func void dia_berox_teach_info()
{
	AI_Output (other, self, "DIA_berox_Teach_15_00");	//Kannst du mich trainieren?
	AI_Output (self, other, "DIA_berox_Teach_01");	//Klar.
	BEROX_MERKE1H = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices (dia_berox_teach);
	Info_AddChoice (dia_berox_teach, Dialog_Back, dia_berox_teach_back);
	Info_AddChoice (dia_berox_teach, B_BuildLearnString (PRINT_Learn1h1, B_GetLearnCostTalent (other, NPC_TALENT_1H, 1)), dia_berox_teach_1h_1);
	Info_AddChoice (dia_berox_teach, B_BuildLearnString (PRINT_Learn1h5, B_GetLearnCostTalent (other, NPC_TALENT_1H, 1) * 5), dia_berox_teach_1h_5);
};

func void dia_berox_teach_back()
{
	if (other.HitChance[NPC_TALENT_1H] >= 40)
	{
		AI_Output (self, other, "DIA_berox_Teach_Back_07_00");	//Wenn du noch besser werden willst, dann musst du dir 'nen Anderen suchen.
	};
	Info_ClearChoices (dia_berox_teach);
};

func void dia_berox_teach_1h_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 40);
	Info_ClearChoices (dia_berox_teach);
	Info_AddChoice (dia_berox_teach, Dialog_Back, dia_berox_teach_back);
	Info_AddChoice (dia_berox_teach, B_BuildLearnString (PRINT_Learn1h1, B_GetLearnCostTalent (other, NPC_TALENT_1H, 1)), dia_berox_teach_1h_1);
	Info_AddChoice (dia_berox_teach, B_BuildLearnString (PRINT_Learn1h5, B_GetLearnCostTalent (other, NPC_TALENT_1H, 1) * 5), dia_berox_teach_1h_5);
};

func void dia_berox_teach_1h_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 40);
	Info_ClearChoices (dia_berox_teach);
	Info_AddChoice (dia_berox_teach, Dialog_Back, dia_berox_teach_back);
	Info_AddChoice (dia_berox_teach, B_BuildLearnString (PRINT_Learn1h1, B_GetLearnCostTalent (other, NPC_TALENT_1H, 1)), dia_berox_teach_1h_1);
	Info_AddChoice (dia_berox_teach, B_BuildLearnString (PRINT_Learn1h5, B_GetLearnCostTalent (other, NPC_TALENT_1H, 1) * 5), dia_berox_teach_1h_5);
};

