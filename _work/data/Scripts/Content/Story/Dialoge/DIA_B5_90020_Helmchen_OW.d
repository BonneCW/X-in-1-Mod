// EXIT
instance B5_90020_Helmchen_Exit (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  nr = 99;
  condition = B5_90020_Helmchen_Exit_Condition;
  information = B5_90020_Helmchen_Exit_Info;
  permanent = TRUE;
  important = FALSE;
  description = DIALOG_ENDE;
};

func int B5_90020_Helmchen_Exit_Condition ()
{
  return true;
};

func void B5_90020_Helmchen_Exit_Info ()
{
  AI_StopProcessInfos(self);
};

//Wie kommt Helmchen hierher?
instance B5_90020_Helmchen_Hier (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  condition = B5_90020_Helmchen_Hier_Condition;
  information = B5_90020_Helmchen_Hier_Info;
  permanent = FALSE;
  important = TRUE;
};

func int B5_90020_Helmchen_Hier_Condition ()
{
  return true;
};

func void B5_90020_Helmchen_Hier_Info ()
{
  AI_Output(other, self, "B5_90020_Helmchen_Hier_01"); //Was machst du denn hier?
  AI_Output(self, other, "B5_90020_Helmchen_Hier_02"); //Hab ich's doch gewußt, du kommst hier lang.
  AI_Output(other, self, "B5_90020_Helmchen_Hier_03"); //Lord Hagen schickt mich, ich soll Beweise für die Anwesenheit der Drachen besorgen.
  AI_Output(self, other, "B5_90020_Helmchen_Hier_04"); //Dieser arogante Schnösel, er hat gar keine Ahnung. Er sollte mal nachdenken, was die Orks hier machen, aber nein ...
  AI_Output(other, self, "B5_90020_Helmchen_Hier_05"); //Du magst ihn nicht besonders, stimmts?
  AI_Output(self, other, "B5_90020_Helmchen_Hier_06"); //Ist ja auch egal, wichtig ist erstmal nur eins!
  AI_Output(self, other, "B5_90020_Helmchen_Hier_07"); //Die Burg wird von Orks belagert, ich bin hier um dich zu warnen.
  AI_Output(self, other, "B5_90020_Helmchen_Hier_08"); //Aber Jergan hier kann dir bestimmt ein paar Tipps geben, wie du trotzdem in einem Stück hinkommst.
};

//Vor Xardas Altem Dämonenturm
instance B5_90020_Helmchen_DT (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  nr = 1;
  condition = B5_90020_Helmchen_DT_Condition;
  information = B5_90020_Helmchen_DT_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Man trifft dich hier überall, oder?";
};

func int B5_90020_Helmchen_DT_Condition ()
{
  if ((!Npc_IsDead(Old_DT_Demon)) && (Kapitel < 3) && Npc_KnowsInfo(other, DIA_Garond_NeedProof))
    {
      return true;
    };
  return false;
};

func void B5_90020_Helmchen_DT_Info ()
{
  AI_Output(other, self, "B5_90020_Helmchen_DT_01"); //Man trifft dich hier überall, oder?
  AI_Output(self, other, "B5_90020_Helmchen_DT_02"); //Oh, ich habe es mir nur zur Aufgabe gemacht, soviele Dämonen wie möglich aus unserer Welt zu verbannen.
  AI_Output(self, other, "B5_90020_Helmchen_DT_03"); //Und, so es Innos Wille ist, habe ich noch genügend Zeit für ALLE Dämonen.
  AI_Output(other, self, "B5_90020_Helmchen_DT_04"); //Wie meinst du das?
  AI_Output(self, other, "B5_90020_Helmchen_DT_05"); //Hat Narsus dir nichts erklärt? Die Götter haben den drei ständigen Mitgliedern des Bunds der Fünf ein SEHR langes Leben gegeben.
  AI_Output(other, self, "B5_90020_Helmchen_DT_06"); //Und obwohl man dann Zeit hat, und das Leben genießen könnte, jagst du Dämonen? Naja, wem's Spaß macht.
  AI_Output(self, other, "B5_90020_Helmchen_DT_07"); //(verärgert) Mach dich nur lustig, hier ist wieder so einer von diesen verfluchten Orten, ich könnte jetzt da rein gehen und den Dämon platt machen, wenn ich wollte.
  Info_ClearChoices(B5_90020_Helmchen_DT);
  Info_AddChoice(B5_90020_Helmchen_DT, "Ich glaub dir ja!", B5_90020_Helmchen_DT_No);
  Info_AddChoice(B5_90020_Helmchen_DT, "Das musst du mir beweisen!", B5_90020_Helmchen_DT_Yes);
};

