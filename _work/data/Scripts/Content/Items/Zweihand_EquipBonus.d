/*
	Equip Funktionen f�r Einhand Waffen 
	Talent Bonus 
*/
//const f�r Talentboni stehen in Tuning Melee Weaposn

//----------------------------1----------------------------------
FUNC VOID Equip_2H_01()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_01);
		B_MeleeWeaponChange(0, Waffenbonus_01, 0);
	};
};
FUNC VOID UnEquip_2H_01()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_01);
		B_MeleeWeaponUndoChange();
	};
};
//-----------------------------2---------------------------------
FUNC VOID Equip_2H_02()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_02);
		B_MeleeWeaponChange(0, Waffenbonus_02, 0);
	};
};
FUNC VOID UnEquip_2H_02()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_02);
		B_MeleeWeaponUndoChange();
	};
};
//-----------------------------3---------------------------------
FUNC VOID Equip_2H_03()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_03);
		B_MeleeWeaponChange(0, Waffenbonus_03, 0);
	};
};
FUNC VOID UnEquip_2H_03()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_03);
		B_MeleeWeaponUndoChange();
	};
};
//------------------------------4--------------------------------
FUNC VOID Equip_2H_04()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_04);
		B_MeleeWeaponChange(0, Waffenbonus_04, 0);
	};
};
FUNC VOID UnEquip_2H_04()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_04);
		B_MeleeWeaponUndoChange();
	};
};
//----------------------------5----------------------------------
FUNC VOID Equip_2H_05()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_05);
		B_MeleeWeaponChange(0, Waffenbonus_05, 0);
	};
};
FUNC VOID UnEquip_2H_05()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_05);
		B_MeleeWeaponUndoChange();
	};
};
//--------------------------6------------------------------------
FUNC VOID Equip_2H_06()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_06);
		B_MeleeWeaponChange(0, Waffenbonus_06, 0);
	};
};
FUNC VOID UnEquip_2H_06()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_06);
		B_MeleeWeaponUndoChange();
	};
};
//---------------------------7-----------------------------------
FUNC VOID Equip_2H_07()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_07);
		B_MeleeWeaponChange(0, Waffenbonus_07, 0);
	};
};
FUNC VOID UnEquip_2H_07()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_07);
		B_MeleeWeaponUndoChange();
	};
};
//-----------------------------8---------------------------------
FUNC VOID Equip_2H_08()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_08);
		B_MeleeWeaponChange(0, Waffenbonus_08, 0);
	};
};
FUNC VOID UnEquip_2H_08()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_08);
		B_MeleeWeaponUndoChange();
	};
};
//--------------------------9------------------------------------
FUNC VOID Equip_2H_09()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_09);
		B_MeleeWeaponChange(0, Waffenbonus_09, 0);
	};
};
FUNC VOID UnEquip_2H_09()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_09);
		B_MeleeWeaponUndoChange();
	};
};
//----------------------------10----------------------------------
FUNC VOID Equip_2H_10()
{
	if Npc_IsPlayer (self)
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, Waffenbonus_10);
		B_MeleeWeaponChange(0, Waffenbonus_10, 0);
	};
};
FUNC VOID UnEquip_2H_10()
{
	if (Npc_IsPlayer (self) && (meleeWeaponChangedHero || scriptPatchWeaponChange == FALSE))
	{ 
		B_AddFightSkill (self, NPC_TALENT_2H, - Waffenbonus_10);
		B_MeleeWeaponUndoChange();
	};
};
