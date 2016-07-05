func void  B_Extro_Avi ()
{
	if ((Npc_IsDead (PC_Thief_DI) == FALSE) && (Npc_IsDead (PC_Fighter_DI) == FALSE))
	{
		DiegAndGornAreOnboard = TRUE;
	};

	if (BADDEND == FALSE)
	{
		PlayVideo ("Extro_Xardas.BIK");
	}
	else
	{
		PlayVideo ("ORCATTACK.BIK");
	};

	PlayVideo ("BN_CREDITS.bik");
	PlayVideo ("Credits_Extro.BIK");
	PlayVideo ("Credits2.BIK");

	if (DiegAndGornAreOnboard == TRUE)
	{
		PlayVideo ("Extro_AllesWirdGut.BIK");
	};
	ExitSession ();
};
