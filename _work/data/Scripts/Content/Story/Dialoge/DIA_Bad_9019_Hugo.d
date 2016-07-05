// ENDE
instance Bad_9019_Hugo_Exit (C_Info)
{
  npc = Bad_9019_Hugo;
  condition = Bad_9019_Hugo_Exit_Condition;
  information = Bad_9019_Hugo_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  description = "ENDE";
  nr = 999;
};

FUNC int Bad_9019_Hugo_Exit_Condition ()
{
  return TRUE;
};

FUNC void Bad_9019_Hugo_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Zweihandkampf lernen
instance Bad_9019_Hugo_Lern (C_Info)
{
  npc = Bad_9019_Hugo;
  nr = 2;
  condition = Bad_9019_Hugo_Lern_Condition;
  information = Bad_9019_Hugo_Lern_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Bring mir bei, wie man mit Zweihandwaffen umgeht.";
};

func int Bad_9019_Hugo_Lern_Condition () 
{
  if (hero.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void Bad_9019_Hugo_Lern_Info ()
{
  AI_Output(other, self, "Bad_9019_Hugo_Lern_01"); //Bring mir bei, wie man mit Zweihandwaffen umgeht.
  AI_Output(self, other, "Bad_9019_Hugo_Lern_02"); //Gut, lass uns mit deinem Training beginnen.
  Info_ClearChoices(Bad_9019_Hugo_Lern);
  Info_AddChoice(Bad_9019_Hugo_Lern, DIALOG_BACK, Bad_9019_Hugo_Lern_Back);
  Info_AddChoice(Bad_9019_Hugo_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), Bad_9019_Hugo_Lern_1);
  Info_AddChoice(Bad_9019_Hugo_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), Bad_9019_Hugo_Lern_5);
};

func void Bad_9019_Hugo_Lern_Back ()
{
  Info_ClearChoices(Bad_9019_Hugo_Lern);
};

func void Bad_9019_Hugo_Lern_1 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
  if (other.HitChance[NPC_TALENT_2H] >= 100)
    {
      AI_Output(self,other,"Bad_9019_Hugo_Lern_03"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
      AI_Output(self,other,"Bad_9019_Hugo_Lern_04"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(Bad_9019_Hugo_Lern);
  Info_AddChoice(Bad_9019_Hugo_Lern, DIALOG_BACK, Bad_9019_Hugo_Lern_Back);
  Info_AddChoice(Bad_9019_Hugo_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), Bad_9019_Hugo_Lern_1);
  Info_AddChoice(Bad_9019_Hugo_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), Bad_9019_Hugo_Lern_5);
};

func void Bad_9019_Hugo_Lern_5 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
  if (other.HitChance[NPC_TALENT_2H] >= 100)
    {
      AI_Output(self,other,"Bad_9019_Hugo_Lern_05"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
      AI_Output(self,other,"Bad_9019_Hugo_Lern_06"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(Bad_9019_Hugo_Lern);
  Info_AddChoice(Bad_9019_Hugo_Lern, DIALOG_BACK, Bad_9019_Hugo_Lern_Back);
  Info_AddChoice(Bad_9019_Hugo_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), Bad_9019_Hugo_Lern_1);
  Info_AddChoice(Bad_9019_Hugo_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), Bad_9019_Hugo_Lern_5);
};
