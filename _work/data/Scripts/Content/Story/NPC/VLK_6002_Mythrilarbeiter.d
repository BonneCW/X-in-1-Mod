
instance VLK_6002_Mythrilarbeiter (Npc_Default)
{
	// ------ NSC ------
	name 		= "Arbeiter"; 
	guild 		= GIL_VLK;
	id 			= 6002;
	voice 		= 1;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem (self, ItMw_2H_Axe_L_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Orry, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen f�r Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6002;
};

FUNC VOID Rtn_Start_6002 ()
{	
	TA_Pick_Ore		(08,00,23,00,"HL_MM_02");
    TA_Smalltalk		(23,00,08,00,"HL_ST_02");
};

FUNC VOID Rtn_malert_6002 ()
{	
	TA_Smalltalk		(08,00,23,00,"HL_ST_02");
   TA_Smalltalk	(23,00,08,00,"HL_ST_02");
};
