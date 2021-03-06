// ***********************************************************
// B_AssessTheft
// -------------
// wird durch Wahrnehmung PERC_ASSESSTHEFT angesprungen
// wir von �BERALL her aufgerufen (auch aus ZS_Attack)
// Wenn SC/NSC irgendein Item aufhebt in PERC_DIST_INTERMEDIAT
// ***********************************************************

func void B_AssessTheft ()
{
	// EXIT IF...
	
	// ------ other ist NICHT der Spieler ------
	if (!Npc_IsPlayer (other)) 
	{
		return;
	};
	
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	&& (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
	{
		return;
	};
	
	// ------ ignorieren, wenn NSC-Gilde freundlich zu Taeter-Gilde ------
	if (Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if (Hlp_IsValidItem(item)) 
		&& (Npc_OwnedByNpc(item, self))
		{
			//weiter (kein Abbruch bei pers�nlichem Besitz)
		}
		else
		{
			return;
		};		
	};

	// ------ Item geh�rte mir nicht ------
	if (!C_IsTakenItemMyPossession (self, other, item))
	{
		return;
	};
	
	// ------ NSC kann Taeter NICHT sehen ------
	if (!Npc_CanSeeNpc (self, other))
	{
		if (Npc_IsInPlayersRoom (self))
		&& ( (Npc_IsInState(self, ZS_ObservePlayer)) || (Npc_IsInState(self, ZS_ClearRoom)) )
		{
			//troztdem gesehen!
		}
		else
		{
			return;
		};
	};
	
	// ------ ignore THEFT ------
	if (!C_WantToAttackThief(self, other))
	{
		// ------ Torwachen greifen nicht an, memorizen aber News ------
		if (C_NpcIsGateGuard(self))
		{
			B_MemorizePlayerCrime (self, other, CRIME_THEFT);
		};
		
		return;
	};
	
	
	//Dunkle Magie: (warum ist dieser Eintrag eigentlich n�tig????)
	if (Wld_GetPlayerPortalGuild() == GIL_NONE)
	|| (Wld_GetPlayerPortalGuild() == GIL_PUBLIC)
	{
	    	return;
	};
	
	// FUNC
	
	B_Attack (self, other, AR_Theft, 0);						//angreifen oder fliehen
	return;
};
