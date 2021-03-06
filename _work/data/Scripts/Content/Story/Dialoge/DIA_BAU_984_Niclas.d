
// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Niclas_EXIT   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 999;
	condition   = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos (self);
};						

// ***********************************************************
// 							Hello
// ***********************************************************
INSTANCE DIA_Niclas_Hello   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 1;
	condition   = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Niclas_Hello_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_Hello_Info()
{
	AI_Output (self ,other,"DIA_Niclas_Hello_03_00"); //Bist du auch abgehauen?
	AI_Output (other,self ,"DIA_Niclas_Hello_15_01"); //Wie kommst du darauf?
	AI_Output (self ,other,"DIA_Niclas_Hello_03_02"); //Wieso solltest du mutterseelenallein hierher kommen? Hier ist NICHTS.
};

// ***********************************************************
// 							Ich wollte mich nur mal umsehen.
// ***********************************************************
INSTANCE DIA_Niclas_HaveALook   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 1;
	condition   = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent   = FALSE;
	description = "Ich wollte mich nur mal umsehen.";
};
FUNC INT DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_HaveALook_Info()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_15_00"); //Ich wollte mich nur mal umsehen.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_03_01"); //Ok, tu dir keinen Zwang an. Willst du ein St�ck Fleisch?
	
	CreateInvItems (self,ItFoMutton,1);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
	Info_AddChoice (DIA_Niclas_HaveALook,"Nein, danke.",DIA_Niclas_HaveALook_No);
	Info_AddChoice (DIA_Niclas_HaveALook,"Ja, gerne.",DIA_Niclas_HaveALook_Yes);
};

FUNC VOID DIA_Niclas_HaveALook_No ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_No_15_00"); //Nein, danke.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_No_03_01"); //Wie du willst. Ich hoffe, es st�rt dich nicht, wenn ich was esse.
	
	B_UseItem (self ,ItFoMutton);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
};

FUNC VOID DIA_Niclas_HaveALook_Yes ()
{
	AI_Output (other,self ,"DIA_Niclas_HaveALook_Yes_15_00"); //Ja, gerne.
	AI_Output (self ,other,"DIA_Niclas_HaveALook_Yes_03_01"); //Hier, beste Moleratkeule. Nach meinem Rezept.
	
	B_GiveInvItems (self ,other,ItFOMutton,1);
	
	Info_ClearChoices (DIA_Niclas_HaveALook);
};

// ***********************************************************
// 					Wieso bist du denn hier?
// ***********************************************************
INSTANCE DIA_Niclas_WhyHere   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent   = FALSE;
	description = "Wieso bist du denn hier?";
};
FUNC INT DIA_Niclas_WhyHere_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Niclas_WhyHere_Info()
{
	AI_Output (other,self ,"DIA_Niclas_WhyHere_15_00"); //Wieso bist du denn hier?
	AI_Output (self ,other,"DIA_Niclas_WhyHere_03_01"); //Hier oben habe ich meine Ruhe. In der Stadt f�hle ich mich immer so eingeengt.
};

// ***********************************************************
// 			Musst du nicht arbeiten?		
// ***********************************************************
INSTANCE DIA_Niclas_ShouldntWork   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent   = FALSE;
	description = "Musst du nicht arbeiten?";
};
FUNC INT DIA_Niclas_ShouldntWork_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Niclas_ShouldntWork_Info()
{
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_00"); //Musst du nicht arbeiten?
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_01"); //Alles was ich brauche, organisiere ich mir selbst. Pfeile schnitze ich mir und Fleisch liefert mir die Natur.
	AI_Output (other,self ,"DIA_Niclas_ShouldntWork_15_02"); //Du bist also J�ger.
	AI_Output (self ,other,"DIA_Niclas_ShouldntWork_03_03"); //Wenn du so willst, ja. Allerdings jage ich nur, was ich brauche, nicht, um Gold zu verdienen.
};

// ***********************************************************
// 			Dann kannst du mir bestimmt was beibringen.
// ***********************************************************
INSTANCE DIA_Niclas_CanTeachMe   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent   = FALSE;
	description = "Dann kannst du mir bestimmt was beibringen.";
};
FUNC INT DIA_Niclas_CanTeachMe_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Niclas_CanTeachMe_Info()
{
	AI_Output (other,self ,"DIA_Niclas_CanTeachMe_15_00"); //Dann kannst du mir bestimmt was beibringen.
	AI_Output (self ,other,"DIA_Niclas_CanTeachMe_03_01"); //Warum nicht. Ich k�nnte dir zeigen, wie man mit dem Bogen schie�t.
	
	Log_CreateTopic	(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry		(TOPIC_Teacher, "Niclas kann mir zeigen wie ich besser mir dem Bogen werde.");
};
		
// ***********************************************************
// 			Zeig mir den Umgang mit dem Bogen.
// ***********************************************************
INSTANCE DIA_Niclas_Teach   (C_INFO)
{
	npc         = BAU_984_Niclas;
	nr          = 2;
	condition   = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent   = TRUE;
	description = "Zeig mir den Umgang mit dem Bogen.";
};
FUNC INT DIA_Niclas_Teach_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Niclas_Teach_Info()
{
	AI_Output (other,self ,"DIA_Niclas_Teach_15_00"); //Zeig mir den Umgang mit dem Bogen.
	
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01"); //Ich hab dir alles beigebracht, was ich kann. Du musst dir einen anderen Lehrer suchen.
	}
	else
	{
		Info_ClearChoices (DIA_Niclas_Teach);
		Info_AddChoice		(DIA_Niclas_Teach,DIALOG_BACK,DIA_Niclas_Teach_Back);
		Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5),DIA_Niclas_Teach_BOW_5);
	};
};			
	
