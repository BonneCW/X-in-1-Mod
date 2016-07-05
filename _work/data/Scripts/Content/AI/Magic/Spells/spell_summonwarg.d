const int SPL_COST_SUMMONWARG = 45;

instance SPELL_SUMMONWARG(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonwarg(var int manaInvested)
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
	else if (self.attribute[ATR_MANA] >= SPL_COST_SUMMONWARG)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonwarg()
{
	if (Npc_GetActiveSpellIsScroll (self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONWARG;
	};

	if (Npc_IsPlayer (self))
	{
		Summoned_Monster += 1;

		Wld_SpawnNpcRange (self, summoned_warg, 1, 500);
	}
	else
	{
		Wld_SpawnNpcRange (self, Warg, 1, 500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};


const int SPL_COST_SUMMON3WARG = 55;

instance SPELL_SUMMON3WARG(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summon3warg(var int manaInvested)
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
	else if (self.attribute[ATR_MANA] >= SPL_COST_SUMMON3WARG)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summon3warg()
{
	if (Npc_GetActiveSpellIsScroll (self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMON3WARG;
	};

	if (Npc_IsPlayer (self))
	{
		Wld_SpawnNpcRange (self, summoned_warg, 1, 400);
		Wld_SpawnNpcRange (self, Summoned_Wolf, 1, 500);
		Wld_SpawnNpcRange (self, Summoned_Wolf, 1, 600);

		Summoned_Monster += 3;
	}
	else
	{
		Wld_SpawnNpcRange (self, Warg, 1, 500);
		Wld_SpawnNpcRange (self, Wolf, 1, 500);
		Wld_SpawnNpcRange (self, Wolf, 1, 500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};

const int SPL_COST_SUMMONSHADOW = 55;

instance SPELL_SUMMONSHADOW(C_Spell_Proto)
{
	time_per_mana = 0;
	targetCollectAlgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonshadow(var int manaInvested)
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
	else if (self.attribute[ATR_MANA] >= SPL_COST_SUMMONSHADOW)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonshadow()
{
	if (Npc_GetActiveSpellIsScroll (self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONSHADOW;
	};

	if (Npc_IsPlayer (self))
	{
		Wld_SpawnNpcRange (self, summoned_shadow, 1, 500);

		Summoned_Monster += 1;
	}
	else
	{
		Wld_SpawnNpcRange (self, Shadowbeast, 1, 500);
	};
	self.aivar[AIV_SelectSpell] += 1;
};