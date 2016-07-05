
func int b_stopmagicfollow()
{
	Npc_PercDisable (self, PERC_ASSESSDAMAGE);
	B_Say_Overlay (self, other, "$WHATWASSTHAT");
	AI_ContinueRoutine (self);
};

func void zs_magicfollow()
{
	Npc_PercEnable (self, PERC_ASSESSDAMAGE, b_stopmagicfollow);
	Npc_PercEnable (self, PERC_ASSESSMAGIC, B_AssessMagic);
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	Npc_SetRefuseTalk (self, 0);
	Npc_SetTempAttitude (self, Npc_GetPermAttitude (self, hero));
	B_StopLookAt (self);
	AI_StopPointAt (self);
	if (!Npc_HasBodyFlag (self, BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup (self);
	}
	else
	{
		AI_StandupQuick (self);
	};
	FOLGEHELD = TRUE;
	AI_StartState (self, zs_follow, 0, "");
};

func int zs_magicfollow_loop()
{
	return LOOP_END;
};

func void zs_magicfollow_end()
{
};

