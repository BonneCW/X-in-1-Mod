const string Schwert_Success = "Die Klinge hat sich verändert.";
const string Magie_Success = "Die Macht hat die Ringe verändert.";

// ****************************************************
// MAKERUNE_S1
// --------------
// Funktion wird durch Runentisch-Mobsi-Benutzung aufgerufen!
// benötigtes Item dafür: ItMi_RuneBlank
// *****************************************************
FUNC VOID MAKERUNE_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE; 
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_MAKERUNE;
		Ai_ProcessInfos (her);
	};
}; 

//*******************************************************
//	MakeRune Dialog abbrechen
//*******************************************************
INSTANCE PC_MakeRune_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_MakeRune_End_Condition;
	information		= PC_MakeRune_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_MakeRune_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_MakeRune_End_Info()
{
	CreateInvItems (self, ItMi_RuneBlank,1);
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
// Runen- Erschaffung Dialoge
//---------------------------
//*******************************************************
INSTANCE PC_Circle_01 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_01_Condition;
	information		= PC_Circle_01_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 1 erschaffen"; 
};

FUNC INT PC_Circle_01_Condition ()
{
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& ((PLAYER_TALENT_RUNES[SPL_LIGHT] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	||  (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE) ) )
	{	
		return TRUE;
	};
};

FUNC VOID PC_Circle_01_Info()
{
	Info_ClearChoices (PC_Circle_01);
	
	Info_AddChoice 	  (PC_Circle_01,DIALOG_BACK,PC_Circle_01_BACK);
	if (PLAYER_TALENT_RUNES[SPL_LIGHT] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_LIGHT,PC_ItRu_Light_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Firebolt] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_Firebolt,PC_ItRu_Firebolt_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Zap] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_Zap,PC_ItRu_Zap_Info); 
	};
	if (PLAYER_TALENT_RUNES[SPL_LightHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_LightHeal,PC_ItRu_LightHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_01,NAME_SPL_SummonGoblinSkeleton,PC_ItRu_SumGobSkel_Info);
	};
	
};
FUNC VOID PC_Circle_01_BACK()
{
	Info_ClearChoices (PC_Circle_01);
};
//*******************************************************
INSTANCE PC_Circle_02 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_02_Condition;
	information		= PC_Circle_02_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 2 erschaffen"; 
};
FUNC INT PC_Circle_02_Condition ()
{
	if ( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&&  ( (PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	||    (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	||    (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	||    (PLAYER_TALENT_RUNES[SPL_WINDFIST] == TRUE)
	||    (PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE) 
	||    (PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE)
	||    (PLAYER_TALENT_RUNES[SPL_Icelance] == TRUE)) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_02_Info()
{
	Info_ClearChoices (PC_Circle_02);
	
	Info_AddChoice 	  (PC_Circle_02,DIALOG_BACK,PC_Circle_02_BACK);
	if (PLAYER_TALENT_RUNES[SPL_InstantFireball] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_InstantFireball,PC_ItRu_InstFireball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Icebolt] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_Icebolt,PC_ItRu_Icebolt_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonWolf] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_SummonWolf,PC_ItRu_SumWolf_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_WINDFIST] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_WINDFIST,PC_ItRu_Windfist_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Sleep] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_Sleep,PC_ItRu_Sleep_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Whirlwind] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_Whirlwind,PC_ItRu_Whirlwind_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceLance] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_02,NAME_SPL_IceLance,PC_ItRu_Icelance_Info);
	};
};
FUNC VOID PC_Circle_02_BACK()
{
	Info_ClearChoices (PC_Circle_02);
};
//*******************************************************
INSTANCE PC_Circle_03 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_03_Condition;
	information		= PC_Circle_03_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 3 erschaffen"; 
};
FUNC INT PC_Circle_03_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
	&& ( (PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	
	||   (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_Fear] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	||	 (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	||	 (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	|| (PLAYER_TALENT_RUNES[106] == TRUE)
	||	 (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_03_Info()
{
	Info_ClearChoices (PC_Circle_03);
	
	Info_AddChoice 	  (PC_Circle_03,DIALOG_BACK,PC_Circle_03_BACK);
	if (PLAYER_TALENT_RUNES[SPL_MediumHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_MediumHeal,PC_ItRu_MediumHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_SummonSkeleton,PC_ItRu_SumSkel_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Fear] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Fear,PC_ItRu_Fear_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_IceCube] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_IceCube,PC_ItRu_IceCube_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ChargeZap] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_ChargeZap,PC_ItRu_ThunderBall_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Firestorm] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Firestorm,PC_ItRu_Firestorm_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Geyser] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Geyser,PC_ItRu_Geyser_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Thunderstorm] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_03,NAME_SPL_Thunderstorm,PC_ItRu_thunderstorm_Info);
	};
	if (PLAYER_TALENT_RUNES[106] == TRUE)
	{
		Info_AddChoice (PC_Circle_03, NAME_SPL_SUMMONICEWOLF, pc_itru_sumicewolf_info);
	};
};
	