func void B5_90020_Helmchen_DT_No ()
{
  AI_Output(other, self, "B5_90020_Helmchen_DT_08"); //Ich glaub dir ja!
  AI_Output(self, other, "B5_90020_Helmchen_DT_09"); //Innos verleid mir die Kraft dazu, in seinem Namen werde ich seine Feinde besiegen.
  Info_ClearChoices(B5_90020_Helmchen_DT);
};

func void B5_90020_Helmchen_DT_Yes ()
{
  AI_Output(other, self, "B5_90020_Helmchen_DT_10"); //Das musst du mir erstmal beweisen!
  AI_Output(self, other, "B5_90020_Helmchen_DT_11"); //Jetzt nicht, ich warte hier auf ein Zeichen Innos.
  AI_StopProcessInfos(self);
  Wld_AssignRoomToGuild("DT1", GIL_None); //Damit Helmchen den Turm betritt
  Wld_AssignRoomToGuild("DT2", GIL_None);
  self.aivar[AIV_PARTYMEMBER] = true;
};

//Der Dämon ist tot
instance B5_90020_Helmchen_DT2 (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  condition = B5_90020_Helmchen_DT2_Condition;
  information = B5_90020_Helmchen_DT2_Info;
  permanent = FALSE;
  important = TRUE;
};

func int B5_90020_Helmchen_DT2_Condition ()
{
  if (Npc_IsDead(Old_DT_Demon) && (self.aivar[AIV_PARTYMEMBER] == true))
    {
      return true;
    };
  return false;
};

func void B5_90020_Helmchen_DT2_Info ()
{
  AI_Output(self, other, "B5_90020_Helmchen_DT2_01"); //Du hast ihn erwischt?
  AI_Output(other, self, "B5_90020_Helmchen_DT2_02"); //Ja, sollte ich ihn warten lassen, bis du dein Zeichen gesehen hast?
  AI_Output(self, other, "B5_90020_Helmchen_DT2_03"); //Nur tote Dämonen sind gute Dämonen.
  if (other.guild == GIL_Bad)
    {
      AI_Output(self, other, "B5_90020_Helmchen_DT2_04"); //Du bist wahrhaft würdig Narsus Schüler zu sein.
    };
  B_GivePlayerXP(XP_Ambient);
  AI_StopProcessInfos(self);
  self.aivar[AIV_PARTYMEMBER] = false;
};

//Zweihandkampf lernen
instance B5_90020_Helmchen_Lern (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  nr = 2;
  condition = B5_90020_Helmchen_Lern_Condition;
  information = B5_90020_Helmchen_Lern_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Bring mir bei, wie man mit diesen RIESEN Schwerten umgeht.";
};

func int B5_90020_Helmchen_Lern_Condition () 
{
  if (hero.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void B5_90020_Helmchen_Lern_Info ()
{
  AI_Output(other, self, "B5_90020_Helmchen_Lern_01"); //Bring mir bei, wie man mit diesen RIESEN Schwerten umgeht.
  AI_Output(self, other, "B5_90020_Helmchen_Lern_02"); //Gut, lass uns mit deinem Training beginnen.
  Info_ClearChoices(B5_90020_Helmchen_Lern);
  Info_AddChoice(B5_90020_Helmchen_Lern, DIALOG_BACK, B5_90020_Helmchen_Lern_Back);
  Info_AddChoice(B5_90020_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), B5_90020_Helmchen_Lern_1);
  Info_AddChoice(B5_90020_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), B5_90020_Helmchen_Lern_5);
};

func void B5_90020_Helmchen_Lern_Back ()
{
  Info_ClearChoices(B5_90020_Helmchen_Lern);
};