FUNC VOID DIA_Niclas_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00"); //Mehr Tricks kann ich dir nicht beibringen.
	};
	
	Info_ClearChoices (DIA_Niclas_Teach);
};

FUNC VOID DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 1, 60);
	
	Info_ClearChoices (DIA_Niclas_Teach);
	Info_AddChoice		(DIA_Niclas_Teach,DIALOG_BACK,DIA_Niclas_Teach_Back);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5),DIA_Niclas_Teach_BOW_5);
};

FUNC VOID DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent (self, other, NPC_TALENT_BOW, 5, 60);
	
	Info_ClearChoices (DIA_Niclas_Teach);
	Info_AddChoice		(DIA_Niclas_Teach,DIALOG_BACK,DIA_Niclas_Teach_Back);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow1, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice		(DIA_Niclas_Teach, B_BuildLearnString(PRINT_LearnBow5, 	B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)*5),DIA_Niclas_Teach_BOW_5);
};


instance DIA_NICLAS_RITUALMESSER(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 700;
	condition = dia_niclas_ritualmesser_condition;
	information = dia_niclas_ritualmesser_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich suche ein wertvolles Messer.";
};


func int dia_niclas_ritualmesser_condition()
{
	if (Npc_KnowsInfo (other, dia_orlan_ritualmesser))
	{
		return TRUE;
	};
};

func void dia_niclas_ritualmesser_info()
{
	AI_Output (other, self, "Dia_Niclas_ritualmesser_00");	//Ich suche ein wertvolles Messer.
	AI_Output (self, other, "Dia_Niclas_ritualmesser_01");	//Und warum kommst du zu mir?
	AI_Output (other, self, "Dia_Niclas_ritualmesser_02");	//Orlan meinte, er h�tte es an einen J�ger verkauft, dessen Name mit 'N' anf�ngt.
	AI_Output (self, other, "Dia_Niclas_ritualmesser_03");	//Ja, mein Name f�ngt mit 'N' an und ich habe ein wertvolles Messer von Orlan.
	Info_ClearChoices (dia_niclas_ritualmesser);
	Info_AddChoice (dia_niclas_ritualmesser, "Gib es mir, oder du wirst sterben", dia_niclas_ritualmesser_bad);
	Info_AddChoice (dia_niclas_ritualmesser, "Kann ich es dir abkaufen?", dia_niclas_ritualmesser_good);
};

func void dia_niclas_ritualmesser_bad()
{
	AI_Output (other, self, "Dia_Niclas_ritualmesser_Bad_00");	//Gib es mir, oder du wirst sterben!
	AI_Output (self, other, "Dia_Niclas_ritualmesser_Bad_01");	//Versuchs doch!
	Info_ClearChoices (dia_niclas_ritualmesser);
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_KILL, 1);
};

func void dia_niclas_ritualmesser_good()
{
	AI_Output (other, self, "Dia_Niclas_ritualmesser_Good_00");	//Kann ich es dir abkaufen?
	AI_Output (self, other, "Dia_Niclas_ritualmesser_Good_01");	//Abkaufen nicht direkt, aber ich k�nnte es gegen bessere Ausr�stung tauschen.
	AI_Output (self, other, "Dia_Niclas_ritualmesser_Good_02");	//Bring mir einfach einen "Jagdbogen", dann bekommst du dein Messer.
	AI_Output (other, self, "Dia_Niclas_ritualmesser_Good_03");	//Und was willst du hier drau�en ohne Messer machen?
	AI_Output (self, other, "Dia_Niclas_ritualmesser_Good_04");	//Ich habe nat�rlich ein Ersatzmesser und ein guter Bogen ist f�r mich momentan wichtiger.
	Info_ClearChoices (dia_niclas_ritualmesser);
	MIS_NICLAS_BOGEN = TRUE;
	B_LogEntry (DAS_BLUTRITUAL, "Ich habe den J�ger mit dem Ritualmesser gefunden, er hei�t Niclas und will das Messer gegen einen 'Jagdbogen' tauschen.");
};


instance DIA_NICLAS_RITUALMESSER_2(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 689;
	condition = dia_niclas_ritualmesser_2_condition;
	information = dia_niclas_ritualmesser_2_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ich habe den Jagdbogen";
};


func int dia_niclas_ritualmesser_2_condition()
{
	if ((Npc_HasItems (other, ItRw_Bow_L_03) >= 1) && (MIS_NICLAS_BOGEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_niclas_ritualmesser_2_info()
{
	AI_Output (other, self, "Dia_Niclas_ritualmesser_10");	//Ich habe den Jagdbogen.
	AI_Output (self, other, "Dia_Niclas_ritualmesser_11");	//Danke! Hier, nimm das Messer!
	B_GiveInvItems (other, self, ItRw_Bow_L_03, 1);
	B_GiveInvItems (self, other, itmi_ritualmesser, 1);
	B_GivePlayerXP (200);
};	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Niclas_PICKPOCKET (C_INFO)
{
	npc			= BAU_984_Niclas;
	nr			= 900;
	condition	= DIA_Niclas_PICKPOCKET_Condition;
	information	= DIA_Niclas_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Niclas_PICKPOCKET_Condition()
{
	C_Beklauen (27, 20);
};
 
FUNC VOID DIA_Niclas_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Niclas_PICKPOCKET);
	Info_AddChoice		(DIA_Niclas_PICKPOCKET, DIALOG_BACK 		,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Niclas_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Niclas_PICKPOCKET);
};
	
func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Niclas_PICKPOCKET);
};


