// *************
// SPL_Blutopfer
// *************

const int SPL_Cost_Blutopfer	= 15;
const int SPL_Damage_Blutopfer	= 90;


INSTANCE Spell_Blutopfer (C_Spell_Proto)
{
	time_per_mana			= 0;			//Spell wirkt Instant
	damage_per_level 		= SPL_Damage_Blutopfer; 
};

func int Spell_Logic_Blutopfer (var int manaInvested)
{
  PrintDebugNpc(PD_Magic, "Spell_Logic_Blutopfer");
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Blutopfer)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Blutopfer ()
{
  PrintDebugNpc(PD_Magic, "Spell_Cast_Blutopfer");
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Blutopfer;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};




