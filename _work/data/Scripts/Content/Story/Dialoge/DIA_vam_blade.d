
instance DIA_BLADE_HI_AND_DIE(C_Info)
{
	npc = vam_blade;
	nr = 22;
	condition = dia_blade_hi_and_die_condition;
	information = dia_blade_hi_and_die_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_blade_hi_and_die_condition()
{
	return TRUE;
};

func void dia_blade_hi_and_die_info()
{
	AI_Output (self, other, "Dia_Blade_HI_AND_DIE_00");	//Da bist du ja endlich, lass es uns zu Ende bringen.
	AI_Output (other, self, "Dia_Blade_HI_AND_DIE_01");	//Warte...
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 0);
};


var int heilungdessc;

instance DIA_BLADE_WHATHAPPENED(C_Info)
{
	npc = vam_blade;
	nr = 45;
	condition = dia_blade_whathappened_condition;
	information = dia_blade_whathappened_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_blade_whathappened_condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == TRUE) && Npc_KnowsInfo (other, dia_blade_hi_and_die))
	{
		return TRUE;
	};
};

func void dia_blade_whathappened_info()
{
	AI_Output (self, other, "Dia_Blade_whathappened_00");	//Du hast mich am Leben gelassen?
	Info_ClearChoices (dia_blade_whathappened);
	Info_AddChoice (dia_blade_whathappened, "Tut mir Leid, ich hab vergessen dich zu töten, ich hol's schnell nach.", dia_blade_whathappened_kill);
	if (SELL_SOUL == FALSE)
	{
		Info_AddChoice (dia_blade_whathappened, "Ich bin nicht so wie die anderen Vampire.", dia_blade_whathappened_help);
	};
};

func void dia_blade_whathappened_kill()
{
	AI_Output (other, self, "Dia_Blade_whathappened_kill_01");	//Tut mir Leid, ich hab vergessen dich zu töten, ich hol's schnell nach.
	Info_ClearChoices (dia_blade_whathappened);
	AI_StopProcessInfos (self);
	self.guild = GIL_BDT;
	B_Attack (self, other, AR_KILL, 0);
};

func void dia_blade_whathappened_help()
{
	AI_Output (other, self, "Dia_Blade_whathappened_help_08");	//Ich bin nicht so wie die anderen Vampire.
	AI_Output (self, other, "Dia_Blade_whathappened_help_07");	//Das bist du wirklich.
	AI_Output (other, self, "Dia_Blade_whathappened_help_02");	//Ich wollte gar kein Vampir sein, aber irgendjemand machte mich gegen meinen Willen zu einem.
	AI_Output (self, other, "Dia_Blade_whathappened_help_03");	//Vielleicht kann ich dir helfen. Hier nimm diesen Zettel. Dort steht ein altes Rezept gegen Vampirismus.
	AI_Output (self, other, "Dia_Blade_whathappened_help_04");	//Vielleicht kann es dich heilen.
	CreateInvItems (self, itwr_heilung, 1);
	B_GivePlayerXP (500);
	B_GiveInvItems (self, other, itwr_heilung, 1);
	HEILUNGDESSC = TRUE;
	Info_ClearChoices (dia_blade_whathappened);
};


instance DIA_BLADE_END(C_Info)
{
	npc = vam_blade;
	nr = 45;
	condition = dia_blade_end_condition;
	information = dia_blade_end_info;
	important = FALSE;
	permanent = FALSE;
	description = "Danke";
};


func int dia_blade_end_condition()
{
	if (HEILUNGDESSC == TRUE)
	{
		return TRUE;
	};
};

func void dia_blade_end_info()
{
	AI_Output (other, self, "Dia_Blade_whathappened_help_05");	//Danke!
	AI_StopProcessInfos (self);
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect ("SPELLFX_TELEPORT", self, self, 0, 0, 0, FALSE);
	AI_Teleport (self, "TOT");
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	Npc_ExchangeRoutine (vam_blade, "GAMMEL");
};

