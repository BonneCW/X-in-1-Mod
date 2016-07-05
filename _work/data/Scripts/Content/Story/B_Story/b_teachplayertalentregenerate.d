
func int b_teachplayertalentregenerate(var C_Npc slf,var C_Npc oth,var int grad)
{
	var int kosten;
	var string learn_topic_mana;
	kosten = B_GetLearnCostTalent (oth, NPC_TALENT_REGENERATE, grad);
	if (oth.lp < kosten)
	{
		PrintScreen (PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		return FALSE;
	};
	if (grad == 0)
	{
		Log_CreateTopic (learn_topic_mana, LOG_NOTE);
		B_LogEntry (learn_topic_mana, "Meine magischen Fähigkeiten werden sich nun langsam mit der Zeit regenerieren. ");
		hero.attribute[ATR_REGENERATEMANA] = REGENERATE_TIME_GRAD_0;
		Npc_SetTalentSkill (hero, 21, 1);
		oth.lp = oth.lp - kosten;
	};
	if ((grad == 1) && (hero.attribute[ATR_REGENERATEMANA] == REGENERATE_TIME_GRAD_0))
	{
		Log_CreateTopic (learn_topic_mana, LOG_NOTE);
		B_LogEntry (learn_topic_mana, "Die Regenerationsrate meiner Manaenergie hat sich verbessert. ");
		hero.attribute[ATR_REGENERATEMANA] = REGENERATE_TIME_GRAD_1;
		Npc_SetTalentSkill (hero, 21, 2);
		oth.lp = oth.lp - kosten;
	}
	else if ((grad == 1) && (hero.attribute[ATR_REGENERATEMANA] != REGENERATE_TIME_GRAD_0))
	{
		PrintScreen ("Ich muss erst den ersten Grad lernen. ", -1, -1, FONT_ScreenSmall, 2);
	};
	return TRUE;
};

