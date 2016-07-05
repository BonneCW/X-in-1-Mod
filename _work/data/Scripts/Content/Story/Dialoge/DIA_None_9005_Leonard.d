const string Banditen_Jagd = "Kampf den Banditen";
//Exit
INSTANCE DIA_Leonard_EXIT(C_INFO)
{
	npc			= NONE_9005_Leonard;
	nr			= 999;
	condition	= DIA_Leonard_EXIT_Condition;
	information	= DIA_Leonard_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Leonard_EXIT_Condition()
{
  return true;
};
FUNC VOID DIA_Leonard_EXIT_Info()
{	
  AI_StopProcessInfos(self);
};

//Ich wurde von Banditen überfallen.
instance Leonard_Banditen (C_Info)
{
  npc = None_9005_Leonard;
  nr = 1;
  condition = Leonard_Banditen_Condition;
  information = Leonard_Banditen_Info;
  permanent = false;
  important = false;
  description = "Was sitzt du hier rum?";
};

func int Leonard_Banditen_Condition ()
{
  return true;
};

func void Leonard_Banditen_Info ()
{
  AI_Output(other, self, "Leonard_Banditen_01"); //Was sitzt du hier rum?
  AI_Output(self, other, "Leonard_Banditen_02"); //Ich war gerade auf dem Weg von Akils Hof hier zur Taverne.
  AI_Output(self, other, "Leonard_Banditen_03"); //Aber unterwegs bin ich bin von Banditen überfallen worden.
  AI_Output(self, other, "Leonard_Banditen_04"); //Naja, zumindest hab ich's überlebt. Diese Mistkerle vergreifen sich immer an schwachen und Wehrlosen.
  AI_Output(self, other, "Leonard_Banditen_05"); //Ich würde mir wünschen, das die mal auf Einen treffen, der die so richtig fertig macht!
  AI_Output(other, self, "Leonard_Banditen_06"); //Wo treiben sich die Banditen denn rum?
  AI_Output(self, other, "Leonard_Banditen_07"); //Wenn du diesem Weg hier folgst, dann kommst du unter einer Brücke durch, oben, auf dieser Brücke, haben diese Mistkerle ihr Lager.
  AI_Output(self, other, "Leonard_Banditen_08"); //Das schlimmste ist, das ich 5 Flaschen Schnaps bei hatte, die ich Orlan versprochen habe.
  Log_CreateTopic(Banditen_Jagd, LOG_MISSION);
  Log_SetTopicStatus(Banditen_Jagd, LOG_RUNNING);
  B_LogEntry(Banditen_Jagd, "Der Bauer Leonard wurde von Banditen überfallen. Das Lager dieser Typen ist an der Brücke zwischen Akils Hof und der Taverne. Er hatte 5 Flaschen Schnaps dabei.");
  Wld_InsertNpc(BDT_9004_Bandit, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
  Wld_InsertNpc(BDT_9004_Bandit, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
  Wld_InsertNpc(BDT_9004_Bandit, "NW_FARM2_TO_TAVERN_RANGERBANDITS_01");
  Wld_InsertNpc(BDT_9004_Bandit, "NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
  Wld_InsertNpc(BDT_9004_Bandit, "NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
};

//Ich hab deinen Schnaps.
instance Leonard_Schnaps (C_Info)
{
  npc = None_9005_Leonard;
  nr = 1;
  condition = Leonard_Schnaps_Condition;
  information = Leonard_Schnaps_Info;
  permanent = false;
  important = false;
  description = "Ich hab deinen Schnaps gerettet.";
};

func int Leonard_Schnaps_Condition ()
{
  if (Npc_HasItems(other, ItMi_Schwarzgebrannter) == 5)
    {
      return true;
    };
  return false;
};

func void Leonard_Schnaps_Info ()
{
  AI_Output(other, self, "Leonard_Schnaps_01"); //Ich hab deinen Schnaps.
  AI_Output(self, other, "Leonard_Schnaps_02"); //Tatsächlich? Zeig her!
  B_GiveInvItems(other, self, ItMi_Schwarzgebrannter, 5);
  AI_Output(self, other, "Leonard_Schnaps_03"); //Das ist wirklich meiner! Ich werde ihn gleich zu Orlan bringen, ich danke dir.
  B_GivePlayerXP(XP_Ambient);
  Log_SetTopicStatus(Banditen_Jagd, LOG_SUCCESS);
};
  