FUNC VOID PC_Circle_03_BACK()
{
	Info_ClearChoices (PC_Circle_03);
};
//*******************************************************
INSTANCE PC_Circle_04 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_04_Condition;
	information		= PC_Circle_04_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 4 erschaffen"; 
};
FUNC INT PC_Circle_04_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& ( (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	|| 	 (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	|| (PLAYER_TALENT_RUNES[107] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_Waterfist] == TRUE) ) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_04_Info()
{
	Info_ClearChoices (PC_Circle_04);
	
	Info_AddChoice 	  (PC_Circle_04,DIALOG_BACK,PC_Circle_04_BACK);
	
	if (PLAYER_TALENT_RUNES[SPL_SummonGolem] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_SummonGolem,PC_ItRu_SumGol_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_DestroyUndead] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_DestroyUndead,PC_ItRu_HarmUndead_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_ChargeFireball,PC_ItRu_ChargeFireball_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_LightningFlash] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_LightningFlash,PC_ItRu_LightningFlash_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Waterfist] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_04,NAME_SPL_Waterfist,PC_ItRu_Waterfist_Info);
	};
	if (PLAYER_TALENT_RUNES[107] == TRUE)
	{
		Info_AddChoice (PC_Circle_04, NAME_SPL_SUMMONICEGOLEM, pc_itru_sumicegol_info);
	};	
};
FUNC VOID PC_Circle_04_BACK()
{
	Info_ClearChoices (PC_Circle_04);
};
//*******************************************************
INSTANCE PC_Circle_05 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_05_Condition;
	information		= PC_Circle_05_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 5 erschaffen"; 
};
FUNC INT PC_Circle_05_Condition ()
{
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& ( (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE) ) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_05_Info()
{
	Info_ClearChoices (PC_Circle_05);
	
	Info_AddChoice 	  (PC_Circle_05,DIALOG_BACK,PC_Circle_05_BACK);
	
	if (PLAYER_TALENT_RUNES[SPL_IceWave] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_IceWave,PC_ItRu_IceWave_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_SummonDemon] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_SummonDemon,PC_ItRu_SumDemon_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_FullHeal] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_FullHeal,PC_ItRu_FullHeal_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_05,NAME_SPL_Pyrokinesis,PC_ItRu_Pyrokinesis_Info);
	};
};			
FUNC VOID PC_Circle_05_BACK()
{
	Info_ClearChoices (PC_Circle_05);
};

//*******************************************************
INSTANCE PC_Circle_06 (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_Circle_06_Condition;
	information		= PC_Circle_06_Info;
	permanent		= TRUE;
	description		= "Runen Kreis 6 erschaffen"; 
};
FUNC INT PC_Circle_06_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& ( (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	|| 	 (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)
	||   (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	|| (SC_CAN_BAUEN_DRAGONRUNE == TRUE) ) )
	{
		return TRUE;
	};
};
FUNC VOID PC_Circle_06_Info()
{
	Info_ClearChoices (PC_Circle_06);
	
	Info_AddChoice 	  (PC_Circle_06,DIALOG_BACK,PC_Circle_06_BACK);
	if (PLAYER_TALENT_RUNES[SPL_Firerain] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_Firerain,PC_ItRu_Firerain_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_BreathOfDeath] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_BreathOfDeath,PC_ItRu_BreathOfDeath_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_MassDeath] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_MassDeath,PC_ItRu_MassDeath_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_ArmyOfDarkness,PC_ItRu_ArmyOfDarkness_Info);
	};
	if (PLAYER_TALENT_RUNES[SPL_Shrink] == TRUE)
	{
		Info_AddChoice 	  (PC_Circle_06,NAME_SPL_Shrink,PC_ItRu_Shrink_Info);
	};
	if ((SC_CAN_BAUEN_DRAGONRUNE == TRUE))
	{
		Info_AddChoice (PC_Circle_06, "Drachen herbeirufen", pc_itru_dragon_info);
	};
};	
FUNC VOID PC_Circle_06_BACK()
{
	Info_ClearChoices (PC_Circle_06);
};


//*******************************************************
INSTANCE PC_SPL_MasterOfDisaster (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_SPL_MasterOfDisaster_Condition;
	information		= PC_SPL_MasterOfDisaster_Info;
	permanent		= TRUE;
	description		= "Das Geheimnis der Bibliothek!"; 
};
FUNC INT PC_SPL_MasterOfDisaster_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE  ))
	{
		return TRUE;
	};
};
FUNC VOID PC_SPL_MasterOfDisaster_Info()

{
	Info_ClearChoices (PC_SPL_MasterOfDisaster);
	
	Info_AddChoice 	  (PC_SPL_MasterOfDisaster,DIALOG_BACK,PC_SPL_MasterOfDisaster_BACK);
	if (PLAYER_TALENT_RUNES[SPL_MasterOfDisaster] == TRUE)
	{
		Info_AddChoice 	  (PC_SPL_MasterOfDisaster,"Das Geheimnis der Bibliothek!",PC_SPL_MasterOfDisaster_Create);
	};
	
};	

