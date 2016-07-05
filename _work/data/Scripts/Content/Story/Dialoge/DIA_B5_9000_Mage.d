const string B5_9000_Mage_Search = "Die Suche";
const string B5_9000_Mage_Prüfung = "Die Prüfung";
const string B5_9000_Mage_Hüter = "Die vier Hüter";
var int SC_isDarkMage; //Spieler ist Dunkelmagier
var int SC_isDarkWarrior; //Spieler ist Dunkler Krieger
var int Suche_begonnen; //Die Suche hat begonnen
var int Drakash_gefunden; //Drakash gefunden ;)
var int Hammer_holen; //SC soll den Hammer holen
var int Prüfung_bestanden; //Dunkler Schüler darf lernen
var int Dark_Prüfung_Info; //Prüfungsinfos erhalten
var int Got_Suck; //SC hat Rune "Energie stehlen" erhalten
var int Got_Zorn; //SC hat Rune "Beliar's Zorn" erhalten
var int Got_Undead; //SC hat Rune "Untote vernichten" erhalten

// Cheat - Help Me becoming a Dark Mage
instance B5_9000_Mage_Help_Me (C_Info) //Nur zu Test-Zwecken
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Help_Me_Condition;
  information = B5_9000_Mage_Help_Me_Info;
  permanent = FALSE;
  important = FALSE;
  description = "(CHEAT) JETZT DUNKELSCHÜLER WERDEN";
  nr = 5;
};

func int B5_9000_Mage_Help_Me_Condition ()
{
  //return TRUE; //Auskommentieren für Version 1.0
  return FALSE;
};

func void B5_9000_Mage_Help_Me_Info ()
{
  CreateInvItems(other, Holy_Hammer_Mis, 1);
  hero.guild = GIL_Bad;
  Info_ClearChoices(B5_9000_Mage_Help_Me);
  Info_AddChoice(B5_9000_Mage_Help_Me, "Dunkler Magier", B5_9000_Mage_Help_Me_Mage);
  Info_AddChoice(B5_9000_Mage_Help_Me, "Dunkler Krieger", B5_9000_Mage_Help_Me_Warrior);
};

func void Mage_Help_Kapitelwechsel ()
{
  Npc_SetTrueGuild(hero, GIL_Bad);
  Npc_SetTalentSkill (other, NPC_TALENT_MAGE, 5);
  CreateInvItems(other, ItRu_SumGobSkel, 1);
  CreateInvItems(other, ItRu_GreenTentacle, 1);
  CreateInvItems(other, ItRu_SumSnapper, 1);
  CreateInvItems(other, ItRu_SuckEnergy, 1);
  CreateInvItems(other, ItRu_SumSkel, 1);
  CreateInvItems(other, ItRu_Fear, 1);
  CreateInvItems(other, ItRu_BeliarsRage, 1);
  CreateInvItems(other, ItRu_SummonGuardian, 1);
  CreateInvItems(other, ItRu_HarmUndead, 1);
  CreateInvItems(other, ItMi_Ornament_Addon, 3);
  CreateInvItems(other, ItMi_Ornament_Addon_Vatras, 1);
  CreateInvItems(other, ItRi_Ranger_Addon, 1);
  CreateInvItems(other, ItKe_Pass_Mis, 1);
  CreateInvItems(other, ItMw_BeliarWeapon_Raven, 1);
  CreateInvItems(other, ItMi_RingBeliarStatue2, 1);
  CreateInvItems(other, ItMi_BeliarRing2, 5);
  SC_IsRanger = TRUE;
  RavenIsDead = TRUE;
  B_GivePlayerXP(400);
  other.lp = 100;
  AI_StopProcessInfos(self);
  Npc_ExchangeRoutine(self, "Smalltalk");
  Npc_ExchangeRoutine(B5_9001_Drakash, "Smalltalk");
  Wld_InsertNpc(B5_9002_Helmchen, "NW_XARDAS_TOWER_VALLEY_09");
  Npc_ExchangeRoutine(B5_9002_Helmchen, "Smalltalk");
  //Ab ins 5.Kapitel
  //-------- was davor geschah --------	
  MIS_OLDWORLD = LOG_RUNNING;
  //-------- was neu geschieht --------
  CreateInvItems (hero,ItWr_PaladinLetter_MIS,1);
  KnowsPaladins_Ore = TRUE;
  MIS_ScoutMine = LOG_SUCCESS;
  MIS_ReadyForChapter3  = TRUE; 
  B_NPC_IsAliveCheck (OldWorld_Zen);
  B_Kapitelwechsel		(3, NEWWORLD_ZEN );
  
  //-------- was neu geschieht --------	
  PLAYER_TALENT_ALCHEMY[Charge_InnosEye] 		= TRUE;	
  PrintScreen	(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
  CreateInvItems (hero,ItMi_InnosEye_MIS,1);
  CreateInvItems(hero, ItMi_RuneBlank, 1);
  MIS_ReadyforChapter4 = TRUE; 
  B_NPC_IsAliveCheck (NEWWORLD_ZEN);
  B_Kapitelwechsel		(4, NEWWORLD_ZEN );
  //-------- was neu geschieht --------
  CreateInvItems (hero,ItAt_IcedragonHeart,1);			//damit man eins für die DI hat!!
  MIS_AllDragonsDead = TRUE;
  MIS_ReadyforChapter4 = FALSE; //Ansonsten wechselt man beim betreten der Oldworld ins 4.Kapitel
  B_Kapitelwechsel		(5, NEWWORLD_ZEN );
  Wld_InsertNpc(Bad_9009_Tod, "NW_LITTLESTONEHENDGE_01");
  Tod_wechselt = FALSE;
  CreateInvItems (hero, ItKe_Ship_Levelchange_MIS, 1);
  Lee_IsOnBoard = LOG_SUCCESS;
  MiltenNW_IsOnBoard = LOG_SUCCESS;
  Lester_IsOnBoard = LOG_SUCCESS;
  Gorn_IsOnBoard = LOG_SUCCESS;
  Mario_IsOnBoard = LOG_SUCCESS;
  Lares_IsOnBoard = LOG_SUCCESS;
  Diego_IsOnBoard = LOG_SUCCESS;
  Angar_IsOnBoard = LOG_SUCCESS;
  Girion_IsOnBoard = LOG_SUCCESS;
  JorgenIsCaptain = TRUE;
  CreateInvItems(hero, ITWr_ForgedShipLetter_MIS, 1);
};

func void B5_9000_Mage_Help_Me_Mage ()
{
  SC_isDarkMage = true;
  CreateInvItems(other, ItAr_DarkMage, 1);
  CreateInvItems(other, ItRu_SumDemon2, 1);
  CreateInvItems(other, ItRu_Swarm, 1);
  CreateInvItems(other, ItRu_SummonZombie, 1);
  CreateInvItems(other, ItRu_Skull, 1);
  CreateInvItems(other, ItAm_Seelen, 1);
  Mage_Help_Kapitelwechsel();
};

func void B5_9000_Mage_Help_Me_Warrior ()
{
  SC_isDarkWarrior = true;
  CreateInvItems(other, ORE_ARMOR_M, 1);
  CreateInvItems(other, ItMw_2H_Daemonenschneide, 1);
  Mage_Help_Kapitelwechsel();
};

// EXIT
instance B5_9000_Mage_Exit (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Exit_Condition;
  information = B5_9000_Mage_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  description = "ENDE";
  nr = 999;
};

FUNC int B5_9000_Mage_Exit_Condition ()
{
  return TRUE;
};

FUNC void B5_9000_Mage_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

// Nach Drakash suchen
instance B5_9000_Mage_Search1 (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Search1_Condition;
  information = B5_9000_Mage_Search1_Info;
  important = TRUE;
  permanent = FALSE;
  description = "";
};

FUNC int B5_9000_Mage_Search1_Condition ()
{
  if (!Npc_KnowsInfo(other, B5_9000_Mage_Search1))
    {
      return TRUE;
    };
};

FUNC int B5_9000_Mage_Search1_Info ()
{
  Hammer_holen = FALSE;
  AI_Output(self, other, "B5_9000_Mage_Search1_01"); // Ich spüre eine seltsame Präsenz in dir.
  AI_Output(self, other, "B5_9000_Mage_Search1_02"); // Es ist, als hättest du Kontakt mit einem mächtigen Dämonen gehabt.
  AI_Output(other, self, "B5_9000_Mage_Search1_03"); // Kontakt ist gut, ich habe den Schläfer besiegt.
  AI_Output(self, other, "B5_9000_Mage_Search1_04"); // Du hast mit dem Schläfer gekämpft und es überlebt? Die Götter müssen dich wahrhaft lieben.
  AI_Output(other, self, "B5_9000_Mage_Search1_05"); // Naja, ganz so einfach war es nicht ...
  AI_Output(self, other, "B5_9000_Mage_Search1_06"); // Ich glaube, du bist genau der richtige für die Suche, die Frage ist nun nur noch, ob du willst.
  Info_ClearChoices(B5_9000_Mage_Search1);
  Info_AddChoice(B5_9000_Mage_Search1, "Worum geht es?", B5_9000_Mage_Search1_Yes);
  Info_AddChoice(B5_9000_Mage_Search1, "Ich habe momentan keine Zeit!", B5_9000_Mage_Search1_No);
};

func void B5_9000_Mage_Search1_Yes ()
{
  AI_Output(other, self, "B5_9000_Mage_Search1_07"); // Worum geht es?
  AI_Output(self, other, "B5_9000_Mage_Search1_08"); // Ich suche einen Freund, Drakash, er soll sich irgendwo in der Nähe der Stadt rumtreiben.
  AI_Output(self, other, "B5_9000_Mage_Search1_09"); // Wenn du ihn siehst, sag ihm, dass ich an der großen Feldkreuzung auf ihn warte.
  LOG_CreateTopic(B5_9000_Mage_Search, LOG_MISSION);
  LOG_SetTopicStatus(B5_9000_Mage_Search, LOG_RUNNING);
  B_LogEntry(B5_9000_Mage_Search, "Ich soll für Narsus einen Freund finden (warum sucht er eigentlich nicht selbst?). Sie treffen sich dann an der großen Feldkreuzung.");
  Suche_begonnen = TRUE;
  AI_StopProcessInfos(self);
  Npc_ExchangeRoutine(self, "WaitForFriends");
  Drakash_gefunden = FALSE;
};

func void B5_9000_Mage_Search1_No ()
{
  AI_Output(other, self, "B5_9000_Mage_Search1_10"); // Ich habe im Moment keine Zeit!
  AI_Output(self, other, "B5_9000_Mage_Serach1_11"); // Das ist schade, wenn du deine Meinung änderst, dann findest du mich hier.
  Suche_begonnen = FALSE;
  AI_StopProcessInfos(self);
};

// Suche beginnen
instance B5_9000_Mage_StartSearch (C_Info)
{
  npc = B5_9000_Mage;
  nr = 1;
  condition = B5_9000_Mage_StartSearch_Condition;
  information = B5_9000_Mage_StartSearch_Info;
  important = FALSE;
  permanent = TRUE;
  description = "Ich hab mir die Sache mit deinem Freund nochmal überlegt.";
};

func int B5_9000_Mage_StartSearch_Condition ()
{
  return !Suche_begonnen;
};

func void B5_9000_Mage_StartSearch_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_StartSearch_01"); // Ich habe mir die Sache mit deinem Freund nochmal überlegt.
  AI_Output(self, other, "B5_9000_Mage_StartSearch_02"); // Und?
  Info_ClearChoices(B5_9000_Mage_StartSearch);
  Info_AddChoice(B5_9000_Mage_StartSearch, "Worum geht's?", B5_9000_Mage_Search1_Yes);
  Info_AddChoice(B5_9000_Mage_StartSearch, "Ich habe im Moment keine Zeit!", B5_9000_Mage_Search1_No);
};

