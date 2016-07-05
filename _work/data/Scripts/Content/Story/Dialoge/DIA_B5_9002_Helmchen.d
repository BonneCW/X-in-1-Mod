var int Höhle_betreten;
// ENDE
instance B5_9002_Helmchen_Exit (C_Info)
{
  npc = B5_9002_Helmchen;
  condition = B5_9002_Helmchen_Exit_Condition;
  information = B5_9002_Helmchen_Exit_Info;
  important = FALSE;
  permanent = TRUE;
  description = "ENDE";
  nr = 999;
};

FUNC int B5_9002_Helmchen_Exit_Condition ()
{
  return TRUE;
};

FUNC void B5_9002_Helmchen_Exit_Info ()
{
  AI_StopProcessInfos(self);
};
// Hab ich dich
instance B5_9002_Helmchen_Found (C_Info)
{
  npc = B5_9002_Helmchen;
  condition = B5_9002_Helmchen_Found_Condition;
  information = B5_9002_Helmchen_Found_Info;
  important = TRUE;
  permanent = FALSE;
  description = "";
  nr = 1;
};

FUNC int B5_9002_Helmchen_Found_Condition ()
{
  return Npc_KnowsInfo(hero, B5_9000_Mage_Search2);
};

FUNC void B5_9002_Helmchen_Found_Info ()
{
  Höhle_betreten = FALSE;
  AI_Output(self, other, "B5_9002_Helmchen_Found_01"); //Was in Innos Namen machst du hier drausen?
  AI_Output(other, self, "B5_9002_Helmchen_Found_02"); //Das selbe könnte ich dich fragen.
  AI_Output(self, other, "B5_9002_Helmchen_Found_03"); //Ich bin Lord Helmchen, Paladin und Treuer Streiter Innos.
  AI_Output(other, self, "B5_9002_Helmchen_Found_04"); //Dann bist du genau der den ich suche. Narsus schickt mich, du sollst dich mit ihm an der großen Feldkreuzung treffen.
  AI_Output(self, other, "B5_9002_Helmchen_Found_05"); //Mein alter Freund Narsus ruft? Dann werde ich so schnell wie möglich aufbrechen, aber zuerst muss ich in diese Höhle.
  AI_Output(other, self, "B5_9002_Helmchen_Found_06"); //Was willst du da drin?
  AI_Output(self, other, "B5_9002_Helmchen_Found_07"); //Ich vermute, dass dort etwas drin ist, was ich schon lange suche, willst du mich begleiten?
  Info_ClearChoices(B5_9002_Helmchen_Found);
  B_LogEntry(B5_9000_Mage_Search, "Ich habe Lord Helmchen gefunden, er will aber vorher in eine Höhle, ich habe das Gefühl, dass da was drin ist, was ich garnicht sehen will.");
  Info_AddChoice(B5_9002_Helmchen_Found, "Nein danke, ich bin doch nicht lebensmüde!", B5_9002_Helmchen_Found_NO);
  Info_AddChoice(B5_9002_Helmchen_Found, "OK, lass uns rein gehen!", B5_9002_Helmchen_Found_YES);
};

FUNC void B5_9002_Helmchen_Found_NO ()
{
  AI_Output(other, self, "B5_9002_Helmchen_Found_08"); //Nein danke, ich bin doch nicht lebensmüde!
  AI_Output(self, other, "B5_9002_Helmchen_Found_09"); //Ach, hat der Kleine Angst? Naja, falls du es dir nochmal überlegst, warte ich hier auf dich.
  Info_ClearChoices(B5_9002_Helmchen_Found);
  Höhle_betreten = TRUE;
};

FUNC void B5_9002_Helmchen_Found_Yes ()
{
  AI_Output(other, self, "B5_9002_Helmchen_Found_10"); //OK, lass uns reingehen!
  AI_Output(self, other, "B5_9002_Helmchen_Found_11"); //Dann folge mir!
  AI_StopProcessInfos(self);
  self.aivar[AIV_PARTYMEMBER] = TRUE;
  Npc_ExchangeRoutine(self, "Guide");
  Höhle_betreten = FALSE;
  Wld_InsertNpc(Helmchen_Demon, "FP_ROAM_XARDAS_CAVE_09");
  Wld_InsertItem(ItWr_Regenerate, "FP_ROAM_XARDAS_CAVE_12");
};

