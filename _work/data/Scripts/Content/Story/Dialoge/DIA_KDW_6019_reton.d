INSTANCE DIA_kdw_6019_reton_Exit (C_Info)
{
	npc         = kdw_6019_reton;
	nr          = 999;
	condition   = DIA_kdw_6019_reton_Exit_condition;
	information = DIA_kdw_6019_reton_Exit_info;
	permanent   = TRUE;
	important   = FALSE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_kdw_6019_reton_Exit_condition ()
{
	return TRUE;
};

FUNC VOID DIA_kdw_6019_reton_EXIT_info ()
{
	AI_StopProcessInfos(self);
};

INSTANCE DIA_kdw_6019_reton_hiduei (C_Info)
{
	npc         = kdw_6019_reton;
	nr          = 2;
	condition   = DIA_kdw_6019_reton_hiduei_condition;
	information = DIA_kdw_6019_reton_hiduei_info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_kdw_6019_reton_hiduei_condition ()
{
	return TRUE;
};

FUNC VOID DIA_kdw_6019_reton_hiduei_info ()
{
	AI_Output(self,hero,"DIA_kdw_6019_reton_hiduei_15_0"); //Na endlich kommst du.
	AI_Output(hero,self,"DIA_kdw_6019_reton_hiduei_15_1"); //Wer bist du überhaupt? Und wieso schickst du jemanden zu Xardas Turm, der mich zu dir schickt?
	AI_Output(self,hero,"DIA_kdw_6019_reton_hiduei_15_2"); //Wahrscheinlich weisst du es nicht, aber ich kenne dich!
	AI_Output(self,hero,"DIA_kdw_6019_reton_hiduei_15_3"); //Ich habe im Minental gesehen, was du geleistet hast. Als das alte Lager dich verbannt hat, war ich ein Schatten.
	AI_Output(hero,self,"DIA_kdw_6019_reton_hiduei_15_4"); //Aha, und was willst du von mir?
	AI_Output(self,hero,"DIA_kdw_6019_reton_hiduei_15_5"); //Dich in meine Gilde aufnehmen!
	Npc_ExchangeRoutine (self, "START"); 

	B_LogEntry (TOPIC_reton,"Ich habe Reton gefunden. Er ist der Anführer einer Gilde und will mich unbedingt aufnehmen.");
	MIS_reton = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_reton, LOG_SUCCESS);
	B_CheckLog();
	B_GivePlayerXP (500);
};

INSTANCE DIA_kdw_6019_reton_whid (C_Info)
{
	npc         = kdw_6019_reton;
    nr          = 3;
    condition   = DIA_kdw_6019_reton_whid_condition;
    information = DIA_kdw_6019_reton_whid_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Was habe ich davon, wenn ich mich deiner Gilde anschließe?";
};

FUNC INT DIA_kdw_6019_reton_whid_condition ()
{
    return TRUE;
};
FUNC VOID DIA_kdw_6019_reton_whid_info ()
{
    AI_Output(hero,self,"DIA_kdw_6019_reton_whid_15_0"); //Was habe ich davon, wenn ich mich deiner Gilde anschließe?
    AI_Output(self,hero,"DIA_kdw_6019_reton_whid_15_1"); //Du würdest natürlich sofort mein Stellvertreter, Nachfolger und 1. Offizier. Nach deinen Taten kann ich dir unmöglich einen niedrigeren Posten anbieten.
    AI_Output(self,hero,"DIA_kdw_6019_reton_whid_15_2"); //Dem entsprechend würdest du natürlich auch einen hohen Sold erhalten.
};

INSTANCE DIA_kdw_6019_reton_w (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 4;
    condition   = DIA_kdw_6019_reton_w_condition;
    information = DIA_kdw_6019_reton_w_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Erzähl mir etwas über die Gilde.";
};
FUNC INT DIA_kdw_6019_reton_w_condition ()
{
if  Npc_KnowsInfo (hero, DIA_kdw_6019_reton_whid)
{
    return TRUE;
};
};
FUNC VOID DIA_kdw_6019_reton_w_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_w_15_0"); //Erzähl mir etwas über die Gilde.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_1"); //Wir verdienen Geld, indem wir Mythril in einer kleinen Mine ganz in der Nähe schürfen. Die Magier machen aus Mythril Runensteine.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_2"); //Außerdem ist sich unser Schmied Nor sicher, dass er dadraus brauchbare Waffen herstellen kann.
	AI_Output(hero,self,"DIA_kdw_6019_reton_w_15_3"); //Wie will er das denn machen? Runensteine sind doch ganz porös und zerbrechlich.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_4"); //Nein, ich rede von dem Mythrilerz, aus dem die Runensteine gemacht werden. Nicht von Runensteinen.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_5"); //Mythrilerz ist ein weiches Metall. Wir wissen nur noch nicht, wie wir es härten können. Ausserdem ist es gefährlich, das Erz zum Glühen zu bringen.
	AI_Output(hero,self,"DIA_kdw_6019_reton_w_15_6"); //Wieso das denn?
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_7"); //Beim Erhitzen setzt das Erz eine enorme Menge magischer Energie frei. Diese entlädt sich dann meistens in Form von Feuerbällen oder anderen Zaubern. 
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_8"); //Unser letzter Schmied hat derart Panik bekommen, dass er weggerannt ist, als das das erste Mal passiert ist.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_9"); //Aber wir verdienen nicht nur durch unser Mythril Geld, sondern auch mit der Jagd. Akwyn ist ein sehr talentierter Jäger.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_10"); //Er hat auf dem kleinen Plateu hier ein Zelt aufgebaut und erlegt von da aus die Viecher die sich zu nah ans Lager trauen.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_11"); //Die Felle von den Dingern verkaufen wir dann bei Bosper in der Stadt.
	AI_Output(self,hero,"DIA_kdw_6019_reton_w_15_12"); //Wir brauchen nur noch ein paar Söldner mehr. Ich befürchte nämlich, dass bald die dicken Milizsoldaten vorbeikommen und unsere Felle und das erbeutete Fleisch mitnehmen.
};   

