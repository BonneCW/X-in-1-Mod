
const int SPL_COST_AMOK = 20;



instance SPELL_AMOK(C_Spell_Proto)

{
	
	time_per_mana = 0;

	spellType = SPELL_NEUTRAL;

	targetCollectAlgo = TARGET_COLLECT_CASTER;

	canTurnDuringInvest = 0;

	targetCollectRange = 0;

	targetCollectAzi = 0;

	targetCollectElev = 0;

};




func int spell_logic_amok(var int manaInvested)

{
	
	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{

		return SPL_SENDCAST;

	}
	else if (self.attribute[ATR_MANA] >= SPL_COST_AMOK)

	&& (SC_IST_EIN_VAMPIR == TRUE)
	{

		return SPL_SENDCAST;

	}

	else

	{
		return SPL_SENDSTOP;

	};

};



func void spell_cast_amok()

{

	if (Npc_GetActiveSpellIsScroll (self))

	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

	}

	else

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_AMOK;

	};


	if (Npc_IsPlayer (self))

	{

		Wld_PlayEffect ("SPELLFX_fear", self, self, 0, 0, 0, FALSE);

		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;

		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] * 2;

		hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] * 2;

		Mdl_ApplyOverlayMdsTimed (self, "HUMANS_SPRINT.MDS", 30000);

		hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH] / 2;

		hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY] / 2;

		hero.attribute[ATR_HITPOINTS] = 1;

		hero.attribute[ATR_MANA] = 1;

	};


	self.aivar[AIV_SelectSpell] += 1;

};

