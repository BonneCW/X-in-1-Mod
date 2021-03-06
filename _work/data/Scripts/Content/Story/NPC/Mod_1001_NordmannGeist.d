instance Mod_1001_NordmannGeist (Npc_Default)
{
	// ------ NSC ------
	name 		= "NordmannGeist";
	guild 		= GIL_OUT;
	id 			= 1001;
	voice 		= 6;
	flags       = NPC_FLAG_GHOST;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_ToughBart01, BodyTex_N, ITAR_SLD_M);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	

	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abh�ngig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen f�r Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1001;
};

FUNC VOID Rtn_Start_1001 ()
{
	TA_Stand_Guarding	(07,55,22,55,"DT_E1_07");
	TA_Stand_Guarding	(22,55,07,55,"DT_E1_07");
};

FUNC VOID Rtn_Tot_1001 ()
{
	TA_Stand_Guarding	(07,55,22,55,"TOT");
	TA_Stand_Guarding	(22,55,07,55,"TOT");
};