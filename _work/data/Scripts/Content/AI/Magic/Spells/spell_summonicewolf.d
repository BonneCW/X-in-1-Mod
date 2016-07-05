const int SPL_COST_SUMMONICEWOLF = 60;

instance SPELL_SUMMONICEWOLF(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonicewolf(var int manaInvested)
{
	if (Summoned_Monster >= SummonMax)
	{
		return SPL_SENDSTOP;
	};

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_COST_SUMMONICEWOLF)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonicewolf()
{
	if (Npc_GetActiveSpellIsScroll (self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONICEWOLF;
	};
	if (Npc_IsPlayer (self))
	{
		Summoned_Monster += 1;

		Wld_SpawnNpcRange (self, summoned_icewolf, 1, 500);
	}
	else
	{
		Wld_SpawnNpcRange (self, Icewolf, 1, 500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};