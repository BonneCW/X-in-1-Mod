instance B5_9000_Mage (Npc_Default)
{
  name = "Narsus";
  guild = GIL_Bad;
  npctype = NPCTYPE_FRIEND;
  level = 50;
  voice = 4;
  id = 9000;
  flags = NPC_FLAG_IMMORTAL;

  B_SetAttributesToChapter(self, 6);

  B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_FIREARMOR_Addon);
  Mdl_ApplyOverlayMds(self, "Humans_Mage.mds");
  Mdl_SetModelFatness(self, 0);

  B_SetFightSkills(self, 30);

  CreateInvItems(self, ItPo_Health_03, 10);

  senses = SENSE_SEE | SENSE_SMELL;
  senses_range = 2000;

  fight_tactic = FAI_HUMAN_MASTER;

  daily_routine = Rtn_start_9000;

  aivar[Aiv_IgnoresArmor] = TRUE;

  B_GiveNpcTalents(self);
  aivar[Aiv_MagicUser] = MAGIC_ALWAYS;
};

func void Rtn_Start_9000 ()
{
  TA_Stand_WP(23,00,08,00,"NW_XARDAS_PATH_FARM1_11");
  TA_Stand_WP(08,00,23,00,"NW_XARDAS_PATH_FARM1_11");
};

func void Rtn_WaitForFriends_9000 ()
{
  TA_Stand_ArmsCrossed(23,00,08,00,"BIGCROSS");
  TA_Stand_ArmsCrossed(08,00,23,00,"BIGCROSS");
};

func void Rtn_Smalltalk_9000 ()
{
  TA_Smalltalk(23,00,08,00,"BIGCROSS");
  TA_Smalltalk(08,00,23,00,"BIGCROSS");
};
