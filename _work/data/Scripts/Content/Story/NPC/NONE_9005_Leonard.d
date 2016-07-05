instance None_9005_Leonard (Npc_Default)
{
  name = "Leonard";
  guild = GIL_None;
  id = 9005;
  voice = 1;
  flags = 0;
  npcType = NPCTYPE_AMBIENT;
  B_SetAttributesToChapter (self, 3);
  fight_tactic = FAI_HUMAN_NORMAL;
  EquipItem(self, ItMw_1h_Bau_Mace);
  B_CreateAmbientInv(self);
  B_SetNpcVisual(self, MALE, "Hum_Head_Thief", FACE_N_Normal01, BodyTex_N, ITAR_BAU_L);
  Mdl_SetModelFatness(self, 1);
  Mdl_ApplyOverlayMds(self, "Humans_Tired.mds");
  B_GiveNpcTalents(self);
  B_SetFightSkills(self, 20);
  daily_routine = Rtn_Start_9005;
};

func void Rtn_Start_9005 ()
{
  TA_Sit_Bench(08,00,23,00,"NW_TAVERNE_GREGSBENCH");
  TA_Sit_Bench(23,00,08,00,"NW_TAVERNE_GREGSBENCH");
};
