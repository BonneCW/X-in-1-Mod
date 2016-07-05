// ****************
// SPL_Giftanschlag
// ****************

const int SPL_Cost_Giftanschlag		= 200; //4*50
const int STEP_Giftanschlag			= 50;
const int SPL_Damage_Giftanschlag 	= 100;

INSTANCE Spell_Giftanschlag (C_Spell_Proto)
{
	time_per_mana			= 30;
	damage_per_level		= SPL_Damage_Giftanschlag;
	damageType				= DAM_MAGIC;	
	canTurnDuringInvest     = TRUE;
};

func int Spell_Logic_Giftanschlag (var int manaInvested) 
{
	if (self.attribute[ATR_MANA]<STEP_Giftanschlag) 
	{
		return SPL_DONTINVEST;	
	};

	if (manaInvested <= STEP_Giftanschlag*1)
	{
		self.aivar[AIV_SpellLevel] = 1; //Start mit Level 1
		return SPL_STATUS_CANINVEST_NO_MANADEC;
	}
	else if (manaInvested > (STEP_Giftanschlag*1))
	&& (self.aivar[AIV_SpellLevel] <= 1)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Giftanschlag);

		if (self.attribute[ATR_MANA]<0) 
		{
	   		self.attribute[ATR_MANA]=0;
		};
	
		self.aivar[AIV_SpellLevel] = 2;
		return SPL_NEXTLEVEL; //Lev2 erreicht
	}
	else if (manaInvested > (STEP_Giftanschlag*2))
	&& (self.aivar[AIV_SpellLevel] <= 2)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Giftanschlag);

		if (self.attribute[ATR_MANA]<0) 
		{
	   		self.attribute[ATR_MANA]=0;
		};
		self.aivar[AIV_SpellLevel] = 3;
		return SPL_NEXTLEVEL; //Lev3 erreicht
	}
	else if (manaInvested > (STEP_Giftanschlag*3))
	&& (self.aivar[AIV_SpellLevel] <= 3)
	{
		self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Giftanschlag);

		if (self.attribute[ATR_MANA]<0) 
		{
	   		self.attribute[ATR_MANA]=0;
		};	
		self.aivar[AIV_SpellLevel] = 4;
		return SPL_NEXTLEVEL; //Lev4 erreicht
	}
	else if (manaInvested > (STEP_Giftanschlag*3))
	&& (self.aivar[AIV_SpellLevel] == 4)
	{
		return SPL_DONTINVEST;	
	};

	return SPL_STATUS_CANINVEST_NO_MANADEC;	
};

func void Spell_Cast_Giftanschlag(var int spellLevel)
{
	self.attribute[ATR_MANA] = (self.attribute[ATR_MANA] - STEP_Giftanschlag);
	
	if (self.attribute[ATR_MANA]<0) 
	{
		self.attribute[ATR_MANA]=0;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
