//Nur-Shak aus "Bumshak" als Gastrolle

instance Orc_9011_Nur_Shak (Mst_Default_OrcElite)
{
  name = "Nur-Shak";
  id = 9011;
  flags = NPC_FLAG_IMMORTAL;
  Npctype = NPCTYPE_MAIN;
  
  Mdl_SetVisual		(self,	"Orc.mds");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
  Mdl_SetVisualBody	(self,	"Orc_BodyElite",	DEFAULT,	DEFAULT,	"Orc_HeadWarrior",	DEFAULT,  	DEFAULT,	-1);
  
  //-------- inventory --------
  EquipItem (self, ITMW_2H_ORCAXE_04);
  
  //----- Daily Routine ----
  daily_routine = Rtn_Start_9011;
};

func void Rtn_Start_9011 ()
{
  TA_Stand_WP (0,0,12,0,"OC_PATH_01");
  TA_Stand_WP (12,0,0,0,"OC_PATH_01");
};
