//*****
// Exit
//*****

instance Bad_Krieg_Exit (C_Info)
{
  npc = Bad_9006_Krieg;
  nr = 999;
  condition = Bad_Exit_Condition;
  information = Bad_Exit_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

func int Bad_Exit_Condition()
{
  return true;
};

func void Bad_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

instance Bad_Pest_Exit (C_Info)
{
  npc = Bad_9007_Pest;
  nr = 999;
  condition = Bad_Exit_Condition;
  information = Bad_Exit_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

instance Bad_Hunger_Exit (C_Info)
{
  npc = Bad_9008_Hunger;
  nr = 999;
  condition = Bad_Exit_Condition;
  information = Bad_Exit_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

instance Bad_Tod_Exit (C_Info)
{
  npc = Bad_9009_Tod;
  nr = 999;
  condition = Bad_Exit_Condition;
  information = Bad_Exit_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

//******
// Infos
//******

instance Bad_Krieg_Speak (C_Info)
{
  npc = Bad_9006_Krieg;
  nr = 1;
  condition = Bad_Condition;
  information = Bad_Krieg_Info;
  description = "Hüter des Krieges, ich brauche eure Hilfe!";
};

func int Bad_Condition ()
{
  if ((Npc_KnowsInfo(other, Bad_Who)) && (hero.guild == GIL_BAD))
    {
      return true;
    };
  return false;
};

func void Bad_Steinkreis ()
{
  if (kennt_Steinkreis)
    {
      AI_Output(other, self, "Bad_Steinkreis_01"); //Geht zum Steinkreis bei Lobarts Hof, in der Nähe der Stadt.
      AI_Output(self, other, "Bad_Steinkreis_02"); //Nun gut, ich hoffe du weißt, was du tust, wenn nicht, wird dich der Meister töten.
    }
  else
    {
      AI_Output(self, other, "Bad_Steinkreis_03"); //Mhh, wir benötigen für das Ritual einen Steinkreis und alle vier Brüder.
      AI_Output(self, other, "Bad_Steinkreis_04"); //Kennst du die Postition eines Steinkreises?
    };
};

func void Bad_Krieg_Info ()
{
  AI_Output(other, self, "Bad_Krieg_01"); //Hüter des Krieges, ich brauche eure Hilfe!
  AI_Output(self, other, "Bad_Krieg_02"); //Wie kann ich dir helfen? Soll ich dem Sturm der Schlacht entfesseln und die Paladine aus der Burg hinwegfegen?
  AI_Output(other, self, "Bad_Krieg_03"); //Nein, ihr müsst mir helfen den Meister zu rufen.
  Krieg_wechselt = TRUE;
  Bad_Steinkreis ();
};

instance Bad_Pest_Speak (C_Info)
{
  npc = Bad_9007_Pest;
  nr = 1;
  condition = Bad_Condition;
  information = Bad_Pest_Info;
  description = "Hüter der Pest, ich brauche eure Hilfe!";
};

func void Bad_Pest_Info ()
{
  AI_Output(other, self, "Bad_Pest_01"); //Hüter der Pest, ich brauche eure Hilfe!
  AI_Output(self, other, "Bad_Pest_02"); //Du brauchst meine Hilfe? Soll ich diese Stadt zu einem der friedvollsten Orte der Welt machen?
  AI_Output(other, self, "Bad_Pest_03"); //Nein, ihr müsst mir helfen den Meister zu rufen.
  Bad_Steinkreis ();
};

instance Bad_Hunger_Speak (C_Info)
{
  npc = Bad_9008_Hunger;
  nr = 1;
  condition = Bad_Condition;
  information = Bad_Hunger_Info;
  description = "Hüter des Hungers, ich brauche eure Hilfe!";
};

func void Bad_Hunger_Info ()
{
  AI_Output(other, self, "Bad_Hunger_01"); //Hüter des Hungers, ich brauche eure Hilfe!
  AI_Output(self, other, "Bad_Hunger_02"); //Fühlst du schon, wie sich das Gespenst der Not auf dich herabsenkt?
  AI_Output(other, self, "Bad_Hunger_03"); //Nein, ihr müsst mir helfen den Meister zu rufen.
  Bad_Steinkreis ();
};

instance Bad_Tod_Speak (C_Info)
{
  npc = Bad_9009_Tod;
  nr = 1;
  condition = Bad_Condition;
  information = Bad_Tod_Info;
  description = "Hüter des Todes, ich brauche eure Hilfe!";
};

func void Bad_Tod_Info ()
{
  AI_Output(other, self, "Bad_Tod_01"); //Hüter des Todes, ich brauche eure Hilfe!
  AI_Output(self, other, "Bad_Tod_02"); //Soll ich dich erlösen von deinen Qualen?
  AI_Output(other, self, "Bad_Tod_03"); //Nein, ihr müsst mir helfen den Meister zu rufen.
  Tod_wechselt = TRUE;
  Bad_Steinkreis ();
};

//**********
// LAP rufen
//**********

instance Bad_Ruf_LAP (C_Info)
{
  npc = Bad_9006_Krieg;
  condition = Bad_Ruf_LAP_Condition;
  information = Bad_Ruf_LAP_Info;
  important = TRUE;
};

func int Bad_Ruf_LAP_Condition ()
{
  if (Npc_KnowsInfo(other, Bad_Krieg_Speak) && Npc_KnowsInfo(other, Bad_Tod_Speak) && Npc_KnowsInfo(other, Bad_Pest_Speak) && Npc_KnowsInfo(other, Bad_Hunger_Speak) && (CurrentLevel == NEWWORLD_ZEN))
    {
      return true;
    };
  return false;
};

func void Bad_Ruf_LAP_Info ()
{
  AI_Output(self, other, "Bad_Ruf_LAP_01"); //Gut das du kommst, wir wollten gerade mit dem Ritual beginnen.
  Bad_Ritual = 1;
  AI_StopProcessInfos(self);
};

//************
// LAP Success
//************

instance Bad_LAP_Da (C_Info)
{
  npc = Bad_9009_Tod;
  condition = BAD_LAP_Da_Condition;
  information = Bad_LAP_Da_Info;
  important = TRUE;
};

func int Bad_LAP_Da_Condition ()
{
  if (Bad_Ritual == 5)
    {
      return true;
    };
  return false;
};

func void Bad_LAP_Da_Info ()
{
  AI_Output(self, other, "Bad_LAP_DA_01"); //Die Beschwörung ist abgeschlossen. Der Meister ist irgendwo hier auf der Insel.
  AI_Output(other, self, "Bad_LAP_DA_02"); //Geht es vielleicht genauer?
  AI_Output(self, other, "Bad_LAP_DA_03"); //Der Meister liebt es, die Magier des Feuers zu ärgern, wenn ich raten sollte, würde ich sagen, dass er sich im Kloster aufhält.
  Bad_Ritual = 6;
  Wld_InsertNpc(Bad_9010_LAP, "NW_MONASTERY_CHURCH_03");
  LOG_SetTopicStatus(B5_9000_Mage_Hüter, LOG_SUCCESS);
  var int XP;
  XP = XP_Ambient * 4;
  B_GivePlayerXP(XP);
};

