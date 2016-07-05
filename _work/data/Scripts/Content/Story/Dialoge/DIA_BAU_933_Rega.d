///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rega_EXIT   (C_INFO)
{
	npc         = BAU_933_Rega;
	nr          = 999;
	condition   = DIA_Rega_EXIT_Condition;
	information = DIA_Rega_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rega_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rega_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


instance DIA_REGGA_FLEE(C_Info)
{
	npc = BAU_933_Rega;
	nr = 147;
	condition = dia_regga_flee_condition;
	information = dia_regga_flee_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_regga_flee_condition()
{
	return TRUE;
};

func void dia_regga_flee_info()
{
	AI_Output (self, other, "Dia_regga_Flee_00");	//Warte mal! Du scheinst dich ziemlich frei bewegen zu k�nnen.
	AI_Output (self, other, "Dia_regga_Flee_01");	//Du musst mir helfen! Ich halte es nicht mehr aus.
	AI_Output (other, self, "Dia_regga_Flee_02");	//Was h�lst du nicht mehr aus?
	AI_Output (self, other, "Dia_regga_Flee_03");	//Sekob, er ist ein Menschenschinder! Wir qu�len uns f�r ihn ab, aber er behandelt uns wie Tiere!
	AI_Output (self, other, "Dia_regga_Flee_04");	//Er gibt uns kaum etwas zu essen und wenn wir nicht arbeiten, wird er schnell handgreiflich, besonders bei uns Frauen.
	AI_Output (other, self, "Dia_regga_Flee_05");	//Warum gehst du nicht einfach fort?
	AI_Output (self, other, "Dia_regga_Flee_06");	//Das ist ja das Problem: Ich bin eine schwache Frau, ich k�nnte kaum au�erhalb des Hofes �berleben.
	AI_Output (self, other, "Dia_regga_Flee_07");	//�berall wilde Tiere und Banditen.
	AI_Output (self, other, "Dia_regga_Flee_08");	//Bitte, bring mich hier weg. Ich habe geh�rt, dass es bei Bengar viel besser ist. Kannst du mich zu ihm f�hren?
	Info_ClearChoices (dia_regga_flee);
	Info_AddChoice (dia_regga_flee, "Das ist nicht mein Problem!", dia_regga_flee_notmyprob);
	Info_AddChoice (dia_regga_flee, "Gut, folge mir!", dia_regga_flee_follow);
};

func void dia_regga_flee_notmyprob()
{
	AI_Output (other, self, "Dia_regga_Flee_notmyprob_00");	//Das ist nicht mein Problem!
	AI_Output (self, other, "Dia_regga_Flee_notmyprob_01");	//Du...Du! Geh mir aus den Augen!
	Info_ClearChoices (dia_regga_flee);
	AI_StopProcessInfos (self);
};

func void dia_regga_flee_follow()
{
	AI_Output (other, self, "Dia_regga_Flee_follow_00");	//Gut, folge mir!
	AI_Output (self, other, "Dia_regga_Flee_follow_01");	//Okay!
	Info_ClearChoices (dia_regga_flee);
	Npc_ExchangeRoutine (self, "Follow");
	AI_StopProcessInfos (self);
};


instance DIA_REGGA_BENGAR(C_Info)
{
	npc = BAU_933_Rega;
	nr = 120;
	condition = dia_regga_bengar_condition;
	information = dia_regga_bengar_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_regga_bengar_condition()
{
	if (Npc_GetDistToWP (self, "NW_FARM3_BENGAR") <= 800)
	{
		return TRUE;
	};
};

func void dia_regga_bengar_info()
{
	AI_Output (self, other, "Dia_regga_Bengar_00");	//Wir sind da! Endlich! Du hast mich gerettet!
	AI_Output (self, other, "Dia_regga_Bengar_01");	//Ich habe nicht viel, aber ich schenke dir meinen Gl�cksstein. Hoffentlich bringt er dir genauso viel Gl�ck wie mir!
	CreateInvItems (self, ItMi_Zeitspalt_Addon, 1);
	B_GivePlayerXP (200);
	B_GiveInvItems (self, other, ItMi_Zeitspalt_Addon, 1);
	Npc_ExchangeRoutine (self, "Bengar");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_HALLO		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	3;
	condition	 = 	DIA_Rega_HALLO_Condition;
	information	 = 	DIA_Rega_HALLO_Info;

	description	 = 	"Wie geht's?";
};

func int DIA_Rega_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Rega_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Rega_HALLO_15_00"); //Wie geht's?
	

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_01"); //Du kommst aus der Stadt, nicht wahr?
		}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_02"); //Die bist einer von Onars S�ldnern, nicht wahr?
		}
	else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_03"); //Du bist ein Magier, nicht wahr?
		}
	else
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_04"); //Du bist keiner von uns, nicht wahr?

		};
		
	AI_Output			(self, other, "DIA_Rega_HALLO_17_05"); //Mach lieber, dass du hier wegkommst.
	AI_Output			(other, self, "DIA_Rega_HALLO_15_06"); //Warum?
	AI_Output			(self, other, "DIA_Rega_HALLO_17_07"); //Hier war es zwar fr�her nicht das Paradies, aber zumindest hatte man seine Ruhe, wenn man seine Arbeit f�r Sekob gemacht hat.
	AI_Output			(self, other, "DIA_Rega_HALLO_17_08"); //Aber in letzter Zeit ist es unertr�glich geworden.
	if (Kapitel < 3)
		{
			AI_Output			(self, other, "DIA_Rega_HALLO_17_09"); //�berall Banditen, Feldr�uber zerst�ren die ganze Ernte und der Gro�bauer ist auch immer grausamer geworden.
		};
};


