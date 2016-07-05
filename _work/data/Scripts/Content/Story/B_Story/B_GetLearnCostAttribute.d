// ***********************************************************
// B_GetLearnCostAttribute
// -----------------------
// ermittelt die Kosten eines Attributspunktes (abh. v. Gilde)
// ***********************************************************
	
func int B_GetLearnCostAttribute (var C_NPC oth, var int attribut)
{
	var int kosten; kosten = 0;

	// ------ Kosten für Stärke ------
	if (attribut == ATR_STRENGTH)
	{
		if (STRENGTH_TRAINED >= 110)
		{
			kosten = 5;
		}
		else if (STRENGTH_TRAINED >= 80)
		{
			kosten = 4;
		}
		else if (STRENGTH_TRAINED >= 50)
		{
			kosten = 3;
		}
		else if (STRENGTH_TRAINED >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	};
	if (attribut == ATR_DEXTERITY)
	{
		if (DEXTERITY_TRAINED >= 110)
		{
			kosten = 5;
		}
		else if (DEXTERITY_TRAINED >= 80)
		{
			kosten = 4;
		}
		else if (DEXTERITY_TRAINED >= 50)
		{
			kosten = 3;
		}
		else if (DEXTERITY_TRAINED >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	};
	if (attribut == ATR_MANA_MAX)
	{
		if (MANA_TRAINED >= 110)
		{
			kosten = 5;
		}
		else if (MANA_TRAINED >= 80)
		{
			kosten = 4;
		}
		else if (MANA_TRAINED >= 50)
		{
			kosten = 3;
		}
		else if (MANA_TRAINED >= 20)
		{
			kosten = 2;
		}
		else
		{
			kosten = 1;
		};
	};
	
	return kosten;
};
