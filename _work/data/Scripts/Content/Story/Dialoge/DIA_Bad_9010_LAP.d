const string Verhandlungen = "Verhandlungen mit den Orks";
//*****
// ENDE
//*****

instance Bad_LAP_Ende (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 999;
  condition = Bad_LAP_Ende_Condition;
  information = Bad_LAP_Ende_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

func int Bad_LAP_Ende_Condition ()
{
  return true;
};

func void Bad_LAP_Ende_Info ()
{
  AI_StopProcessInfos(self);
};

//******
// Hallo
//******

instance Bad_LAP_Willkommen (C_Info)
{
  npc = Bad_9010_LAP;
  condition = Bad_LAP_Willkommen_Condition;
  information = Bad_LAP_Willkommen_Info;
  important = TRUE;
};

func int Bad_LAP_Willkommen_Condition ()
{
  return true;
};

func void Bad_LAP_Willkommen_Info ()
{
  AI_Output(self, other, "Bad_LAP_Willkommen_01"); //Ah, ein Angehöriger meines Ordens, sei gegrüßt.
  AI_Output(other, self, "Bad_LAP_Willkommen_02"); //Bist du der Oberste der Dunkelmagier?
  AI_Output(self, other, "Bad_LAP_Willkommen_03"); //Ja, der bin ich und dieser Knabe dahinten ...
  AI_PointAtNpc(self, KDF_500_Pyrokar);
  AI_Output(self, other, "Bad_LAP_Willkommen_04"); //... das ist der Oberste der Feuermagier, den kennst du bestimmt schon.
  AI_StopPointAt(self);
  AI_Output(self, other, "Bad_LAP_Willkommen_05"); //(lacht) Der ist momentan ganzschön angegangen, weil er mich hier nicht rauswerfen kann.
  AI_TurnToNpc(self, KDF_500_Pyrokar);
  AI_Output(self, other, "Bad_LAP_Willkommen_06"); //(ruft) Stimmt's Pyro? Ich steh in der Gunst Innos. (lacht)
  AI_TurnToNpc(self, other);
  AI_Output(self, other, "Bad_LAP_Willkommen_07"); //Ich war nähmlich mal der Erwählte Innos. Ist aber schon lange her.
  AI_Output(self, other, "Bad_LAP_Willkommen_08"); //Jetzt aber genug über mich, was willst du?
};

//***********
// Erwählter?
//***********

instance Bad_LAP_Erwählter (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 1;
  condition = Bad_LAP_Erwählter_Condition;
  information = Bad_LAP_Erwählter_Info;
  description = "Du warst mal der Erwählte Innos?";
};

func int Bad_LAP_Erwählter_Condition ()
{
  return true;
};

func void Bad_LAP_Erwählter_Info ()
{
  AI_Output(other, self, "Bad_LAP_Erwählter_01"); //Du warst mal der Erwählte Innos?
  AI_Output(self, other, "Bad_LAP_Erwählter_02"); //Ja, deswegen darf sich kein Feuermagier oder Paladin an mir vergreifen.
  AI_Output(self, other, "Bad_LAP_Erwählter_03"); //Der ganze Spaß ist leider schon über eintausend Jahre her.
  AI_Output(self, other, "Bad_LAP_Erwählter_04"); //Aber egal, warum hast du mich rufen lassen?
};

//*************
// Dunkelmagier
//*************

instance Bad_LAP_Macht (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 2;
  condition = Bad_LAP_Macht_Condition;
  information = Bad_LAP_Macht_Info;
  description = "Meister, ich suche die 'Macht der Vereinigung'";
};

func int Bad_LAP_Macht_Condition ()
{
  if (SC_isDarkMage)
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Macht_Info ()
{
  AI_Output(other, self, "Bad_LAP_Macht_01"); //Meister, ich suche die 'Macht der Vereinigung'.
  AI_Output(self, other, "Bad_LAP_Macht_02"); //(erstaunt) Was? Woher weißt du ...? (nachdenklich) Mhh, hast du irgendeine Besonderheit bei dir?
  AI_Output(other, self, "Bad_LAP_Macht_03"); //Meinst du vielleicht das Auge Innos?
  AI_Output(self, other, "Bad_LAP_Macht_04"); //Ja, dass meinte ich. Anscheinend bist du der neue Erwählte Innos.
  AI_Output(self, other, "Bad_LAP_Macht_05"); //Dann sollte es dir tatsächlich möglich sein ...
  AI_Output(self, other, "Bad_LAP_Macht_06"); //Nun gut: Höre meine Worte:
  AI_Output(self, other, "Bad_LAP_Macht_07"); //Zuerst brauchst du einen Runenstein, den kannst du von mir erhalten, hier, nimm.
  CreateInvItems(self, ItMi_RuneBlank, 1);
  B_GiveInvItems(self, other, ItMi_RuneBlank, 1);
  AI_Output(self, other, "Bad_LAP_Macht_08"); //Desweiteren brauchst du einen Gegenstand der von einem Gott gesegnet ist, für jeden Gott einen.
  AI_Output(self, other, "Bad_LAP_Macht_09"); //Einige Tränen Innos, eine Wasserperle und eine Statuette Beliars, nimm einfach die, die du für die Aufnahmeprüfung herstellen musstest.
  AI_Output(self, other, "Bad_LAP_Macht_10"); //An einem Runentisch verbindest du diese vier Gegenstände und erhälst so die 'Macht der Vereinigung'. Ich werde die Bescheid sagen, wenn der Einsatz dieses Artefakts sinnvoll ist.
  B_LogEntry(Almanach_Dunkelmagier, "Um die Macht der Vereinigung zu erschaffen brauche ich: einen Runenrohling, die Tränen Innos, eine Wasserperle und die Statuette Beliars. Aber wo soll ich eine Wasserperle hernehmen.");
};

//************
// Wasserperle
//************

instance Bad_LAP_Wasserperle (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 2;
  condition = Bad_LAP_Wasserperle_Condition;
  information = Bad_LAP_Wasserperle_Info;
  description = "Wo bekomm ich eine Wasserperle her?";
};

func int Bad_LAP_Wasserperle_Condition ()
{
  if (Npc_KnowsInfo(other, Bad_LAP_Macht))
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Wasserperle_Info ()
{
  AI_Output(other, self, "Bad_LAP_Wasserperle_01"); //Wo bekomm ich eine Wasserperle her?
  AI_Output(self, other, "Bad_LAP_Wasserperle_02"); //Das könnte schwer werden, die einzigen die ich kenne ... kannte waren im Besitz einer Kultur, die inzwischen längst untergegangen ist.
  AI_Output(other, self, "Bad_LAP_Wasserperle_03"); //Du sprichst nicht zufällig von den Bewohnern von Jharkendar, oder?
  AI_Output(self, other, "Bad_LAP_Wasserperle_04"); //Doch, die meine ich. Aber leider ist ihre Kultur vor langer Zeit untergegangen, und die Wasserperlen mit ihnen.
  AI_Output(other, self, "Bad_LAP_Wasserperle_05"); //Ich kenne da jemanden, der mri vielleicht weiterhelfen kann.
  AI_Output(self, other, "Bad_LAP_Wasserperle_06"); //Dann sprich mit ihm, du darfst nichts unversucht lassen.
  B_LogEntry(Almanach_Dunkelmagier, "Drakash könnte was über Wasserperlen wissen.");
};

//****************
// Dämonenschneide
//****************

instance Bad_LAP_Dämonenschneide (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 2;
  condition = Bad_LAP_Dämonenschneide_Condition;
  information = Bad_LAP_Dämonenschneide_Info;
  description = "Meister, wie kann ich eine 'Dämonenschneide' schmieden?";
};

func int Bad_LAP_Dämonenschneide_Condition ()
{
  if (SC_isDarkWarrior)
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Dämonenschneide_Info ()
{
  AI_Output(other, self, "Bad_LAP_Dämonenschneide_01"); //Meister, wie kann ich eine 'Dämonenschneide' schmieden?
  AI_Output(self, other, "Bad_LAP_Dämonenschneide_02"); //In einem Wort? Garnicht!
  AI_Output(self, other, "Bad_LAP_Dämonenschneide_03"); //Die Dämonenschneide wird aus einer Golemfaust hergestellt.
  AI_Output(self, other, "Bad_LAP_Dämonenschneide_04"); //Dazu wird die Klinge an einem Runentisch mit einem Dämonenherz verbunden.
  AI_Output(self, other, "Bad_LAP_Dämonenschneide_05"); //Allerdings muss man einen Gegenstand dazulegen, der von der Macht Beliars erfüllt ist.
  B_LogEntry(Almanach_Dunkelkrieger, "Für eine Dämonenschneide muss ich eine Golemfaust an einem Runentisch mit einem Dämonherz verbinden und die Macht Beliars dazu mischen.");
};

//*******
// Schiff
//*******

instance Bad_LAP_Schiff (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 3;
  condition = Bad_LAP_Schiff_Condition;
  information = Bad_LAP_Schiff_Info;
  description = "Habt ihr eine Idee, wie ich an das Schiff der Paladine komme?";
};

func int Bad_LAP_Schiff_Condition ()
{
  if (other.guild == GIL_BAD)
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Schiff_Info ()
{
  AI_Output(other, self, "Bad_LAP_Schiff_01"); //Habt ihr eine Idee, wie ich an das Schiff der Paladine komme?
  AI_Output(self, other, "Bad_LAP_Schiff_02"); //Eine gute Frage, lass mich nachdenken ...
  AI_Output(self, other, "Bad_LAP_Schiff_03"); //Wenn du der Statthalter wärst, dann könntest du sicher den Richter davon überzeugen dir ein Erlaubnisschein auszustellen.
  if (Larius_abgesetzt)
    {
      AI_Output(self, other, "Bad_LAP_Schiff_04"); //Moment mal, du bist der Statthalter ...
    };
  AI_Output(self, other, "Bad_LAP_Schiff_05"); //Ansonsten bleibt nur noch Lord Hagen dazu zu bringen, dass er die Wachen vom Schiff abzieht.
  AI_Output(self, other, "Bad_LAP_Schiff_06"); //Das ist die Idee, hier nimm dieses Amulett.
  CreateInvItems(self, ItAm_Ork, 1);
  B_GiveInvItems(self, other, ItAm_Ork, 1);
  AI_Output(self, other, "Bad_LAP_Schiff_07"); //Der Feind hat uns als Verräter abgestempelt, aber der Anführer der Orks im Minental ist ein Freund von mir, vielleicht hört er auf dich.
  AI_Output(self, other, "Bad_LAP_Schiff_08"); //Solange du dieses Amulett trägst, wird dich kein Ork, Echsenmensch oder Warg, der die alten Gesetze achtet, angreifen.
  AI_Output(self, other, "Bad_LAP_Schiff_09"); //Frag am Besten mal in der Burg rum, ob jemand weiß wo der Anführer der Orks ist.
  Log_CreateTopic(Verhandlungen, LOG_MISSION);
  Log_SetTopicStatus(Verhandlungen, LOG_RUNNING);
  B_LogEntry(Verhandlungen, "Meister LAP entsendet mich zu den Orks um Verhandlungen aufzunehmen. Ich soll in der Burg rumfragen, wo der Orkische Anführer ist.");
};

//********
// 6.Kreis
//********
instance Bad_LAP_Circle6 (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 4;
  condition = Bad_LAP_Circle6_Condition;
  information = Bad_LAP_Circle6_Info;
  permanent = true;
  description = "Kannst du mir den 6.Kreis der Magie beibringen?";
};

func int Bad_LAP_Circle6_Condition ()
{
  if ((Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)	&& (Kapitel >= 5) && (hero.guild == GIL_BAD))
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Circle6_Info ()
{
  AI_Output(other, self, "Bad_LAP_Circle6_01"); //Kannst du mir den 6.Kreis der Magie beibringen?
  AI_Output(self, other, "Bad_LAP_Circle6_02"); //Ich könnte wohl ...
  if (SC_isDarkMage)
    {
      if (Mis_SCKnowsWayToIrdorath)
	{
	  if B_TeachMagicCircle(self, other, 6)
	    {
	      AI_Output(self, other, "Bad_LAP_Circle6_03"); // ... Dunkelmagier, von nun an sollst du das gefürchtetste Wesen der Welt sein.
	      AI_Output(self, other, "Bad_LAP_Circle6_04"); //Deiner Macht sind nur noch durch die Götter Grenzen gesetzt.
	      AI_Output(self, other, "Bad_LAP_Circle6_05"); //Du bist unsere stärkste Waffe gegen den Feind.
	    };
	}
      else
	{
	  AI_Output(self, other, "Bad_LAP_Circle6_06"); //... aber du bist noch nicht bereit für dieses Wissen.
	};
    }
  else
    {
      AI_Output(self, other, "Bad_LAP_Circle6_07"); // ... aber du bist ein Dunkler Krieger, und als solcher hast du kein Recht auf dieses Wissen.
    };
};

//Runen
instance Bad_LAP_Runen (C_Info)
{
  npc = Bad_9010_LAP;
  nr = 5;
  condition = Bad_LAP_Runen_Condition;
  information = Bad_LAP_Runen_Info;
  permanent = TRUE;
  description = "Lehre mich die Macht der Runen.";
};

func int Bad_LAP_Runen_Condition()
{
  if (other.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Runen_Info()
{
  AI_Output(other, self, "Bad_LAP_Runen_01"); //Lehre mich die Macht der Runen.
  Info_ClearChoices(Bad_LAP_Runen);
  Info_AddChoice(Bad_LAP_Runen, DIALOG_BACK, Bad_LAP_Runen_Back);
  if ((Npc_HasItems(other, ItRu_BreathOfDeath) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_Runen, "Todeshauch (20 LP)", Bad_LAP_Breath);
    };
  if ((Npc_HasItems(other, ItRu_MassDeath) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_Runen, "Todeswelle (20 LP)", Bad_LAP_Mass);
    };
  if ((Npc_HasItems(other, ItRu_ArmyOfDarkness) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_Runen, "Armee der Finsternis (20 LP)", Bad_LAP_Army);
    };
};

func void Bad_LAP_Runen_Back()
{
  Info_ClearChoices(Bad_LAP_Runen);
};

func void Bad_LAP_NotYet ()
{
  AI_Output(self, other, "Bad_LAP_NotYet"); //Du brauchst mehr Erfahrung für diese Rune!
};

func void Bad_LAP_Breath()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_BreathOfDeath, 1);
      B_GiveInvItems(self, other, ItRu_BreathOfDeath, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_NotYet();
    };
};

func void Bad_LAP_Mass()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_MassDeath, 1);
      B_GiveInvItems(self, other, ItRu_MassDeath, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_NotYet();
    };
};

func void Bad_LAP_Army()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_ArmyOfDarkness, 1);
      B_GiveInvItems(self, other, ItRu_ArmyOfDarkness, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_NotYet();
    };
};
