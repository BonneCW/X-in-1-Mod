// *****************************************************************
// B_AssessQuietSound
// ------------------
// aufgerufen durch Wahrnehmung PERC_ASSESSQUIETSOUND 
// (Schrittger�usche des Spielers oder fallengelassenes Item)
// PERC_DIST_INTERMEDIAT wegen Monster-AI eingestellt, hier verk�rzt 
// *****************************************************************

func void B_AssessQuietSound ()
{
	// EXIT IF...

	// ------ SoundSource ist KEIN NPC (kann fallengelassenes Item sein) ------
	if (!Hlp_IsValidNpc (other))
	{
		return;
	};
	
	// ------- Burgzinnenwachen sollen sich nicht zu Tode st�rzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	
	// ------- Player im Haus und NSC in anderem Stockwerk ------
	if (Wld_GetPlayerPortalGuild() >= GIL_NONE) //also NICHT Draussen (== -1)
	&& (Npc_GetHeightToNpc(self, other) > PERC_DIST_INDOOR_HEIGHT)
	{
		return;
	};

	// ------- Schlafende wecken oder Schritte im Raum h�ren ------
	if (B_AssessEnterRoom())
	{ 
		return;
	};

	// ------ Torwachen reagiern nicht auf Quiet Sound ------
	if (C_NpcIsGateGuard(self))
	{
		return;
	};

	// ------ NPC ist NICHT hostile (upset-(temp-) oder Gilden-hostile) ------
	// ------ UND hat auch keine Important-Info ------
	if (Npc_GetAttitude(self, other) != ATT_HOSTILE)
	&& (Npc_CheckInfo (self, 1) == FALSE)
	{
		return;
	};

	// ------ NICHT Override-Enemies ------
	if (Npc_GetAttitude(self, other) == ATT_HOSTILE)
	&& ( 	(self.aivar[AIV_EnemyOverride] == TRUE)
		||  ( C_PlayerIsFakeBandit(self, other) && (self.guild == GIL_BDT) )
	   )
	{
		return;
	};

	// ------ NPC kann Soundquelle sehen ------
	if (Npc_CanSeeSource(self))							//Sichtcheck EINMAL in der Sekunde (Programm sendet Wahrnehmung EINMAL in der Sekunde, wenn der Spieler sich bewegt)
	{
		return;
	};	
	
	// FUNC
	
	if (Wld_GetPlayerPortalGuild() != GIL_PUBLIC)
	&& (Wld_GetPlayerPortalGuild() != GIL_NONE) //Sorgt, daf�r dass Spieler in Public r�umen nicht angestarrt wird, ist aber noch ziemlich buggy(leute starren einen drau�en an) am besten zus�tzliche Abfragen reinbauen.
	{
		Npc_ClearAIQueue 	(self);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_ObservePlayer, 1, "");	//NSC steht sauber auf
		return;
	};
};	

