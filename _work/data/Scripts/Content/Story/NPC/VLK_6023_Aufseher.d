
instance Vlk_6023_Aufseher (Npc_Default) 
{
	// ------ NSC ------
	name 		= "Aufseher";	
	guild 		= GIL_VLK;
	id 			= 6023;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Sld_Axe);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_mom);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6023;
};

FUNC VOID Rtn_Start_6023()
{	
	TA_Stand_Guarding 	(08,00,22,00,"HL_MM_A");
    TA_Stand_Guarding  		(22,00,08,00,"HL_MM_A");
};

FUNC VOID Rtn_malert_6023()
{	
	TA_Stand_Guarding 	(08,00,22,00,"HL_ST_A");
    TA_Stand_Guarding  		(22,00,08,00,"HL_ST_A");
};
