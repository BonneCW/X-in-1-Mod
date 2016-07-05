// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Larius_EXIT(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 999;
	condition	= DIA_Larius_EXIT_Condition;
	information	= DIA_Larius_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Hello 
// ************************************************************

INSTANCE DIA_Larius_Hello(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 1;
	condition	= DIA_Larius_Hello_Condition;
	information	= DIA_Larius_Hello_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Larius_Hello_Condition()
{
	if (Npc_IsInState (self ,ZS_Talk))
	{ 
		return TRUE;
	};	
};

FUNC VOID DIA_Larius_Hello_Info()
{	
	AI_Output (self,other,"DIA_Larius_Hello_01_00"); //Was hast du hier verloren? Wenn du was willst, lass dir einen Termin geben.

};

// ************************************************************
// 			  		Wer bist du		    
// ************************************************************

INSTANCE DIA_Larius_WhoAreYou(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_WhoAreYou_Condition;
	information	= DIA_Larius_WhoAreYou_Info;
	permanent	= FALSE;
	description	= "Wer bist du?";
};                       

FUNC INT DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_WhoAreYou_Info()
{	
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_00"); //Wer bist du?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_01"); //Ich bin Larius, der hiesige Statthalter.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_02"); //Auch wenn es im Moment nicht so aussehen mag, bin ich der mächtigste Mann dieser Stadt.
	AI_Output (other,self ,"DIA_Larius_WhoAreYou_15_03"); //Dann bist du hier also verantwortlich?
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_04"); //Ich ... nun ... zurzeit sind mir die Hände gebunden.
	AI_Output (self ,other,"DIA_Larius_WhoAreYou_01_05"); //Dieser Lord Hagen hat hier das Kommando, jedenfalls solange er noch in der Stadt ist.
		
};

// ************************************************************
// 			  		Disturb		    
// ************************************************************

INSTANCE DIA_Larius_Disturb(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 3;
	condition	= DIA_Larius_Disturb_Condition;
	information	= DIA_Larius_Disturb_Info;
	permanent	= TRUE;
	description	= "Ich wollte nicht stören.";
};                       

FUNC INT DIA_Larius_Disturb_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_Disturb_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Disturb_15_00"); //Ich wollte nicht stören.
	AI_Output (self ,other,"DIA_Larius_Disturb_01_01"); //Das ist dir gründlich misslungen. Also verschwinde!
};

// ************************************************************
// 			  		Wie siehts aus?	    
// ************************************************************

INSTANCE DIA_Larius_DieLage(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_DieLage_Condition;
	information	= DIA_Larius_DieLage_Info;
	permanent	= TRUE;
	description	= "Wie sieht's aus?";
};                       

FUNC INT DIA_Larius_DieLage_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Larius_DieLage_Info()
{	
	AI_Output (other,self ,"DIA_Larius_DieLage_15_00"); //Wie sieht's aus?
	AI_Output (self ,other,"DIA_Larius_DieLage_01_01"); //Was geht das dich an? Solange die Paladine in der Stadt sind, kümmert sich Lord Hagen um alle Belange, die die Stadt betreffen.
};


// ************************************************************
// 		Richterueberfall    
// ************************************************************

INSTANCE DIA_Larius_Richterueberfall(C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 2;
	condition	= DIA_Larius_Richterueberfall_Condition;
	information	= DIA_Larius_Richterueberfall_Info;

	description	= "Der Richter hat dich von Banditen überfallen lassen.";
};                       

FUNC INT DIA_Larius_Richterueberfall_Condition()
{
	if (SCKnowsRichterKomproBrief == TRUE)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Larius_Richterueberfall_Info()
{	
	AI_Output (other,self ,"DIA_Larius_Richterueberfall_15_00"); //Der Richter hat dich von Banditen überfallen lassen. Ich kann es beweisen.
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_01"); //Erzähl nicht so einen Unsinn, oder willst du, dass ich dich in Ketten legen lasse?
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_02"); //Auch wenn du ein Streiter Innos' bist ...
		};
		if (hero.guild == GIL_KDF)
		{
			AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_03"); //Auch wenn du ein geweihter Magier bist ...
		};
	AI_Output (self ,other,"DIA_Larius_Richterueberfall_01_04"); //Mein Wort hat noch immer Gewicht hier in dieser Stadt. Wage es nie wieder, den ehrenwerten Namen des Richters zu beschmutzen!
	B_GivePlayerXP (XP_Ambient);
	AI_StopProcessInfos (self);
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Larius_PICKPOCKET (C_INFO)
{
	npc			= VLK_400_Larius;
	nr			= 900;
	condition	= DIA_Larius_PICKPOCKET_Condition;
	information	= DIA_Larius_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Larius_PICKPOCKET_Condition()
{
	C_Beklauen (35, 120);
};
 
FUNC VOID DIA_Larius_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Larius_PICKPOCKET);
	Info_AddChoice		(DIA_Larius_PICKPOCKET, DIALOG_BACK 		,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Larius_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Larius_PICKPOCKET);
};
	
