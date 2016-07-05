
const int SPL_COST_FOLLOW = 20;
const int SPL_TIME_FOLLOW = 20;



instance SPELL_FOLLOW(C_Spell_Proto)

{

	time_per_mana = 0;
	spellType = SPELL_NEUTRAL;

	targetCollectAlgo = TARGET_COLLECT_FOCUS;

};




func int spell_logic_follow(var int manaInvested)
{

	if ((Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	|| (self.attribute[ATR_MANA] >= SPL_COST_FOLLOW))

	&& (SC_IST_EIN_VAMPIR == TRUE)
	{

		if (Npc_GetActiveSpellIsScroll (self))

		{

			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

		}

		else

		{

			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Sleep;

		};


		if (!C_BodyStateContains (other, BS_SWIM) && !C_BodyStateContains (other, BS_DIVE) && !C_NpcIsDown (other) && !Npc_IsInRoutine (other, ZS_Follow_Player) && !Npc_IsInState (other, ZS_Attack) && (FOLGEHELD == FALSE) && (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToNpc (self, other) <= 1000) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL))

		{

			Npc_ClearAIQueue (other);

			B_ClearPerceptions (other);

			AI_StartState (other, zs_magicfollow, 0, "");

		};


		return SPL_SENDCAST;

	}

	else

	{

		return SPL_SENDSTOP;

	};

};



func void spell_cast_follow()

{

	self.aivar[AIV_SelectSpell] += 1;

};

