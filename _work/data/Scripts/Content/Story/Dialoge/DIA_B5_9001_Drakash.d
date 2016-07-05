const string B5_9001_Drakash_Info = "Spion bei den Wassermagiern";
var int Infos_holen;
// Exit
instance B5_9001_Drakash_Exit (C_Info)
{
  npc = B5_9001_Drakash;
  condition = B5_9001_Drakash_Exit_Condition;
  information = B5_9001_Drakash_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  nr = 999;
  description = "Ende";
};

func int B5_9001_Drakash_Exit_Condition ()
{
  return true;
};

func void B5_9001_Drakash_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

// Zum Kreuzweg schicken
instance B5_9001_Drakash_Search1 (C_Info)
{
  npc = B5_9001_Drakash;
  condition = B5_9001_Drakash_Search1_Condition;
  information = B5_9001_Drakash_Search1_Info;
  important = FALSE;
  permanent = FALSE;
  nr = 1;
  description = "Narsus schickt mich.";
};

func int B5_9001_Drakash_Search1_Condition ()
{
  return Suche_begonnen;
};

func void B5_9001_Drakash_Search1_Info ()
{
  AI_Output(other, self, "B5_9001_Drakash_Search1_01"); // Narsus schickt mich.
  AI_Output(self, other, "B5_9001_Drakash_Search1_02"); // Du kennst Narsus? Aber warum sollte er ausgerechnet dich schicken?
  AI_Output(other, self, "B5_9001_Drakash_Search1_03"); // Keine Ahnung, vielleicht war ich der einzige Trottel, der auf seine Bitte reagiert hat.
  AI_Output(self, other, "B5_9001_Drakash_Search1_04"); // Er muss dich wirklich für etwas besonderes halten, vielleicht denkt er sogar darüber nach dich zu seinem Schüler zu machen.
  AI_Output(self, other, "B5_9001_Drakash_Search1_05"); // Aber egal, was will er?
  AI_Output(other, self, "B5_9001_Drakash_Search1_06"); // Er möchte sich mit dir an der großen Feldkreuzung treffen.
  AI_Output(self, other, "B5_9001_Drakash_Search1_07"); // Na wenn's weiter nichts ist, aber im Moment habe ich keine Zeit.
  AI_Output(other, self, "B5_9001_Drakash_Search1_08"); // Wieso nicht?
  AI_Output(self, other, "B5_9001_Drakash_Search1_09"); // Ich habe Gerüchte gehört, dass die Wassermagier auf etwas gestoßen sind. Vielleicht ist das die Chance, endlich meine Heimat wiederzusehen.
  AI_Output(self, other, "B5_9001_Drakash_Search1_10"); // Aber die Boten der Wassermagier sind immer sehr verschwiegen, wenn du mir sagst, was los ist, dann kann ich mich mit Narsus treffen.
  LOG_CreateTopic(B5_9001_Drakash_Info, LOG_MISSION);
  LOG_SetTopicStatus(B5_9001_Drakash_Info, LOG_RUNNING);
  B_LogEntry(B5_9001_Drakash_Info, "Drakash will wissen, was die Wassermagier treiben.");
  B_LogEntry(B5_9000_Mage_Search, "Ich habe Drakash gefunden, er weigert sich aber zu Narsus zu gehen.");
  Infos_holen = TRUE;
};

// Auftrag erfüllen => Kreuzweg
instance B5_9001_Drakash_Spy (C_Info)
{
  npc = B5_9001_Drakash;
  condition = B5_9001_Drakash_Spy_Condition;
  information = B5_9001_Drakash_Spy_Info;
  important = FALSE;
  permanent = TRUE;
  nr = 1;
  description = "Ich weiß was die Wassermagier machen.";
};

func int B5_9001_Drakash_Spy_Condition ()
{
  if (Npc_KnowsInfo(hero, DIA_Addon_Saturas_WhatsOrnament) && Npc_KnowsInfo(hero, B5_9001_Drakash_Search1) && Infos_holen)
    {
      return true;
    }
  else
    {
      return false;
    };
};

func void B5_9001_Drakash_Spy_Info ()
{
  AI_Output(other, self, "B5_9001_Drakash_Spy_01"); // Ich weiß was die Wassermagier machen, sie haben ein Portal zu einem anderen Teil von Korinis gefunden.
  AI_Output(self, other, "B5_9001_Drakash_Spy_02"); // Ist das wahr? Belügst du mich auch nicht?
  AI_Output(other, self, "B5_9001_Drakash_Spy_03"); // Ich könnte mir sowas doch wohl kaum ausdenken, oder?
  AI_Output(self, other, "B5_9001_Drakash_Spy_04"); // Dann ist es also wahr! Sie haben das Portal gefunden, in Adanos Namen, mögen sie weiser sein als wir damals.
  AI_Output(other, self, "B5_9001_Drakash_Spy_05"); // Dann gehst du jetzt zu Narsus?
  AI_Output(self, other, "B5_9001_Drakash_Spy_06"); // Ich bin quasi schon unterwegs.
  LOG_SetTopicStatus(B5_9001_Drakash_Info, LOG_SUCCESS);
  B_LogEntry(B5_9000_Mage_Search, "Drakash geht jetzt zu Narsus.");
  AI_StopProcessInfos(self);
  Npc_ExchangeRoutine(self, "Smalltalk");
  Npc_ExchangeRoutine(B5_9000_Mage, "Smalltalk");
  B_GivePlayerXP(500);
  Infos_holen = FALSE;
  Drakash_gefunden = TRUE;
};

