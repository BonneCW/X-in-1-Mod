// ******************
// ZS_MM_Rtn_Wisp
// ******************

func void B_WispAssessTalk()
{
	Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
};

func void ZS_MM_Rtn_Wisp ()
{
	Npc_SetPercTime	(self,	1);
	Npc_PercEnable	(self,	PERC_ASSESSPLAYER,		B_MM_AssessPlayer);
	Npc_PercEnable	(self,	PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,  		B_AssessMagic);
	Npc_PercEnable	(self,	PERC_ASSESSDAMAGE,		B_MM_AssessDamage);
	Npc_PercEnable	(self,  PERC_ASSESSFIGHTSOUND, 	B_MM_AssessOthersDamage);
	
	Npc_PercEnable 	(self,	PERC_ASSESSTALK, 	B_AssessTalk);
	
	// FUNC
	
	B_SetAttitude (self, ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_StandUp (self);
	AI_SetWalkmode	(self, NPC_RUN);
};

func int ZS_MM_Rtn_Wisp_Loop()
{
	// ------ beim Spieler bleiben ------
	B_MM_WispDetect ();
	if (Npc_GetDistToNpc (self, hero) > 500)
	{
		AI_GotoNpc (self, hero);
	}
	else if (playerIsTransformed)
	{
		Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	}
	else
	{
		if (Npc_GetStateTime(self) >= 1)
		{
			// ------ zum Spieler drehen ------
			if (!Npc_CanSeeNpc(self, hero))
			{
				AI_TurnToNpc (self, hero);
			};
		  			
		};
	};
	
	self.wp = Npc_GetNearestWP (self);
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Wisp_End()
{

};

			/*// ------ MANA - Entzug ------			
			if (self.aivar[AIV_MM_REAL_ID] == ID_Wisp_GOBBO_SKELETON)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -1);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_Wisp_WOLF)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -2);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_Wisp_SKELETON)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -3);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_Wisp_GOLEM)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -4);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_Wisp_DEMON)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -5);
			};
			
			if (hero.attribute[ATR_MANA] <= 0)
			{
				if (self.aivar[AIV_MM_REAL_ID] == ID_Wisp_DEMON)
				{
					B_SetAttitude (self, ATT_HOSTILE);
				}
				else
				{
					Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			};*/





