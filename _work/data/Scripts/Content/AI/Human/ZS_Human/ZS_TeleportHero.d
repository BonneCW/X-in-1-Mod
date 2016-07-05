func void ZS_TeleportHero (var string wp)
{
  Perception_Set_Normal();
  B_ResetAll(hero);
  AI_Teleport(hero, wp);
  hero.aivar[AIV_INVINCIBLE] = FALSE; //Achtung! Nicht sauber, aber wie soll man sonst jetzt noch den Talk-Mode beenden?
  //AI_StartState(hero, ZS_Stand_WP, 0, "");
  return;
};

func void ZS_TeleportHero_Kloster ()
{
  ZS_TeleportHero("NW_MONASTERY_PLACE_03");
  return;
};

func void ZS_TeleportHero_Taverne ()
{
  ZS_TeleportHero("NW_TAVERNE_GREGSBENCH");
  return;
};
