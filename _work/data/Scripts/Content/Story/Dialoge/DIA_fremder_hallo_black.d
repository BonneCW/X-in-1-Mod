func void dia_fremder_hallo_black()
{
	AI_Output (self, other, "Dia_Fremder_hallo_black_01");	//Hey! Guck mal da!
	AI_Output (self, other, "Dia_Fremder_hallo_black_02");	//Ein fliegender Scavenger!
	AI_TurnAway (hero, self);
	Info_ClearChoices (dia_fremder_hallo);
	Info_AddChoice (dia_fremder_hallo, "Wo?", dia_fremder_hallo_wo);
};


instance DIA_FREMDER_HALLO(C_Info)
{
	npc = none_99001_fremder;
	nr = 999;
	condition = dia_fremder_hallo_condition;
	information = dia_fremder_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_fremder_hallo_condition()
{
	return TRUE;
};

func void dia_fremder_hallo_info()
{
	AI_Output (self, other, "Dia_Fremder_hallo_info_00");	//Hallo! Wer bist du und woher kommst du?
	Info_ClearChoices (dia_fremder_hallo);
	Info_AddChoice (dia_fremder_hallo, "Verpiss dich!", dia_fremder_hallo_weg);
	Info_AddChoice (dia_fremder_hallo, "Ich bin ein Reisender aus den Bergen", dia_fremder_hallo_reisender);
	Info_AddChoice (dia_fremder_hallo, "Ich bin ehemaliger Sträfling und komme von Xardas", dia_fremder_hallo_xardas);
};

func void dia_fremder_hallo_reisender()
{
	AI_Output (other, self, "Dia_Fremder_hallo_Reisender_00");	//Ich bin ein Reisender aus den Bergen.
	AI_Output (self, other, "Dia_Fremder_hallo_Reisender_01");	//Verarschen kann ich mich auch selber! Denkst du ich bin blind?
	AI_Output (other, self, "Dia_Fremder_hallo_Reisender_02");	//Warum hast du dann gefragt?
	AI_Output (self, other, "Dia_Fremder_hallo_Reisender_03");	//Um deine Ehrlichkeit zu prüfen.
	dia_fremder_hallo_black ();
};

func void dia_fremder_hallo_xardas()
{
	AI_Output (other, self, "Dia_Fremder_hallo_Xardas_00");	//Ich bin ein ehemaliger Sträfling und komme von Xardas.
	AI_Output (self, other, "Dia_Fremder_hallo_Xardas_01");	//Soso, Xardas! Er hat doch immer seine Finger im Spiel!
	AI_Output (other, self, "Dia_Fremder_hallo_Xardas_02");	//Du kennst ihn?
	AI_Output (self, other, "Dia_Fremder_hallo_Xardas_03");	//Ja, früher waren wir gute Freunde, aber das ist schon lange her....
	dia_fremder_hallo_black ();
};

func void dia_fremder_hallo_weg()
{
	AI_Output (other, self, "Dia_Fremder_hallo_weg_00");	//Verpiss dich!
	AI_Output (self, other, "Dia_Fremder_hallo_weg_01");	//Wie du willst.
	Info_ClearChoices (dia_fremder_hallo);
	AI_StopProcessInfos (self);
	AI_Teleport (none_99001_fremder, "GAMMELPLATZNW11");
	Npc_ExchangeRoutine (self, "GAMMEL");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
};

func void dia_fremder_hallo_wo()
{
	AI_Output (other, self, "Dia_Fremder_hallo_wo_00");	//Wo?
	Npc_SetTalentSkill (hero, NPC_TALENT_SNEAK, 1);
	Npc_SetTalentSkill (hero, NPC_TALENT_ACROBAT, 1);
	hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX] + 20;
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 20;
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] + 5;
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] + 5;
	hero.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX] + 5;
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + 5;
	hero.attribute[ATR_REGENERATEHP] = 20;
	hero.attribute[ATR_REGENERATEMANA] = 20;
	Npc_SetTalentSkill (hero, NPC_TALENT_SNEAK, 1);
	AI_StopProcessInfos (self);
	Wld_PlayEffect ("SLEEP_BLEND2", self, self, 0, 0, 0, FALSE);
	AI_Teleport (none_99001_fremder, "GAMMELPLATZNW11");
	Npc_ExchangeRoutine (self, "GAMMEL");
	Wld_SetTime (16, 31);
	AI_Teleport (hero, "FP_ROAM_XARDAS_CAVE_01");
	AI_Wait (hero, 5);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	SC_IST_EIN_VAMPIR = TRUE;

	Wld_InsertItem	(ItAr_Vampir, "FP_ROAM_XARDAS_CAVE_03");
	Wld_InsertItem	(ItWr_Meisterbrief, "FP_ROAM_XARDAS_CAVE_02");
	Wld_InsertItem	(ItPo_Blood, "FP_ROAM_XARDAS_CAVE_04");
	Wld_InsertItem	(ItPo_Blood, "FP_ROAM_XARDAS_CAVE_01");
};