//Doch in die Höhle
instance B5_9002_Helmchen_Höhle (C_Info)
{
  npc = B5_9002_Helmchen;
  condition = B5_9002_Helmchen_Höhle_Condition;
  information = B5_9002_Helmchen_Höhle_Info;
  important = FALSE;
  permanent = TRUE;
  description = "OK, lass uns deine Höhle besuchen!";
  nr = 1;
};

FUNC int B5_9002_Helmchen_Höhle_Condition ()
{
  return Höhle_betreten;
};

FUNC void B5_9002_Helmchen_Höhle_Info ()
{
  AI_Output(other, self, "B5_9002_Helmchen_Found_12"); //OK, lass uns deine Höhle besuchen!
  AI_Output(self, other, "B5_9002_Helmchen_Found_13"); //Na dann, ...
  B5_9002_Helmchen_Found_Yes();
};

//Dämon getötet
instance B5_9002_Helmchen_Demon_Dead (C_Info)
{
  npc = B5_9002_Helmchen;
  condition = B5_9002_Helmchen_Demon_Dead_Condition;
  information = B5_9002_Helmchen_Demon_Dead_Info;
  important = TRUE;
  permanent = FALSE;
  description = "";
};

FUNC int B5_9002_Helmchen_Demon_Dead_Condition ()
{
  if (Npc_KnowsInfo(hero, B5_9002_Helmchen_Found) && Npc_IsDead(Helmchen_Demon))
    {
      return TRUE;
    };
  return FALSE;
};

FUNC void B5_9002_Helmchen_Demon_Dead_Info ()
{
  AI_Output(self, other, "B5_9002_Helmchen_Demon_Dead_01"); //Endlich hab ich ihn erwischt.
  AI_Output(other, self, "B5_9002_Helmchen_Demon_Dead_02"); //Wir sind nur hier um diesen Dämon zu töten?
  AI_Output(self, other, "B5_9002_Helmchen_Demon_Dead_03"); //Ja, ich habe ihn jetzt seit 3 Jahren gejagt, nun ist es vorbei.
  AI_Output(other, self, "B5_9002_Helmchen_Demon_Dead_04"); //Dann gehst du jetzt ...
  AI_Output(self, other, "B5_9002_Helmchen_Demon_Dead_05"); //... zu Narsus? Ja, dass werde ich tun.
  B_LogEntry(B5_9000_Mage_Search, "Lord Helmchen ist unterwegs zu Narsus.");
  AI_StopProcessInfos(self);
  self.aivar[AIV_PARTYMEMBER] = FALSE;
  Npc_ExchangeRoutine(self, "Smalltalk");
};

//Zweihandkampf lernen
instance B5_9002_Helmchen_Lern (C_Info)
{
  npc = B5_9002_Helmchen;
  nr = 2;
  condition = B5_9002_Helmchen_Lern_Condition;
  information = B5_9002_Helmchen_Lern_Info;
  permanent = TRUE;
  important = FALSE;
  description = "Bring mir bei, wie man mit diesen RIESEN Schwerten umgeht.";
};

func int B5_9002_Helmchen_Lern_Condition () 
{
  if (hero.guild == GIL_Bad)
    {
      return true;
    };
  return false;
};

func void B5_9002_Helmchen_Lern_Info ()
{
  AI_Output(other, self, "B5_9002_Helmchen_Lern_01"); //Bring mir bei, wie man mit diesen RIESEN Schwerten umgeht.
  AI_Output(self, other, "B5_9002_Helmchen_Lern_02"); //Gut, lass uns mit deinem Training beginnen.
  Info_ClearChoices(B5_9002_Helmchen_Lern);
  Info_AddChoice(B5_9002_Helmchen_Lern, DIALOG_BACK, B5_9002_Helmchen_Lern_Back);
  Info_AddChoice(B5_9002_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), B5_9002_Helmchen_Lern_1);
  Info_AddChoice(B5_9002_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), B5_9002_Helmchen_Lern_5);
};

func void B5_9002_Helmchen_Lern_Back ()
{
  Info_ClearChoices(B5_9002_Helmchen_Lern);
};

