
instance DIA_DRUSUS_EXIT(C_Info)
{
	npc = vam_90102_drusus;
	nr = 999;
	condition = dia_drusus_exit_condition;
	information = dia_drusus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_drusus_exit_condition()
{
	return TRUE;
};

func void dia_drusus_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_DRUSUS_STORY(C_Info)
{
	npc = vam_90102_drusus;
	nr = 998;
	condition = dia_drusus_story_condition;
	information = dia_drusus_story_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bist du Drusus?";
};


func int dia_drusus_story_condition()
{
	if (SC_Ist_Ein_Vampir == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_story_info()
{
	AI_Output (other, self, "Dia_Drusus_Story_00");	//Bist du Drusus?
	AI_Output (self, other, "Dia_Drusus_Story_01");	//Ja, der bin ich.  Moment mal?! Du bist ein Vampir? Wie kommst du hierher?
	AI_Output (other, self, "Dia_Drusus_Story_02");	//Durch das Portal.
	AI_Output (self, other, "Dia_Drusus_Story_03");	//Das heißt also, es gibt auf der anderen Seite auch Vampire?
	AI_Output (other, self, "Dia_Drusus_Story_04");	//Ja, sonst wär ich ja nicht hier.
	AI_Output (self, other, "Dia_Drusus_Story_05");	//Das ist sehr besorgniserregend. Damals hatten wir hier in Jharkendar noch die Alleinherraschaft.
	AI_Output (other, self, "Dia_Drusus_Story_06");	//Alleinherrschaft?
	AI_Output (self, other, "Dia_Drusus_Story_07");	//Gut, ich erzähle dir unsere Geschichte:
	AI_Output (self, other, "Dia_Drusus_Story_08");	//Vor vielen, vielen Jahren.... Ach was solls:
	AI_Output (self, other, "Dia_Drusus_Story_09");	//Damals lebten wir noch im blühenden Jarkendar. Die Stadt war gewaltig und die Bewohner konnten uns gut ernähren. Alles war perfekt.
	AI_Output (self, other, "Dia_Drusus_Story_10");	//Bis die Krieger ein mächtiges Artefakt aus einer gewonnenen Schlacht mitbrachten: Die Klaue Beliars.
	AI_Output (self, other, "Dia_Drusus_Story_11");	//Die Bewohner verfiehlen ihrem Bann und es herrschte Anarchie. Erst freuten wir uns, wir mussten nicht mehr im Verdeckten handeln.
	AI_Output (self, other, "Dia_Drusus_Story_12");	//Doch dann kam die Flut. Der Zorn Adanos traf Jharkendar und schwemmte die Bewohner weg. Beliar schenkte uns das Leben, doch wir hatten keine Nahrung.
	AI_Output (self, other, "Dia_Drusus_Story_13");	//Also gingen wir in diese Höhle und fielen in einen langen tiefen Schlaf, in der Hoffnung, das die Zeiten besser werden.
	AI_Output (other, self, "Dia_Drusus_Story_014");	//Und nun war die Zeit gekommen?
	AI_Output (self, other, "Dia_Drusus_Story_15");	//Nicht ganz, wir wurden durch diese heftigen Erdbeben, aufgeweckt.
	AI_Output (self, other, "Dia_Drusus_Story_16");	//Rodan allerdings... Er war tot, als wir ihn aus dem Sarg holten.
	B_GivePlayerXP (100);
	Log_SetTopicStatus (BLOODCLAN, LOG_SUCCESS);
};


instance DIA_DRUSUS_WEGGEHEN(C_Info)
{
	npc = vam_90102_drusus;
	nr = 997;
	condition = dia_drusus_weggehen_condition;
	information = dia_drusus_weggehen_info;
	important = FALSE;
	permanent = FALSE;
	description = "Warum seid ihr damals nicht einfach fortgegangen?";
};


func int dia_drusus_weggehen_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_story))
	{
		return TRUE;
	};
};

func void dia_drusus_weggehen_info()
{
	AI_Output (other, self, "Dia_Drusus_weggehen_00");	//Warum seid ihr damals nicht einfach fortgegangen?
	AI_Output (self, other, "Dia_Drusus_weggehen_01");	//Wie denn? Das Portal war versiegelt und wir konnten es von hier aus nicht öffnen.
	AI_Output (other, self, "Dia_Drusus_weggehen_02");	//Und der Seeweg?
	AI_Output (self, other, "Dia_Drusus_weggehen_03");	//Woraus sollten wir denn ein Boot bauen? Alle Bäume waren zerstört.
	AI_Output (self, other, "Dia_Drusus_weggehen_04");	//Und selbst wenn, wohin hätten wir Segeln sollen? Wir haben keine Ahnung von Navigation, wir sind Vampire, keine Seefahrer.
};


instance DIA_DRUSUS_WASVOR(C_Info)
{
	npc = vam_90102_drusus;
	nr = 996;
	condition = dia_drusus_wasvor_condition;
	information = dia_drusus_wasvor_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und was habt ihr vor?";
};


func int dia_drusus_wasvor_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_story))
	{
		return TRUE;
	};
};

func void dia_drusus_wasvor_info()
{
	AI_Output (other, self, "Dia_Drusus_wasvor_00");	//Und was habt ihr vor?
	AI_Output (self, other, "Dia_Drusus_wasvor_01");	//Wir werden ersmal unsere Kräfte sammeln. Am besten wärs, wenn du dich uns anschließt.
	Info_ClearChoices (dia_drusus_wasvor);
	Info_AddChoice (dia_drusus_wasvor, "Ich überlegs mir.", dia_drusus_wasvor_later);
	Info_AddChoice (dia_drusus_wasvor, "Ich bin dabei.", dia_drusus_wasvor_okay);
};

func void dia_drusus_wasvor_later()
{
	AI_Output (other, self, "Dia_Drusus_wasvor_later_00");	//Ich überlegs mir.
	AI_Output (self, other, "Dia_Drusus_wasvor_later_01");	//Wenn du dich entschieden hast, weißt du, wo du mich finden kannst.
	SC_LATER = TRUE;
	Log_CreateTopic (VAM_IN_ADW, LOG_MISSION);
	Log_SetTopicStatus (VAM_IN_ADW, LOG_Running);
	B_LogEntry (VAM_IN_ADW, "Ich habe auf dem unbekannten Teil er Insel Vampire getroffen. Das sollte Ardoc interessieren.");
	Info_ClearChoices (dia_drusus_wasvor);
};

