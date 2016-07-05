// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgeführt
// wird auch vom Spieler ausgeführt
// *****************************************
var int D_Level;
var int D_EXP;
var int D_EXP_NEXT;
var int D_lp;
var int d_hp;
var int D_FiveCounter;

func void Give_DOG_XP (var int ADD_XP)
{
	if (D_level == 0)
	{
		d_EXP_NEXT =500;
	};

	d_EXP = D_EXP + ADD_XP;
	
	if(D_EXP >= D_EXP_NEXT )
	{
		D_LEVEL =D_LEVEL +1;
		D_EXP_NEXT = D_EXP_NEXT +((D_LEVEL+1)*250);
		D_LP =D_LP + 15;

		if (d_iq >=50)
		{
			d_lp += 1;
		};

		PrintScreen ("Draco hat sich verbessert!", -1, 9, FONT_Screen, 2);	

		dog.attribute[ATR_HITPOINTS_MAX] = dog.attribute[ATR_HITPOINTS_MAX] + 10;
		dog.attribute[ATR_HITPOINTS] = dog.attribute[ATR_HITPOINTS] + 10;
		dog_ow.attribute[ATR_HITPOINTS_MAX] = dog_ow.attribute[ATR_HITPOINTS_MAX] + 10;
		dog_ow.attribute[ATR_HITPOINTS] = dog_ow.attribute[ATR_HITPOINTS] + 10;
		dog_di.attribute[ATR_HITPOINTS_MAX] = dog_di.attribute[ATR_HITPOINTS_MAX] + 10;
		dog_di.attribute[ATR_HITPOINTS] = dog_di.attribute[ATR_HITPOINTS] + 10;
		dog_addon.attribute[ATR_HITPOINTS_MAX] = dog_addon.attribute[ATR_HITPOINTS_MAX] + 10;
		dog_addon.attribute[ATR_HITPOINTS] = dog_addon.attribute[ATR_HITPOINTS] + 10;
		
		D_FiveCounter += 1;

		if (D_FiveCounter == 5)
		{
			D_RST_blunt += 5;
			D_RST_edge += 5;
			D_RST_point += 5;
			D_RST_magic += 5;
			D_RST_fire += 5;
			D_RST_fly += 5;

			D_FiveCounter = 0;
		};

		D_HP = D_HP + 10;			
		Snd_Play ("LevelUp");
	};
};

