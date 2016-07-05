// *************
// SPL_fighterWhirl 	K2
// *************

const int	SPL_Cost_fighterWhirl			=	5;
const int   SPL_fighterWhirl_DAMAGE		=	0;	
const int	SPL_TIME_fighterWHIRL			=	10;	

INSTANCE Spell_fighterWhirl (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - INSTANT-Spell
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	damage_per_level 		= 10;					//Schaden wird im ZS_MagicFreeze angegeben!
};

func int Spell_Logic_fighterWhirl  (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_fighterWhirl )
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_fighterwind()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_fighterWhirl ;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
