

instance VLK_6014_Soeldner (Npc_Default)
{
	// ------ NSC ------
	name 		= "Söldner";
	guild 		= GIL_VLK;
	id 			= 6014;
	voice 		= 13;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 50); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self,  ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Normal03, BodyTex_P, ITAR_mol);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_sStart_6014;
};

FUNC VOID Rtn_sStart_6014 ()
{	
	TA_Sit_Campfire		(08,05,22,05,"HL_N_02");
	TA_Sit_Campfire		(22,05,08,05,"HL_N_02");
};

FUNC VOID Rtn_Start_6014 ()
{	
	TA_Smalltalk		(08,05,22,05,"NW_FOREST_PATH_38");
	TA_stand_Guarding	(22,05,08,05,"NW_CITY_TO_LIGHTHOUSE_13");
};

