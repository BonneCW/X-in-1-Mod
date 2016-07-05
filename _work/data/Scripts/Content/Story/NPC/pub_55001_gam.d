
instance PUB_55001_GAM(Npc_Default)

{

	name[0] = "Hodges";

	guild = GIL_PUBLIC;

	id = 55001;

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

	daily_routine = rtn_start_55001;
};




func void rtn_start_55001()
{

	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZ01");

	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZ01");

};




instance PUB_55002_GAM(Npc_Default)

{

	name[0] = "Hodges";

	guild = GIL_MIL;

	id = 55002;
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

	daily_routine = rtn_start_55002;

};




func void rtn_start_55002()

{

	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZ02");

	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZ02");

};




instance PUB_55003_GAM(Npc_Default)

{

	name[0] = "Hodges";

	guild = GIL_DMT;

	id = 55003;

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

	daily_routine = rtn_start_55003;

};




func void rtn_start_55003()

{

	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZ03");

	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZ03");

};