// Drakash gefunden, Lord Helmchen suchen
instance B5_9000_Mage_Search2 (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Search2_Condition;
  information = B5_9000_Mage_Search2_Info;
  important = FALSE;
  permanent = FALSE;
  description = "Ich habe Drakash gefunden.";
  nr = 2;
};

func int B5_9000_Mage_Search2_Condition ()
{
  return (Drakash_gefunden && (!Npc_KnowsInfo(hero, B5_9000_Mage_Search2)));
};

func void B5_9000_Mage_Search2_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Search2_01"); // Ich habe Drakash gefunden, er kommt her.
  AI_Output(self, other, "B5_9000_Mage_Search2_02"); // Dann such als nächstes Lord Helmchen.
  AI_Output(other, self, "B5_9000_Mage_Search2_03"); // Und wo soll er sein?
  AI_Output(self, other, "B5_9000_Mage_Search2_04"); // Er wollte sich in der Nähe von Xardas' Turm ein Höhle ansehen, vermutlich unten im Tal.
  B_LogEntry(B5_9000_Mage_Search, "Jetzt darf ich Lord Helmchen suchen, er soll irgendwo in dem Tal bei Xardas' Turm sein.");
  B_GivePlayerXP(500);
  Wld_InsertNpc(B5_9002_Helmchen, "NW_XARDAS_TOWER_VALLEY_09");
};

// Lord Helmchen gefunden
instance B5_9000_Mage_Search_Finish (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Search_Finish_Condition;
  information = B5_9000_Mage_Search_Finish_Info;
  important = FALSE;
  permanent = FALSE;
  description = "Ich hab Lord Helmchen hergeschickt.";
  nr = 3;
};

func int B5_9000_Mage_Search_Finish_Condition ()
{
  if (Npc_KnowsInfo(hero, B5_9002_Helmchen_Demon_Dead))
    {
      return TRUE;
    };
  return FALSE;
};

func void B5_9000_Mage_Search_Finish_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Search_Finish_01"); //Ich habe Lord Helmchen hergeschickt.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_02"); //Sehr gut, dann sind jetzt alle noch lebenden Mitglieder des Bunds der Fünf hier versammelt.
  AI_Output(other, self, "B5_9000_Mage_Search_Finish_03"); //Der Bund der Fünf?
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_04"); //Der Bund wurde vor sehr langer Zeit von den drei Göttern gemeinsam gegründet, jeder stellte ein Mitglied.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_05"); //Lord Helmchen vertritt Innos.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_06"); //Drakash kommt aus einer Kultur die Adanos geweiht war.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_07"); //Und ich bediene mich der Magie Beliars.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_08"); //Unsere Aufgabe ist es, dass Überleben der Menschheit zu sichern.
  AI_Output(other, self, "B5_9000_Mage_Search_Finish_09"); //Aber warum Bund der Fünf, ihr seit nur drei.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_10"); //Der Bund der Fünf besteht aus den drei unsterblichen Mitgliedern, die du hier vor dir siehst.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_11"); //Und dazu kommen der Erwählte Innos und der Erwählte Adanos.
  AI_Output(self, other, "B5_9000_Mage_Search_Finish_12"); //Du hast uns einen großen Dienst erwiesen, und ich spüre eine große Begabung in dir, wenn du willst, werde ich dich in den dunklen Künsten unterrichten.
  if (!(hero.guild == GIL_None))
    {
      AI_Output(self, other, "B5_9000_Mage_Search_Finish_13"); //Aber du hast dich ja schon anders entschieden ...
    };
  LOG_SetTopicStatus(B5_9000_Mage_Search, LOG_SUCCESS);
  B_GivePlayerXP(500);
};

//Warum Schüler werden?
instance B5_9000_Mage_Why (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Why_Condition;
  information = B5_9000_Mage_Why_Info;
  important = FALSE;
  permanent = TRUE;
  description = "Warum sollte ich die dunklen Künste erlernen?";
  nr = 4;
};

func int B5_9000_Mage_Why_Condition ()
{
  if (Npc_KnowsInfo(hero, B5_9000_Mage_Search_Finish) && (hero.guild == GIL_None))
    {
      return TRUE;
    };
  return FALSE;
};

func void B5_9000_Mage_Why_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Why_01"); //Warum sollte ich die dunklen Künste erlernen?
  AI_Output(self, other, "B5_9000_Mage_Why_02"); //Nun ja, du wirst von mir Zauber erlernen, die dir die Feuermagier nicht beibringen können.
  AI_Output(self, other, "B5_9000_Mage_Why_03"); //Ich will dir nichts vormachen, die Magie des Feuers und des Wassers werden dir verwehrt bleiben, aber dafür wirst du die Macht Beliars nutzen können.
  AI_Output(self, other, "B5_9000_Mage_Why_04"); //Und solltest du am Kampf interessiert sein, Drakash ist ein Meister mit der Einhand-Waffe, genauso wie Lord Helmchen mit den Zweihändern.
};

