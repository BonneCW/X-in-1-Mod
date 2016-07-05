// **************
// B_GivePlayerXP
// **************

func void B_GivePlayerXP (var int add_xp)
{
	if (hero.level == 0)
	{
		hero.exp_next = 500;
	};
	//----------------------------------------------------------------------------
	hero.exp = hero.exp + add_xp;

	//----------------------------------------------------------------------------
	var string concatText;
	concatText = PRINT_XPGained;
	concatText = ConcatStrings (concatText,	IntToString(add_xp));
	PrintScreen	(concatText, -1, YPOS_XPGained, FONT_ScreenSmall, 2);

	//----------------------------------------------------------------------------
	if ( hero.exp >= hero.exp_next ) // ( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
	{
		hero.level = hero.level+1;
		hero.exp_next = hero.exp_next +((hero.level+1)*500);
		
		hero.attribute[ATR_HITPOINTS_MAX] 	= hero.attribute[ATR_HITPOINTS_MAX]	+ HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] 		= hero.attribute[ATR_HITPOINTS]		+ HP_PER_LEVEL;
		
		hero.LP = hero.LP + LP_PER_LEVEL;
				
		PrintScreen (PRINT_LevelUp, -1, YPOS_LevelUp, FONT_Screen, 2);				
		Snd_Play ("LevelUp");
		if ((Npc_GetTalentSkill(hero, NPC_TALENT_REGENERATE) == TRUE) && ((hero.level == 6) || (hero.level == 11) || (hero.level == 21) || (hero.level == 31)))
		  {
		    if (hero.attribute[ATR_REGENERATEHP] > 2)
		      {
			hero.attribute[ATR_REGENERATEHP] = hero.attribute[ATR_REGENERATEHP] - 2;
			hero.attribute[ATR_REGENERATEMANA] = hero.attribute[ATR_REGENERATEMANA] - 2;
		      }
		    else
		      {
			hero.attribute[ATR_REGENERATEHP] = 1;
			hero.attribute[ATR_REGENERATEMANA] = 1;
		      };
		  };
	};
	B_Checklog ();
};








