var int Erzwaffen;
var int Normalwaffen;


//*******************************************************
//	SmithWeapon Dialog abbrechen
//*******************************************************
INSTANCE PC_SmithWeapon_End (C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_SmithWeapon_End_Condition;
	information		= PC_SmithWeapon_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE; 
};

FUNC INT PC_SmithWeapon_End_Condition ()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (Erzwaffen == FALSE)
	&& (NormalWaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_SmithWeapon_End_Info()
{
	CreateInvItems (self, ItMiSwordRaw,1);
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
	NormalWaffen = FALSE;
};
//*******************************************************


// *****************
// Amboß-Dialoge
// -------------
// hängen am Spieler
// *****************


//*******************************************************
INSTANCE PC_Common (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Common_Condition;
	information		= PC_Common_Info;
	permanent		= TRUE;
	description		= "Gewöhnliche Waffen schmieden";
};

FUNC INT PC_Common_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Common_Info ()
{
	Normalwaffen = TRUE;
};
//*******************************************************
INSTANCE PC_Ore (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_Ore_Condition;
	information		= PC_Ore_Info;
	permanent		= TRUE;
	description		= "Erzwaffen schmieden";
};

FUNC INT PC_Ore_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_Ore_Info ()
{
	Erzwaffen = TRUE;
};
//*******************************************************
INSTANCE PC_CommonBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_CommonBACK_Condition;
	information		= PC_CommonBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_CommonBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == TRUE)
	&& (Erzwaffen == FALSE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_CommonBACK_Info ()
{
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_OreBACK (C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_OreBACK_Condition;
	information		= PC_OreBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};
FUNC INT PC_OreBACK_Condition()
{	
	if(PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_OreBACK_Info ()
{
	Erzwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_ItMw_1H_Common (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Common_Condition;
	information		= PC_ItMw_1H_Common_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Common_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	&& (Normalwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Common_Info ()
{
	CreateInvItems 	    (hero, ItMw_1H_Common_01,  1); 
	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_01_Condition;
	information		= PC_WEAPON_1H_Harad_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	&& (Normalwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_01_Info ()
{
	CreateInvItems 	    (hero,ItMw_Schwert1 ,  1); 
	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_02_Condition;
	information		= PC_WEAPON_1H_Harad_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	&& (Normalwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_02_Info ()
{
	CreateInvItems 	    (hero,ItMw_Schwert4 ,  1); 
	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_03_Condition;
	information		= PC_WEAPON_1H_Harad_03_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	&& (Normalwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_03_Info ()
{
	CreateInvItems 	    (hero,ItMw_Rubinklinge ,  1); 
	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_WEAPON_1H_Harad_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_WEAPON_1H_Harad_04_Condition;
	information		= PC_WEAPON_1H_Harad_04_Info;
	permanent		= TRUE;
};

FUNC INT PC_WEAPON_1H_Harad_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE))
	&& (Normalwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_WEAPON_1H_Harad_04_Info ()
{
	CreateInvItems 	    (hero,ItMw_ElBastardo ,  1); 
	Print (PRINT_SmithSuccess);
	
	B_ENDPRODUCTIONDIALOG ();
	Normalwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_1H_Special_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_01_Condition;
	information		= PC_ItMw_1H_Special_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Special_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_01_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 1)
	{
		Npc_RemoveInvItems (hero, ItMi_Nugget, 1);
		
		CreateInvItems 	   (hero, ItMw_1H_Special_01,1); 
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_01 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_01_Condition;
	information		= PC_ItMw_2H_Special_01_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_2H_Special_01_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_01_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,2);
		
		CreateInvItems 	    (hero,ItMw_2H_Special_01,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_1H_Special_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_02_Condition;
	information		= PC_ItMw_1H_Special_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Special_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_02_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,2);
		
		CreateInvItems 	   (hero,ItMw_1H_Special_02,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_02 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_02_Condition;
	information		= PC_ItMw_2H_Special_02_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_2H_Special_02_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_02_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,3);
		
		CreateInvItems 	    (hero,ItMw_2H_Special_02,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************
INSTANCE PC_ItMw_1H_Special_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_03_Condition;
	information		= PC_ItMw_1H_Special_03_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Special_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_03_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,3);
		
		CreateInvItems 	   (hero,ItMw_1H_Special_03,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_03 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_03_Condition;
	information		= PC_ItMw_2H_Special_03_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_2H_Special_03_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_03_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 4)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,4);
		
		CreateInvItems 	    (hero,ItMw_2H_Special_03,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_1H_Special_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_1H_Special_04_Condition;
	information		= PC_ItMw_1H_Special_04_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_1H_Special_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_1H_Special_04_Info ()
{
	if (Npc_HasItems (hero, ItMi_Nugget) >= 4)
	&& (Npc_HasItems (hero, ItAt_DragonBlood) >= 5)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,4);
		Npc_RemoveInvItems  (hero,ItAt_DragonBlood,5);
		
		CreateInvItems 	   (hero,ItMw_1H_Special_04,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};
//*******************************************************

INSTANCE PC_ItMw_2H_Special_04 (C_INFO)
{
	npc				= PC_Hero;
	condition		= PC_ItMw_2H_Special_04_Condition;
	information		= PC_ItMw_2H_Special_04_Info;
	permanent		= TRUE;
};

FUNC INT PC_ItMw_2H_Special_04_Condition()
{	
	if((PLAYER_MOBSI_PRODUCTION	==	MOBSI_SMITHWEAPON) 
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE))
	&& (Erzwaffen == TRUE)
	{	
		return TRUE;
	};
};

FUNC VOID PC_ItMw_2H_Special_04_Info ()
{
	if (Npc_HasItems  (hero, ItMi_Nugget) >= 5)
	&& (Npc_HasItems  (hero, ItAt_DragonBlood) >= 5)
	{
		Npc_RemoveInvItems  (hero,ItMi_Nugget,5);
		Npc_RemoveInvItems  (hero,ItAt_DragonBlood,5);
		
		CreateInvItems 	   (hero,ItMw_2H_Special_04,1); 
		Print (PRINT_SmithSuccess);
	}
	else 
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordRaw,1);
	};	
	B_ENDPRODUCTIONDIALOG ();
	Erzwaffen = FALSE;
};


instance PC_ITMW_VAMPIRSCHWERT(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_vampirschwert_condition;
	information = pc_itmw_vampirschwert_info;
	permanent = TRUE;
};


func int pc_itmw_vampirschwert_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SC_CAN_VAMPIRKLINGE == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_vampirschwert_info()
{
	if ((Npc_HasItems (hero, ItMi_Nugget) >= 1) && (Npc_HasItems (hero, itpo_blood) >= 3) && (Npc_HasItems (hero, ItMiSwordrawhot) >= 1))
	{
		Npc_RemoveInvItems (hero, ItMi_Nugget, 1);
		Npc_RemoveInvItems (hero, itpo_blood, 3);
		Npc_RemoveInvItems (hero, ItMiSwordrawhot, 1);
		CreateInvItems (hero, itmw_vampirschwert, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordraw, 1);
	};
	b_endproductiondialog ();
	Erzwaffen = FALSE;
};


instance PC_ITMW_1H_BLUTDEGEN(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_1h_blutdegen_condition;
	information = pc_itmw_1h_blutdegen_info;
	permanent = TRUE;
};


func int pc_itmw_1h_blutdegen_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SC_CAN_VAMPIRSCHWERT == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_blutdegen_info()
{
	if (Npc_HasItems (hero, itpo_blood) >= 2)
	{
		Npc_RemoveInvItems (hero, itpo_blood, 2);
		CreateInvItems (hero, itmw_1h_blutdegen, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordraw, 1);
	};
	b_endproductiondialog ();
	Erzwaffen = FALSE;
};


instance PC_ITMW_1H_BLUTSCHWERT(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_1h_blutschwert_condition;
	information = pc_itmw_1h_blutschwert_info;
	permanent = TRUE;
};


func int pc_itmw_1h_blutschwert_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SC_CAN_VAMPIRSCHWERT == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_blutschwert_info()
{
	if (Npc_HasItems (hero, itpo_blood) >= 2)
	{
		Npc_RemoveInvItems (hero, itpo_blood, 2);
		CreateInvItems (hero, itmw_1h_blutschwert, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordraw, 1);
	};
	b_endproductiondialog ();
	Erzwaffen = FALSE;
};


instance PC_ITMW_2H_TIMESWORD(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_2h_timesword_condition;
	information = pc_itmw_2h_timesword_info;
	permanent = TRUE;
};


func int pc_itmw_2h_timesword_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SC_CAN_TIMESWORDSTAHL == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_timesword_info()
{
	if ((Npc_HasItems (hero, ItMi_Zeitspalt_Addon) >= 5) && (Npc_HasItems (hero, itpo_ueberzug) >= 1))
	{
		Npc_RemoveInvItems (hero, ItMi_Zeitspalt_Addon, 5);
		Npc_RemoveInvItems (hero, itpo_ueberzug, 1);
		CreateInvItems (hero, itmw_2h_timesword, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordraw, 1);
	};
	b_endproductiondialog ();
	Erzwaffen = FALSE;
};


instance PC_ITMW_1H_TIMESWORD(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_1h_timesword_condition;
	information = pc_itmw_1h_timesword_info;
	permanent = TRUE;
};


func int pc_itmw_1h_timesword_condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SC_CAN_TIMESWORDSTAHL == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_timesword_info()
{
	if ((Npc_HasItems (hero, ItMi_Zeitspalt_Addon) >= 4) && (Npc_HasItems (hero, itpo_ueberzug) >= 1))
	{
		Npc_RemoveInvItems (hero, ItMi_Zeitspalt_Addon, 4);
		Npc_RemoveInvItems (hero, itpo_ueberzug, 1);
		CreateInvItems (hero, itmw_1h_timesword, 1);
		Print (PRINT_SmithSuccess);
	}
	else
	{
		Print (PRINT_ProdItemsMissing);
		CreateInvItems (self, ItMiSwordraw, 1);
	};
	b_endproductiondialog ();
	Erzwaffen = FALSE;
};
//*******************************************************

// ****************************************************
// SMITHWEAPON_S1
// --------------
// Funktion wird durch Amboß-Mobsi-Benutzung aufgerufen!
// benötigtes Item dafür: ItMiSwordrawhot
// *****************************************************

FUNC VOID SMITHWEAPON_S1 ()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
		
	if  (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))
	{	
		self.aivar[AIV_INVINCIBLE]=TRUE;
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_SMITHWEAPON;
		Ai_ProcessInfos (her);
	};

	PC_ItMw_1H_Common.description			= NAME_ItMw_1H_Common_01;                                            
	PC_ItMw_1H_Special_01.description		= ConcatStrings (NAME_ItMw_1H_Special_01, PRINT_Smith_1H_Special_01);
	PC_ItMw_2H_Special_01.description		= ConcatStrings (NAME_ItMw_2H_Special_01, PRINT_Smith_2H_Special_01);
	PC_ItMw_1H_Special_02.description		= ConcatStrings (NAME_ItMw_1H_Special_02, PRINT_Smith_1H_Special_02);
	PC_ItMw_2H_Special_02.description		= ConcatStrings (NAME_ItMw_2H_Special_02, PRINT_Smith_2H_Special_02);
	PC_ItMw_1H_Special_03.description		= ConcatStrings (NAME_ItMw_1H_Special_03, PRINT_Smith_1H_Special_03);
	PC_ItMw_2H_Special_03.description		= ConcatStrings (NAME_ItMw_2H_Special_03, PRINT_Smith_2H_Special_03);
	PC_ItMw_1H_Special_04.description		= ConcatStrings (NAME_ItMw_1H_Special_04, PRINT_Smith_1H_Special_04);
	PC_ItMw_2H_Special_04.description		= ConcatStrings (NAME_ItMw_2H_Special_04, PRINT_Smith_2H_Special_04);
	
	PC_WEAPON_1H_Harad_01.description		= NAME_Addon_Harad_01;
	PC_WEAPON_1H_Harad_02.description		= NAME_Addon_Harad_02;
	PC_WEAPON_1H_Harad_03.description		= NAME_Addon_Harad_03;
	PC_WEAPON_1H_Harad_04.description		= NAME_Addon_Harad_04;
	pc_itmw_vampirschwert.description = "Vampirschwert (1 Erzbrocken, 3 Blut, 2 Stahl)";
	pc_itmw_1h_blutdegen.description = "Blutdegen (2 Blut)";
	pc_itmw_1h_blutschwert.description = "Blutschwert (2 Blut)";
	pc_itmw_2h_timesword.description = "Zeitschwert 2h-Variante (5 Erzbrocken, 1 Überzug)";
	pc_itmw_1h_timesword.description = "Zeitschwert 1h-Variante (4 Erzbrocken, 1 Überzug)";
}; 