INSTANCE DIA_kdw_6019_reton_s (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 5;
    condition   = DIA_kdw_6019_reton_s_condition;
    information = DIA_kdw_6019_reton_s_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ihr braucht mehr Söldner?";
};

FUNC INT DIA_kdw_6019_reton_s_condition ()
{
if  Npc_KnowsInfo (hero, DIA_kdw_6019_reton_w)
{
    return TRUE;
};
};

FUNC VOID DIA_kdw_6019_reton_s_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_s_15_0"); //Ihr braucht mehr Söldner?
	AI_Output(self,hero,"DIA_kdw_6019_reton_s_15_1"); //Ja. Und zwar dringend. Kannst du dich vielleicht darum kümmern?
	AI_Output(hero,self,"DIA_kdw_6019_reton_s_15_2"); //Ich werd sehen, was ich tun kann.
	AI_Output(self,hero,"DIA_kdw_6019_reton_s_15_3"); //Das wird dann deine erste Aufnahmeprüfung. Wenn du drei bestehst, bist du aufgenommen.
	AI_Output(self,hero,"DIA_kdw_6019_reton_s_15_4");  //Ich glaube, ich habe im Tal zwischen der Stadt und dem Leuchtturm ein paar Ausgestoßene gesehen. Frag die mal.

	Log_CreateTopic (TOPIC_mehrs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_mehrs, LOG_RUNNING);
	B_LogEntry (TOPIC_mehrs,"Ich soll als erste von drei Aufnahmeprüfungen mehr Söldner für die Gilde beschaffen.");
	B_LogEntry (TOPIC_mehrs,"Reton meint, er habe im Tal zwischen der Stadt und dem Leuchtturm Ausgestossene gesehen. Vielleicht sollte ich die mal fragen...");
};

