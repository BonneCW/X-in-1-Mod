
instance DERTOTE_DIEB(Npc_Default)

{

	name[0] = "Leiche";

	guild = GIL_VLK;

	id = 90998;

	voice = 6;

	flags = FALSE;

	npcType = npctype_main;

	B_SetAttributesToChapter (self, 2);

	fight_tactic = FAI_HUMAN_NORMAL;

	CreateInvItems (self, itwr_drohding, 1);

	CreateInvItems (self, ItKE_lockpick, 2);

	CreateInvItems (self, ItFo_Apple, 1);

	CreateInvItems (self, ItMi_OldCoin, 1);

	B_SetNpcVisual (self, MALE, "Hum_Head_Thief", Face_N_Bloodwyn, BodyTex_N, ITAR_Vlk_L);

	Mdl_SetModelFatness (self, 0.9);

	Mdl_ApplyOverlayMds (self, "Humans_Relaxed.mds");

	B_GiveNpcTalents (self);

	B_SetFightSkills (self, 30);

	daily_routine = rtn_start_90998;

};




func void rtn_start_90998()

{
	TA_Stand_ArmsCrossed (5, 0, 20, 0, "DER_TOTE_DIEB");

	TA_Stand_ArmsCrossed (20, 0, 5, 0, "DER_TOTE_DIEB");
};

