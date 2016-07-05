const int SPL_COST_SUMMONICEGOLEM = 100;

instance SPELL_SUMMONICEGOLEM(C_Spell_Proto)
{
	time_per_mana = 0;
	spellType = SPELL_BAD;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonicegolem(var int manaInvested)
{
	if (Summoned_Monster >= SummonMax)
	{
		return SPL_SENDSTOP;
	};

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_COST_SUMMONICEGOLEM)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonicegolem()
{
	if (Npc_GetActiveSpellIsScroll (self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONICEGOLEM;
	};

	if (Npc_IsPlayer (self))
	{
		Summoned_Monster += 1;

		Wld_SpawnNpcRange (self, summoned_icegolem, 1, 500);
	}
	else
	{
		Wld_SpawnNpcRange (self, IceGolem, 1, 500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};