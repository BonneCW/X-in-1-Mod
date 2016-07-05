// ******************
// SPL_redBall	//k3 - Beliars Rage
// ******************

const int SPL_Cost_redBall 		= 10;
const int SPL_Damage_redBall 	= 50;

INSTANCE Spell_redBall (C_Spell_Proto)
{							
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_redBall;
	damageType				= DAM_MAGIC;	
};

func int Spell_Logic_redBall (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_redBall)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_redball()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_redBall;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