func void dia_drusus_wasvor_okay()
{
	AI_Output (other, self, "Dia_Drusus_wasvor_okay_00");	//Ich bin dabei!
	AI_Output (self, other, "Dia_Drusus_wasvor_okay_01");	//Das ist gut. Du musst nur das Ritual durchführen und schon bist du dabei.
	SC_OKAY = TRUE;
	Log_CreateTopic (VAM_IN_ADW, LOG_MISSION);
	Log_SetTopicStatus (VAM_IN_ADW, LOG_Running);
	B_LogEntry (VAM_IN_ADW, "Ich habe auf dem unbekannten Teil er Insel Vampire getroffen. Das sollte Ardoc interessieren.");
	Info_ClearChoices (dia_drusus_wasvor);
};


instance DIA_DRUSUS_BEITRITT_LATER(C_Info)
{
	npc = vam_90102_drusus;
	nr = 990;
	condition = dia_drusus_beitritt_later_condition;
	information = dia_drusus_beitritt_later_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe mich entschieden mitzumachen.";
};


func int dia_drusus_beitritt_later_condition()
{
	if (SC_LATER == TRUE)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_beitritt_later_info()
{
	AI_Output (other, self, "Dia_Drusus_BEITRITT_LATER_00");	//Ich habe mich entschieden mitzumachen.
	AI_Output (self, other, "Dia_Drusus_BEITRITT_LATER_01");	//Das ist gut. Dann musst du nur das Ritual durchführen.
};


instance DIA_DRUSUS_RITUAL(C_Info)
{
	npc = vam_90102_drusus;
	nr = 989;
	condition = dia_drusus_ritual_condition;
	information = dia_drusus_ritual_info;
	important = FALSE;
	permanent = FALSE;
	description = "Was für ein Ritual?";
};


func int dia_drusus_ritual_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_beitritt_later) || (SC_OKAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_drusus_ritual_info()
{
	AI_Output (other, self, "Dia_Drusus_Ritual_00");	//Was für ein Ritual?
	AI_Output (self, other, "Dia_Drusus_Ritual_01");	//Es ist relativ simpel:
	AI_Output (self, other, "Dia_Drusus_Ritual_02");	//Zuerst brauchst du die 3 alten Kelche unserer Vorfahren.
	AI_Output (self, other, "Dia_Drusus_Ritual_03");	//Der erste Kelch liegt oben auf dem Tempel in dem sich das Portal befindet.
	AI_Output (self, other, "Dia_Drusus_Ritual_04");	//Der zweite befindet sich in einer kleinen, verfallenen Ruine westlich von hier.
	AI_Output (self, other, "Dia_Drusus_Ritual_05");	//Laut Cortus lebt ein Orkschamane darin.
	AI_Output (self, other, "Dia_Drusus_Ritual_06");	//Den dritten Kelch findest du auf einem kleinen Felsen im See.
	AI_Output (self, other, "Dia_Drusus_Ritual_07");	//Nachdem du die Kleche hast, ritzt du dir 3 mal in den Arm und Füllst das Blut in Fläschchen ab.
	AI_Output (self, other, "Dia_Drusus_Ritual_08");	//Mit dem Blut und den Kelchen begibst du dich zu einem Beliarschrein und opferst ihm dein Blut in dem du es in den Kelchen verteilst.
	AI_Output (self, other, "Dia_Drusus_Ritual_09");	//Doch dummerweise gibts da ein Problem.
	AI_Output (other, self, "Dia_Drusus_Ritual_10");	//Ein Problem?
	AI_Output (self, other, "Dia_Drusus_Ritual_11");	//Ja, wir haben nämlich kein Ritualmesser und wissen auch nicht, wo wir eins finden.
	AI_Output (self, other, "Dia_Drusus_Ritual_12");	//Du musst also selber eins auftreiben.
	Log_CreateTopic (VAM_IN_ADW_AUFNAHME, LOG_MISSION);
	Log_SetTopicStatus (VAM_IN_ADW_AUFNAHME, LOG_Running);
	B_LogEntry (VAM_IN_ADW_AUFNAHME, "Um bei beim Blood-Clan aufgenommen zu werden, muss ich die drei alten Kelche finden: Der erste ist oben auf dem Portaltempel, der zweite in einer von einem Orkschamanen bewohnten Ruine westlich des Vampirverstecks und der letzte befindet sich auf einem Felsen im See. Nach dem ich die kelche habe muss ich mich mit einem Ritualmesser 3 mal anritzen und das Blut mithilfe der Kelche an Beliar opfern.");
	BLOOD_CLANSPENDE = TRUE;
};


instance DIA_DRUSUS_AUFNAHEME(C_Info)
{
	npc = vam_90102_drusus;
	nr = 982;
	condition = dia_drusus_aufnaheme_condition;
	information = dia_drusus_aufnaheme_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe mein Blut geopfert.";
};


func int dia_drusus_aufnaheme_condition()
{
	if (MYBLOODSPENDE == TRUE)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_aufnaheme_info()
{
	AI_Output (other, self, "Dia_Drusus_Aufnaheme_00");	//Ich habe mein Blut geopfert.
	AI_Output (self, other, "Dia_Drusus_Aufnaheme_01");	//Ausgezeichnet! Du bist jetzt einer von uns.
	AI_Output (other, self, "Dia_Drusus_Aufnaheme_02");	//Gibts da nicht einen Schwur oder sowas?
	AI_Output (self, other, "Dia_Drusus_Aufnaheme_03");	//Das ist doch alles Quatsch! War hält sich denn schon an Schwüre?
	VAMPIRGILDE_ADW = TRUE;
	B_GivePlayerXP (250);
	Log_SetTopicStatus (VAM_IN_ADW_AUFNAHME, LOG_SUCCESS);
};


instance DIA_DRUSUS_DEALMITPIR(C_Info)
{
	npc = vam_90102_drusus;
	nr = 800;
	condition = dia_drusus_dealmitpir_condition;
	information = dia_drusus_dealmitpir_info;
	important = FALSE;
	permanent = FALSE;
	description = "Gibts für mich was zu tun?";
};


func int dia_drusus_dealmitpir_condition()
{
	if (VAMPIRGILDE_ADW == TRUE)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_dealmitpir_info()
{
	AI_Output (other, self, "Dia_Drusus_dealmitpir_00");	//Gibts für mich was zu tun?
	AI_Output (self, other, "Dia_Drusus_dealmitpir_01");	//Ja, du sollst von den Piraten etwas Schnaps holen. Letztes mal hat Cortus etwas spezielles mitgebacht: Den schnellen Hering, das Zeug ist unglaublich...
	AI_Output (other, self, "Dia_Drusus_dealmitpir_02");	//Moment mal, Vampire und Schnaps?
	AI_Output (self, other, "Dia_Drusus_dealmitpir_03");	//Denkst du etwa, wir trinken nur pures Blut? Mit Schnaps schmeckt es noch sagenhafter....(psychopatisches grinsen)
	AI_Output (self, other, "Dia_Drusus_dealmitpir_04");	//Äh, ja, also du sollst zu ihrem Schnapsbrenner gehen und einpaar Flaschen 'Schneller Hering' kaufen.
	AI_Output (other, self, "Dia_Drusus_dealmitpir_05");	//Und wieviele?
	AI_Output (self, other, "Dia_Drusus_dealmitpir_06");	//6 sollten reichen, hier hast du etwas Gold.
	B_GiveInvItems (self, other, ItMi_Gold, 100);
	Log_CreateTopic (VAM_PIR_HERING, LOG_MISSION);
	Log_SetTopicStatus (VAM_PIR_HERING, LOG_Running);
	B_LogEntry (VAM_PIR_HERING, "Drusus will, dass ich ihm 6 Flaschen 'Schneller Hering' besorge. Einer der Piraten soll es verkaufen.");
};


instance DIA_DRUSUS_DEALMITPIR_ERFOLG(C_Info)
{
	npc = vam_90102_drusus;
	nr = 799;
	condition = dia_drusus_dealmitpir_erfolg_condition;
	information = dia_drusus_dealmitpir_erfolg_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich hab den Schnaps.";
};


func int dia_drusus_dealmitpir_erfolg_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_dealmitpir) && (Npc_HasItems (other, ItFo_Addon_SchnellerHering) >= 6) && (VAMPIRGILDE_ADW == TRUE))
	{
		return TRUE;
	};
};

