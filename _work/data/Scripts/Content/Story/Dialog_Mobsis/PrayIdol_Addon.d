var int PrayIdolDay;
var int RecievedMoney;
var int GivenHitpoints;
var int GivenMana;
const int BeliarsDispo = 10000; //Joly: Gold, die Beliar im ganzen Spiel überhaupt hat.

func void B_HitpointAngleich (var int BeliarsCost)
{
	var int CurrentHitpoints;
	GivenHitpoints = GivenHitpoints + BeliarsCost;
	hero.attribute[ATR_HITPOINTS_MAX] = (hero.attribute[ATR_HITPOINTS_MAX] - BeliarsCost);

	CurrentHitpoints = (hero.attribute[ATR_HITPOINTS] - BeliarsCost);

	if (CurrentHitpoints < 2)
	{
		CurrentHitpoints = 2;
	};
	
	hero.attribute[ATR_HITPOINTS] = CurrentHitpoints;
};

func void B_ManaAngleich (var int BeliarsCost)
{
	var int CurrentMana;
	GivenMana = GivenMana + BeliarsCost;
	hero.attribute[ATR_MANA_MAX] = (hero.attribute[ATR_MANA_MAX] - BeliarsCost);
	hero.aivar[REAL_MANA_MAX] = hero.aivar[REAL_MANA_MAX] - BeliarsCost;

	CurrentMana = (hero.attribute[ATR_MANA] - BeliarsCost);

	if (CurrentMana < 0)
	{
		CurrentMana = 0;
	};
	
	hero.attribute[ATR_MANA] = CurrentMana;
};

func void B_BlitzInArsch ()
{
	var int BlitzInArsch_Hitpoints;
	var int CurrentHitpoints;
	var int Abzug;
	
	CurrentHitpoints = hero.attribute[ATR_HITPOINTS];

	
	BlitzInArsch_Hitpoints = ((CurrentHitpoints * 4)/5);
	
	if (BlitzInArsch_Hitpoints < 2)
	{
		BlitzInArsch_Hitpoints = 2;
	};
	
	Abzug = hero.attribute[ATR_HITPOINTS] - BlitzInArsch_Hitpoints;

	if (Abzug > 0)
	{
		var string concatText1;
		var string concatText2;
		
		concatText1 = ConcatStrings(" ", NAME_Damage);	 
		concatText2 = ConcatStrings(IntToString(Abzug), concatText1);
		AI_PrintScreen	(concatText2, -1, YPOS_GoldTaken, FONT_ScreenSmall, 2);
		Wld_PlayEffect("spellFX_BELIARSRAGE",  hero, hero, 0, 0, 0, FALSE );
	};
	
	hero.attribute[ATR_HITPOINTS] = BlitzInArsch_Hitpoints;
	
};

func void B_GetBeliarsGold (var int Kohle)
{
	RecievedMoney = (RecievedMoney + Kohle);

	if (RecievedMoney > BeliarsDispo)
	{
		Kohle = 100;
	};
	
	var string concatText1;
	var string concatText2;
	CreateInvItems	(hero,	ItMi_Gold,	Kohle);
	concatText1 = ConcatStrings(IntToString(Kohle), " ");
	concatText2 = ConcatStrings(concatText1, PRINT_GoldErhalten);	
	AI_PrintScreen	(concatText2, -1, YPOS_GoldTaken, FONT_ScreenSmall, 2);
};

// ****************************************************
// PrayIdol_S1
// --------------
// Funktion wird durch -Benutzung aufgerufen!
// *****************************************************
FUNC VOID PrayIdol_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		Wld_PlayEffect("DEMENTOR_FX",  hero, hero, 0, 0, 0, FALSE );

		self.aivar[AIV_INVINCIBLE] = TRUE; 
		PLAYER_MOBSI_PRODUCTION	= MOBSI_PRAYIDOL;
		Ai_ProcessInfos (her);
	};
};


//*******************************************************
//	PrayIdol Dialog abbrechen
//*******************************************************
INSTANCE PC_PrayIdol_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_PrayIdol_End_Condition;
	information		= PC_PrayIdol_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_PrayIdol_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayIdol_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
}; 