///////////////////////////////////////////////////////////////////////
//	Info onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_ONAR		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	4;
	condition	 = 	DIA_Rega_ONAR_Condition;
	information	 = 	DIA_Rega_ONAR_Info;

	description	 = 	"Hast du Angst vor dem Gro�bauern?";
};

func int DIA_Rega_ONAR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Rega_ONAR_Info ()
{
	AI_Output			(other, self, "DIA_Rega_ONAR_15_00"); //Hast du Angst vor dem Gro�bauern?
	AI_Output			(self, other, "DIA_Rega_ONAR_17_01"); //Klar. Wenn dem Gro�bauer irgendjemand nicht passt, hetzt er seine S�ldner auf ihn und kurze Zeit sp�ter ist man verschwunden.
	AI_Output			(self, other, "DIA_Rega_ONAR_17_02"); //Also h�lt man hier besser die Klappe.

};



///////////////////////////////////////////////////////////////////////
//	Info sld
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_SLD		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	5;
	condition	 = 	DIA_Rega_SLD_Condition;
	information	 = 	DIA_Rega_SLD_Info;

	description	 = 	"Sollten sich die S�ldner nicht um die Feldr�uber k�mmern?";
};

func int DIA_Rega_SLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3)
		{
				return TRUE;
		};
};

func void DIA_Rega_SLD_Info ()
{
	AI_Output			(other, self, "DIA_Rega_SLD_15_00"); //Sollten sich die S�ldner nicht um die Feldr�uber k�mmern?
	AI_Output			(self, other, "DIA_Rega_SLD_17_01"); //Ich wei� nicht, wof�r sie bezahlt werden, aber sicher nicht, um uns kleinen Leuten zu helfen.
	AI_Output			(self, other, "DIA_Rega_SLD_17_02"); //Das Feldr�uberproblem ist Sache der kleinen Bauern, die die Felder bei ihm gepachtet haben.

};


///////////////////////////////////////////////////////////////////////
//	Info banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BANDITEN		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	6;
	condition	 = 	DIA_Rega_BANDITEN_Condition;
	information	 = 	DIA_Rega_BANDITEN_Info;

	description	 = 	"Wie sch�tzt ihr euch vor den Banditen?";
};

func int DIA_Rega_BANDITEN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rega_BANDITEN_Info ()
{
	AI_Output			(other, self, "DIA_Rega_BANDITEN_15_00"); //Wie sch�tzt ihr euch vor den Banditen?
	AI_Output			(self, other, "DIA_Rega_BANDITEN_17_01"); //Gar nicht. Wir laufen weg. Was sonst?

};


///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_BRONKO		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	7;
	condition	 = 	DIA_Rega_BRONKO_Condition;
	information	 = 	DIA_Rega_BRONKO_Info;

	description	 = 	"(nach Bronko fragen)";
};

func int DIA_Rega_BRONKO_Condition ()
{
	if	( 
		(Npc_KnowsInfo(other, DIA_Bronko_HALLO))
		&& (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
		)
			{
					return TRUE;
			};
};

func void DIA_Rega_BRONKO_Info ()
{
	AI_Output			(other, self, "DIA_Rega_BRONKO_15_00"); //Was ist das eigentlich f�r ein grimmiger Typ da?
	AI_Output			(self, other, "DIA_Rega_BRONKO_17_01"); //Sei mir nicht b�se, aber ich will hier keinen �rger, ok? Frag jemand anders.

	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rega_PERMKAP1		(C_INFO)
{
	npc		 = 	BAU_933_Rega;
	nr		 = 	7;
	condition	 = 	DIA_Rega_PERMKAP1_Condition;
	information	 = 	DIA_Rega_PERMKAP1_Info;
	permanent	 = 	TRUE;

	description	 = 	"Lass dich nicht unterkriegen.";
};

func int DIA_Rega_PERMKAP1_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Rega_HALLO))
		{
				return TRUE;
		};
};

func void DIA_Rega_PERMKAP1_Info ()
{
	AI_Output			(other, self, "DIA_Rega_PERMKAP1_15_00"); //Lass dich nicht unterkriegen.

		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_01"); //Du hast gut reden. Du lebst ja auch in der Stadt.
		}
		else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_02"); //Wenn ihr S�ldner ein bisschen ertr�glicher w�rt, dann w�re alles andere nicht so schlimm.
		}
		else if (hero.guild == GIL_KDF)
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_03"); //Von euch Magiern sieht man immer weniger. Ich hoffe, dass du nicht der Letzte bist. Wir brauchen euch. Jetzt mehr denn je.
		}
		else
		{
			AI_Output			(self, other, "DIA_Rega_PERMKAP1_17_04"); //Nicht so einfach, wenn man f�r Sekob, den Menschenschinder, arbeitet.
		};
	AI_StopProcessInfos (self);
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rega_PICKPOCKET (C_INFO)
{
	npc			= BAU_933_Rega;
	nr			= 900;
	condition	= DIA_Rega_PICKPOCKET_Condition;
	information	= DIA_Rega_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40_Female;
};                       

FUNC INT DIA_Rega_PICKPOCKET_Condition()
{
	C_Beklauen (25, 40);
};
 
FUNC VOID DIA_Rega_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rega_PICKPOCKET);
	Info_AddChoice		(DIA_Rega_PICKPOCKET, DIALOG_BACK 		,DIA_Rega_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rega_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rega_PICKPOCKET_DoIt);
};

func void DIA_Rega_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Rega_PICKPOCKET);
};
	
func void DIA_Rega_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rega_PICKPOCKET);
};