func void dia_drusus_dealmitpir_erfolg_info()
{
	AI_Output (other, self, "Dia_Drusus_dealmitpir_erfolg_00");	//Ich hab den Schnaps.
	AI_Output (self, other, "Dia_Drusus_dealmitpir_erfolg_01");	//Gib her.
	B_GiveInvItems (other, self, ItFo_Addon_SchnellerHering, 6);
	B_UseItem (self, ItFo_Addon_SchnellerHering);
	AI_Output (self, other, "Dia_Drusus_dealmitpir_erfolg_02");	//Gut gemacht. Auf dich kann man sich verlassen.
	B_GivePlayerXP (250);
	Log_SetTopicStatus (VAM_PIR_HERING, LOG_SUCCESS);
};


instance DIA_DRUSUS_EXPERIMENT(C_Info)
{
	npc = vam_90102_drusus;
	nr = 789;
	condition = dia_drusus_experiment_condition;
	information = dia_drusus_experiment_info;
	important = FALSE;
	permanent = FALSE;
	description = "Hast du noch was für mich zu tun?";
};


func int dia_drusus_experiment_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_dealmitpir_erfolg))
	{
		return TRUE;
	};
};

func void dia_drusus_experiment_info()
{
	AI_Output (other, self, "Dia_drusus_experiment_00");	//Hast du noch was für mich zu tun?
	AI_Output (self, other, "Dia_drusus_experiment_01");	//Ja, etwas anpruchsvolleres.
	AI_Output (self, other, "Dia_drusus_experiment_02");	//Einpaar Tage vor deiner Ankunft ist mein Experiment entlaufen.
	AI_Output (other, self, "Dia_drusus_experiment_03");	//Was für ein Experiment?
	AI_Output (self, other, "Dia_drusus_experiment_04");	//Ach, das ist nicht so wichtig, es müsste harmlos sein.
	AI_Output (self, other, "Dia_drusus_experiment_05");	//Auf jedenfall hat es mir eine wichtige Steintafel verschluckt. Die du mir wiederbringen musst.
	AI_Output (other, self, "Dia_drusus_experiment_06");	//Eine Steintafel verschluckt und es soll harmlos sein?
	AI_Output (self, other, "Dia_drusus_experiment_07");	//Mach dir nicht so viel Sorgen, du bist doch schließlich ein Vampir.
	AI_Output (other, self, "Dia_drusus_experiment_08");	//Wo soll ich suchen und vorallem wonach?
	AI_Output (self, other, "Dia_drusus_experiment_09");	//Das Vieh müsste noch auf dieser Seite der Brücke sein, schau dich nur etwas um.
	AI_Output (self, other, "Dia_drusus_experiment_10");	//Und erkennen wirst du es schon selbst. Viel glück
	Log_CreateTopic (VAM_BUG, LOG_MISSION);
	Log_SetTopicStatus (VAM_BUG, LOG_Running);
	B_LogEntry (VAM_BUG, "Ich soll Drusus eine Steintafel zurückbringen, die ein entflohenes Experiement von ihm verschluckt hat. Angeblich ist es diesseits der Brücke.");
	AI_StopProcessInfos (self);
	Wld_SendTrigger ("BUGSCHLEIFE");
	Wld_InsertNpc (fat_blattcrawler, "ADW_VALLEY_PATH_058");
};


instance DIA_DRUSUS_EREMIT(C_Info)
{
	npc = vam_90102_drusus;
	nr = 780;
	condition = dia_drusus_eremit_condition;
	information = dia_drusus_eremit_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe deine Steintafel";
};


func int dia_drusus_eremit_condition()
{
	if (Npc_HasItems (other, itwr_drusus_tafel) >= 1)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_eremit_info()
{
	AI_Output (other, self, "Dia_Drusus_eremit_00");	//Ich habe deine Steintafel
	B_GiveInvItems (other, self, itwr_drusus_tafel, 1);
	AI_Output (self, other, "Dia_Drusus_eremit_01");	//Gut, gib her. Sie scheint zum Glück noch nicht verdaut zu sein.
	AI_Output (self, other, "Dia_Drusus_eremit_02");	//Auf jedenfall hast du deine Aufgabe gut gemacht. Aber jetzt wirds ernst.
	AI_Output (self, other, "Dia_Drusus_eremit_03");	//Ich habe einen Plan und wir brauchen noch mehr Mitglieder.
	AI_Output (self, other, "Dia_Drusus_eremit_04");	//Hör zu, im Nordwesten wohnt ein Eremit.Er scheint im Gegensatz zu den Piraten und Banditen etwas Hirn im Kopf zu haben.
	AI_Output (self, other, "Dia_Drusus_eremit_05");	//Du gehts zu ihm und machst ihn zu einem Vampir.
	AI_Output (other, self, "Dia_Drusus_eremit_06");	//Ich?
	AI_Output (self, other, "Dia_Drusus_eremit_07");	//Ja, du hast schon mehrmals deine Fähigkeiten und deinen Verstand bewiesen.
	Log_SetTopicStatus (VAM_BUG, LOG_SUCCESS);
	B_GivePlayerXP (300);
	B_GiveInvItems (other, self, itwr_drusus_tafel, 6);
};


instance DIA_DRUSUS_EREMIT_2(C_Info)
{
	npc = vam_90102_drusus;
	nr = 779;
	condition = dia_drusus_eremit_2_condition;
	information = dia_drusus_eremit_2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und wie soll ich das anstellen?";
};


func int dia_drusus_eremit_2_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_eremit))
	{
		return TRUE;
	};
};