INSTANCE PC_PrayIdol_Draco (C_Info)
{
	npc				= PC_Hero;
	nr				= 998;
	condition		= PC_PrayIdol_Draco_Condition;
	information		= PC_PrayIdol_Draco_Info;
	permanent		= TRUE;
	description		= "Draco wiederbeleben (1000 Gold)"; 
};

FUNC INT PC_PrayIdol_Draco_Condition ()
{
	if ((PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	|| (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYSHRINE))
	&& (DOG_DEAD == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayIdol_Draco_Info()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);

		DOG_DEAD = FALSE;

		if (CurrentLevel == NEWWORLD_ZEN)
		{
			Wld_InsertNpc	(dog, Npc_GetNearestWP(hero));
		}
		else if (CurrentLevel == ADDONWORLD_ZEN)
		{
			Wld_InsertNpc	(dog_addon, Npc_GetNearestWP(hero));
		}
		else if (CurrentLevel == OLDWORLD_ZEN)
		{
			Wld_InsertNpc	(dog_ow, Npc_GetNearestWP(hero));
		}
		else if (CurrentLevel == DRAGONISLAND_ZEN)
		{
			Wld_InsertNpc	(dog_di, Npc_GetNearestWP(hero));
		};
	}
	else
	{
		PrintScreen	(PRINT_NotEnoughGold, -1, -1, FONT_Screen, 2);
	};
}; 
//*******************************************************
//	Statuette anbieten
//*******************************************************
INSTANCE PC_PrayIdol_Statue (C_Info)
{
	npc				= PC_Hero;
	nr				= 1;
	condition		= PC_PrayIdol_Statue_Condition;
	information		= PC_PrayIdol_Statue_Info;
	permanent		= TRUE;
	description		= "Beliar Statuette weihen"; //ADDON
};

func int PC_PrayIdol_Statue_Condition ()
{
  if (((Npc_HasItems(hero, ItMi_RingBeliarStatue)+Npc_HasItems(hero, ItMi_GoldBeliarStatue)+Npc_HasItems(hero, ItMi_StahlBeliarStatue))>0) && (hero.guild == GIL_Bad) && !(SC_isDarkMage || SC_isDarkWarrior) && (PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL))
    {
      return true;
    };
  return false;
};

func void PC_PrayIdol_Statue_Info ()
{
  Info_ClearChoices(PC_PrayIdol_Statue);
  Info_AddChoice(PC_PrayIdol_Statue, Dialog_Back, PC_PrayIdol_Statue_Back);
  if (Npc_HasItems(hero, ItMi_RingBeliarStatue)>0)
    {
      Info_AddChoice(PC_PrayIdol_Statue, "Statuette aus Beliars Wille weihen", PC_PrayIdol_Statue_Ring);
    };
  if (Npc_HasItems(hero, ItMi_GoldBeliarStatue)>0)
    {
      Info_AddChoice(PC_PrayIdol_Statue, "Statuette aus Gold weihen", PC_PrayIdol_Kill);
    };
  if (Npc_HasItems(hero, ItMi_StahlBeliarStatue)>0)
    {
      Info_AddChoice(PC_PrayIdol_Statue, "Statuette aus Stahl weihen", PC_PrayIdol_Kill);
    };
};

func void PC_PrayIdol_Statue_Back ()
{
  Info_ClearChoices(PC_PrayIdol_Statue);
};

func void PC_PrayIdol_Kill ()
{
  B_BlitzInArsch();
  Print("Beliar ist enttäuscht von dir!");
  B_BlitzInArsch();
  B_ENDPRODUCTIONDIALOG ();
  B_BlitzInArsch();
};

func void PC_PrayIdol_Statue_Ring ()
{
  if (SC_IsObsessed == FALSE)
    {
      Npc_RemoveInvItems(hero, ItMi_RingBeliarStatue, 1);
      CreateInvItems(hero, ItMi_RingBeliarStatue2, 1);
      Print("Die Macht Beliars strömt in die Statuette.");
      Info_ClearChoices(PC_PrayIdol_Statue);
    }
  else
    {
      PC_PrayIdol_Kill();
    };
};

