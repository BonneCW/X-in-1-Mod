// *****************
// B_MM_AssessDamage
// *****************

func void B_MM_AssessDamage ()
{
	var C_Item OthWeap;
	var C_Item othweap6;
	var C_Item othweap2;
	var C_Item othweap3;
	var int zufall;
	var C_Item othweap4;
	var int zufall2;
	var C_NPC MagGol;
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;

	B_BeliarsWeaponSpecialDamage (other, self);

	// Sonderschaden der magischen Waffen
	B_MyMagicDamage(other, self);

	// EXIT IF
	
	// ------ SONDERFALL: Magic Golem ------ 				//JUUUUNGEEEEE!!!
	if (Npc_HasItems (other, Holy_Hammer_MIS) > 0)
	{
		MagGol = Hlp_GetNpc(MagicGolem);
		Npc_GetInvItem(other, Holy_Hammer_MIS); //befüllt 'item'
		OthWeap = Npc_GetReadiedWeapon(other);
		
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MagGol))
		&& (Hlp_GetInstanceID(OthWeap) == Hlp_GetInstanceID(item))
		{
			Npc_ChangeAttribute (self, ATR_HITPOINTS, -1000);
			return;
		};
	};		
	
	if (self.guild == GIL_STONEGUARDIAN)
	&& (self.aivar[AIV_EnemyOverride] == TRUE)
	{
		B_AWAKE_STONEGUARDIAN (self);
	};	
	
	// ----- wenn Monster Beute von Angreifer ------
	if (C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget 		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");	
		return;
	};

	// ------ Bonusschaden gegen Orks ------
	//Durch dieses script wird abgefragt ob man schon weiß auf welches körperteil einer Blutfliege man zielen muss um mehr schaden anzurichten.
	
	if (orckiller == TRUE) //<--- GLOBAL definiert
	{
		if(Npc_IsPlayer (other))	
		&& ((self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR) 
		|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCELITE)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR))//mehr damage für Blutfliege, eine liste der aivars gibts in der AI_constans.d
		{
			B_MagicHurtNpc (PC_hero, self, 50);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 50 schaden mehr... 
			Wld_PlayEffect ("spellFX_BELIARSRAGE_COLLIDE", self, hero, 0, 0, 0, 0);
		};
	};

	// ------ Bonusschaden gegen Untote ------
	//Durch dieses script wird abgefragt ob man schon weiß auf welches körperteil einer Blutfliege man zielen muss um mehr schaden anzurichten.
	
	if (skeletonkiller == TRUE) //<--- GLOBAL definiert
	{
		if (Npc_IsPlayer (other))	
		&& ((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) 
		|| (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)//mehr damage für Blutfliege, eine liste der aivars gibts in der AI_constans.d
		|| (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON))
		{
			Snd_Play 	("MFX_MASSDEATH_TARGET" );
			B_MagicHurtNpc (PC_hero, self, 50);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 50 schaden mehr... 
			Wld_PlayEffect ("spellFX_LIGHTSTAR_VIOLET", self, hero, 0, 0, 0, 0);
		};
	};

	// ------ Drachentöter! ------
	//Durch dieses script wird abgefragt ob man schon weiß auf welches körperteil einer Blutfliege man zielen muss um mehr schaden anzurichten.
	
	if (dragonkiller == TRUE) //<--- GLOBAL definiert
	{
		if (Npc_IsPlayer (other))	
		&& ((self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE) 
		|| (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
		|| (self.aivar[AIV_MM_REAL_ID] == ID_DRACONIAN))
		&& (!C_BodyStateContains(self, BS_PARADE))
		{
			Snd_Play 	("MFX_MASSDEATH_TARGET" );
			B_MagicHurtNpc (hero, self, 50);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 70 schaden mehr... 
			Wld_PlayEffect ("spellFX_LIGHTSTAR_RED", self, hero, 0, 0, 0, 0);
		};
	};

	// ------ Uriziel2effect ----- 
	if (u2ise == true)
	{
		if(Npc_IsPlayer (other))
		{
			Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
			Snd_Play 	("MFX_FEAR_CAST" );
		        Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
                	B_MagicHurtNpc (other, self, 20);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 20 schaden mehr... 
		};		
	};

	// ------ Urizieleffect ----- 
	if (uise == true)
	{
		if(Npc_IsPlayer (other))
		{
	                B_MagicHurtNpc (other, self, 10);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 10 schaden mehr... 
		};
	};


	// ------ Saphieleffect ----- 
	if (sise == true)
	{
		if(Npc_IsPlayer (other))
		&& (self.flags != 2)
		{
	                hitcounter = hitcounter + 1;
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 10 schaden mehr... 
		};
	};

	if (sise == true)
	{
		if(Npc_IsPlayer (other))
		{
			if (hitcounter == 200)
			{
				B_RaiseAttribute	(hero, ATR_STRENGTH,	1);
				//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
				//macht 10 schaden mehr... 
				hitcounter = 0;
			};
		};	
	};



	if (Npc_HasItems (other, itmw_1h_blutschwert) > 0)
	{
		Npc_GetInvItem (other, itmw_1h_blutschwert);
		othweap6 = Npc_GetReadiedWeapon (other);
		if ((Hlp_GetInstanceID (othweap6) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.aivar[AIV_MM_REAL_ID] != ID_STONEGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_FIREGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_ICEGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_DEMON) && (self.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD) && (self.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_GOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_GOBBO_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SHADOWBEAST_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_DEMON) && (self.aivar[AIV_MM_REAL_ID] != ID_WISP) && (self.aivar[AIV_MM_REAL_ID] != ID_Swampgolem) && (self.aivar[AIV_MM_REAL_ID] != ID_Stoneguardian) && (self.aivar[AIV_MM_REAL_ID] != ID_Gargoyle) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedGuardian) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedZombie))
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 5;
			if (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute (other, ATR_HITPOINTS, 5);
			};
		};
	};
	if (Npc_HasItems (other, itmw_1h_blutdegen) > 0)
	{
		Npc_GetInvItem (other, itmw_1h_blutdegen);
		othweap2 = Npc_GetReadiedWeapon (other);
		if ((Hlp_GetInstanceID (othweap2) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.aivar[AIV_MM_REAL_ID] != ID_STONEGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_FIREGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_ICEGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_DEMON) && (self.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD) && (self.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_GOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_GOBBO_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SHADOWBEAST_SKELETON) && (self.aivar[AIV_MM_REAL_ID] != ID_SUMMONED_DEMON) && (self.aivar[AIV_MM_REAL_ID] != ID_WISP) && (self.aivar[AIV_MM_REAL_ID] != ID_Swampgolem) && (self.aivar[AIV_MM_REAL_ID] != ID_Stoneguardian) && (self.aivar[AIV_MM_REAL_ID] != ID_Gargoyle) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedGuardian) && (self.aivar[AIV_MM_REAL_ID] != ID_SummonedZombie))
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 5;
			if (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
			{
				Npc_ChangeAttribute (other, ATR_HITPOINTS, 5);
			};
		};
	};
	if (Npc_HasItems (other, itmw_firesword) > 0)
	{
		Npc_GetInvItem (other, itmw_firesword);
		othweap3 = Npc_GetReadiedWeapon (other);
		if ((Hlp_GetInstanceID (othweap3) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.aivar[AIV_MM_REAL_ID] != ID_FIREGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN) && (self.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE))
		{
			zufall = Hlp_Random (100);
			if (zufall <= 40)
			{
				Npc_ClearAIQueue (self);
				B_ClearPerceptions (self);
				Wld_PlayEffect ("VOB_MAGICBURN", self, self, 0, 0, 0, FALSE);
				B_MagicHurtNpc (other, self, 50);
				AI_StopFX (self, "VOB_MAGICBURN");
			};
		};
	};
	if (Npc_HasItems (other, itmw_icesword) > 0)
	{
		Npc_GetInvItem (other, itmw_icesword);
		othweap4 = Npc_GetReadiedWeapon (other);
		if ((Hlp_GetInstanceID (othweap4) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.aivar[AIV_MM_REAL_ID] != ID_ICEGOLEM) && (self.aivar[AIV_MM_REAL_ID] != ID_Icewolf) && (self.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE))
		{
			zufall2 = Hlp_Random (100);
			if (zufall2 <= 15)
			{
				AI_StandupQuick (self);
				Wld_PlayEffect ("SPELLFX_Lightstar_white", self, self, 0, 0, 0, FALSE);
				Npc_ClearAIQueue (self);
				B_ClearPerceptions (self);
				AI_StartState (self, ZS_MagicFreeze, 0, "");
				Wld_StopEffect ("SPELLFX_lightstar_white");
				Npc_SetTarget (self, other);
			};
		};
	};

	// ------ wenn Monster im ZS_Attack ------
	if (Npc_IsInState(self,ZS_MM_Attack))
	{
		// EXIT IF...
	
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// ------ HACK: von Skelettmagier getroffene Skelette ignorieren Schaden ------
		if (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
		&& (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
		{
			return;
		};
		
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			{
				Npc_SetTarget (self, other); //Ziel wechseln, wenn zum zweiten Mal getroffen
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	Npc_SetTarget		(self, other);
	B_ClearPerceptions	(self);
	AI_StartState		(self, ZS_MM_Attack, 0, "");
	return;
};


