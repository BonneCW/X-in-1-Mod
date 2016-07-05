INSTANCE DIA_Vlk_6021_aeron_Exit (C_Info)
{
    npc         = Vlk_6021_aeron;
    nr          = 999;
    condition   = DIA_Vlk_6021_aeron_Exit_condition;
    information = DIA_Vlk_6021_aeron_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = DIALOG_ENDE;
};
FUNC INT DIA_Vlk_6021_aeron_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_Vlk_6021_aeron_Exit_info ()
{
    AI_StopProcessInfos(self);
};


INSTANCE DIA_Vlk_6021_aeron_hiduei (C_Info)
{
	npc		= VLK_6021_aeron;
	nr		= 2;
	condition	= DIA_VLK_6021_aeron_hiduei_condition;
	information	= DIA_Vlk_6021_aeron_hiduei_info;
	permanent	= 0;
	important	= 1;
};
FUNC INT DIA_Vlk_6021_aeron_hiduei_condition ()
{
	if (hero.guild == GIL_STRF)  
	&& (Npc_KnowsInfo (hero,DIA_Vlk_6020_Oviedo_uriziel))  
	{
    		return 1;
	};
};
FUNC VOID DIA_Vlk_6021_aeron_hiduei_info ()
{
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_00"); //Ah, gut dass du kommst, ich habe dich schon erwartet.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_01"); //Wie das?
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_02"); //Reton ließ uns von der Gilde schon wissen, dass du dich auf den Weg hierher machen würdest.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_03"); //Wir sollen dich so gut wie möglich bei deinen Aufgaben unterstützen.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_04"); //Gut. Was tust du hier?
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_05"); //Ich bin ein Aufklärer. Eigentlich waren wir in einer Gruppe unterwegs, ich und zwei Krieger.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_06"); //Doch anscheinend bin ich der einzige, der noch am Leben ist ...
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_07"); //Wie das?
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_08"); //Nun, unsere Aufgabe bestand darin, das legendäre Uriziel zu finden.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_09"); //Reton hat dich schon damals, als es die Kuppel noch gab, beobachtet.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_10"); //Selbstverständlich hatte er damals weniger Möglichkeiten als heute, aber konnte wenigstens in Erfahrung bringen, dass du ein magisches Schwert geborgen hast.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_11"); //Das ließ sich kaum verbergen, nach deinem Auftritt bei den Wassermagier ...
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_12"); //Das war notwendig, der Plan der Wassermagier ...
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_13"); //... ist jetzt auch belanglos. Die Barriere ist zerstört und wir sind frei.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_14"); //Habt ihr das Schwert finden können?
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_15"); //Ich konnte eine Gruppe Orks ausmachen, die das Schwert aus einer Höhle bargen, kurz bevor sie den Eingang verschütteten.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_16"); //Warum sie dies taten, ist mir bis heute ein Rätsel.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_17"); //Es gab gewisse Gründe, die dafür sprachen ...
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_18"); //Ist das so? Nun gut, es soll mich nicht weiter interessieren.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_19"); //Jedenfalls erstattete ich dem Rest der Gruppe Bericht. Mit der kleinen Gruppe wären sie locker fertig geworden.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_20"); //Doch als sie angriffen, erschienen einige Schamanen wie aus dem Nichts.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_21"); //Ich musste mich in Sicherheit bringen, doch ich fürchte, dass die anderen es nicht geschafft haben.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_22"); //Warum hast du ihnen nicht geholfen?
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_23"); //Ich bin ein Aufklärer, kein Krieger.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_24"); //Das Kämpfen überlasse ich anderen.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_hiduei_15_25"); //Das ist auch ein Standpunkt ...
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_26"); //Werd nicht frech, Freundchen!
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_hiduei_07_27"); //Sieh dich lieber im alten Orkfdorf um, ob du irgendetwas findest, was und weiterhilft.

	B_LogEntry (TOPIC_uriziel, "Anscheinend hat sich mein Aufenthalt im Minental schon herumgesprochen. Ich habe vor dem alten Dorf der Orks einen Aufklärer getroffen, der mir etwas von Uriziel erzählt hat. Ich sollte mich in der Stadt umsehen.");
 
	Wld_InsertNpc (OrcShaman_Aeron,	"UL_ORC");	
};

