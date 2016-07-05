var int henrygekauft;
var int johngekauft;


INSTANCE DIA_VLK_6023_deep_Exit (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6024_deep;
    nr          = 999;
    condition   = DIA_VLK_6023_deep_Exit_condition;
    information = DIA_VLK_6023_deep_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "ENDE";
};
FUNC INT DIA_VLK_6023_deep_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_VLK_6023_deep_Exit_info ()
{
    AI_StopProcessInfos(self);
};


INSTANCE DIA_VLK_6023_deep_henrykaufen (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6024_deep;
    nr          = 998;
    condition   = DIA_VLK_6023_deep_henrykaufen_condition;
    information = DIA_VLK_6023_deep_henrykaufen_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Bogenschützen-Gardist Henry einstellen (5000 Gold)";
};
FUNC INT DIA_VLK_6023_deep_henrykaufen_condition ()
{

if (Npc_KnowsInfo (other,DIA_VLK_6023_deep_werbistendu))
&& (henrygekauft == FALSE)
{ 
    return TRUE;
};
};
FUNC VOID DIA_VLK_6023_deep_henrykaufen_info ()
{
if (Npc_HasItems(other, itmi_gold) >= 5000)
{
AI_Output(self,other,"DIA_VLK_6023_deep_henrykaufen_15_0"); //Henry wartet draußen vor dem Leuchtturm.

   B_GiveInvItems ( other, self, itmi_gold, 5000);
Wld_InsertNpc (VLK_6025_Henry,"NW_CITY_TO_LIGHTHOUSE_15");
henrygekauft = TRUE;
}
else
{
AI_Output(self,other,"DIA_VLK_6023_deep_henrykaufen_15_1"); //Henry verlangt 5000 Goldstücke als Sold. Du wirst nicht billiger wegkommen.	

};	
};


INSTANCE DIA_VLK_6023_deep_werbistendu (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6024_deep;
    nr          = 997;
    condition   = DIA_VLK_6023_deep_werbistendu_condition;
    information = DIA_VLK_6023_deep_werbistendu_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Wer bist denn du?";
};
FUNC INT DIA_VLK_6023_deep_werbistendu_condition ()
{


    return TRUE;

};
FUNC VOID DIA_VLK_6023_deep_werbistendu_info ()
{
   

AI_Output(other,self,"DIA_VLK_6023_deep_werbistendu_15_0"); //Wer bist denn du?
AI_Output(self,other,"DIA_VLK_6023_deep_werbistendu_15_1"); //Mein Name ist Deep. Ich bin ein alter Freund von Reton und kümmere mich um das Anwerben neuer Gildenmitglieder. 
AI_Output(other,self,"DIA_VLK_6023_deep_werbistendu_15_2"); //Und wo warst du bisher?
AI_Output(self,other,"DIA_VLK_6023_deep_werbistendu_15_3"); //Ich habe nach Gildenlosen gesucht. Und habe zwei Interessenten gefunden. Gegen einen entsprechend hohen Sold kannst du sie einstellen.	
};


INSTANCE DIA_VLK_6023_deep_johnkaufen (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6024_deep;
    nr          = 996;
    condition   = DIA_VLK_6023_deep_johnkaufen_condition;
    information = DIA_VLK_6023_deep_johnkaufen_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Nahkampf-Gardist John einstellen (5000 Gold)";
};
FUNC INT DIA_VLK_6023_deep_johnkaufen_condition ()
{
if (Npc_KnowsInfo (other,DIA_VLK_6023_deep_werbistendu))
&& (johngekauft == FALSE)
{

    return TRUE;
};
};
FUNC VOID DIA_VLK_6023_deep_johnkaufen_info ()
{
if (Npc_HasItems(other, itmi_gold) >= 5000) 
{
AI_Output(self,other,"DIA_VLK_6023_deep_johnkaufen_15_0"); //John wartet draußen vor dem Leuchtturm.
   B_GiveInvItems ( other, self, itmi_gold, 5000);
Wld_InsertNpc (VLK_6026_john,"NW_CITY_TO_LIGHTHOUSE_15");
johngekauft = TRUE;
}
else
{
AI_Output(self,other,"DIA_VLK_6023_deep_johnkaufen_15_1"); //John verlangt 5000 Goldstücke als Sold. Du wirst nicht billiger wegkommen.	
};
};

