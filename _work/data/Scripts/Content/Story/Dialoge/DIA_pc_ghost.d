
var int h1;
var int h2;
var int bo;
var int cb;
var int hs;
var int hd;
var int hmx;
var int hm;
var int hp;
var int hpx;
var int hello;

instance DIA_SEELE_EXIT(C_Info)
{
	npc = pc_ghost;
	nr = 700;
	condition = dia_seele_exit_condition;
	information = dia_seele_exit_info;
	permanent = TRUE;
	description = "ENDE";
};


func int dia_seele_exit_condition()
{
	return TRUE;
};

func void dia_seele_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_SEELE_HALLO(C_Info)
{
	npc = pc_ghost;
	nr = 999;
	condition = dia_seele_hallo_condition;
	information = dia_seele_hallo_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_seele_hallo_condition()
{
	if (HELLO == FALSE)
	{
		return TRUE;
	};
};

func void dia_seele_hallo_info()
{
	var C_Item armor1;
	var C_Item nahwaffe;
	var C_Item fernwaffe;
	AI_Output (self, other, "Dia_Seele_hallo_00");	//Ok, lass uns metzeln gehen!
	HS = other.attribute[ATR_STRENGTH];
	HD = other.attribute[ATR_DEXTERITY];
	HMX = other.attribute[ATR_MANA_MAX];
	HM = other.attribute[ATR_MANA];
	hp = other.attribute[ATR_HITPOINTS];
	HPX = other.attribute[ATR_HITPOINTS_MAX];
	Npc_ChangeAttribute (self, ATR_STRENGTH, HS);
	Npc_ChangeAttribute (self, ATR_DEXTERITY, HD);
	Npc_ChangeAttribute (self, ATR_MANA_MAX, HMX);
	Npc_ChangeAttribute (self, ATR_MANA, HM);
	B_RaiseAttribute (self, ATR_HITPOINTS, HPX);
	Npc_ChangeAttribute (self, ATR_HITPOINTS_MAX, HPX);
	HELLO = TRUE;
	H1 = other.HitChance[NPC_TALENT_1H];
	H2 = other.HitChance[NPC_TALENT_2H];
	BO = other.HitChance[NPC_TALENT_BOW];
	CB = other.HitChance[NPC_TALENT_CROSSBOW];
	self.HitChance[NPC_TALENT_1H] = H1;
	self.HitChance[NPC_TALENT_2H] = H2;
	self.HitChance[NPC_TALENT_BOW] = BO;
	self.HitChance[NPC_TALENT_CROSSBOW] = CB;
	armor1 = Npc_GetEquippedArmor (other);
	nahwaffe = Npc_GetEquippedMeleeWeapon (other);
	fernwaffe = Npc_GetEquippedRangedWeapon (other);
	if (Hlp_IsItem (armor1, ITAR_Vlk_L) == TRUE)
	{
		CreateInvItem (self, ITAR_Vlk_L);
	}
	else if (Hlp_IsItem (armor1, ITAR_Vlk_L) == TRUE)
	{
		CreateInvItem (self, ITAR_Vlk_L);
	}
	else if (Hlp_IsItem (armor1, ITAR_Vlk_M) == TRUE)
	{
		CreateInvItem (self, ITAR_Vlk_M);
	}
	else if (Hlp_IsItem (armor1, ITAR_Vlk_H) == TRUE)
	{
		CreateInvItem (self, ITAR_Vlk_H);
	}
	else if (Hlp_IsItem (armor1, ITAR_Mil_L) == TRUE)
	{
		CreateInvItem (self, ITAR_Mil_L);
	}
	else if (Hlp_IsItem (armor1, ItAr_MIL_M) == TRUE)
	{
		CreateInvItem (self, ItAr_MIL_M);
	}
	else if (Hlp_IsItem (armor1, ItAr_PAL_M) == TRUE)
	{
		CreateInvItem (self, ItAr_PAL_M);
	}
	else if (Hlp_IsItem (armor1, ItAr_PAl_H) == TRUE)
	{
		CreateInvItem (self, ItAr_PAl_H);
	}
	else if (Hlp_IsItem (armor1, ItAr_Sld_L) == TRUE)
	{
		CreateInvItem (self, ItAr_Sld_L);
	}
	else if (Hlp_IsItem (armor1, itar_sld_M) == TRUE)
	{
		CreateInvItem (self, itar_sld_M);
	}
	else if (Hlp_IsItem (armor1, ItAr_Sld_H) == TRUE)
	{
		CreateInvItem (self, ItAr_Sld_H);
	}
	else if (Hlp_IsItem (armor1, ItAr_NOV_L) == TRUE)
	{
		CreateInvItem (self, ItAr_NOV_L);
	}
	else if (Hlp_IsItem (armor1, ItAr_KDF_L) == TRUE)
	{
		CreateInvItem (self, ItAr_KDF_L);
	}
	else if (Hlp_IsItem (armor1, ItAr_KDF_H) == TRUE)
	{
		CreateInvItem (self, ItAr_KDF_H);
	}
	else if (Hlp_IsItem (armor1, ITAR_Leather_L) == TRUE)
	{
		CreateInvItem (self, ITAR_Leather_L);
	}
	else if (Hlp_IsItem (armor1, ItAr_BDT_M) == TRUE)
	{
		CreateInvItem (self, ItAr_BDT_M);
	}
	else if (Hlp_IsItem (armor1, ItAr_BDT_H) == TRUE)
	{
		CreateInvItem (self, ItAr_BDT_H);
	}
	else if (Hlp_IsItem (armor1, itar_djg_l) == TRUE)
	{
		CreateInvItem (self, itar_djg_l);
	}
	else if (Hlp_IsItem (armor1, itar_djg_m) == TRUE)
	{
		CreateInvItem (self, itar_djg_m);
	}
	else if (Hlp_IsItem (armor1, itar_djg_h) == TRUE)
	{
		CreateInvItem (self, itar_djg_h);
	}
	else if (Hlp_IsItem (armor1, ITAR_DJG_Crawler) == TRUE)
	{
		CreateInvItem (self, ITAR_DJG_Crawler);
	}
	else if (Hlp_IsItem (armor1, ITAR_Xardas) == TRUE)
	{
		CreateInvItem (self, ITAR_Xardas);
	}
	else if (Hlp_IsItem (armor1, itar_vampir) == TRUE)
	{
		CreateInvItem (self, itar_vampir);
	}
	else if (Hlp_IsItem (armor1, ITAR_PIR_L_Addon) == TRUE)
	{
		CreateInvItem (self, ITAR_PIR_L_Addon);
	}
	else if (Hlp_IsItem (armor1, ITAR_PIR_M_Addon) == TRUE)
	{
		CreateInvItem (self, ITAR_PIR_M_Addon);
	}
	else if (Hlp_IsItem (armor1, ITAR_PIR_H_Addon) == TRUE)
	{
		CreateInvItem (self, ITAR_PIR_H_Addon);
	}
	else if (Hlp_IsItem (armor1, ITAR_Thorus_Addon) == TRUE)
	{
		CreateInvItem (self, ITAR_Thorus_Addon);
	}
	else if (Hlp_IsItem (armor1, ITAR_Raven_Addon) == TRUE)
	{
		CreateInvItem (self, ITAR_Raven_Addon);
	}
	else if (Hlp_IsItem (armor1, ITAR_RANGER_Addon) == TRUE)
	{
		CreateInvItem (self, ITAR_RANGER_Addon);
	};
	if (Hlp_IsItem (nahwaffe, ItMw_1h_Vlk_Dagger) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Vlk_Dagger);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Mace_L_01) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Mace_L_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Bau_Axe) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Bau_Axe);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Vlk_Mace) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Vlk_Mace);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Mace_L_03) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Mace_L_03);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Bau_Mace) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Bau_Mace);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Vlk_Axe) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Vlk_Axe);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Mace_L_04) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Mace_L_04);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_ShortSword1) == TRUE)
	{
		CreateInvItem (self, ItMw_ShortSword1);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Nagelknueppel) == TRUE)
	{
		CreateInvItem (self, ItMw_Nagelknueppel);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Sword_L_03) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Sword_L_03);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_ShortSword2) == TRUE)
	{
		CreateInvItem (self, ItMw_ShortSword2);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Sense) == TRUE)
	{
		CreateInvItem (self, ItMw_Sense);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Vlk_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Vlk_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Nov_Mace) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Nov_Mace);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2h_Bau_Axe) == TRUE)
	{
		CreateInvItem (self, ItMw_2h_Bau_Axe);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Axe_L_01) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Axe_L_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_MISC_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_MISC_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Misc_Axe) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Misc_Axe);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Sword_M_01) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Sword_M_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Mil_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Mil_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Sld_Axe) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Sld_Axe);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Sld_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Sld_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2h_Sld_Axe) == TRUE)
	{
		CreateInvItem (self, ItMw_2h_Sld_Axe);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2h_Sld_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_2h_Sld_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1h_Pal_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_1h_Pal_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2h_Pal_Sword) == TRUE)
	{
		CreateInvItem (self, ItMw_2h_Pal_Sword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_OrcAxe_01) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_OrcAxe_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_OrcAxe_02) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_OrcAxe_02);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_OrcAxe_03) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_OrcAxe_03);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_OrcAxe_04) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_OrcAxe_04);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_OrcSword_01) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_OrcSword_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_ShortSword3) == TRUE)
	{
		CreateInvItem (self, ItMw_ShortSword3);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Nagelkeule) == TRUE)
	{
		CreateInvItem (self, ItMw_Nagelkeule);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_ShortSword4) == TRUE)
	{
		CreateInvItem (self, ItMw_ShortSword4);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Kriegskeule) == TRUE)
	{
		CreateInvItem (self, ItMw_Kriegskeule);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Richtstab) == TRUE)
	{
		CreateInvItem (self, ItMw_Richtstab);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_ShortSword5) == TRUE)
	{
		CreateInvItem (self, ItMw_ShortSword5);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Kriegshammer1) == TRUE)
	{
		CreateInvItem (self, ItMw_Kriegshammer1);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Hellebarde) == TRUE)
	{
		CreateInvItem (self, ItMw_Hellebarde);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Nagelkeule2) == TRUE)
	{
		CreateInvItem (self, ItMw_Nagelkeule2);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schiffsaxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Schiffsaxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Piratensaebel) == TRUE)
	{
		CreateInvItem (self, ItMw_Piratensaebel);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schwert) == TRUE)
	{
		CreateInvItem (self, ItMw_Schwert);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Common_01) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Common_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Stabkeule) == TRUE)
	{
		CreateInvItem (self, ItMw_Stabkeule);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Zweihaender1) == TRUE)
	{
		CreateInvItem (self, ItMw_Zweihaender1);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Steinbrecher) == TRUE)
	{
		CreateInvItem (self, ItMw_Steinbrecher);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Spicker) == TRUE)
	{
		CreateInvItem (self, ItMw_Spicker);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Streitaxt1) == TRUE)
	{
		CreateInvItem (self, ItMw_Streitaxt1);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schwert1) == TRUE)
	{
		CreateInvItem (self, ItMw_Schwert1);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schwert2) == TRUE)
	{
		CreateInvItem (self, ItMw_Schwert2);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Doppelaxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Doppelaxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Bartaxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Bartaxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Morgenstern) == TRUE)
	{
		CreateInvItem (self, ItMw_Morgenstern);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schwert3) == TRUE)
	{
		CreateInvItem (self, ItMw_Schwert3);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schwert4) == TRUE)
	{
		CreateInvItem (self, ItMw_Schwert4);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Special_01) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Special_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Special_01) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Special_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Rapier) == TRUE)
	{
		CreateInvItem (self, ItMw_Rapier);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Rubinklinge) == TRUE)
	{
		CreateInvItem (self, ItMw_Rubinklinge);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Streitkolben) == TRUE)
	{
		CreateInvItem (self, ItMw_Streitkolben);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Zweihaender2) == TRUE)
	{
		CreateInvItem (self, ItMw_Zweihaender2);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Runenschwert) == TRUE)
	{
		CreateInvItem (self, ItMw_Runenschwert);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Rabenschnabel) == TRUE)
	{
		CreateInvItem (self, ItMw_Rabenschnabel);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schwert5) == TRUE)
	{
		CreateInvItem (self, ItMw_Schwert5);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Inquisitor) == TRUE)
	{
		CreateInvItem (self, ItMw_Inquisitor);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Streitaxt2) == TRUE)
	{
		CreateInvItem (self, ItMw_Streitaxt2);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Zweihaender3) == TRUE)
	{
		CreateInvItem (self, ItMw_Zweihaender3);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Special_02) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Special_02);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Special_02) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Special_02);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_ElBastardo) == TRUE)
	{
		CreateInvItem (self, ItMw_ElBastardo);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Kriegshammer2) == TRUE)
	{
		CreateInvItem (self, ItMw_Kriegshammer2);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Meisterdegen) == TRUE)
	{
		CreateInvItem (self, ItMw_Meisterdegen);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Folteraxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Folteraxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Orkschlaechter) == TRUE)
	{
		CreateInvItem (self, ItMw_Orkschlaechter);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Schlachtaxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Schlachtaxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Krummschwert) == TRUE)
	{
		CreateInvItem (self, ItMw_Krummschwert);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Barbarenstreitaxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Barbarenstreitaxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Sturmbringer) == TRUE)
	{
		CreateInvItem (self, ItMw_Sturmbringer);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Special_03) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Special_03);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Berserkeraxt) == TRUE)
	{
		CreateInvItem (self, ItMw_Berserkeraxt);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_Drachenschneide) == TRUE)
	{
		CreateInvItem (self, ItMw_Drachenschneide);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Special_04) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Special_04);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Special_04) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Special_04);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Blessed_01) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Blessed_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Blessed_02) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Blessed_02);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_1H_Blessed_03) == TRUE)
	{
		CreateInvItem (self, ItMw_1H_Blessed_03);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Blessed_01) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Blessed_01);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Blessed_02) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Blessed_02);
	}
	else if (Hlp_IsItem (nahwaffe, itmw_2h_timesword) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Blessed_02);
	}
	else if (Hlp_IsItem (nahwaffe, itmw_1h_timesword) == TRUE)
	{
		CreateInvItem (self, itmw_1h_timesword);
	}
	else if (Hlp_IsItem (nahwaffe, itmw_1h_blutschwert) == TRUE)
	{
		CreateInvItem (self, itmw_1h_blutschwert);
	}
	else if (Hlp_IsItem (nahwaffe, itmw_1h_blutdegen) == TRUE)
	{
		CreateInvItem (self, itmw_1h_blutdegen);
	}
	else if (Hlp_IsItem (nahwaffe, itmw_firesword) == TRUE)
	{
		CreateInvItem (self, itmw_firesword);
	}
	else if (Hlp_IsItem (nahwaffe, itmw_icesword) == TRUE)
	{
		CreateInvItem (self, itmw_icesword);
	}
	else if (Hlp_IsItem (nahwaffe, ItMw_2H_Blessed_03) == TRUE)
	{
		CreateInvItem (self, ItMw_2H_Blessed_03);
	};
	if (Hlp_IsItem (fernwaffe, ItRw_Bow_L_01) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_L_01);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_L_02) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_L_02);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_L_03) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_L_03);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_L_04) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_L_04);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_M_01) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_M_01);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_M_02) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_M_02);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_M_03) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_M_03);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_M_04) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_M_04);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_H_01) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_H_01);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_H_02) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_H_02);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_H_03) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_H_03);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Bow_H_04) == TRUE)
	{
		CreateInvItem (self, ItRw_Bow_H_04);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Crossbow_L_01) == TRUE)
	{
		CreateInvItem (self, ItRw_Crossbow_L_01);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Crossbow_L_02) == TRUE)
	{
		CreateInvItem (self, ItRw_Crossbow_L_02);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Crossbow_M_01) == TRUE)
	{
		CreateInvItem (self, ItRw_Crossbow_M_01);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Crossbow_M_02) == TRUE)
	{
		CreateInvItem (self, ItRw_Crossbow_M_02);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Crossbow_H_01) == TRUE)
	{
		CreateInvItem (self, ItRw_Crossbow_H_01);
	}
	else if (Hlp_IsItem (fernwaffe, ItRw_Crossbow_H_02) == TRUE)
	{
		CreateInvItem (self, ItRw_Crossbow_H_02);
	};
	CreateInvItems (self, ItRw_Arrow, 60);
	CreateInvItems (self, ItRw_Bolt, 60);
	AI_StopProcessInfos (self);
	AI_EquipBestArmor (self);
	AI_EquipBestMeleeWeapon (self);
	AI_EquipBestRangedWeapon (self);
	B_ClearPerceptions (self);
};


instance DIA_SEELE_BYE(C_Info)
{
	npc = pc_ghost;
	nr = 3;
	condition = dia_seele_a;
	information = dia_seele_b;
	permanent = TRUE;
	description = "Komm zurück!";
};


func int dia_seele_a()
{
	return TRUE;
};

func void dia_seele_b()
{
	var C_Item armor2;
	var C_Item nahwaffe2;
	var C_Item fernwaffe2;
	AI_Output (self, other, "Dia_Seele_bye_00");	//Komm zurück!
	AI_StopProcessInfos (self);
	GHOSTWEG = FALSE;
	HELLO = FALSE;
	armor2 = Npc_GetEquippedArmor (self);
	nahwaffe2 = Npc_GetEquippedMeleeWeapon (self);
	fernwaffe2 = Npc_GetEquippedRangedWeapon (self);
	Npc_RemoveInvItem (pc_ghost, nahwaffe2);
	Npc_RemoveInvItem (pc_ghost, fernwaffe2);
	Npc_RemoveInvItem (pc_ghost, armor2);
	Npc_RemoveInvItems (pc_ghost, ItRw_Arrow, 60);
	Npc_RemoveInvItems (pc_ghost, ItRw_Bolt, 60);
};

