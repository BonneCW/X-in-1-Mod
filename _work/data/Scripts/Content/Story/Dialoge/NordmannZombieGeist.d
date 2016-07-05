INSTANCE Info_Mod_UnverfaulterZombie_Hi (C_INFO)
{
	npc		= Mod_1000_VerfaulterZombie;
	nr		= 1;
	condition	= Info_Mod_UnverfaulterZombie_Hi_Condition;
	information	= Info_Mod_UnverfaulterZombie_Hi_Info;
	permanenter	= 0;
	important	= 1;
};

FUNC INT Info_Mod_UnverfaulterZombie_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_UnverfaulterZombie_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_UnverfaulterZombie_Hi_09_00"); //Erl�se mich!

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
};

INSTANCE Info_Mod_NordmannGeist_Hi (C_INFO)
{
	npc		= Mod_1001_NordmannGeist;
	nr		= 1;
	condition	= Info_Mod_NordmannGeist_Hi_Condition;
	information	= Info_Mod_NordmannGeist_Hi_Info;
	permanenter	= 0;
	important	= 1;
};

FUNC INT Info_Mod_NordmannGeist_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_NordmannGeist_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_00"); //Aaaaaaah ... Freiheit!
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_01"); //Ich f�rchtete schon, Jahrhunderte lang langsam zu verfaulen und mich seinem Einfluss niemals entziehen zu k�nnen ...
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_02"); //Wessen Einfluss?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_03"); //Dem des D�monen. Er hat mich get�tet.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_04"); //Aber er hat mich nicht sterben lassen, sondern mich wiedererweckt, damit ich ihm diene.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_05"); //Wie kommt es, dass ich mit dir reden kann? Die meisten Zombies, die ich kenne, sind nicht sonderlich gespr�chig gewesen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_06"); //Vermutlich liegt es daran, dass ich noch nicht lange tot bin.

	AI_TurnToNpc	(self, Mod_1000_VerfaulterZombie);

	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_07"); //Mein Fleisch hat noch nicht einmal zu faulen begonnen ...

	AI_TurnToNpc	(self, hero);

	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_08"); //Du bist der Nordmann, der nach Khorinis gekommen ist, richtig?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_09"); //Ja, das stimmt.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_10"); //Ich kam vor kurzem mit einem kleinen Boot hier an. Die Menschen in der Stadt sind verweichlicht und schwach, sie wissen nicht, was ein wahrer Kampf ist.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_11"); //Darum bin ich in dieses Tal gekommen, da mir gesagt wurde, dass ich hier Orks finden k�nne.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_12"); //Doch die vor der Burg lagernden Orks w�ren selbst f�r einen Krieger wie mich zu stark, zumindest wenn ich alleine gegen sie angetreten w�re.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_13"); //Du siehst kr�ftig aus, mit dir an meiner Seite h�tten wir sie zumindest ein wenig aufreiben k�nnen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_14"); //Doch stattdessen bin ich in das Hinterland gegangen, da ich die Unt�tigkeit der Paladine nicht mit ansehen konnte.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_15"); //Sie sitzen in ihrer Burg wie die Maus in der Ecke, unf�hig, sich im Angesicht der Katze zu bewegen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_16"); //Wenn nichts geschieht, werden sie alle sterben, bis auf den letzten Mann.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_17"); //Doch genug davon.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_18"); //Ich machte mich also auf den Weg, einen geeigneten Lagerplatz f�r die Jagd zu finden.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_19"); //Kurz vor Einbruch der Dunkelheit sah ich die Silhouette dieses Turm und machte mich den Weg hierher. Doch der D�mon �berraschte mich.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_20"); //Und t�tete dich.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_21"); //Und t�tete mich.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_22"); //Du kamst also her, um Orks zu jagen?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_23"); //Ja. Und um die mir aufgetragenen Mission zu erf�llen ...
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_24"); //Mission? Was f�r einen Auftrag hattest du?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_25"); //Ich sollte eine alte, legend�re Waffe suchen, die lange Zeit vergessen war. Zu lange.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_26"); //Doch die Zeiten haben sich ge�ndert und die Stammes�ltesten erinnern sich wieder an alte Sagen und Legenden.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_27"); //Von welcher Legende redest du?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_28"); //Vor langer Zeit, als das magische Erz noch nicht zum Schmieden benutzt worden war, entwickelten die Schmiede meines Clans die gr��ten Geheimnisse des Schmiedens.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_29"); //Doch mit dem Bekanntwerden der Wirkung des magischen Erzes traten diese wahren K�nste des Schmiedens mehr und mehr in den Hintergrund.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_30"); //Die magische Wirkung des Erzes verst�rkte die Waffen enorm, sodass auch ein mittelpr�chtiger Schmied starke Waffen herstellen konnte.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_31"); //Dennoch ist eine meisterlich geschmiedete, normale Waffe um einiges gef�hrlicher als eine mittelm��ige Erzwaffe!
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_32"); //Soso. Aber was f�hrt dich nach Khorinis?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_33"); //Vor langer Zeit, noch vor den ersten Orkkriegen hier, segelte ein gro�er Krieger der Nordmarer mit einer solchen m�chtigen, meisterhaft geschmiedeten Waffe zu dieser Insel.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_34"); //Sie wurde von einem der Vorfahren des gro�en selbst Ingvars geschmiedet.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_35"); //Doch dieser Name wird dir wahrscheinlich nichts sagen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_36"); //Die Orks hier waren noch wild und stark. Ein Krieger konnte gut jagen und zu viel Ruhm und Ehre gelangen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_37"); //Wie gesagt, der Krieger segelte also mit dieser Waffe hierher, um sich dem Kampf zu stellen. Doch er kehrte nie zur�ck.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_38"); //Keiner der �ltesten wei� wirklich, was mit ihm geschah.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_39"); //Manche erz�hlen, er sei in einem unglaublichen Kampf mit einem uralten �bel gefallen, welches er jedoch mit in den Tod gerissen habe.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_40"); //Andere Erz�hlungen berichten davon, dass er eine Frau fand und hier sesshaft wurde.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_41"); //Die Erzbarone k�nnten direkte Nachfahren dieses Kriegers sein.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_42"); //Doch das sind alles nur Spekulationen, niemand wei� etwas genaues dar�ber.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_43"); //Mein Auftrag war, die alte, sagenumwobene Waffe zu suchen, um den Schmieden in Nordmar das Geheimnis der alten, der wahren Schmiedekunst zur�ckzubringen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_44"); //Denn das Erz wird knapp und die Orks werden von Tag zu Tag zahlreicher ... Es kann nicht mehr lange dauern, bis Nordmar und auch das Mittelland angegriffen werden.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_45"); //Doch ich habe versagt, ich werde das Schwert niemals wieder in meine Heimat zur�ckbringen k�nnen ...
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_46"); //Moment mal. Du magst zwar tot sein, ich lebe aber noch. Hast du etwas �ber die Waffe herausfinden k�nnen?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_47"); //Ha! Als k�nntest du die Waffe zur�ck in meine Heimat bringen!
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_48"); //Aber du hast mich erl�st, also will ich dir erz�hlen, was ich vermute.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_49"); //Falls sie noch existiert, bin ich mir sicher, dass die Orks im Besitz dieser Waffe sind.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_50"); //W�hrend dieser Ort noch von einer magischen Kugel umschlossen war und die Gesetz- und Ehrlosen herrschten, w�re die Waffe sicherlich gefunden worden.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_51"); //Sie haben mit Sicherheit jeden Grashalm umgedreht, um etwas Wertvolles zu finden.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_52"); //In der Tat ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_53"); //Da in Khorinis aber niemand etwas von ihr wusste, muss sie sich noch immer im Tal befinden.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_54"); //Die Orks werden sie nicht in der N�he des Belagerungsringes versteckt halten, damit sie nicht durch einen Zufall in die H�nde der Menschen fallen k�nnte.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_55"); //Ich habe kurz vor meinem ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_56"); //... Ableben ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_57"); //... in der N�he ein altes, fast verlassenes Orkdorf gesehen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_58"); //Wo genau es liegt kann ich allerdings nicht sagen, ich habe es nur aus der Entfernung, von einer Anh�he aus, gesehen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_59"); //Die alten K�mpfer der Orks sind in Zeiten des Krieges oft noch in ihren D�rfern. W�hrend die �brigen Krieger in die Schlacht ziehen, haben sie die -in ihren Augen ehrenvolle- Aufgabe, die erbeuteten Sch�tze zu bewachen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_60"); //Da sich Orks wenig aus Schmuck und Gold machen, sind dies meist alte Waffen oder auch R�stungen.
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_61"); //Du solltest also also in diesem alten Dorf nach diesen Wachen suchen, vermutlich haben sie die Waffe.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_62"); //Und wenn sie sie nicht haben?
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_63"); //Dann m�ssen wir davon ausgehen, dass die Waffe zerst�rt ist.
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_64"); //Na, das sind ja rosige Aussichten ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_65"); //Ich sp�re etwas ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_66"); //... ich kann nicht l�nger bei dir bleiben, mein Geist wird hin�bergezogen in das Reich der Toten ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_67"); //... meine toten Br�der ... welch ein ehrenvoller Empfang ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_68"); //... was f�r ein Bankett ... all diese Waffen und diese Pracht ...
	AI_Output(self, hero, "Info_Mod_NordmannGeist_Hi_09_69"); //... aaaaaah ...
	AI_Output(hero, self, "Info_Mod_NordmannGeist_Hi_15_70"); //Ruhe in Frieden.

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");

	B_LogEntry	(TOPIC_DGDH_NORDMANN, "Ich habe den Nordmarer gefunden. Er wurde von einem D�mon get�tet und zum Untotendasein verdammt. Nach dem Kampf mit ihm erz�hlte mir sein Geist jedoch von einer alten Waffe, wegen der er eigentlich gekommen war. Ich sollte in dem alten Orkdorf nach ihr suchen. Falls ich sie nicht finde, muss ich davon ausgehen, dass sie unwiederbringlich zerst�rt ist.");

	Wld_InsertNpc	(OrcWache_Roam, "UL_ORC");
	Wld_InsertNpc	(OrcWache_Roam, "UL_ORC");
	Wld_InsertNpc	(OrcWache_Nordmann, "UL_ORC");
};