func void dia_drusus_eremit_2_info()
{
	AI_Output (other, self, "Dia_Drusus_eremit_2_00");	//Und wie soll ich das anstellen?
	AI_Output (self, other, "Dia_Drusus_eremit_2_01");	//Du weißt es nicht?
	AI_Output (other, self, "Dia_Drusus_eremit_2_02");	//Ich bin auch erst seit kurzer Zeit ein Vampir.
	AI_Output (self, other, "Dia_Drusus_eremit_2_03");	//Na gut! Also pass auf, ich erkläre dir den einfachsten Weg:
	AI_Output (self, other, "Dia_Drusus_eremit_2_04");	//Nimm dieses Gemisch und vermische es mit etwas Grog an einem Alchemietisch.
	AI_Output (self, other, "Dia_Drusus_eremit_2_05");	//Dann gibst du es dem Eremiten und schlägst ihn zusammen, aber pass auf, dass du ihn nicht tötest.
	AI_Output (self, other, "Dia_Drusus_eremit_2_06");	//Beim Aufwachen sollte er ein Vampir sein.
	AI_Output (other, self, "Dia_Drusus_eremit_2_07");	//Das wars?
	B_GiveInvItems (self, other, itpo_gemisch, 1);
	AI_Output (self, other, "Dia_Drusus_eremit_2_08");	//Ja, wenn er aufwacht, bringst du ihn hierher.
	AI_Output (self, other, "Dia_Drusus_eremit_2_09");	//Achja, mach das ganze nachts, sonst verbrennt er.
	Log_CreateTopic (VAM_EREMIT, LOG_MISSION);
	Log_SetTopicStatus (VAM_EREMIT, LOG_Running);
	B_LogEntry (VAM_EREMIT, " Ich soll einen Eremiten, der Nordwestlich von Hier lebt aufsuchen und ihn zu einem Vampir machen. Dazu muss ich Das Gemisch mit etwas Grog vermischen, es dem Eremiten geben und ihn dann niederschlagen.");
};


instance DIA_DRUSUS_EREMIT_FLEE(C_Info)
{
	npc = vam_90102_drusus;
	nr = 750;
	condition = dia_drusus_eremit_flee_condition;
	information = dia_drusus_eremit_flee_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_drusus_eremit_flee_condition()
{
	if ((EREMIT_FLEE == TRUE) || (Npc_IsDead (NONE_ADDON_115_Eremit) == TRUE))
	{
		if (Npc_KnowsInfo (other, dia_drusus_eremit_2) && (EREMIT_IST_DA == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_drusus_eremit_flee_info()
{
	AI_Output (self, other, "Dia_Drusus_eremit_flee_00");	//Und? Wo ist der Eremit?
	AI_Output (other, self, "Dia_Drusus_eremit_flee_01");	//Ähm....
	Info_ClearChoices (dia_drusus_eremit_flee);
	Info_AddChoice (dia_drusus_eremit_flee, "Er ist nicht mehr aufgewacht.", dia_drusus_eremit_flee_awake);
	Info_AddChoice (dia_drusus_eremit_flee, "Er war weg als ich ankam.", dia_drusus_eremit_flee_notthere);
	Info_AddChoice (dia_drusus_eremit_flee, "Er hats nicht verkraftet und ist in den Abgrund gesprungen.", dia_drusus_eremit_flee_jump);
	Log_SetTopicStatus (VAM_EREMIT, LOG_FAILED);
};

func void dia_drusus_eremit_flee_awake()
{
	AI_Output (other, self, "Dia_Drusus_eremit_flee_Awake_00");	//Er ist nicht mehr aufgewacht.
	AI_Output (self, other, "Dia_Drusus_eremit_flee_Awake_01");	//Wie? Hast du ihn umgebracht?
	AI_Output (other, self, "Dia_Drusus_eremit_flee_Awake_02");	//Nein, ich glaub nicht. Vielleicht hat er das Gemisch nicht verkraftet.
	AI_Output (self, other, "Dia_Drusus_eremit_flee_Awake_03");	//Hmm... das ist bedauerlich, aber da kann man wohl nichts mehr machen.
	Info_ClearChoices (dia_drusus_eremit_flee);
};

func void dia_drusus_eremit_flee_notthere()
{
	AI_Output (other, self, "Dia_Drusus_eremit_flee_notthere_00");	//Er war weg als ich ankam.
	AI_Output (self, other, "Dia_Drusus_eremit_flee_notthere_01");	//Hast du nach ihm gesucht?
	AI_Output (other, self, "Dia_Drusus_eremit_flee_notthere_02");	//Ja, aber er war nirgends.
	AI_Output (self, other, "Dia_Drusus_eremit_flee_Awake_03");	//Hmm... das ist bedauerlich, aber da kann man wohl nichts mehr machen.
	Info_ClearChoices (dia_drusus_eremit_flee);
};

func void dia_drusus_eremit_flee_jump()
{
	AI_Output (other, self, "Dia_Drusus_eremit_flee_jump_00");	//Er hats nicht verkraftet und ist in den Abgrund gesprungen.
	AI_Output (self, other, "Dia_Drusus_eremit_flee_jump_01");	//Was?
	AI_Output (other, self, "Dia_Drusus_eremit_flee_jump_02");	//Ich hab ihm erzählt, was er jetzt ist und er konnte es nicht verarbeiten.
	AI_Output (self, other, "Dia_Drusus_eremit_flee_Awake_03");	//Hmm... das ist bedauerlich, aber da kann man wohl nichts mehr machen.
	Info_ClearChoices (dia_drusus_eremit_flee);
};


instance DIA_DRUSUS_EREMIT_VAMPIR_DA(C_Info)
{
	npc = vam_90102_drusus;
	nr = 700;
	condition = dia_drusus_eremit_vampir_da_condition;
	information = dia_drusus_eremit_vampir_da_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_drusus_eremit_vampir_da_condition()
{
	if (EREMIT_IST_DA == TRUE)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_eremit_vampir_da_info()
{
	AI_Output (self, other, "Dia_Drusus_Vampir_da_00");	//Gut gemacht!
	AI_Output (self, other, "Dia_Drusus_Vampir_da_01");	//Du hast ihn zu einem von uns gemacht und ihn sicher hierher gebracht.
	Log_SetTopicStatus (VAM_EREMIT, LOG_SUCCESS);
	B_GivePlayerXP (400);
};


instance DIA_DRUSUS_BANDIT_RUESSI(C_Info)
{
	npc = vam_90102_drusus;
	nr = 650;
	condition = dia_drusus_bandit_ruessi_condition;
	information = dia_drusus_bandit_ruessi_info;
	important = FALSE;
	permanent = FALSE;
	description = "Und?";
};


func int dia_drusus_bandit_ruessi_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_eremit_vampir_da) || Npc_KnowsInfo (other, dia_drusus_eremit_flee))
	{
		return TRUE;
	};
};

func void dia_drusus_bandit_ruessi_info()
{
	if (Npc_KnowsInfo (other, dia_drusus_eremit_flee))
	{
		AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_00");	//Und?
		AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_01");	//Jetzt muss ich an seiner Stelle Cortus schicken.
	}
	else
	{
		AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_00");	//Und?
		AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_10");	//Jetzt werde ich ihn hinschicken.
	};
	AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_02");	//Wohin?
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_03");	//Ins Banditenlager, dorthin, wo du auch hingehen wirst.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_04");	//Du musst ihm allerdings noch eine passende Banditenrüstung besorgen.
	AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_05");	//Und was sollen wir da?
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_06");	//Also gut ich erzähls dir:
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_07");	//Dort wo jetzt das Banditenlager ist, liegt ein Tempel Adanos.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_08");	//Im Inneren befindet sich ein Artefakt, genannt 'Die Klaue Beliars', das wir in unseren Besitz bringen wollen.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_09");	//Doch der Tempel ist verschlossen. Wir haben eine Hälfte des Schlüssels um hineizugelangen.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_11");	//Doch uns fehlt eine zweite.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_12");	//Allerdings haben wir Glück und der Anführer des Banditenlagers will auch in den Tempel.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_13");	//Vielleicht hat er es geschafft von den Ahnen die andere Hälfte zu bekommen, wenn nicht den ganzen Schlüssel.
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_14");	//Du sollst nach dieser fehlenden Hälfte suchen, um in den Tempel zu gelangen.
	B_GivePlayerXP (500);
	if (Npc_KnowsInfo (other, dia_drusus_eremit_flee))
	{
		AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_16");	//Cortus wird dich unterstützen.
	}
	else
	{
		AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_15");	//Der Eremit wird dich unterstützen.
	};
	AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_17");	//Und dann?
	AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_18");	//Dann sehen wir weiter.
	AI_TurnAway (hero, self);
	AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_19");	//(murmelt)Die Geschichte könnte Ardoc interessieren.
	AI_StopProcessInfos (self);
	Log_CreateTopic (VAM_RUESTUNG, LOG_MISSION);
	Log_SetTopicStatus (VAM_RUESTUNG, LOG_Running);
	B_LogEntry (VAM_RUESTUNG, "Drusus will, dass ich eine Banditenrüstung beschaffe, damit sich einer der Vampire mit mir bei den Banditen einschleusen kann.");
	Log_CreateTopic (VAM_KEY, LOG_MISSION);
	Log_SetTopicStatus (VAM_KEY, LOG_Running);
	B_LogEntry (VAM_KEY, "Drusus will die zweite Hälfte des Schlüssel für den Tempeleingang.");
	ARDOC_INTEREST = TRUE;
};


var int ruessi;

instance DIA_DRUSUS_BANDIT_RUESSI_DA(C_Info)
{
	npc = vam_90102_drusus;
	nr = 649;
	condition = dia_drusus_bandit_ruessi_da_condition;
	information = dia_drusus_bandit_ruessi_da_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich hab ne zweite Rüstung";
};


func int dia_drusus_bandit_ruessi_da_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_bandit_ruessi) && (Npc_HasItems (other, ItAr_BDT_M) >= 1) && (Npc_HasItems (other, ItAr_BDT_H) >= 1))
	{
		return TRUE;
	};
	if ((Npc_HasItems (other, ItAr_BDT_M) >= 1) && (Npc_HasItems (other, ITAR_Thorus_Addon) >= 1) && Npc_KnowsInfo (other, dia_drusus_bandit_ruessi))
	{
		return TRUE;
	};
	if ((Npc_HasItems (other, ITAR_Thorus_Addon) >= 1) && (Npc_HasItems (other, ItAr_BDT_H) >= 1) && Npc_KnowsInfo (other, dia_drusus_bandit_ruessi))
	{
		return TRUE;
	};
};

