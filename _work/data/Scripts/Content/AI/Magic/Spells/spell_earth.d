
const int SPL_COST_EARTH = 80;



instance SPELL_EARTH(C_Spell_Proto)

{

	time_per_mana = 0;

	damage_per_level = 120;

	targetCollectAlgo = TARGET_COLLECT_ALL_FALLBACK_NONE;

	targetCollectRange = 1000;

	targetCollectType = TARGET_TYPE_ALL;

};




func int spell_logic_earth(var int manaInvested)

{

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else if (self.attribute[ATR_MANA] >= SPL_COST_EARTH)
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else

	{

		return SPL_SENDSTOP;

	};

};



func void spell_cast_earth()

{
	if (Npc_GetActiveSpellIsScroll (self))

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

	}

	else

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_EARTH;

	};


	self.aivar[AIV_SelectSpell] += 1;

};