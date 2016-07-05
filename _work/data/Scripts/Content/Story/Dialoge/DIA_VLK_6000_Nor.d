INSTANCE DIA_Vlk_60000_Nor_Exit (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 999;
    condition   = DIA_Vlk_60000_Nor_Exit_condition;
    information = DIA_Vlk_60000_Nor_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};
FUNC INT DIA_Vlk_60000_Nor_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vlk_60000_Nor_Exit_info ()
{
    AI_StopProcessInfos(self);
};

INSTANCE DIA_Vlk_60000_Nor_hiduei (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 2;
    condition   = DIA_Vlk_60000_Nor_hiduei_condition;
    information = DIA_Vlk_60000_Nor_hiduei_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hi.";
};

FUNC INT DIA_Vlk_60000_Nor_hiduei_condition ()
{
    return TRUE;
};

FUNC VOID DIA_Vlk_60000_Nor_hiduei_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_hiduei_15_0"); //Hi.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_hiduei_15_1"); //Hi.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_hiduei_15_2"); //Wer bist du?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_hiduei_15_3"); //Ich bin Nor, der Schmied.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_hiduei_15_4"); //Und du bist der Kerl, der den Schläfer besiegt hat?
	AI_Output(other,self,"DIA_Vlk_60000_Nor_hiduei_15_5"); //Stimmt.
};    
    
INSTANCE DIA_Vlk_60000_Nor_ruessi (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 3;
    condition   = DIA_Vlk_60000_Nor_ruessi_condition;
    information = DIA_Vlk_60000_Nor_ruessi_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hast du eine Rüstung für mich?";
};

FUNC INT DIA_Vlk_60000_Nor_ruessi_condition ()
{
 IF ( Npc_KnowsInfo(other,DIA_Vlk_60000_Nor_hiduei))
 && (other.guild == GIL_STRF) 
    {
    return TRUE;
    };
};

FUNC VOID DIA_Vlk_60000_Nor_ruessi_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ruessi_15_1"); //Hast du eine Rüstung für mich?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ruessi_15_2"); //Nein, aber ich kann dir eine machen.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ruessi_15_3"); //Bring mir fünf Wargfelle
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ruessi_15_4"); //WARGFELLE?
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ruessi_15_5"); //Du weißt schon, dass das die großen, schwarzen, bösen Dinger sind? 
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ruessi_15_6"); //Du musst sie ja nicht selbst erlegen. Die Jäger auf dem Hügel haben welche. Geh und hol sie.
            
	Log_CreateTopic (TOPIC_norfelle, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_norfelle, LOG_RUNNING);
	B_LogEntry (TOPIC_norfelle,"Ich soll fünf Wargfelle bei den Jägern auf dem Plateu abholen, damit Nor mir daraus eine Rüstung bauen kann.");
};
    
INSTANCE DIA_Vlk_60000_Nor_fellae (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_fellae_condition;
    information = DIA_Vlk_60000_Nor_fellae_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich hab die Felle.";
};

FUNC INT DIA_Vlk_60000_Nor_fellae_condition ()
{
IF ( Npc_KnowsInfo(other,Dia_Vlk_60000_Nor_ruessi))
&& ( Npc_HasItems(other,ItAt_WargFur) >= 5)
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_60000_Nor_fellae_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_fellae_15_0"); //Hier sind die Felle.

	B_GiveInvItems(other,self,ITAT_WARGFUR,5);

	AI_Output(self,other,"DIA_Vlk_60000_Nor_fellae_15_1"); //Gut. Ich habe bei meinen Sachen noch eine Rüstung gefunden. Dann musst du nicht warten, bis die hier fertig ist.
                
	B_GiveInvItems(self,other,ITar_mol,1);

	MIS_norfelle = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_norfelle, LOG_SUCCESS);
	B_CheckLog();
    
	B_GivePlayerXP (250);
};

INSTANCE DIA_Vlk_60000_Nor_as (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_as_condition;
    information = DIA_Vlk_60000_Nor_as_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Reton hat mir erzählt, dass es noch einen Schmied in der Gilde gab.";
};

