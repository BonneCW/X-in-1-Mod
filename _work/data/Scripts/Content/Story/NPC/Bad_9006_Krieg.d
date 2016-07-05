var int Bad_Ritual;
// Die Dunkelmagier für Dunkle Magie

PROTOTYPE Default_DarkMage (C_Npc)			
{
  // ------ Attribute ------
  attribute	[ATR_STRENGTH] 			= 10;
  aivar		[REAL_STRENGTH]			= 10;
  attribute	[ATR_DEXTERITY] 		= 10;
  aivar		[REAL_DEXTERITY]		= 10;
  attribute	[ATR_MANA_MAX] 			= 10;
  aivar		[REAL_MANA_MAX]			= 10;
  attribute	[ATR_MANA] 				= 10;
  attribute	[ATR_HITPOINTS_MAX] 	= 40;
  attribute	[ATR_HITPOINTS] 		= 40;
  
  HitChance	[NPC_TALENT_1H]			= 0; 					//ALLE AUF 0! Wichtig, weil B_AddFightSkill im NPC-Instanz-Script den gesetzten Wert ADDIERT
  HitChance	[NPC_TALENT_2H]			= 0;
  HitChance	[NPC_TALENT_BOW]		= 0;
  HitChance	[NPC_TALENT_CROSSBOW]	= 0;
  
  // ------ Grund-Schadensresistenzen: Keine ------
  protection	[PROT_EDGE]				= 0;
  protection	[PROT_BLUNT]			= 0;
  protection	[PROT_POINT]			= 0;
  protection	[PROT_FIRE]				= 0;
  protection	[PROT_MAGIC]			= 0;
  
  // ------ Schdenstyp im Faustkampf ------
  damagetype 							= DAM_BLUNT;
  
  // ------ senses ------
  senses			=	SENSE_HEAR | SENSE_SEE ;
  senses_range	=	PERC_DIST_ACTIVE_MAX;					//in AI_Constants.d
  
  // ----- aivar Defaultwerte  ------
  
  aivar[AIV_MM_FollowTime] = NPC_TIME_FOLLOW;
  aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
  
  bodyStateInterruptableOverride = FALSE;
  guild = GIL_Bad;
  npctype = NPCTYPE_FRIEND;
  level = 50;
  voice = 4;
  flags = NPC_FLAG_IMMORTAL;

  B_SetAttributesToChapter(self, 6);

  B_SetNpcVisual(self, MALE, "Hum_Head_Bald", Face_N_Xardas, BodyTex_N, ITAR_Xardas);
  Mdl_ApplyOverlayMds(self, "Humans_Mage.mds");
  Mdl_SetModelFatness(self, 0);

  B_SetFightSkills(self, 30);

  CreateInvItems(self, ItPo_Health_03, 10);

  senses = SENSE_SEE | SENSE_SMELL;
  senses_range = 2000;

  fight_tactic = FAI_HUMAN_MASTER;

  aivar[Aiv_IgnoresArmor] = TRUE;

  B_GiveNpcTalents(self);
  aivar[Aiv_MagicUser] = MAGIC_ALWAYS;
  aivar[AIV_EnemyOverride] = TRUE;
};

INSTANCE Bad_9006_Krieg (Default_DarkMage)
{
  name = "Hüter des Krieges";
  id = 9006;
  daily_routine = Rtn_Start_9006;
};

INSTANCE Bad_9007_Pest (Default_DarkMage)
{
  name = "Hüter der Pest";
  id = 9007;
  daily_routine = Rtn_Start_9007;
};

INSTANCE Bad_9008_Hunger (Default_DarkMage)
{
  name = "Hüter des Hungers";
  id = 9008;
  daily_routine = Rtn_Start_9008;
};

INSTANCE Bad_9009_Tod (Default_DarkMage)
{
  name = "Hüter der Todes";
  id = 9009;
  daily_routine = Rtn_Start_9009;
};

func void Rtn_Start_9006 ()
{
  TA_Hueter(0,0,12,0,"OC_RAMP_16");
  TA_Hueter(12,0,0,0,"OC_RAMP_16");
};

func void Rtn_NW_9006 ()
{
  TA_Hueter(0,0,12,0,"NW_LITTLESTONEHENDGE");
  TA_Hueter(12,0,0,0,"NW_LITTLESTONEHENDGE");
};

func void Rtn_Tot_9006 ()
{
  TA_Hueter(0,0,12,0,"TOT");
  TA_Hueter(12,0,0,0,"TOT");
};

func void Rtn_Start_9007 ()
{
  TA_Hueter(0,0,12,0,"NW_CITY_KANAL_06");
  TA_Hueter(12,0,0,0,"NW_CITY_KANAL_06");
};

func void Rtn_Ritual_9007 ()
{
  TA_Hueter(0,0,12,0,"NW_LITTLESTONEHENDGE_02");
  TA_Hueter(12,0,0,0,"NW_LITTLESTONEHENDGE_02");
};

func void Rtn_Start_9008 ()
{
  TA_Hueter(0,0,12,0,"NW_FARM2_PATH_02");
  TA_Hueter(12,0,0,0,"NW_FARM2_PATH_02");
};

