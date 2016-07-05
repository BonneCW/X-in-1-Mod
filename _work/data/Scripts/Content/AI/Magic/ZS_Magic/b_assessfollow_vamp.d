
func void b_assessfollow_vamp()
{
	if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (DiegoOW))
	{
		if ((Npc_GetDistToNpc (self, hero) < self.aivar[AIV_FollowDist]) && (self.aivar[AIV_TAPOSITION] == FALSE))
		{
			Npc_ClearAIQueue (self);
			AI_Standup (self);
			self.aivar[AIV_TAPOSITION] = TRUE;
		}
		else if (C_DiegoTooFar (0) && (self.aivar[AIV_TAPOSITION] == FALSE))
		{
			Npc_ClearAIQueue (self);
			AI_Standup (self);
			self.aivar[AIV_TAPOSITION] = TRUE;
			if (Npc_GetDistToNpc (self, hero) > PERC_DIST_DIALOG)
			{
				B_Say (self, other, "$SC_HEYWAITASECOND");
			};
		}
		else
		{
			B_AssessPlayer ();
		};
		return;
	};
	if ((Npc_GetDistToNpc (self, hero) < self.aivar[AIV_FollowDist]) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		Npc_ClearAIQueue (self);
		AI_Standup (self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	}
	else
	{
		B_AssessPlayer ();
	};
};

func void b_assessfollow()
{
	if (Npc_IsPlayer (other) || Npc_IsPlayer (victim) || (other.aivar[AIV_PARTYMEMBER] == TRUE) || (victim.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		B_AssessFightSound ();
	};
};

func void b_movefollow()
{
};

func void zs_follow()
{
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime (self, 0.3);
	Perception_Set_Minimal ();
	Npc_PercEnable (self, PERC_ASSESSPLAYER, b_assessfollow_vamp);
	Npc_PercEnable (self, PERC_ASSESSENEMY, B_AssessEnemy);
	Npc_PercEnable (self, PERC_ASSESSTALK, B_AssessTalk);
	Npc_PercEnable (self, PERC_MOVEMOB, B_MoveMob);
	Npc_PercEnable (self, PERC_ASSESSFIGHTSOUND, b_assessfollow);
	B_ResetAll (self);
	AI_Standup (self);
	AI_SetWalkMode (self, NPC_RUN);
	if (self.aivar[AIV_FollowDist] == 0)
	{
		self.aivar[AIV_FollowDist] = 500;
	};
};

func int zs_follow_loop()
{
	if (ICHKOMME >= 4)
	{
		FOLGEHELD = FALSE;
		ICHKOMME = 0;
		return LOOP_END;
	};
	if (Npc_GetDistToNpc (self, hero) > self.aivar[AIV_FollowDist])
	{
		if (Hlp_GetInstanceID (self) == Hlp_GetInstanceID (DiegoOW))
		{
			if (C_DiegoTooFar (0))
			{
				if (Npc_GetStateTime (self) > 1)
				{
					B_TurnToNpc (self, hero);
					Npc_SetStateTime (self, 0);
				};
				return LOOP_CONTINUE;
			};
		};
		if (!C_BodyStateContains (self, BS_SWIM))
		{
			AI_SetWalkMode (self, NPC_RUN);
		};
		AI_GotoNpc (self, hero);
		self.aivar[AIV_TAPOSITION] = FALSE;
	}
	else if (Npc_GetStateTime (self) > 1)
	{
		B_TurnToNpc (self, hero);
		Npc_SetStateTime (self, 0);
	};
	return LOOP_CONTINUE;
};

func void zs_follow_end()
{
};

