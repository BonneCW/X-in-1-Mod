instance DIA_FOLLOW_SHEEP_ALWIN_KOMMMIT(C_Info)
{
	npc = follow_sheep_alwin;
	nr = 1;
	condition = dia_follow_sheep_alwin_kommmit_condition;
	information = dia_follow_sheep_alwin_kommmit_info;
	permanent = FALSE;
	description = "Komm mit!";
};


func int dia_follow_sheep_alwin_kommmit_condition()
{
	return TRUE;
};

func void dia_follow_sheep_alwin_kommmit_info()
{
	AI_Output (other, self, "DIA_Liesel_KommMit_15_00");	//Komm mit!
	B_LieselMaeh ();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	ALWINLOST = TRUE;
	AI_StopProcessInfos (self);
};

