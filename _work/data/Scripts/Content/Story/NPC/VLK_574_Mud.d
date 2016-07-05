instance VLK_574_Mud (Npc_Default)
{
	//-------- primary data --------

	name =							"Mud";
	npctype =						NpcType_Ambient;
	guild =							GIL_NONE;      
	level =							0;
	
	
	voice =							7;
	id =							574;
	flags = 0;

	// ------ AIVARS ------

	// ------- Attribute -------

	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		10;
	attribute[ATR_MANA] =			10;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- inventory --------                                    

	B_CreateAmbientInv (self);
	//-------- visuals --------
	// 				animations
	B_SetNpcVisual(self, MALE, "Hum_Head_Pony", Face_N_ZombieMud, BodyTex_N, ITAR_Orebaron_Addon);
	Mdl_SetModelFatness(self, 0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");

	B_GiveNpcTalents(self);

	B_SetFightSkills(self, 10);
	
	//-------- Senses --------                                    
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;// für DIREKTES ansprechen
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_574;
};

func void Rtn_Start_574 ()
{
  TA_Stand_ArmsCrossed(08,00,23,00,"OC_EBR_ENTRANCE");
  TA_Stand_ArmsCrossed(23,00,08,00,"OC_EBR_ENTRANCE");
};

func void Rtn_StandForRuin_574 ()
{
  TA_Stand_ArmsCrossed(08,00,23,00,"LOCATION_19_03_PATH_RUIN");
  TA_Stand_ArmsCrossed(23,00,08,00,"LOCATION_19_03_PATH_RUIN");
};

func void Rtn_SitThrone_574 ()
{
  TA_Sit_Throne(08,00,23,00,"OC_EBR_HALL_THRONE");
  TA_Sit_Throne(23,00,08,00,"OC_EBR_HALL_THRONE");
};