//Ich will Schüler werden
instance B5_9000_Mage_Become_Dark (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Become_Dark_Condition;
  information = B5_9000_Mage_Become_Dark_Info;
  important = FALSE;
  permanent = TRUE;
  description = "Ich bin bereit, dein Schüler zu werden.";
  nr = 5;
};

func int B5_9000_Mage_Become_Dark_Condition ()
{
  if (Npc_KnowsInfo(hero, B5_9000_Mage_Search_Finish) && (hero.guild == GIL_None))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Become_Dark_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Become_Dark_01"); //Ich bin bereit, dein Schüler zu werden.
  AI_Output(self, other, "B5_9000_Mage_Become_Dark_02"); //Dann heiße ich dich hiermit willkommen, Anwärter auf die Dunkle Robe.
  CreateInvItems(self, ITAR_DarkPupil, 1);
  B_GiveInvItems(self, hero, ITAR_DarkPupil, 1);
  AI_EquipArmor(hero, ITAR_DarkPupil);
  hero.guild = GIL_Bad;
  SC_isDarkMage = false;
  SC_isDarkWarrior = false;
  Npc_SetTrueGuild(hero, GIL_Bad);

	SummonMax = 3;

  B_GivePlayerXP(400);
  AI_Output(self, other, "B5_9000_Mage_Become_Dark_03"); //Bevor ich dich jedoch in den Künsten der Magie unterrichten kann, musst du erst beweisen, dass du würdig bist!
  AI_Output(other, self, "B5_9000_Mage_Become_Dark_04"); //Wie?
  AI_Output(self, other, "B5_9000_Mage_Become_Dark_05"); //Als erstes sollst du mir den Heiligen Hammer Innos holen.
  AI_Output(other, self, "B5_9000_Mage_Become_Dark_06"); //Aber wie soll ich ins Kloster kommen?
  AI_Output(self, other, "B5_9000_Mage_Become_Dark_07"); //Mach dir darüber keine Sorgen, denk lieber darüber nach, wie du wieder rauskommen sollst!
  AI_Output(self, other, "B5_9000_Mage_Become_Dark_08"); //Such dir aber vorher eine dieser drei Schriftrollen aus.
  AI_Output(other, self, "B5_9000_Mage_Become_Dark_09"); //Ich nehme die ...
  Info_ClearChoices(B5_9000_Mage_Become_Dark);
  Info_AddChoice(B5_9000_Mage_Become_Dark, "... Todeshauch-Schriftrolle.", B5_9000_Mage_Become_Dark_Death);
  Info_AddChoice(B5_9000_Mage_Become_Dark, "... Vergessen-Schriftrolle.", B5_9000_Mage_Become_Dark_Forget);
  Info_AddChoice(B5_9000_Mage_Become_Dark, "... Schlaf-Schriftrolle.", B5_9000_Mage_Become_Dark_Sleep);
};

func void B5_9000_Mage_Become_Dark_Send ()
{
  AI_Output(self, other, "B5_9000_Mage_Become_Dark_10"); //Hier, ich werde dir den Zugang zum Kloster ermöglichen.
  //CreateInvItems(self, ItWr_Narsus_Brief_für_Pyrokar, 1);
  //B_GiveInvItems(self, other, ItWr_Narsus_Brief_für_Pyrokar, 1);
  AI_StopProcessInfos(self);
  LOG_CreateTopic(B5_9000_Mage_Prüfung, LOG_MISSION);
  LOG_SetTopicStatus(B5_9000_Mage_Prüfung, LOG_RUNNING);
  B_LogEntry(B5_9000_Mage_Prüfung, "Ich soll für Narsus den heiligen Hammer Innos mitgehen lassen.");
  //AI_StartState(self, ZS_TeleportHero, 0, "NW_MONASTERY_PLACE_03");
  //AI_StartState(self, ZS_Stand_WP, 0, "");
  AI_StartState(self, ZS_TeleportHero_Kloster, 0, "");
  Hammer_holen = TRUE;
};

func void B5_9000_Mage_Become_Dark_Death ()
{
  CreateInvItems(self, ItSc_BreathOfDeath, 1);
  B_GiveInvItems(self, other, ItSc_BreathOfDeath, 1);
  B5_9000_Mage_Become_Dark_Send();
};

func void B5_9000_Mage_Become_Dark_Forget ()
{
  CreateInvItems(self, ItSc_Charm, 1);
  B_GiveInvItems(self, other, ItSc_Charm, 1);
  B5_9000_Mage_Become_Dark_Send();
};

func void B5_9000_Mage_Become_Dark_Sleep ()
{
  CreateInvItems(self, ItSc_Sleep, 1);
  B_GiveInvItems(self, other, ItSc_Sleep, 1);
  B5_9000_Mage_Become_Dark_Send();
};

//Hammer gefunden
instance B5_9000_Mage_Become_Mage (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Become_Mage_Condition;
  information = B5_9000_Mage_Become_Mage_Info;
  important = FALSE;
  permanent = FALSE;
  nr = 5;
  description = "Ich habe den Hammer.";
};

func int B5_9000_Mage_Become_Mage_Condition ()
{
  if ((other.guild == GIL_Bad) && (Npc_HasItems(other, Holy_Hammer_Mis) == 1) && (Hammer_holen == TRUE))
    {
      return TRUE;
    };
  return FALSE;
};

func void B5_9000_Mage_Become_Mage_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Become_Mage_01"); //Ich habe den Hammer.
  AI_Output(self, other, "B5_9000_Mage_Become_Mage_02"); //Gut, du hast bewiesen, dass du würdig bist, mein Schüler zu sein, ich werde dich von nun an die Dunklen Künste lehren.
  AI_Output(self, other, "B5_9000_Mage_Become_Mage_03"); //Achso, behalte den Hammer, er wird dir die Türen zum Rathaus der Stadt öffnen.
  LOG_SetTopicStatus(B5_9000_Mage_Prüfung, LOG_SUCCESS);
  B_GivePlayerXP(500);
  Hammer_holen = FALSE;
};

//Mana lernen
instance B5_9000_Mage_Learn_Mana (C_Info)
{
  npc = B5_9000_Mage;
  condition = B5_9000_Mage_Learn_Mana_Condition;
  information = B5_9000_Mage_Learn_Mana_Info;
  important = FALSE;
  permanent = TRUE;
  nr = 6;
  description = "Zeige mir, wie ich meine magische Kraft steigern kann.";
};

func int B5_9000_Mage_Learn_Mana_Condition ()
{
  if (other.guild == GIL_Bad)
    {return true;};
  return false;
};

func void B5_9000_Mage_Learn_Mana_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Learn_Mana_01"); //Zeige mir, wie ich meine magische Kraft steigern kann.
  Info_ClearChoices(B5_9000_Mage_Learn_Mana);	
  Info_AddChoice(B5_9000_Mage_Learn_Mana, DIALOG_BACK,B5_9000_Mage_Learn_Mana_BACK);		
  Info_AddChoice(B5_9000_Mage_Learn_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), B5_9000_Mage_Learn_Mana_1);
  Info_AddChoice(B5_9000_Mage_Learn_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5), B5_9000_Mage_Learn_Mana_5);
};
FUNC VOID B5_9000_Mage_Learn_Mana_BACK()
{
  Info_ClearChoices   (B5_9000_Mage_Learn_Mana);	
};

FUNC VOID B5_9000_Mage_Learn_Mana_1()
{
  B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_MEGA);
  Info_ClearChoices(B5_9000_Mage_Learn_Mana);	
  Info_AddChoice(B5_9000_Mage_Learn_Mana, DIALOG_BACK,B5_9000_Mage_Learn_Mana_BACK);		
  Info_AddChoice(B5_9000_Mage_Learn_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), B5_9000_Mage_Learn_Mana_1);
  Info_AddChoice(B5_9000_Mage_Learn_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5), B5_9000_Mage_Learn_Mana_5);
};

