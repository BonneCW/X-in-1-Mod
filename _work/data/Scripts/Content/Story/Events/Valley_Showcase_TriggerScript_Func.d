//VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC
var int VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime;
func void VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC ()
{
	if (VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime == FALSE)
	{
		B_GivePlayerXP (XP_Addon_WackelBaum);
		VALLEY_SHOWCASE_TRIGGERSCRIPT_FUNC_OneTime = TRUE;
	};
};


var int brand;
var int counter;
var int inportal;
var int sucht;
var int geheilt;
var int rueckfall;
var int drogensucht;
var int counter2;
var int kiffencheck;
var int willen;
var int clean;
var int brand2;
var int effekt_an;
var int effekt_einmal;
var int licht;
var int lichtschalter;

func void schleifescript_nw()
{
	SetGuild();

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		PC_SleepTime_Morning.nr = 1;
		PC_SleepTime_Noon.nr	= 2;
		PC_SleepTime_Evening.nr	= 3;
		PC_SleepTime_Midnight.nr = 4;
	}
	else
	{
		PC_SleepTime_Evening.nr	= 1;
		PC_SleepTime_Midnight.nr = 2;
		PC_SleepTime_Morning.nr = 3;
		PC_SleepTime_Noon.nr	= 4;
	};

	if (Mod_DGDH_OrcScout == 0)
	&& (Npc_IsDead(OrcScout_Reton))
	&& (Npc_KnowsInfo(hero, DIA_kdw_6019_reton_KapitelZwei))
	{
		Mod_DGDH_OrcScout = 1;

		B_LogEntry	(TOPIC_DGDH_ORCSCOUT, "Das wäre geschafft, der Ork ist hin. Reton wird zufrieden sein.");
	};

	BRAND = hero.attribute[ATR_HITPOINTS_MAX] / 4;
	BRAND2 = hero.attribute[ATR_HITPOINTS_MAX] / 10;
	COUNTER = COUNTER + 1;
	INPORTAL = FALSE;
	RUECKFALL = Hlp_Random (2300);
	if (FOLGEHELD == TRUE)
	{
		ICHKOMME = ICHKOMME + 1;
	};
	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		if (Wld_IsTime (04,55,05,00))
		{
			PrintScreen ("Bald geht die Sonne auf!", -1, 2, FONT_Screen, 2);
		};
		if (Wld_IsTime (20,00,20,05))
		{
			PrintScreen ("Die Sonne ist untergegangen!", -1, 2, FONT_Screen, 2);
		};
		if ((RUECKFALL <= 1) && (GEHEILT == TRUE))
		{
			GEHEILT = FALSE;
			SUCHT = 8;
		};
		if (SUCHT >= 40)
		{
			GEHEILT = TRUE;
			SUCHT = 0;
			HUNGER = FALSE;
		};
		if (GEHEILT == TRUE)
		{
			COUNTER = 0;
		};
		if (INPORTAL == FALSE)
		&& (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_HUT_02_IN") < 600)
		{
			INPORTAL = TRUE;
		};
		if (INPORTAL == FALSE)
		&& (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_HUT_02_IN") >= 800)
		&& ((Npc_IsPlayerInMyRoom (pub_55101_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55102_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55103_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55104_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55105_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55106_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55107_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55108_gam))
		|| (Npc_IsPlayerInMyRoom (pub_55109_gam)))
		{
			INPORTAL = TRUE;
		};
		//Print (IntToString(INPORTAL));

		if (Wld_IsTime (05,00,20,00) && (SCHUTZ1 == FALSE) && (SCHUTZ2 == FALSE) && (INPORTAL == FALSE) && (hero.attribute[ATR_HITPOINTS] >= 0))
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND;
			AI_PlayAni (self, "S_FIRE_VICTIM");
			Wld_PlayEffect ("VOB_MAGICBURN", hero, hero, 0, 0, 0, FALSE);
			AI_StopFX (self, "VOB_MAGICBURN");
			Npc_StopAni (self, "S_FIRE_VICTIM");
		};
		if ((COUNTER >= 370) && (COUNTER < 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Ich brauche Blut", -1, -1, FONT_Screen, 2);
			EFFEKT_AN = TRUE;
		};
		if ((EFFEKT_AN == TRUE) && (hero.aivar[AIV_INVINCIBLE] == FALSE) && (EFFEKT_EINMAL == FALSE))
		{
			Wld_StopEffect ("SLOW_TIME");
			Wld_PlayEffect ("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
			EFFEKT_EINMAL = TRUE;
		};
		if ((COUNTER >= 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Blut! Ich sterbe!", -1, -1, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND2;
			SUCHT = SUCHT + 1;
			HUNGER = TRUE;
		};
		if (BLOOD >= 1)
		{
			PrintScreen ("Mein Durst ist gelöscht!", -1, 2, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 15;
			BLOOD = 0;
			COUNTER = 0;
			SUCHT = 0;
			GEHEILT = FALSE;
			EFFEKT_AN = FALSE;
			EFFEKT_EINMAL = FALSE;
			Wld_StopEffect ("DEMENTOR_FX");
			HUNGER = FALSE;
		};
		if (VAMMA == TRUE)
		{
			if (Npc_HasItems (hero, itpo_blood) == 0)
			{
				AI_UnequipWeapons (hero);
			};
			Npc_RemoveInvItems (hero, itpo_blood, 1);
		};
		if ((Npc_GetDistToNpc (pc_ghost, hero) < 3000) && (GHOSTWEG == TRUE))
		{
			Npc_ChangeAttribute (hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
		};
		if (GHOSTER == TRUE)
		{
			B_RemoveNpc (pc_ghost);
			GHOSTER = FALSE;
		};
	};
	if (Wld_IsTime (20,30,22,00) || Wld_IsTime (04,00,05,30))
	{
		orcshaman_hof1.flags = 0;
	}
	else if (SCHUTZSCHICHT == FALSE)
	{
		orcshaman_hof1.flags = NPC_FLAG_IMMORTAL;
	};

	// Gildenkram entfernen, der nicht gebraucht wird, weil Gilde abgestellt wurde

	if (Mod_BN_An)
	{
		if (!BN_NW)
		{
			//BN_NW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(NONE_99001_FREMDER));
			MEMINT_RemoveVob(MEM_InstToPtr(SLD_40010_BEROX));
			MEMINT_RemoveVob(MEM_InstToPtr(VAM_BLADE));
			MEMINT_RemoveVob(MEM_InstToPtr(VAM_90107_CORTUS_NW));
			MEMINT_RemoveVob(MEM_InstToPtr(VAM_90108_DRUSUS_NW));
			MEMINT_RemoveVob(MEM_InstToPtr(VAM_90109_KIRA_NW));
			MEMINT_RemoveVob(MEM_InstToPtr(ANTROX));
		};
	};

	if (Mod_DGDH_An)
	{
		if (!DGDH_NW)
		{
			//DGDH_NW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(KDW_6019_reton));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6015_Marvin));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_60000_Nor));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6001_mythrilarbeiter));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6002_Mythrilarbeiter));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6003_Mythrilarbeiter));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6004_Mythrilarbeiter));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6006_Soeldner));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6007_Soeldner));
			MEMINT_RemoveVob(MEM_InstToPtr(vlk_6008_Soeldner));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6009_Soeldner));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6010_SCHAEFER));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6011_Waldwache));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6012_Waldwache));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6013_Soeldner));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6014_Soeldner));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6024_Deep));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6016_Copper));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6017_Akwyn));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6018_Jaeger));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6022_Vulnus));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6025_Henry));
			MEMINT_RemoveVob(MEM_InstToPtr(Vlk_6023_Aufseher));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6026_John));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_40001_LEA));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_45544_ARDOC));
		};
	};

	if (Mod_DM_An)
	{
		if (!DM_NW)
		{
			//DM_NW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(B5_9001_Drakash));
			MEMINT_RemoveVob(MEM_InstToPtr(B5_9000_Mage));
			MEMINT_RemoveVob(MEM_InstToPtr(B5_9002_Helmchen));
			MEMINT_RemoveVob(MEM_InstToPtr(Bad_9010_LAP));
			MEMINT_RemoveVob(MEM_InstToPtr(BAU_105_MAGIT));
		};
	};

	Wld_SendTrigger ("SCHLEIFE_NW");
};