//Einhandkampf lernen
instance B5_9001_Drakash_Lern (C_Info)
{
  npc = B5_9001_Drakash;
  nr = 2;
  condition = B5_9001_Drakash_Lern_Condition;
  information = B5_9001_Drakash_Lern_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Bring mir bei, wie man mit leichten Schwerten umgeht.";
};

func int B5_9001_Drakash_Lern_Condition () 
{
  if (hero.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void B5_9001_Drakash_Lern_Info ()
{
  AI_Output(other, self, "B5_9001_Drakash_Lern_01"); //Bring mir bei, wie man mit leichten Schwerten umgeht.
  AI_Output(self, other, "B5_9001_Drakash_Lern_02"); //Gut, lass uns mit deinem Training beginnen.
  Info_ClearChoices(B5_9001_Drakash_Lern);
  Info_AddChoice(B5_9001_Drakash_Lern, DIALOG_BACK, B5_9001_Drakash_Lern_Back);
  Info_AddChoice(B5_9001_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), B5_9001_Drakash_Lern_1);
  Info_AddChoice(B5_9001_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), B5_9001_Drakash_Lern_5);
};

func void B5_9001_Drakash_Lern_Back ()
{
  Info_ClearChoices(B5_9001_Drakash_Lern);
};

func void B5_9001_Drakash_Lern_1 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
  if (other.HitChance[NPC_TALENT_1H] >= 100)
    {
      AI_Output(self,other,"B5_9001_Drakash_Lern_03"); //Du bist jetzt ein wahrer Meister im einhändigen Kampf.
      AI_Output(self,other,"B5_9001_Drakash_Lern_04"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_9001_Drakash_Lern);
  Info_AddChoice(B5_9001_Drakash_Lern, DIALOG_BACK, B5_9001_Drakash_Lern_Back);
  Info_AddChoice(B5_9001_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), B5_9001_Drakash_Lern_1);
  Info_AddChoice(B5_9001_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), B5_9001_Drakash_Lern_5);
};

func void B5_9001_Drakash_Lern_5 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
  if (other.HitChance[NPC_TALENT_1H] >= 100)
    {
      AI_Output(self,other,"B5_9001_Drakash_Lern_05"); //Du bist jetzt ein wahrer Meister im einhändigen Kampf.
      AI_Output(self,other,"B5_9001_Drakash_Lern_06"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_9001_Drakash_Lern);
  Info_AddChoice(B5_9001_Drakash_Lern, DIALOG_BACK, B5_9001_Drakash_Lern_Back);
  Info_AddChoice(B5_9001_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), B5_9001_Drakash_Lern_1);
  Info_AddChoice(B5_9001_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), B5_9001_Drakash_Lern_5);
};

// Wasserperle

instance B5_9001_Drakash_Wasserperle (C_Info)
{
  npc = B5_9001_Drakash;
  nr = 3;
  condition = B5_9001_Drakash_Wasserperle_Condition;
  information = B5_9001_Drakash_Wasserperle_Info;
  description = "Sagt dir Wasserperle etwas?";
};

func int B5_9001_Drakash_Wasserperle_Condition ()
{
  if (Npc_KnowsInfo(other, Bad_LAP_Wasserperle) && !(Npc_KnowsInfo(other, B5_90010_Drakash_Wasserperle)))
    {
      return true;
    };
  return false;
};

func void B5_9001_Drakash_Wasserperle_Info ()
{
  AI_Output(other, self, "B5_9001_Drakash_01"); //Sagt dir Wasserperle etwas?
  AI_Output(self, other, "B5_9001_Drakash_02"); //Woher weißt du?
  AI_Output(other, self, "B5_9001_Drakash_03"); //Meister LAP hat mir erzählt, dass ich eine solche Perle brauche.
  AI_Output(self, other, "B5_9001_Drakash_04"); //Mhh, eigentlich sind diese Perlen zu wertvoll, aber ...
  AI_Output(self, other, "B5_9001_Drakash_05"); //Was soll's, wenn Meister LAP es dir erzählt hat. Also hör zu!
  AI_Output(self, other, "B5_9001_Drakash_06"); //Die Wasserperlen waren in der Obhut der Priester und wurden mit Khardimon begraben. Wenn überhaupt, dann findest du dort welche.
  B_LogEntry(Almanach_Dunkelmagier, "Drakash hat mir gesagt, dass sich in Khardimons Grab noch Wasserperlen befinden könnten.");
  Perle_Once = TRUE;
};
