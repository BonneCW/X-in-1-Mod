
var int magit_itemsgiven_chapter_1;
var int magit_itemsgiven_chapter_2;
var int magit_itemsgiven_chapter_3;
var int magit_itemsgiven_chapter_4;
var int magit_itemsgiven_chapter_5;

func void b_givetradeinv_magit(var C_Npc slf)
{
	if ((Kapitel >= 1) && (MAGIT_ITEMSGIVEN_CHAPTER_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50);
		CreateInvItems (slf, ItLsTorch, 10);
		CreateInvItems (slf, ItRw_Arrow, 50);
		CreateInvItems (slf, ItMw_Schwert1, 1);
		CreateInvItems (slf, ItMw_Schwert2, 1);
		CreateInvItems (slf, ItMw_Schwert3, 1);
		CreateInvItems (slf, ItMw_Schwert4, 1);
		CreateInvItems (slf, ItMw_Schwert5, 1);
		CreateInvItems (slf, ItMw_Kriegshammer1, 1);
		CreateInvItems (slf, ItMw_Kriegshammer2, 1);
		CreateInvItems (slf, ItMw_Stabkeule, 1);
		CreateInvItems (slf, ItMw_Steinbrecher, 1);
		CreateInvItems (slf, ItMw_Bartaxt, 1);
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Nov_Mace, 1);
		CreateInvItems (slf, ItMw_Zweihaender2, 1);
		CreateInvItems (slf, ItMw_Inquisitor, 1);
		CreateInvItems (slf, ItMw_Zweihaender4, 1);
		CreateInvItems (slf, ItMw_Krummschwert, 1);
		CreateInvItems (slf, ItRi_HP_01, 1);
		CreateInvItems (slf, ItPo_Mana_01, 5);
		CreateInvItems (slf, ItPo_Health_01, 5);
		MAGIT_ITEMSGIVEN_CHAPTER_1 = TRUE;
	};
	if ((Kapitel >= 2) && (MAGIT_ITEMSGIVEN_CHAPTER_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100);
		CreateInvItems (slf, ItRw_Arrow, 50);
		MAGIT_ITEMSGIVEN_CHAPTER_2 = TRUE;
	};
	if ((Kapitel >= 3) && (MAGIT_ITEMSGIVEN_CHAPTER_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200);
		CreateInvItems (slf, ItRw_Arrow, 50);
		MAGIT_ITEMSGIVEN_CHAPTER_3 = TRUE;
	};
	if ((Kapitel >= 4) && (MAGIT_ITEMSGIVEN_CHAPTER_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 400);
		CreateInvItems (slf, ItRw_Arrow, 50);
		MAGIT_ITEMSGIVEN_CHAPTER_4 = TRUE;
	};
	if ((Kapitel >= 5) && (MAGIT_ITEMSGIVEN_CHAPTER_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 1600);
		CreateInvItems (slf, ItRw_Arrow, 50);
		MAGIT_ITEMSGIVEN_CHAPTER_5 = TRUE;
	};
};