INSTANCE DIA_kdw_6019_reton_schwert (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_schwert_condition;
    information = DIA_kdw_6019_reton_schwert_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich bringe dir dein Schwert zurück.";
};
FUNC INT DIA_kdw_6019_reton_schwert_condition ()
{
if  Npc_KnowsInfo (hero, DIA_Vlk_6016_copper_waffe)
&& (Npc_HasItems (hero,ItMw_Retonsschwert) >= 1)
{
    return TRUE;
};
};
FUNC VOID DIA_kdw_6019_reton_schwert_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_schwert_15_0"); //Ich bringe dir dein Schwert zurück.
	AI_Output(self,hero,"DIA_kdw_6019_reton_schwert_15_1"); //Ah, danke. Ich hatte schon fast gedacht, Copper hätte vergessen es dir zu geben.

	B_GiveInvItems ( hero, self, ItMw_Retonsschwert, 1);

	B_LogEntry (TOPIC_retonschwert,"Ich habe Reton sein Schwert zurückgegeben.");

	MIS_retonschwert = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_retonschwert, LOG_SUCCESS);
	B_CheckLog();

	B_GivePlayerXP (500);
};

INSTANCE DIA_kdw_6019_reton_gilde (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_gilde_condition;
    information = DIA_kdw_6019_reton_gilde_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich habe noch drei Söldner gefunden.";
};

FUNC INT DIA_kdw_6019_reton_gilde_condition ()
{
if  Npc_KnowsInfo (hero,  DIA_vlk_6015_marvin_mgd)

{
    return TRUE;
};
};

FUNC VOID DIA_kdw_6019_reton_gilde_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_gilde_15_0"); //Ich habe drei Söldner gefunden, die sich der Gilde anschließen.
	AI_Output(self,hero,"DIA_kdw_6019_reton_gilde_15_1"); //Sehr gut. Als nächste Prüfung sollst du dieses Päckchen Mythril zu Pedro, dem Novizen vor dem Kloster, bringen.

	B_GiveInvItems (self, hero,  ItMi_MPacket, 1);
	B_GivePlayerXP (250);
	B_LogEntry (TOPIC_mehrs,"Als nächstes soll ich dem Novizen vor dem Kloster ein Päckchen mit Mythril geben.");
};

INSTANCE DIA_kdw_6019_reton_novipacketgegeben (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_novipacketgegeben_condition;
    information = DIA_kdw_6019_reton_novipacketgegeben_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich habe Pedro das Päckchen gegeben.";
};

FUNC INT DIA_kdw_6019_reton_novipacketgegeben_condition ()
{
if  (PTOPEDRO == TRUE)


{
    return TRUE;
};
};

FUNC VOID DIA_kdw_6019_reton_novipacketgegeben_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_novipacketgegeben_15_0"); //Ich habe Pedro das Päckchen gegeben.
	AI_Output(self,hero,"DIA_kdw_6019_reton_novipacketgegeben_15_1"); //Sehr Gut.
	AI_Output(self,hero,"DIA_kdw_6019_reton_novipacketgegeben_15_2"); //Als letzte Prüfung sollst du den Keiler in dem Tal, in dem du Marvin getroffen hast, erledigen.

	B_LogEntry (TOPIC_mehrs,"Als letzte Prüfung soll ich den Keiler in dem Tal, in dem ich Marvin getroffen hab, erledigen.");

	Wld_InsertNpc (retonsKeiler,"HL_N_03");

	B_GivePlayerXP (250);
};

INSTANCE DIA_kdw_6019_reton_keilertot (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_keilertot_condition;
    information = DIA_kdw_6019_reton_keilertot_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Der Keiler ist tot.";
};

FUNC INT DIA_kdw_6019_reton_keilertot_condition ()
{
if  Npc_KnowsInfo (hero, DIA_kdw_6019_reton_novipacketgegeben)
&&  Npc_IsDead(retonsKeiler) 

{
    return TRUE;
};
};

FUNC VOID DIA_kdw_6019_reton_keilertot_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_keilertot_15_0"); //Ich habe den Keiler getötet.
	AI_Output(self,hero,"DIA_kdw_6019_reton_keilertot_15_1"); //Sehr Gut. Dann steht deiner Aufnahme in die Gilde nun nichts mehr im Wege.

	B_LogEntry (TOPIC_mehrs,"Ich habe den Keiler getötet. Reton sagt, er kann mich jetzt in die Gilde aufnehmen.");
	MIS_mehrs = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_mehrs, LOG_SUCCESS);
	B_CheckLog();

	B_GivePlayerXP (500);
};

