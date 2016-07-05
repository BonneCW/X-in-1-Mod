// *********************
// Alle Transform Spells
// *********************

const int SPL_Cost_TrfSheep			= 5;
const int SPL_Cost_TrfScavenger		= 5;
const int SPL_Cost_TrfGiantRat		= 5;
const int SPL_Cost_TrfGiantBug		= 5;
const int SPL_Cost_TrfWolf			= 5;
const int SPL_Cost_TrfWaran			= 5;
const int SPL_Cost_TrfSnapper		= 5;
const int SPL_Cost_TrfWarg			= 5;
const int SPL_Cost_TrfFireWaran		= 5;
const int SPL_Cost_TrfLurker		= 5;
const int SPL_Cost_TrfShadowbeast	= 5;
const int SPL_Cost_TrfDragonSnapper	= 5;

// ------ Instanz für alle Transform-Sprüche ------
INSTANCE Spell_Transform (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	canTurnDuringInvest		= 0;
};

// ------ Schaf ------
func int Spell_Logic_TrfSheep (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSheep)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSheep;
		
		Npc_SetActiveSpellInfo(self, DemonLordTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Scavenger ------
func int Spell_Logic_TrfScavenger (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfScavenger)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfScavenger;
		
		Npc_SetActiveSpellInfo(self, ScavengerTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Giant Rat ------
func int Spell_Logic_TrfGiantRat (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantRat)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantRat;
		
		Npc_SetActiveSpellInfo(self, Giant_RatTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};


// ------ Giant BUG ------
func int Spell_Logic_TrfGiantBug (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfGiantBug)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfGiantBug;
		
		Npc_SetActiveSpellInfo(self, Giant_BugTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Wolf ------
func int Spell_Logic_TrfWolf (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWolf)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWolf;
		
		Npc_SetActiveSpellInfo(self, WolfTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Waran ------
func int Spell_Logic_TrfWaran (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWaran)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWaran;
		
		Npc_SetActiveSpellInfo(self, WaranTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Snapper ------
func int Spell_Logic_TrfSnapper (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfSnapper)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfSnapper;
		
		Npc_SetActiveSpellInfo(self, SnapperTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Warg ------
func int Spell_Logic_TrfWarg (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfWarg)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfWarg;
		
		Npc_SetActiveSpellInfo(self, WargTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Feuerwaran ------
func int Spell_Logic_TrfFireWaran (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfFireWaran)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfFireWaran;
		
		Npc_SetActiveSpellInfo(self, FireWaranTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Lurker ------
func int Spell_Logic_TrfLurker (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfLurker)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfLurker;
		
		Npc_SetActiveSpellInfo(self, LurkerTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Shadowbeast ------
func int Spell_Logic_TrfShadowbeast (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfShadowbeast)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfShadowbeast;
		
		Npc_SetActiveSpellInfo(self, ShadowbeastTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

// ------ Dragon Snapper ------
func int Spell_Logic_TrfDragonSnapper (var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_TrfDragonSnapper)
	{
		B_StartMagicTransform();

		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_TrfDragonSnapper;
		
		Npc_SetActiveSpellInfo(self, DragonSnapperTransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};





