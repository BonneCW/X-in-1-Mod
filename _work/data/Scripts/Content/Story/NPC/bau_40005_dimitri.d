
instance BAU_40005_DIMITRI(Npc_Default)
{
	name[0] = "Dimitri";
	guild = GIL_OUT;
	id = 983;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npcType = npctype_main;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder] = TRUE;
	aivar[AIV_IGNORE_Theft] = TRUE;
	aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	B_SetAttributesToChapter (self, 4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem (self, ItMw_1h_Sld_Sword);
	EquipItem (self, ItRw_Mil_Crossbow);
	B_CreateAmbientInv (self);
	B_SetNpcVisual (self, MALE, "Hum_Head_Pony", Face_L_NormalBart01, BodyTex_L, ITAR_Leather_L);
	Mdl_SetModelFatness (self, 2);
	Mdl_ApplyOverlayMds (self, "Humans_Relaxed.mds");
	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 60);
	daily_routine = rtn_start_40005;
};


func void rtn_start_40005()
{
	TA_Stand_Drinking (3, 0, 22, 0, "NW_TAVERNE_IN_05");
	TA_Stand_Eating (22, 0, 3, 0, "NW_TAVERNE_05");
};

