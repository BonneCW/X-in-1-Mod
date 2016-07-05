const string Muds_Auftrag = "Muds Thron";
const string Statthalter = "Das Ende des Statthalters";
//Exit
instance Mud_Exit (C_Info)
{
  npc = Vlk_574_Mud;
  nr = 999;
  condition = Mud_Exit_Condition;
  information = Mud_Exit_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

func int Mud_Exit_Condition()
{
  return true;
};

func void Mud_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Gesicht
instance Mud_Gesicht (C_Info)
{
  npc = Vlk_574_Mud;
  nr = 1;
  condition = Mud_Gesicht_Condition;
  information = Mud_Gesicht_Info;
  description = "Was ist denn mit dir passiert?";
};

func int Mud_Gesicht_Condition ()
{
  return true;
};

func void Mud_Gesicht_Info ()
{
  AI_Output(other, self, "Mud_Gesicht_01"); //Was ist denn mit dir passiert?
  AI_Output(self, other, "Mud_Gesicht_02"); //Du meinst sicher das Gesicht, die letzten Wochen im Minental haben mich deutlich gezeichnet.
  AI_Output(self, other, "Mud_Gesicht_03"); //Wie du sicher noch weißt, war ich nie ein guter Kämpfer, aber trotzdem musste ich mich mit ein paar Viechern prügeln, hauptsächlich Molerats und ein paar Scavanger.
  AI_Output(self, other, "Mud_Gesicht_04"); //Nachdem die Barriere zusammengebrochen ist, habe ich mich versteckt, und das war richtig, wenn du mal die ganzen Wesen hier siehst, die Orks sind noch die nettesten. 
  AI_Output(self, other, "Mud_Gesicht_05"); //Aber ich habe gehört, dass die Paladine hier in der Burg sind, deshalb bin ich gekommen, um mich unter ihren Schutz zu stellen.
  AI_Output(self, other, "Mud_Gesicht_06"); //Eines Nachts habe ich mich durch die Reihen der Orks geschlichen, und habe es bis hier gebracht.
  AI_Output(self, other, "Mud_Gesicht_07"); //Aber was habe ich davon? Die Paladine hier stehen kurz vor einer Niederlage und ihr Kommandant weigert sich, meinen Anspruch auf den Platz der Erzbarone anzuerkennen.
  Info_ClearChoices(Mud_Gesicht);
  Info_AddChoice(Mud_Gesicht, "Du bist einer der Erzbarone?", Mud_Gesicht_Erzbaron1);
  Info_AddChoice(Mud_Gesicht, "Warum bist du nicht mit den anderen aus dem Tal geflohen?", Mud_Gesicht_Flucht1);
};

func void Mud_Gesicht_Erzbaron_Text()
{
  AI_Output(other, self, "Mud_Gesicht_08"); //Du bist einer der Erzbarone?
  AI_Output(other, self, "Mud_Gesicht_09"); //Und ich dachte nur Gomez und Raven währen die Herren des Alten Lagers gewesen!
  AI_Output(self, other, "Mud_Gesicht_10"); //Gomez und Raven nannten sich Erzbarone, saßen auf dem Thron der selben und wagten es, die Rüstungen der Barone anzulegen.
  AI_Output(self, other, "Mud_Gesicht_11"); //Aber Fakt ist: Mit den Adligen, die sich die Erzbarone nannten, weil sie die Herrschaft über das magische Erz besaßen, hatten die beiden nichts gemeinsam!
  AI_Output(self, other, "Mud_Gesicht_12"); //Die Linie der wahren Erzbarone besteht nur noch aus einer Person: Mir.
  Info_ClearChoices(Mud_Gesicht);
};

func void Mud_Gesicht_Erzbaron1 ()
{
  Mud_Gesicht_Erzbaron_Text();
  Info_AddChoice(Mud_Gesicht, "Und warum sitzt du dann nicht auf dem Thron?", Mud_Gesicht_Thron1);
  Info_AddChoice(Mud_Gesicht, "Warum bist du nicht mit den anderen aus dem Tal geflohen?", Mud_Gesicht_Flucht2);
};

func void Mud_Gesicht_Erzbaron2 ()
{
  Mud_Gesicht_Erzbaron_Text();
  Info_AddChoice(Mud_Gesicht, "Und warum sitzt du dann nicht auf dem Thron?", Mud_Gesicht_Thron2);
  Info_AddChoice(Mud_Gesicht, "Was muss ich tun, um dein Nachfolger zu werden?", Mud_Gesicht_Auftrag2);
};

func void Mud_Gesicht_Erzbaron3 ()
{
  Mud_Gesicht_Erzbaron_Text();
  Info_AddChoice(Mud_Gesicht, "Und warum sitzt du dann nicht auf dem Thron?", Mud_Gesicht_Thron3);
};

func void Mud_Gesicht_Flucht_Text ()
{
  AI_Output(other, self, "Mud_Gesicht_13"); //Warum bist du nicht mit den anderen aus dem Tal geflohen?
  AI_Output(self, other, "Mud_Gesicht_14"); //Der Platz meiner Familie ist hier, so ist es seit hunderten von Jahren gewesen und so wird es immer sein, bis mein Geschlecht ausstirbt.
  AI_Output(other, self, "Mud_Gesicht_15"); //Solange wird das nicht mehr dauern, wenn du hier bleibst!
  AI_Output(self, other, "Mud_Gesicht_16"); //Das mag sein, aber als amtierender Erzbaron, habe ich das Recht, meinen Nachfolger selbst zu bestimmen.
  AI_Output(self, other, "Mud_Gesicht_17"); //Du hast mich, als die Barriere noch stand, besser behandelt, als die meisten andern, deswegen sollst du einer der Kandidaten sein.
  Info_ClearChoices(Mud_Gesicht);
};

func void Mud_Gesicht_Flucht1()
{
  Mud_Gesicht_Flucht_Text();
  Info_AddChoice(Mud_Gesicht, "Was muss ich tun, um dein Nachfolger zu werden?", Mud_Gesicht_Auftrag1);
  Info_AddChoice(Mud_Gesicht, "Du bist einer der Erzbarone?", Mud_Gesicht_Erzbaron2);
};

func void Mud_Gesicht_Flucht2()
{
  Mud_Gesicht_Flucht_Text();
  Info_AddChoice(Mud_Gesicht, "Und warum sitzt du dann nicht auf dem Thron?", Mud_Gesicht_Thron2);
  Info_AddChoice(Mud_Gesicht, "Was muss ich tun, um dein Nachfolger zu werden?", Mud_Gesicht_Auftrag2);
};

func void Mud_Gesicht_Flucht3()
{
  Mud_Gesicht_Flucht_Text();
  Info_AddChoice(Mud_Gesicht, "Was muss ich tun, um dein Nachfolger zu werden?", Mud_Gesicht_Auftrag3);
};

func void Mud_Gesicht_Thron_Text()
{
  AI_Output(other, self, "Mud_Gesicht_18"); //Und warum sitzt du dann nicht auf dem Thron?
  AI_Output(self, other, "Mud_Gesicht_19"); //Dieser verdammte Kommandant Garond erkennt meinen Anspruch nicht an!
  Info_ClearChoices(Mud_Gesicht);
};

func void Mud_Gesicht_Thron1 ()
{
  Mud_Gesicht_Thron_Text();
  Info_AddChoice(Mud_Gesicht, "Warum bist du nicht mit den anderen aus dem Tal geflohen?", Mud_Gesicht_Flucht3);
};

func void Mud_Gesicht_Thron2 ()
{
  Mud_Gesicht_Thron_Text();
  Info_AddChoice(Mud_Gesicht, "Was muss ich tun, um dein Nachfolger zu werden?", Mud_Gesicht_Auftrag3);
};

func void Mud_Gesicht_Thron3 ()
{
  Mud_Gesicht_Thron_Text();
};

func void Mud_Gesicht_Auftrag_Text ()
{
  AI_Output(other, self, "Mud_Gesicht_20"); //Was muss ich tun, um dein Nachfolger zu werden?
  AI_Output(self, other, "Mud_Gesicht_21"); //Geh zur alten Felsenfestung, dort wirst du erfahren, was du zu tun hast.
  Log_CreateTopic(Muds_Auftrag, LOG_MISSION);
  Log_SetTopicStatus(Muds_Auftrag, LOG_RUNNING);
  B_LogEntry(Muds_Auftrag, "Ich soll für Mud zur alten Hügelfestung gehen.");
  Info_ClearChoices(Mud_Gesicht);
};

func void Mud_Gesicht_Auftrag1 ()
{
  Mud_Gesicht_Auftrag_Text();
  Info_AddChoice(Mud_Gesicht, "Du bist einer der Erzbarone?", Mud_Gesicht_Erzbaron3);
};

func void Mud_Gesicht_Auftrag2 ()
{
  Mud_Gesicht_Auftrag_Text();
  Info_AddChoice(Mud_Gesicht, "Und warum sitzt du dann nicht auf dem Thron?", Mud_Gesicht_Thron3);
};

func void Mud_Gesicht_Auftrag3 ()
{
  Mud_Gesicht_Auftrag_Text();
};

//Hallo
instance Mud_Hallo (C_Info)
{
  npc = Vlk_574_Mud;
  condition = Mud_Hallo_Condition;
  information = Mud_Hallo_Info;
  important = TRUE;
};

func int Mud_Hallo_Condition ()
{
  return true;
};

func void Mud_Hallo_Info()
{
  AI_Output(self, other, "Mud_Hallo_01"); //Hallo du, ich kenne dich doch!
  Info_ClearChoices(Mud_Hallo);
  Info_AddChoice(Mud_Hallo, "Hallo Mud!", Mud_Hallo_Mud);
  Info_AddChoice(Mud_Hallo, "Sorry, aber ich kann mich kaum erinnern!", Mud_Hallo_Who);
};

func void Mud_Hallo_Mud ()
{
  AI_Output(other, self, "Mud_Hallo_02"); //Hallo Mud!
  AI_Output(self, other, "Mud_Hallo_03"); //Ah, ich sehe du hast mich nicht vergessen!
  Info_ClearChoices(Mud_Hallo);
};

func void Mud_Hallo_Who ()
{
  AI_Output(other, self, "Mud_Hallo_04"); //Sorry, aber ich kann mich kaum an die erinnern!
  AI_Output(self, other, "Mud_Hallo_05"); //Macht nichts, wir hatten ja kaum miteinander zu tun.
  Info_ClearChoices(Mud_Hallo);
};

//Mud an der Hügelfestung
instance Mud_Was_hier (C_Info)
{
  npc = VLK_574_Mud;
  nr = 1;
  condition = Mud_Was_Hier_Condition;
  information = Mud_Was_Hier_Info;
  description = "Was machst du den hier drausen?";
};

func int Mud_Was_Hier_Condition ()
{
  if ((Npc_KnowsInfo(other, Mud_Gesicht) && (Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN")<1000)))
    {
      return true;
    };
  return false;
};

func void Mud_Was_Hier_Info ()
{
  AI_Output(other, self, "Mud_Was_Hier_01"); //Was machst du den hier drausen?
  AI_Output(self, other, "Mud_Was_Hier_02"); //Die eigentliche Frage lautet doch: Wie kommst du den hier her, oder?
  AI_Output(other, self, "Mud_Was_Hier_03"); //Ja, eigentlich schon.
  AI_Output(self, other, "Mud_Was_Hier_04"); //Ich lebe hier seit meiner Kindheit, und ich musst jahrelang vor allerlei Gesindel fliehen, da werden mich doch so ein paar Orks nicht stören.
  AI_Output(self, other, "Mud_Was_Hier_05"); //Aber warum bin ich hier? Diese Hügelfestung war einst der Sitz meiner Familie.
  AI_Output(self, other, "Mud_Was_Hier_06"); //Dort drin ist eine alte Urkunde, die muss ich unbedingt haben!
  AI_Output(self, other, "Mud_Was_Hier_07"); //Ich habe eine Idee, du gehst doch sowieso da rein, dann kannst du mir ds bisschen Papier doch mitbringen.
  B_LogEntry(Muds_Auftrag, "Ich soll für Mud ein alte Urkunde aus der Hügelfestung holen.");
};

//Ich hab deine Urkunde
instance Mud_Urkunde (C_Info)
{
  npc = VLK_574_Mud;
  nr = 1;
  condition = Mud_Urkunde_Condition;
  information = Mud_Urkunde_Info;
  description = "Hier hast du deine Urkunde.";
};

func int Mud_Urkunde_Condition ()
{
  if (Npc_HasItems(other, ItWr_Urkunde) > 0)
    {
      return true;
    };
  return false;
};

func void Mud_Urkunde_Info ()
{
  AI_Output(other, self, "Mud_Urkunde_01"); //Hier hast du deine Urkunde.
  B_GiveInvItems(other, self, ItWr_Urkunde, 1);
  B_UseFakeScroll();
  AI_Output(self, other, "Mud_Urkunde_02"); //Das ist sie! Jetzt wird Garond meinen Anspruch anerkennen müssen!
  AI_Output(self, other, "Mud_Urkunde_03"); //Ich werde jetzt zurück gehen und Garon den Thron abnehmen!
  B_GivePlayerXP(XP_Ambient);
  AI_StopProcessInfos(self);
  Npc_ExchangeRoutine(self, "SitThrone");
  Npc_ExchangeRoutine(Pal_250_Garond, "MudIsBack");
  Log_SetTopicStatus(Muds_Auftrag, LOG_SUCCESS);
};

//Ich will Statthalter werden
instance Mud_Statthalter (C_Info)
{
  npc = VLK_574_Mud;
  nr = 1;
  condition = Mud_Statthalter_Condition;
  information = Mud_Statthalter_Info;
  description = "Und? Wie sitzt es sich so auf dem Thron?";
};

func int Mud_Statthalter_Condition ()
{
  if ((Npc_GetDistToWP(self,"OC_EBR_HALL_THRONE")<1000) && (Npc_KnowsInfo(other, Mud_Urkunde) == TRUE))
    {
      return true;
    };
  return false;
};

func void Mud_Statthalter_Info ()
{
  AI_Output(other, self, "Mud_Statthalter_01"); //Und? Wie sitzt es sich so auf dem Thron?
  AI_Output(self, other, "Mud_Statthalter_02"); //Ich warte jetzt schon Jahre auf diesen Moment, danke, dass du mir geholfen hast.
  AI_Output(self, other, "Mud_Statthalter_03"); //Aber da wäre noch eine Aufgabe für dich.
  AI_Output(other, self, "Mud_Statthalter_04"); //Was soll ich für euch tun, (ironisch) eure Lordschaft?
  AI_Output(self, other, "Mud_Statthalter_05"); //(lacht) Nein, du sollst nicht mein persänlicher Diener werden, ich bin bislang alleine zurecht gekommen und werde es auch weiter tun.
  AI_Output(self, other, "Mud_Statthalter_06"); //Ich möchte, dass du den Posten des Statthalters in Khorinis übernimmst.
  AI_Output(other, self, "Mud_Statthalter_07"); //(erstaund) Die Stadt untersteht doch momentan den Paladinen.
  AI_Output(self, other, "Mud_Statthalter_08"); //Ja, im Moment. Aber die Paladine werden nicht immer da sein, dann schlägt deine Stunde.
  AI_Output(self, other, "Mud_Statthalter_09"); //Achso, lass das Schreiben besser von Garond unterschreiben, sonst glaubt dir möglicherweise niemand in der Stadt.
  CreateInvItems(self, ItWr_Stadthalter, 1);
  B_GiveInvItems(self, other, ItWr_Stadthalter, 1);
  Log_CreateTopic(Statthalter, LOG_MISSION);
  Log_SetTopicStatus(Statthalter, LOG_RUNNING);
  B_LogEntry(Statthalter, "Ich soll in Muds Namen über Khorinis herrschen. Vorher sollte aber Garond das Schreiben unterzeichnen.");
};

instance Mud_Verhandlungen (C_Info)
{
  npc = VLK_574_Mud;
  nr = 2;
  condition = Mud_Verhandlungen_Condition;
  information = Mud_Verhandlungen_Info;
  description = "Weißt du was über einen orkischen Anführer?";
};

func int Mud_Verhandlungen_Condition ()
{
  return Npc_KnowsInfo(other, Bad_LAP_Schiff);
};

func void Mud_Verhandlungen_Info ()
{
  AI_Output(other, self, "Mud_Verhandlungen_01"); //Weißt du was über einen orkischen Anführer?
  AI_Output(self, other, "Mud_Verhandlungen_02"); //Du bist jetzt schon der Zweite der fragt! Ich hab schon zu Garond gesagt, dass ich nichts weiß!
  AI_Output(self, other, "Mud_Verhandlungen_03"); //Und jetzt lass mich in Ruhe!
  AI_StopProcessInfos(self);
  Npc_SetRefuseTalk(self, 60);
};
