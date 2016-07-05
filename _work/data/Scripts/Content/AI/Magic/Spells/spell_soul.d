
const int SPL_COST_SOUL = 50;

const int SPL_DAMAGE_SOUL = 350;



instance SPELL_SOUL(C_Spell_Proto)

{

	time_per_mana = 0;

	damage_per_level = SPL_DAMAGE_SOUL;

};




func int spell_logic_soul(var int manaInvested)

{

	if (Npc_GetActiveSpellIsScroll (self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll) && (KILLACCOUNT >= 6))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else if ((self.attribute[ATR_MANA] >= SPL_COST_SOUL) && (KILLACCOUNT >= 6))
	&& (SC_IST_EIN_VAMPIR == TRUE)

	{

		return SPL_SENDCAST;

	}

	else if (KILLACCOUNT <= 4)

	{

		return SPL_SENDSTOP;

	}

	else

	{

		return SPL_SENDSTOP;

	};

};



func void spell_cast_soul()

{

	if (Npc_GetActiveSpellIsScroll (self) && (KILLACCOUNT >= 5))

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;

	}

	else

	{

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SOUL;


		if ((self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS]) >= 350)

		{

			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 350;

		}

		else

		{

			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];

		};

	};


	self.aivar[AIV_SelectSpell] += 1;


	KILLACCOUNT = 0;

};