INSTANCE DIA_kdw_6019_reton_aufnehmen (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_aufnehmen_condition;
    information = DIA_kdw_6019_reton_aufnehmen_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Nimm mich in die Gilde auf.";
};

FUNC INT DIA_kdw_6019_reton_aufnehmen_condition ()
{
	if (Npc_KnowsInfo (hero, DIA_kdw_6019_reton_keilertot))
	&& (hero.guild == GIL_NONE)
	{
    		return TRUE;
	};
};

FUNC VOID DIA_kdw_6019_reton_aufnehmen_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_aufnehmen_15_0"); //Nimm mich in die Gilde auf.
	AI_Output(self,hero,"DIA_kdw_6019_reton_aufnehmen_15_1"); //Du hast deinen Wert bewiesen. Willkommen in der Gilde.

	B_GivePlayerXP (500);

	Npc_SetTrueGuild (hero, GIL_STRF);
	hero.guild	= GIL_STRF;
	Snd_Play ("LEVELUP");
};

INSTANCE DIA_kdw_6019_reton_wj (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_wj_condition;
    information = DIA_kdw_6019_reton_wj_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Was soll ich jetzt machen?";
};

FUNC INT DIA_kdw_6019_reton_wj_condition ()
{
if  Npc_KnowsInfo (hero, DIA_kdw_6019_reton_aufnehmen)

{
    return TRUE;
};
};

FUNC VOID DIA_kdw_6019_reton_wj_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_wj_15_0"); //Was soll ich jetzt machen?
	AI_Output(self,hero,"DIA_kdw_6019_reton_wj_15_1"); //Na zu Lord Hagen gehen.
	AI_Output(hero,self,"DIA_kdw_6019_reton_wj_15_2"); //Woher ...?
	AI_Output(self,hero,"DIA_kdw_6019_reton_wj_15_3"); //(lacht) Ich weiss mehr über dich, als du denkst. Aber wenn du ins Minental gehst, dann musst du auf jeden Fall die Erzversorgung lahm legen!
	AI_Output(hero,self,"DIA_kdw_6019_reton_wj_15_4"); //Wieso, in drei Götter Namen, soll ich das machen?
	AI_Output(self,hero,"DIA_kdw_6019_reton_wj_15_5"); //Weil der König dann auf unser Mythril angewiesen ist. Wir werden in Gold schwimmen!
	AI_Output(hero,self,"DIA_kdw_6019_reton_wj_15_6"); //Gut, aber wie soll ich das anstellen?
	AI_Output(self,hero,"DIA_kdw_6019_reton_wj_15_7"); //Zuerst machst du Garond weiss, dass die Schürfstellen zerstört sind. Dann redest du mit unserem Gesandten. Er wartet im Magierhaus auf dich.

	Log_CreateTopic (TOPIC_erzv, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_erzv, LOG_RUNNING);
	B_LogEntry (TOPIC_erzv,"Ich soll Garond weiss machen, dass die Schürfstellen zerstört sind. Danach soll ich mit dem Gesandten der Gilde im Magierhaus reden.");

	//Npc_ExchangeRoutine (self, "STEHRUM");

 	Npc_SetTrueGuild (hero, GIL_STRF);
	hero.guild	= GIL_STRF;
};

INSTANCE DIA_kdw_6019_reton_KapitelZwei (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_KapitelZwei_condition;
    information = DIA_kdw_6019_reton_KapitelZwei_info;
    permanent   = 0;
    important   = 1;
};

FUNC INT DIA_kdw_6019_reton_KapitelZwei_condition ()
{
	if (Npc_KnowsInfo (hero, DIA_kdw_6019_reton_aufnehmen))
	&& (Kapitel > 1)
	{
    		return TRUE;
	};
};

