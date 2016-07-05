INSTANCE DIA_WW_Exit (C_Info)
{
    npc         = VLK_6011_Waldwache;
    nr          = 999;
    condition   = DIA_WW_Exit_condition;
    information = DIA_WW_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};

FUNC INT DIA_WW_Exit_condition ()
{
    return TRUE;
};

FUNC VOID DIA_WW_Exit_info ()
{
    AI_StopProcessInfos(self);
};


INSTANCE DIA_WW_hiduei (C_Info)
{
    npc         = VLK_6011_Waldwache;
    nr          = 2;
    condition   = DIA_WW_hiduei_condition;
    information = DIA_WW_hiduei_info;
    permanent   = FALSE;
    important   = TRUE;
    description = "Hi";
};

FUNC INT DIA_WW_hiduei_condition ()
{
    return TRUE;
};

FUNC VOID DIA_WW_hiduei_info ()
{
	AI_Output(self,other,"DIA_WW_hiduei_15_0"); //Wo solls denn hingehen?
	AI_Output(other,self,"DIA_WW_hiduei_15_1"); //In den Wald. Du willst mich doch nicht etwa aufhalten, oder?
        AI_Output(self,other,"DIA_WW_hiduei_15_2"); //Nein, ich will dich bloß warnen.
	AI_Output(self,other,"DIA_WW_hiduei_15_3"); //Die Wargs drehen im Moment ganz schön am Rad. Du solltest denen nicht zu nahe kommen.
	AI_Output(other,self,"DIA_WW_hiduei_15_4"); //Werde ich mir merken.
};

INSTANCE DIA_WWr_hiduei (C_Info)
{
    npc         = VLK_6011_Waldwache;
    nr          = 2;
    condition   = DIA_WWr_hiduei_condition;
    information = DIA_WWr_hiduei_info;
    permanent   = FALSE;
    important   = False;
    description = "Was ist das für eine Rüstung?";
};

FUNC INT DIA_WWr_hiduei_condition ()
{
    return TRUE;
};

FUNC VOID DIA_WWr_hiduei_info ()
{ 
	AI_Output(other,self,"DIA_WWr_hiduei_15_0"); //Was ist das eigentlich für eine Rüstung, die du da trägst?
        AI_Output(self,other,"DIA_WWr_hiduei_15_2"); //Eine Milizrüstung. Ich war früher bei der Miliz. 
	AI_Output(other,self,"DIA_WWr_hiduei_15_4"); //Haben die dich rausgeworfen?
      	AI_Output(self,other,"DIA_WWr_hiduei_15_5"); //Ja. Mein Kumpel hier und ich waren einmal beim Morgenapell so sturzbesoffen, dass wir kaum noch stehen konnten. Darauf hin haben die uns rausgeworfen. 
       	AI_Output(self,other,"DIA_WWr_hiduei_15_6"); //Wir dürfen nicht mehr die Farben des Königs auf unserer Kleidung tragen, deshalb haben wir die Rüstungen gefärbt, aber wir sind auch jetzt noch unersetztliche Torwachen.
};

