//#############################################
//##
//##	Neue Welt
//##
//#############################################

instance VLK_6024_Deep (Npc_Default)
{
	// ------ NSC ------
	name 		= "Deep"; 
	guild 		= GIL_VLK;
	id 			= 6024;
	voice 		= 14;
	flags       = 0;	//Sterblich, optionaler Captain im Kapitel 5!																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_VLK_Sword);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ImportantOld, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6024;
};

FUNC VOID Rtn_Start_6024()
{	
	TA_Stand_guarding	(04,00,19,00,"HL_TH_B");
    TA_Stand_guarding	(19,00,04,00,"HL_TH_B");
};
