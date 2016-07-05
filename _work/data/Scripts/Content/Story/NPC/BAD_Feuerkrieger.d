instance Bad_Feuerkrieger (Npc_Default)
{
  // ------ NSC ------
  name = "Feuerkrieger";
  guild	= GIL_BAD;
  voice	= 19;
  flags = 0;
  npctype = NPCTYPE_FRIEND;
  aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	
  // ------ Attribute ------
  level = 0;
		
  attribute[ATR_STRENGTH] 		= 200;
  aivar[REAL_STRENGTH]			= 200;
  attribute[ATR_DEXTERITY] 		= 200;
  aivar[REAL_DEXTERITY]			= 200;
  attribute[ATR_MANA_MAX] 		= 1000;
  aivar[REAL_MANA_MAX]			= 1000;
  attribute[ATR_MANA] 			= 1000;
  attribute[ATR_HITPOINTS_MAX]	= 760;
  attribute[ATR_HITPOINTS] 		= 760;
				
  // ------ Kampf-Taktik ------
  fight_tactic		= FAI_HUMAN_STRONG;	
	
  // ------ Equippte Waffen ------
  EquipItem (self, ItMw_2H_Feuerkriegerklinge); //Feuerkriegerschwert einfügen
	
  // ------ Inventory ------
	
  // ------ visuals ------
  B_SetNpcVisual        (self, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);	
  Mdl_SetModelFatness	(self, 1);
  Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
  // ------ NSC-relevante Talente vergeben ------
  B_GiveNpcTalents (self);
	
  // ------ Kampf-Talente ------
  B_SetFightSkills (self, 100); 
	
  // ------ TA anmelden ------
  start_aistate = ZS_Feuerkrieger;
};

func void B_BAD_AssessDamage ()
{
  if (Npc_IsPlayer(other))
    {
      return;
    };
  B_AssessDamage ();
};

func void ZS_Feuerkrieger ()
{
  Npc_SetPercTime (self, 1);
  Npc_PercEnable  (self, PERC_ASSESSPLAYER, B_MM_AssessPlayer);
  Npc_PercEnable  (self, PERC_ASSESSENEMY, B_AssessEnemy);
  Npc_PercEnable  (self, PERC_ASSESSMAGIC, B_AssessMagic);
  Npc_PercEnable  (self, PERC_ASSESSDAMAGE, B_BAD_AssessDamage);
  Npc_PercEnable  (self, PERC_ASSESSFIGHTSOUND, B_MM_AssessOthersDamage);
  B_SetAttitude   (self, ATT_FRIENDLY);
  self.aivar[AIV_PARTYMEMBER] = TRUE;
  AI_StandUp      (self);
  AI_SetWalkmode  (self, NPC_RUN);
};

func int ZS_Feuerkrieger_Loop ()
{
  if (Npc_KnowsInfo(hero, DIA_Dragon_Undead_Hello))
    {
      self.protection [PROT_FIRE]  = 	50;
      self.protection [PROT_MAGIC] = 	50;
    }
  else
    {
      self.protection [PROT_FIRE]  = 	IMMUNE;
      self.protection [PROT_MAGIC] = 	IMMUNE;
    };
  if (Npc_IsInFightMode(self,FMODE_MELEE))
    {
      AI_RemoveWeapon (self);
    };
  if ((Npc_GetDistToNpc (self, hero) > 500) 
      && (((Npc_GetDistToNpc (hero, Dragon_Fire_Island) > 4000) 
	   || (Npc_KnowsInfo(hero, DIA_Dragon_Fire_Island_Hello))) 
	  && ((Npc_GetDistToNpc(hero, Dragon_Undead) > 4000) 
	      || (Npc_KnowsInfo(hero, DIA_Dragon_Undead_Hello)))))
    {
      AI_GotoNpc (self, hero);
    }
  else
    {
      if (Npc_GetStateTime(self) >= 1)
	{
	  //Wegdrehen vom Spieler (damit er die Umgebung im Auge behält)
	  if (Npc_CanSeeNpc(self, hero))
	    {
	      AI_TurnAway (self, hero);
	    };

	  //Manaverbrauch
	  var int Manaverbrauch;
	  Manaverbrauch = Npc_GetStateTime(self);
	  if (Manaverbrauch > self.attribute[ATR_MANA])
	    {
	      Manaverbrauch = Manaverbrauch - self.attribute[ATR_MANA];
	      self.attribute[ATR_MANA] = 0;
	      if (Manaverbrauch > hero.attribute[ATR_MANA])
		{
		  hero.attribute[ATR_MANA] = 0;
		  Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
		}
	      else
		{
		 hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] - Manaverbrauch;
		};
	    }
	  else
	    {
	      self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - Manaverbrauch;
	    };

	  //Regeneration
	  if ((self.attribute[ATR_HITPOINTS_MAX] > self.attribute[ATR_HITPOINTS]) && (self.attribute[ATR_HITPOINTS] > 0))
	    {
	      Npc_ChangeAttribute (self, ATR_HITPOINTS, Npc_GetStateTime(self));
	    };
	  Npc_SetStateTime(self, 0);
	};
    };
  self.wp = Npc_GetNearestWP (self);
  return LOOP_CONTINUE;
};

func void ZS_Feuerkrieger_End ()
{
};
