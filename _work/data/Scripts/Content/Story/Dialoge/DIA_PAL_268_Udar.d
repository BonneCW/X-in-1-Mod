// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Udar_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_EXIT_Condition;
	information	= DIA_Udar_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Udar_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Udar_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
INSTANCE DIA_Udar_Hello (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 2;
	condition	= DIA_Udar_Hello_Condition;
	information	= DIA_Udar_Hello_Info;
	IMPORTANT 	= TRUE;
};                       

FUNC INT DIA_Udar_Hello_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 4)
	{	
		return TRUE;
	}; 
};
FUNC VOID DIA_Udar_Hello_Info()
{	
	AI_Output	(self ,hero,"DIA_Udar_Hello_09_00");//Du hattest verdammtes Glück, als du reingekommen bist. Um ein Haar hätte ich dich erschossen.
	AI_Output	(hero,self ,"DIA_Udar_Hello_15_01");//Dann sollte ich wohl froh sein, dass du so gute Augen hast.
	AI_Output	(self ,hero,"DIA_Udar_Hello_09_02");//Spar dir deine Sprüche. Rede mit Sengrath, wenn du was willst.
	
	AI_StopProcessInfos (self);
};

INSTANCE DIA_Udar_Nordmann (C_INFO)
{
	npc		= PAL_268_Udar;
	nr		= 3;
	condition	= DIA_Udar_Nordmann_Condition;
	information	= DIA_Udar_Nordmann_Info;
	permanent	= FALSE;
	Description 	= "Hast du hier einen Nordmarer vorbeikommen sehen?";
};                       

