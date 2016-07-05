

instance VLK_6026_John (Npc_Default)
{
	// ------ NSC ------
	name 		= "John"; 
	guild 		= GIL_STRF;
	id 			= 6026;
	voice 		= 7;
	flags       = 0;							//NPC_FLAG_IMMORTAL oder 0
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;																	//setzt Attribute und LEVEL entsprechend dem angegebenen Kapitel (1-6)
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	// MASTER / STRONG / COWARD
	
	// ------ Equippte Waffen ------																	//Munition wird automatisch generiert, darf aber angegeben werden
	EquipItem			(self, ItMw_Schwert2);



	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			//Muss NACH Attributen kommen, weil in B_SetNpcVisual die Breite abh. v. STR skaliert wird
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Tough_Drago, BodyTex_P, ITAR_mom);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		//Der enthaltene B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance% - alle Kampftalente werden gleichhoch gesetzt
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6026;
};
FUNC VOID Rtn_Start_6026 ()
{
	TA_Stand_GUARDING 			(07,45,23,45,"NW_CITY_TO_LIGHTHOUSE_15");
    TA_Stand_GUARDING 					(23,45,07,45,"NW_CITY_TO_LIGHTHOUSE_15");		
};

FUNC VOID Rtn_follow_6026 ()
{
	TA_Follow_Player			(07,45,23,45,"NW_CITY_TO_LIGHTHOUSE_15");
   TA_Follow_Player					(23,45,07,45,"NW_CITY_TO_LIGHTHOUSE_15");		
};