func void schleifescriptow()
{
	SetGuild();

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		PC_SleepTime_Morning.nr = 1;
		PC_SleepTime_Noon.nr	= 2;
		PC_SleepTime_Evening.nr	= 3;
		PC_SleepTime_Midnight.nr = 4;
	}
	else
	{
		PC_SleepTime_Evening.nr	= 1;
		PC_SleepTime_Midnight.nr = 2;
		PC_SleepTime_Morning.nr = 3;
		PC_SleepTime_Noon.nr	= 4;
	};	

	if (Npc_HasItems(hero, ItMw_Orkschlaechter) == 1)
	&& (Mod_OrkschlaechterQuest == 0)
	{
		B_LogEntry	(TOPIC_DGDH_NORDMANN, "Der Geist hatte wirklich recht, eine der zurückgebliebenen Orkwachen trug die Waffe bei sich. Sie ist in der Tat ein Meisterwerk der Schmiedekunst. Ich bezweifle jedoch, dass es jemals wieder einem Schmied gelingen wird, eine solche Waffe herzustellen. Aber für meine Zwecke sollte sie ausreichen.");
		Log_SetTopicStatus	(TOPIC_DGDH_NORDMANN, LOG_SUCCESS);

		Mod_OrkschlaechterQuest = 1;
	};


	BRAND = hero.attribute[ATR_HITPOINTS_MAX] / 4;
	BRAND2 = hero.attribute[ATR_HITPOINTS_MAX] / 10;
	COUNTER = COUNTER + 1;
	INPORTAL = FALSE;
	RUECKFALL = Hlp_Random (2300);
	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		if ((RUECKFALL == 1) && (GEHEILT == TRUE))
		{
			GEHEILT = FALSE;
			SUCHT = 8;
		};
		if (Wld_IsTime (04,55,05,00))
		{
			PrintScreen ("Bald geht die Sonne auf!", -1, 2, FONT_Screen, 2);
		};
		if (SUCHT >= 40)
		{
			GEHEILT = TRUE;
			SUCHT = 0;
			HUNGER = FALSE;
		};
		if (Npc_IsPlayerInMyRoom (pub_55001_gam) || Npc_IsPlayerInMyRoom (pub_55002_gam) || Npc_IsPlayerInMyRoom (pub_55003_gam))
		{
			INPORTAL = TRUE;
		};
		if (Wld_IsTime (05,0,20,00) && (SCHUTZ1 == FALSE) && (SCHUTZ2 == FALSE) && (INPORTAL == FALSE) && (hero.attribute[ATR_HITPOINTS] >= 0))
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND;
			AI_PlayAni (self, "S_FIRE_VICTIM");
			Wld_PlayEffect ("VOB_MAGICBURN", hero, hero, 0, 0, 0, FALSE);
			AI_StopFX (self, "VOB_MAGICBURN");
			Npc_StopAni (self, "S_FIRE_VICTIM");
		};
		if ((COUNTER >= 370) && (COUNTER < 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Ich brauche Blut", -1, -1, FONT_Screen, 2);
			EFFEKT_AN = TRUE;
		};
		if ((EFFEKT_AN == TRUE) && (EFFEKT_EINMAL == FALSE) && (hero.aivar[AIV_INVINCIBLE] == FALSE))
		{
			Wld_StopEffect ("SLOW_TIME");
			Wld_PlayEffect ("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
			EFFEKT_EINMAL = TRUE;
		};
		if ((COUNTER >= 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Blut! Ich sterbe!", -1, -1, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND2;
			SUCHT = SUCHT + 1;
			HUNGER = TRUE;
		};
		if (BLOOD >= 1)
		{
			PrintScreen ("Mein Durst ist gelöscht!", -1, 2, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 15;
			BLOOD = 0;
			COUNTER = 0;
			SUCHT = 0;
			GEHEILT = FALSE;
			EFFEKT_AN = FALSE;
			EFFEKT_EINMAL = FALSE;
			Wld_StopEffect ("DEMENTOR_FX");
			HUNGER = FALSE;
		};
		if (Npc_GetDistToNpc (pc_ghost, hero) < 3000)
		{
			Npc_ChangeAttribute (hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
		};
		if (VAMMA == TRUE)
		{
			if (Npc_HasItems (hero, itpo_blood) == 0)
			{
				AI_UnequipWeapons (hero);
			};
			Npc_RemoveInvItems (hero, itpo_blood, 1);
		};
	};

	if (Mod_DM_An)
	{
		if (!DM_OW)
		{
			//DM_OW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(VLK_574_Mud));
			MEMINT_RemoveVob(MEM_InstToPtr(B5_90020_Helmchen_OW));
		};
	};

	if (Mod_DGDH_An)
	{
		if (!DGDH_OW)
		{
			//DGDH_OW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6020_Oviedo));
			MEMINT_RemoveVob(MEM_InstToPtr(VLK_6021_Aeron));
		};
	};

	Wld_SendTrigger ("SCHLEIFEOW");
};

func void schleifescriptaddon()
{
	SetGuild();

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		PC_SleepTime_Morning.nr = 1;
		PC_SleepTime_Noon.nr	= 2;
		PC_SleepTime_Evening.nr	= 3;
		PC_SleepTime_Midnight.nr = 4;
	}
	else
	{
		PC_SleepTime_Evening.nr	= 1;
		PC_SleepTime_Midnight.nr = 2;
		PC_SleepTime_Morning.nr = 3;
		PC_SleepTime_Noon.nr	= 4;
	};

	BRAND = hero.attribute[ATR_HITPOINTS_MAX] / 4;
	BRAND2 = hero.attribute[ATR_HITPOINTS_MAX] / 10;
	COUNTER = COUNTER + 1;
	INPORTAL = FALSE;
	RUECKFALL = Hlp_Random (2300);
	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		if (Wld_IsTime (04,55,05,00))
		{
			PrintScreen ("Bald geht die Sonne auf!", -1, 2, FONT_Screen, 2);
		};
		if ((RUECKFALL == 1) && (GEHEILT == TRUE))
		{
			GEHEILT = FALSE;
			SUCHT = 8;
		};
		if (SUCHT >= 40)
		{
			GEHEILT = TRUE;
			SUCHT = 0;
			HUNGER = FALSE;
		};
		if (Npc_IsPlayerInMyRoom (pub_55201_gam) || Npc_IsPlayerInMyRoom (pub_55202_gam))
		{
			INPORTAL = TRUE;
		};
		if (Wld_IsTime (05,00,20,00) && (SCHUTZ1 == FALSE) && (SCHUTZ2 == FALSE) && (INPORTAL == FALSE) && (hero.attribute[ATR_HITPOINTS] >= 0))
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND;
			AI_PlayAni (self, "S_FIRE_VICTIM");
			Wld_PlayEffect ("VOB_MAGICBURN", hero, hero, 0, 0, 0, FALSE);
			AI_StopFX (self, "VOB_MAGICBURN");
			Npc_StopAni (self, "S_FIRE_VICTIM");
		};
		if ((COUNTER >= 370) && (COUNTER < 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Ich brauche Blut", -1, -1, FONT_Screen, 2);
			EFFEKT_AN = TRUE;
		};
		if ((EFFEKT_AN == TRUE) && (EFFEKT_EINMAL == FALSE) && (hero.aivar[AIV_INVINCIBLE] == FALSE))
		{
			Wld_StopEffect ("SLOW_TIME");
			Wld_PlayEffect ("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
			EFFEKT_EINMAL = TRUE;
		};
		if ((COUNTER >= 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Blut! Ich sterbe!", -1, -1, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND2;
			SUCHT = SUCHT + 1;
			HUNGER = TRUE;
		};
		if (BLOOD >= 1)
		{
			PrintScreen ("Mein Durst ist gelöscht!", -1, 2, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 15;
			BLOOD = 0;
			COUNTER = 0;
			SUCHT = 0;
			GEHEILT = FALSE;
			EFFEKT_AN = FALSE;
			EFFEKT_EINMAL = FALSE;
			Wld_StopEffect ("DEMENTOR_FX");
			HUNGER = FALSE;
		};
		if (VAMMA == TRUE)
		{
			if (Npc_HasItems (hero, itpo_blood) == 0)
			{
				AI_UnequipWeapons (hero);
			};
			Npc_RemoveInvItems (hero, itpo_blood, 1);
		};
		if (Npc_GetDistToNpc (pc_ghost, hero) < 3000)
		{
			Npc_ChangeAttribute (hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
		};
		if ((JEMAND_DA == FALSE) && (Npc_GetDistToWP (NONE_ADDON_115_Eremit, "BL_INN_04") < 1000))
		{
			JEMAND_DA = TRUE;
			Npc_ExchangeRoutine (NONE_ADDON_115_Eremit, "LAGER_2");
		};
		if ((JEMAND_DA == FALSE) && (Npc_GetDistToWP (vam_90101_cortus, "BL_INN_04") < 1000))
		{
			JEMAND_DA = TRUE;
			Npc_ExchangeRoutine (vam_90101_cortus, "LAGER_2");
		};
		if ((INPORTAL == FALSE) && (EREMIT_ERWACHT == TRUE) && (EREMIT_IST_DA == FALSE) && Wld_IsTime (5, 0, 20, 0))
		{
			NONE_ADDON_115_Eremit.attribute[ATR_HITPOINTS] = NONE_ADDON_115_Eremit.attribute[ATR_HITPOINTS] - BRAND;
			Wld_PlayEffect ("VOB_MAGICBURN", NONE_ADDON_115_Eremit, NONE_ADDON_115_Eremit, 0, 0, 0, FALSE);
			AI_StopFX (self, "VOB_MAGICBURN");
		};
	};

	// Gildenkram entfernen, der nicht gebraucht wird, weil Gilde abgestellt wurde

	if (Mod_BN_An)
	{
		if (!BN_AW)
		{
			//BN_AW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(VAM_90101_CORTUS));
			MEMINT_RemoveVob(MEM_InstToPtr(VAM_90102_DRUSUS));
			MEMINT_RemoveVob(MEM_InstToPtr(VAM_90103_KIRA));
		};
	};

	if (Mod_DM_An)
	{
		if (!DM_AW)
		{
			//DM_AW = TRUE;

			MEMINT_RemoveVob(MEM_InstToPtr(B5_90010_Drakash_AW));
		};
	};

	Wld_SendTrigger ("SCHLEIFEADDON");
};


var int werta;

var float verzoegerung;
var float werta_float;

var int helper;

var float waittime;

func void bugschleife_adw()
{
	SetGuild();

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		PC_SleepTime_Morning.nr = 1;
		PC_SleepTime_Noon.nr	= 2;
		PC_SleepTime_Evening.nr	= 3;
		PC_SleepTime_Midnight.nr = 4;
	}
	else
	{
		PC_SleepTime_Evening.nr	= 1;
		PC_SleepTime_Midnight.nr = 2;
		PC_SleepTime_Morning.nr = 3;
		PC_SleepTime_Noon.nr	= 4;
	};

	if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (bugqueen)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (killerbug)))
	{
		HELPER = Hlp_Random (3);
		if (HELPER == 0)
		{
			waittime = 0.2;
		}
		else if (HELPER == 1)
		{
			waittime = 0.4;
		}
		else if (HELPER == 2)
		{
			waittime = 0.6;
		}
		else
		{
			waittime = 0.8;
		};
		if (Npc_GetDistToNpc (self, other) < 35)
		{
			AI_Wait (self, waittime);
			other.attribute[ATR_HITPOINTS] -= 8;
			B_Say (other, self, "$Aargh_1");
		};
	};
	if ((Npc_GetDistToWP (NONE_ADDON_115_Eremit, "ADW_VAPIR_00") < 1000) && (EREMIT_ERWACHT == TRUE) && (Npc_IsDead (NONE_ADDON_115_Eremit) == FALSE))
	{
		Npc_ExchangeRoutine (NONE_ADDON_115_Eremit, "VAMPIR");
		Npc_ExchangeRoutine (vam_90102_drusus, "EREMIT");
		EREMIT_IST_DA = TRUE;
	};
	Wld_SendTrigger ("BUGSCHLEIFE");
};

func void schleifescriptdi()
{
	SetGuild();

	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		PC_SleepTime_Morning.nr = 1;
		PC_SleepTime_Noon.nr	= 2;
		PC_SleepTime_Evening.nr	= 3;
		PC_SleepTime_Midnight.nr = 4;
	}
	else
	{
		PC_SleepTime_Evening.nr	= 1;
		PC_SleepTime_Midnight.nr = 2;
		PC_SleepTime_Morning.nr = 3;
		PC_SleepTime_Noon.nr	= 4;
	};

	BRAND = hero.attribute[ATR_HITPOINTS_MAX] / 4;
	BRAND2 = hero.attribute[ATR_HITPOINTS_MAX] / 10;
	COUNTER = COUNTER + 1;
	INPORTAL = FALSE;
	RUECKFALL = Hlp_Random (2300);
	if (SC_IST_EIN_VAMPIR == TRUE)
	{
		if ((RUECKFALL == 1) && (GEHEILT == TRUE))
		{
			GEHEILT = FALSE;
			SUCHT = 8;
		};
		if (SUCHT >= 40)
		{
			GEHEILT = TRUE;
			SUCHT = 0;
			HUNGER = FALSE;
		};
		if ((COUNTER >= 370) && (COUNTER < 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Ich brauche Blut", -1, -1, FONT_Screen, 2);
			EFFEKT_AN = TRUE;
		};
		if ((EFFEKT_AN == TRUE) && (EFFEKT_EINMAL == FALSE) && (hero.aivar[AIV_INVINCIBLE] == FALSE))
		{
			Wld_StopEffect ("SLOW_TIME");
			Wld_PlayEffect ("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
			EFFEKT_EINMAL = TRUE;
		};
		if ((COUNTER >= 400) && (GEHEILT == FALSE))
		{
			PrintScreen ("Blut! Ich sterbe!", -1, -1, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] - BRAND2;
			SUCHT = SUCHT + 1;
			HUNGER = TRUE;
		};
		if (BLOOD >= 1)
		{
			PrintScreen ("Mein Durst ist gelöscht!", -1, 2, FONT_Screen, 2);
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + 15;
			BLOOD = 0;
			COUNTER = 0;
			SUCHT = 0;
			GEHEILT = FALSE;
			EFFEKT_AN = FALSE;
			EFFEKT_EINMAL = FALSE;
			Wld_StopEffect ("DEMENTOR_FX");
			HUNGER = FALSE;
		};
		if (Npc_GetDistToNpc (pc_ghost, hero) < 3000)
		{
			Npc_ChangeAttribute (hero, ATR_HITPOINTS, -hero.attribute[ATR_HITPOINTS_MAX]);
		};
		if (VAMMA == TRUE)
		{
			if (Npc_HasItems (hero, itpo_blood) == 0)
			{
				AI_UnequipWeapons (hero);
			};
			Npc_RemoveInvItems (hero, itpo_blood, 1);
		};
	};
	Wld_SendTrigger ("SCHLEIFEDI");
};