func void B5_90020_Helmchen_Lern_1 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
  if (other.HitChance[NPC_TALENT_2H] >= 100)
    {
      AI_Output(self,other,"B5_90020_Helmchen_Lern_03"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
      AI_Output(self,other,"B5_90020_Helmchen_Lern_04"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_90020_Helmchen_Lern);
  Info_AddChoice(B5_90020_Helmchen_Lern, DIALOG_BACK, B5_90020_Helmchen_Lern_Back);
  Info_AddChoice(B5_90020_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), B5_90020_Helmchen_Lern_1);
  Info_AddChoice(B5_90020_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), B5_90020_Helmchen_Lern_5);
};

func void B5_90020_Helmchen_Lern_5 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
  if (other.HitChance[NPC_TALENT_2H] >= 100)
    {
      AI_Output(self,other,"B5_90020_Helmchen_Lern_05"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
      AI_Output(self,other,"B5_90020_Helmchen_Lern_06"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_90020_Helmchen_Lern);
  Info_AddChoice(B5_90020_Helmchen_Lern, DIALOG_BACK, B5_90020_Helmchen_Lern_Back);
  Info_AddChoice(B5_90020_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), B5_90020_Helmchen_Lern_1);
  Info_AddChoice(B5_90020_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), B5_90020_Helmchen_Lern_5);
};

//Mission Lord Helmchen (4.Kapitel)
const string Locate_DJG = "Aufklärung bei den Drachenjägern";
instance Helmchen_Locate_DJG (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  nr = 3;
  condition = Helmchen_Locate_DJG_Condition;
  information = Helmchen_Locate_DJG_Info;
  description = "Hast du noch irgendwas zu tun für mich?";
};

func int Helmchen_Locate_DJG_Condition ()
{
  if (Kapitel >= 4)
    {
      return true;
    };
  return false;
};

func void Helmchen_Locate_DJG_Info ()
{
  AI_Output(other, self, "Helmchen_Locate_DJG_01"); //Hast du noch irgendwas zu tun für mich?
  AI_Output(self, other, "Helmchen_Locate_DJG_02"); //Wieso? Langweilst du dich?
  if (MIS_AllDragonsDead == TRUE)
    {
      AI_Output(self, other, "Helmchen_Locate_DJG_03"); //Jetzt wo die Drachen tot sind, ist dir wohl langweilig?
    }
  else
    {
      AI_Output(self, other, "Helmchen_Locate_DJG_04"); //Die paar Drachen reichen dir wohl nicht als Aufgabe?
    };
  AI_Output(self, other, "Helmchen_Locate_DJG_05"); //Naja, mir solls recht sein, ich habe da tatsächlich etwas zu tun für dich!
  AI_Output(self, other, "Helmchen_Locate_DJG_06"); //Ich traue diesen Drachenjägern nicht, einige treiben sich da drausen im Minental rum!
  AI_Output(self, other, "Helmchen_Locate_DJG_07"); //Sammle soviele Informationen wie möglich, ich würde es ja selber machen, aber ich muss meinen Brüdern hier helfen.
  Log_CreateTopic(Locate_DJG, LOG_MISSION);
  Log_SetTopicStatus(Locate_DJG, LOG_RUNNING);
  B_LogEntry(Locate_DJG, "Lord Helmchen möchte soviel wie möglich über die Drachenjäger im Minental wissen!");
};

//Drachenjäger Infos
var int Helmchen_DJG_Infos;
var int Helmchen_DJG_Silvio;
var int Helmchen_DJG_Rod;
var int Helmchen_DJG_Biff;
var int Helmchen_DJG_Gorn;

instance Helmchen_DJG (C_Info)
{
  npc = B5_90020_Helmchen_OW;
  nr = 3;
  condition = Helmchen_DJG_Condition;
  information = Helmchen_DJG_Info;
  permanent = TRUE;
  description = "Wegen der Drachenjäger ...";
};

func int Helmchen_DJG_Condition ()
{
  if ((Npc_KnowsInfo(other, Helmchen_Locate_DJG) == TRUE) && (Helmchen_DJG_Infos < 4))
    {
      return true;
    };
  return false;
};