FUNC VOID B5_9000_Mage_Learn_Mana_5()
{
  B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_MEGA);
  Info_ClearChoices(B5_9000_Mage_Learn_Mana);	
  Info_AddChoice(B5_9000_Mage_Learn_Mana, DIALOG_BACK,B5_9000_Mage_Learn_Mana_BACK);		
  Info_AddChoice(B5_9000_Mage_Learn_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), B5_9000_Mage_Learn_Mana_1);
  Info_AddChoice(B5_9000_Mage_Learn_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX)*5), B5_9000_Mage_Learn_Mana_5);
};

instance B5_9000_Mage_Circle1 (C_INFO)
{
  npc =	B5_9000_Mage;
  nr = 7;
  condition = B5_9000_Mage_Circle1_Condition;
  information =	B5_9000_Mage_Circle1_Info;
  permanent = TRUE;
  description =	"Weise mich in die Geheimnisse der Magie ein (1.Kreis).";
};

func int B5_9000_Mage_Circle1_Condition ()
{	
  if (Npc_KnowsInfo(other, B5_9000_Mage_Become_Mage) && (other.guild == GIL_Bad) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 0))
    {
      return TRUE;
    };
  return FALSE;
};

func void B5_9000_Mage_Circle1_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Circle1_01"); //Weise mich in die Geheimnisse der Magie ein.
  if B_TeachMagicCircle(self, other, 1)
    {
      AI_Output(self, other, "B5_9000_Mage_Circle1_02"); //Der erste Kreis der Magie erlaubt es dir, Runen anzuwenden.
      AI_Output(self, other, "B5_9000_Mage_Circle1_03"); //Runen kannst du entweder von mir erhalten oder finden.
      AI_Output(self, other, "B5_9000_Mage_Circle1_04"); //Komm zu mir, wenn du bereit bist, die Macht in Händen zu halten.
    };
};

//Runen erlernen/erhalten
instance B5_9000_Mage_Runen (C_Info)
{
  npc = B5_9000_Mage;
  nr = 8;
  condition = B5_9000_Mage_Runen_Condition;
  information = B5_9000_Mage_Runen_Info;
  permanent = TRUE;
  description = "Lehre mich die Macht der Runen.";
};

