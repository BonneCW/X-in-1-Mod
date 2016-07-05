instance DIA_DIMITRI_EXIT(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 999;
	condition = dia_dimitri_exit_condition;
	information = dia_dimitri_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dimitri_exit_condition()
{
	return TRUE;
};

func void dia_dimitri_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_DIMITRI_HALLO(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 998;
	condition = dia_dimitri_hallo_condition;
	information = dia_dimitri_hallo_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bist du Dimitri?";
};


func int dia_dimitri_hallo_condition()
{
	if (ARDOCSPAKET == TRUE)
	{
		return TRUE;
	};
};

func void dia_dimitri_hallo_info()
{
	AI_Output (other, self, "Dia_Dimitri_hallo_00");	//Bist du Dimitri?
	AI_Output (self, other, "Dia_Dimitri_hallo_01");	//Hicks... klar! Was willst du?
	AI_Output (other, self, "Dia_Dimitri_hallo_02");	//Gut, Ardoc schickt mich!
	AI_Output (self, other, "Dia_Dimitri_hallo_03");	//Oh, nein...hicks! Du kommst sicher wegen dem Paket...hicks!
	AI_Output (other, self, "Dia_Dimitri_hallo_04");	//Ja, ich soll es zu ihn bringen. Wo ist es?
	AI_Output (self, other, "Dia_Dimitri_hallo_05");	//Ich...hicks...habs verloren!
	AI_Output (other, self, "Dia_Dimitri_hallo_06");	//Verloren? Wo?
	AI_Output (self, other, "Dia_Dimitri_hallo_07");	//Ich war auf dem Weg in die Stadt...hicks... Ich trug das Paket in meiner Tasche.
	AI_Output (self, other, "Dia_Dimitri_hallo_08");	//Doch am Stadtor bemerkte...hicks...ich ,dass es nicht mehr da war.
	AI_Output (self, other, "Dia_Dimitri_hallo_09");	//Ich rannte zurück und suchte den ganzen Weg bis zurück zur Taverne ab, wo ich es noch mit Sicherheit hatte.
	AI_Output (self, other, "Dia_Dimitri_hallo_10");	//Da es im Dunkeln rötlich leuchtet ...hicks... hätte ich es eigentlich leicht finden können. Doch da war ...hicks... nichts!
	AI_Output (self, other, "Dia_Dimitri_hallo_11");	//Ich konnte mich so nicht bei Ardoc blicken lassen! Also bin ich hier geblieben...hicks..
};


instance DIA_DIMITRI_WO_PAKET(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 997;
	condition = dia_dimitri_wo_paket_condition;
	information = dia_dimitri_wo_paket_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und wo soll ich nun suchen?";
};


func int dia_dimitri_wo_paket_condition()
{
	if (Npc_KnowsInfo (other, dia_dimitri_hallo) && (PAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_dimitri_wo_paket_info()
{
	AI_Output (other, self, "Dia_Dimitri_Wo_Paket_00");	//Und wo soll ich nun suchen?
	AI_Output (self, other, "Dia_Dimitri_Wo_Paket_01");	//Keine Ahnung! Es muss mir aus der Tasche gefallen sein...hicks..., aber auf dem Weg war nichts.
	AI_Output (other, self, "Dia_Dimitri_Wo_Paket_02");	//Vielleicht hat dich jemand bestohlen?
	AI_Output (self, other, "Dia_Dimitri_Wo_Paket_03");	//Nein! Als ich losgegangen bin, hatte...hicks... ich es noch! Und ich bin den ganzen Weg allein gegangen!
	AI_Output (self, other, "Dia_Dimitri_Wo_Paket_04");	//Es muss da irgendwo sein!
	AI_Output (other, self, "Dia_Dimitri_Wo_Paket_05");	//(Holt Luft) Dann such ich halt selber.
	B_LogEntry (ARDOC_PAKET, "Dimitri lebt zwar, aber er hat das Paket verloren. Er sagt, es müsse ihm irgendwo zwischen Taverne und Khorinis aus der Tasche gefallen sein. Er hat den ganzen Weg abgesucht, aber nichts gefunden. Vielleicht hab ich ja mehr Glück.");
};


instance DIA_DIMITRI_HAB_PAKET(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 990;
	condition = dia_dimitri_hab_paket_condition;
	information = dia_dimitri_hab_paket_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe das Paket";
};


func int dia_dimitri_hab_paket_condition()
{
	if (Npc_KnowsInfo (other, dia_dimitri_hallo) && (Npc_HasItems (other, itmi_ardocspaket) >= 1) && (PAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_dimitri_hab_paket_info()
{
	AI_Output (other, self, "Dia_Dimitri_Hab_Paket_00");	//Ich habe das Paket!
	AI_Output (self, other, "Dia_Dimitri_Hab_Paket_01");	//Wirklich? Wo.. hicks... war es?
	AI_Output (other, self, "Dia_Dimitri_Hab_Paket_02");	//Es war im kleinen Tal unterhalb des Weges!
	AI_Output (self, other, "Dia_Dimitri_Hab_Paket_03");	//Stimmt! Ich ... hicks.. hab da nicht gesucht.
	AI_Output (self, other, "Dia_Dimitri_Hab_Paket_04");	//Gut jetzt kannst du es ..hicks...zu Ardoc bringen. Aber ich bitte dich:
	AI_Output (self, other, "Dia_Dimitri_Hab_Paket_05");	//Sag ihm nicht, dass ich mich hier die ganze Zeit besoffen habe.
};


instance DIA_DIMITRI_HAST_GEHOLFEN(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 989;
	condition = dia_dimitri_hast_geholfen_condition;
	information = dia_dimitri_hast_geholfen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_dimitri_hast_geholfen_condition()
{
	if (Npc_KnowsInfo (other, dia_ardoc_kahr_hab_paket) && Npc_KnowsInfo (other, dia_dimitri_hab_paket))
	{
		return TRUE;
	};
};

func void dia_dimitri_hast_geholfen_info()
{
	AI_Output (self, other, "Dia_Dimitri_hast_geholfen_00");	//Und? Hicks... was hast du Ardoc erzählt?
	if (DIMITRI_GEHOLFEN == TRUE)
	{
		AI_Output (other, self, "Dia_Dimitri_hast_geholfen_01");	//Ich hab ihm erzählt, dass du mir bei der Suche geholfen hast.
		AI_Output (self, other, "Dia_Dimitri_hast_geholfen_02");	//Danke, Mann! Hicks... hier, als Geschenk bekommst du einige Blutflaschen.
		CreateInvItems (self, itpo_blood, 5);
		B_GiveInvItems (self, other, itpo_blood, 5);
		B_GivePlayerXP (120);
	}
	else
	{
		AI_Output (other, self, "Dia_Dimitri_hast_geholfen_03");	//Ich hab ihm dei Warheit erzählt:
		AI_Output (other, self, "Dia_Dimitri_hast_geholfen_04");	//Anstatt gründlich zu suchen, hast du dich hier besoffen.
		AI_Output (self, other, "Dia_Dimitri_hast_geholfen_05");	//Nungut, wenn es so war, werde ich die Konsequenzen ..hicks... tragen.
		B_GivePlayerXP (50);
	};
};


instance DIA_DIMITRI_RITUAL(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 800;
	condition = dia_dimitri_ritual_condition;
	information = dia_dimitri_ritual_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hast du das Ritualmesser?";
};


func int dia_dimitri_ritual_condition()
{
	if (Npc_KnowsInfo (other, dia_ardok_kahr_blutritual_4))
	{
		return TRUE;
	};
};

func void dia_dimitri_ritual_info()
{
	AI_Output (other, self, "Dia_Dimitri_ritual_00");	//Hast du das Ritualmesser?
	if (BEROX_RITUAL == TRUE)
	{
		AI_Output (other, self, "Dia_Dimitri_ritual_01");	//Ich war schon bei Berox und der meinte du hättest es.
	};
	AI_Output (self, other, "Dia_Dimitri_ritual_02");	//Ritual-was? ... hicks....
	AI_Output (other, self, "Dia_Dimitri_ritual_03");	//Das Messer für das Blutritual! Ich brauch es um vollständiges Mitglied eures Clans zu werden!
	AI_Output (self, other, "Dia_Dimitri_ritual_04");	//Ach, das Ritualmesser! ...Hicks...Moment mal....
	AI_Output (self, other, "Dia_Dimitri_ritual_05");	//Seltsam! Ich habs ...hicks...nicht!
	AI_Output (other, self, "Dia_Dimitri_ritual_06");	//Wie, du hast es nicht? Wo ist es dann?
	AI_Output (self, other, "Dia_Dimitri_ritual_07");	//Oh Scheiße! Jetzt ...hicks... weiß ichs wieder: Ich habs vor einpaar Monaten an Orlan verkauft, dachte, wir bräuchten es eh nicht mehr.
	AI_Output (other, self, "Dia_Dimitri_ritual_08");	//Na toll!
	AI_Output (self, other, "Dia_Dimitri_ritual_09");	//Sorry, Mann!..Hicks... Ich .. ich...
	AI_Output (other, self, "Dia_Dimitri_ritual_10");	//Spar dir deine Ausrede! Ich werde es dann selber finden.
	DIMITRI_RITUAL = TRUE;
	B_LogEntry (DAS_BLUTRITUAL, "Dimitri hat das Ritualmesser verkauft, vielleicht weiß Orlan weiter.");
};


instance DIA_DIMITRI_BRUDER(C_Info)
{
	npc = bau_40005_dimitri;
	nr = 800;
	condition = dia_dimitri_bruder_condition;
	information = dia_dimitri_bruder_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ardoc hat mir eine Frage wegen seinem Bruder gestellt...";
};


func int dia_dimitri_bruder_condition()
{
	if ((BROTHERSDEATH == TRUE) && (VAMPIRGILDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_dimitri_bruder_info()
{
	AI_Output (other, self, "Dia_Dimitri_Bruder_00");	//Ardoc hat mir eine Frage wegen seinem Bruder gestellt...
	AI_Output (self, other, "Dia_Dimitri_Bruder_01");	//Jaja! Die...hicks... Frageprüfung!
	AI_Output (other, self, "Dia_Dimitri_Bruder_02");	//Ich weis nicht wann Ardoc Bruder gestorben ist. Kannst du mir da helfen?
	AI_Output (self, other, "Dia_Dimitri_Bruder_03");	//Nicht direkt, ich kann dir ... hicks... nur sagen, dass sein Bruder auf Khorinis bestattet wurde.
	AI_Output (other, self, "Dia_Dimitri_Bruder_04");	//Das hilft mir nicht wirklich weiter!
	AI_Output (self, other, "Dia_Dimitri_Bruder_05");	//Doch! Tut es!
};

