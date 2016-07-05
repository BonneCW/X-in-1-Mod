instance VLK_6018_Jaeger (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jäger"; 
	guild 		= GIL_VLK;
	id 			= 6018;
	voice 		= 1;
	flags       = 0;							
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	// ------ Attribute ------
	slf.attribute[ATR_STRENGTH] 		= 100;
	slf.attribute[ATR_DEXTERITY] 		= 100;
	slf.attribute[ATR_MANA_MAX] 		= 0;
	slf.attribute[ATR_MANA] 			= 0;
	slf.attribute[ATR_HITPOINTS_MAX]	= 600;
	slf.attribute[ATR_HITPOINTS] 		= 600;																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self,  ItMw_2h_Sld_Sword);
EquipItem			(self,  ItRw_Bow_L_03);
	
	// ------ Inventory ------

	
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_Mol2);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6018;
};

FUNC VOID Rtn_Start_6018 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"HL_J_02");
    TA_Sleep		(22,00,08,00,"HL_J_02");
};
