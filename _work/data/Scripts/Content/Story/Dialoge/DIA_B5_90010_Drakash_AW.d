// Exit
instance B5_90010_Drakash_Exit (C_Info)
{
  npc = B5_90010_Drakash_AW;
  condition = B5_90010_Drakash_Exit_Condition;
  information = B5_90010_Drakash_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  nr = 999;
  description = "Ende";
};

func int B5_90010_Drakash_Exit_Condition ()
{
  return true;
};

func void B5_90010_Drakash_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Einhandkampf lernen
instance B5_90010_Drakash_Lern (C_Info)
{
  npc = B5_90010_Drakash_AW;
  nr = 1;
  condition = B5_90010_Drakash_Lern_Condition;
  information = B5_90010_Drakash_Lern_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Bring mir bei, wie man mit leichten Schwerten umgeht.";
};

func int B5_90010_Drakash_Lern_Condition () 
{
  if (hero.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void B5_90010_Drakash_Lern_Info ()
{
  AI_Output(other, self, "B5_90010_Drakash_Lern_01"); //Bring mir bei, wie man mit leichten Schwerten umgeht.
  AI_Output(self, other, "B5_90010_Drakash_Lern_02"); //Gut, lass uns mit deinem Training beginnen.
  Info_ClearChoices(B5_90010_Drakash_Lern);
  Info_AddChoice(B5_90010_Drakash_Lern, DIALOG_BACK, B5_90010_Drakash_Lern_Back);
  Info_AddChoice(B5_90010_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), B5_90010_Drakash_Lern_1);
  Info_AddChoice(B5_90010_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), B5_90010_Drakash_Lern_5);
};

func void B5_90010_Drakash_Lern_Back ()
{
  Info_ClearChoices(B5_90010_Drakash_Lern);
};

func void B5_90010_Drakash_Lern_1 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100);
  if (other.HitChance[NPC_TALENT_1H] >= 100)
    {
      AI_Output(self,other,"B5_90010_Drakash_Lern_03"); //Du bist jetzt ein wahrer Meister im einhändigen Kampf.
      AI_Output(self,other,"B5_90010_Drakash_Lern_04"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_90010_Drakash_Lern);
  Info_AddChoice(B5_90010_Drakash_Lern, DIALOG_BACK, B5_90010_Drakash_Lern_Back);
  Info_AddChoice(B5_90010_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), B5_90010_Drakash_Lern_1);
  Info_AddChoice(B5_90010_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), B5_90010_Drakash_Lern_5);
};

func void B5_90010_Drakash_Lern_5 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100);
  if (other.HitChance[NPC_TALENT_1H] >= 100)
    {
      AI_Output(self,other,"B5_90010_Drakash_Lern_05"); //Du bist jetzt ein wahrer Meister im einhändigen Kampf.
      AI_Output(self,other,"B5_90010_Drakash_Lern_06"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_90010_Drakash_Lern);
  Info_AddChoice(B5_90010_Drakash_Lern, DIALOG_BACK, B5_90010_Drakash_Lern_Back);
  Info_AddChoice(B5_90010_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), B5_90010_Drakash_Lern_1);
  Info_AddChoice(B5_90010_Drakash_Lern, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), B5_90010_Drakash_Lern_5);
};

// Willkommen in meiner Heimat
var int Welcome_Infos;
instance B5_90010_Drakash_Welcome (C_Info)
{
  npc = B5_90010_Drakash_AW;
  condition = B5_90010_Drakash_Welcome_Condition;
  information = B5_90010_Drakash_Welcome_Info;
  important = TRUE;
  permanent = FALSE;
  description = "";
};

func int B5_90010_Drakash_Welcome_Condition ()
{
  if (Npc_KnowsInfo(other, DIA_Addon_Saturas_ADWStart))
    {
      return true;
    };
  return false;
};

func void B5_90010_Drakash_Welcome_Info ()
{
  Welcome_Infos = 0;
  AI_Output(self, other, "B5_90010_Drakash_Welcome_01"); //Da bist du ja, ich wußte doch, dass du die Prüfung bestehen wirst.
  Info_ClearChoices(B5_90010_Drakash_Welcome);
  Info_AddChoice(B5_90010_Drakash_Welcome, "Was für eine Prüfung?", B5_90010_Drakash_Welcome_Prüfung);
  Info_AddChoice(B5_90010_Drakash_Welcome, "Was machst DU hier?", B5_90010_Drakash_Welcome_Hier);
};

