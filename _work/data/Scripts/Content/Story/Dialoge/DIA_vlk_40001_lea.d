
instance DIA_LEA_EXIT(C_Info)
{
	npc = vlk_40001_lea;
	nr = 999;
	condition = dia_lea_exit_condition;
	information = dia_lea_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lea_exit_condition()
{
	return TRUE;
};

func void dia_lea_exit_info()
{
	AI_StopProcessInfos (self);
};


instance DIA_LEA_HALLO(C_Info)
{
	npc = vlk_40001_lea;
	nr = 990;
	condition = dia_lea_hallo_condition;
	information = dia_lea_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lea_hallo_condition()
{
	if (SC_Ist_Ein_Vampir == TRUE)
	{
		return TRUE;
	};
};

func void dia_lea_hallo_info()
{
	AI_Output (self, other, "Dia_Lea_hallo_00");	//Hallo! Ich bin Lea. Wie ich sehe bist du wohl neu hier!
	AI_Output (other, self, "Dia_Lea_hallo_01");	//Das kann man wohl sagen!
	AI_Output (self, other, "Dia_Lea_hallo_02");	//Khorinis ist mit der Zeit völlig verkommen.
	AI_Output (self, other, "Dia_Lea_hallo_03");	//Es herrscht Armut. Selbst ich bin nicht verschohnt geblieben.
	AI_Output (other, self, "Dia_Lea_hallo_04");	//Wie meinst du das?
	AI_Output (self, other, "Dia_Lea_hallo_05");	//Ich musste bei Lehmar meine wertvolle Halskette pfänden, nur um mir etwas zum Essen kaufen zu können!
	AI_Output (other, self, "Dia_Lea_hallo_06");	//Und warum erzählst du mir das Ganze?
	AI_Output (self, other, "Dia_Lea_hallo_07");	//Weil du mir die Kette zurückholen kannst!
	Info_AddChoice (dia_lea_hallo, "Dann mach ich mich auf den Weg!", dia_lea_hallo_ok);
	Info_AddChoice (dia_lea_hallo, "Warum sollte ich das tun?", dia_lea_hallo_why);
};

func void dia_lea_hallo_why()
{
	Info_ClearChoices (dia_lea_hallo);
	AI_Output (other, self, "Dia_Lea_hallo_08");	//Warum sollte ich das tun?
	AI_Output (self, other, "Dia_Lea_hallo_09");	//Hast du kein Mitleid mit einer armen Frau?
	AI_Output (other, self, "Dia_Lea_hallo_10");	//Na gut, wo und was soll ich machen?
	AI_Output (self, other, "Dia_Lea_hallo_11");	//Stehl einfach meine Kette aus Lehmars Haus und bring sie mir!
	AI_StopProcessInfos (self);
	Log_CreateTopic (LEAS_KETTE, LOG_MISSION);
	Log_SetTopicStatus (LEAS_KETTE, LOG_Running);
	B_LogEntry (LEAS_KETTE, "Lea will von mir, dass ich ihr ihre Kette zurückhole. Die Kette ist bei Lehmar");
};

func void dia_lea_hallo_ok()
{
	Info_ClearChoices (dia_lea_hallo);
	AI_Output (other, self, "Dia_Lea_hallo_ok_01");	//Dann mach ich mich auf den Weg!
	AI_Output (self, other, "Dia_Lea_hallo_ok_02");	//Pass auf dich auf!
	AI_StopProcessInfos (self);
	Log_CreateTopic (LEAS_KETTE, LOG_MISSION);
	Log_SetTopicStatus (LEAS_KETTE, LOG_Running);
	B_LogEntry (LEAS_KETTE, "Lea will von mir, dass ich ihr ihre Kette zurückhole. Die Kette ist in bei Lehmar");
};


instance DIA_LEA_AUFGABE2(C_Info)
{
	npc = vlk_40001_lea;
	nr = 980;
	condition = dia_lea_aufgabe2_condition;
	information = dia_lea_aufgabe2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe deine Kette.";
};


func int dia_lea_aufgabe2_condition()
{
	if ((Npc_HasItems (other, itmi_goldlea) >= 1) && Npc_KnowsInfo (other, dia_lea_hallo))
	{
		return TRUE;
	};
};

func void dia_lea_aufgabe2_info()
{
	AI_Output (other, self, "Dia_Lea_Aufgabe2_00");	//Ich habe deine Kette, hier!
	B_GiveInvItems (other, self, itmi_goldlea, 1);
	AI_Output (self, other, "Dia_Lea_Aufgabe2_01");	//Das hast du gut gemacht!
	AI_Output (self, other, "Dia_Lea_Aufgabe2_02");	//Du musst nur noch eine Aufgabe bestehen, um uns deine Loyalität zu beweisen.
	AI_Output (other, self, "Dia_Lea_Aufgabe2_03");	//Was? Das ganze war ein Test?
	AI_Output (self, other, "Dia_Lea_Aufgabe2_04");	//Ja, aber wenn du die zweite Aufgabe bestehst, wirst du sehen, dass es sich gelohnt hat.
	AI_Output (other, self, "Dia_Lea_Aufgabe2_05");	//Was ist die zweite Aufgabe?
	AI_Output (self, other, "Dia_Lea_Aufgabe2_06");	//Gut, hör genau zu:
	AI_Output (self, other, "Dia_Lea_Aufgabe2_07");	//Nahe der Ausgrabungsstätte ist eine Brücke und darunter eine Höhle, in der sich ein magischer Schädel befindet.
	AI_Output (self, other, "Dia_Lea_Aufgabe2_08");	//Bring mir diesen Schädel und du kannst zu unserem Anführer.
	AI_Output (other, self, "Dia_Lea_Aufgabe2_09");	//Hört sich einfach an!
	AI_Output (self, other, "Dia_Lea_Aufgabe2_11");	//Nicht ganz.
	AI_Output (self, other, "Dia_Lea_Aufgabe2_12");	//Es gibt da einen kleinen Haken.
	AI_Output (other, self, "Dia_Lea_Aufgabe2_13");	//Was?
	AI_Output (self, other, "Dia_Lea_Aufgabe2_14");	//In der Höhle lebt ein Schattenläufer.
	AI_Output (other, self, "Dia_Lea_Aufgabe2_15");	//Der zerfetzt mich doch!
	AI_Output (self, other, "Dia_Lea_Aufgabe2_16");	//Dir wird sicher etwas gescheites einfallen.
	AI_Output (other, self, "Dia_Lea_Aufgabe2_17");	//Na gut!
	AI_StopProcessInfos (self);
	Log_CreateTopic (MAGIC_SKULL, LOG_MISSION);
	Log_SetTopicStatus (MAGIC_SKULL, LOG_Running);
	B_LogEntry (MAGIC_SKULL, "In der Nähe der Ausgrabungsstätte ist eine Brücke und darunter Höhle, in der ein Schädel liegt, den ich Lea bringen muss. Doch er wird von einem Schattenläufer bewacht. Ich muss mir etwas einfallen lassen.");
	Log_SetTopicStatus (LEAS_KETTE, LOG_SUCCESS);
	B_GivePlayerXP (100);
	Npc_ExchangeRoutine (self, "Latsch");
};


instance DIA_LEA_SCHAEDEL(C_Info)
{
	npc = vlk_40001_lea;
	nr = 150;
	condition = dia_lea_schaedel_condition;
	information = dia_lea_schaedel_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Schädel!";
};


func int dia_lea_schaedel_condition()
{
	if ((Npc_HasItems (other, itmi_skullgold) >= 1) && Npc_KnowsInfo (other, dia_lea_aufgabe2))
	{
		return TRUE;
	};
};

func void dia_lea_schaedel_info()
{
	AI_Output (other, self, "Dia_Lea_Schaedel_00");	//Ich habe den Schädel!
	AI_Output (self, other, "Dia_Lea_Schaedel_01");	//Gut! Du bist ein fähiger Vampir!
	AI_Output (other, self, "Dia_Lea_Schaedel_02");	//Was? Woher..
	AI_Output (self, other, "Dia_Lea_Schaedel_03");	//Keine Sorge, Vampire können sich gegenseitig spüren. Du musst noch vieles lernen, du bist neu.
	B_GivePlayerXP (200);
	B_GiveInvItems (other, self, itmi_skullgold, 1);
	Info_ClearChoices (dia_lea_schaedel);
	Info_AddChoice (dia_lea_schaedel, "Kann ich jetzt zu eurem Chef?", dia_lea_schaedel_chef);
	Info_AddChoice (dia_lea_schaedel, "Hat mich einer von euch zum Vampir gemacht?", dia_lea_schaedel_vampir);
};

func void dia_lea_schaedel_chef()
{
	AI_Output (other, self, "Dia_Lea_Schaedel_Chef_00");	//Kann ich nun zu euren Chef?
	AI_Output (self, other, "Dia_Lea_Schaedel_Chef_01");	//Ja, er heißt Ardoc Kahr und du findest ihn im oberen Viertel.
	AI_Output (self, other, "Dia_Lea_Schaedel_Chef_08");	//Du gehst einfach an der großen Skulptur rechts vorbei in das Haus.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "Dia_Lea_Schaedel_wie_00");	//Aber wie komm ich ins obere Viertel?
		AI_Output (self, other, "Dia_Lea_Schaedel_wie_01");	//Du musst eigentlich Bürger sein, aber Ardoc hat Einfluss...
		CreateInvItems (self, itwr_passardoc, 1);
		B_GiveInvItems (self, other, itwr_passardoc, 1);
		AI_Output (self, other, "Dia_Lea_Schaedel_wie_02");	//Hier, nimm dieses Schriftstück, es sollte dich zu ihm durchlassen.
	};
	AI_Output (self, other, "Dia_Lea_Schaedel_Rune_00");	//Warte! Hier nimm diese Runen!
	CreateInvItems (self, itru_vlight, 1);
	B_GiveInvItems (self, other, itru_vlight, 1);
	CreateInvItems (self, itru_transwolf, 1);
	B_GiveInvItems (self, other, itru_transwolf, 1);
	B_GiveInvItems (self, other, itru_follow, 1);
	AI_Output (self, other, "Dia_Lea_Schaedel_Rune_01");	//Das sind spezielle Vampirrunen, die nur Vampire benutzen können.
	AI_Output (self, other, "Dia_Lea_Schaedel_Rune_02");	//Sie erweitern unsere Kräfte und Fähigkeiten.
	AI_Output (other, self, "Dia_Lea_Schaedel_Rune_03");	//Danke!
	Info_ClearChoices (dia_lea_schaedel);
	AI_StopProcessInfos (self);
	Log_SetTopicStatus (MAGIC_SKULL, LOG_SUCCESS);
};

func void dia_lea_schaedel_vampir()
{
	AI_Output (other, self, "Dia_Lea_Schaedel_Vampir_00");	//Hat mich einer von euch zum Vampir gemacht?
	AI_Output (self, other, "Dia_Lea_Schaedel_Vampir_01");	//Nein, wir machen keine neuen Vampire. Khorinis ist ohnehin klein und kann uns gerade noch mit Blut versorgen.
	AI_Output (self, other, "Dia_Lea_Schaedel_Vampir_02");	//Aber es stellt sich immernoch die Frage wer das gewesen ist. Wie sah er aus?
	AI_Output (other, self, "Dia_Lea_Schaedel_Vampir_03");	//Er war vermummt und trug einen Umhang.
	AI_Output (self, other, "Dia_Lea_Schaedel_Vampir_04");	//Merkwürdig, vielleicht kann dir Ardoc weiterhelfen.
	dia_lea_schaedel_chef ();
};


instance DIA_LEA_FUNZT_NET(C_Info)
{
	npc = vlk_40001_lea;
	nr = 201;
	condition = dia_lea_funzt_net_condition;
	information = dia_lea_funzt_net_info;
	important = FALSE;
	permanent = FALSE;
	description = "Die Wache lehnt den Passierschein ab!";
};


func int dia_lea_funzt_net_condition()
{
	if (ZETTEL05 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lea_funzt_net_info()
{
	AI_Output (other, self, "Dia_Lea_funzt_net_00");	//Die Wache lehnt den Passierschein ab!
	AI_Output (self, other, "Dia_Lea_funzt_net_01");	//Seltsam, aber da kann wohl nichts machen.
	AI_Output (self, other, "Dia_Lea_funzt_net_02");	//Versuche Bürger zu werden. Dies sollte nicht allzu schwer sein.
	B_GivePlayerXP (20);
	AI_StopProcessInfos (self);
};


instance DIA_LEA_BRUDER(C_Info)
{
	npc = vlk_40001_lea;
	nr = 800;
	condition = dia_lea_bruder_condition;
	information = dia_lea_bruder_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ardoc hat mir eine Frage wegen seinem Bruder gestellt...";
};


func int dia_lea_bruder_condition()
{
	if ((BROTHERSDEATH == TRUE) && (VAMPIRGILDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lea_bruder_info()
{
	AI_Output (other, self, "Dia_Lea_Bruder_00");	//Ardoc hat mir eine Frage wegen seinem Bruder gestellt...
	AI_Output (self, other, "Dia_Lea_Bruder_01");	//Dann bist du gerade bei der Frageprüfung!
	AI_Output (other, self, "Dia_Lea_Bruder_02");	//Aber ich hab keinen Schimmer, wie ich herausbekomme, wann er gestorben ist!
	AI_Output (self, other, "Dia_Lea_Bruder_03");	//Ich geb dir mal einen Tipp: Sein Bruder hat den selben Nachnamen, wie Ardoc!
};

