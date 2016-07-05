// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Bodo_EXIT   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 999;
	condition   = DIA_Bodo_EXIT_Condition;
	information = DIA_Bodo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


instance DIA_BODAA_LIGHTS(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 687;
	condition = dia_bodaa_lights_condition;
	information = dia_bodaa_lights_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bodaa_lights_condition()
{
	if (other.guild != GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_bodaa_lights_info()
{
	AI_Output (self, other, "Dia_Bodaa_Lights_00");	//Hallo Fremder! Du siehst sehr mutig aus!
	AI_Output (other, self, "Dia_Bodaa_Lights_01");	//Was willst du?
	AI_Output (self, other, "Dia_Bodaa_Lights_02");	//Ich habe ein Problem: Vor einpaar Tagen habe ich nachts im östlichen Wald seltsame Lichter schweben gesehen.
	AI_Output (self, other, "Dia_Bodaa_Lights_03");	//Sie haben sich bewegt und verschwanden schließlich in der absoluten Finsternis des Waldes.
	AI_Output (self, other, "Dia_Bodaa_Lights_04");	//Seit dem kann ich nachts kein Auge mehr zu machen. Kannst du dorthin gehen und für Ruhe sorgen?
	AI_Output (other, self, "Dia_Bodaa_Lights_05");	//Ist das nicht Sache der Söldner?
	AI_Output (self, other, "Dia_Bodaa_Lights_06");	//Die Söldner würden mich nur auslachen. Du scheinst mir ein netter Kerl zu sein.
	Info_ClearChoices (dia_bodaa_lights);
	Info_AddChoice (dia_bodaa_lights, "Das ist nicht mein Problem, ich gehe jetzt!", dia_bodaa_lights_notmyprob);
	Info_AddChoice (dia_bodaa_lights, "Gut, ich werde mir das mal ansehen.", dia_bodaa_lights_illlook);
};

func void dia_bodaa_lights_notmyprob()
{
	AI_Output (other, self, "Dia_Bodaa_Lights_notmyprob_00");	//Das ist nicht mein Problem, ich gehe jetzt!
	AI_Output (self, other, "Dia_Bodaa_Lights_notmyprob_01");	//War ja klar!
	Info_ClearChoices (dia_bodaa_lights);
	AI_StopProcessInfos (self);
};

func void dia_bodaa_lights_illlook()
{
	AI_Output (other, self, "Dia_Bodaa_Lights_illlook_00");	//Gut, ich werd mir das mal ansehen.
	AI_Output (self, other, "Dia_Bodaa_Lights_illlook_01");	//Danke!
	Log_CreateTopic (BODOS_LIGHTS, LOG_MISSION);
	Log_SetTopicStatus (BODOS_LIGHTS, LOG_Running);
	B_LogEntry (BODOS_LIGHTS, "Bodo hat seltsame Lichter im östlichen Wald gesehen, ich soll da für Ruhe sorgen.");
	Info_ClearChoices (dia_bodaa_lights);
};


instance DIA_BODAA_LIGHTS_DEAD(C_Info)
{
	npc = Bau_903_Bodo;
	nr = 147;
	condition = dia_bodaa_lights_dead_condition;
	information = dia_bodaa_lights_dead_info;
	important = FALSE;
	permanent = FALSE;
	description = "Die Lichter werden nicht mehr kommen.";
};


func int dia_bodaa_lights_dead_condition()
{
	if (Npc_KnowsInfo (other, dia_bodaa_lights) && Npc_IsDead (bodo_wisp_1) && Npc_IsDead (bodo_wisp_2) && Npc_IsDead (bodo_wisp_3))
	{
		return TRUE;
	};
};

func void dia_bodaa_lights_dead_info()
{
	AI_Output (other, self, "Dia_Bodaa_Lights_dead_00");	//Die Lichter werden nicht mehr kommen.
	AI_Output (self, other, "Dia_Bodaa_Lights_dead_01");	//Wirklich? Ich schulde dir großen Dank!
	Log_SetTopicStatus (BODOS_LIGHTS, LOG_SUCCESS);
	B_GivePlayerXP (180);
	AI_StopProcessInfos (self);
};

// ************************************************************
// 			  				  Hallo (PERM) 
// ************************************************************
INSTANCE DIA_Bodo_Hallo   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 1;
	condition   = DIA_Bodo_Hallo_Condition;
	information = DIA_Bodo_Hallo_Info;
	permanent   = TRUE;
	description = "Wie steht's?";
};
FUNC INT DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Hallo_Info()
{
	AI_Output (other, self, "DIA_Bodo_Hallo_15_00"); //Wie steht's?
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_01"); //Die Miliz hat uns lange genug schikaniert. Jetzt, wo die Söldner auf unserer Seite sind, werden sie sich nicht mehr trauen, hier einfach so aufzukreuzen.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_02"); //Der König glaubt wohl, er kann sich alles erlauben. Aber jetzt ist Schluss damit.
	};
	
	if (other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_03"); //Gut. Wenn du ein paar Milizen siehst, brat ihnen von mir auch eins über, ja?
	};
	
	if (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)
	{
		AI_Output (self, other, "DIA_Bodo_Hallo_12_04"); //Gut. Innos sei mit dir.
	};
			
	if (other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	{	
		AI_Output (self, other, "DIA_Bodo_Hallo_12_05"); //Truppen des Königs sind auf dem Hof nicht gerade willkommen.
		AI_Output (self, other, "DIA_Bodo_Hallo_12_06"); //Viele der Leute hier werden wohl trotzdem mit dir reden, aber beliebt machst du dich hier bestimmt nicht.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
INSTANCE DIA_Bodo_Bauernaufstand   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 2;
	condition   = DIA_Bodo_Bauernaufstand_Condition;
	information = DIA_Bodo_Bauernaufstand_Info;
	permanent   = FALSE;
	description = "In der Stadt ist von Bauernaufstand die Rede!";
};
FUNC INT DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bauernaufstand_15_00"); //In der Stadt ist von Bauernaufstand die Rede!
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_01"); //Unsinn. Wir machen nichts, außer das, wofür wir hart gearbeitet haben, zu verteidigen.
	AI_Output (self, other, "DIA_Bodo_Bauernaufstand_12_02"); //Es ist doch so, der Krieg wird auf dem Rücken der Bauern ausgetragen. Aber Onar ist nicht mehr bereit zuzusehen, wie der König uns ausblutet.
};

// ************************************************************
// 			  				   Bett
// ************************************************************
INSTANCE DIA_Bodo_Bett   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 3;
	condition   = DIA_Bodo_Bett_Condition;
	information = DIA_Bodo_Bett_Info;
	permanent   = FALSE;
	description = "Kann ich mich hier irgendwo ausruhen?";
};
FUNC INT DIA_Bodo_Bett_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bodo_Bett_Info()
{
	AI_Output (other, self, "DIA_Bodo_Bett_15_00"); //Kann ich mich hier irgendwo ausruhen?
	AI_Output (self, other, "DIA_Bodo_Bett_12_01"); //Wenn du einen Platz zum Schlafen suchst, geh in die Scheune. Aber leg dich nicht aus Versehen in das Bett eines Söldners.
	AI_Output (self, other, "DIA_Bodo_Bett_12_02"); //Onar sorgt zwar dafür, dass sie uns Bauern in Ruhe lassen, aber mit Fremden, die nicht zum Hof gehören, machen die Söldner, was sie wollen.
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
INSTANCE DIA_Bodo_Cipher   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 4;
	condition   = DIA_Bodo_Cipher_Condition;
	information = DIA_Bodo_Cipher_Info;
	permanent   = FALSE;
	description = "Cipher hat mir erzählt, ihm wäre ein Paket Sumpfkraut gestohlen worden...";
};
FUNC INT DIA_Bodo_Cipher_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_Cipher_Info()
{
	AI_Output (other, self, "DIA_Bodo_Cipher_15_00"); //Cipher hat mir erzählt, ihm wäre ein Paket Sumpfkraut gestohlen worden...
	AI_Output (self, other, "DIA_Bodo_Cipher_12_01"); //Und?
	AI_Output (other, self, "DIA_Bodo_Cipher_15_02"); //Er denkt, du hättest es genommen.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_03"); //Ach, DESwegen glotzt der Typ mich immer so dämlich an.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_04"); //Ich bin in letzter Zeit immer extra freundlich zu ihm, weil ich denke, der Typ ist echt mies drauf.
	AI_Output (self, other, "DIA_Bodo_Cipher_12_05"); //Aber da war nichts zu machen. Ich mache ein freundliches Gesicht und er starrt mich an, als ob er mich umbringen wolle.
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
INSTANCE DIA_Bodo_WeedOrElse   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 5;
	condition   = DIA_Bodo_WeedOrElse_Condition;
	information = DIA_Bodo_WeedOrElse_Info;
	permanent   = FALSE;
	description = "Her mit dem Kraut, oder du lernst mich kennen!";
};
FUNC INT DIA_Bodo_WeedOrElse_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_Cipher))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedOrElse_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedOrElse_15_00"); //Her mit dem Kraut, oder du lernst mich kennen!
	AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_01"); //Hör zu, alles was ich habe, ist dieser eine Stängel Kraut. Nimm ihn und lass mich in Ruhe.
	B_GiveInvItems (self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_02"); //Du weißt ja, dass Onars Söldner auf uns aufpassen, nicht wahr?
		AI_Output (self, other, "DIA_Bodo_WeedOrElse_12_03"); //Also mach ja keine Dummheiten!
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
INSTANCE DIA_Bodo_WeedPERM   (C_INFO)
{
	npc         = BAU_903_Bodo;
	nr          = 6;
	condition   = DIA_Bodo_WeedPERM_Condition;
	information = DIA_Bodo_WeedPERM_Info;
	permanent   = TRUE;
	description = "Ich glaub dir kein Wort, her mit dem Sumpfkraut!";
};
FUNC INT DIA_Bodo_WeedPERM_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Bodo_WeedOrElse))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bodo_WeedPERM_Info()
{
	AI_Output (other, self, "DIA_Bodo_WeedPERM_15_00"); //Ich glaub dir kein Wort, her mit dem Sumpfkraut!
	AI_Output (self, other, "DIA_Bodo_WeedPERM_12_01"); //Ich hab's nicht. Ehrlich.
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bodo_PICKPOCKET (C_INFO)
{
	npc			= BAU_903_Bodo;
	nr			= 900;
	condition	= DIA_Bodo_PICKPOCKET_Condition;
	information	= DIA_Bodo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen (30, 60);
};
 
FUNC VOID DIA_Bodo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bodo_PICKPOCKET);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_BACK 		,DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};
	
func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bodo_PICKPOCKET);
};













