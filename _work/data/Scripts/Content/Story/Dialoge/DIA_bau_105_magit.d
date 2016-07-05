instance DIA_BAU_MAGIT_EXIT(C_Info)
{
	npc = bau_105_magit;
	nr = 999;
	condition = dia_bau_magit_exit_condition;
	information = dia_bau_magit_exit_info;
	permanent = TRUE;
	description = "ENDE";
};


func int dia_bau_magit_exit_condition()
{
	return TRUE;
};

func void dia_bau_magit_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_MAGIT_TRADE(C_Info)
{
	npc = bau_105_magit;
	nr = 99;
	condition = dia_magit_trade_condition;
	information = dia_magit_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Zeig was Du hast.";
};


func int dia_magit_trade_condition()
{
	if (Npc_KnowsInfo (other, dia_magit_hallo))
	{
		return TRUE;
	};
};

func void dia_magit_trade_info()
{
	b_givetradeinv_magit (self);
	AI_Output (other, self, "DIA_MAGIT_TRADE_15_00");	//Zeig was Du hast.
};


instance DIA_MAGIT_HALLO(C_Info)
{
	npc = bau_105_magit;
	nr = 1;
	condition = dia_magit_hallo_condition;
	information = dia_magit_hallo_info;
	permanent = TRUE;
	description = "Hallo";
};


func int dia_magit_hallo_condition()
{
	return TRUE;
};

func void dia_magit_hallo_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor (other);
	if ((Hlp_IsItem (itm, ITAR_Bau_L) == TRUE) || (Hlp_IsItem (itm, ITAR_Bau_M) == TRUE))
	{
		AI_Output (other, self, "DIA_MAGIT_HALLO_15_00");	//Hallo.
		AI_Output (self, other, "DIA_MAGIT_HALLO_13_01");	//(Wütend) Mit dir will ich gar nicht Reden.
		AI_Output (other, self, "DIA_MAGIT_HALLO_15_02");	//Ich... ich möchte nur Wissen, wo ich hier was kaufen kann, mehr nicht.
		AI_Output (self, other, "DIA_MAGIT_HALLO_13_03");	//Ich kann dir Waffen verkaufen, wenn Du sie dir leisten kannst, Bauernlümmel.
	}
	else if (Hlp_IsItem (itm, ITAR_Fake_RANGER) == TRUE)
	{
		AI_Output (other, self, "DIA_MAGIT_HALLO_15_00");	//Hallo.
		AI_Output (self, other, "DIA_MAGIT_HALLO_13_01");	//(Wütend) Mit dir will ich gar nicht Reden.
	}
	else
	{
		AI_Output (other, self, "DIA_MAGIT_HALLO_15_00");	//Hallo.
		AI_Output (self, other, "DIA_MAGIT_HALLO_13_01");	//(Wütend) Mit dir will ich gar nicht Reden.
	};
};

