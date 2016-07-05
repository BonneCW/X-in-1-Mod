
var int henryfolgt2;

INSTANCE DIA_VLK_6025_henry_Exit2 (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6026_john;
    nr          = 999;
    condition   = DIA_VLK_6025_henry_Exit2_condition;
    information = DIA_VLK_6025_henry_Exit2_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "ENDE";
};
FUNC INT DIA_VLK_6025_henry_Exit2_condition ()
{
    return TRUE;
};
FUNC VOID DIA_VLK_6025_henry_Exit2_info ()
{
    AI_StopProcessInfos(self);
};



INSTANCE DIA_VLK_6025_henry_warte2 (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6026_john;
    nr          = 997;
    condition   = DIA_VLK_6025_henry_warte2_condition;
    information = DIA_VLK_6025_henry_warte2_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Geh zurück zur Gilde";
};
FUNC INT DIA_VLK_6025_henry_warte2_condition ()
{
IF (henryfolgt2 == TRUE )
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_6025_henry_warte2_info ()
{
    AI_StopProcessInfos(self);
Npc_ExchangeRoutine	(self,"START");
henryfolgt2 = False;
self.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE DIA_VLK_6025_henry_komm2 (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6026_john;
    nr          = 996;
    condition   = DIA_VLK_6025_henry_komm2_condition;
    information = DIA_VLK_6025_henry_komm2_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Komm mit";
};
FUNC INT DIA_VLK_6025_henry_komm2_condition ()
{
if (henryfolgt2 == FALSE)
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_6025_henry_komm2_info ()
{
    AI_StopProcessInfos(self);
Npc_ExchangeRoutine	(self,"FOLLOW");

henryfolgt2 = TRUE;
self.aivar[AIV_PARTYMEMBER] = TRUE;
};

