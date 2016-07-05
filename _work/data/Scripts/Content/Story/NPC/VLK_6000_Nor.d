
instance VLK_60000_Nor (Npc_Default)
{
	// ------ NSC ------
	name 		= "Nor";
	guild 		= GIL_VLK;
	id 			= 60000;
	voice 		= 12;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Mace_L_04);
	
	// ------ Inventory ------
	// Händler
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart20, BodyTex_N, ITAR_Smith);	
	Mdl_SetModelFatness	(self, 4);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_60000;
};

FUNC VOID Rtn_Start_60000 ()
{	
	TA_Sleep		(22,00,07,00,"HL_S_P"); 
	
	TA_Smith_Fire	(07,00,07,10,"HL_S_F");
	TA_Smith_Anvil	(07,10,07,20,"HL_S_A");
	TA_Smith_Fire	(07,20,07,30,"HL_S_F");
	TA_Smith_Anvil	(07,30,07,40,"HL_S_A");
	TA_Smith_Cool	(07,40,07,50,"HL_S_W");
	TA_Smith_Anvil	(07,50,08,00,"HL_S_A");
	
	TA_Smith_Fire	(08,00,08,10,"HL_S_F");
	TA_Smith_Anvil	(08,10,08,20,"HL_S_A");
	TA_Smith_Fire	(08,20,08,30,"HL_S_F");
	TA_Smith_Anvil	(08,30,08,40,"HL_S_A");
	TA_Smith_Cool	(08,40,08,50,"HL_S_W");
	TA_Smith_Anvil	(08,50,09,00,"HL_S_A");

TA_Smith_Fire	(09,00,09,10,"HL_S_F");
	TA_Smith_Anvil	(09,10,09,20,"HL_S_A");
	TA_Smith_Fire	(09,20,09,30,"HL_S_F");
	TA_Smith_Anvil	(09,30,09,40,"HL_S_A");
	TA_Smith_Cool	(09,40,09,50,"HL_S_W");
	TA_Smith_Anvil	(09,50,10,00,"HL_S_A");

TA_Smith_Fire	(10,00,10,10,"HL_S_F");
	TA_Smith_Anvil	(10,10,10,20,"HL_S_A");
	TA_Smith_Fire	(10,20,10,30,"HL_S_F");
	TA_Smith_Anvil	(10,30,10,40,"HL_S_A");
	TA_Smith_Cool	(10,40,10,50,"HL_S_W");
	TA_Smith_Anvil	(10,50,11,00,"HL_S_A");

TA_Smith_Fire	(11,00,11,10,"HL_S_F");
	TA_Smith_Anvil	(11,10,11,20,"HL_S_A");
	TA_Smith_Fire	(11,20,11,30,"HL_S_F");
	TA_Smith_Anvil	(11,30,11,40,"HL_S_A");
	TA_Smith_Cool	(11,40,11,50,"HL_S_W");
	TA_Smith_Anvil	(11,50,12,00,"HL_S_A");

TA_Smith_Fire	(12,00,12,10,"HL_S_F");
	TA_Smith_Anvil	(12,10,12,20,"HL_S_A");
	TA_Smith_Fire	(12,20,12,30,"HL_S_F");
	TA_Smith_Anvil	(12,30,12,40,"HL_S_A");
	TA_Smith_Cool	(12,40,12,50,"HL_S_W");
	TA_Smith_Anvil	(12,50,13,00,"HL_S_A");

TA_Smith_Fire	(13,00,13,10,"HL_S_F");
	TA_Smith_Anvil	(13,10,13,20,"HL_S_A");
	TA_Smith_Fire	(13,20,13,30,"HL_S_F");
	TA_Smith_Anvil	(13,30,13,40,"HL_S_A");
	TA_Smith_Cool	(13,40,13,50,"HL_S_W");
	TA_Smith_Anvil	(13,50,14,00,"HL_S_A");

TA_Smith_Sharp (14,00,22,00,"HL_S_S");
};
