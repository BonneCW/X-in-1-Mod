
instance VLK_6022_Vulnus (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vulnus";
	guild 		= GIL_NONE;
	id 			= 6022;
	voice 		= 13;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	
	//--------Aivars-------------
	aivar[AIV_ToughGuy] = TRUE; 
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);			
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------					
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_MadPsi, BodyTex_N, ITAR_kdm_h);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------				
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6022;
};

FUNC VOID Rtn_Start_6022 ()
{	
TA_Stand_ArmsCrossed	(08,00,23,00,"HL_MF_K");
   TA_Stand_ArmsCrossed			(23,00,08,00,"HL_MF_K");
};
 

