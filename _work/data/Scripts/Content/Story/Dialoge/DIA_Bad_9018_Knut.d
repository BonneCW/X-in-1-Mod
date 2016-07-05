instance Bad_9018_Knut_Ende (C_Info)
{
  npc = Bad_9018_Knut;
  nr = 999;
  condition = Bad_9018_Knut_Exit_Condition;
  information = Bad_9018_Knut_Exit_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

func int Bad_9018_Knut_Exit_Condition ()
{
  return true;
};

func void Bad_9018_Knut_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Was mach ihr hier?
instance Bad_9018_Knut_Was (C_Info)
{
  npc = Bad_9018_Knut;
  nr = 1;
  condition = Bad_9018_Knut_Was_Condition;
  information = Bad_9018_Knut_Was_Info;
  description = "Was mach IHR denn hier?";
};

func int Bad_9018_Knut_Was_Condition ()
{
  return true;
};

func void Bad_9018_Knut_Was_Info ()
{
  AI_Output(other, self, "Bad_Knut_Was_01"); //Was macht IHR den hier?
  AI_Output(self, other, "Bad_Knut_Was_02"); //Wer will das wissen?
  if ((other.guild == GIL_BAD) && SC_isDarkMage)
    {
      AI_Output(self, other, "Bad_Knut_Was_03"); //Ach, noch so ein Dunkelmagier, lass mich blos in Ruhe, euch haben wir den ganzen Mist doch zu verdanken!
    }
  else if ((other.guild == GIL_Bad) && SC_isDarkWarrior)
    {
      AI_Output(self, other, "Bad_Knut_Was_04"); //Ach, ein Dunkler Krieger, ein bisschen spät für die Verstärkung.
    }
  else
    {
      AI_Output(self, other, "Bad_Knut_Was_05"); //Ach lass mich in Ruhe!
    };
  AI_Output(self, other, "Bad_Knut_Was_06"); //Wir sind hier unter dem Kommando von Meister LAP hergekommen.
  AI_Output(self, other, "Bad_Knut_Was_07"); //Sah auch erst gut aus für uns, aber dann ist der Meister einfach abgehauen.
  AI_Output(self, other, "Bad_Knut_Was_08"); //Und als wäre das nicht schon schlimm genug gewesen tauchte auch noch dieser Dunkelmagier auf.
  AI_Output(self, other, "Bad_Knut_Was_09"); //Wir drei wurden von den anderen getrennt und haben uns dann hierher zurückgezogen, um mit der Verstärkung nocheinmal reinzugehen.
  AI_Output(self, other, "Bad_Knut_Was_10"); //Seit zwei Wochen warten wir jetzt schon auf die Verstärkung, aber bislang ist noch nichts passiert.
  AI_TurnToNpc(self, Bad_90100_LAP_DI);
  AI_Output(self, other, "Bad_Knut_Was_11"); //DA IST ER JA!
  AI_StopProcessInfos (self);
  AI_StopProcessInfos (other);
  if (other.guild == GIL_BAD)
    {
      other.aivar[AIV_INVINCIBLE] = FALSE;
      B_Attack (self, BAD_90100_LAP_DI, AR_Kill, 0);
    };
      other.aivar[AIV_INVINCIBLE] = FALSE;
      self.aivar[AIV_INVINCIBLE] = FALSE;
};

