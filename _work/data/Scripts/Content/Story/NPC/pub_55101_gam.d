
instance PUB_55101_GAM(Npc_Default)

{

	name[0] = "Beliar";

	guild = GIL_VLK;

	id = 55101;

	voice = 3;

	flags = NPC_FLAG_IMMORTAL;

	npcType = npctype_main;

	aivar[AIV_ToughGuy] = TRUE;

	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	aivar[AIV_IGNORE_Murder] = TRUE;

	aivar[AIV_IGNORE_Theft] = TRUE;

	aivar[AIV_IGNORE_Sheepkiller] = TRUE;

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	aivar[AIV_EnemyOverride] = TRUE;

	aivar[AIV_IgnoresFakeGuild] = TRUE;

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

	daily_routine = rtn_start_55101;

};




func void rtn_start_55101()

{

	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW02");

	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW02");

};




instance PUB_55102_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_BAU;
	id = 55102;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55102;
};


func void rtn_start_55102()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW11");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW11");
};


instance PUB_55103_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_KDF;
	id = 55103;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55103;
};


func void rtn_start_55103()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW03");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW03");
};


instance PUB_55104_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_MIL;
	id = 55104;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55104;
};


func void rtn_start_55104()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW04");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW04");
};


instance PUB_55105_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_NONE;
	id = 55105;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55105;
};


func void rtn_start_55105()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW05");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW05");
};


instance PUB_55106_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_NOV;
	id = 55106;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55106;
};


func void rtn_start_55106()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW05");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW05");
};


instance PUB_55107_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_PUBLIC;
	id = 55107;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55107;
};


func void rtn_start_55107()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW07");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW07");
};


instance PUB_55108_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_SLD;
	id = 55108;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55108;
};


func void rtn_start_55108()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW08");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW08");
};


instance PUB_55109_GAM(Npc_Default)
{
	name[0] = "";
	guild = GIL_PAL;
	id = 55109;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
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
	daily_routine = rtn_start_55109;
};


func void rtn_start_55109()
{
	TA_Stand_ArmsCrossed (7, 0, 19, 0, "GAMMELPLATZNW09");
	TA_Stand_ArmsCrossed (19, 0, 7, 0, "GAMMELPLATZNW09");
};