FUNC INT DIA_Vlk_60000_Nor_as_condition ()
{
IF ( Npc_KnowsInfo(other,DIA_kdw_6019_reton_w))
 
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_60000_Nor_as_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_as_15_0"); //Reton hat mir erzählt, dass es noch einen Schmied in der Gilde gab.
         
	AI_Output(self,other,"DIA_Vlk_60000_Nor_as_15_1"); //(sauer) Ja, der Idiot! Ich hab ihm an dem Tag meinen Hammer ausgeliehen, weil er seinen verloren hatte!
	AI_Output(self,other,"DIA_Vlk_60000_Nor_as_15_2"); //(zerknirscht) Und nach dem Mythrilunfall ist er mit meinem Hammer in den Wald gerannt.         
	AI_Output(other,self,"DIA_Vlk_60000_Nor_as_15_3"); //Na und? Ist doch bloß ein Hammer.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_as_15_4"); //Nur ein Hammer? Diesen Hammer hab ich von meinem Vater geerbt. Er ist mein einziges Andenken an meinen Vater.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_as_15_5"); //Was hätte ich davon dir den Hammer zurück zu bringen?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_as_15_6"); //Wenn du mir meinen Hammer wiederbringst würde ich dir glatt 300 Goldmünzen zahlen.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_as_15_7"); //Ich werde sehen, ob ich ihn finde.

	Log_CreateTopic (TOPIC_hamma, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_hamma, LOG_RUNNING);
	B_LogEntry (TOPIC_hamma,"Der alte Schmied der Gilde ist mit Nors Hammer verschwunden. Wenn ich Nor den Hammer zurückbringe gibt er mir 300 Goldmünzen");
};






INSTANCE DIA_Vlk_60000_Nor_s (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_s_condition;
    information = DIA_Vlk_60000_Nor_s_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich glaube, ich habe deinen Hammer gefunden.";
};

FUNC INT DIA_Vlk_60000_Nor_s_condition ()
{
IF ( Npc_KnowsInfo(other,DIA_Vlk_60000_Nor_as))
&& ( Npc_HasItems(other,ItMw_norhammer))
 
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_60000_Nor_s_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_s_15_0"); //Ich glaube, ich habe deinen Hammer gefunden.
         
	AI_Output(self,other,"DIA_Vlk_60000_Nor_s_15_1"); //Was? Echt? Zeig her!

	B_GiveInvItems(other,self,ItMw_norhammer,1);

	AI_Output(self,other,"DIA_Vlk_60000_Nor_s_15_2"); // Ja, das ist er!         
	AI_Output(other,self,"DIA_Vlk_60000_Nor_s_15_3"); //(räuspert sich)
	AI_Output(self,other,"DIA_Vlk_60000_Nor_s_15_4"); //Ach ja! Deine Belohnung.

	B_GiveInvItems(self,other,ItmI_Gold,300);

	B_LogEntry (TOPIC_hamma,"Ich habe Nor seinen Hammer zurückgegeben");
	MIS_hamma = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_hamma, LOG_SUCCESS);
	B_CheckLog();
};

