instance B5_9002_Helmchen (NPC_Default)
{
  name = "Lord Helmchen";
  guild = GIL_PAL;
  npctype = NPCTYPE_FRIEND;
  level = 60;
  voice = 4;
  id = 9002;
  flags = NPC_FLAG_IMMORTAL;

  B_SetAttributesToChapter(self, 6);

  B_SetNpcVisual(self, MALE, "Hum_Head_Fighter", Face_N_Normal03, BodyTex_N, ITAR_Pal_Skel);
  Mdl_SetModelFatness (self, 2);
  Mdl_ApplyOverlayMds (self, "Humans_Militia.mds");

  B_SetFightSkills(self, 100);

  CreateInvItems(self, ItPo_Health_03, 10);
  EquipItem(self, ItMw_2H_Blessed_03);

  senses = SENSE_SEE | SENSE_SMELL;
  senses_range = 2000;

  fight_tactic = FAI_HUMAN_STRONG;

  daily_routine = Rtn_start_9002;

  B_GiveNpcTalents(self);
  aivar[aiv_ignoresarmor] = true;
};

func void Rtn_Start_9002 ()
{
  TA_Stand_Guarding(23,00,08,00,"NW_XARDAS_TOWER_VALLEY_09");
  TA_Stand_Guarding(08,00,23,00,"NW_XARDAS_TOWER_VALLEY_09");
};

func void Rtn_Guide_9002 ()
{
  TA_Guide_Player(08,00,23,00,"NW_XARDAS_TOWER_SECRET_CAVE_01");
  TA_Guide_Player(23,00,08,00,"NW_XARDAS_TOWER_SECRET_CAVE_01");
};

func void Rtn_Smalltalk_9002 ()
{
  TA_Smalltalk(23,00,08,00,"BIGCROSS");
  TA_Smalltalk(08,00,23,00,"BIGCROSS");
};
