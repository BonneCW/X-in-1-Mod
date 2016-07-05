
instance PUB_55201_GAM(Npc_Default)
{
	name[0] = "Hodges";
	guild = GIL_PUBLIC;
	id = 55201;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter (self, 4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem (self, ItMw_1h_Bau_Mace);
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItMw_1h_Bau_Axe, 1);
	CreateInvItems (self, ItMw_1h_Vlk_Axe, 1);
	CreateInvItems (self, ItMw_1H_Mace_L_04, 1);
	CreateInvItems (self, ItMw_1h_Sld_Axe, 1);
	CreateInvItems (self, ItMw_1h_Sld_Sword, 1);
	CreateInvItems (self, ItMw_Schwert, 1);
	B_SetNpcVisual (self, MALE, "Hum_Head_FatBald", Face_L_NormalBart01, BodyTex_L, ITAR_Bau_L);
	Mdl_SetModelFatness (self, 1);
	Mdl_ApplyOverlayMds (self, "Humans_Relaxed.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 50);
	daily_routine = rtn_start_55201;
};


func void rtn_start_55201()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZADDON01");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZADDON01");
};


instance PUB_55202_GAM(Npc_Default)
{
	name[0] = "Hodges";
	guild = GIL_NONE;
	id = 55202;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter (self, 4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem (self, ItMw_1h_Bau_Mace);
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItMw_1h_Bau_Axe, 1);
	CreateInvItems (self, ItMw_1h_Vlk_Axe, 1);
	CreateInvItems (self, ItMw_1H_Mace_L_04, 1);
	CreateInvItems (self, ItMw_1h_Sld_Axe, 1);
	CreateInvItems (self, ItMw_1h_Sld_Sword, 1);
	CreateInvItems (self, ItMw_Schwert, 1);
	B_SetNpcVisual (self, MALE, "Hum_Head_FatBald", Face_L_NormalBart01, BodyTex_L, ITAR_Bau_L);
	Mdl_SetModelFatness (self, 1);
	Mdl_ApplyOverlayMds (self, "Humans_Relaxed.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 50);
	daily_routine = rtn_start_55202;
};


func void rtn_start_55202()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZADDON02");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZADDON02");
};

