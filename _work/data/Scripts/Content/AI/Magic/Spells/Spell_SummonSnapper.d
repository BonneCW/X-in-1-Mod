const int SPL_Cost_SummonSnapper = 40;

INSTANCE Spell_SummonSnapper (C_Spell_Proto)
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonSnapper (var int manaInvested)
{
 if (Summoned_Monster >= SummonMax)
	{
		return SPL_SENDSTOP;
	};

	 if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
    {
      return SPL_SENDCAST;
    }
  else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonSnapper)
    {		
      return SPL_SENDCAST;
    }
  else //nicht genug Mana
    {
      return SPL_SENDSTOP;
    };
  
};

func void Spell_Cast_SummonSnapper()
{
  if (Npc_GetActiveSpellIsScroll(self))
    {
      self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
    }
  else
    {
      self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonSnapper;
    };
  
	if (Npc_IsPlayer(self)) 
	{		
		Summoned_Monster += 1;

		Wld_SpawnNpcRange	(self,	Summoned_Snapper,		1,	500);
	}
	else
	{
		Wld_SpawnNpcRange	(self,	Snapper,				1,	500);
	};
  
  self.aivar[AIV_SelectSpell] += 1;
};




