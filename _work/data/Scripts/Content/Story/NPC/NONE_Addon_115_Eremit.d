INSTANCE NONE_ADDON_115_Eremit (Npc_Default)
{
	// ------ NSC ------
	name 		= "Eremit";
	guild 		= GIL_NONE;
	id 			= 115;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Bau_Mace);
		
	// ------ Inventory ------

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak_BaalNetbek, BodyTex_N, NO_ARMOR);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_115;
};

FUNC VOID Rtn_Start_115 ()
{	
	TA_Sit_Bench  	(07,00,09,00,"ADW_VALLEY_BENCH");
	TA_Cook_Pan 	(09,00,11,00,"ADW_VALLEY_BENCH");
	TA_Stand_Eating (11,00,13,00,"ADW_VALLEY_BENCH"); 
    TA_Sit_Bench  	(13,00,15,00,"ADW_VALLEY_BENCH");
    TA_Cook_Pan 	(15,00,17,00,"ADW_VALLEY_BENCH");
    TA_Stand_Eating (17,00,19,00,"ADW_VALLEY_BENCH"); 
    TA_Sit_Bench  	(19,00,01,00,"ADW_VALLEY_BENCH");
    TA_Sleep 		(01,00,07,00,"ADW_VALLEY_PATH_031_HUT");
};

func void rtn_flee_115()
{
	TA_Sit_Campfire (7, 0, 15, 0, "WP_PIR_02");
	TA_Sit_Campfire (15, 0, 7, 0, "WP_PIR_02");
};

func void rtn_follow_115()
{
	TA_Follow_Player (8, 0, 23, 0, "ADW_VALLEY_PATH_031_HUT");
	TA_Follow_Player (23, 0, 8, 0, "ADW_VALLEY_PATH_031_HUT");
};

func void rtn_vampir_115()
{
	TA_Smalltalk (12, 35, 17, 0, "ADW_VALLEY_PATH_058_CAVE_222");
	TA_Sit_Bench (17, 0, 0, 30, "ADW_VAMPIR_01");
	TA_Sleep (0, 30, 4, 0, "ADW_VAMPIR_06");
	TA_Stand_Drinking (4, 0, 8, 0, "ADW_VAMPIR_01");
	TA_Sit_Bench (8, 0, 12, 35, "ADW_VAMPIR_01");
};

func void rtn_lager_115()
{
	TA_Stand_ArmsCrossed (21, 0, 1, 0, "BL_INN_04");
	TA_Stand_ArmsCrossed (1, 0, 21, 0, "ADW_VAMPIR_01");
};

func void rtn_lager_2_115()
{
	TA_Stand_ArmsCrossed (21, 0, 2, 0, "BL_INN_04");
	TA_Stand_Drinking (2, 0, 21, 0, "BL_INN_CORNER_02");
};

