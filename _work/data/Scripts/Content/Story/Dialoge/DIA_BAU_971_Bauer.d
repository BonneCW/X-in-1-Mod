
instance DIA_MAC_EXIT(C_Info)
{
	npc = BAU_971_Bauer;
	nr = 999;
	condition = dia_mac_exit_condition;
	information = dia_mac_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_mac_exit_condition()
{
	return TRUE;
};

func void dia_mac_exit_info()
{
	AI_StopProcessInfos (self);
};


var int wette_gilt;
var int heute;

instance DIA_MAC_WETTE(C_Info)
{
	npc = BAU_971_Bauer;
	nr = 587;
	condition = dia_mac_wette_condition;
	information = dia_mac_wette_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_mac_wette_condition()
{
	return TRUE;
};

func void dia_mac_wette_info()
{
	AI_Output (self, other, "Dia_Mac_Wette_00");	//Na? Lust zu Wetten?
	AI_Output (other, self, "Dia_Mac_Wette_01");	//Was?
	AI_Output (self, other, "Dia_Mac_Wette_02");	//Ich bin Mac und veranstalte gerne Wetten. Aber keine Trinkwetten wie Rukhar. Sowas find ich langeweilig.
	AI_Output (self, other, "Dia_Mac_Wette_03");	//Vielleicht hast du Lust auf eine Wette?
	Info_ClearChoices (dia_mac_wette);
	Info_AddChoice (dia_mac_wette, "Nein, kein Interesse", dia_mac_wette_no);
	Info_AddChoice (dia_mac_wette, "Okay, worum gehts?", dia_mac_wette_yes);
};

func void dia_mac_wette_no()
{
	AI_Output (other, self, "Dia_Mac_Wette_no_00");	//Nein, kein Interesse.
	AI_Output (self, other, "Dia_Mac_Wette_no_01");	//Schade!
	Info_ClearChoices (dia_mac_wette);
	AI_StopProcessInfos (self);
};

func void dia_mac_wette_yes()
{
	AI_Output (other, self, "Dia_Mac_Wette_yes_00");	//Okay, worum gehts?
	AI_Output (self, other, "Dia_Mac_Wette_yes_01");	//Also pass auf: Ich Wette 100 Goldstücke, dass du es nicht schaffst mir bis Übermorgen einen Gehstock, eine Bürste, eine alte Münze und ein Skelletknochen zu bringen!
	AI_Output (self, other, "Dia_Mac_Wette_yes_02");	//Fallst du es doch schaffst, bekommst du 100 Goldstücke, falls nicht schuldest du mir 100.
	AI_Output (self, other, "Dia_Mac_Wette_yes_03");	//Einverstanden?
	Info_ClearChoices (dia_mac_wette);
	Info_AddChoice (dia_mac_wette, "Nein, darauf lasse ich mich nicht ein!", dia_mac_wette_nonono);
	Info_AddChoice (dia_mac_wette, "Die Wette gilt!", dia_mac_wette_okaya);
};

func void dia_mac_wette_nonono()
{
	AI_Output (other, self, "Dia_Mac_wette_nonono_00");	//Nein, darauf lasse ich mich nicht ein!
	AI_Output (self, other, "Dia_Mac_wette_nonono_01");	//Schade!
	Info_ClearChoices (dia_mac_wette);
	AI_StopProcessInfos (self);
};

func void dia_mac_wette_okaya()
{
	AI_Output (other, self, "Dia_Mac_wette_okaya_00");	//Die Wette gilt!
	AI_Output (self, other, "Dia_Mac_wette_okaya_01");	//Wir sehen uns dann spätestens Übermorgen!
	Log_CreateTopic (MAC_WETTE, LOG_MISSION);
	Log_SetTopicStatus (MAC_WETTE, LOG_Running);
	B_LogEntry (MAC_WETTE, "Ich habe mit Mac in der Taverne gewettet, dass ich ihm bis Übermorgen schaffe einen Gehstock, eine Bürste, eine alte Münze und einen Skelettknochen zu besorgen.");
	WETTE_GILT = TRUE;
	HEUTE = Wld_GetDay ();
	Info_ClearChoices (dia_mac_wette);
	AI_StopProcessInfos (self);
};


instance DIA_MAC_TWODAYSLATER(C_Info)
{
	npc = BAU_971_Bauer;
	nr = 100;
	condition = dia_mac_twodayslater_condition;
	information = dia_mac_twodayslater_info;
	important = FALSE;
	permanent = TRUE;
	description = "Wegen der Wette";
};


func int dia_mac_twodayslater_condition()
{
	if (WETTE_GILT == TRUE)
	{
		return TRUE;
	};
};

func void dia_mac_twodayslater_info()
{
	var int heudda;
	var int vergleich1;
	AI_Output (other, self, "Dia_Mac_twodayslater_00");	//Wegen der Wette
	vergleich1 = Wld_GetDay ();
	heudda = HEUTE + 2;
	if (vergleich1 <= heudda)
	{
		AI_Output (self, other, "Dia_Mac_twodayslater_01");	//Hast du die Sachen mit dir?
		if ((Npc_HasItems (other, ItMi_Brush) >= 1) && (Npc_HasItems (other, ItMw_1h_Vlk_Mace) >= 1) && (Npc_HasItems (other, ItMi_OldCoin) >= 1) && (Npc_HasItems (other, ItAt_SkeletonBone) >= 1))
		{
			AI_Output (other, self, "Dia_Mac_twodayslater_07");	//Wo ist das Gold?
			AI_Output (self, other, "Dia_Mac_twodayslater_08");	//Ich habe keins.
			CreateInvItems (self, ItMi_Gold, 100);
			B_GiveInvItems (self, other, ItMi_Gold, 100);
			AI_StopProcessInfos (self);
			WETTE_GILT = FALSE;
			B_GivePlayerXP (500);
			Log_SetTopicStatus (MAC_WETTE, LOG_SUCCESS);
		}
		else
		{
			AI_Output (other, self, "Dia_Mac_twodayslater_02");	//Nein.
			AI_Output (self, other, "Dia_Mac_twodayslater_03");	//Warum verschwendest du dann deine Zeit hier?
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (self, other, "Dia_Mac_twodayslater_04");	//Du hast sie verloren. Mach dir nichts draus, jeder hat mal Pech.
		WETTE_GILT = FALSE;
		B_GivePlayerXP (100);
		Log_SetTopicStatus (MAC_WETTE, LOG_SUCCESS);
		if (Npc_HasItems (other, ItMi_Gold) >= 100)
		{
			AI_Output (other, self, "Dia_Mac_twodayslater_05");	//Hier hast du das Gold!
			B_GiveInvItems (other, self, ItMi_Gold, 100);
			AI_Output (self, other, "Dia_Mac_twodayslater_06");	//Danke!
			AI_StopProcessInfos (self);
			WETTE_GILT = FALSE;
		}
		else
		{
			AI_Output (self, other, "Dia_Mac_twodayslater_07");	//Wo ist das Gold?
			AI_Output (other, self, "Dia_Mac_twodayslater_08");	//Ich habe keins.
			AI_Output (self, other, "Dia_Mac_twodayslater_09");	//Na warte, dann Prügel ich es aus dir raus!
			AI_StopProcessInfos (self);
			B_Attack (self, other, AR_NONE, 1);
		};
	};
};

