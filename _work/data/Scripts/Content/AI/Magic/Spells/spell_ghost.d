
const int SPL_COST_GHOST = 30;



instance SPELL_GHOST(C_Spell_Proto)
{

	time_per_mana = 0;

	spellType = SPELL_BAD;

	targetCollectAlgo = TARGET_COLLECT_NONE;

};




func int spell_logic_ghost(var int manaInvested)

{

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll) && (GHOSTWEG == FALSE))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else if ((self.attribute[ATR_MANA] >= SPL_COST_GHOST) && (GHOSTWEG == FALSE))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else

	{

		return SPL_SENDSTOP;

	};

};



func void spell_cast_ghost()

{

	if (Npc_GetActiveSpellIsScroll (self))

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

	}

	else

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_GHOST;

	};


	Wld_SpawnNpcRange (self, pc_ghost, 1, 100);


	GHOSTWEG = TRUE;


	self.aivar[AIV_SelectSpell] += 1;

};

