// ENDE
instance Bad_9021_Waffenmeister_Exit (C_Info)
{
  npc = Bad_9021_Waffenmeister;
  condition = Bad_9021_Waffenmeister_Exit_Condition;
  information = Bad_9021_Waffenmeister_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  description = "ENDE";
  nr = 999;
};

FUNC int Bad_9021_Waffenmeister_Exit_Condition ()
{
  return TRUE;
};

FUNC void Bad_9021_Waffenmeister_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Was machst du hier?
instance Bad_9021_Waffenmeister_Hallo (C_Info)
{
  npc = Bad_9021_Waffenmeister;
  nr = 1;
  condition = Bad_9021_Waffenmeister_Hallo_Condition;
  information = Bad_9021_Waffenmeister_Hallo_Info;
  description = "Was machst du hier?";
};

func int Bad_9021_Waffenmeister_Hallo_Condition ()
{
  return true;
};

func void Bad_9021_Waffenmeister_Hallo_Info ()
{
  AI_Output(other, self, "Bad_Waffenmeister_Hallo_01"); //Was machst du hier?
  AI_Output(self, other, "Bad_Waffenmeister_Hallo_02"); //Ich verstecke mich hier, ich weiß nicht mal wie ich hierher gekommen bin.
  AI_Output(self, other, "Bad_Waffenmeister_Hallo_03"); //Unser Alchimist war bei mir. Er hat diese Notizen hier gefunden und einen Trank gebraut.
  AI_Output(self, other, "Bad_Waffenmeister_Hallo_04"); //Aber irgendwas hat ihn total verschreckt, er ist auf einmal losgerannt, als ob die Feuermagier hinter ihm her wären.
  if (other.guild == GIL_Bad)
    {
      AI_Output(self, other, "Bad_Waffenmeister_Hallo_05"); //Ich habe hier noch ein bisschen was an Ausrüstung, falls du interessiert bist.
      Npc_ExchangeRoutine(Bad_90100_LAP_DI, "Waffenmeister");
      Npc_ExchangeRoutine(Bad_9019_Hugo,    "Waffenmeister");
      Npc_ExchangeRoutine(Bad_9020_Erwin,   "Waffenmeister");
      AI_Teleport(Bad_90100_LAP_DI, "UNDEAD");
      AI_Teleport(Bad_9019_Hugo,    "UNDEAD");
      AI_Teleport(Bad_9020_Erwin,   "UNDEAD");
    };
};

//Handeln
instance Bad_9021_Waffenmeister_Handeln (C_Info)
{
  npc = Bad_9021_Waffenmeister;
  nr = 1;
  condition = Bad_9021_Waffenmeister_Handeln_Condition;
  information = Bad_9021_Waffenmeister_Handeln_Info;
  permanent = TRUE;
  description = DIALOG_TRADE;
  trade = TRUE;
};

func int Bad_9021_Waffenmeister_Handeln_Condition ()
{
  if (Npc_KnowsInfo(other, Bad_9021_Waffenmeister_Hallo) && (other.guild == GIL_BAD))
    {
      return true;
    };
  return false;
};

func void Bad_9021_Waffenmeister_Handeln_Info ()
{
  B_GiveTradeInv(self);
  
  //Unendlich Pfeile/Bolzen
  /////////////////////////
  Npc_RemoveInvItems(self, ItRw_Bolt,  Npc_HasItems(self, ItRw_Bolt ));
  Npc_RemoveInvItems(self, ItRw_Arrow, Npc_HasItems(self, ItRw_Arrow));
  CreateInvItems    (self, ItRw_Bolt,  1000);
  CreateInvItems    (self, ItRw_Arrow, 1000);
  /////////////////////////
  
  AI_Output(self, other, "Bad_Waffenmeister_Handeln_01"); //Such dir was aus.
};
