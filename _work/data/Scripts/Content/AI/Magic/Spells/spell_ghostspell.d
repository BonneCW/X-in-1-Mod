
const int SPL_COST_GHOSTSPELL = 1;

const int SPL_DAMAGE_GHOSTSPELL = 100;



instance SPELL_GHOSTSPELL(C_Spell_Proto)

{

	time_per_mana = 0;

	damage_per_level = SPL_DAMAGE_GHOSTSPELL;

};




func int spell_logic_ghostspell(var int manaInvested)

{

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else if (self.attribute[ATR_MANA] >= SPL_COST_GHOSTSPELL)

	&& (SC_IST_EIN_VAMPIR == TRUE)
	{

		return SPL_SENDCAST;

	}

	else

	{

		return SPL_SENDSTOP;

	};

};



func void spell_cast_ghostspell()

{

	if (Npc_GetActiveSpellIsScroll (self))

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

	}

	else

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_GHOSTSPELL;

	};


	self.aivar[AIV_SelectSpell] += 1;

};

