instance B5_9001_Drakash (NPC_Default)
{
  name = "Drakash";
  guild = GIL_None;
  npctype = NPCTYPE_FRIEND;
  level = 60;
  voice = 4;
  id = 9001;
  flags = NPC_FLAG_IMMORTAL;

  B_SetAttributesToChapter(self, 6);

  B_SetNpcVisual(self, MALE, "HUM_Head_FatBald", Face_N_Normal03, BodyTex_N, ITAR_MayaZombie_Addon);
  Mdl_SetModelFatness (self, 2);
  Mdl_ApplyOverlayMds (self, "Humans_Tired.mds");

  B_SetFightSkills(self, 100);

  CreateInvItems(self, ItPo_Health_03, 10);
  EquipItem(self, ItMw_Inquisitor);

  senses = SENSE_SEE | SENSE_SMELL;
  senses_range = 2000;

  fight_tactic = FAI_HUMAN_STRONG;

  daily_routine = Rtn_start_9001;

  B_GiveNpcTalents(self);
  aivar[aiv_ignoresarmor] = true;
};

func void Rtn_Start_9001 ()
{
  TA_Stand_Guarding(23,00,08,00,"NW_CITY_TO_FOREST_02");
  TA_Stand_Guarding(08,00,23,00,"NW_CITY_TO_FOREST_02");
};

func void Rtn_Smalltalk_9001 ()
{
  TA_Smalltalk(23,00,08,00,"BIGCROSS");
  TA_Smalltalk(08,00,23,00,"BIGCROSS");
};

func void Rtn_Tot_9001 ()
{
  TA_Smalltalk(23,00,08,00,"TOT");
  TA_Smalltalk(08,00,23,00,"TOT");
};
