instance VLK_6017_Akwyn (Npc_Default)
{
	// ------ NSC ------
	name 		= "Akwyn"; 
	guild 		= GIL_VLK;
	id 			= 6017;
	voice 		= 7;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	

	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 100;
	attribute[ATR_DEXTERITY] 		= 100;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 600;
	attribute[ATR_HITPOINTS] 		= 600;																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	
	EquipItem			(self,  ItMw_2h_Sld_Sword);
	EquipItem			(self,  ItRw_Bow_L_03);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart22, BodyTex_N, ITAR_MoL2);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6017;
};

FUNC VOID Rtn_Start_6017 ()
{	
	TA_Stand_Guarding 	(08,00,23,00,"HL_J_01");
	TA_Sleep		(23,00,08,00,"HL_J_02");
};

FUNC VOID Rtn_ShadownHorn_6017 ()
{	
	TA_Guide_Player		(08,00,23,00,"NW_FOREST_PATH_80_1");
	TA_Guide_Player		(23,00,08,00,"NW_FOREST_PATH_80_1");
};
