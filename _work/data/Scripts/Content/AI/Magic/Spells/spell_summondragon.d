const int SPL_COST_SUMMONDRAGON = 333;

instance SPELL_SUMMONDRAGON(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summondragon(var int manaInvested)
{
	if (Summoned_Monster >= SummonMax)
	{
		return SPL_SENDSTOP;
	};

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_COST_SUMMONDRAGON)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summondragon()
{
	if (Npc_GetActiveSpellIsScroll (self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONDRAGON;
	};
	if (Npc_IsPlayer (self))
	{
		Summoned_Monster += 1;

		Wld_SpawnNpcRange (self, summoned_dragon, 1, 700);
	}
	else
	{
		Wld_SpawnNpcRange (self, Wolf, 1, 500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};