FUNC VOID PC_SPL_MasterOfDisaster_BACK()
{
	Info_ClearChoices (PC_SPL_MasterOfDisaster);
};

FUNC VOID PC_SPL_MasterOfDisaster_Create()
{
	if 	(Npc_HasItems (hero, ItMi_HolyWater) 	>= 1)
	{
		Npc_RemoveInvItems (hero,ItMi_HolyWater  ,1);
		CreateInvItems 	   (hero,ItRu_MasterOfDisaster,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
INSTANCE PC_SPL_PalTeleportSecret (C_Info)
{
	npc				= PC_Hero;
	condition		= PC_SPL_PalTeleportSecret_Condition;
	information		= PC_SPL_PalTeleportSecret_Info;
	permanent		= TRUE;
	description		= "Teleportrune erschaffen"; 
};
FUNC INT PC_SPL_PalTeleportSecret_Condition ()
{	
	if( (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) 
	&& (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE  ))
	{
		return TRUE;
	};
};
FUNC VOID PC_SPL_PalTeleportSecret_Info()

{
	Info_ClearChoices (PC_SPL_PalTeleportSecret);
	
	Info_AddChoice 	  (PC_SPL_PalTeleportSecret,DIALOG_BACK,PC_SPL_PalTeleportSecret_BACK);
	if (PLAYER_TALENT_RUNES[SPL_PalTeleportSecret] == TRUE)
	{
		Info_AddChoice 	  (PC_SPL_PalTeleportSecret,"Das Geheimnis der Bibliothek!",PC_SPL_PalTeleportSecret_Create);
	};
	
};	
FUNC VOID PC_SPL_PalTeleportSecret_BACK()
{
	Info_ClearChoices (PC_SPL_PalTeleportSecret);
};

FUNC VOID PC_SPL_PalTeleportSecret_Create()
{
	if 	(Npc_HasItems (hero, ItMi_HolyWater) 	>= 1)
	{
		Npc_RemoveInvItems (hero,ItMi_HolyWater  ,1);
		CreateInvItems 	   (hero,ItRu_PalTeleportSecret,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

//*******************************************************
FUNC VOID PC_ItRu_Light_Info ()
{
	if (Npc_HasItems (hero, ItSc_Light) >= 1)
	&& (Npc_HasItems (hero, ItMi_Gold)  >= 1)
	
	{
		Npc_RemoveInvItems  (hero,ItSc_Light, 1);
		Npc_RemoveInvItems  (hero,ItMI_Gold, 1);
		
		CreateInvItems 	   (hero,ItRu_Light,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Firebolt_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firebolt) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur)   >= 1)
	
	{
		Npc_RemoveInvItems  (hero,ItSc_Firebolt, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur, 1);
		
		CreateInvItems 	    (hero,ItRu_Firebolt,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_LightHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_LightHeal) >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_01) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_LightHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_01,1);
		
		
		CreateInvItems 	   (hero,ItRu_LightHeal,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_SumGobSkel_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGobSkel) >= 1)
	&& (Npc_HasItems (hero, ItAt_GoblinBone) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGobSkel, 1);
		Npc_RemoveInvItems  (hero,ItAt_GoblinBone, 1);
		
		
		CreateInvItems 	    (hero,ItRu_SumGobSkel,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Zap_Info ()
{
	if (Npc_HasItems (hero, ItSc_Zap) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Zap, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,1);
	
		
		CreateInvItems 	   (hero,ItRu_Zap,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_InstFireball_Info ()
{
	if (Npc_HasItems (hero, ItSc_InstantFireball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_InstantFireball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		
		CreateInvItems 	   (hero,ItRu_InstantFireball,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_Icebolt_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icebolt) >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz)  >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Icebolt, 1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1);

		
		CreateInvItems 	   (hero,ItRu_Icebolt,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_SumWolf_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumWolf) >= 1)
	&& (Npc_HasItems (hero, ItAt_WolfFur) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumWolf, 1);
		Npc_RemoveInvItems  (hero,ItAt_WolfFur,  1);
		
		CreateInvItems	   (hero,ItRu_SumWolf,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Windfist_Info ()
{
	if (Npc_HasItems (hero, ItSc_Windfist) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Windfist, 1);
		Npc_RemoveInvItems  (hero,ItMi_Coal, 	 1);

		
		CreateInvItems 	   (hero,ItRu_Windfist,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};

func void pc_itru_sumicewolf_info()
{
	if ((Npc_HasItems (hero, itsc_sumicewolf) >= 1) && (Npc_HasItems (hero, ItAt_WolfFur) >= 1) && (Npc_HasItems (hero, ItMi_Quartz) >= 1))
	{
		Npc_RemoveInvItems (hero, itsc_sumicewolf, 1);
		Npc_RemoveInvItems (hero, ItAt_WolfFur, 1);
		Npc_RemoveInvItems (hero, ItMi_Quartz, 1);
		CreateInvItems (hero, itru_sumicewolf, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank, 1);
	};
	b_endproductiondialog ();
};

func void pc_itru_sumicegol_info()
{
	if ((Npc_HasItems (hero, itsc_sumicegol) >= 1) && (Npc_HasItems (hero, ItAt_IceGolemHeart) >= 1))
	{
		Npc_RemoveInvItems (hero, itsc_sumicegol, 1);
		Npc_RemoveInvItems (hero, ItAt_IceGolemHeart, 1);
		CreateInvItems (hero, itru_sumicegol, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank, 1);
	};
	b_endproductiondialog ();
};
//*******************************************************
FUNC VOID PC_ItRu_Sleep_Info ()
{
	if (Npc_HasItems (hero, ItSc_Sleep) >= 1)
	&& (Npc_HasItems (hero, ItPl_Swampherb) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Sleep, 1);
		Npc_RemoveInvItems  (hero,ItPl_Swampherb, 1);
		
		CreateInvItems 	   (hero,ItRu_Sleep,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_MediumHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_MediumHeal) >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_02) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_MediumHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_02,  1);
		
		CreateInvItems 	   (hero,ItRu_MediumHeal,1); 
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_LightningFlash_Info ()
{
	if (Npc_HasItems (hero, ItSc_LightningFlash) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_LightningFlash, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,    1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		
		CreateInvItems 	   (hero,ItRu_LightningFlash,1); 
		Print (PRINT_RuneSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_ChargeFireball_Info ()
{
	if (Npc_HasItems (hero, ItSc_ChargeFireball) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_ChargeFireball, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,1	);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,1);
		
		CreateInvItem 	   (hero,ItRu_ChargeFireball); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_SumSkel_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumSkel) >= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumSkel, 1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,1	);
		
		CreateInvItems 	   (hero,ItRu_SumSkel,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Fear_Info ()
{
	if (Npc_HasItems (hero, ItSc_Fear) >= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Fear, 1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,1	);
		
		CreateInvItems 	   (hero,ItRu_Fear,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_IceCube_Info ()
{
	if (Npc_HasItems (hero, ItSc_IceCube) >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_IceCube, 1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		
		CreateInvItems 	   (hero,ItRu_IceCube,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_ThunderBall_Info ()
{
	if (Npc_HasItems (hero, ItSc_ThunderBall) >= 1)
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Sulfur) 	  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_ThunderBall, 1);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,	1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,  	1);
		
		CreateInvItems 	   (hero,ItRu_ThunderBall,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_SumGol_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumGol) >= 1)
	&& (Npc_HasItems (hero, ItAt_StoneGolemHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumGol, 1);
		Npc_RemoveInvItems  (hero,ItAt_StoneGolemHeart,1);
		
		
		CreateInvItems 	   (hero,ItRu_SumGol,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_HarmUndead_Info ()
{
	if (Npc_HasItems (hero, ItSc_HarmUndead) >= 1)
	&& (Npc_HasItems (hero, ItMi_HolyWater)  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_HarmUndead, 1);
		Npc_RemoveInvItems  (hero,ItMi_HolyWater,  1);
		
		
		CreateInvItems 	   (hero,ItRu_HarmUndead,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
	};	
	B_ENDPRODUCTIONDIALOG ();
};
//*******************************************************
FUNC VOID PC_ItRu_Pyrokinesis_Info ()
{
	if (Npc_HasItems (hero, ItSc_Pyrokinesis) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)		
	{
		Npc_RemoveInvItems  (hero,ItSc_Pyrokinesis, 1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur,1	);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,1);
		
		CreateInvItems 	   (hero,ItRu_Pyrokinesis,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Firestorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firestorm) >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) >= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Firestorm, 		1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch, 			1);
		Npc_RemoveInvItems  (hero,ItMi_Sulfur, 			1);
	
		CreateInvItems 	   (hero,ItRu_Firestorm,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_IceWave_Info ()
{
	if (Npc_HasItems (hero, ItSc_IceWave) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) 	 >= 1)	
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_IceWave,   1);
		Npc_RemoveInvItems  (hero,ItMi_Quartz,    1);
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1);
		
		CreateInvItems 	   (hero,ItRu_IceWave,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_SumDemon_Info ()
{
	if (Npc_HasItems (hero, ItSc_SumDemon) >= 1)
	&& (Npc_HasItems (hero, ItAt_DemonHeart) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_SumDemon, 1);
		Npc_RemoveInvItems  (hero,ItAt_DemonHeart,1);
		
		CreateInvItems 	   (hero,ItRu_SumDemon,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_FullHeal_Info ()
{
	if (Npc_HasItems (hero, ItSc_FullHeal) 		 >= 1)
	&& (Npc_HasItems (hero, ItPl_Health_Herb_03) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_FullHeal, 1);
		Npc_RemoveInvItems  (hero,ItPl_Health_Herb_03,1	);
		
		CreateInvItems 	   (hero,ItRu_FullHeal,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_Firerain_Info ()
{
	if (Npc_HasItems (hero, ItSc_Firerain)  >= 1)
	&& (Npc_HasItems (hero, ItMi_Pitch) 	>= 1)
	&& (Npc_HasItems (hero, ItMi_Sulfur) 	>= 1)		
	&& (Npc_HasItems (hero, ItAt_WaranFiretongue) >= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_Firerain, 1);
		Npc_RemoveInvItems  (hero,ItMi_Pitch,	 1);
		Npc_RemoveInvItems  (hero,ItAt_WaranFiretongue,	1);
		
		CreateInvItems 	   (hero,ItRu_Firerain,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();		
};
//*******************************************************
FUNC VOID PC_ItRu_BreathOfDeath_Info ()
{
	if (Npc_HasItems (hero, ItSc_BreathOfDeath) >= 1)
	&& (Npc_HasItems (hero, ItMi_Coal) 			>= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 	>= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_BreathOfDeath, 1);
		Npc_RemoveInvItems  (hero,ItMi_Coal,	 1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,1);
		
		CreateInvItems 	   (hero,ItRu_BreathOfDeath,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();			
};
//*******************************************************
FUNC VOID PC_ItRu_MassDeath_Info ()
{
	if (Npc_HasItems (hero, ItSc_MassDeath) 	  >= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone) 	  >= 1)
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 	  >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_MassDeath, 	1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,	1);
		
		CreateInvItems 	   (hero,ItRu_MassDeath,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
};
//*******************************************************
FUNC VOID PC_ItRu_ArmyOfDarkness_Info ()
{
	if (Npc_HasItems (hero, ItSc_ArmyOfDarkness)		>= 1)
	&& (Npc_HasItems (hero, ItAt_SkeletonBone)			>= 1)	
	&& (Npc_HasItems (hero, ItMi_DarkPearl) 			>= 1)	
	&& (Npc_HasItems (hero, ItAt_StoneGolemHeart) 		>= 1)	
	&& (Npc_HasItems (hero, ItAt_DemonHeart) 			>= 1)
	{
		Npc_RemoveInvItems  (hero,ItSc_ArmyOfDarkness, 		1);
		Npc_RemoveInvItems  (hero,ItAt_SkeletonBone,		1);
		Npc_RemoveInvItems  (hero,ItMi_DarkPearl,			1);
		Npc_RemoveInvItems  (hero,ItAt_StoneGolemHeart,		1);
		Npc_RemoveInvItems  (hero,ItAt_DemonHeart,			1);
		
		CreateInvItems 	   (hero,ItRu_ArmyOfDarkness,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};
	B_ENDPRODUCTIONDIALOG ();	
}; 
//*******************************************************
FUNC VOID PC_ItRu_Shrink_Info ()
{
	if (Npc_HasItems (hero, ItSc_Shrink) 	 >= 1)
	&& (Npc_HasItems (hero, ItAt_GoblinBone) >= 1)	
	&& (Npc_HasItems (hero, ItAt_TrollTooth) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Shrink, 	  1 );
		Npc_RemoveInvItems  (hero,ItAt_GoblinBone,1	);
		Npc_RemoveInvItems  (hero,ItAt_TrollTooth,1	);
		
		CreateInvItems 	   (hero,ItRu_Shrink,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

//##########################################
//			Addon
//##########################################


FUNC VOID PC_ItRu_Whirlwind_Info ()
{
	if (Npc_HasItems (hero, ItSc_Whirlwind) 	 >= 1)
	&& (Npc_HasItems (hero, ItAt_Wing) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Whirlwind, 	  1 );
		Npc_RemoveInvItems  (hero,ItAt_Wing,1	);
		
		CreateInvItems 	   (hero,ItRu_Whirlwind,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Icelance_Info ()
{
	if (Npc_HasItems (hero, ItSc_Icelance) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Icelance, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		
		CreateInvItems 	   (hero,ItRu_Icelance,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Thunderstorm_Info ()
{
	if (Npc_HasItems (hero, ItSc_Thunderstorm) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Quartz) >= 1)	
	&& (Npc_HasItems (hero, ItAt_Wing) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Thunderstorm, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Quartz,1	);
		Npc_RemoveInvItems  (hero,ItAt_Wing,1	);
		
		CreateInvItems 	   (hero,ItRu_Thunderstorm,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Geyser_Info ()
{
	if (Npc_HasItems (hero, ItSc_Geyser) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Geyser, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		
		CreateInvItems 	   (hero,ItRu_Geyser,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};

FUNC VOID PC_ItRu_Waterfist_Info ()
{
	if (Npc_HasItems (hero, ItSc_Waterfist) 	 >= 1)
	&& (Npc_HasItems (hero, ItMi_Aquamarine) >= 1)	
	&& (Npc_HasItems (hero, ItMi_Rockcrystal) >= 1)	
	{
		Npc_RemoveInvItems  (hero,ItSc_Waterfist, 	  1 );
		Npc_RemoveInvItems  (hero,ItMi_Aquamarine,1	);
		Npc_RemoveInvItems  (hero,ItMi_Rockcrystal,1	);
		
		CreateInvItems 	   (hero,ItRu_Waterfist,1); 
		Print (PRINT_RunESuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank,1);
	};	
	B_ENDPRODUCTIONDIALOG ();	
};
//*************************
// Beliars Waffe aufbessern
//*************************
instance PC_Dark_Warrior_Weapon (C_Info)
{
  npc = PC_Hero;
  condition = PC_Dark_Warrior_Weapon_Condition;
  information = PC_Dark_Warrior_Weapon_Info;
  permanent = TRUE;
  description = "Dunkle Klinge aufbessern";
};

func int PC_Dark_Warrior_Weapon_Condition ()
{
  if (((Npc_HasItems(hero, ItMw_1H_Dunkelklinge)+Npc_HasItems(hero, ItMw_2H_DunkelKlinge) > 0)
       && (Npc_KnowsInfo(hero, DIA_DragonTalk_Dark_1) == TRUE))
      || ((Npc_HasItems(hero, ItMw_1H_Goblinzahn)+Npc_HasItems(hero, ItMw_2H_Goblinzahn) > 0)
	  && (Npc_KnowsInfo(hero, DIA_DragonTalk_Dark_2) == TRUE))
      || ((Npc_HasItems(hero, ItMw_1H_Wolfsfang)+Npc_HasItems(hero, ItMw_2H_Wolfsfang) > 0)
	  && (Npc_KnowsInfo(hero, DIA_DragonTalk_Dark_3) == TRUE))
      || ((Npc_HasItems(hero, ItMw_1H_Knochenspalter)+Npc_HasItems(hero, ItMw_2H_Knochenspalter) > 0)
	  && (Npc_KnowsInfo(hero, DIA_DragonTalk_Dark_4) == TRUE)))
    && (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
    {
      return true;
    };
  return false;
};

func void PC_Dark_Warrior_Weapon_Info ()
{
  if (Npc_HasItems(hero, ItMw_1H_Knochenspalter) > 0)
    {
      if (Npc_HasItems(hero, ItAt_StoneGolemHeart) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_1H_Knochenspalter, 1);
	  Npc_RemoveInvItems(hero, ItAt_StoneGolemHeart, 1);
	  CreateInvItems(hero, ItMw_1H_Golemfaust, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_2H_Knochenspalter) > 0)
    {
      if (Npc_HasItems(hero, ItAt_StoneGolemHeart) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_2H_Knochenspalter, 1);
	  Npc_RemoveInvItems(hero, ItAt_StoneGolemHeart, 1);
	  CreateInvItems(hero, ItMw_2H_Golemfaust, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_1H_Wolfsfang) > 0)
    {
      if (Npc_HasItems(hero, ItAt_SkeletonBone) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_1H_Wolfsfang, 1);
	  Npc_RemoveInvItems(hero, ItAt_SkeletonBone, 1);
	  CreateInvItems(hero, ItMw_1H_Knochenspalter, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_2H_Wolfsfang) > 0)
    {
      if (Npc_HasItems(hero, ItAt_SkeletonBone) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_2H_Wolfsfang, 1);
	  Npc_RemoveInvItems(hero, ItAt_SkeletonBone, 1);
	  CreateInvItems(hero, ItMw_2H_Knochenspalter, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_1H_Goblinzahn) > 0)
    {
      if (Npc_HasItems(hero, ItAt_WolfFur) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_1H_Goblinzahn, 1);
	  Npc_RemoveInvItems(hero, ItAt_WolfFur, 1);
	  CreateInvItems(hero, ItMw_1H_Wolfsfang, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_2H_Goblinzahn) > 0)
    {
      if (Npc_HasItems(hero, ItAt_WolfFur) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_2H_Goblinzahn, 1);
	  Npc_RemoveInvItems(hero, ItAt_WolfFur, 1);
	  CreateInvItems(hero, ItMw_2H_Wolfsfang, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_1H_Dunkelklinge) > 0)
    {
      if (Npc_HasItems(hero, ItAt_GoblinBone) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_1H_Dunkelklinge, 1);
	  Npc_RemoveInvItems(hero, ItAt_GoblinBone, 1);
	  CreateInvItems(hero, ItMw_1H_Goblinzahn, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
    if (Npc_HasItems(hero, ItMw_2H_Dunkelklinge) > 0)
    {
      if (Npc_HasItems(hero, ItAt_GoblinBone) > 0)
	{
	  Npc_RemoveInvItems(hero, ItMw_2H_Dunkelklinge, 1);
	  Npc_RemoveInvItems(hero, ItAt_GoblinBone, 1);
	  CreateInvItems(hero, ItMw_2H_Goblinzahn, 1);
	  Print(Schwert_Success);
	}
      else
	{
	  Print (PRINT_ProdItemsMissing);
	};
    };
};

instance PC_Dark_Mage_Macht (C_Info)
{
  npc = PC_Hero;
  condition = PC_Dark_Mage_Macht_Condition;
  information = PC_Dark_Mage_Macht_Info;
  permanent = TRUE;
  description = "Die Macht der Vereinigung beschwören";
};

func int PC_Dark_Mage_Macht_Condition ()
{
  if (Npc_KnowsInfo(hero, Bad_LAP_Macht)) && (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE) && (hero.guild == GIL_BAD)
    {
      return true;
    };
  return false;
};

func void PC_Dark_Mage_Macht_Info ()
{
  if (((Npc_HasItems(hero, ItPo_PotionOfDeath_01_Mis) > 0) || (Npc_HasItems(hero, ItPo_PotionOfDeath_02_Mis) > 0)) && (Npc_HasItems(hero, ItMi_Wasserperle) > 0) && (Npc_HasItems(hero, ItMi_RingBeliarStatue2) > 0))
    {
      if (Npc_HasItems(hero, ItPo_PotionOfDeath_01_Mis) > 0)
	{
	  Npc_RemoveInvItems(hero, ItPo_PotionofDeath_01_Mis, 1);
	}
      else
	{
	  Npc_RemoveInvItems(hero, ItPo_PotionofDeath_02_Mis, 1);
	};
      Npc_RemoveInvItems(hero, ItMi_Wasserperle, 1);
      Npc_RemoveInvItems(hero, ItMi_RingBeliarStatue2, 1);
      CreateInvItems(hero, ItMi_RingBeliarStatue, 1);
      CreateInvItems(hero, ItAm_Seelen, 1);
      LOG_SetTopicStatus(Almanach_Dunkelmagier, LOG_SUCCESS);
      B_GivePlayerXP(XP_Ambient);
    }
  else
    {
      Print (PRINT_ProdItemsMissing);
      CreateInvItems (self, ItMi_RuneBlank,1);
    };
  B_ENDPRODUCTIONDIALOG ();
};

instance PC_Dark_Warrior_Dämon (C_Info)
{
  npc = PC_Hero;
  condition = PC_Dark_Warrior_Dämon_Condition;
  information = PC_Dark_Warrior_Dämon_Info;
  permanent = TRUE;
  description = "Dämonenschneide schmieden";
};

func int PC_Dark_Warrior_Dämon_Condition ()
{
  if ((Npc_KnowsInfo(hero, Bad_LAP_Dämonenschneide)) && (Npc_HasItems(hero, ItMw_1H_Daemonenschneide) + Npc_HasItems(hero, ItMw_2H_Daemonenschneide) == 0)) && (PLAYER_MOBSI_PRODUCTION	==	MOBSI_MAKERUNE)
    {
      return true;
    };
  return false;
};

func void PC_Dark_Warrior_Dämon_Info ()
{
  if ((Npc_HasItems(hero, ItAt_DemonHeart) > 0) && (Npc_HasItems(hero, ItMi_RingBeliarStatue2) > 0))
    {
      if (Npc_HasItems(hero, ItMw_1H_Golemfaust) > 0) //Spieler hat Golemfaust 1Hand
	{
	  Npc_RemoveInvItems(hero, ItMw_1H_Golemfaust, 1);
	  Npc_RemoveInvItems(hero, ItAt_DemonHeart, 1);
	  Npc_RemoveInvItems(hero, ItMi_RingBeliarStatue2, 1);
	  CreateInvItems(hero, ItMw_1H_Daemonenschneide, 1);
	  CreateInvItems(hero, ItMi_RingBeliarStatue, 1);
	  Print(Schwert_Success);
	  LOG_SetTopicStatus(Almanach_Dunkelkrieger, LOG_SUCCESS);
	  B_GivePlayerXP(XP_Ambient);
	}
      else if (Npc_HasItems(hero, ItMw_2H_Golemfaust) > 0) //Spieler hat Golemfaust 2Hand
	{
	  Npc_RemoveInvItems(hero, ItMw_2H_Golemfaust, 1);
	  Npc_RemoveInvItems(hero, ItAt_DemonHeart, 1);
	  Npc_RemoveInvItems(hero, ItMi_RingBeliarStatue2, 1);
	  CreateInvItems(hero, ItMw_2H_Daemonenschneide, 1);
	  CreateInvItems(hero, ItMi_RingBeliarStatue, 1);
	  Print(Schwert_Success);
	  LOG_SetTopicStatus(Almanach_Dunkelkrieger, LOG_SUCCESS);
	  B_GivePlayerXP(XP_Ambient);
	}
      else //Spieler hat keine Golemfaust
	{
	  Print (PRINT_ProdItemsMissing);
	};
    }
  else //Spieler hat kein Dämonenherz oder die Statuette
    {
      Print (PRINT_ProdItemsMissing);
    };
};

//**************************
// Magische Waffen schmieden
//**************************
instance PC_DARK_MAGIC_WEAPON(C_Info)
{
	npc = PC_Hero;
	condition = pc_dark_magic_weapon_condition;
	information = pc_dark_magic_weapon_info;
	permanent = TRUE;
	description = "Magische Waffen schmieden";
};


func int pc_dark_magic_weapon_condition()
{
	if (SC_ISDARKWARRIOR && (PLAYER_MOBSI_PRODUCTION == MOBSI_MakeRune))
	{
		return TRUE;
	};
	return FALSE;
};

func void pc_dark_magic_weapon_info()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	Info_AddChoice (pc_dark_magic_weapon, Dialog_Back, pc_dark_magic_weapon_back);
	if (Npc_HasItems (hero, ItRu_Shrink) > 0)
	{
		Info_AddChoice (pc_dark_magic_weapon, "Schlachtenwender", pc_dark_magic_weapon_shrink);
	};
	if (Npc_HasItems (hero, itmi_sturmstein) > 0)
	{
		Info_AddChoice (pc_dark_magic_weapon, "Sturmklinge", pc_dark_magic_weapon_sturm);
	};
	if (Npc_HasItems (hero, itmi_wasserstein) > 0)
	{
		Info_AddChoice (pc_dark_magic_weapon, "Wasserklinge", pc_dark_magic_weapon_water);
	};
	if (Npc_HasItems (hero, itmi_feuerstein) > 0)
	{
		Info_AddChoice (pc_dark_magic_weapon, "Feuerklinge", pc_dark_magic_weapon_fire);
	};
	Info_AddChoice (pc_dark_magic_weapon, "Untote vernichten", pc_dark_magic_weapon_undead);
	Info_AddChoice (pc_dark_magic_weapon, "Beliars Zorn", pc_dark_magic_weapon_zorn);
	Info_AddChoice (pc_dark_magic_weapon, "Energie stehlen", pc_dark_magic_weapon_suck);
};

var C_Item Hand1;
var C_Item Hand2;
var C_Item Rune;

func void pc_dark_magic_weapon_back()
{
	Info_ClearChoices (pc_dark_magic_weapon);
};

func void pc_dark_magic_weapon_hand1()
{
	Npc_RemoveInvItems (hero, itmi_beliarring2, 5);
	Npc_RemoveInvItems (hero, RUNE, 1);
	CreateInvItems (hero, HAND1, 1);
	Print (MAGIE_SUCCESS);
	Info_ClearChoices (pc_dark_magic_weapon);
};

func void pc_dark_magic_weapon_hand2()
{
	Npc_RemoveInvItems (hero, itmi_beliarring2, 5);
	Npc_RemoveInvItems (hero, RUNE, 1);
	CreateInvItems (hero, HAND2, 1);
	Print (MAGIE_SUCCESS);
	Info_ClearChoices (pc_dark_magic_weapon);
};

func void pc_dark_magic_weapon_choices()
{
	Info_AddChoice (pc_dark_magic_weapon, Dialog_Back, pc_dark_magic_weapon_back);
	Info_AddChoice (pc_dark_magic_weapon, "Zweihand", pc_dark_magic_weapon_hand2);
	Info_AddChoice (pc_dark_magic_weapon, "Einhand", pc_dark_magic_weapon_hand1);
};

func void pc_dark_magic_weapon_suck()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, ItRu_SuckEnergy) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItRu_SuckEnergy, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_Lebensspender, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_Lebensspender, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_dark_magic_weapon_zorn()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, ItRu_BeliarsRage) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItRu_BeliarsRage, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_BeliarsRache, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_BeliarsRache, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_dark_magic_weapon_undead()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, ItRu_HarmUndead) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItRu_HarmUndead, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_Bannklinge, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_Bannklinge, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_dark_magic_weapon_fire()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, itmi_feuerstein) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItMi_Feuerstein, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_Feuerklinge, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_Feuerklinge, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_dark_magic_weapon_water()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, itmi_wasserstein) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItMi_Wasserstein, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_Wasserklinge, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_Wasserklinge, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_dark_magic_weapon_sturm()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, itmi_sturmstein) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItMi_Sturmstein, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_Sturmklinge, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_Sturmklinge, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_dark_magic_weapon_shrink()
{
	Info_ClearChoices (pc_dark_magic_weapon);
	if ((Npc_HasItems (hero, itmi_beliarring2) > 4) && (Npc_HasItems (hero, ItRu_Shrink) > 0))
	{
		Npc_RemoveInvItems(hero, itmi_beliarring2, 5);
		Npc_RemoveInvItems(hero, ItRu_Shrink, 1);

		if (hero.HitChance[NPC_TALENT_1H] > hero.HitChance[NPC_TALENT_2H])
		{
			CreateInvItems	(hero, ItMw_1H_Schrumpfer, 1);
		}
		else
		{
			CreateInvItems	(hero, ItMw_2H_Schrumpfer, 1);
		};
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
	};
};

func void pc_itru_dragon_info()
{
	if ((Npc_HasItems (hero, ItAt_DragonScale) >= 1) && (Npc_HasItems (hero, ItAt_DragonBlood) >= 1) && (Npc_HasItems (hero, ItAt_DragonEgg_MIS) >= 1))
	{
		Npc_RemoveInvItems (hero, ItAt_DragonScale, 1);
		Npc_RemoveInvItems (hero, ItAt_DragonBlood, 1);
		Npc_RemoveInvItems (hero, ItAt_DragonEgg_MIS, 1);
		CreateInvItems (hero, itru_sumdragon, 1);
		Print (PRINT_RuneSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMi_RuneBlank, 1);
	};
	b_endproductiondialog ();
};
