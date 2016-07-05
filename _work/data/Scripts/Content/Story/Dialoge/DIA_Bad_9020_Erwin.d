instance Bad_9020_Erwin_Exit (C_Info)
{
  npc = Bad_9020_Erwin;
  condition = Bad_9020_Erwin_Exit_Condition;
  information = Bad_9020_Erwin_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  nr = 999;
  description = "Ende";
};

func int Bad_9020_Erwin_Exit_Condition ()
{
  return true;
};

func void Bad_9020_Erwin_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Einhandkampf
instance Bad_9020_Erwin_Lern (C_Info)
{
  npc = Bad_9020_Erwin;
  nr = 2;
  condition = Bad_9020_Erwin_Lern_Condition;
  information = Bad_9020_Erwin_Lern_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Lehre mich den Einhandkampf.";
};

func int Bad_9020_Erwin_Lern_Condition () 
{
  if (hero.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void Bad_9020_Erwin_Lern_Info ()
{
  AI_Output(other, self, "Bad_9020_Erwin_Lern_01"); //Lehre mich den Einhandkampf.
  AI_Output(self, other, "Bad_9020_Erwin_Lern_02"); //Gut, lass uns mit deinem Training beginnen.
  Info_ClearChoices(Bad_9020_Erwin_Lern);
  Info_AddChoice(Bad_9020_Erwin_Lern, DIALOG_BACK, Bad_9020_Erwin_Lern_Back);
  Info_AddChoice(Bad_9020_Erwin_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), Bad_9020_Erwin_Lern_1);
  Info_AddChoice(Bad_9020_Erwin_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), Bad_9020_Erwin_Lern_5);
};

func void Bad_9020_Erwin_Lern_Back ()
{
  Info_ClearChoices(Bad_9020_Erwin_Lern);
};

func void Bad_9020_Erwin_Lern_1 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
  if (other.HitChance[NPC_TALENT_1H] >= 100)
    {
      AI_Output(self,other,"Bad_9020_Erwin_Lern_03"); //Du bist jetzt ein wahrer Meister im einhändigen Kampf.
      AI_Output(self,other,"Bad_9020_Erwin_Lern_04"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(Bad_9020_Erwin_Lern);
  Info_AddChoice(Bad_9020_Erwin_Lern, DIALOG_BACK, Bad_9020_Erwin_Lern_Back);
  Info_AddChoice(Bad_9020_Erwin_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), Bad_9020_Erwin_Lern_1);
  Info_AddChoice(Bad_9020_Erwin_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), Bad_9020_Erwin_Lern_5);
};

func void Bad_9020_Erwin_Lern_5 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
  if (other.HitChance[NPC_TALENT_1H] >= 100)
    {
      AI_Output(self,other,"Bad_9020_Erwin_Lern_05"); //Du bist jetzt ein wahrer Meister im einhändigen Kampf.
      AI_Output(self,other,"Bad_9020_Erwin_Lern_06"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(Bad_9020_Erwin_Lern);
  Info_AddChoice(Bad_9020_Erwin_Lern, DIALOG_BACK, Bad_9020_Erwin_Lern_Back);
  Info_AddChoice(Bad_9020_Erwin_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), Bad_9020_Erwin_Lern_1);
  Info_AddChoice(Bad_9020_Erwin_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), Bad_9020_Erwin_Lern_5);
};