INSTANCE DIA_Vlk_60000_Nor_ur (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_ur_condition;
    information = DIA_Vlk_60000_Nor_ur_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich habe Uriziel gefunden.";
};
FUNC INT DIA_Vlk_60000_Nor_ur_condition ()
{
  if (Npc_HasItems(other, itmw_uriziel_u))   
 
{
    return TRUE;
};
};
FUNC VOID DIA_Vlk_60000_Nor_ur_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ur_15_0"); //Ich habe Uriziel gefunden, aber es ist stumpf. Kannst du das wieder hinbekommen?         
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_1"); //Was? Echt? Zeig her!

	B_GiveInvItems(other,self,itmw_uriziel_u,1);

	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_2"); //Hm, das ist ne verdammt gute Klinge. Aber sie ist zu hart um sie am Schleifstein zu schärfen...        
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ur_15_3"); //Und was machen wir jetzt?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_4"); //(schaut sich Uriziel nochmal genau an) Hm, warte! Uriziel ist aus Mythril! Ich wette, wenn ich die Klinge mit einem Zauber belege, lässt sie sich ohne Weiteres schärfen.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ur_15_5"); //Und was für einen Zauber sollen wir nehmen?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_6"); //Gar keinen.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ur_15_7"); //Hör verdammt noch mal auf mich zu verwirren, Nor!
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_8"); //Jaja. Wir brauchen keinen Zauberspruch, sondern einen Fokus für magische Energie.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ur_15_9"); //Ach so. Soll ich den Wassermagiern einen rausleiern?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_10"); //Nein lass das besser. Wir brauchen einen anderen Fokus. Die Foki der Wassermagier können nur magische Energie aus Erz bündeln.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_ur_15_11"); //Und was für einen Fokus brauche ich dann?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_ur_15_12"); //Einen Mythril-Fokus. Aber der einzige mir bekannte Mythril-Fokus ist im Besitz von Bennet. Und er hat Wucher-Preise!

	B_GiveInvItems(self,other,itmw_uriziel_u,1);

	Log_CreateTopic (TOPIC_urizielb, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_urizielb, LOG_RUNNING);
	B_LogEntry (TOPIC_urizielb,"Nor braucht einen Mythril-Fokus um Uriziel zu schärfen. Der einzige bekannte Mythril-Fokus ist aber im Besitz von Bennet.");
};

INSTANCE DIA_Vlk_60000_Nor_rt (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_rt_condition;
    information = DIA_Vlk_60000_Nor_rt_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich bin der neue Gildenherr!";
};

FUNC INT DIA_Vlk_60000_Nor_rt_condition ()
{   
	if (other.guild == GIL_BAU)     
	{
    		return TRUE;
	};
};

FUNC VOID DIA_Vlk_60000_Nor_rt_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_rt_15_0"); //Ich bin der neue Gildenherr!
	AI_Output(self,other,"DIA_Vlk_60000_Nor_rt_15_1"); //Was? Was ist mit Reton?
	AI_Output(other,self,"DIA_Vlk_60000_Nor_rt_15_3"); //Er hat es nicht geschafft. Einer von den schwarzen Kerlen hat ihn am Pass gekillt. 
	AI_Output(self,other,"DIA_Vlk_60000_Nor_rt_15_4"); //Hats den alten Reton dann doch noch zu Beliar getrieben...
	AI_Output(self,other,"DIA_Vlk_60000_Nor_rt_15_5"); //Ich schätze, du willst dann als Gildenherr auch eine neue Rüstung?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_rt_15_6"); //Dann geh zu Harad. Er soll dir erzhaltigen Stahl geben.

	Log_CreateTopic (TOPIC_ghruessi, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ghruessi, LOG_RUNNING);
	B_LogEntry (TOPIC_ghruessi,"Ich soll Nor erzhaltigen Stahl von Harad bringen, damit er mir daraus eine neue Rüstung macht.");
};

INSTANCE DIA_Vlk_60000_Nor_habmf (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_habmf_condition;
    information = DIA_Vlk_60000_Nor_habmf_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich habe Bennets Mythril-Fokus.";
};

FUNC INT DIA_Vlk_60000_Nor_habmf_condition ()
{
 	if (Npc_HasItems(other, itmw_uriziel_u))   
 	&& (Npc_HasItems(other, ItMi_MFokus))   
 	{
    		return TRUE;
	};
};

FUNC VOID DIA_Vlk_60000_Nor_habmf_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_habmf_15_0"); //Ich habe Bennets Mythril-Fokus.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_habmf_15_1"); //Was? Wie hast du DEN bekommen?
	AI_Output(other,self,"DIA_Vlk_60000_Nor_habmf_15_2"); //Hab ihn aus dem Knast geholt.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_habmf_15_3"); //Aha. Jetzt gib den Fokus und das Schwert her. Gib mir kurz Zeit dann ist das Schwert aufgeladen und scharf.

	Npc_RemoveInvItems  (other,itmw_uriziel_u,1);
	B_GiveInvItems(other,self,ItMi_MFokus,1);
      
	B_LogEntry (TOPIC_urizielb,"Ich soll Nor kurz Zeit geben, bis er Uriziel geschärft hat.");
};    

