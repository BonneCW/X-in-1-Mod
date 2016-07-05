var int playerIsTransformed;

var int HitChanceBackupOneH;
var int HitChanceBackupTwoH;
var int ManaMaxBackup;

var int meleeWeaponChangedHero;
var int changedManaHero;
var int changedOneHHero;
var int changedTwoHHero;

var int scriptPatchWeaponChange;


func void B_MeleeWeaponChange(var int OneH, var int TwoH, var int ManaMax)
{
	meleeWeaponChangedHero = TRUE;
	changedManaHero = ManaMax;
	changedOneHHero = OneH;	
	changedTwoHHero = TwoH;

	scriptPatchWeaponChange = TRUE;
};

func void B_MeleeWeaponUndoChange()
{
	meleeWeaponChangedHero = FALSE;
	changedManaHero = 0;
	changedOneHHero = 0;	
	changedTwoHHero = 0;

	scriptPatchWeaponChange = TRUE;
};

func void B_StartMagicTransform()
{
	if (!playerIsTransformed)
	{
		playerIsTransformed = TRUE;

		HitChanceBackupOneH = hero.HitChance[NPC_TALENT_1H] - changedOneHHero;
		HitChanceBackupTwoH = hero.HitChance[NPC_TALENT_2H] - changedTwoHHero;
		ManaMaxBackup = hero.attribute[ATR_MANA_MAX] - changedManaHero;

		B_MeleeWeaponUndoChange();
	};

	Summoned_Monster = 0;
};

func void B_StopMagicTransform()
{
	if (playerIsTransformed)
	{
		if (HitChanceBackupOneH != hero.HitChance[NPC_TALENT_1H])
		{
			B_AddFightSkill(hero, NPC_TALENT_1H, HitChanceBackupOneH - hero.HitChance[NPC_TALENT_1H] + changedOneHHero);
		};

		if (HitChanceBackupTwoH != hero.HitChance[NPC_TALENT_2H])
		{
			B_AddFightSkill(hero, NPC_TALENT_2H, HitChanceBackupTwoH - hero.HitChance[NPC_TALENT_2H] + changedTwoHHero);
		};

		if (ManaMaxBackup != hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA_MAX] = ManaMaxBackup + changedManaHero;
		};

		AI_UnequipWeapons(hero);

		playerIsTransformed = FALSE;
	};
};