func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Larius_PICKPOCKET);
};


//Den Statthalter absetzen
instance Larius_Statthalter (C_Info)
{
  npc = VLK_400_Larius;
  nr = 4;
  condition = Larius_Statthalter_Condition;
  information = Larius_Statthalter_Info;
  description = "Ich bin gekommen, um deinen Platz einzunehmen!";
};

func int Larius_Statthalter_Condition ()
{
  if (Npc_HasItems(other, ItWr_Stadthalter2) > 0)
    {
      return true;
    };
  return false;
};

func void Larius_Statthalter_Info ()
{
  AI_Output(other, self, "Larius_Statthalter_01"); //Ich bin gekommen, um deinen Platz einzunehmen!
  AI_Output(self, other, "Larius_Statthalter_02"); //(verärgert) Das ich nicht lache! Und wer gibt dir das Recht dazu?
  AI_Output(other, self, "Larius_Statthalter_03"); //Der amtierende Erzbaron!
  AI_Output(self, other, "Larius_Statthalter_04"); //Khorinis hat schon lange keinen Erzbaron mehr, seit der alte Garingor gestorben ist.
  AI_Output(other, self, "Larius_Statthalter_05"); //Du irrst, ich habe hier ein Schreiben, das von einem Paladin beglaubigt wurde.
  AI_Output(self, other, "Larius_Statthalter_06"); //(verblüfft) Zeig her!
  B_GiveInvItems(other, self, ItWr_Stadthalter2, 1);
  B_UseFakeScroll();
  AI_Output(self, other, "Larius_Statthalter_07"); //Das ist eine Fälschung! Ich werde diesem Schreiben keinen Glauben schenken, hier hast du deinen Wisch wieder, und nun verschwinde!
  B_GiveInvItems(self, other, ItWr_Stadthalter2, 1);
  B_LogEntry(Statthalter, "Larius glaubt mir nicht, vielleicht kann mir Lord Hagen helfen.");
  B_GivePlayerXP(XP_Ambient);
  AI_StopProcessInfos(self);
};

//Hau ab
var int Larius_abgesetzt;
instance Larius_Hau_ab (C_Info)
{
  npc = VLK_400_Larius;
  condition = Larius_Hau_ab_Condition;
  information = Larius_Hau_ab_Info;
  permanent = TRUE;
  important = TRUE;
};

func int Larius_Hau_ab_Condition ()
{
  if ((Npc_KnowsInfo(other, Larius_Statthalter) == TRUE) && (Larius_abgesetzt == FALSE) && hero.aivar[AIV_INVINCIBLE])
    {
      return true;
    };
  return false;
};

func void Larius_Hau_ab_Info ()
{
  AI_Output(self, other, "Larius_Hau_ab_01"); //Ich habe gesagt du sollst verschwinden!
  Info_ClearChoices(Larius_Hau_ab);
  Info_AddChoice(Larius_Hau_ab, DIALOG_ENDE, DIA_Larius_EXIT_Info);
  if (Npc_KnowsInfo(other, Hagen_Statthalter) == TRUE)
    {
      Info_AddChoice(Larius_Hau_ab, "Lord Hagen sagt ...", Larius_Hau_ab_Geh);
    };
};

func void Larius_Hau_ab_Geh ()
{
  AI_Output(other, self, "Larius_Hau_ab_02"); //Lord Hagen sagt, wenn du nicht freiwillig gehst, dann lässt er dich rausprügeln.
  AI_Output(self, other, "Larius_Hau_ab_03"); //(aufgeregt) Was? Das würde er nicht wagen!
  AI_Output(other, self, "Larius_Hau_ab_04"); //Wir können es ja ausprobieren, ich würde gern sehen, wie die Paladine hier reinkommen und ...
  AI_Output(self, other, "Larius_Hau_ab_05"); //Schon gut, schon gut! Ich geh ja schon!
  AI_Output(other, self, "Larius_Hau_ab_06"); //Ach, und vergiss nicht mir die Kleidung des Statthalters auszuhändigen (grinst).
  AI_Output(self, other, "Larius_Hau_ab_07"); //Du bist nichts als ein mießer Dieb, aber ich muss mich der Gewalt der Paladine beugen.
  CreateInvItems(self, ITAR_VLK_H, 1);
  AI_EquipArmor(self, ITAR_VLK_H);
  B_GiveInvItems(self, other, ITAR_Governor, 1);
  Log_SetTopicStatus(Statthalter, LOG_SUCCESS);
  B_GivePlayerXP(XP_Ambient);
  Larius_abgesetzt = TRUE;
  AI_StopProcessInfos(self);
  Npc_ExchangeRoutine(self, "abgesetzt");
};

