//*****
// ENDE
//*****

instance Bad_LAP_DI_Ende (C_Info)
{
  npc = Bad_90100_LAP_DI;
  nr = 999;
  condition = Bad_LAP_DI_Ende_Condition;
  information = Bad_LAP_DI_Ende_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

func int Bad_LAP_DI_Ende_Condition ()
{
  return true;
};

func void Bad_LAP_DI_Ende_Info ()
{
  AI_StopProcessInfos(self);
};

//******
// Hallo
//******

instance Bad_LAP_DI_Willkommen (C_Info)
{
  npc = Bad_90100_LAP_DI;
  condition = Bad_LAP_DI_Willkommen_Condition;
  information = Bad_LAP_DI_Willkommen_Info;
  important = TRUE;
};

func int Bad_LAP_DI_Willkommen_Condition ()
{
  return true;
};

func void Bad_LAP_DI_Willkommen_Info ()
{
  AI_Output(self, other, "Bad_LAP_DI_Willkommen_01"); //Willkommen auf Irdorath.
  if (SC_isDarkMage)
	&& (Npc_HasItems(hero, ItAm_Seelen))
    {
      AI_Output(self, other, "Bad_LAP_DI_Willkommen_02"); //Nun ist es an der Zeit, die Macht der Vereinigung zu nutzen!
      AI_Output(self, other, "Bad_LAP_DI_Willkommen_03"); //Dazu will ich dir eine Geheimnis verraten!
      AI_Output(self, other, "Bad_LAP_DI_Willkommen_04"); //Die Macht der Vereinigung wird dafür sorgen, dass jeder Mensch, Ork oder Echsenmensch, der in deiner Nähe stirb, als Feuerkrieger wiedergeboren wird.
      AI_Output(self, other, "Bad_LAP_DI_Willkommen_05"); //Maximal zehn von ihnen werden dir dienen, solange sie können. Sie leben von der Gesundheit ihrer Feinde, sollte diese nicht mehr ausreichen, dann greifen sie auf deinen Manavorrat zurück.
      AI_Output(self, other, "Bad_LAP_DI_Willkommen_06"); //Es heißt, man kann sie nur mit dem Bogen bzw. der Armbrust oder dem Schwert töten.
      AI_Output(self, other, "Bad_LAP_DI_Willkommen_07"); //Aber lass dich von dieser Macht nicht blenden, die Erwählten der Götter können auch ihren Schutz vor Feuer und Magie durchdringen!
    };
};

//********
// 6.Kreis
//********
instance Bad_LAP_DI_Circle6 (C_Info)
{
  npc = Bad_90100_LAP_DI;
  nr = 4;
  condition = Bad_LAP_DI_Circle6_Condition;
  information = Bad_LAP_DI_Circle6_Info;
  permanent = true;
  description = "Kannst du mir den 6.Kreis der Magie beibringen?";
};

func int Bad_LAP_DI_Circle6_Condition ()
{
  if ((Npc_GetTalentSkill (hero, NPC_TALENT_MAGE) == 5)	&& (Kapitel >= 5) && (hero.guild == GIL_BAD))
    {
      return true;
    };
  return false;
};

func void Bad_LAP_DI_Circle6_Info ()
{
  AI_Output(other, self, "Bad_LAP_DI_Circle6_01"); //Kannst du mir den 6.Kreis der Magie beibringen?
  AI_Output(self, other, "Bad_LAP_DI_Circle6_02"); //Ich könnte wohl ...
  if (SC_isDarkMage)
    {
      if B_TeachMagicCircle(self, other, 6)
	{
	  AI_Output(self, other, "Bad_LAP_DI_Circle6_03"); // ... Dunkelmagier, von nun an sollst du das gefürchtetste Wesen der Welt sein.
	  AI_Output(self, other, "Bad_LAP_DI_Circle6_04"); //Deiner Macht sind nur noch durch die Götter Grenzen gesetzt.
	  AI_Output(self, other, "Bad_LAP_DI_Circle6_05"); //Du bist unsere stärkste Waffe gegen den Feind.
	}
      else
	{
	  AI_Output(self, other, "Bad_LAP_DI_Circle6_06"); //... aber du bist noch nicht bereit für dieses Wissen.
	};
    }
  else
    {
      AI_Output(self, other, "Bad_LAP_DI_Circle6_07"); // ... aber du bist ein Dunkler Krieger, und als solcher hast du kein Recht auf dieses Wissen.
    };
};

//Runen
instance Bad_LAP_DI_Runen (C_Info)
{
  npc = Bad_90100_LAP_DI;
  nr = 5;
  condition = Bad_LAP_DI_Runen_Condition;
  information = Bad_LAP_DI_Runen_Info;
  permanent = TRUE;
  description = "Lehre mich die Macht der Runen.";
};

func int Bad_LAP_DI_Runen_Condition()
{
  if (other.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void Bad_LAP_DI_Runen_Info()
{
  AI_Output(other, self, "Bad_LAP_DI_Runen_01"); //Lehre mich die Macht der Runen.
  Info_ClearChoices(Bad_LAP_DI_Runen);
  Info_AddChoice(Bad_LAP_DI_Runen, DIALOG_BACK, Bad_LAP_DI_Runen_Back);
  if ((Npc_HasItems(other, ItRu_BreathOfDeath) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Todeshauch (20 LP)", Bad_LAP_DI_Breath);
    };
  if ((Npc_HasItems(other, ItRu_MassDeath) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Todeswelle (20 LP)", Bad_LAP_DI_Mass);
    };
  if ((Npc_HasItems(other, ItRu_ArmyOfDarkness) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Armee der Finsternis (20 LP)", Bad_LAP_DI_Army);
    };
    if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1) && (Npc_HasItems(other, ItRu_SumGobSkel) == 0))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Goblin Skelett (3 LP)", Bad_LAP_DI_GoblinSkeleton);
    };
  if ((Npc_HasItems(other, ItRu_GreenTentacle) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Wurzelschlingen (3 LP)", Bad_LAP_DI_GreenTentacle);
    };
  if ((Npc_HasItems(other, ItRu_SumSnapper) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Snapper rufen (5 LP)", Bad_LAP_DI_Snapper);
    };
  if ((Npc_HasItems(other, ItRu_SuckEnergy) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2) && !(Got_Suck))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Energie entziehen (5 LP)", Bad_LAP_DI_Suck);
    };
  if ((Npc_HasItems(other, ItRu_SumSkel) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Skelett rufen (10 LP)", Bad_LAP_DI_Skeleton);
    };
  if ((Npc_HasItems(other, ItRu_Fear) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Angst (5 LP)", Bad_LAP_DI_Fear);
    };
  if ((Npc_HasItems(other, ItRu_BeliarsRage) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3) && !(Got_Zorn))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Beliars Zorn (7 LP)", Bad_LAP_DI_BeliarsRage);
    };
  if ((Npc_HasItems(other, ItRu_SummonGuardian) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Steinwächter erschaffen (5 LP)", Bad_LAP_DI_Guardian);
    };
  if ((Npc_HasItems(other, ItRu_SumDemon2) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Dämon rufen (20 LP)", Bad_LAP_DI_Demon);
    };
  if ((Npc_HasItems(other, ItRu_HarmUndead) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && !(Got_Undead))
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Untoter strafen (10 LP)", Bad_LAP_DI_Undead);
    };
  if ((Npc_HasItems(other, ItRu_Swarm) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Schwarm beschwören (13 LP)", Bad_LAP_DI_Swarm);
    };
  if ((Npc_HasItems(other, ItRu_SummonZombie) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Zombie erwecken (12 LP)", Bad_LAP_DI_Zombie);
    };
  if ((Npc_HasItems(other, ItRu_Skull) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5) && SC_isDarkMage)
    {
      Info_AddChoice(Bad_LAP_DI_Runen, "Schrei der Toten (20 LP)", Bad_LAP_DI_Skull);
    };
};

func void Bad_LAP_DI_Runen_Back()
{
  Info_ClearChoices(Bad_LAP_DI_Runen);
};

func void Bad_LAP_DI_NotYet ()
{
  AI_Output(self, other, "Bad_LAP_DI_NotYet"); //Du brauchst mehr Erfahrung für diese Rune!
};

func void Bad_LAP_DI_Skull()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_Skull, 1);
      B_GiveInvItems(self, other, ItRu_Skull, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Zombie()
{
  if (other.lp >= 12)
    {
      CreateInvItems(self, ItRu_SummonZombie, 1);
      B_GiveInvItems(self, other, ItRu_SummonZombie, 1);
      other.lp = other.lp - 12;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Swarm()
{
  if (other.lp >= 13)
    {
      CreateInvItems(self, ItRu_Swarm, 1);
      B_GiveInvItems(self, other, ItRu_Swarm, 1);
      other.lp = other.lp - 13;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Undead()
{
  if (other.lp >= 10)
    {
      CreateInvItems(self, ItRu_HarmUndead, 1);
      B_GiveInvItems(self, other, ItRu_HarmUndead, 1);
      other.lp = other.lp - 10;
      Got_Undead = TRUE;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Demon()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_SumDemon2, 1);
      B_GiveInvItems(self, other, ItRu_SumDemon2, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_GoblinSkeleton()
{
  if (other.lp >= 3)
    {
      CreateInvItems(self, ItRu_SumGobSkel, 1);
      B_GiveInvItems(self, other, ItRu_SumGobSkel, 1);
      other.lp = other.lp - 3;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Guardian()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_SummonGuardian, 1);
      B_GiveInvItems(self, other, ItRu_SummonGuardian, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_BeliarsRage()
{
  if (other.lp >= 7)
    {
      CreateInvItems(self, ItRu_BeliarsRage, 1);
      B_GiveInvItems(self, other, ItRu_BeliarsRage, 1);
      other.lp = other.lp - 7;
      Got_Zorn = TRUE;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Skeleton()
{
  if (other.lp >= 10)
    {
      CreateInvItems(self, ItRu_SumSkel, 1);
      B_GiveInvItems(self, other, ItRu_SumSkel, 1);
      other.lp = other.lp - 10;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Fear()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_Fear, 1);
      B_GiveInvItems(self, other, ItRu_Fear, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Snapper()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_SumSnapper, 1);
      B_GiveInvItems(self, other, ItRu_SumSnapper, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Suck()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_SuckEnergy, 1);
      B_GiveInvItems(self, other, ItRu_SuckEnergy, 1);
      other.lp = other.lp - 5;
      Got_Suck = TRUE;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_GreenTentacle()
{
  if (other.lp >= 3)
    {
      CreateInvItems(self, ItRu_GreenTentacle, 1);
      B_GiveInvItems(self, other, ItRu_GreenTentacle, 1); 
      other.lp = other.lp - 3;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Breath()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_BreathOfDeath, 1);
      B_GiveInvItems(self, other, ItRu_BreathOfDeath, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Mass()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_MassDeath, 1);
      B_GiveInvItems(self, other, ItRu_MassDeath, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

func void Bad_LAP_DI_Army()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_ArmyOfDarkness, 1);
      B_GiveInvItems(self, other, ItRu_ArmyOfDarkness, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      Bad_LAP_DI_NotYet();
    };
};

instance Bad_90100_LAP_DI_Befoerderung (C_Info)
{
  npc = Bad_90100_LAP_DI;
  condition = Bad_90100_LAP_DI_Befoerderung_Condition;
  information = Bad_90100_LAP_DI_Befoerderung_Info;
  important = TRUE;
};

func int Bad_90100_LAP_DI_Befoerderung_Condition ()
{
  if (Npc_IsDead(Bad_9018_Knut))
    {
      return true;
    };
  return false;
};

func void Bad_90100_LAP_DI_Befoerderung_Info ()
{
  AI_Output(self, other, "Bad_LAP_Befoerderung_01"); //Der ist ja völlig durchgedreht.
  AI_Output(self, other, "Bad_LAP_Befoerderung_02"); //Ich hätte nie gedacht, dass ein Dunkler Krieger mich angreift!
  if (SC_isDarkWarrior)
    {
      AI_Output(self, other, "Bad_LAP_Befoerderung_03"); //Vielleicht kannst du sie im Zaum halten.
      AI_Output(self, other, "Bad_LAP_Befoerderung_04"); //Dazu verleihe ich dir diese Rüstung eines Anführers der Dunklen Krieger, trage sie mit Stolz.
      CreateInvItems(self, ITAR_Beliar, 1);
      B_GiveInvItems(self, other, ITAR_Beliar, 1);
      B_GivePlayerXP(XP_Ambient);
    };
};
