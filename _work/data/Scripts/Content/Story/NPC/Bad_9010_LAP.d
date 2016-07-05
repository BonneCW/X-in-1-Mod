instance Bad_9010_LAP (Npc_Default)
{
  name = "LAP";
  guild = GIL_Bad;
  npctype = NPCTYPE_FRIEND;
  level = 50;
  voice = 4;
  id = 9010;
  flags = NPC_FLAG_IMMORTAL;

  B_SetAttributesToChapter(self, 6);

  B_SetNpcVisual(self, MALE, "Hum_Head_Pony", Face_N_Player, BodyTex_N, ITAR_XARDAS);
  Mdl_ApplyOverlayMds(self, "Humans_Mage.mds");
  Mdl_SetModelFatness(self, 0);

  B_SetFightSkills(self, 30);

  CreateInvItems(self, ItPo_Health_03, 10);

  senses = SENSE_SEE | SENSE_SMELL;
  senses_range = 2000;

  fight_tactic = FAI_HUMAN_MASTER;

  daily_routine = Rtn_start_9010;

  aivar[Aiv_IgnoresArmor] = TRUE;

  B_GiveNpcTalents(self);
  aivar[Aiv_MagicUser] = MAGIC_ALWAYS;
};

func void Rtn_Start_9010 ()
{
  TA_Stand_ArmsCrossed(23,00,08,00,"NW_MONASTERY_CHURCH_03");
  TA_Stand_ArmsCrossed(08,00,23,00,"NW_MONASTERY_CHURCH_03");
};
