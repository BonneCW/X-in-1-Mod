
func void zs_die()
{
	Perception_Set_Normal ();
	B_ResetAll (self);
	AI_SetWalkMode (self, NPC_WALK);
	AI_GotoWP (self, self.wp);
	AI_AlignToWP (self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_die_loop()
{
	var int random;
	if (self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		AI_PlayAni (self, "T_STAND_2_LGUARD");
		self.aivar[AIV_TAPOSITION] = ISINPOS;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 1;
	};
	if ((Npc_GetStateTime (self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		random = Hlp_Random (10);
		if (random == 0)
		{
			AI_PlayAni (self, "T_LGUARD_SCRATCH");
		}
		else if (random == 1)
		{
			AI_PlayAni (self, "T_LGUARD_STRETCH");
		}
		else if (random == 2)
		{
			AI_PlayAni (self, "T_LGUARD_CHANGELEG");
		};
		Npc_SetStateTime (self, 0);
	};
	return LOOP_CONTINUE;
};

func void zs_die_end()
{
	AI_PlayAni (self, "T_LGUARD_2_STAND");
};