FUNC INT DIA_Udar_Nordmann_Condition()
{
	IF (Npc_KnowsInfo (hero, DIA_DiegoNW_Orkschlaechter))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_Nordmann_Info()
{	
	AI_Output	(hero, self, "DIA_Udar_Nordmann_15_00"); //Hast du hier einen Nordmarer vorbeikommen sehen?
	AI_Output	(self, hero, "DIA_Udar_Nordmann_09_01"); //Ja, er war wirklich hier.
	AI_Output	(self, hero, "DIA_Udar_Nordmann_09_02"); //Ich habe aber nicht lange mit ihm gesprochen, aber er hat sich noch ein wenig mit Tandor unterhalten.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_DGDH_NORDMANN, "Der Nordmarer war tatsächlich in der Burg. Ich sollte herausfinden, was er hier wollte und wo er sich jetzt befindet. Meine erste Anlaufstelle ist Tandor.");
};

INSTANCE DIA_Udar_Nordmann2 (C_INFO)
{
	npc		= PAL_268_Udar;
	nr		= 3;
	condition	= DIA_Udar_Nordmann2_Condition;
	information	= DIA_Udar_Nordmann2_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Udar_Nordmann2_Condition()
{
	IF (Npc_KnowsInfo (hero, DIA_Oric_Nordmann))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_Nordmann2_Info()
{	
	AI_Output	(self, hero, "DIA_Udar_Nordmann2_09_00"); //Und? Weißt du jetzt alles, was du wissen wolltest?
	AI_Output	(hero, self, "DIA_Udar_Nordmann2_15_01"); //Du hättest mir ruhig sagen können, dass er nicht mehr in der Burg ist.
	AI_Output	(self, hero, "DIA_Udar_Nordmann2_09_02"); //(grinst) Du hast nicht danach gefragt ...
	AI_Output	(self, hero, "DIA_Udar_Nordmann2_09_03"); //Aber du solltest ihm leicht folgen können. Er ist wie ein Berserker durch die Scharen der Orks gemäht.
	AI_Output	(self, hero, "DIA_Udar_Nordmann2_09_04"); //Folge einfach der Spur der toten Orks, dann wirst du ihn wahrscheinlich finden.
	AI_Output	(hero, self, "DIA_Udar_Nordmann2_15_05"); //Danke.

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_DGDH_NORDMANN, "Udar gab mir den Tipp, einfach der Spur aus toten Orks zu folgen, die der Nordmarer hinterlassen hat. Nicht unbedingt ein konventioneller Hinweis, aber wenn es funktioniert ...");

	Wld_InsertNpc	(OrkLeiche_01, "OC_RAMP_08");
	B_KillNpc	(OrkLeiche_01);

	Wld_InsertNpc	(OrkLeiche_02, "OC_RAMP_09");
	B_KillNpc	(OrkLeiche_02);

	Wld_InsertNpc	(OrkLeiche_03, "OC_ORK_BETWEEN_CAMPS_02_MOVEMENT");
	B_KillNpc	(OrkLeiche_03);

	Wld_InsertNpc	(OrkLeiche_04, "OC_ORK_BETWEEN_CAMPS_02");
	B_KillNpc	(OrkLeiche_04);

	Wld_InsertNpc	(OrkLeiche_05, "OC11_OC12");
	B_KillNpc	(OrkLeiche_05);

	Wld_InsertNpc	(OrkLeiche_06, "OC_ROUND_11");
	B_KillNpc	(OrkLeiche_06);

	Wld_InsertNpc	(OrkLeiche_07, "OC10");
	B_KillNpc	(OrkLeiche_07);

	Wld_InsertNpc	(OrkLeiche_08, "OC_ROUND_27");
	B_KillNpc	(OrkLeiche_08);

	Wld_InsertNpc	(OrkLeiche_09, "OC_ROUND_12");
	B_KillNpc	(OrkLeiche_09);

	Wld_InsertNpc	(OrkLeiche_10, "OW_PATH_001");
	B_KillNpc	(OrkLeiche_10);

	Wld_InsertNpc	(OrkLeiche_11, "ORKS");
	B_KillNpc	(OrkLeiche_11);

	Wld_InsertNpc	(OrkLeiche_12, "OW_PATH_003");
	B_KillNpc	(OrkLeiche_12);

	Wld_InsertNpc	(OrkLeiche_13, "OW_PATH_018");
	B_KillNpc	(OrkLeiche_13);

	Wld_InsertNpc	(OrkLeiche_14, "OW_PATH_017");
	B_KillNpc	(OrkLeiche_14);

	Wld_InsertNpc	(OrkLeiche_15, "OW_PATH_016");
	B_KillNpc	(OrkLeiche_15);

	Wld_InsertNpc	(OrkLeiche_16, "OW_PATH_016_B");
	B_KillNpc	(OrkLeiche_16);

	Wld_InsertNpc	(OrkLeiche_17, "OW_PATH_015");
	B_KillNpc	(OrkLeiche_17);

	Wld_InsertNpc	(OrkLeiche_18, "FP_ROAM_OW_SNAPPER_OW_ORC");
	B_KillNpc	(OrkLeiche_18);

	Wld_InsertNpc	(OrkLeiche_19, "OW_PATH_013");
	B_KillNpc	(OrkLeiche_19);

	Wld_InsertNpc	(OrkLeiche_20, "CASTLE_2");
	B_KillNpc	(OrkLeiche_20);

	Wld_InsertNpc	(OrkLeiche_21, "OW_PATH_106");
	B_KillNpc	(OrkLeiche_21);

	Wld_InsertNpc	(OrkLeiche_22, "CASTLE_3");
	B_KillNpc	(OrkLeiche_22);

	Wld_InsertNpc	(OrkLeiche_23, "OW_PATH_06_01");
	B_KillNpc	(OrkLeiche_23);

	Wld_InsertNpc	(OrkLeiche_24, "OW_PATH_06_02");
	B_KillNpc	(OrkLeiche_24);

	Wld_InsertNpc	(OrkLeiche_25, "OW_PATH_06_03");
	B_KillNpc	(OrkLeiche_25);

	Wld_InsertNpc	(OrkLeiche_26, "OW_PATH_06_04");
	B_KillNpc	(OrkLeiche_26);

	Wld_InsertNpc	(OrkLeiche_27, "OW_PATH_304");
	B_KillNpc	(OrkLeiche_27);

	Wld_InsertNpc	(OrkLeiche_28, "WP_NORDMANN_01");
	B_KillNpc	(OrkLeiche_28);

	Wld_InsertNpc	(OrkLeiche_29, "WP_NORDMANN_02");
	B_KillNpc	(OrkLeiche_29);

	Wld_InsertNpc	(OrkLeiche_30, "WP_NORDMANN_03");
	B_KillNpc	(OrkLeiche_30);

	Wld_InsertNpc	(OrkLeiche_31, "WP_NORDMANN_04");
	B_KillNpc	(OrkLeiche_31);

	Wld_InsertNpc	(OrkLeiche_32, "WP_NORDMANN_05");
	B_KillNpc	(OrkLeiche_32);

	Wld_InsertNpc	(OrkLeiche_33, "LOCATION_03_OUT");
	B_KillNpc	(OrkLeiche_33);

	Wld_InsertNpc	(Mod_1000_VerfaulterZombie, "DT_E1_07");
};

//***************************************
//	Armbrustlehrer	
//***************************************

INSTANCE DIA_Udar_YouAreBest (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_YouAreBest_Condition;
	information	= DIA_Udar_YouAreBest_Info;
	permanent	= FALSE;
	Description = "Ich habe gehört, du seist der BESTE Armbrustschütze...";
};                       

FUNC INT DIA_Udar_YouAreBest_Condition()
{
	IF (Npc_KnowsInfo (hero,DIA_Keroloth_Udar))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_YouAreBest_Info()
{	
	AI_Output	(hero,self ,"DIA_Udar_YouAreBest_15_00");	//Ich habe gehört, du seist der BESTE Armbrustschütze weit und breit.
	AI_Output	(self ,hero,"DIA_Udar_YouAreBest_09_01");	//Wenn man das sagt, wird es wohl stimmen. Was willst du?
};

//***********************************
//	Bring wir was bei!
//***********************************

INSTANCE DIA_Udar_TeachMe (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_TeachMe_Condition;
	information	= DIA_Udar_TeachME_Info;
	permanent	= FALSE;
	Description = "Bring mir Armbrustschießen bei.";
};                       

FUNC INT DIA_Udar_TeachMe_Condition()
{
	IF ((Npc_KnowsInfo (hero,DIA_Udar_YouAreBest))
	&& (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_TeachME_Info()
{	
	AI_Output	(hero,self ,"DIA_Udar_Teacher_15_00");	//Bring mir Armbrustschießen bei.
	AI_Output	(self ,hero,"DIA_Udar_Teacher_09_01");	//Verzieh dich, vor der Burg laufen genug Ziele rum, üb an denen.

};	

//***********************************
//	Ich bin auch nicht schlecht!
//***********************************

INSTANCE DIA_Udar_ImGood (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_ImGood_Condition;
	information	= DIA_Udar_ImGood_Info;
	permanent	= FALSE;
	Description = "Ich bin der Größte.";
};                       

FUNC INT DIA_Udar_ImGood_Condition()
{
	IF (Npc_KnowsInfo (hero,DIA_Udar_YouAreBest))
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_ImGood_Info()
{	
	AI_Output	(hero,self ,"DIA_Udar_ImGood_15_00");	//Ich bin der Größte.
	AI_Output	(self ,hero,"DIA_Udar_ImGood_09_01");	//(lacht) Du bist in Ordnung!
	AI_Output	(self ,hero,"DIA_Udar_ImGood_09_02");	//Also, wenn du was lernen willst, dann helfe ich dir.
	
	Udar_TeachPlayer = TRUE;
	B_LogEntry		(TOPIC_Teacher_OC, "Udar ist kann mich im Umgang mit der Armbrust unterweisen"); 
};

//***********************************
//	Bring mir was bei
//***********************************

INSTANCE DIA_Udar_Teach (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 3;
	condition	= DIA_Udar_Teach_Condition;
	information	= DIA_Udar_Teach_Info;
	permanent	= TRUE;
	Description = "Ich will von Dir lernen.";
};                       

FUNC INT DIA_Udar_Teach_Condition()
{
	IF (Udar_TeachPlayer== TRUE)
	{
		return 1;
	};
};
 
FUNC VOID DIA_Udar_Teach_Info()
{	
	AI_Output	(hero,self ,"DIA_Udar_Teach_15_00");	//Ich will von dir lernen.
	AI_Output	(self ,hero,"DIA_Udar_Teach_09_01");   //Okay, schieß los!
	
	Info_ClearChoices (DIA_Udar_Teach);
	
	Info_AddChoice		(DIA_Udar_Teach,DIALOG_BACK,DIA_Udar_Teach_Back);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, 			B_GetLearnCostTalent(hero, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, 			B_GetLearnCostTalent(hero, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_CROSSBOW_5);
};

FUNC VOID DIA_Udar_Teach_BACK()
{
	Info_ClearChoices (DIA_Udar_Teach);
};

FUNC VOID B_Udar_TeachNoMore1 ()
{
	AI_Output(self,hero,"B_Udar_TeachNoMore1_09_00"); //Die Grundlagen kannst du ja schon, für mehr haben wir keine Zeit.
};

FUNC VOID B_Udar_TeachNoMore2 ()
{
	AI_Output(self,hero,"B_Udar_TeachNoMore2_09_00"); //Um deinen Umgang mit der Waffe zu verfeinern, solltest du dir einen richtigen Lehrer suchen.
};

FUNC VOID DIA_Udar_Teach_Crossbow_1 ()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_CROSSBOW, 1, 60);
	
	if (hero.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
		
		if (Npc_GetTalentSkill (hero, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1	, B_GetLearnCostTalent(hero, NPC_TALENT_CROSSBOW, 1))			,DIA_Udar_Teach_Crossbow_1);
};

FUNC VOID DIA_Udar_Teach_Crossbow_5 ()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_CROSSBOW, 5, 60);
	
	if (hero.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1 ();
	
		if (Npc_GetTalentSkill (hero, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2 ();
		};
	};
	Info_AddChoice		(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5	, B_GetLearnCostTalent(hero, NPC_TALENT_CROSSBOW, 5))			,DIA_Udar_Teach_Crossbow_5);
};
//***********************************
//	Perm
//***********************************

INSTANCE DIA_Udar_Perm (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Perm_Condition;
	information	= DIA_Udar_Perm_Info;
	permanent	= FALSE;
	Description = "Wie sieht's in der Burg aus?";
};                       
FUNC INT DIA_Udar_Perm_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Perm_Info()
{	
	AI_Output	(hero,self ,"DIA_Udar_Perm_15_00");	//Wie sieht's in der Burg aus?
	AI_Output	(self ,hero,"DIA_Udar_Perm_09_01");	//Ein paar Jungs trainieren, aber im Prinzip warten wir alle nur darauf, dass irgendwas passiert.
	AI_Output	(self ,hero,"DIA_Udar_Perm_09_02");	//Diese Ungewissheit macht mürbe. Das ist die Taktik dieser verdammten Orks. Sie warten so lange ab, bis wir mit den Nerven am Ende sind.
};	
//***********************************
//	Ring 
//***********************************

INSTANCE DIA_Udar_Ring (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 11;
	condition	= DIA_Udar_Ring_Condition;
	information	= DIA_Udar_Ring_Info;
	permanent	= FALSE;
	Description = "Ich bringe dir Tengrons Ring...";
};                       
FUNC INT DIA_Udar_Ring_Condition()
{
	if (Npc_HasItems (hero,ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_Ring_Info()
{	
	AI_Output	(hero,self ,"DIA_Udar_Ring_15_00");	//Ich bringe dir Tengrons Ring. Er soll dich schützen. Aber Tengron wird ihn sich holen, wenn er zurück ist.
	AI_Output	(self ,hero,"DIA_Udar_Ring_09_01");	//Was? Weißt du, was das für ein Ring ist? Diesen Ring hat er als Auszeichnung für seinen Mut im Kampf bekommen.
	AI_Output	(self ,hero,"DIA_Udar_Ring_09_02");	//Du sagst, er will ihn sich wieder zurückholen? So Innos will, wird er das. So Innos will ...
	
	B_GiveInvItems (hero,self,ItRi_Tengron,1);
	TengronRing = TRUE;
	B_GivePlayerXP (XP_TengronRing);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Udar_KAP4_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP4_EXIT_Condition;
	information	= DIA_Udar_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP4_EXIT_Condition()
{
	if	(Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Kap4WiederDa		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	40;
	condition	 = 	DIA_Udar_Kap4WiederDa_Condition;
	information	 = 	DIA_Udar_Kap4WiederDa_Info;
	important	 = 	TRUE;
};

func int DIA_Udar_Kap4WiederDa_Condition ()
{
	if	(Kapitel >= 4)	
		{
				return TRUE;
		};
};

func void DIA_Udar_Kap4WiederDa_Info ()
{
	AI_Output			(self, hero, "DIA_Udar_Kap4WiederDa_09_00"); //Gut, dass du kommst. Hier ist die Hölle los.

	if (hero.guild != GIL_DJG)
	{
		AI_Output			(hero, self, "DIA_Udar_Kap4WiederDa_15_01"); //Was ist passiert?
		AI_Output			(self, hero, "DIA_Udar_Kap4WiederDa_09_02"); //Die Drachenjäger machen sich hier in der Burg breit und prahlen damit, das Drachenproblem lösen zu können.
		AI_Output			(self, hero, "DIA_Udar_Kap4WiederDa_09_03"); //Aber ich sag dir was, die töten noch nicht einmal einen alten, kranken Snapper, so wie die aussehen.
	};

	AI_Output			(self, hero, "DIA_Udar_Kap4WiederDa_09_04"); //Viele von uns sind mittlerweile echt beunruhigt und glauben nicht mehr so recht daran, dass wir hier jemals wieder lebend rauskommen.
};

///////////////////////////////////////////////////////////////////////
//	Info Sengrath
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Sengrath		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	41;
	condition	 = 	DIA_Udar_Sengrath_Condition;
	information	 = 	DIA_Udar_Sengrath_Info;

	description	 = 	"Wart ihr hier oben nicht zwei Wachposten?";
};

func int DIA_Udar_Sengrath_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(hero, DIA_Udar_Kap4WiederDa))
		&& (Sengrath_Missing == TRUE)
		{
				return TRUE;
		};
};

func void DIA_Udar_Sengrath_Info ()
{
	AI_Output			(hero, self, "DIA_Udar_Sengrath_15_00"); //Wart ihr hier oben nicht zwei Wachposten?
	AI_Output			(self, hero, "DIA_Udar_Sengrath_09_01"); //Jetzt nicht mehr. Sengrath stand hier auf den Zinnen und ist dann auf einmal eingeschlafen.
	AI_Output			(self, hero, "DIA_Udar_Sengrath_09_02"); //Seine gute Armbrust ist bei der Aktion heruntergefallen.
	AI_Output			(self, hero, "DIA_Udar_Sengrath_09_03"); //Man konnte gerade noch erkennen, wie einer der Orks damit in der Dunkelheit verschwand.
	AI_Output			(self, hero, "DIA_Udar_Sengrath_09_04"); //Sengrath wurde davon wach und ist einfach in die Nacht zu den Orkpalisaden gerannt und kam seither nicht wieder.
	AI_Output			(self, hero, "DIA_Udar_Sengrath_09_05"); //Innos steh uns bei!

	Log_CreateTopic (TOPIC_Sengrath_Missing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing, LOG_RUNNING);
	B_LogEntry (TOPIC_Sengrath_Missing,"Udar, der Wachposten in der Burg vermisst seinen Freund Sengrath. Das letzte, was er von sah, ist, dass er in die Nacht verschwand in Richtung Orkzaun um seine verlorene Armbrust wieder zu holen."); 
};


///////////////////////////////////////////////////////////////////////
//	Info SENGRATHgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_SENGRATHGEFUNDEN		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	42;
	condition	 = 	DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information	 = 	DIA_Udar_SENGRATHGEFUNDEN_Info;

	description	 = 	"Ich habe Sengrath gefunden.";
};

func int DIA_Udar_SENGRATHGEFUNDEN_Condition ()
{
	if	(Kapitel >= 4)	
		&& (Npc_KnowsInfo(hero, DIA_Udar_Sengrath))
		&& (Npc_HasItems (hero,ItRw_SengrathsArmbrust_MIS))
		{
				return TRUE;
		};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info ()
{
	AI_Output			(hero, self, "DIA_Udar_SENGRATHGEFUNDEN_15_00"); //Ich habe Sengrath gefunden.
	AI_Output			(self, hero, "DIA_Udar_SENGRATHGEFUNDEN_09_01"); //Wirklich? Wo ist er?
	AI_Output			(hero, self, "DIA_Udar_SENGRATHGEFUNDEN_15_02"); //Er ist tot. Hier ist seine Armbrust. Er hatte sie bei sich.
	AI_Output			(self, hero, "DIA_Udar_SENGRATHGEFUNDEN_09_03"); //Er muss sich die Armbrust zurückgeholt haben, ist aber dann wohl doch von den Orks erschlagen worden.
	AI_Output			(self, hero, "DIA_Udar_SENGRATHGEFUNDEN_09_04"); //Verdammter Narr. Ich wusste es. Wir werden alle sterben.

	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP (XP_SengrathFound);
};

///////////////////////////////////////////////////////////////////////
//	Info BadFeeling
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_BADFEELING		(C_INFO)
{
	npc		 = 	PAL_268_Udar;
	nr		 = 	50;
	condition	 = 	DIA_Udar_BADFEELING_Condition;
	information	 = 	DIA_Udar_BADFEELING_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Udar_BADFEELING_Condition ()
{
		if 	(Npc_RefuseTalk(self) == FALSE)
			&& (Npc_IsInState (self,ZS_Talk))
			&& (Npc_KnowsInfo(hero, DIA_Udar_SENGRATHGEFUNDEN))
			&& (Kapitel >= 4)	
		{
				return TRUE;
		};			
};

func void DIA_Udar_BADFEELING_Info ()
{
	if (MIS_OCGateOpen == TRUE)
	{
	AI_Output			(self, hero, "DIA_Udar_BADFEELING_09_00"); //Noch so einen hinterhältigen Angriff, und wir sind Geschichte.
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
	AI_Output			(self, hero, "DIA_Udar_BADFEELING_09_01"); //Die Orks sind sehr beunruhigt. Irgendetwas hat ihnen einen Mordsschrecken eingejagt. Das spüre ich.
	}
	else 
	{
	AI_Output			(self, hero, "DIA_Udar_BADFEELING_09_02"); //Ich hab da ein ganz mieses Gefühl.
	};
	
	Npc_SetRefuseTalk (self,30);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Udar_KAP5_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP5_EXIT_Condition;
	information	= DIA_Udar_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Udar_KAP6_EXIT(C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 999;
	condition	= DIA_Udar_KAP6_EXIT_Condition;
	information	= DIA_Udar_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Udar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Udar_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Udar_PICKPOCKET (C_INFO)
{
	npc			= PAL_268_Udar;
	nr			= 900;
	condition	= DIA_Udar_PICKPOCKET_Condition;
	information	= DIA_Udar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Udar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Udar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Udar_PICKPOCKET);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_BACK 		,DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Udar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};
	
func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Udar_PICKPOCKET);
};



































