
const int SPL_COST_VLIGHT = 2;

const int SPL_DURATION_VLIGHT = 5;



instance SPELL_VLIGHT(C_Spell_Proto)

{

	time_per_mana = 500;

	spellType = SPELL_NEUTRAL;

	targetCollectAlgo = TARGET_COLLECT_NONE;

	targetCollectRange = 0;

	targetCollectAzi = 0;

	targetCollectElev = 0;

};




func int spell_logic_vlight(var int manaInvested)

{

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else if (self.attribute[ATR_MANA] >= SPL_COST_VLIGHT)
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else

	{

		return SPL_SENDSTOP;

	};

};



func void spell_cast_vlight()

{

	if (Npc_GetActiveSpellIsScroll (self))

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

	}

	else

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_VLIGHT;

	};


	self.aivar[AIV_SelectSpell] += 1;

};

