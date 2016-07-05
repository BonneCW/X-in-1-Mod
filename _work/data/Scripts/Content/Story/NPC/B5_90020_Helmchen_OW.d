instance B5_90020_Helmchen_OW (NPC_Default)
{
  name = "Lord Helmchen";
  guild = GIL_PAL;
  npctype = NPCTYPE_FRIEND;
  level = 60;
  voice = 4;
  id = 90020;
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

  daily_routine = Rtn_start_90020;

  B_GiveNpcTalents(self);
  aivar[aiv_ignoresarmor] = true;
};

func void Rtn_Start_90020 ()
{
  TA_Stand_Guarding(23,00,08,00,"OW_STAND_JERGAN");
  TA_Stand_Guarding(08,00,23,00,"OW_STAND_JERGAN");
};

func void Rtn_Wait_DT_90020 ()
{
  TA_Stand_Guarding(23,00,08,00,"DT_MAINGATE");
  TA_Stand_Guarding(08,00,23,00,"DT_MAINGATE");
};

func void Rtn_OldCamp_90020 ()
{
  TA_Pray_Helmchen(20,00,08,00,"OC_MAGE_CENTER");
  TA_Pray_Helmchen(08,00,20,00,"OC_CENTER_02");
};

// *************************
// NSC betet an aktuellem WP
// *************************

func void ZS_Pray_Helmchen ()
{
  Perception_Set_Normal();
  B_ResetAll (self);
  AI_SetWalkmode(self,NPC_WALK);
  
  if (Npc_GetDistToWP (self,self.wp) > TA_DIST_SELFWP_MAX) 
    {
      AI_GotoWP	(self, self.wp);
    };		
};

func int ZS_Pray_Helmchen_Loop ()
{
  if (!C_BodyStateContains(self, BS_SIT))
    {
      AI_AlignToFP(self);
      AI_PlayAniBS(self, "T_STAND_2_PRAY", BS_SIT);		
    }
  else
    {
      AI_PlayAniBS (self, "T_PRAY_RANDOM", BS_SIT);
    };		
  return LOOP_CONTINUE;
};

func void ZS_Pray_Helmchen_End ()
{
  NPC_StopAni (self,"T_PRAY_RANDOM");
  AI_PlayAni (self, "T_PRAY_2_STAND");	
};

