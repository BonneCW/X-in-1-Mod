
instance DIA_ANTROX_GEFUNDEN(C_Info)
{
	npc = antrox;
	nr = 1;
	condition = dia_antrox_gefunden_condition;
	information = dia_antrox_gefunden_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_antrox_gefunden_condition()
{
	return TRUE;
};

func void dia_antrox_gefunden_info()
{
	AI_Output (self, other, "Dia_Antrox_gefunden_00");	//Du hast mich gefunden! Du bist nicht nur mutig, sondern auch klug!
	AI_Output (other, self, "Dia_Antrox_gefunden_01");	//W..Wer bist du?
	AI_Output (self, other, "Dia_Antrox_gefunden_02");	//Ich? Ich bin Anrox! Ich strandete vor langer Zeit auf dieser Insel und fand hier den Tod.
	AI_Output (self, other, "Dia_Antrox_gefunden_03");	//Ich war ein Magier, doch selbst das rettete mir nicht das Leben.
	AI_Output (self, other, "Dia_Antrox_gefunden_04");	//Dir, der meinem Pfad gefolgt ist und mich gefunden hat, dir hinterlasse ich mein Erbe!
	B_GiveInvItems (self, other, itru_sumshadow, 1);
	B_GivePlayerXP (1000);
	if ((other.guild == GIL_PAL) || (other.guild == GIL_MIL) || (other.guild == GIL_SLD) || (other.guild == GIL_STRF) || (other.guild == GIL_BAU) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE) || ((Sc_isDarkWarrior == TRUE) && (other.guild == GIL_BAD)))
	{
		AI_Output (self, other, "Dia_Antrox_gefunden_05");	//Nimm dieses Schwert!
		//AI_Output (self, other, "Dia_Antrox_gefunden_19");	//Und diese Rune!
		CreateInvItems (self, itmw_icesword, 1);
		B_GiveInvItems (self, other, itmw_icesword, 1);
	};
	if ((other.guild == GIL_KDF) || (other.guild == GIL_NOV) || (other.guild == GIL_OUT) || ((Sc_isDarkMage == TRUE) && (other.guild == GIL_BAD)))
	{
		AI_Output (self, other, "Dia_Antrox_gefunden_06");	//Nimm diese Runen!
		CreateInvItems (self, itru_soul, 1);
		B_GiveInvItems (self, other, itru_soul, 1);
	};
	AI_Output (self, other, "Dia_Antrox_gefunden_07");	//Leb wohl!
};


instance DIA_ANTROX_GEFUNDEN_2(C_Info)
{
	npc = antrox;
	nr = 2;
	condition = dia_antrox_gefunden_condition2;
	information = dia_antrox_gefunden_info2;
	important = FALSE;
	permanent = FALSE;
	description = "Danke!";
};


func int dia_antrox_gefunden_condition2()
{
	if (Npc_KnowsInfo (other, dia_antrox_gefunden))
	{
		return TRUE;
	};
};

func void dia_antrox_gefunden_info2()
{
	AI_StopProcessInfos (self);
	B_KillNpc (antrox);
};

