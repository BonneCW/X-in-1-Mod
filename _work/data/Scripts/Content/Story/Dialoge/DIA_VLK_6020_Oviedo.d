INSTANCE DIA_Vlk_6020_Oviedo_Exit (C_Info)
{
	npc         = Vlk_6020_Oviedo;
	nr          = 999;
	condition   = DIA_Vlk_6020_Oviedo_Exit_condition;
	information = DIA_Vlk_6020_Oviedo_Exit_info;
	permanent   = TRUE;
	important   = FALSE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Vlk_6020_Oviedo_Exit_condition ()
{
	return TRUE;
};

FUNC VOID DIA_Vlk_6020_Oviedo_Exit_info ()
{
	AI_StopProcessInfos(self);
};

INSTANCE DIA_Vlk_6020_Oviedo_hiduei (C_Info)
{
	npc         = Vlk_6020_Oviedo;
	nr          = 2;
	condition   = DIA_Vlk_6020_Oviedo_hiduei_condition;
	information = DIA_Vlk_6020_Oviedo_hiduei_info;
	permanent   = FALSE;
	important   = FALSE;
	description = "Hi";
};

FUNC INT DIA_Vlk_6020_Oviedo_hiduei_condition ()
{
	if (other.guild == GIL_STRF) 
	{
		return TRUE;
	};
};

FUNC VOID DIA_Vlk_6020_Oviedo_hiduei_info ()
{
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_hiduei_15_0"); //Hi.
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_hiduei_15_1"); //Hi.
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_hiduei_15_2"); //Wer bist du?
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_hiduei_15_3"); //Ich bin Oviedo, Gesandter der Gilde.
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_hiduei_15_4"); //Ich bin...
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_hiduei_15_5"); //...der neue 1. Offizier. Weiß ich.                 
};

INSTANCE DIA_Vlk_6020_Oviedo_retogeschickt (C_Info)
{
	npc         = Vlk_6020_Oviedo;
	nr          = 2;
	condition   = DIA_Vlk_6020_Oviedo_retogeschickt_condition;
	information = DIA_Vlk_6020_Oviedo_retogeschickt_info;
	permanent   = FALSE;
	important   = FALSE;
	description = "Reton hat mich zu dir geschickt.";
};

FUNC INT DIA_Vlk_6020_Oviedo_retogeschickt_condition ()
{
	if (other.guild == GIL_STRF) 
	{
		return TRUE;
	};
};

FUNC VOID DIA_Vlk_6020_Oviedo_retogeschickt_info ()
{
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_retogeschickt_15_0"); //Reton hat mich zu dir geschickt.
        AI_Output(self,other,"DIA_Vlk_6020_Oviedo_retogeschickt_15_1"); //Weiß ich. Ich soll mit dir nochmal den Plan durchgehen. 
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_retogeschickt_15_2"); //Also?
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_retogeschickt_15_3"); //Du versuchst Garond weiß zu machen, dass die Schürfstellen zerstört sind. In der Zwischenzeit werden ein paar unserer Leute die Anführer der Schürfstellen töten. 
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_retogeschickt_15_4"); //Ohne die Anführer haben die Buddler keine Chance den Paladinen das Erz zu bringen.
};

INSTANCE DIA_Vlk_6020_Oviedo_uriziel (C_Info)
{
    npc         = Vlk_6020_Oviedo;
    nr          = 2;
    condition   = DIA_Vlk_6020_Oviedo_uriziel_condition;
    information = DIA_Vlk_6020_Oviedo_uriziel_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Garond gibt mir das Schreiben nicht";
};

FUNC INT DIA_Vlk_6020_Oviedo_uriziel_condition ()
{
	if (other.guild == GIL_STRF) 
	&& (Npc_KnowsInfo (other,DIA_Garond_rl))
	{
    		return TRUE;
	};
};
FUNC VOID DIA_Vlk_6020_Oviedo_uriziel_info ()
{
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_uriziel_15_0"); //Garond meint, er müsse noch damit warten, mir das Schreiben zu geben, bis sich ein Überlebender der Schürfstellen meldet.
        AI_Output(self,other,"DIA_Vlk_6020_Oviedo_uriziel_15_1"); //Verdammt. Naja, er wird wohl bald einsehen, dass niemand mehr kommt.
        AI_Output(other,self,"DIA_Vlk_6020_Oviedo_uriziel_15_2"); //Und was soll ich solange machen?
        AI_Output(self,other,"DIA_Vlk_6020_Oviedo_uriziel_15_3"); //Hmmm ... Du könntest beim alten Orklager vorbei schauen. Wir haben drei Gildenmitglieder geschickt dort den Schäfertempel freizubuddeln.
        AI_Output(other,self,"DIA_Vlk_6020_Oviedo_uriziel_15_4"); //Wieso das?
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_uriziel_15_5"); //Wir wollen Uriziel bergen.
   
	Log_CreateTopic (TOPIC_uriziel, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_uriziel, LOG_RUNNING);
	B_LogEntry (TOPIC_uriziel,"Die Gilde will Uriziel bergen! Dazu haben sie einen kleinen Trupp von drei Leuten geschickt das Schwert aus dem Schläfertempel zu holen. Der Tempel ist beim alten Orklager.");              
};

INSTANCE DIA_Vlk_6020_Oviedo_urizielda (C_Info)
{
	npc         = Vlk_6020_Oviedo;
	nr          = 2;
	condition   = DIA_Vlk_6020_Oviedo_urizielda_condition;
	information = DIA_Vlk_6020_Oviedo_urizielda_info;
	permanent   = FALSE;
	important   = FALSE;
	description = "Ich habe Uriziel.";
};

FUNC INT DIA_Vlk_6020_Oviedo_urizielda_condition ()
{
	if (other.guild == GIL_STRF) 
	&& (Npc_KnowsInfo (other,DIA_Vlk_6021_aeron_habu))
	&& (Npc_HasItems(other, itmw_uriziel_u))
	{
    		return TRUE;
	};
};

FUNC VOID DIA_Vlk_6020_Oviedo_urizielda_info ()
{
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_urizielda_15_0"); //Ich habe Uriziel. Es ist zwar stumpf, aber das bekommt man bestimmt wieder hin.
        AI_Output(self,other,"DIA_Vlk_6020_Oviedo_urizielda_15_1"); //Sehr gut. Rede noch mal mit Garond. Er wird hoffentlich eingesehen haben, dass niemand mehr kommt.
              
};

INSTANCE DIA_Vlk_6020_Oviedo_binwiederda (C_Info)
{
    npc         = Vlk_6020_Oviedo;
    nr          = 2;
    condition   = DIA_Vlk_6020_Oviedo_binwiederda_condition;
    information = DIA_Vlk_6020_Oviedo_binwiederda_info;
    permanent   = FALSE;
    important   = TRUE;
    description = "Ich habe Uriziel";
};

FUNC INT DIA_Vlk_6020_Oviedo_binwiederda_condition ()
{
	if (Kapitel == 4)
	{
    		return TRUE;
	};
};

FUNC VOID DIA_Vlk_6020_Oviedo_binwiederda_info ()
{
       	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_binwiederda_15_0"); //Ich habe gehört, dass du jetzt gegen die Drachen kämpfen willst.
        AI_Output(self,other,"DIA_Vlk_6020_Oviedo_binwiederda_15_1"); //Ich könnte dir beibringen wie du einen Drachen leichter töten kannst.        
};

var int dragonkillertrue;

INSTANCE DIA_Vlk_6020_Oviedo_binwiederda2 (C_Info)
{
    npc         = Vlk_6020_Oviedo;
    nr          = 2;
    condition   = DIA_Vlk_6020_Oviedo_binwiederda2_condition;
    information = DIA_Vlk_6020_Oviedo_binwiederda2_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Bring mir bei wie ich einen Drachen leichter töten kann.(3000 Gold)";
};

FUNC INT DIA_Vlk_6020_Oviedo_binwiederda2_condition ()
{

if (Kapitel == 4)
&& (Npc_KnowsInfo (other,DIA_Vlk_6020_Oviedo_binwiederda))
&& ( dragonkillertrue == FALSE)
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_6020_Oviedo_binwiederda2_info ()
{

if ( Npc_HasItems(other,itmi_gold) >= 3000)
{
	AI_Output(other,self,"DIA_Vlk_6020_Oviedo_binwiederda2_15_0"); //Bring mir bei wie ich einen Drachen leichter töten kann.
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_binwiederda2_15_1"); //Das wichtigste ist, dass du mit deiner Waffe immer auf das Herz eines Drachen zielst. Das Herz eines Drachen ist sehr empfindlich. Das funktoniert übrigens auch bei Echsenmenschen.        
	dragonkiller = TRUE;
	B_GiveInvItems ( other, self, itmi_gold, 3000);
	dragonkillertrue = TRUE;
}
else
{
	AI_Output(self,other,"DIA_Vlk_6020_Oviedo_binwiederda2_15_2"); //Dann besorg dir erstmal das Gold.

};

};