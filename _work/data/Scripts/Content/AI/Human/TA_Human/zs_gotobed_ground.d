
func void zs_gotobed_ground()
{
	Perception_Set_Normal ();
	B_ResetAll (self);
	AI_SetWalkMode (self, NPC_WALK);
	if (Hlp_StrCmp (Npc_GetNearestWP (self), self.wp) == FALSE)
	{
		AI_GotoWP (self, self.wp);
	};
	AI_StartState (self, zs_sleep_ground, 0, "");
};

func void zs_sleep_ground()
{
	Npc_PercEnable (self, PERC_ASSESSDAMAGE, B_AssessDamage);
	Npc_PercEnable (self, PERC_ASSESSTALK, B_AssessSleepTalk);
	AI_SetWalkMode (self, NPC_WALK);
};

func int zs_sleep_ground_loop()
{
	if (!C_BodyStateContains (self, BS_LIE))
	{
		if (Npc_IsOnFP (self, "SLEEP"))
		{
			AI_AlignToFP (self);
			AI_PlayAniBS (self, "T_STAND_2_SLEEPGROUND", BS_LIE);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		}
		else if (Wld_IsFPAvailable (self, "SLEEP"))
		{
			AI_GotoFP (self, "SLEEP");
		}
		else
		{
			AI_AlignToWP (self);
			AI_PlayAni (self, "T_STAND_2_HGUARD");
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};
	return LOOP_CONTINUE;
};

func void zs_sleep_ground_end()
{
	AI_PlayAniBS (self, "T_SLEEPGROUND_2_STAND", BS_STAND);
};