func void B5_9002_Helmchen_Lern_1 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100);
  if (other.HitChance[NPC_TALENT_2H] >= 100)
    {
      AI_Output(self,other,"B5_9002_Helmchen_Lern_03"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
      AI_Output(self,other,"B5_9002_Helmchen_Lern_04"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_9002_Helmchen_Lern);
  Info_AddChoice(B5_9002_Helmchen_Lern, DIALOG_BACK, B5_9002_Helmchen_Lern_Back);
  Info_AddChoice(B5_9002_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), B5_9002_Helmchen_Lern_1);
  Info_AddChoice(B5_9002_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), B5_9002_Helmchen_Lern_5);
};

func void B5_9002_Helmchen_Lern_5 ()
{
  B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100);
  if (other.HitChance[NPC_TALENT_2H] >= 100)
    {
      AI_Output(self,other,"B5_9002_Helmchen_Lern_05"); //Du bist jetzt ein wahrer Meister im beidhändigen Kampf.
      AI_Output(self,other,"B5_9002_Helmchen_Lern_06"); //Du brauchst keinen Lehrer mehr.
    };
  Info_ClearChoices(B5_9002_Helmchen_Lern);
  Info_AddChoice(B5_9002_Helmchen_Lern, DIALOG_BACK, B5_9002_Helmchen_Lern_Back);
  Info_AddChoice(B5_9002_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), B5_9002_Helmchen_Lern_1);
  Info_AddChoice(B5_9002_Helmchen_Lern, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), B5_9002_Helmchen_Lern_5);
};

//Stärke lernen
instance B5_9002_Helmchen_Lern2 (C_Info)
{
	npc = B5_9002_Helmchen;
	nr = 2;
	condition = B5_9002_Helmchen_Lern2_Condition;
	information = B5_9002_Helmchen_Lern2_Info;
	permanent = TRUE;
	important = FALSE;
	description = "Zeig mir, wie ich stärker werde.";
};

func int B5_9002_Helmchen_Lern2_Condition () 
{
	if (hero.guild == GIL_Bad)
	{
		return true;
	};
};

func void B5_9002_Helmchen_Lern2_Info ()
{
	AI_Output(other, self, "B5_9002_Helmchen_Lern2_01"); //Zeig mir, wie ich stärker werde.
	AI_Output(self, other, "B5_9002_Helmchen_Lern2_02"); //Gut, lass uns mit deinem Training beginnen.

	Info_ClearChoices(B5_9002_Helmchen_Lern2);

	Info_AddChoice(B5_9002_Helmchen_Lern2, DIALOG_BACK, B5_9002_Helmchen_Lern2_Back);
  	Info_AddChoice(B5_9002_Helmchen_Lern2, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)), B5_9002_Helmchen_Lern2_1);
  	Info_AddChoice(B5_9002_Helmchen_Lern2, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5), B5_9002_Helmchen_Lern2_5);
};

func void B5_9002_Helmchen_Lern2_Back ()
{
	Info_ClearChoices(B5_9002_Helmchen_Lern2);
};

func void B5_9002_Helmchen_Lern2_1 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);

	Info_ClearChoices(B5_9002_Helmchen_Lern2);

	Info_AddChoice(B5_9002_Helmchen_Lern2, DIALOG_BACK, B5_9002_Helmchen_Lern2_Back);
  	Info_AddChoice(B5_9002_Helmchen_Lern2, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)), B5_9002_Helmchen_Lern2_1);
  	Info_AddChoice(B5_9002_Helmchen_Lern2, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5), B5_9002_Helmchen_Lern2_5);
};

func void B5_9002_Helmchen_Lern2_5 ()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);

	Info_ClearChoices(B5_9002_Helmchen_Lern2);

	Info_AddChoice(B5_9002_Helmchen_Lern2, DIALOG_BACK, B5_9002_Helmchen_Lern2_Back);
  	Info_AddChoice(B5_9002_Helmchen_Lern2, B_BuildLearnString(PRINT_LearnSTR1	, B_GetLearnCostAttribute(other, ATR_STRENGTH)), B5_9002_Helmchen_Lern2_1);
  	Info_AddChoice(B5_9002_Helmchen_Lern2, B_BuildLearnString(PRINT_LearnSTR5	, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5), B5_9002_Helmchen_Lern2_5);
};
