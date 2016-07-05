
var int henryfolgt;

INSTANCE DIA_VLK_6025_henry_Exit (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6025_henry;
    nr          = 999;
    condition   = DIA_VLK_6025_henry_Exit_condition;
    information = DIA_VLK_6025_henry_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "ENDE";
};
FUNC INT DIA_VLK_6025_henry_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_VLK_6025_henry_Exit_info ()
{
    AI_StopProcessInfos(self);
};



INSTANCE DIA_VLK_6025_henry_warte (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6025_henry;
    nr          = 998;
    condition   = DIA_VLK_6025_henry_warte_condition;
    information = DIA_VLK_6025_henry_warte_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Geh zurück zur Gilde";
};
FUNC INT DIA_VLK_6025_henry_warte_condition ()
{
IF (henryfolgt == TRUE )
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_6025_henry_warte_info ()
{
    AI_StopProcessInfos(self);
Npc_ExchangeRoutine	(self,"START");
henryfolgt = False;
self.aivar[AIV_PARTYMEMBER] = FALSE;
};

INSTANCE DIA_VLK_6025_henry_komm (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6025_henry;
    nr          = 998;
    condition   = DIA_VLK_6025_henry_komm_condition;
    information = DIA_VLK_6025_henry_komm_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "Komm mit";
};
FUNC INT DIA_VLK_6025_henry_komm_condition ()
{
if (henryfolgt == FALSE)
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_6025_henry_komm_info ()
{
    AI_StopProcessInfos(self);
Npc_ExchangeRoutine	(self,"FOLLOW");
henryfolgt = TRUE;
self.aivar[AIV_PARTYMEMBER] = TRUE;
};

