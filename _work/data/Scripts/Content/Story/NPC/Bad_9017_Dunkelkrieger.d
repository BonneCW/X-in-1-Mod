instance Bad_9017_Leiche  (Npc_Default)
{
  // ------ NSC ------
  name 		= "Toter Alchemist";
  guild 		= GIL_BAD;
  id 			= 9017;
  voice 		= 4;
  flags       = 0;
  npctype		= NPCTYPE_MAIN;	
	
  // ------ Attribute ------
  B_SetAttributesToChapter (self, 6);
		
  // ------ Kampf-Taktik ------
  fight_tactic = FAI_HUMAN_STRONG;	
  
  // ------ Equippte Waffen ------
  EquipItem(self, ItMw_2H_Golemfaust);
	
  // ------ Inventory ------
  B_CreateAmbientInv_BAD(7);
	
  // ------ visuals ------
  B_SetNpcVisual 	(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N, ORE_ARMOR_M);	
  Mdl_SetModelFatness	(self, 0);
  Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
  // ------ NSC-relevante Talente vergeben ------
  B_GiveNpcTalents (self);
	
  // ------ Kampf-Talente ------																		
  B_SetFightSkills (self, 70); 

  // ------ TA anmelden ------
  daily_routine 		= Rtn_Start_9017;
};

func void Rtn_Start_9017 ()
{
  TA_Stand_WP(00,00,12,00,"WP_DRAGONISLAND_UNDEAD_LORDROOM_01"); 
  TA_Stand_WP(12,00,00,00,"WP_DRAGONISLAND_UNDEAD_LORDROOM_01");
};

  /*
    WegPunkt:

    Tote(6):
    DI_ORKAREA_04
    DI_ORKAREA_05
    DI_ORKAREA_TROLL
    DI_ORKAREA_15
    DI_DRACONIANAREA_4
    WP_DRAGONISLAND_UNDEAD_LORDROOM_01

    Lebend(4):
    WP_DRAGONISLAND_UNDEAD_LAB_01 (Waffenmeister)
    DI_SHIP_02
    DI_SHIP_03
    DI_SHIP_04

    LAP:
    SHIP_DECK_10
  */