INSTANCE DIA_Vlk_60000_Nor_habmff (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_habmff_condition;
    information = DIA_Vlk_60000_Nor_habmff_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Fertig?";
};
FUNC INT DIA_Vlk_60000_Nor_habmff_condition ()
{
	if (Npc_KnowsInfo (other,DIA_Vlk_60000_Nor_habmf)) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vlk_60000_Nor_habmff_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_habmff_15_0"); //Fertig?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_habmff_15_1"); //Hä? Womit? Ach so. Klar. Hier, nimm!
  
	B_GiveInvItems(self,other,itmw_uriziel,1);
      
	B_LogEntry (TOPIC_urizielb,"Nor hat mir Uriziel geschärft.");

	MIS_urizielb = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_urizielb, LOG_SUCCESS);
	B_CheckLog();
};

INSTANCE DIA_Vlk_60000_Nor_habdieerzstahldinger (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_habdieerzstahldinger_condition;
    information = DIA_Vlk_60000_Nor_habdieerzstahldinger_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hier hast du den Stahl.";
};
FUNC INT DIA_Vlk_60000_Nor_habdieerzstahldinger_condition ()
{



if ( Npc_HasItems(other,Itmi_oresteel) >= 10)
 
{
    return TRUE;
};
};
FUNC VOID DIA_Vlk_60000_Nor_habdieerzstahldinger_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_habdieerzstahldinger_15_0"); //Hier hast du den Stahl.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_habdieerzstahldinger_15_1"); //Gut. Danke. Hier ist deine Rüstung.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_habdieerzstahldinger_15_2"); //Moment mal! Warum um Himmels Willen musste ich den Stahl holen, wenn die Rüstung schon fertig ist?
	AI_Output(self,other,"DIA_Vlk_60000_Nor_habdieerzstahldinger_15_3"); //Ich war zu faul selbst zu gehen.
         
	B_GiveInvItems(self,other,ITAR_MOM,1);
	B_GiveInvItems(other,self,ItMi_ORESTEEL,10);

	B_LogEntry (TOPIC_ghruessi,"Nor hat mir eine vernünftige Rüstung gemacht.");

	MIS_ghruessi = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ghruessi, LOG_SUCCESS);
	B_CheckLog();
};

INSTANCE DIA_Vlk_60000_Nor_FINALEQUIPPMENT (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_FINALEQUIPPMENT_condition;
    information = DIA_Vlk_60000_Nor_FINALEQUIPPMENT_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich hab ein paar Pläne für bessere Ausrüstung.";
};

FUNC INT DIA_Vlk_60000_Nor_FINALEQUIPPMENT_condition ()
{   
if (FINALKNOWING == TRUE)    
&& (hero.guild == GIL_BAU)
 
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_60000_Nor_FINALEQUIPPMENT_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_FINALEQUIPPMENT_15_0"); //Ich hab hier eine Idee für eine neue Mythril-Rüstung.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_FINALEQUIPPMENT_15_1"); //Dann schiess mal los.
	AI_Output(other,self,"DIA_Vlk_60000_Nor_FINALEQUIPPMENT_15_3"); //Du musst eine Legierung aus Mythril und Eisen herstellen und darauf mehrere einzelne Mythril-Steine, die von einer Paladin-Rune gespeist werden, einarbeiten. 
	AI_Output(self,other,"DIA_Vlk_60000_Nor_FINALEQUIPPMENT_15_4"); //Wo hast du denn den Scheiß her?
	AI_Output(other,self,"DIA_Vlk_60000_Nor_FINALEQUIPPMENT_15_5"); //Mach einfach!
	AI_Output(self,other,"DIA_Vlk_60000_Nor_FINALEQUIPPMENT_15_6"); //Na gut. Aber die Rune musst du selbst auftreiben. Ich baue in der Zwischenzeit die Rüstung. Wenn du dann den Stein hast müssen wir ihn nur noch einsetzen.

	Log_CreateTopic (TOPIC_finale, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_finale, LOG_RUNNING);
	B_LogEntry (TOPIC_finale,"Ich brauche für die perfekte Mythril-Rüstung nur noch eine große Wundheilungsrune.");
};