func void Helmchen_DJG_Info ()
{
  AI_Output(other, self, "Helmchen_DJG_01"); //Wegen der Drachenjäger ...
  AI_Output(self, other, "Helmchen_DJG_02"); //Ja? Was hast du herausgefunden?
  var int Neue_Infos;
  Neue_Infos = 0;
  if ((Npc_KnowsInfo(other, DIA_SylvioDJG_HelloAgain)) && (Helmchen_DJG_Silvio == 0))
    {
      AI_Output(other, self, "Helmchen_DJG_03"); //Der Drachjäger Silvio ist mit seinem Kumpel Bullco in der Eisregion, dise Dumpfbacken hoffen, den Eisdrachen erledigen zu können.
      AI_Output(self, other, "Helmchen_DJG_04"); //Diese Dummköpfe, man kann die Drachen nur mit der Hilfe Innos töten!
      Neue_Infos = Neue_Infos + 1;
      Helmchen_DJG_Silvio = 1;
    };
  if (((Npc_KnowsInfo(other, DIA_RodDJG_HALLO)) || (Npc_KnowsInfo(other, DIA_Cipher_HALLO))) && (Helmchen_DJG_Rod == 0))
    {
      AI_Output(other, self, "Helmchen_DJG_05"); //Rod und Cipher sind am Sumpf.
      if (Npc_IsDead(SwampDragon))
	{
	  AI_Output(other, self, "Helmchen_DJG_06"); //Und der Drache da ist tot!
	};
      AI_Output(self, other, "Helmchen_DJG_07"); //Hoffen wir, dass die beiden den Spaß überleben.
      Neue_Infos = Neue_Infos + 1;
      Helmchen_DJG_Rod = 1;
    };
  if ((Npc_KnowsInfo(other, DIA_Biff_WASHIERIMTAL)) && (Helmchen_DJG_Biff == 0))
    {
      AI_Output(other, self, "Helmchen_DJG_08"); //Biff sucht hier im Tal Ruhm und Reichtum.
      AI_Output(self, other, "Helmchen_DJG_09"); //Und das glaubt er hier zu finden?
      AI_Output(other, self, "Helmchen_DJG_10"); //Ich werd mit ihm zusammenarbeiten.
      AI_Output(self, other, "Helmchen_DJG_11"); //Ich würde ihn trotzdem im Auge behalten und ihm nie den Rücken zu wenden.
      Neue_Infos = Neue_Infos + 1;
      Helmchen_DJG_Biff = 1;
    };
  if ((Npc_KnowsInfo(other, DIA_GornDJG_HALLO)) && (Helmchen_DJG_Gorn == 0))
    {
      AI_Output(other, self, "Helmchen_DJG_12"); //Gorn bewacht den Orkzaun, für den Fall dass die Orks ihn abreißen.
      AI_Output(self, other, "Helmchen_DJG_13"); //Wenigstens einer macht sich nützlich.
      if (other.guild == GIL_DJG)
	{
	  AI_Output(self, other, "Helmchen_DJG_14"); //Außer dir natürlich! (lacht)
	};
      Neue_Infos = Neue_Infos + 1;
      Helmchen_DJG_Gorn = 1;
    };
  if (Neue_Infos > 0)
    {
      AI_Output(other, self, "Helmchen_DJG_15"); //Das war auch schon alles was ich dir momentan erzählen kann.
      B_GivePlayerXP(Neue_Infos * XP_Ambient);
      Helmchen_DJG_Infos = Helmchen_DJG_Infos + Neue_Infos;
      if (Helmchen_DJG_Infos = 4)
	{
	  AI_Output(self, other, "Helmchen_DJG_16"); //Danke, das reicht für's erste, ich denke ich weiß jetzt, was sie vor haben.
	  B_GivePlayerXP(XP_Ambient);
	  Log_SetTopicStatus(Locate_DJG, LOG_SUCCESS);
	}
      else
	{
	  AI_Output(self, other, "Helmchen_DJG_17"); //Danke für den Zwischenbericht, halte weiterhin beide Augen offen. Aber sei vorsichtig.
	};
    }
  else
    {
      AI_Output(other, self, "Helmchen_DJG_18"); //Noch nichts neues.
      AI_Output(self, other, "Helmchen_DJG_19"); //Dann such weiter, irgendwo treiben die sich rum.
    };
};
