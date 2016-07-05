INSTANCE VLK_6021_Aeron (Npc_Default)	
{
	// ------ NSC ------
	name 		= "Aeron";
	guild 		= GIL_VLK;
	id 			= 6021;
	voice 		= 7;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Axe);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Fingers, BodyTex_N, ITAR_moL);	
	Mdl_SetModelFatness	(self, 0.9);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6021;
};

FUNC VOID Rtn_Start_6021 ()
{	
	TA_Stand_Drinking		(07,00,22,00,"UL_TENT");
	
	TA_Sleep	(22,00,07,00,"UL_BED");
		
};

FUNC VOID Rtn_Burg_6021 ()
{
	TA_Stand_Guarding	(08,00,23,00,"AL_GE");	//Joly: im Aufgang zum Feuerdragon
	TA_Stand_Guarding	(23,00,08,00,"AL_GE");	
};