func void B5_90010_Drakash_Welcome_Prüfung_Text ()
{
  Welcome_Infos = Welcome_Infos + 1;
  AI_Output(other, self, "B5_90010_Drakash_Welcome_02"); //Was für eine Prüfung meinst du?
  AI_Output(self, other, "B5_90010_Drakash_Welcome_03"); //Du hast doch das Portal gesehen ...
  AI_Output(other, self, "B5_90010_Drakash_Welcome_04"); //Ich bin sogar durch gegangen.
  AI_Output(self, other, "B5_90010_Drakash_Welcome_05"); //... wir haben es damals Adanos geweiht, er prüft jeden, der es durchqueren will.
  AI_Output(other, self, "B5_90010_Drakash_Welcome_06"); //Und wenn ich die Prüfung nicht bestanden hätte?
  AI_Output(self, other, "B5_90010_Drakash_Welcome_07"); //Dann würdest du jetzt nicht vor mir stehen.
  Info_ClearChoices(B5_90010_Drakash_Welcome);
  if (Welcome_Infos == 1)
    {
      Info_AddChoice(B5_90010_Drakash_Welcome, "Was machst DU hier?", B5_90010_Drakash_Welcome_Hier);
    };
};

func void B5_90010_Drakash_Welcome_Hier_Text ()
{
  Welcome_Infos = Welcome_Infos + 1;
  AI_Output(other, self, "B5_90010_Drakash_Welcome_08"); //Was machst DU hier?
  AI_Output(self, other, "B5_90010_Drakash_Welcome_09"); //Dies ist meine Heimat, hier bin ich geboren und aufgewachsen.
  AI_Output(other, self, "B5_90010_Drakash_Welcome_10"); //Wie jetzt? Das Land hier sieht aus, als hätte seit hunderten von Jahren niemand mehr einen Fuß drauf gesetzt.
  AI_Output(self, other, "B5_90010_Drakash_Welcome_11"); //Das ist wahr, es ist lange her. Hat dir Narsus nicht erzählt, dass drei Mitglieder des Bundes der Fünf unsterblich sind?
  AI_Output(self, other, "B5_90010_Drakash_Welcome_12"); //Ich persönlich stehe unter dem Schutz von Adanos.
  if (Npc_KnowsInfo(other, B5_9000_Mage_Search_Finish))
    {
      AI_Output(self, other, "B5_90010_Drakash_Welcome_13"); //Aber das weißt du doch alles schon.
    };
  Info_ClearChoices(B5_90010_Drakash_Welcome);
  if (Welcome_Infos == 1)
    {
      Info_AddChoice(B5_90010_Drakash_Welcome, "Was für eine Prüfung?", B5_90010_Drakash_Welcome_Prüfung);
    };
};

func void B5_90010_Drakash_Welcome_Prüfung ()
{
  B5_90010_Drakash_Welcome_Prüfung_Text();
};

func void B5_90010_Drakash_Welcome_Hier ()
{
  B5_90010_Drakash_Welcome_Hier_Text();
};

//Was nun
instance B5_90010_Drakash_Wasnun (C_Info)
{
  npc = B5_90010_Drakash_AW;
  nr = 1;
  condition = B5_90010_Drakash_Wasnun_Condition;
  information = B5_90010_Drakash_Wasnun_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Du kennst dich hier am Besten aus, was soll ich jetzt machen.";
};

func int B5_90010_Drakash_Wasnun_Condition ()
{
  return true;
};