//*******************************************************
//	Beten
//*******************************************************
INSTANCE PC_PrayIdol_PrayIdol (C_Info)
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayIdol_PrayIdol_Condition;
	information		= PC_PrayIdol_PrayIdol_Info;
	permanent		= TRUE;
	description		= NAME_ADDON_BETEN; //ADDON
};

FUNC INT PC_PrayIdol_PrayIdol_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	 ==	MOBSI_PRAYIDOL)
	{	
		return TRUE;
	};
};
	
FUNC VOID PC_PrayIdol_PrayIdol_Info()
{
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
	Info_AddChoice (PC_PrayIdol_PrayIdol,Dialog_Back,PC_PrayIdol_PrayIdol_Back);
	Info_AddChoice (PC_PrayIdol_PrayIdol , NAME_ADDON_PRAYIDOL_GIVENOTHING ,PC_PrayIdol_PrayIdol_NoPay);

	if (GivenHitpoints	<= 50)
	{
		if (hero.attribute[ATR_HITPOINTS_MAX] >= 40)//Joly:nicht weniger -> Uncoscious
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEHITPOINT1 ,PC_PrayIdol_PrayIdol_SmallPay);
		};
		if (hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEHITPOINT2 ,PC_PrayIdol_PrayIdol_MediumPay);
		};
		if (hero.attribute[ATR_HITPOINTS_MAX] >= 40)
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEHITPOINT3 ,PC_PrayIdol_PrayIdol_BigPay);
		};
	};
	
	if (GivenMana <= 10)
	{
		if (hero.attribute[ATR_MANA_MAX] > 10)
		{
			Info_AddChoice (PC_PrayIdol_PrayIdol, NAME_ADDON_PRAYIDOL_GIVEMANA ,PC_PrayIdol_PrayIdol_ManaPay);
		};
	};
}; 

