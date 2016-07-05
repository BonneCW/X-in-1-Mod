var int ORCKILLER;
var int dragonkiller;

INSTANCE DIA_Vh_Exit (C_Info)
{
    npc         = Vh;
    nr          = 999;
    condition   = DIA_Vh_E_condition;
    information = DIA_Vh_E_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};
FUNC INT DIA_Vh_e_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_e_info ()
{
    AI_StopProcessInfos(self);
};

INSTANCE DIA_Vh_ot (C_Info)
{
    npc         = Vh;
    nr          = 1;
    condition   = DIA_Vh_ot_condition;
    information = DIA_Vh_oT_Info;
    permanent   = TRUE;
    important   = FALSE;
    description = "set ORCKILLER true";
};

FUNC INT DIA_Vh_ot_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_ot_info ()
{
    ORCKILLER = TRUE;
};

INSTANCE DIA_Vh_of (C_Info)
{
    npc         = Vh;
    nr          = 2;
    condition   = DIA_Vh_of_condition;
    information = DIA_Vh_of_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "set ORCKILLER false";
};
FUNC INT DIA_Vh_of_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_oF_info ()
{
    ORCKILLER = False;
};

INSTANCE DIA_Vh_dt (C_Info)
{
    npc         = Vh;
    nr          = 1;
    condition   = DIA_Vh_dt_condition;
    information = DIA_Vh_dt_Info;
    permanent   = TRUE;
    important   = FALSE;
    description = "set DRAGONKILLER true";
};
FUNC INT DIA_Vh_dt_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_dt_info ()
{
   dragonkiller = TRUE;
};

INSTANCE DIA_Vh_df (C_Info)
{
    npc         = Vh;
    nr          = 2;
    condition   = DIA_Vh_df_condition;
    information = DIA_Vh_df_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "set DRAGONKILLER false";
};
FUNC INT DIA_Vh_df_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_dF_info ()
{
    dragonkiller = False;
};

INSTANCE DIA_Vh_st (C_Info)
{
    npc         = Vh;
    nr          = 1;
    condition   = DIA_Vh_st_condition;
    information = DIA_Vh_st_Info;
    permanent   = TRUE;
    important   = FALSE;
    description = "set SKELETONKILLER true";
};
FUNC INT DIA_Vh_st_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_st_info ()
{
   skeletonkiller = TRUE;
};

INSTANCE DIA_Vh_sf (C_Info)
{
    npc         = Vh;
    nr          = 2;
    condition   = DIA_Vh_sf_condition;
    information = DIA_Vh_sf_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "set SKELETONKILLER false";
};
FUNC INT DIA_Vh_sf_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vh_sF_info ()
{
    skeletonkiller = False;
};