INSTANCE DIA_Vlk_60000_Nor_FINALEQUIPPMENTf (C_Info)
{
    npc         = Vlk_60000_Nor;
    nr          = 4;
    condition   = DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_condition;
    information = DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich hab die Rune.";
};

FUNC INT DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_condition ()
{   
if ( Npc_HasItems(other,ItRu_PalFullHeal) >= 1)    
&& (hero.guild == GIL_BAU) 
 
{
    return TRUE;
};
};

FUNC VOID DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_info ()
{
	AI_Output(other,self,"DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_15_0"); //Ich habe die Rune.
	AI_Output(self,other,"DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_15_1"); //Wie hast du das denn geschafft? Naja egal. Gib her. 
	AI_Output(self,other,"DIA_Vlk_60000_Nor_FINALEQUIPPMENTf_15_4"); //Ist wirklich sehr gut geworden. Hätte ich nicht erwartet.

	B_GiveInvItems ( other, self, ItRu_PalFullHeal, 1);
	B_GiveInvItems ( self, other, ITAR_movh, 1);

	B_LogEntry (TOPIC_finale,"Nor hat es geschafft eine nahezu perfekte Rüstung aus Mythril zu erschaffen");
	MIS_finale = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_finale, LOG_SUCCESS);
	B_CheckLog();
};

func void B_Nor_TeachSmith()
{
	AI_Output (self, other, "DIA_Nor_TeachCommon_12_01"); //Es ist ganz einfach, Junge. Besorge dir ein Stück Rohstahl, halte es ins Feuer, bis es glüht.
	AI_Output (self, other, "DIA_Nor_TeachCommon_12_02"); //Dann schlägst du am Amboss die Klinge zurecht.
};
// ------------------------------------------------------------
func void B_NorSmithChoices()
{
	Info_ClearChoices (DIA_Nor_TeachSmith);
	Info_AddChoice	(DIA_Nor_TeachSmith, DIALOG_BACK, DIA_Nor_TeachSmith_BACK);
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE)
	{
		Info_AddChoice		(DIA_Nor_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04))		,DIA_Nor_TeachSmith_Harad04);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE)
	{
		Info_AddChoice		(DIA_Nor_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03))		,DIA_Nor_TeachSmith_Harad03);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE)
	{
		Info_AddChoice		(DIA_Nor_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02))		,DIA_Nor_TeachSmith_Harad02);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		Info_AddChoice		(DIA_Nor_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01))		,DIA_Nor_TeachSmith_Harad01);
	};
	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice	(DIA_Nor_TeachSmith, B_BuildLearnString("Schmieden lernen "	   , B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common))			,DIA_Nor_TeachSmith_Common);
	};
};
// ------------------------------------------------------------
instance DIA_Nor_TeachSmith (C_INFO)
{
	npc			 = 	Vlk_60000_Nor;
	nr			 =  50;
	condition	 = 	DIA_Nor_TeachSmith_Condition;
	information	 = 	DIA_Nor_TeachSmith_Info;
	permanent    =  TRUE;
	description	 = 	"Bring mir bei, wie man ein ordentliches Schwert schmiedet!";
};

