
instance VLK_6015_Marvin (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marvin";
	guild 		= GIL_VLK;
	id 			= 6015;
	voice 		= 7;
	flags       = 0;																	//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 15); //Grenzen für Talent-Level liegen bei 30 und 60
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self,  ItMw_2h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal17, BodyTex_N, ITAR_moL);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed

	// ------ TA anmelden ------
	daily_routine 		= Rtn_sStart_6015;
};

FUNC VOID Rtn_sStart_6015 ()
{	
	TA_Sit_Campfire (08,05,22,05,"HL_N_03");
    TA_Sit_Campfire (22,05,08,05,"HL_N_03");
};

FUNC VOID Rtn_Start_6015 ()
{	
	TA_Stand_guarding (08,05,22,05,"NW_FOREST_PATH_35_07");
    TA_Stand_Guarding (22,05,08,05,"NW_FOREST_PATH_35_07");
};
