// **********
// SPL_Altern
// **********

const int SPL_Cost_Altern			= 30;

INSTANCE Spell_Altern (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - Spell wirkt INSTANT
	spelltype				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					//10m
};

func int Spell_Logic_Altern	(var int manaInvested) 	//Parameter manaInvested wird hier nicht benutzt
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Altern)
	{
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Altern()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Altern;
	};
	
	if (other.flags != NPC_FLAG_IMMORTAL)		//nicht auf Immortals
	&& (other.aivar[AIV_Altern]==0)		//nur auf bisher ungealterte Monster!
	{		
		Npc_ClearAIQueue	(other);
		B_ClearPerceptions	(other);
		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] - (other.attribute[ATR_HITPOINTS_MAX] % 2)) / 2;
		if (other.attribute[ATR_HITPOINTS]>other.attribute[ATR_HITPOINTS_MAX])
		  {
		    other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		  };
		other.attribute[ATR_STRENGTH] = (other.attribute[ATR_STRENGTH] - (other.attribute[ATR_STRENGTH] % 2)) / 2;
		other.aivar[AIV_Altern] = 1;
		AI_SetWalkmode(other, NPC_WALK);
	};
	
	Npc_PercEnable	(self, PERC_ASSESSMAGIC, B_AssessMagic);
	
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);

	if (!Npc_IsPlayer(self))
	  {
	    if (self.guild < GIL_SEPERATOR_HUM)
	      {
		B_AssessDamage();
	      }
	    else
	      {
		Npc_SetTempAttitude (self, ATT_HOSTILE); //falls nicht schon Gilden-Attitüde hostile ist 
	      };
	  };
	self.aivar[AIV_SelectSpell] += 1;
};