FUNC VOID DIA_kdw_6019_reton_KapitelZwei_info ()
{
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_00"); //Gut, dass du kommst, ich habe eine Aufgabe für dich.
	AI_Output(hero,self,"DIA_kdw_6019_reton_KapitelZwei_15_01"); //Worum geht es denn?
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_02"); //Vor dem Lager ist ein Späher der Orks gesehen worden.
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_03"); //Es wäre besser, wenn wir ihn los würden ...
	AI_Output(hero,self,"DIA_kdw_6019_reton_KapitelZwei_15_04"); //Warum sollten die Orks unser Lager ausspähen?
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_05"); //Es geht ihnen wohl eher darum, die Stadt auszukundschaften.
	AI_Output(hero,self,"DIA_kdw_6019_reton_KapitelZwei_15_06"); //Ist der Ork dann nicht eher eine Aufgabe der Stadtwache?
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_07"); //Glaubst du denn, die Orks marschieren einfach an uns vorbei, falls es zu einem Angriff auf die Stadt kommt?
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_08"); //Nein, wir müssen als Erste dran glauben, wenn es soweit ist.
	AI_Output(hero,self,"DIA_kdw_6019_reton_KapitelZwei_15_09"); //Verstehe. Wo ist dieser Ork jetzt?
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_10"); //Gehe vorne aus dem Lager und laufe den Weg einfach weiter geradeaus.
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_11"); //Nach einiger Zeit kommst du an einem Jäger vorbei. Dann musst du noch die Anhöhe hinauf und du hast einen wunderbaren Blick auf die Stadt.
	AI_Output(hero,self,"DIA_kdw_6019_reton_KapitelZwei_15_12"); //Dort solltest du den Späher finden.
	AI_Output(self,hero,"DIA_kdw_6019_reton_KapitelZwei_04_13"); //Ich werde mich darum kümmern.

	Log_CreateTopic (TOPIC_DGDH_ORCSCOUT, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DGDH_ORCSCOUT, LOG_RUNNING);
	B_LogEntry (TOPIC_DGDH_ORCSCOUT, "Ich soll für Reton einen Orkspäher töten. Er befindet sich auf der kleinen Anhöhe, die man erreicht, wenn man einfach den Weg vom Lager aus weiter geradeaus läuft.");

	Wld_InsertNpc	(OrcScout_Reton,	"FP_ROAM_ORCSCOUT_RETON_01");
};

INSTANCE DIA_kdw_6019_reton_OrcScoutDead (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_OrcScoutDead_condition;
    information = DIA_kdw_6019_reton_OrcScoutDead_info;
    permanent   = 0;
    important   = 0;
	description	= "Der Späher wird keinen Bericht mehr abliefern können.";
};

FUNC INT DIA_kdw_6019_reton_OrcScoutDead_condition ()
{
	if (Mod_DGDH_OrcScout == 1)
	{
    		return TRUE;
	};
};

FUNC VOID DIA_kdw_6019_reton_OrcScoutDead_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_OrcScoutDead_15_00"); //Der Späher wird keinen Bericht mehr abliefern können.
	AI_Output(self,hero,"DIA_kdw_6019_reton_OrcScoutDead_04_01"); //Sehr gut gemacht. Hier dein Lohn.

	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	AI_Output(self,hero,"DIA_kdw_6019_reton_OrcScoutDead_04_02"); //Ich gehe jetzt zum Pass, ich habe dort einiges zu erledigen.
	AI_Output(self,hero,"DIA_kdw_6019_reton_OrcScoutDead_04_03"); //Vielleicht treffen wir uns ja dort.
	AI_Output(hero,self,"DIA_kdw_6019_reton_OrcScoutDead_15_04"); //Hm ... das wäre möglich.
	AI_Output(self,hero,"DIA_kdw_6019_reton_OrcScoutDead_04_05"); //(grinst verschmitzt) Bis dann am Pass.
	AI_Output(self,hero,"DIA_kdw_6019_reton_OrcScoutDead_04_06"); //Ach, eins noch!
	AI_Output(self,hero,"DIA_kdw_6019_reton_OrcScoutDead_04_07"); //Akwyn wollte dich sehen. Du solltest mal bei ihm vorbeischauen.

	Log_CreateTopic	(TOPIC_DGDH_SHADOWHORN, LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_DGDH_SHADOWHORN, LOG_RUNNING);
	B_LogEntry	(TOPIC_DGDH_SHADOWHORN, "Reton meinte, ich solle mal bei Akwyn vorbeischauen. Mal sehen, was er auf dem Herzen hat.");
	Log_SetTopicStatus	(TOPIC_DGDH_ORCSCOUT, LOG_SUCCESS);

	B_GivePlayerXP	(250);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine (self, "STEHRUM");
};