func int DIA_Nor_TeachSmith_Condition ()
{	
	if (hero.guild == GIL_STRF)
	|| (hero.guild == GIL_BAU)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
		{
			return TRUE;
		};
	};
};
func void DIA_Nor_TeachSmith_Info ()
{
	AI_Output (other, self, "DIA_Nor_TeachCommon_15_00"); //Bring mir bei, wie ich ein ordentliches Schwert schmieden kann!
	
	B_NorSmithChoices();
};
func void DIA_Nor_TeachSmith_BACK()
{
	Info_ClearChoices (DIA_Nor_TeachSmith);
};
func void DIA_Nor_TeachSmith_Common()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_Common)
	{
		B_Nor_TeachSmith();
		AI_Output (self, other, "DIA_Nor_TeachCommon_12_03"); //Deine ersten Schwerter werden keine Meisterwerke, aber alles weitere kannst du ja noch später lernen.
	};
	
	B_NorSmithChoices();
};
func void DIA_Nor_TeachSmith_Harad01()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_01)
	{
		B_Nor_TeachSmith();
	};
	
	B_NorSmithChoices();
};
func void DIA_Nor_TeachSmith_Harad02()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_02)
	{
		B_Nor_TeachSmith();
	};
	
	B_NorSmithChoices();
};
func void DIA_Nor_TeachSmith_Harad03()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_03)
	{
		B_Nor_TeachSmith();
	};
	
	B_NorSmithChoices();
};
func void DIA_Nor_TeachSmith_Harad04()
{
	if B_TeachPlayerTalentSmith (self, other, WEAPON_1H_Harad_04)
	{
		B_Nor_TeachSmith();
	};
	
	B_NorSmithChoices();
};

INSTANCE DIA_Nor_TeachSTR (C_INFO)
{
	npc			= Vlk_60000_Nor;
	nr			= 100;
	condition	= DIA_Nor_TeachSTR_Condition;
	information	= DIA_Nor_TeachSTR_Info;
	permanent	= 1;
	description = "Ich will stärker werden!";
};                       

FUNC INT DIA_Nor_TeachSTR_Condition()
{
	if (hero.guild == GIL_STRF)
	|| (hero.guild == GIL_BAU)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Nor_TeachSTR_Info()
{	
	AI_Output (other, self, "DIA_Nor_TeachSTR_15_00"); //Ich will stärker werden!
	
	Info_ClearChoices	(DIA_Nor_TeachSTR);
	Info_AddChoice		(DIA_Nor_TeachSTR, DIALOG_BACK, DIA_Nor_TeachSTR_BACK);
	Info_AddChoice		(DIA_Nor_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH))		,DIA_Nor_TeachSTR_1);
	Info_AddChoice		(DIA_Nor_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)	,DIA_Nor_TeachSTR_5);
};

func void DIA_Nor_TeachSTR_BACK()
{
	if (other.attribute[ATR_STRENGTH] < T_MAX)
	{
		AI_Output (self, other, "DIA_Nor_TeachSTR_BACK_12_02"); //Komm wieder, wenn du mehr lernen willst,
	};
	
	Info_ClearChoices	(DIA_Nor_TeachSTR);
};

func void DIA_Nor_TeachSTR_1()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 1, T_MAX);

	Info_ClearChoices	(DIA_Nor_TeachSTR);
	Info_AddChoice		(DIA_Nor_TeachSTR, DIALOG_BACK, DIA_Nor_TeachSTR_BACK);
	Info_AddChoice		(DIA_Nor_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Nor_TeachSTR_1);
	Info_AddChoice		(DIA_Nor_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Nor_TeachSTR_5);
};

// ------ 5 Stärke ------
func void DIA_Nor_TeachSTR_5()
{
	B_TeachAttributePoints (self, other, ATR_STRENGTH, 5, T_MAX);
	
	Info_ClearChoices	(DIA_Nor_TeachSTR);
	Info_AddChoice		(DIA_Nor_TeachSTR, DIALOG_BACK, DIA_Nor_TeachSTR_BACK);
	Info_AddChoice		(DIA_Nor_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1			, B_GetLearnCostAttribute(other, ATR_STRENGTH))			,DIA_Nor_TeachSTR_1);
	Info_AddChoice		(DIA_Nor_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5			, B_GetLearnCostAttribute(other, ATR_STRENGTH)*5)		,DIA_Nor_TeachSTR_5);
};