INSTANCE DIA_Vlk_6021_aeron_OrcScroll (C_Info)
{
	npc		= VLK_6021_aeron;
	nr		= 2;
	condition	= DIA_VLK_6021_aeron_OrcScroll_condition;
	information	= DIA_Vlk_6021_aeron_OrcScroll_info;
	permanent	= 0;
	important	= 1;
};
FUNC INT DIA_Vlk_6021_aeron_OrcScroll_condition ()
{
	if (Npc_KnowsInfo (hero, DIA_Vlk_6021_aeron_hiduei))
	&& (Npc_HasItems(hero, ItSc_TeleportOT_Fake) == 1)
	{
    		return 1;
	};
};
FUNC VOID DIA_Vlk_6021_aeron_OrcScroll_info ()
{
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_00"); //Und?
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_OrcScroll_15_01"); //Außer einem Orkschamanen war niemand mehr am Leben. Er griff mich an, schien aber keine Magie mehr wirken zu können.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_02"); //Das ist seltsam. Vielleicht hat sich bei dem Kampf so sehr verausgabt, dass er nicht mehr genug Kraft für seine Zauber hatte.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_03"); //Hast du irgendwelche Hinweise auf das Schwert finden können?
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_OrcScroll_15_04"); //Der Ork hatte diese Schriftrolle bei sich.

	B_GiveInvItems	(hero, self, ItSc_TeleportOT_Fake, 1);

	B_UseFakeScroll	();

	B_GiveInvItems	(self, hero, ItSc_TeleportOT, 1);

	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_05"); //Das sieht nach einem Teleportzauber aus. Die Orks benutzen sie manchmal.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_06"); //Allerdings nur sehr selten, da die Herstellung sie anscheinend viel Kraft kostet.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_07"); //Das bedeutet, dass sie um die Bedeutung des Schwertes wussten.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_08"); //Das würde auch das blaue Licht erklären, welches ich nach meiner Flucht in der Dämmerung wahrnehmen konnte.
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_OrcScroll_15_09"); //Ein Teleportzauber.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_10"); //Richtig. Du solltest ihn einsetzen, um zu sehen, wohin sie das Schwert gebracht haben.
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_11"); //Doch bedenke, dass wir nur diese eine Rolle, also auch nur diese eine Chance haben, das Schwert zu finden!
	AI_Output(self, hero, "DIA_Vlk_6021_aeron_OrcScroll_07_12"); //Außerdem solltest du einen anderen Teleportzauber bei dir haben, nur die Götter wissen, wohin die Orks das Schwert bringen ...
	AI_Output(hero, self, "DIA_Vlk_6021_aeron_OrcScroll_15_13"); //Ich werde mich darum kümmern.

	B_LogEntry (TOPIC_uriziel, "Die Schriftrolle war anscheinend ein Teleportzauber. Bevor ich den anderen Orks folge, sollte ich mich gut ausrüsten und einen anderen Teleportzauber mitnehmen, da mir wohl niemand sagen kann, wohin der Zauber mich führt ... Außerdem ist dies die einzige Schriftrolle, ich sollte also gut auf sie acht geben.");	
};

INSTANCE DIA_Vlk_6021_aeron_habu (C_Info)
{
	npc		= VLK_6021_aeron;
	nr		= 2;
	condition	= DIA_VLK_6021_aeron_habu_condition;
	information	= DIA_Vlk_6021_aeron_habu_info;
	permanent	= 0;
	important	= 1;
};

FUNC INT DIA_Vlk_6021_aeron_habu_condition ()
{
	if (Npc_HasItems(hero, itmw_uriziel_u))        
	{
		return TRUE;
	};
};

FUNC VOID DIA_Vlk_6021_aeron_habu_info ()
{
	AI_Output(self,hero,"DIA_Vlk_6021_aeron_habu_07_00"); //Und?
	AI_Output(hero,self,"DIA_Vlk_6021_aeron_habu_15_01"); //Ich konnte das Schwert bergen. Der Zauber führte mich tatsächlich in eine versteckte Höhle, wo sich die Orks aufhielten.
	AI_Output(self,hero,"DIA_Vlk_6021_aeron_habu_07_02"); //Dann war ja doch nicht alles umsonst ...
	AI_Output(hero,self,"DIA_Vlk_6021_aeron_habu_15_03"); //Du solltest zusehen, dass du hier verschwindest.
	AI_Output(hero,self,"DIA_Vlk_6021_aeron_habu_15_04"); //Die Orks werden mit Sicherheit nicht weniger und gerade hier, bei der Schürfstelle, könnte es sehr gefährlich werden.
	AI_Output(self,hero,"DIA_Vlk_6021_aeron_habu_07_05"); //Du hast recht. Ich werde mich noch ein wenig im Dorf der Orks umsehen und mich dann auf den Weg in die Burg machen.
	AI_Output(self,hero,"DIA_Vlk_6021_aeron_habu_07_06"); //Bis dann, und danke, dass du mir Bescheid gegeben hast.
	AI_Output(hero,self,"DIA_Vlk_6021_aeron_habu_15_07"); //Lass dich nicht fressen.

	Log_SetTopicStatus(TOPIC_uriziel, LOG_SUCCESS);

	B_GivePlayerXP	(300);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BURG");
};
