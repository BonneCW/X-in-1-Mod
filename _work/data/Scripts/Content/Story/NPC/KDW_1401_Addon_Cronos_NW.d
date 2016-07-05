INSTANCE KDW_1401_Addon_Cronos_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cronos";
	guild 		= GIL_KDW;
	id 			= 1401;
	voice 		= 4; 
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Cronos, BodyTex_P, ITAR_KDW_l_addon);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_1401;
};

func void Rtn_PreStart_1401()
{	
	TA_Smalltalk (08,00,20,00,"PORTAL"); 
	TA_Smalltalk (20,00,08,00,"PORTAL");
};

FUNC VOID Rtn_Start_1401 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_STUDY_02");
};

FUNC VOID Rtn_Ringritual_1401 ()
{	
	TA_Circle		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");  
	TA_Circle		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

FUNC VOID Rtn_PreRingritual_1401 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");  
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTALTEMPEL_RITUAL_03");
};

FUNC VOID Rtn_OpenPortal_1401 ()
{	
	TA_Study_WP		(08,00,20,00,"NW_TROLLAREA_PORTAL_KDWWAIT_02"); 
	TA_Study_WP		(20,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_02");
};

FUNC VOID Rtn_TOT_1401 ()
{	
	TA_Sleep		(08,00,20,00,"TOT");  
	TA_Sleep		(20,00,08,00,"TOT");
};
