
instance VLK_6012_Waldwache (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wald-Wächter";	
	guild 		= GIL_VLK;
	id 			= 6012;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Mil_Sword);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Bullit, BodyTex_N, ITAR_Mw);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6012;
};

FUNC VOID Rtn_Start_6012()
{	
	TA_Stand_Guarding	(01,00,03,00,"HL_WW_02");
	TA_Stand_Guarding	(03,00,05,00,"HL_WW_01");
	
};