func void dia_drusus_bandit_ruessi_da_info()
{
	AI_Output (other, self, "Dia_Drusus_Bandit_ruessi_da_00");	//Ich hab ne Rüstung
	if (Npc_KnowsInfo (other, dia_drusus_eremit_flee))
	{
		AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_da_02");	//Gut, bring sie zu Cortus, er ist bestimmt noch immer im Portaltempel.
		B_GivePlayerXP (100);
		CORTUS_BDT = TRUE;
	}
	else
	{
		AI_Output (self, other, "Dia_Drusus_Bandit_ruessi_da_01");	//Gut, gib sie dem Eremiten.
		B_GivePlayerXP (200);
		EREMIT_BDT = TRUE;
	};
	Log_SetTopicStatus (VAM_RUESTUNG, LOG_SUCCESS);
};


instance DIA_DRUSUS_KEYDA(C_Info)
{
	npc = vam_90102_drusus;
	nr = 500;
	condition = dia_drusus_keyda_condition;
	information = dia_drusus_keyda_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Schlüssel zum Tempeleingeng.";
};


func int dia_drusus_keyda_condition()
{
	if (Npc_HasItems (other, itmi_tempeltorkey_wrong) >= 1)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_keyda_info()
{
	AI_Output (other, self, "Dia_Drusus_keyda_00");	//Ich habe den Schlüssel zum Tempeleingeng. Aber er ist beschädigt.
	AI_Output (self, other, "Dia_Drusus_keyda_01");	//Lass mal sehen!
	Npc_RemoveInvItems (other, itmi_tempeltorkey_wrong, 1);
	CreateInvItems (other, ItMi_TempelTorKey, 1);
	AI_Output (self, other, "Dia_Drusus_keyda_02");	//Interessant. Da ist genau der Teil der uns fehlt. Ich kann des wieder hinkriegen.
	AI_Output (self, other, "Dia_Drusus_keyda_03");	//Moment, hier hast du es. damit solltest du den Tempeleingang öffnen können.
	AI_Output (self, other, "Dia_Drusus_keyda_04");	//Bring mir die Klaue Beliars.
	B_GivePlayerXP (300);
	Log_SetTopicStatus (VAM_KEY, LOG_SUCCESS);
	AI_StopProcessInfos (self);
};


instance DIA_DRUSUS_KLAUE(C_Info)
{
	npc = vam_90102_drusus;
	nr = 400;
	condition = dia_drusus_klaue_condition;
	information = dia_drusus_klaue_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe die Klaue.";
};


func int dia_drusus_klaue_condition()
{
	if (C_ScHasBeliarsWeapon () && (ALLES_ZU_ENDE == FALSE) && (ARDOC_KLAUE == FALSE))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_klaue_info()
{
	AI_Output (other, self, "Dia_Drusus_Klaue_no_05");	//Ich habe die Klaue.
	Info_ClearChoices (dia_drusus_klaue);
	Info_AddChoice (dia_drusus_klaue, "Du kriegst sie aber nicht!", dia_drusus_klaue_no);
	Info_AddChoice (dia_drusus_klaue, "Hier hast du sie!", dia_drusus_klaue_yes);
};

func void dia_drusus_klaue_no()
{
	AI_Output (other, self, "Dia_Drusus_Klaue_no_00");	//Du kriegst sie aber nicht!
	AI_Output (self, other, "Dia_Drusus_Klaue_no_01");	//Wie nein? Gib sie sofort her!
	AI_Output (other, self, "Dia_Drusus_Klaue_no_02");	//Du bekommst sie nicht! Sie ist nicht für dich bestimmt.
	AI_Output (self, other, "Dia_Drusus_Klaue_no_03");	//Na warte!
	B_GiveInvItems (self, other, itru_transshadow, 1);
	DRUSUS_SAUER = TRUE;
	Info_ClearChoices (dia_drusus_klaue);
	AI_StopProcessInfos (self);
	self.flags = 0;
	vam_90103_kira.flags = 0;
	vam_90101_cortus.flags = 0;
	B_Attack (self, hero, AR_KILL, 1);
	B_Attack (vam_90103_kira, hero, AR_KILL, 1);
};

func void dia_drusus_klaue_yes()
{
	B_ClearBeliarsWeapon ();
	AI_Output (other, self, "Dia_Drusus_Klaue_yes_00");	//Hier hast du sie!
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_01");	//Gut gemacht! Deine Leistungen für den Clan sind außerordentlich!
	AI_Output (other, self, "Dia_Drusus_Klaue_yes_02");	//Was hast du nun mit der Klaue vor?
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_03");	//Also pass auf: Die Klaue hat die Macht den Verstand zu beeiflussen.
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_04");	//Vorallem den Verstand von Orks. Aber nicht nur das.
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_05");	//Sie kann ihrem Opfer große Macht verleihen.
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_06");	//Nun, auf der anderen Seite des Portals befindet sich nahe der Küste eine Höhle mit einer Orkstatue.
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_07");	//Durch sie und die können wir eine magische Verbindung zu den Orks aufbauen und sie zu unseren willenlosen Sklaven machen.
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_08");	//Dann werden sie den Krieg gewinnen, die Menschheit versklaven! Beliar wird uns reich entlohnen!
	AI_Output (self, other, "Dia_Drusus_Klaue_yes_09");	//Wir treffen uns in der Höhle zum Ritual. Komm und habe daran Teil! Beliar hat uns erwählt!
	B_GiveInvItems (self, other, itru_energy, 1);
	KLAUE_DRUSUS = TRUE;
	B_GivePlayerXP (500);
	Info_ClearChoices (dia_drusus_klaue);
};


instance DIA_DRUSUS_SECONDCHANCE(C_Info)
{
	npc = vam_90102_drusus;
	nr = 45;
	condition = dia_drusus_secondchance_condition;
	information = dia_drusus_secondchance_info;
	important = FALSE;
	permanent = FALSE;
	description = "(Klaue anbieten und Vorfall vertuschen)";
};


func int dia_drusus_secondchance_condition()
{
	if (C_ScHasBeliarsWeapon () && (ALLES_ZU_ENDE == TRUE) && (ARDOC_KLAUE == TRUE) && (DRUSUS_SAUER == FALSE))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_secondchance_info()
{
	AI_Output (other, self, "Dia_Drusus_secondchance_00");	//Meister, ich habe die Klaue.
	AI_Output (self, other, "Dia_Drusus_secondchance_01");	//Warum hat das so lange gedauert?
	AI_Output (other, self, "Dia_Drusus_secondchance_02");	//Es tut mir Leid Meister: Eine Gruppe von fremden Vampiren hat wohl die Präsenz der Klaue gespürt und mich ausgeraubt.
	AI_Output (other, self, "Dia_Drusus_secondchance_03");	//Sie fesselten mich und wollten, dass ich ihnen beim Ritual an der Orkstatue zusehe.
	AI_Output (other, self, "Dia_Drusus_secondchance_04");	//Doch der mächtige Magier Xardas, hat mich gerettet und alle Vampire getötet.
	AI_Output (self, other, "Dia_Drusus_secondchance_05");	//Er ließ dich laufen? Warum hat er das getan?
	AI_Output (other, self, "Dia_Drusus_secondchance_06");	//Ich war früher sein Lehrling, er hat wohl nicht geglaubt, dass ich ein Vampir bin.
	AI_Output (self, other, "Dia_Drusus_secondchance_07");	//(Nachdenklich) Ein Magier tötet mehrere Vampire, einfach so!
	AI_Output (self, other, "Dia_Drusus_secondchance_08");	//Gut, dass du wieder da bist. Wir können das Ritual aber noch nicht durchführen. Dieser Magier ist zu mächtig.
	AI_Output (self, other, "Dia_Drusus_secondchance_09");	//Wir müssen auf einen passenden Augenblick warten. Er darf sich zum Zeitpunkt des Rituals nicht auf der Insel befinden.
	SECOND_DRUSUS = TRUE;
};


instance DIA_DRUSUS_LETSFETZ(C_Info)
{
	npc = vam_90102_drusus;
	nr = 44;
	condition = dia_drusus_letsfetz_condition;
	information = dia_drusus_letsfetz_info;
	important = FALSE;
	permanent = FALSE;
	description = "Xardas ist weg!";
};


func int dia_drusus_letsfetz_condition()
{
	if ((SECOND_DRUSUS == TRUE) && (MIS_Xardas_SCCanOpenIrdorathBook == TRUE))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_letsfetz_info()
{
	AI_Output (other, self, "Dia_Drusus_letsfetz_00");	//Xardas ist weg! Der Magier ist nicht mehr auf der Insel!
	AI_Output (self, other, "Dia_Drusus_letsfetz_01");	//Wirklich? Bist du dir Sicher?
	AI_Output (other, self, "Dia_Drusus_letsfetz_02");	//Ja!
	AI_Output (self, other, "Dia_Drusus_letsfetz_03");	//Gut, dann werden wir das Ritual durchführen. Wir treffen uns an der Orkstatue.
	B_GivePlayerXP (250);
	B_GiveInvItems (self, other, itru_transshadow, 1);
	LETZ_FETZ_DRUSUS = TRUE;
};


instance DIA_DRUSUS_ENDOFDAYS(C_Info)
{
	npc = vam_90108_drusus_nw;
	nr = 999;
	condition = dia_drusus_endofdays_condition;
	information = dia_drusus_endofdays_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_drusus_endofdays_condition()
{
	if (ALLES_ZU_ENDE == FALSE)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_endofdays_info()
{
	AI_Output (self, other, "Dia_Drusus_Endofdays_00");	//Ahhh! Da bist du endlich! Nun werden wir das Ritual durchführen und die Menschheit versklaven!
	AI_Output (self, other, "Dia_Drusus_Endofdays_01");	//Beliar wird uns reich entlohnen, er hat uns erwählt!
	B_GivePlayerXP (450);
};


instance DIA_DRUSUS_ENDOFDAYS_2(C_Info)
{
	npc = vam_90108_drusus_nw;
	nr = 998;
	condition = dia_drusus_endofdays_2_condition;
	information = dia_drusus_endofdays_2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Bringen wirs hinter uns!";
};


func int dia_drusus_endofdays_2_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_endofdays))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_endofdays_2_info()
{
	AI_Output (other, self, "Dia_Drusus_Endofdays_2_00");	//Bringen wirs hinter uns!
	AI_Output (self, other, "Dia_Drusus_Endofdays_2_01");	//Wer...
	Npc_ExchangeRoutine (NONE_100_Xardas, "ORK");
	AI_Teleport (NONE_100_Xardas, "XARDAS_KOMMT");
	Wld_PlayEffect ("SPELLFX_TELEPORT", NONE_100_Xardas, NONE_100_Xardas, 0, 0, 0, FALSE);
	CreateInvItems (self, ItMw_BeliarWeapon_Raven, 1);
	XARDAS_LABER_LOS = TRUE;
	AI_StopProcessInfos (self);
};


instance DIA_DRUSUS_BADBOY(C_Info)
{
	npc = vam_90108_drusus_nw;
	nr = 44;
	condition = dia_drusus_badboy_condition;
	information = dia_drusus_badboy_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_drusus_badboy_condition()
{
	if (LETZ_FETZ_DRUSUS == TRUE)
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_badboy_info()
{
	AI_Output (self, other, "Dia_Drusus_Badboy_00");	//Da bist du ja endlich! Hast du die Klaue mit?
	AI_Output (other, self, "Dia_Drusus_Badboy_01");	//Ja.
	AI_Output (self, other, "Dia_Drusus_Badboy_02");	//Dann kann das Ritual beginnen.
	AI_TurnAway (self, other);
	CreateInvItems (self, ItMw_BeliarWeapon_1H_01, 1);
	B_ClearBeliarsWeapon ();
	EquipItem (self, ItMw_BeliarWeapon_1H_01);
	AI_ReadyMeleeWeapon (self);
	AI_PlayAni (self, "T_MAGRUN_2_HEASHOOT");
	AI_Output (self, other, "Dia_Drusus_Badboy_03");	//BELIAR! BELIAR! ERHÖRE UNS!
	AI_Output (self, other, "Dia_Drusus_Badboy_04");	//LAGO MA SHI DAGO!
	AI_Output (self, other, "Dia_Drusus_Badboy_05");	//LAGO MA SHI DAGO!
	AI_PlayAni (self, "T_HEASHOOT_2_STAND");
	AI_Output (self, other, "Dia_Drusus_Badboy_06");	//Orks ! Tötet sie! Tötet die Menschen!
};


instance DIA_DRUSUS_BADBOY_END(C_Info)
{
	npc = vam_90108_drusus_nw;
	nr = 44;
	condition = dia_drusus_badboy_end_condition;
	information = dia_drusus_badboy_end_info;
	important = FALSE;
	permanent = FALSE;
	description = "Beliar!";
};


func int dia_drusus_badboy_end_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_badboy))
	{
		return TRUE;
	};
};

func void dia_drusus_badboy_end_info()
{
	Wld_PlayEffect ("spellFX_BELIARSRAGE", self, self, 0, 0, 0, FALSE);
	AI_Output (other, self, "Dia_Drusus_Badboy_end_00");	//Beliar!
	AI_StopProcessInfos (self);
	SC_IST_EIN_VAMPIR = FALSE;
	Wld_PlayEffect ("SLEEP_BLEND3", hero, hero, 0, 0, 0, FALSE);
	AI_Teleport (hero, "GAMMELPLATZNW01");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_BELIAR_EXTRO(C_Info)
{
	npc = pub_55101_gam;
	nr = 44;
	condition = dia_drusus_extro_condition;
	information = dia_drusus_extro_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_drusus_extro_condition()
{
	return TRUE;
};

func void dia_drusus_extro_info()
{
	AI_Output (self, other, "Dia_BELIAR_Extro_00");	//IHR HABT ES VOLLBRACHT!
	AI_Output (self, other, "Dia_BELIAR_Extro_01");	//INNOS TRUPPEN SIND SO GUT WIE BESIEGT!
	AI_Output (self, other, "Dia_BELIAR_Extro_02");	//IHR SEID WÜRDIGE DIENER! ICH WERDE EUCH REICH ENTLOHNEN, DENN DER SIEG IST UNSER!
	AI_Output (self, other, "Dia_BELIAR_Extro_03");	//UND DU, ERWÄHLTER INNOS:
	AI_Output (self, other, "Dia_BELIAR_Extro_04");	//DU HAST DICH FÜR DEN RICHTIGEN GOTT ENTSCHIEDEN.
	AI_Output (self, other, "Dia_BELIAR_Extro_05");	//DU BIST NUN MEINE RECHTE HAND!
	AI_Output (self, other, "Dia_BELIAR_Extro_06");	//WIR HABEN NOCH VIEL VOR UNS!
	BADDEND = TRUE;
	Info_AddChoice (dia_beliar_extro, "Ende", dia_drusus_extro_info_end);
};

func void dia_drusus_extro_info_end()
{
	AI_StopProcessInfos (self);
	B_Extro_Avi ();
};


instance DIA_DRUSUS_TEACH1(C_Info)
{
	npc = vam_90102_drusus;
	nr = 995;
	condition = dia_drusus_teach1_condition;
	information = dia_drusus_teach1_info;
	important = FALSE;
	permanent = FALSE;
	description = "Kannst du mir was beibringen?";
};


func int dia_drusus_teach1_condition()
{
	if (Npc_KnowsInfo (other, dia_drusus_aufnaheme))
	&& (SC_IST_EIN_VAMPIR == TRUE)
	{
		return TRUE;
	};
};

func void dia_drusus_teach1_info()
{
	AI_Output (other, self, "Dia_Drusus_teach_00");	//Kannst du mir was beibringen?
	AI_Output (self, other, "Dia_Drusus_teach_01");	//Ich kann dir etwas dunkle Magie beibringen, wenn du willst.
};


instance DIA_DRUSUS_CIRCLE1(C_Info)
{
	npc = vam_90102_drusus;
	nr = 995;
	condition = dia_drusus_circle1_condition;
	information = dia_drusus_circle1_info;
	permanent = TRUE;
	description = "Lehre mich den ersten Kreis der Magie.";
};


func int dia_drusus_circle1_condition()
{
	if (Npc_KnowsInfo (hero, dia_drusus_teach1) && (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_drusus_circle1_info()
{
	AI_Output (other, self, "DIA_drusus_TECH_CIRCLE1_15_00");	//Lehre mich den ersten Kreis der Magie.
	if (B_TeachMagicCircle (self, other, 1))
	{
		AI_Output (self, other, "DIA_drusus_TECH_CIRCLE1_05_01");	//Der erste Kreis erlaubt dir einfache Runen anzuwenden.
		AI_Output (self, other, "DIA_drusus_TECH_CIRCLE1_05_02");	//Du kannst mit Beliars Kraft und dem Wissen um die Zauber deine eigenen Runen herstellen.
		AI_Output (self, other, "DIA_drusus_TECH_CIRCLE1_05_03");	//Ich kann dir einige Zauber beibringen.
	};
};


instance DIA_DRUSUS_CIRCLE2(C_Info)
{
	npc = vam_90102_drusus;
	nr = 994;
	condition = dia_drusus_circle2_condition;
	information = dia_drusus_circle2_info;
	permanent = TRUE;
	description = "Lehre mich den zweiten Kreis der Magie.";
};


func int dia_drusus_circle2_condition()
{
	if (Npc_KnowsInfo (hero, dia_drusus_teach1) && (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_drusus_circle2_info()
{
	AI_Output (other, self, "DIA_drusus_TECH_circle2_15_00");	//Lehre mich den zweiten Kreis der Magie.
	if (B_TeachMagicCircle (self, other, 2))
	{
		AI_Output (self, other, "DIA_drusus_TECH_circle2_05_01");	//Nun kannst du mächtigere Zauber anwenden.
		AI_Output (self, other, "DIA_drusus_TECH_circle2_05_02");	//Forme die Welt nach deinem Willen.
	};
};


instance DIA_DRUSUS_CIRCLE3(C_Info)
{
	npc = vam_90102_drusus;
	nr = 993;
	condition = dia_drusus_circle3_condition;
	information = dia_drusus_circle3_info;
	permanent = TRUE;
	description = "Lehre mich den dritten Kreis der Magie.";
};


func int dia_drusus_circle3_condition()
{
	if (Npc_KnowsInfo (hero, dia_drusus_teach1) && (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_drusus_circle3_info()
{
	AI_Output (other, self, "DIA_drusus_TECH_circle3_15_00");	//Lehre mich den dritten Kreis der Magie.
	if (B_TeachMagicCircle (self, other, 3))
	{
		AI_Output (self, other, "DIA_drusus_TECH_circle3_05_01");	//Du bist nun im dritten Kreis.
		AI_Output (self, other, "DIA_drusus_TECH_circle3_05_02");	//Entfessel deinen Zorn. Die Magie wird dir helfen.
		AI_Output (self, other, "DIA_drusus_TECH_circle3_05_03");	//Mehr kann ich dir leider nicht beibringen.
	};
};


instance DIA_DRUSUS_TEACH(C_Info)
{
	npc = vam_90102_drusus;
	nr = 991;
	condition = dia_drusus_teach_condition;
	information = dia_drusus_teach_info;
	permanent = TRUE;
	description = "Unterweise mich! (Runen erschaffen)";
};


func int dia_drusus_teach_condition()
{
	if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1)
	{
		return TRUE;
	};
};

func void dia_drusus_teach_info()
{
	var int abletolearn444;
	abletolearn444 = 0;
	AI_Output (other, self, "DIA_drusus_TEACH_15_00");	//Unterweise mich!
	Info_ClearChoices (dia_drusus_teach);
	Info_AddChoice (dia_drusus_teach, Dialog_Back, dia_drusus_teach_back);
	if ((Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE))
	{
		Info_AddChoice (dia_drusus_teach, B_BuildLearnString (NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)), dia_drusus_teach_sumgobl);
		abletolearn444 = abletolearn444 + 1;
	};
	if ((Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE))
	{
		Info_AddChoice (dia_drusus_teach, B_BuildLearnString (NAME_SPL_WINDFIST, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_WindFist)), dia_drusus_teach_windfist);
		abletolearn444 = abletolearn444 + 1;
	};
	if ((Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE))
	{
		Info_AddChoice (dia_drusus_teach, B_BuildLearnString (NAME_SPL_Sleep, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Sleep)), dia_drusus_teach_sleep);
		abletolearn444 = abletolearn444 + 1;
	};
	if ((Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE))
	{
		Info_AddChoice (dia_drusus_teach, B_BuildLearnString (NAME_SPL_SummonSkeleton, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_SummonSkeleton)), dia_drusus_teach_summonskeleton);
		abletolearn444 = abletolearn444 + 1;
	};
	if ((Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE))
	{
		Info_AddChoice (dia_drusus_teach, B_BuildLearnString (NAME_SPL_ChargeZap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ChargeZap)), dia_drusus_teach_thunderball);
		abletolearn444 = abletolearn444 + 1;
	};
	if ((Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Zap] == FALSE))
	{
		Info_AddChoice (dia_drusus_teach, B_BuildLearnString (NAME_SPL_Zap, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_Zap)), dia_drusus_teach_zap);
		abletolearn444 = abletolearn444 + 1;
	};
	if (abletolearn444 < 1)
	{
		AI_Output (self, other, "DIA_drusus_TEACH_05_01");	//Ich kann dir zurzeit keine weiteren Formeln beibringen.
	};
};

func void dia_drusus_teach_back()
{
	Info_ClearChoices (dia_drusus_teach);
};

func void dia_drusus_teach_sumgobl()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonGoblinSkeleton);
};

func void dia_drusus_teach_windfist()
{
	B_TeachPlayerTalentRunes (self, other, SPL_WindFist);
};

func void dia_drusus_teach_sleep()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Sleep);
};

func void dia_drusus_teach_summonskeleton()
{
	B_TeachPlayerTalentRunes (self, other, SPL_SummonSkeleton);
};

func void dia_drusus_teach_thunderball()
{
	B_TeachPlayerTalentRunes (self, other, SPL_ChargeZap);
};

func void dia_drusus_teach_zap()
{
	B_TeachPlayerTalentRunes (self, other, SPL_Zap);
};

