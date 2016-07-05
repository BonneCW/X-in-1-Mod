// ****************************************************************
// B_AssessDamage
// --------------
// wird durchWahrnehmung PERC_AssessDamage ÜBERALL her aufgerufen
// (also auch aus ZS_Attack, AR kann sich allerdings NICHT ändern!)
// ****************************************************************

func void B_AssessDamage ()
{
	var C_NPC Quarho; Quarho = Hlp_GetNpc (NONE_ADDON_111_Quarhodron);
	var C_NPC Rhadem; Rhadem = Hlp_GetNpc (NONE_ADDON_112_Rhademes);
	var C_Item OthWeap;
	var C_Item othweap2;
	var C_Item othweap3;
	var int zufall;
	var C_Item othweap4;
	var int zufall2;
	var C_Npc rav;

	if	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Quarho)))
	||	((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Rhadem)))
	{
		B_GhostSpecialDamage (other, self);
		return;
	};
	B_BeliarsWeaponSpecialDamage (other, self);
	if (Npc_HasItems (other, itmw_1h_blutschwert) > 0)
	{
		Npc_GetInvItem (other, itmw_1h_blutschwert);
		OthWeap = Npc_GetReadiedWeapon (other);
		if ((Hlp_GetInstanceID (OthWeap) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_GHOST))
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
		if ((Hlp_GetInstanceID (othweap2) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_GHOST))
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
		if ((Hlp_GetInstanceID (othweap3) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_GHOST))
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
		if ((Hlp_GetInstanceID (othweap4) == Hlp_GetInstanceID (item)) && (self.flags != NPC_FLAG_IMMORTAL) && (self.flags != NPC_FLAG_GHOST))
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

	B_BeliarsWeaponSpecialDamage (other, self);

	// Sonderschaden der magischen Waffen
	B_MyMagicDamage(other, self);

	// AIVARS

	if (self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	
	if self.aivar [AIV_EnemyOverride] == TRUE
	{
		RAV = Hlp_GetNpc(BDT_1090_Addon_Raven);
		
		if (Hlp_GetInstanceID(self) == (Hlp_GetInstanceID(RAV)))
		{
			self.aivar [AIV_EnemyOverride] =	FALSE;
		};
	};
	// ------ Wenn NSC im ZS_Attack ------
	if (Npc_IsInState(self,ZS_Attack))
	{
		// EXIT IF...
		
		// ------ Freunde ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
		
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			// ------ NEUER Angreifer ist NPC ODER zum zweiten MAl (von Hero) getroffen ------
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			|| (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) 
			{
				Npc_SetTarget (self, other); //Ziel wechseln
			}
			else //NEUER Angreifer ist hero und trifft zum ersten mal
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// EXIT IF
	
	// ------ NSC ist ENEMY ----- 
	if (B_AssessEnemy())
	{
		return;
	};
	

	// ------ Uriziel2effect ----- 
	if (u2ise == true)
	{
		if (C_BodyStateContains(self, BS_PARADE)==FALSE)
                ||(Npc_IsPlayer (other))
		{
                	B_MagicHurtNpc (other, self, 20);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 20 schaden mehr... 
			Wld_PlayEffect("spellFX_Fear",  self, self, 0, 0, 0, FALSE );
			Snd_Play 	("MFX_FEAR_CAST" );
		        Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
		};		
	};

	// ------ Urizieleffect ----- 
	if (uise == true)
	{
		if (C_BodyStateContains(self, BS_PARADE)==FALSE)
		||(Npc_IsPlayer (other))
		{
                	B_MagicHurtNpc (other, self, 10);
			//B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage)
			//macht 10 schaden mehr... 

		};
	};
	
	// ------ Egill/Enim NSCs (Story-Angreifer) ------
	if (!Npc_IsPlayer(other))
	&& (other.aivar[AIV_ATTACKREASON] == AR_NONE)
	{
		B_Attack (self, other, AR_NONE, 0);		//angreifen oder fliehen
		return;
	};

	// ------ Dunkle Magie
	if ((self.guild == GIL_BAD) && (other.guild == GIL_BAD) && (Npc_HasItems(other, ItRu_Shrink) > 0) && (!Npc_IsPlayer(other)))
	  {
	    B_Attack (self, other, AR_Kill, 0);
	    return;
	  };
		
	// ------ Spieler hat mit NK-Waffe angegriffen ------
	if (Npc_IsInFightMode (other, FMODE_MELEE))
	|| (Npc_IsInFightMode (other, FMODE_FIST))
	|| (Npc_IsInFightMode (other, FMODE_NONE)) //oder Waffe wieder weggesteckt (nicht ermittelbar)
	{
		// ------ NSC ist freundlich ODER npctype_friend ------
		if (Npc_GetAttitude (self, other) == ATT_FRIENDLY)
		|| ( (self.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other) )
		{
			// ------- nur wenn ich zum ERSTEN Mal geschlagen werde -------
			if (!Npc_IsInState(self, ZS_ReactToDamage))
			{
				Npc_ClearAIQueue	(self);
				B_ClearPerceptions	(self);							//schaltet alle Wahrnehmungen ab - so kann keine später priorisierte diesen Stateaufruf verhindern (s. z.B. AssessFightSound + AssessDamage)
				AI_StartState		(self, ZS_ReactToDamage, 0, "");
				return;												//im unterern B_Attack wird ein ClearQueue aufgerufen, der den AI_StartState direkt wieder aus der queue löscht
																	// - sicherheithalber bei allen AI_StartState-Aufrufen return anfügen
			};
		};
	};	
	
	// FUNC
	
	B_Attack (self, other, AR_ReactToDamage, 0);		//angreifen oder fliehen
	return;
};