INSTANCE DIA_kdw_6019_reton_kapiteldrei (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_kapiteldrei_condition;
    information = DIA_kdw_6019_reton_kapiteldrei_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Ich bin wieder zurück!";
};
FUNC INT DIA_kdw_6019_reton_kapiteldrei_condition ()
{
if  Npc_KnowsInfo (hero, DIA_kdw_6019_reton_gilde)
&& (Kapitel == 3)
&& (hero.guild == GIL_STRF)
{
    return TRUE;
};
};
FUNC VOID DIA_kdw_6019_reton_kapiteldrei_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_kapiteldrei_15_0"); //Ich bin wieder zurück!
	AI_Output(self,hero,"DIA_kdw_6019_reton_kapiteldrei_15_1"); //(schwach) ..Seh...Ich
	AI_Output(hero,self,"DIA_kdw_6019_reton_kapiteldrei_15_2"); //Gehts dir nicht gut?
	AI_Output(self,hero,"DIA_kdw_6019_reton_kapiteldrei_15_3"); //Der Kerl in schwarz da ... unten hat ... mich mit so ... nem Feuerball ... getroffen.
	AI_Output(self,hero,"DIA_kdw_6019_reton_kapiteldrei_15_4"); //Immerhin ... hatte ich bis gerade ... eben genug Heiltränke ...
	AI_Output(self,hero,"DIA_kdw_6019_reton_kapiteldrei_15_5"); //Ich ... werde nicht ... mehr lang ... leben... also ernnenne ich ... dich ... zu meinem Nachfolger ...
	Npc_SetTrueGuild (hero, GIL_BAU);
	hero.guild	= GIL_BAU;
	AI_Output(self,hero,"DIA_kdw_6019_reton_kapiteldrei_15_6"); //Nimm mein ... Schwert. Es autorisiert ... dich die Gilde zu führen ...
	B_GiveInvItems(self,hero,ItMw_GHS,1);
	Npc_ExchangeRoutine (self, "TOT");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (VLK_6023_aufseher, "MALERT");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6001_mythrilarbeiter, "MALERT");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6002_mythrilarbeiter, "MALERT");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6003_mythrilarbeiter, "MALERT");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6004_mythrilarbeiter, "MALERT");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6008_Soeldner, "MALERT");  //Routinenwechsel
	Npc_ExchangeRoutine (VLK_6009_Soeldner, "MALERT");  //Routinenwechsel
	Wld_InsertNpc (VLK_6024_deep,"NW_CITY_TO_LIGHTHOUSE_15");
};

INSTANCE DIA_kdw_6019_reton_gehts (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_gehts_condition;
    information = DIA_kdw_6019_reton_gehts_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Gehts?";
};
FUNC INT DIA_kdw_6019_reton_gehts_condition ()
{
if  Npc_KnowsInfo (hero, DIA_kdw_6019_reton_kapiteldrei)
&& (Kapitel == 3)

{
    return TRUE;
};
};
FUNC VOID DIA_kdw_6019_reton_gehts_info ()
{
	AI_Output(hero,self,"DIA_kdw_6019_reton_gehts_15_0"); //Gehts?
	AI_Output(self,hero,"DIA_kdw_6019_reton_gehts_15_1"); //(schwach) Jetzt ...geh!
 
	AI_StopProcessInfos(self);
};

INSTANCE DIA_kdw_6019_reton_gehts2 (C_Info)
{
    npc         = kdw_6019_reton;
    nr          = 6;
    condition   = DIA_kdw_6019_reton_gehts2_condition;
    information = DIA_kdw_6019_reton_gehts2_info;
    permanent   = FALSE;
    important   = TRUE;
    description = "Gehts?";
};
FUNC INT DIA_kdw_6019_reton_gehts2_condition ()
{

if (Kapitel == 2)

{
    return TRUE;
};
};
FUNC VOID DIA_kdw_6019_reton_gehts2_info ()
{
  
	AI_Output(self,hero,"DIA_kdw_6019_reton_gehts2_15_0"); //Na? Auf dem Weg ins Minental?
	AI_Output(self,hero,"DIA_kdw_6019_reton_gehts2_15_1"); //Sei vorsichtig. Im Minental ist es gefährlich.

	AI_StopProcessInfos(self);
};

