
instance KDW_6019_reton (Npc_Default)
{
	// ------ NSC ------
	name 		= "Reton";	
	guild 		= GIL_BAU;
	id 			= 6019;
	voice 		= 4;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_Master;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_ghs);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart06, BodyTex_N, ITAR_Mom);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_6019;
};
FUNC VOID Rtn_PreStart_6019 ()
{	
	TA_Stand_ArmsCrossed		(06,55,21,00,"NW_CITY_TO_LIGHTHOUSE_15");
TA_Stand_ArmsCrossed		(21,00,6,55,"NW_CITY_TO_LIGHTHOUSE_15");
   
};

FUNC VOID Rtn_Start_6019 ()
{	
	TA_Sit_Throne		(06,55,21,00,"HL_TH_B");
TA_Sleep		(21,00,6,55,"NW_LIGHTHOUSE_IN_03");
   
};

FUNC VOID Rtn_Stehrum_6019 ()
{	
	TA_Stand_Drinking		(06,55,21,00,"NW_PASS_SECRET_01");
TA_Stand_Drinking		(21,00,6,55,"NW_PASS_SECRET_01");
   
};

FUNC VOID Rtn_tot_6019 ()
{	
	TA_Stand_Drinking		(06,55,21,00,"TOT");
TA_Stand_Drinking		(21,00,6,55,"TOT");
   
};
