// ****************
// Alle Summoner Spells
// ****************

const int SPL_Cost_Summoner		= 10;

// ------ Instanz für alle normalen Summoner-Sprüche ------
instance Spell_Summoner (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};


// ------ SPL_LightSummoner -------
func int Spell_Logic_Summoner (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Summoner)
	{					
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Summoner()
{
	if ( Npc_GetActiveSpell(self) == SPL_Summoner		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Summoner;
		};
		
		Summoned_Monster = 0;

		return;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};