INSTANCE DIA_Reton_Teach(C_INFO)
{
	npc			= kdw_6019_reton;
	nr			= 7;
	condition	= DIA_Reton_Teach_Condition;
	information	= DIA_Reton_Teach_Info;
	permanent	= TRUE;
	description = "Lass uns mit dem Training beginnen!";
};                       

FUNC INT DIA_Reton_Teach_Condition()
{
	if (hero.guild == GIL_STRF)
	|| (hero.guild == GIL_BAU)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Reton_Teach_Info()
{	
	AI_Output (hero,self ,"DIA_Reton_Teach_15_00"); //Lass uns mit dem Training beginnen!
	
	Info_ClearChoices 	(DIA_Reton_Teach);
	Info_AddChoice 		(DIA_Reton_Teach,	DIALOG_BACK		,DIA_Reton_Teach_Back);
	Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,DIA_Reton_Teach_2H_1);
	Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 5))		,DIA_Reton_Teach_2H_5);
	Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))			,DIA_Reton_Teach_1H_1);
	Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 5))			,DIA_Reton_Teach_1H_5);
};

FUNC VOID DIA_Reton_Teach_Back ()
{
	Info_ClearChoices (DIA_Reton_Teach);
};

FUNC VOID DIA_Reton_Teach_1H_1 ()
{
	if B_TeachFightTalentPercent (self, hero, NPC_TALENT_1H, 1, 100)
	{
		Info_ClearChoices 	(DIA_Reton_Teach);
		Info_AddChoice 		(DIA_Reton_Teach,	DIALOG_BACK		,DIA_Reton_Teach_Back);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))		,DIA_Reton_Teach_2H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 5))		,DIA_Reton_Teach_2H_5);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))			,DIA_Reton_Teach_1H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 5))			,DIA_Reton_Teach_1H_5);
	};
};
FUNC VOID DIA_Reton_Teach_1H_5 ()
{
	if B_TeachFightTalentPercent (self, hero, NPC_TALENT_1H, 5, 100)
	{
		Info_ClearChoices 	(DIA_Reton_Teach);
		Info_AddChoice 		(DIA_Reton_Teach,	DIALOG_BACK		,DIA_Reton_Teach_Back);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))			,DIA_Reton_Teach_2H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 5))			,DIA_Reton_Teach_2H_5);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))			,DIA_Reton_Teach_1H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 5))			,DIA_Reton_Teach_1H_5);
	};	
};

FUNC VOID DIA_Reton_Teach_2H_1 ()
{
	if B_TeachFightTalentPercent (self, hero, NPC_TALENT_2H, 1, 100)
	{
		Info_ClearChoices 	(DIA_Reton_Teach);
		Info_AddChoice 		(DIA_Reton_Teach,	DIALOG_BACK		,DIA_Reton_Teach_Back);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))			,DIA_Reton_Teach_2H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 5))			,DIA_Reton_Teach_2H_5);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))			,DIA_Reton_Teach_1H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 5))			,DIA_Reton_Teach_1H_5);
	};
};
FUNC VOID DIA_Reton_Teach_2H_5 ()
{
	if B_TeachFightTalentPercent (self, hero, NPC_TALENT_2H, 5, 100)
	{
		Info_ClearChoices 	(DIA_Reton_Teach);
		Info_AddChoice 		(DIA_Reton_Teach,	DIALOG_BACK		,DIA_Reton_Teach_Back);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 1))			,DIA_Reton_Teach_2H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(hero, NPC_TALENT_2H, 5))			,DIA_Reton_Teach_2H_5);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1))			,DIA_Reton_Teach_1H_1);
		Info_AddChoice		(DIA_Reton_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 5))			,DIA_Reton_Teach_1H_5);
	};	
};
