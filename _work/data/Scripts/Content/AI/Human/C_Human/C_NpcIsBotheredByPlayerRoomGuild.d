// ********************************
// C_NpcIsBotheredByPlayerRoomGuild
// --------------------------------
// will der NSC den Spiler verjagen
// ********************************

func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{	
	var int portalguild;	portalguild = Wld_GetPlayerPortalGuild();

	if (Npc_GetDistToWP(hero, "NW_CITY_MERCHANT_HUT_02_IN") < 500)
	&& ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(KDF_511_Daron))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_409_Zuris)))
	{
		return TRUE;
	};
		
	if (portalguild > GIL_NONE)
	&& ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild, portalguild) == ATT_FRIENDLY) )
	{
		return TRUE;
	};
	
	return FALSE; //DEFAULT
};