FUNC VOID PC_PrayIdol_PrayIdol_Back () 
{
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	Nichts gespendet
//****************

FUNC VOID PC_PrayIdol_PrayIdol_NoPay ()
{
	B_BlitzInArsch ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	1 LebensEnergie
//****************

FUNC VOID PC_PrayIdol_PrayIdol_SmallPay ()
{
	B_HitpointAngleich (1);
	
	//----- Heute Schon gebetet? -----
	if (PrayIdolDay == Wld_GetDay())	
	|| (RecievedMoney >= BeliarsDispo)								
	{
		B_BlitzInArsch ();
	}
	else
	{
		//----- SC ist Paladin / KDF ------
		if ((hero.guild == GIL_PAL)||(hero.guild == GIL_KDF))
		{
			B_GetBeliarsGold (25);
		}
		else //alle anderen
		{	
			B_GetBeliarsGold (50);
		};
	};
	
	PrayIdolDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	2 LebensEnergie
//****************


FUNC VOID PC_PrayIdol_PrayIdol_MediumPay ()
{
	B_HitpointAngleich (5);
	
	//----- Heute Schon gebetet? -----
	if (PrayIdolDay == Wld_GetDay())	
	|| (RecievedMoney >= BeliarsDispo)								
	{
		B_BlitzInArsch ();
	}
	else
	{
		//----- SC ist Paladin / KDF ------
		if ((hero.guild == GIL_PAL)||(hero.guild == GIL_KDF))
		{
			B_GetBeliarsGold (125);
		}
		else //alle anderen
		{	
			B_GetBeliarsGold (250);
		};
	};
	
	PrayIdolDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

//****************
//	10 LebensEnergie oder 1 Mana
//****************
func VOID PC_PrayIdol_PrayIdol_BigPayManaPay ()
{
	if (PrayIdolDay == Wld_GetDay())	
	|| (RecievedMoney >= BeliarsDispo)								
	{
		B_BlitzInArsch ();
	}
	else
	{
		//----- SC ist Paladin / KDF ------
		if ((hero.guild == GIL_PAL)||(hero.guild == GIL_KDF))
		{
			B_GetBeliarsGold (250);
		}
		else //alle anderen
		{	
			B_GetBeliarsGold (500);
		};
	};
	
	PrayIdolDay = Wld_GetDay ();
	Info_ClearChoices (PC_PrayIdol_PrayIdol);
};

FUNC VOID PC_PrayIdol_PrayIdol_BigPay ()
{
	B_HitpointAngleich (10);
	PC_PrayIdol_PrayIdol_BigPayManaPay ();
};
FUNC VOID PC_PrayIdol_PrayIdol_ManaPay ()
{
	B_ManaAngleich (1);
	PC_PrayIdol_PrayIdol_BigPayManaPay ();
};

//*******************************************************
//	SchwertWeihe
//*******************************************************
INSTANCE PC_PrayShrine_UPGRATEBELIARSWEAPON (C_Info) 
{
	npc				= PC_Hero;
	nr				= 2;
	condition		= PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition;
	information		= PC_PrayShrine_UPGRATEBELIARSWEAPON_Info;
	permanent		= TRUE;
	description		= NAME_ADDON_UPGRATEBELIARSWEAPON; 
};

FUNC INT PC_PrayShrine_UPGRATEBELIARSWEAPON_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_PRAYIDOL)
	&& ((C_ScCanUpgrateBeliarsWeapon ()) == TRUE)
	&& ((C_ScHasBeliarsWeapon ()) == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_PrayShrine_UPGRATEBELIARSWEAPON_Info()
{
	B_ClearBeliarsWeapon ();
	B_UpgrateBeliarsWeapon ();
}; 


instance PC_SELL_SOUL(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_sell_soul_condition;
	information = pc_sell_soul_info;
	permanent = TRUE;
	description = "Seele verkaufen";
};


func int pc_sell_soul_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (SELL_SOUL != TRUE) && Npc_KnowsInfo (hero, DIA_Addon_Raven_Hi) && (hero.guild != GIL_BAD))
	{
		return TRUE;
	};
};

func void pc_sell_soul_info()
{
	Info_ClearChoices (pc_sell_soul);
	Info_AddChoice (pc_sell_soul, "Lieber nicht", pc_sell_soul_back);
	Info_AddChoice (pc_sell_soul, "Für 10000 Gold", pc_sell_soul_for_gold);
	Info_AddChoice (pc_sell_soul, "Für Macht", pc_sell_soul_for_macht);
	Info_AddChoice (pc_sell_soul, "Für Artefakte", pc_sell_soul_for_artefakte);
};

func void pc_sell_soul_for_gold()
{
	CreateInvItems (hero, ItMi_Gold, 10000);
	Wld_PlayEffect ("spellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
	SELL_SOUL = TRUE;
	b_endproductiondialog ();
};

func void pc_sell_soul_for_macht()
{
	CreateInvItems (hero, itpo_blooddrink, 1);
	Wld_PlayEffect ("spellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
	SELL_SOUL = TRUE;
	b_endproductiondialog ();
};

func void pc_sell_soul_for_artefakte()
{
	CreateInvItems (hero, itam_beliar, 1);
	Wld_PlayEffect ("spellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
	SELL_SOUL = TRUE;
	b_endproductiondialog ();
};

func void pc_sell_soul_back()
{
	b_endproductiondialog ();
};


instance PC_SELL_MY_BLOOD(C_Info)
{
	npc = PC_Hero;
	nr = 654;
	condition = pc_sell_my_blood_condition;
	information = pc_sell_my_blood_info;
	permanent = TRUE;
	description = "Mein Blut opfern";
};


func int pc_sell_my_blood_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_PRAYIDOL) && (Npc_HasItems (hero, itpo_hero_blood) >= 3) && (Npc_HasItems (hero, itmi_cupbeliar_1) >= 1) && (Npc_HasItems (hero, itmi_cupbeliar_2) >= 1) && (Npc_HasItems (hero, itmi_cupbeliar_3) >= 1))
	{
		return TRUE;
	};
};

func void pc_sell_my_blood_info()
{
	MYBLOODSPENDE = TRUE;
	Npc_RemoveInvItems (self, itpo_hero_blood, 3);
	PrintScreen ("Beliar hat dein Opfer angenommen", -1, 1, FONT_Screen, 2);
	Wld_PlayEffect ("spellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
	b_endproductiondialog ();
};