func void B5_90010_Drakash_Wasnun_Info ()
{
  AI_Output(other, self, "B5_90010_Drakash_Wasnun_01"); //Du kennst dich hier am Besten aus, was soll ich jetzt machen?
  if (RavenIsDead == TRUE)
    {
      AI_Output(self, other, "B5_90010_Drakash_Wasnun_06"); //Du hast es geschafft, Raven ist tot?
      AI_Output(other, self, "B5_90010_Drakash_Wasnun_07"); //Ja, noch toter geht nicht.
      AI_Output(self, other, "B5_90010_Drakash_Wasnun_08"); //Das ist gut, dann ist es also vorbei, möge Adanos dich schützen.
      /*AI_Output(self, other, "B5_90010_Drakash_Wasnun_09"); //Hier, nimm diese Rüstung.
      if (erz_ruest == FALSE)
	{
	  CreateInvItems(self, ORE_ARMOR_M, 2);
	  B_GiveInvItems(self, other, ORE_ARMOR_M, 1);
	  AI_EquipArmor(self, ORE_ARMOR_M);
	  AI_EquipArmor(other, ORE_ARMOR_M);
	  AI_Output(other, self, "B5_90010_Drakash_Wasnun_10"); //Was ist das für eine Rüstung?
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_11"); //Diese Rüstung wurde aus magischem Erz gefertigt und Adanos geweiht.
	  AI_Output(other, self, "B5_90010_Drakash_Wasnun_12"); //Ich hatte schon einmal eine Rüstung aus magischem Erz, die sah aber anders aus.
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_13"); //Ich weiß wovon du sprichst. Nur Mitgliedern des Rat der Fünf und Krieger, die sich besonders ausgezeichnet haben, dürfen diese Rüstung tagen.
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_14"); //Die meine ist jedoch vor langer Zeit verloren gegangen.
	  AI_Output(other, self, "B5_90010_Drakash_Wasnun_15"); //Du hattest so eine Rüstung?
      */
      AI_Output(self, other, "B5_90010_Drakash_Wasnun_16"); //Ich gehörte zur Kaste der Gelehrten und habe diese im Rat vertreten.
      AI_Output(other, self, "B5_90010_Drakash_Wasnun_17"); //Dann hast du diese Texte geschrieben?
      AI_Output(self, other, "B5_90010_Drakash_Wasnun_18"); //Ja, so ist es, nun ist es aber wieder Zeit, zu Narsus zurückzukehren.
      //};
      AI_StopProcessInfos(self);
      //AI_Teleport(self, "TOT");
      //Npc_ExchangeRoutine(self, "tot");
      //erz_ruest == TRUE;
    }
  else
    {
      if (RavenIsInTempel == TRUE)
	{
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_02"); //Du musst in den Tempel gelangen und Raven aufhalten, es ist wichtig!
	};
      if (SC_KnowsFortunoInfos == TRUE)
	{
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_03"); //Dieser Raven hat das Grab Khardimons entweiht, dafür wird er sterben müssen!
	};
      if (SC_TalkedToGhost == TRUE)
	{
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_04"); //Du hast mit Quahodron geredet? Nur er ist noch dazu in der Lage, dir den Zugang zum Tempel zu gewähren.
	};
      if (!(RavenIsInTempel || SC_KnowsFortunoInfos || SC_TalkedToGhost))
	{
	  AI_Output(self, other, "B5_90010_Drakash_Wasnun_05"); //Du musst herausfinden was Raven vorhat.
	};
    };
};

// Wasserperlen

instance B5_90010_Drakash_Wasserperle (C_Info)
{
  npc = B5_90010_Drakash_AW;
  nr = 3;
  condition = B5_90010_Drakash_Wasserperle_Condition;
  information = B5_90010_Drakash_Wasserperle_Info;
  description = "Sagt dir Wasserperle etwas?";
};

func int B5_90010_Drakash_Wasserperle_Condition ()
{
  if (Npc_KnowsInfo(other, Bad_LAP_Wasserperle) && !(Npc_KnowsInfo(other, B5_9001_Drakash_Wasserperle)))
    {
      return true;
    };
  return false;
};

func void B5_90010_Drakash_Wasserperle_Info ()
{
  AI_Output(other, self, "B5_90010_Drakash_01"); //Sagt dir Wasserperle etwas?
  AI_Output(self, other, "B5_90010_Drakash_02"); //Woher weißt du?
  AI_Output(other, self, "B5_90010_Drakash_03"); //Meister LAP hat mir erzählt, dass ich eine solche Perle brauche.
  AI_Output(self, other, "B5_90010_Drakash_04"); //Mhh, eigentlich sind diese Perlen zu wertvoll, aber ...
  AI_Output(self, other, "B5_90010_Drakash_05"); //Was soll's, wenn Meister LAP es dir erzählt hat. Also hör zu!
  AI_Output(self, other, "B5_90010_Drakash_06"); //Die Wasserperlen waren in der Obhut der Priester und wurden mit Khardimon begraben. Wenn überhaupt, dann findest du dort welche.
  B_LogEntry(Almanach_Dunkelmagier, "Drakash hat mir gesagt, dass sich in Khardimons Grab noch Wasserperlen befinden könnten.");
  Wld_InsertItem(ItMi_Wasserperle, "ADW_GRUFT_07");
};