func void Rtn_Ritual_9008 ()
{
  TA_Hueter(0,0,12,0,"NW_LITTLESTONEHENDGE");
  TA_Hueter(12,0,0,0,"NW_LITTLESTONEHENDGE");
};

func void Rtn_Start_9009 ()
{
  TA_Hueter(0,0,12,0,"ADW_MINE_MC_01");
  TA_Hueter(12,0,0,0,"ADW_MINE_MC_01");
};

func void Rtn_NW_9009 ()
{
  TA_Hueter(0,0,12,0,"NW_LITTLESTONEHENDGE_01");
  TA_Hueter(12,0,0,0,"NW_LITTLESTONEHENDGE_01");
};

func void Rtn_Tot_9009 ()
{
  TA_Hueter(0,0,12,0,"TOT");
  TA_Hueter(12,0,0,0,"TOT");
};

func void ZS_Bad_Routine ()
{
  Perception_Set_Normal();
  AI_SetWalkmode(self, NPC_WALK);
  if (Npc_GetDistToWP(self, self.WP) > 1000)
    {
      if (Npc_GetDistToNpc(self, hero) < 10000)
	{
	  AI_PlayAni(self, "T_RUN_2_MAG");
	  AI_PlayAni(self, "T_MAG_2_MAGRUN");
	  AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	  Wld_PlayEffect("spellFX_Teleport", self, self, 0, 0, 0, FALSE);
	};
      AI_Teleport(self, self.WP);
    };
  AI_GotoWP (self, self.WP);
  AI_AlignToWP(self);
};

func int ZS_Bad_Routine_Loop ()
{
  if (kennt_Steinkreis)
    {
      if ((((self.id == 9006) && Npc_KnowsInfo(hero, Bad_Krieg_Speak))
	   || ((self.id == 9009) && Npc_KnowsInfo(hero, Bad_Tod_Speak)))
	  && (CurrentLevel != NEWWORLD_ZEN)
	  && (Npc_GetDistToWP(self, "TOT") > 1000)
	  && (self.aivar[AIV_INVINCIBLE] == FALSE))
	{
	  Npc_ExchangeRoutine(self, "Tot");
	  return LOOP_END;
	};
      if ((((self.id == 9006) && Npc_KnowsInfo(hero, Bad_Krieg_Speak))
	   || ((self.id == 9009) && Npc_KnowsInfo(hero, Bad_Tod_Speak)))
	  && (CurrentLevel != NEWWORLD_ZEN)
	  && (Npc_GetDistToWP(self, "TOT") <= 1000))
	{
	  self.flags = 0;
	  Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
	  return LOOP_END;
	};
      if ((self.id == 9007)
	  && Npc_KnowsInfo(hero, Bad_Pest_Speak)
	  && (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE_02") > 1000)
	  && (self.aivar[AIV_INVINCIBLE] == FALSE))
	{
	  Npc_ExchangeRoutine(self, "Ritual");
	  return LOOP_END;
	};
      if ((self.id == 9008)
	  && Npc_KnowsInfo(hero, Bad_Hunger_Speak)
	  && (Npc_GetDistToWP(self, "NW_LITTLESTONEHENDGE") > 1000)
	  && (self.aivar[AIV_INVINCIBLE] == FALSE))
	{
	  Npc_ExchangeRoutine(self, "Ritual");
	  return LOOP_END;
	};
    };
  if ((Bad_Ritual == 1) && (self.id == 9006))
    {
      Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
      AI_PlayAni (self,"T_PRACTICEMAGIC5");	
      Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
      Bad_Ritual = 2;
      return LOOP_CONTINUE;
    };
  if ((Bad_Ritual == 2) && (self.id == 9007))
    {
      AI_PlayAni (self,"T_PRACTICEMAGIC5");	
      Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
      Bad_Ritual = 3;
      return LOOP_CONTINUE;
    };
  if ((Bad_Ritual == 3) && (self.id == 9008))
    {
      AI_PlayAni (self,"T_PRACTICEMAGIC5");	
      Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
      Bad_Ritual = 4;
      return LOOP_CONTINUE;
    };
  if ((Bad_Ritual == 4) && (self.id == 9009))
    {
      Wld_PlayEffect("FX_EarthQuake",  self, self, 0, 0, 0, FALSE );
      AI_PlayAni (self,"T_PRACTICEMAGIC5");	
      Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  self, self, 0, 0, 0, FALSE );
      Bad_Ritual = 5;
      return LOOP_CONTINUE;
    };
  if (Npc_GetStateTime(self) > 5)
    {
      var int randomMove;
      randomMove = Hlp_Random(6);
      if (randomMove == 0) {AI_PlayAni(self, "R_LEGSHAKE");};
      if (randomMove == 1) {AI_PlayAni(self, "R_SCRATCHLSHOULDER");};
      if (randomMove == 2) {AI_PlayAni(self, "R_SCRATCHEGG");};
      if (randomMove == 3) {AI_PlayAni(self, "R_SCRATCHHEAD");};
      if (randomMove == 4) {AI_PlayAni(self, "R_SCRATCHRSHOULDER");};
      if (randomMove == 5) {AI_PlayAni(self, "T_PRACTICEMAGIC");};
      Npc_SetStateTime(self, 0);
    };
  return LOOP_CONTINUE;
};

func void ZS_Bas_Routine_End ()
{
};








