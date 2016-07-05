
instance ABC_90008_NOTBOT2(Npc_Default)
{
	name[0] = "Cipher";
	guild = GIL_HUMAN;
	id = 90008;
	voice = 7;
	flags = 0;
	npcType = NPCTYPE_FRIEND;
	B_SetAttributesToChapter (self, 4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Crossbow_M_01);
	B_CreateAmbientInv (self);
	CreateInvItems (self, ItPo_Health_02, 6);
	CreateInvItems (self, ItMi_OldCoin, 1);
	B_SetNpcVisual (self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, itar_djg_h);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Relaxed.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 70);
	daily_routine = rtn_start_90008;
};


func void rtn_start_90008()
{
	TA_Sit_Bench (8, 0, 23, 0, "OW_DJG_SWAMPCAMP_02");
	TA_Sit_Bench (23, 0, 8, 0, "OW_DJG_SWAMPCAMP_03");
};

func void rtn_swampwait1_90008()
{
	TA_Guide_Player (8, 0, 23, 0, "OW_DJG_SWAMP_WAIT1_01");
	TA_Guide_Player (23, 0, 8, 0, "OW_DJG_SWAMP_WAIT1_01");
};

func void rtn_swampwait2_90008()
{
	TA_RunToWP (8, 0, 23, 0, "OW_DJG_SWAMP_WAIT2_01");
	TA_RunToWP (23, 0, 8, 0, "OW_DJG_SWAMP_WAIT2_01");
};

func void rtn_swampdragon_90008()
{
	TA_RunToWP (8, 0, 23, 0, "OW_DRAGONSWAMP_009");
	TA_RunToWP (23, 0, 8, 0, "OW_DRAGONSWAMP_009");
};

