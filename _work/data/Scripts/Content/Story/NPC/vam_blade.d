
instance VAM_BLADE(Npc_Default)
{
	name[0] = "Blade";
	guild = GIL_DJG;
	id = 90909;
	voice = 12;
	flags = 0;
	npcType = npctype_main;
	level = 57;
	aivar[AIV_ToughGuy] = TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	B_SetAttributesToChapter (self, 6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem (self, ItMw_Drachenschneide);
	EquipItem (self, itrw_vampir);
	CreateInvItems (self, ItPo_Health_02, 10);
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B, itar_djg_l);
	Mdl_SetModelFatness (self, 0);
	Mdl_ApplyOverlayMds (self, "Humans_Militia.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 100);
	daily_routine = rtn_start_90909;
};


func void rtn_start_90909()
{
	TA_Stand_ArmsCrossed (5, 0, 21, 0, "TROLL");
	TA_Stand_ArmsCrossed (21, 0, 5, 0, "TROLL");
};

func void rtn_gammel_90909()
{
	TA_Stand_ArmsCrossed (5, 0, 21, 0, "TOT");
	TA_Stand_ArmsCrossed (21, 0, 5, 0, "TOT");
};

