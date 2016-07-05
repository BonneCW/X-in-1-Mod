func void b_magichurtother(var C_Npc slf,var C_Npc oth,var int damage)
{
	var int realdamage;
	realdamage = damage - oth.protection[PROT_MAGIC];
	if (realdamage < (damage / 10))
	{
		realdamage = damage / 10;
	};
	if (realdamage < 5)
	{
		realdamage = 5;
	};
	if (oth.flags != NPC_FLAG_IMMORTAL)
	{
		realdamage = 0;
	};
	if (realdamage < 0)
	{
		realdamage = 0;
	};
	Npc_ChangeAttribute (oth, ATR_HITPOINTS, -realdamage);
	if (oth.attribute[ATR_HITPOINTS] < 1)
	{
		Npc_ClearAIQueue (oth);
	};
	if (Npc_IsDead (oth))
	{
		if ((Npc_IsPlayer (slf) || (slf.aivar[AIV_PARTYMEMBER] == TRUE)) && (oth.aivar[AIV_VictoryXPGiven] == FALSE))
		{
			B_GivePlayerXP (oth.level * XP_PER_VICTORY);
			oth.aivar[AIV_VictoryXPGiven] = TRUE;
		};
	};
};

func void b_mymagicdamage(var C_Npc oth,var C_Npc slf)
{
	var C_Item waffe;
	var int hp;
	waffe = Npc_GetReadiedWeapon (oth);
	if (Hlp_IsItem (waffe, itmw_1h_lebensspender) || Hlp_IsItem (waffe, itmw_2h_lebensspender))
	{
		if (C_NpcIsUndead (slf) || ((slf.guild > GIL_HARPY) && (slf.guild < GIL_TROLL)) || (slf.guild == GIL_DRAGON))
		{
			return;
		};
		if (slf.attribute[ATR_HITPOINTS] > 50)
		{
			Npc_ChangeAttribute (slf, ATR_HITPOINTS, -50);
			Npc_ChangeAttribute (oth, ATR_HITPOINTS, 50);
		}
		else
		{
			hp = slf.attribute[ATR_HITPOINTS];
			if (hp > 1)
			{
				Npc_ChangeAttribute (slf, ATR_HITPOINTS, 1 - hp);
				Npc_ChangeAttribute (oth, ATR_HITPOINTS, hp - 1);
			};
		};
	};
	if (Hlp_IsItem (waffe, itmw_1h_beliarsrache) || Hlp_IsItem (waffe, itmw_2h_beliarsrache))
	{
		if (C_NpcIsEvil (slf) && !(slf.guild == GIL_DRAGON))
		{
			Wld_PlayEffect ("spellFX_Energyball", slf, slf, 0, 0, 0, FALSE);
			Npc_ChangeAttribute (slf, ATR_HITPOINTS, -100);
			Snd_Play ("DEM_Die");
		};
	};
	if (Hlp_IsItem (waffe, itmw_1h_bannklinge) || Hlp_IsItem (waffe, itmw_2h_bannklinge))
	{
		if (C_NpcIsUndead (slf) && !(slf.guild == GIL_DRAGON))
		{
			Wld_PlayEffect ("spellFX_DestroyUndead", slf, slf, 0, 0, 0, FALSE);
			b_magichurtother (oth, slf, 250);
		};
	};
	if (Hlp_IsItem (waffe, itmw_1h_feuerklinge) || Hlp_IsItem (waffe, itmw_2h_feuerklinge))
	{
		Wld_PlayEffect ("spellFX_Firestorm", slf, slf, 0, 0, 0, FALSE);
		if ((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			b_magichurtother (oth, slf, 100);
		}
		else if ((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf))
		{
			b_magichurtother (oth, slf, 400);
		}
		else
		{
			b_magichurtother (oth, slf, 200);
		};
	};
	if (Hlp_IsItem (waffe, itmw_1h_wasserklinge) || Hlp_IsItem (waffe, itmw_2h_wasserklinge))
	{
		Wld_PlayEffect ("spellFX_Waterfist", slf, slf, 0, 0, 0, FALSE);
		if ((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.guild == GIL_Gargoyle) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
		{
			b_magichurtother (oth, slf, 400);
		}
		else if ((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE) || (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf))
		{
			b_magichurtother (oth, slf, 100);
		}
		else
		{
			b_magichurtother (oth, slf, 200);
		};
	};
	if (Hlp_IsItem (waffe, itmw_1h_sturmklinge) || Hlp_IsItem (waffe, itmw_2h_sturmklinge))
	{
		Wld_PlayEffect ("spellFX_WindFist", slf, slf, 0, 0, 0, FALSE);
		b_magichurtother (oth, slf, 200);
	};
	if (Hlp_IsItem (waffe, itmw_1h_schrumpfer) || Hlp_IsItem (waffe, itmw_2h_schrumpfer))
	{
		Wld_PlayEffect ("spellFX_Shrink", slf, slf, 0, 0, 0, FALSE);
		if ((slf.flags != NPC_FLAG_IMMORTAL) && !C_NpcIsUndead (slf) && (slf.guild > GIL_SEPERATOR_HUM) && (slf.aivar[AIV_MM_ShrinkState] == 0))
		{
			Npc_ClearAIQueue (slf);
			B_ClearPerceptions (slf);
			AI_StartState (slf, ZS_MagicShrink, 0, "");
		};
	};
	if (Hlp_IsItem (waffe, itmw_2h_feuerkriegerklinge))
	{
		if ((250 - slf.protection[PROT_EDGE]) > 5)
		{
			Npc_ChangeAttribute (oth, ATR_MANA, 250 - slf.protection[PROT_EDGE]);
		}
		else
		{
			Npc_ChangeAttribute (oth, ATR_MANA, 5);
		};
	};
	if (Hlp_IsItem (waffe, itmw_1h_daemonenschneide) || Hlp_IsItem (waffe, itmw_2h_daemonenschneide))
	{
		if ((slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) && (slf.flags != NPC_FLAG_IMMORTAL))
		{
			Wld_PlayEffect ("spellFX_BELIARSRAGE", slf, slf, 0, 0, 0, FALSE);
			B_MagicHurtNpc (oth, slf, 300);
		};
	};
};