INSTANCE ItMi_Alarmhorn (C_Item)
{
	name 				=	"Horn";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Shell_02.3ds";
	material 			=	MAT_WOOD;

	scemeName			=	"POTIONFAST";
	on_state[0]			= 	Use_Alarmhorn;
	description			= 	"Horn";
	TEXT[0]				= 	"Kann Draco rufen und beruhigen";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void teledog (var C_NPC DOGGE)
{
	var string WP_DOG;
	Snd_Play ("");
	WP_DOG=Npc_GetNearestWP(hero);

	if (Npc_IsDead(dogge))
	{
		Wld_InsertNpc	(dogge, WP_DOG);
	}
	else
	{
		AI_Teleport(dogge, WP_DOG);
	};
};

func void Use_Alarmhorn()
{
	Snd_Play ("Inst_Alarm");

	/*if (Npc_GetAttitude (dog, hero) == ATT_HOSTILE)
	{
		Npc_SetTempAttitude(dog, Wld_GetGuildAttitude(dog.guild, hero.guild));
	};

	if (Npc_GetAttitude (dog_ow, hero) == ATT_HOSTILE)
	{
		Npc_SetTempAttitude(dog_ow, Wld_GetGuildAttitude(dog_ow.guild, hero.guild));
	};

	if (Npc_GetAttitude (dog_addon, hero) == ATT_HOSTILE)
	{
		Npc_SetTempAttitude(dog_addon, Wld_GetGuildAttitude(dog_addon.guild, hero.guild));
	};

	if (Npc_GetAttitude (dog_di, hero) == ATT_HOSTILE)
	{
		Npc_SetTempAttitude(dog_di, Wld_GetGuildAttitude(dog_di.guild, hero.guild));
	};*/

	Npc_ClearAIQueue 			(dog);
	Npc_ClearAIQueue 			(dog_addon);
	Npc_ClearAIQueue 			(dog_ow);
	Npc_ClearAIQueue 			(dog_di);
	AI_StartState		(dog, ZS_dog, 0, "");
	AI_StartState		(dog_addon, ZS_dog, 0, "");
	AI_StartState		(dog_ow, ZS_dog, 0, "");
	AI_StartState		(dog_di, ZS_dog, 0, "");

	CreateInvItem (hero,ItMi_alarmhorn);

	if (Npc_GetDistToNpc (hero, dog) > 1000)
	&& (Currentlevel == NEWWORLD_ZEN)
	&& (DOG_DEAD == FALSE)
	{
		TELEDOG(DOG);
	};
	
	if (Npc_GetDistToNpc (hero, dog_ADDON) > 1000)
	&& (Currentlevel == ADDONWORLD_ZEN)
	&& (DOG_DEAD == FALSE)
	{
		teledog(DOG_ADDON);
	};	

	if (Npc_GetDistToNpc (hero, dog_OW) > 1000)
	&& (Currentlevel == OLDWORLD_ZEN)
	&& (DOG_DEAD == FALSE)
	{
		teledog(DOG_OW);
	};

	if (Npc_GetDistToNpc (hero, dog_DI) > 1000)
	&& (Currentlevel == DRAGONISLAND_ZEN)
	&& (DOG_DEAD == FALSE)
	{
		teledog(DOG_DI);
	};

};

func void ZS_Dead ()
{	
	if (self.aivar[AIV_Partymember] == TRUE)
	&& (self.guild > GIL_SEPERATOR_HUM)
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DOG))
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DOG_OW))
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DOG_DI))
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(DOG_ADDON))
	&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector))
	{
		Summoned_Monster -= 1;

		if (Summoned_Monster < 0)
		{
			Summoned_Monster = 0;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1000_VerfaulterZombie))
	{
		Wld_InsertNpc	(Mod_1001_NordmannGeist, "DT_E1_07");
	};

	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_ClearRuneInv(self);
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);	
		
		if (dog_follow==TRUE) 
		&& ((Npc_GetDistToNpc(hero, dog) < 3000)||(Npc_GetDistToNpc(hero, dog_OW) < 3000)||(Npc_GetDistToNpc(hero, dog_ADDON) < 3000)||(Npc_GetDistToNpc(hero, dog_DI) < 3000))
		{
		Give_DOG_XP(self.level * XP_PER_VICTORY);
		};	
	
		self.aivar[AIV_VictoryXPGiven] = TRUE;
		KILLACCOUNT = KILLACCOUNT + 1;
		if ((KILLACCOUNT == 6) && (Npc_HasItems (hero, itru_soul) >= 1))
		{
			Snd_Play ("MFX_MASSDEATH_CAST");
			Wld_PlayEffect ("spellFX_INCOVATION_RED", hero, hero, 0, 0, 0, FALSE);
			Wld_PlayEffect ("FX_EarthQuake", hero, hero, 0, 0, 0, FALSE);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DOG))
	 || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DOG_OW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DOG_DI))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DOG_ADDON))
	{
	DOG_DEAD = TRUE;
	};

	if (SC_IST_EIN_VAMPIR == FALSE)
	{
		Npc_RemoveInvItems	(self, ItPo_Blood, 1000);
	};
	
	// ------ Greg ------
	if C_IAmCanyonRazor (self) == TRUE
	{
		CanyonRazorBodyCount = CanyonRazorBodyCount +1;
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			B_CountCanyonRazor ();
		};
	};
	
	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);
		};
	};
	
	// ------ DiegoOW ------
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DiegoOW))
	{
		Diego_IsDead = TRUE;
	};
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (vam_blade))
	{
		B_RemoveNpc (VLK_419_Buerger);
		B_RemoveNpc (vlk_40001_lea);
		B_RemoveNpc (sld_40010_berox);
		B_RemoveNpc (bau_40005_dimitri);
	};
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (orcshaman_hof1))
	{
		SCHUTZSCHICHT = TRUE;
		orcshaman_hof2.flags = 0;
		orcshaman_hof3.flags = 0;
		orcwarrior_giant.flags = 0;
	};
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (pc_ghost))
	{
		GHOSTISDEAD = TRUE;
		if (GHOSTWEG == FALSE)
		{
			Npc_ChangeAttribute (other, ATR_HITPOINTS, -other.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	
	if (Npc_IsPlayer(other))
	{
		self.aivar[AIV_KilledByPlayer] = TRUE;
		
		// ------ STORY ------
		
		// ------ Dunkle Seite der Macht -------
		
		if (C_DropUnconscious())
			{
				MadKillerCount = (MadKillerCount + 1); 
			};		
		
		// ------ Fester------
		if (self.guild == GIL_GIANT_BUG)
		&& (MIS_Fester_KillBugs == LOG_RUNNING)
		{
			Festers_Giant_Bug_Killed = Festers_Giant_Bug_Killed + 1;
		};
		// ----- Alligator Jack -----
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Swamprat) 
		&& (MIS_KrokoJagd == LOG_Running)
		{
			AlligatorJack_KrokosKilled = AlligatorJack_KrokosKilled +1;
		};
		if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo1)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo2)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo3)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo4)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo5)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo6)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo7)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo8)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo9)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (meatbug_pablo10)))
		{
			MEATBUGHUNTER = MEATBUGHUNTER + 1;
		};
		if ((Hlp_GetInstanceID (self) == Hlp_GetInstanceID (bodo_wisp_1)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (bodo_wisp_2)) || (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (bodo_wisp_3)))
		{
			BODOCOUNT = BODOCOUNT + 1;
		};
		
		
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Ramon) 
		{
			Player_HasTalkedToBanditCamp = TRUE;
		};
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Franco)
		{
			if  (MIS_HlpLogan == LOG_RUNNING)
			{
				MIS_HlpLogan = LOG_OBSOLETE;
			}; 
			if  (MIS_HlpEdgor == LOG_RUNNING)
			{
				MIS_HlpEdgor = LOG_OBSOLETE;
			};
		};
		if Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Fortuno)
		{
			Log_SetTopicStatus (Topic_Addon_Fortuno,LOG_OBSOLETE);
		};
	};
		
		//------Addon Garaz Minecrawler Höhle------egal wer tötet----
		if  Hlp_GetInstanceID (self) == Hlp_GetInstanceID (Goldminecrawler)
		{
			if (Minecrawler_Killed >= 9)
			&& (Bloodwyn_Spawn == FALSE)
			{	
				AI_Teleport (Bloodwyn,"ADW_MINE_TO_MC_03");
				B_StartOtherRoutine (Bloodwyn,"MINE");
				B_GivePlayerXP (XP_Addon_Bloodywyn);
				Bloodwyn_Spawn = TRUE;
			}
			else
			{
				Minecrawler_Killed = (Minecrawler_Killed + 1);
			
			};
		};
		
	// ------ weil sonst Händler bevor man zum ersten Mal TRADE gewählt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abhängig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen können nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;
	
	// ------ Feuerkrieger-Spawn ------
	if (self.aivar[AIV_WasDead] != 1)
	  {
	    if (self.guild == GIL_BAD) && (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	      {
		Feuerkrieger = Feuerkrieger - 1;
	      }
	    else if ((self.guild < GIL_SEPERATOR_HUM) || (self.guild > GIL_SEPERATOR_ORC))
	      { 
		if ((CurrentLevel == DRAGONISLAND_ZEN) && Seelen && (Npc_GetDistToNpc(self, hero) < 5000) && (Feuerkrieger < 7)) //nicht mehr als 7 Feuerkrieger
		  {
		    Wld_SpawnNpcRange(self, Bad_Feuerkrieger, 1, 10);
		    Feuerkrieger = Feuerkrieger + 1;
		  };
	      };
	    self.aivar[AIV_WasDead] = 1;
	  };

	if (self.aivar[AIV_MM_REAL_ID] == 7007)
	{
		if (hero.guild < GIL_SEPERATOR_HUM)
		{
			B_GiveInvItems (self, hero, itar_ancient_addon, 1);
			AI_EquipArmor (hero, itar_ancient_addon);
		}
		else
		{
			Npc_RemoveInvItem (self, itar_ancient_addon);
			Wld_InsertItem (itar_ancient_addon, Npc_GetNearestWP (self));
		};
		Mdl_SetVisualBody (self, "Ske_Body2", DEFAULT, DEFAULT, "", DEFAULT, DEFAULT, -1);
		Mdl_SetModelFatness (self, 13);
		self.name[0] = "antikes Skelett";
	};

	if (SC_IST_EIN_VAMPIR == FALSE)
	{
		Npc_RemoveInvItems	(self, ItPo_Blood, 1000);
	}
	else
	{
		if (Npc_HasItems(self, ItPo_Blood) > 2)
		{
			Npc_RemoveInvItems	(self, ItPo_Blood, Npc_HasItems(self, ItPo_Blood));
			CreateInvItems	(self, ItPo_Blood, 1);
		};
	};
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		B_DragonKillCounter (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