func int B5_9000_Mage_Runen_Condition()
{
  if (other.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Runen_Info()
{
  AI_Output(other, self, "B5_9000_Mage_Runen_01"); //Lehre mich die Macht der Runen.
  Info_ClearChoices(B5_9000_Mage_Runen);
  Info_AddChoice(B5_9000_Mage_Runen, DIALOG_BACK, B5_9000_Mage_Runen_Back);
  if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1) && (Npc_HasItems(other, ItRu_SumGobSkel) == 0))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Goblin Skelett (3 LP)", B5_9000_Mage_GoblinSkeleton);
    };
  if ((Npc_HasItems(other, ItRu_GreenTentacle) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Wurzelschlingen (3 LP)", B5_9000_Mage_GreenTentacle);
    };
  if ((Npc_HasItems(other, ItRu_Blutopfer) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Blutopfer (3 LP)", B5_9000_Mage_Blutopfer);
    };
  if ((Npc_HasItems(other, ItRu_SumSnapper) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Snapper rufen (5 LP)", B5_9000_Mage_Snapper);
    };
  if ((Npc_HasItems(other, ItRu_SuckEnergy) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2) && !(Got_Suck))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Energie entziehen (5 LP)", B5_9000_Mage_Suck);
    };
  if ((Npc_HasItems(other, ItRu_Altern) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Altern (5 LP)", B5_9000_Mage_Altern);
    };
  if ((Npc_HasItems(other, ItRu_SumSkel) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Skelett rufen (10 LP)", B5_9000_Mage_Skeleton);
    };
  if ((Npc_HasItems(other, ItRu_Fear) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Angst (5 LP)", B5_9000_Mage_Fear);
    };
  if ((Npc_HasItems(other, ItRu_BeliarsRage) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3) && !(Got_Zorn))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Beliars Zorn (7 LP)", B5_9000_Mage_BeliarsRage);
    };
  if ((Npc_HasItems(other, ItRu_SummonGuardian) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Steinwächter erschaffen (5 LP)", B5_9000_Mage_Guardian);
    };
  if ((Npc_HasItems(other, ItRu_SumDemon2) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Dämon rufen (20 LP)", B5_9000_Mage_Demon);
    };
  if ((Npc_HasItems(other, ItRu_Giftanschlag) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Giftanschlag (10 LP)", B5_9000_Mage_Giftanschlag);
    };
  if ((Npc_HasItems(other, ItRu_HarmUndead) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && !(Got_Undead))
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Untoter strafen (10 LP)", B5_9000_Mage_Undead);
    };
  if ((Npc_HasItems(other, ItRu_Swarm) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Schwarm beschwören (13 LP)", B5_9000_Mage_Swarm);
    };
  if ((Npc_HasItems(other, ItRu_SummonZombie) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4) && SC_isDarkMage)
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Zombie erwecken (12 LP)", B5_9000_Mage_Zombie);
    };
  if ((Npc_HasItems(other, ItRu_Skull) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5) && SC_isDarkMage)
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Schrei der Toten (20 LP)", B5_9000_Mage_Skull);
    };
  if ((Npc_HasItems(other, ItRu_Wahnsinn) == 0) && (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5) && SC_isDarkMage)
    {
      Info_AddChoice(B5_9000_Mage_Runen, "Wahnsinn (20 LP)", B5_9000_Mage_Wahnsinn);
    };
};

func void B5_9000_Mage_Runen_Back()
{
  Info_ClearChoices(B5_9000_Mage_Runen);
};

func void B5_9000_Mage_NotYet ()
{
  AI_Output(self, other, "B5_9000_Mage_NotYet"); //Du brauchst mehr Erfahrung für diese Rune!
};

func void B5_9000_Mage_Wahnsinn()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_Wahnsinn, 1);
      B_GiveInvItems(self, other, ItRu_Wahnsinn, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Giftanschlag()
{
  if (other.lp >= 10)
    {
      CreateInvItems(self, ItRu_Giftanschlag, 1);
      B_GiveInvItems(self, other, ItRu_Giftanschlag, 1);
      other.lp = other.lp - 10;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Altern()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_Altern, 1);
      B_GiveInvItems(self, other, ItRu_Altern, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Blutopfer()
{
  if (other.lp >= 3)
    {
      CreateInvItems(self, ItRu_Blutopfer, 1);
      B_GiveInvItems(self, other, ItRu_Blutopfer, 1);
      other.lp = other.lp - 3;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Skull()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_Skull, 1);
      B_GiveInvItems(self, other, ItRu_Skull, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Zombie()
{
  if (other.lp >= 12)
    {
      CreateInvItems(self, ItRu_SummonZombie, 1);
      B_GiveInvItems(self, other, ItRu_SummonZombie, 1);
      other.lp = other.lp - 12;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Swarm()
{
  if (other.lp >= 13)
    {
      CreateInvItems(self, ItRu_Swarm, 1);
      B_GiveInvItems(self, other, ItRu_Swarm, 1);
      other.lp = other.lp - 13;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Undead()
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
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Demon()
{
  if (other.lp >= 20)
    {
      CreateInvItems(self, ItRu_SumDemon2, 1);
      B_GiveInvItems(self, other, ItRu_SumDemon2, 1);
      other.lp = other.lp - 20;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_GoblinSkeleton()
{
  if (other.lp >= 3)
    {
      CreateInvItems(self, ItRu_SumGobSkel, 1);
      B_GiveInvItems(self, other, ItRu_SumGobSkel, 1);
      other.lp = other.lp - 3;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Guardian()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_SummonGuardian, 1);
      B_GiveInvItems(self, other, ItRu_SummonGuardian, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_BeliarsRage()
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
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Skeleton()
{
  if (other.lp >= 10)
    {
      CreateInvItems(self, ItRu_SumSkel, 1);
      B_GiveInvItems(self, other, ItRu_SumSkel, 1);
      other.lp = other.lp - 10;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Fear()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_Fear, 1);
      B_GiveInvItems(self, other, ItRu_Fear, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Snapper()
{
  if (other.lp >= 5)
    {
      CreateInvItems(self, ItRu_SumSnapper, 1);
      B_GiveInvItems(self, other, ItRu_SumSnapper, 1);
      other.lp = other.lp - 5;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_Suck()
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
      B5_9000_Mage_NotYet();
    };
};

func void B5_9000_Mage_GreenTentacle()
{
  if (other.lp >= 3)
    {
      CreateInvItems(self, ItRu_GreenTentacle, 1);
      B_GiveInvItems(self, other, ItRu_GreenTentacle, 1); 
      other.lp = other.lp - 3;
    }
  else
    {
      B5_9000_Mage_NotYet();
    };
};

//2.Kapitel
instance B5_9000_Mage_Circle2 (C_Info)
{
  npc = B5_9000_Mage;
  nr = 7;
  condition = B5_9000_Mage_Circle2_Condition;
  information = B5_9000_Mage_Circle2_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Lehre mich den 2.Kreis, Meister.";
};

func int B5_9000_Mage_Circle2_Condition()
{
  if ((other.guild == GIL_Bad) && (Npc_GetTalentSkill(other, Npc_Talent_Mage) == 1))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Circle2_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Circle2_01"); //Lehre mich den 2.Kreis, Meister.
  if (Kapitel >= 2)
    {
      if B_TeachMagicCircle(self, other, 2)
	{
	  AI_Output(self, other, "B5_9000_Mage_Circle2_02"); //So steige den auf, in den 2.Kreis der Magie.
	  AI_Output(self, other, "B5_9000_Mage_Circle2_03"); //Doch bedenke, so wie deine Macht wächst, wächst auch deine Verantwortung.
	  AI_Output(self, other, "B5_9000_Mage_Circle2_04"); //Unsere Aufgabe ist es, das Überleben der Menschheit zu sichern, denke immer daran.
	};
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Circle2_05"); //Du bist noch nicht bereit für dieses Wissen.
    };
};

//3.Kapitel
instance B5_9000_Mage_Circle3 (C_Info)
{
  npc = B5_9000_Mage;
  nr = 7;
  condition = B5_9000_Mage_Circle3_Condition;
  information = B5_9000_Mage_Circle3_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Lehre mich den 3.Kreis, Meister.";
};

func int B5_9000_Mage_Circle3_Condition()
{
  if ((other.guild == GIL_Bad) && (Npc_GetTalentSkill(other, Npc_Talent_Mage) == 2))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Circle3_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Circle3_01"); //Lehre mich den 3.Kreis, Meister.
  if (Kapitel >= 3)
    {
      if B_TeachMagicCircle(self, other, 3)
	{
	  AI_Output(self, other, "B5_9000_Mage_Circle3_02"); //So steige den auf, in den 3.Kreis der Magie.
	  AI_Output(self, other, "B5_9000_Mage_Circle3_03"); //Die Hälfte deines Weges liegt nun hinter dir. Doch die Hälfte liegt auch noch vor dir.
	  AI_Output(self, other, "B5_9000_Mage_Circle3_04"); //Ich denke, dass du nun bald soweit bist, die Dunkle Robe zu tragen.
	};
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Circle3_05"); //Du bist noch nicht bereit für dieses Wissen.
    };
};

//Vor dem 4.Kapitel
instance B5_9000_Mage_Circle4 (C_Info)
{
  npc = B5_9000_Mage;
  nr = 7;
  condition = B5_9000_Mage_Circle4_Condition;
  information = B5_9000_Mage_Circle4_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Lehre mich den 4.Kreis, Meister.";
};

func int B5_9000_Mage_Circle4_Condition()
{
  if ((other.guild == GIL_Bad) && (SC_isDarkMage || SC_isDarkWarrior) && (Npc_GetTalentSkill(other, Npc_Talent_Mage) == 3))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Circle4_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Circle4_01"); //Lehre mich den 4.Kreis, Meister.
  if (MIS_ReadyforChapter4 == TRUE)
    {
      if B_TeachMagicCircle(self, other, 4)
	{
	  AI_Output(self, other, "B5_9000_Mage_Circle4_02"); //So steige den auf, in den 4.Kreis der Magie.
	  AI_Output(self, other, "B5_9000_Mage_Circle4_03"); //Deine Macht ist nun die eines Dunkelmagiers. Deshalb sollst du etwas über uns erfahren!
	  AI_Output(self, other, "B5_9000_Mage_Circle4_04"); //Die Dunkelmagier sind die höchsten Diener Beliars, denke daran, wenn du den Drachen begegnest!
	};
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Circle4_05"); //Du bist noch nicht bereit für dieses Wissen.
    };
};

//Zurück aus dem Minental
instance B5_9000_Mage_BackToLive (C_Info)
{
  npc = B5_9000_Mage;
  nr = 9;
  condition = B5_9000_Mage_BackToLive_Condition;
  information = B5_9000_Mage_BackToLive_Info;
  permanent = FALSE;
  important = FALSE;
  description = "Ich bin zurück!";
};

func int B5_9000_Mage_BackToLive_Condition ()
{
  if (Kapitel >= 3)
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_BackToLive_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_BackToLive_01"); //Ich bin zurück!
  AI_Output(self, other, "B5_9000_Mage_BackToLive_02"); //Lord Helmchen hat mir bereits erzählt, wie die Dinge im Minental stehen.
  if (RavenIsDead == TRUE)
    {
      AI_Output(self, other, "B5_9000_Mage_BackToLive_03"); //Und die Probleme in Jharkendar hast du auch bereits gelöst!
    };
  AI_Output(self, other, "B5_9000_Mage_BackToLive_04"); //Aber während du weg warst, hat sich hier einiges getan!
  AI_Output(other, self, "B5_9000_Mage_BackToLive_05"); //Wenn du die Suchenden meinst, denen bin ich schon begegnet.
  AI_Output(self, other, "B5_9000_Mage_BackToLive_06"); //Halte dich von ihnen fern, sie sind mit großer Macht ausgestattet.
};

//Suchende: Info
instance B5_9000_Mage_Was_Suchende (C_Info)
{
  npc = B5_9000_Mage;
  nr = 9;
  condition = B5_9000_Mage_Was_Suchende_Condition;
  information = B5_9000_Mage_Was_Suchende_Info;
  permanent = FALSE;
  important = FALSE;
  description = "Meister, warum greifen uns die Suchenden an?";
};

func int B5_9000_Mage_Was_Suchende_Condition ()
{
  if ((hero.guild == GIL_Bad) && (Npc_KnowsInfo(other, B5_9000_Mage_BackToLive) == TRUE))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Was_Suchende_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Was_Suchende_01"); //Meister, warum greifen uns die Suchenden an?
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_02"); //Die Suchenden waren einst Menschen, die einem Erz-Dämonen gedient haben.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_03"); //Dies war ihr Verderben, als der Dämon unsere Welt verlassen musste, waren sie führungslos.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_04"); //Ich kann mich erinnern, dass du einen mächtigen Dämon verbannt hast.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_05"); //Vielleicht kanntest du sie sogar einmal.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_06"); //Aber egal: Nachdem ihr Meister verbannt wurde, brauchten sie einen neuen Anführer.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_07"); //Und so, wie die Drachen und Orks von einem mächtigen Wesen verblendet wurden, so verfielen auch sie ihm.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_08"); //Sie alle glauben, Beliars Willen zu erfüllen, in Wirklichkeit handeln sie aber nur als Marionetten ihres Meisters.
  AI_Output(self, other, "B5_9000_Mage_Was_Suchende_09"); //Du musst herausfinden, wer dieser Meister ist, nur so können wir erfolgreich sein.
};

//Ring-Info
instance B5_9000_Mage_Ring_Info (C_Info)
{
  npc = B5_9000_Mage;
  nr = 10;
  condition = B5_9000_Mage_Ring_Info_Condition;
  information = B5_9000_Mage_Ring_Info_Info;
  permanent = FALSE;
  important = FALSE;
  description = "Ich habe hier so einen seltsamen Ring.";
};

func int B5_9000_Mage_Ring_Info_Condition ()
{
  if (Npc_HasItems(other, ItMi_BeliarRing)>0)
    {
      return TRUE;
    };
  return false;
};

func void B5_9000_Mage_Ring_Info_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Ring_Info_01"); //Ich habe hier so einen seltsamen Ring gefunden.
  AI_Output(self, other, "B5_9000_Mage_Ring_Info_02"); //Zeig her!
  B_GiveInvItems(other, self, ItMi_BeliarRing, 1);
  AI_Output(self, other, "B5_9000_Mage_Ring_Info_03"); //(erstaund) Das ... das ist Beliars Wille!
  AI_Output(other, self, "B5_9000_Mage_Ring_Info_04"); //Was, das ich ihn gefunden habe?
  AI_Output(self, other, "B5_9000_Mage_Ring_Info_05"); //Nein, so heißen diese Ringe.
  AI_Output(other, self, "B5_9000_Mage_Ring_Info_06"); //Was, gibt es etwa noch mehr davon?
  if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_NOV) || (hero.guild == GIL_KDF) || (hero.guild == GIL_OUT) || (hero.guild == GIL_BAU) || (hero.guild == GIL_STRF))
    {
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_07"); //Ja, aber ich rate dir, sie nicht anzulegen, Beliars Zorn würde dich treffen, Sklave Innos!
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_08"); //Bring sie zu mir, ich werde sie dir abkaufen.
      B_GiveInvItems(self, other, ItMi_BeliarRing, 1);
    };
  if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
    {
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_09"); //Es gibt noch einige davon, aber du bist ein Söldner, ich will dir ein Vorschlag machen.
      AI_Output(other, self, "B5_9000_Mage_Ring_Info_10"); //Was für einen Vorschlag?
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_11"); //Besorge mir mehr von diesen Ringen, ich werde dich dafür bezahlen.
      B_GiveInvItems(self, other, ItMi_BeliarRing, 1);
    };
  if (hero.guild == GIL_BAD)
    {
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_12"); //Es gab einst viele davon, doch sie gingen im Laufe der Zeit verloren.
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_13"); //(nachdenklich) Mhh, etwas ist seltsam an diesem hier.
      AI_Output(self, other, "B5_9000_Mage_Ring_Info_14"); //Aber ja, seine Macht wurde gebrochen. Ich hätte nicht gedacht, dass dies passieren könne.
    };
};

//Ringe verkaufen
instance B5_9000_Mage_Ringe_verkaufen (C_Info)
{
  npc = B5_9000_Mage;
  nr = 10;
  condition = B5_9000_Mage_Ringe_verkaufen_Condition;
  information = B5_9000_Mage_Ringe_verkaufen_Info;
  permanent = TRUE;
  important = FALSE;
  description = "(Beliars Wille verkaufen)";
};

func int B5_9000_Mage_Ringe_verkaufen_Condition ()
{
  if ((Npc_HasItems(other, ItMi_BeliarRing)>0) && (!(hero.guild == GIL_Bad)))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Ringe_verkaufen_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Ringe_verkaufen_01"); //Hier hast du deine Ringe.
  var int anzahl;
  anzahl = Npc_HasItems(other, ItMi_BeliarRing);
  B_GiveInvItems(other, self, ItMi_BeliarRing, anzahl);
  AI_Output(self, other, "B5_9000_Mage_Ringe_verkaufen_02"); //Ich danke dir, nimm dies zum Dank dafür.
  if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
    {
      B_GiveInvItems(self, other, ItMi_Gold, anzahl*20);
    }
  else
    {
      B_GiveInvItems(self, other, ItMi_Gold, anzahl*10);
    };
};

//Spezial-Info Ring Dunkelmagier
instance B5_9000_Mage_Ringe_Info (C_Info)
{
  npc = B5_9000_Mage;
  nr = 10;
  condition = B5_9000_Mage_Ringe_Info_Condition;
  information = B5_9000_Mage_Ringe_Info_Info;
  permanent = FALSE;
  important = FALSE;
  description = "Meister, kannst du mir mehr über diesen Ring erzählen?";
};

func int B5_9000_Mage_Ringe_Info_Condition ()
{
  if ((hero.guild == GIL_Bad) && (Npc_KnowsInfo(other, B5_9000_Mage_Ring_Info) == TRUE))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Ringe_Info_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Ringe_Info_01"); //Meister, kannst du mir mehr über diesen Ring erzählen?
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_02"); //Der Wille Beliars ist ein mächtiges Artefakt, geschaffen von Beliar selbst um seine Diener zu schützen.
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_03"); //Diese Ringe sind in der Lage die Dunkle Aura der Suchenden aufzusaugen.
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_04"); //Jedoch reicht ihre Macht nicht aus, diese Aura auch zu halten.
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_05"); //Sie sind der Grund dafür, dass es dir überhaupt möglich ist, diese Wesen zu besiegen.
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_06"); //Ich war in der Lage, die Aura von dem Ring zu entfernen.
  Npc_RemoveInvItems(self, ItMi_BeliarRing, 1);
  CreateInvItems(self, ItMi_BeliarRing2, 1);
  B_GiveInvItems(self, other, ItMi_BeliarRing2, 1);
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_07"); //Ich glaube, jetzt ist er in der Lage, den Schatten der Suchenden von deiner Seele zu entfernen.
  AI_Output(other, self, "B5_9000_Mage_Ringe_Info_08"); //Aber dieser Ring ist ja glühent heiß!
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_09"); //Das ist die Macht Beliars, die in ihm ruht, sollte einer dieser Ringe nicht mehr glühen, dann hat er den Schatten eines Suchenden gebannt.
  AI_Output(self, other, "B5_9000_Mage_Ringe_Info_10"); //Bring diese Ringe dann zu mir, damit ich ihnen ihre Kraft wiedergeben kann.
};

//Ringe reinigen
instance B5_9000_Mage_Ringe_reinigen (C_Info)
{
  npc = B5_9000_Mage;
  nr = 10;
  condition = B5_9000_Mage_Ringe_reinigen_Condition;
  information = B5_9000_Mage_Ringe_reinigen_Info;
  permanent = TRUE;
  important = FALSE;
  description = "(Beliars Wille reinigen lassen)";
};

func int B5_9000_Mage_Ringe_reinigen_Condition ()
{
  if (Npc_KnowsInfo(other, B5_9000_Mage_Ringe_Info) == TRUE)
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Ringe_reinigen_Info ()
{
  var int anzahl;
  anzahl = Npc_HasItems(other, ItMi_BeliarRing);
  B_GiveInvItems(other, self, ItMi_BeliarRing, anzahl);
  Npc_RemoveInvItems(self, ItMi_BeliarRing, anzahl);
  CreateInvItems(self, ItMi_BeliarRing2, anzahl);
  AI_Output(self, other, "B5_9000_Mage_Ringe_reinigen_01"); //Beliar, deine Macht fesselt unsere Feinde an diesen Ring.
  AI_Output(self, other, "B5_9000_Mage_Ringe_reinigen_02"); //Doch nun befreie ihn von dem Schatten, der auf ihm lastet.
  B_GiveInvItems(self, other, ItMi_BeliarRing2, anzahl);
};

//Info Dunkelmagier werden
instance B5_9000_Mage_Dark_Info (C_Info)
{
  npc = B5_9000_Mage;
  nr = 11;
  condition = B5_9000_Mage_Dark_Info_Condition;
  information = B5_9000_Mage_Dark_Info_Info;
  permanent = FALSE;
  important = FALSE;
  description = "Wann darf ich die Dunkle Robe tragen?";
};

func int B5_9000_Mage_Dark_Info_Condition ()
{
  if ((Kapitel > 2) && (other.guild == GIL_Bad) && !(Sc_IsDarkMage || SC_isDarkWarrior))
    {
      return true;
    };
};

func void B5_9000_Mage_Dark_Info_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Dark_Info_01"); //Wann darf ich die Dunkle Robe tragen?
  AI_Output(self, other, "B5_9000_Mage_Dark_Info_02"); //Wenn du soweit bist, dazu musst du drei Bedingungen erfüllen und dann eine Prüfung ablegen.
  AI_Output(other, self, "B5_9000_Mage_Dark_Info_03"); //Was sind die Bedingungen?
  AI_Output(self, other, "B5_9000_Mage_Dark_Info_04"); //Erstens: Du musst ein gewisses Mindestmaß an Wissen um die Magie erlangt haben.
  AI_Output(self, other, "B5_9000_Mage_Dark_Info_05"); //Zweitens: Deine Seele muss dir gehören.
  AI_Output(self, other, "B5_9000_Mage_Dark_Info_06"); //Und drittens: Einig wichtige Aufgaben musst du bereits erfüllt haben.
  AI_Output(self, other, "B5_9000_Mage_Dark_Info_07"); //Nur dann werde ich dir verraten, wie du Beliar bitten kannst, dich zu prüfen.
};

//Bin ich soweit?
instance B5_9000_Mage_Conditions (C_Info)
{
  npc = B5_9000_Mage;
  nr = 11;
  condition = B5_9000_Mage_Conditions_Condition;
  information = B5_9000_Mage_Conditions_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Bin ich soweit Prüfung abzulegen?";
};

func int B5_9000_Mage_Conditions_Condition ()
{
  if ((Npc_KnowsInfo(other, B5_9000_Mage_Dark_Info) == TRUE) && (other.guild == GIL_Bad) && !(SC_IsDarkMage || SC_isDarkWarrior))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Conditions_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Conditions_01"); //Bin ich soweit die Prüfung abzulegen?
  AI_Output(self, other, "B5_9000_Mage_Conditions_02"); //Lass mich nachdenken.
  if (Npc_GetTalentSkill(other, Npc_Talent_Mage) >= 3)
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_03"); //Dein Wissen um die Magie sollte ausreichen.
      Dark_Prüfung_Info = TRUE;
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_04"); //Du musst noch mehr über die Magie lernen.
      Dark_Prüfung_Info = FALSE;
    };
  if (SC_IsObsessed == FALSE)
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_05"); //Dein Geist ist rein.
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_06"); //Ein schwarzer Schatten liegt auf deiner Seele, so wird Beliar dich nie als würdig erachten.
      Dark_Prüfung_Info = FALSE;
    };
  if (RavenIsDead == TRUE)
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_07"); //Du hast Raven besiegt und warst im Minental, ich denke, das war Herausforderung genug.
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_08"); //Du hast noch einige Aufgaben vor dir.
      Dark_Prüfung_Info = FALSE;
    };
  if (Dark_Prüfung_Info == TRUE)
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_09"); //Ich denke, du bist bereit, so höre denn die Worte der Prüfung!
      AI_Output(self, other, "B5_9000_Mage_Conditions_10"); //Lass eine Statuette von Beliar anfertigen! Doch wähle das Material sorgfältig, es wird über deine Eignung entscheiden.
      AI_Output(self, other, "B5_9000_Mage_Conditions_11"); //Wenn du die Statuette hast, dann weihe sie an einem Schrein Beliars.
      AI_Output(self, other, "B5_9000_Mage_Conditions_12"); //Zu diesem Zeitpunkt wird sich dein Schicksal entscheiden! Hast du die richtige Wahl getroffen, dann wird die Statuette erfüllt sein von der Macht Beliars.
      AI_Output(self, other, "B5_9000_Mage_Conditions_13"); //Hast du jedoch die falsche Wahl getroffen, so wird Beliars Zorn dich treffen, vielleicht wird er dich sogar töten!
      AI_Output(self, other, "B5_9000_Mage_Conditions_14"); //Mehr werde ich dir dazu nicht sagen, dein Schicksal liegt nun in deiner und Beliars Hand.
      AI_Output(self, other, "B5_9000_Mage_Conditions_15"); //Viel Glück, mein Schüler.
      AI_Output(self, other, "B5_9000_Mage_Conditions_16"); //Und denke daran, dein Geist muss rein sein, wenn du vor Beliar stehst.
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Conditions_17"); //Du bist noch nicht soweit, kehre zu mir zurück, wenn du ALLE Bedingungen erfüllst.
    };
};

//Aufnahme Dunkelmagier
instance B5_9000_Mage_geschafft (C_Info)
{
  npc = B5_9000_Mage;
  nr = 12;
  condition = B5_9000_Mage_geschafft_Condition;
  information = B5_9000_Mage_geschafft_Info;
  permanent = FALSE;
  important = FALSE;
  description = "Ich habe es geschafft! Die Statuette ist Beliar geweiht!";
};

func int B5_9000_Mage_geschafft_Condition ()
{
  if ((Npc_HasItems(other, ItMi_RingBeliarStatue2) > 0) && (other.guild == GIL_Bad) && !(SC_IsDarkMage || SC_IsDarkWarrior))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_geschafft_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_geschafft_01"); //Ich habe es geschafft! Die Statuette ist Beliar geweiht.
  AI_Output(self, other, "B5_9000_Mage_geschafft_02"); //Zeig her.
  B_GiveInvItems(other, self, ItMi_RingBeliarStatue2, 1);
  AI_Output(self, other, "B5_9000_Mage_geschafft_03"); //Tatsächlich, Beliar hat den Bund mit dir geschlossen, hier hast du deine Statuette wieder.
  B_GiveInvItems(self, other, ItMi_RingBeliarStatue2, 1);
  AI_Output(self, other, "B5_9000_Mage_geschafft_06"); //Dann wähle nun den Weg, den du gehen möchtest!
  Info_ClearChoices(B5_9000_Mage_geschafft);
  Info_AddChoice(B5_9000_Mage_geschafft, "Ich wähle den Weg des Kampfes.", B5_9000_Mage_geschafft_Kampf);
  Info_AddChoice(B5_9000_Mage_geschafft, "Ich wähle den Weg der Magie.", B5_9000_Mage_geschafft_Magie);
  
};

func void B5_9000_Mage_geschafft_Text ()
{
  B_GivePlayerXP(500);
  AI_Output(self, other, "B5_9000_Mage_geschafft_05"); //Mögest du dich dieser Ehre als würdig erweisen.
  Info_ClearChoices(B5_9000_Mage_geschafft);
};

func void B5_9000_Mage_geschafft_Schwert ()
{
  SC_IsDarkWarrior = true;

	SummonMax = 5;

  AI_Output(self, other, "B5_9000_Mage_geschafft_10"); //Du erhälst nun eine Waffe Beliars. So Beliar will, wirst du die Wirkung dieser Waffe steigern können.
  AI_Output(self, other, "B5_9000_Mage_geschafft_11"); //Außerdem gibt es noch weitere, magische Waffen Beliars. Verbinde an einem Runentisch 5 Ringe "Beliars Wille" mit der Macht einer Rune oder einem besonderen Stein.
  AI_Output(self, other, "B5_9000_Mage_geschafft_12"); //Du wirst selber merken, welche Runen sich mit den Ringen verbinden lassen.
  CreateInvItems(self, Ore_Armor_M, 1);
  B_GiveInvItems(self, other, Ore_Armor_M, 1);
  AI_EquipArmor(other, Ore_Armor_M);
  AI_Output(self, other, "B5_9000_Mage_geschafft_13"); //Achso, diesen Runenstein hier, wirst du sicher brauchen.
  CreateInvItems(self, ItMi_RuneBlank, 1);
  B_GiveInvItems(self, other, ItMi_RuneBlank, 1);
  AI_Output(other, self, "B5_9000_Mage_geschafft_14"); //Aber Meister, ich habe den Weg des Kampfes gewählt!
  AI_Output(self, other, "B5_9000_Mage_geschafft_15"); //Vertrau mir einfach!
  AI_Output(other, self, "B5_9000_Mage_geschafft_16"); //Ja, Meister.
};

func void B5_9000_Mage_geschafft_Kampf ()
{
  AI_Output(other, self, "B5_9000_Mage_geschafft_07"); //Ich wähle den Weg des Kampfes.
  AI_Output(self, other, "B5_9000_Mage_geschafft_08"); //Willkommen in den Reihen der Dunklen Krieger, möge Beliar deine Klinge leiten.
  AI_Output(self, other, "B5_9000_Mage_geschafft_09"); //Wählst du die Ein- oder Zweihand-Waffe?
  Info_ClearChoices(B5_9000_Mage_geschafft);
  Info_AddChoice(B5_9000_Mage_geschafft, "Zweihandwaffe", B5_9000_Mage_geschafft_Zwei);
  Info_AddChoice(B5_9000_Mage_geschafft, "Einhandwaffe", B5_9000_Mage_geschafft_Eins);
};

func void B5_9000_Mage_geschafft_Eins ()
{
  CreateInvItems(self, ItMw_1H_Dunkelklinge, 1);
  B_GiveInvItems(self, other, ItMw_1H_Dunkelklinge, 1);
  B5_9000_Mage_geschafft_Schwert();
  B5_9000_Mage_geschafft_Text();
};

func void B5_9000_Mage_geschafft_Zwei ()
{
  CreateInvItems(self, ItMw_2H_Dunkelklinge, 1);
  B_GiveInvItems(self, other, ItMw_2H_Dunkelklinge, 1);
  B5_9000_Mage_geschafft_Schwert();
  B5_9000_Mage_geschafft_Text();
};

func void B5_9000_Mage_geschafft_Magie ()
{
  SC_IsDarkMage = true;

	SummonMax = 10;

  AI_Output(self, other, "B5_9000_Mage_geschafft_04"); //Nun denn, willkommen in den Reihen der Dunkelmagier, hiermit verleihe ich dir die Dunkle Robe.
  CreateInvItems(self, ITAR_DarkMage, 1);
  B_GiveInvItems(self, hero, ITAR_DarkMage, 1);
  AI_EquipArmor(hero, ITAR_DarkMage);
  B5_9000_Mage_geschafft_Text();
};

instance B5_9000_Mage_Superwaffe (C_Info)
{
  npc = B5_9000_Mage;
  nr = 13;
  condition = B5_9000_Mage_Superwaffe_Condition;
  information = B5_9000_Mage_Superwaffe_Info;
  description = "Du musst mir helfen.";
};

func int B5_9000_Mage_Superwaffe_Condition ()
{
  if (FinalDragonEquipment_Once && (hero.guild == GIL_BAD))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Superwaffe_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Superwaffe_01"); //Du musst mir helfen!
  AI_Output(self, other, "B5_9000_Mage_Superwaffe_02"); //Worum geht es?
  AI_Output(other, self, "B5_9000_Mage_Superwaffe_03"); //Ich brauche etwas, bevor ich dem Meister der Drachen gegenübertreten kann.
  if (SC_isDarkMage)
    {
      AI_Output(other, self, "B5_9000_Mage_Superwaffe_04"); //Ich habe etwas über die 'Macht der Vereinigung' gelesen.
      B_LogEntry(Almanach_Dunkelmagier, "Narsus weiß auch nicht mehr. Der Meister der Dunkelmagier könnte eventuell Rat wissen.");
    }
  else
    {
      AI_Output(other, self, "B5_9000_Mage_Superwaffe_05"); //Ich habe erfahren, dass es eine Gruppe von Waffen mit dem Namen 'Dämonenschneide' gibt.
      B_LogEntry(Almanach_Dunkelkrieger, "Narsus weiß auch nicht mehr. Der Meister der Dunkelmagier könnte eventuell Rat wissen.");
    };
  AI_Output(self, other, "B5_9000_Mage_Superwaffe_06"); //(nachdenklich) Mhh, darüber weiß ich nichts.
  AI_Output(self, other, "B5_9000_Mage_Superwaffe_07"); //Aber das muss nichts heißen, die größten Geheimnisse unseres Ordens sind nur dem Meister bekannt.
  AI_Output(self, other, "B5_9000_Mage_Superwaffe_08"); //Frag ihn danach, wenn du ihn siehst.
};

instance B5_9000_Mage_Meister (C_Info)
{
  npc = B5_9000_Mage;
  nr = 13;
  condition = B5_9000_Mage_Meister_Condition;
  information = B5_9000_Mage_Meister_Info;
  description = "Wo finde ich den Meister?";
};

func int B5_9000_Mage_Meister_Condition ()
{
  return (Npc_KnowsInfo(other, B5_9000_Mage_Superwaffe));
};

func void B5_9000_Mage_Meister_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Meister_01"); //Wo finde ich den Meister?
  AI_Output(self, other, "B5_9000_Mage_Meister_02"); //Wo der Meister ist, weiß niemand, mit Ausnahme von Beliar und dem Meister selbst natürlich.
  AI_Output(self, other, "B5_9000_Mage_Meister_03"); //Aber für den Notfall gibt es die vier Hüter, die den Meister herbeirufen können.
  if (SC_isDarkMage)
    {
      B_LogEntry(Almanach_Dunkelmagier, "Die vier Hüter können den Meister herbeirufen.");
    }
  else
    {
      B_LogEntry(Almanach_Dunkelkrieger, "Die vier Hüter können den Meister herbeirufen.");
    };
  Log_CreateTopic(B5_9000_Mage_Hüter, LOG_MISSION);
  Log_SetTopicStatus(B5_9000_Mage_Hüter, LOG_RUNNING);
  B_LogEntry(B5_9000_Mage_Hüter, "Ich muss die vier Hüter finden, um den Meister herbeirufen zu können.");
  AI_Output(self, other, "B5_9000_Mage_Meister_04"); //Der Hüter des Krieges ist dort zu finden, wo bald Blut vergossen wird.
  B_LogEntry(B5_9000_Mage_Hüter, "Der Hüter des Krieges ist vermutlich in der Nähe von Kämpfern.");
  AI_Output(self, other, "B5_9000_Mage_Meister_05"); //Der Hüter der Pest hält sich dort auf, wo seine Boten verbreitet werden.
  B_LogEntry(B5_9000_Mage_Hüter, "Wo könnten sich die 'Boten der Pest' verbreiten?");
  AI_Output(self, other, "B5_9000_Mage_Meister_06"); //Der Hüter des Hungers ist der Gast der Ärmsten.
  B_LogEntry(B5_9000_Mage_Hüter, "Hunger ist der Gast der Ärmsten, fällt mir da jemand ein?");
  AI_Output(self, other, "B5_9000_Mage_Meister_07"); //Der Hüter des Todes liebt die Ausdünstungen des Todes und den Geruch von Leichen.
  B_LogEntry(B5_9000_Mage_Hüter, "Der Hüter des Todes scheint sich in der Nähe vieler Leichen aufzuhalten.");
  AI_Output(self, other, "B5_9000_Mage_Meister_08"); //Mehr kann und will ich dir nicht sagen! Nun wird sich zeigen, ob du ein würdiger Diener Beliars bist.
  Wld_InsertNpc (Bad_9007_Pest, "NW_CITY_KANAL_06");
  Wld_InsertNpc (Bad_9008_Hunger, "NW_FARM2_PATH_02");
  Tod_Once = TRUE;
  AI_Output(self, other, "B5_9000_Mage_Meister_09"); //Achso, mir fällt gerade ein: Ich habe gehört, du willst mit dem Schiff der Paladine abhauen.
  AI_Output(self, other, "B5_9000_Mage_Meister_10"); //Na mir soll's recht sein, aber ich werde dich nicht begleiten!
};

//5.Kreis
instance B5_9000_Mage_Circle5 (C_Info)
{
  npc = B5_9000_Mage;
  nr = 7;
  condition = B5_9000_Mage_Circle5_Condition;
  information = B5_9000_Mage_Circle5_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Lehre mich den 5.Kreis, Meister.";
};

func int B5_9000_Mage_Circle5_Condition()
{
  if ((other.guild == GIL_Bad) && (SC_isDarkMage || SC_isDarkWarrior) && (Npc_GetTalentSkill(other, Npc_Talent_Mage) == 4))
    {
      return true;
    };
  return false;
};

func void B5_9000_Mage_Circle5_Info ()
{
  AI_Output(other, self, "B5_9000_Mage_Circle5_01"); //Lehre mich den 5.Kreis, Meister.
  if (Kapitel > 4)
    {
      if B_TeachMagicCircle(self, other, 5)
	{
	  AI_Output(self, other, "B5_9000_Mage_Circle5_02"); //So steige den auf, in den 5.Kreis der Magie.
	  AI_Output(self, other, "B5_9000_Mage_Circle5_03"); //Nunmehr bist du einer der stärksten Diener Beliars. Beweise, dass du dieser Macht würdig bist!
	  AI_Output(self, other, "B5_9000_Mage_Circle5_04"); //Mehr kann ich dir nicht beibringen.
	};
    }
  else
    {
      AI_Output(self, other, "B5_9000_Mage_Circle5_05"); //Du bist noch nicht bereit für dieses Wissen.
    };
};
