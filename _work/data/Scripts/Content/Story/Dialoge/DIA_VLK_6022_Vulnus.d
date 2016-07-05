var int  DGM;

INSTANCE DIA_VLK_6022_Vulnus_Exit (C_Info) // Fuck Chaosdialog!!
{
    npc         = VLK_6022_Vulnus;
    nr          = 999;
    condition   = DIA_VLK_6022_Vulnus_Exit_condition;
    information = DIA_VLK_6022_Vulnus_Exit_info;
    permanent   = TRUE;
    important   = FALSE;
    description = "ENDE";
};
FUNC INT DIA_VLK_6022_Vulnus_Exit_condition ()
{
    return TRUE;
};
FUNC VOID DIA_VLK_6022_Vulnus_Exit_info ()
{
    AI_StopProcessInfos(self);
};

INSTANCE DIA_Vlk_6022_Vulnus_hiduei (C_Info)
{
    npc         = VLK_6022_Vulnus;
    nr          = 2;
    condition   = DIA_VLK_6022_Vulnus_hiduei_condition;
    information = DIA_VLK_6022_Vulnus_hiduei_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Hi.";
};

FUNC INT DIA_VLK_6022_Vulnus_hiduei_condition ()
{

    return TRUE;

};
FUNC VOID DIA_VLK_6022_Vulnus_hiduei_info ()
{
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_hiduei_15_0"); //Hi.
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_hiduei_15_1"); //Sei gegrüßt mein Sohn-
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_hiduei_15_2"); //Du redest wie ein Magier!
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_hiduei_15_3"); //Ich bin auch einer. Oder warum denkst du, trage ich eine Robe? 	
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_hiduei_15_4"); //Hmm. Ich habe schon Schwarzmagier, Feuermagier und Wassermagier gesehen, aber deine Robe sieht nach was anderem aus...
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_hiduei_15_5"); //Du hast Recht. Ich bin ein Magier der Götter. Nicht nur eines Gottes, sondern aller drei. 
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_hiduei_15_6"); //Wie geht denn das? Bestraft Innos dich nicht, dass du Beliar anbetest? 
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_hiduei_15_7"); //Ich bin für die Götter ein Bote. Ein Bindeglied, dass sie alle zusammenhält. 
};

INSTANCE DIA_Vlk_VLK_6022_Vulnus_ausbildena (C_Info)
{
    npc         = VLK_6022_Vulnus;
    nr          = 2;
    condition   = DIA_VLK_6022_Vulnus_ausbildena_condition;
    information = DIA_VLK_6022_Vulnus_ausbildena_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Und was ist deine Aufgabe?";
};

FUNC INT DIA_VLK_6022_Vulnus_ausbildena_condition ()
{
if (Npc_KnowsInfo (other,DIA_VLK_6022_Vulnus_hiduei))
{
    return TRUE;
};
};

FUNC VOID DIA_VLK_6022_Vulnus_ausbildena_info ()
{
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_ausbildena_15_0"); //Und was ist deine Aufgabe?
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_ausbildena_15_1"); //Ich wache über das magische Feuer.
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_ausbildena_15_2"); //Das was?
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_ausbildena_15_3"); //Ich meine den roten Zauber. Da vorne. Ich habe ihn vor ein paar Jahren von Pyrokar gekauft.
};

INSTANCE DIA_Vlk_6022_Vulnus_ausbilden (C_Info)
{
    npc         = VLK_6022_Vulnus;
    nr          = 2;
    condition   = DIA_VLK_6022_Vulnus_ausbilden_condition;
    information = DIA_VLK_6022_Vulnus_ausbilden_info;
    permanent   = FALSE;
    important   = FALSE;
    description = "Kannst du mich in der Drei-Götter-Magie ausbilden?";
};

FUNC INT DIA_VLK_6022_Vulnus_ausbilden_condition ()
{
if (Npc_KnowsInfo (other,DIA_VLK_6022_Vulnus_hiduei))
{
    return TRUE;
};
};
FUNC VOID DIA_VLK_6022_Vulnus_ausbilden_info ()
{
	AI_Output(other,self,"DIA_VLK_6022_Vulnus_ausbilden_15_0"); //Kannst du mich in der Drei-Götter-Magie ausbilden?
	AI_Output(self,other,"DIA_VLK_6022_Vulnus_ausbilden_15_1"); //Vielleicht irgendwann mal...
};



INSTANCE DIA_Vulnus_TEACH (C_INFO)
{
	npc         = VLK_6022_Vulnus;
	nr          = 2;
	condition   = DIA_Vulnus_TEACH_Condition;
	information = DIA_Vulnus_TEACH_Info;
	permanent   = TRUE;
	description = "Was kannst du mir beibringen?";
};
FUNC INT DIA_Vulnus_TEACH_Condition()
{	
	if (hero.guild == GIL_STRF)
	|| (hero.guild == GIL_BAU)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Vulnus_TEACH_Info()
{
	AI_Output (other, self,"DIA_Vulnus_TEACH_15_00"); //Was kannst du mir beibringen?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_10_01"); //Tut mir Leid. Es gibt nichts mehr, was ich dir beibringen kann.
	}
	else
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_10_02"); //Ich kenne einige - triff deine Wahl selbst.
		
		Info_ClearChoices (DIA_Vulnus_TEACH);
		Info_AddChoice (DIA_Vulnus_TEACH, DIALOG_BACK, DIA_Vulnus_TEACH_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Essenz der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Vulnus_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Extrakt der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Vulnus_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Elixier der Heilung", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Vulnus_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Elixier des Lebens", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Vulnus_TEACH_PermHealth);            
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)                                                                                                                                   
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Mana Essenz", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Vulnus_TEACH_Mana01);                  
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)   
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)                                                                                                                                                                                                                                                                  
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Mana Extrakt", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Vulnus_TEACH_Mana02);                 
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Vulnus_TEACH, B_BuildLearnString ("Elixier der Stärke", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Vulnus_TEACH_PermSTR);               
	};
};

func void DIA_Vulnus_TEACH_BACK()
{
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_Health01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_Health01_10_00"); //Die Zutaten für eine Essenz der Heilung sind Heilpflanzen und Feldknöterich.
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_Health02_10_00"); //Um ein Extrakt der Heilung herzustellen, brauchst du Heilkräuter und Feldknöterich.
		AI_Output (self, other,"DIA_Vulnus_TEACH_Health02_10_01"); //Du musst aufpassen, dass du den Extrakt sehr vorsichtig erhitzt.
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_Health03_10_00"); //Das Elixier der Heilung herzustellen, erfordert einiges an Erfahrung.
		AI_Output (self, other,"DIA_Vulnus_TEACH_Health03_10_01"); //Du brauchst Heilwurzeln und Feldknöterich. Sei diesmal beim Erhitzen besonders vorsichtig.
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_PermHealth_10_00"); //Das Elixier des Lebens! Ein seltenes Gebräu. Nicht so sehr wegen des Aufwandes - der Trank ist recht einfach herzustellen.
		AI_Output (self, other,"DIA_Vulnus_TEACH_PermHealth_10_01"); //Aber die Zutaten sind sehr selten. Du brauchst Heilwurzeln und Kronstöckel.
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_Mana01_10_00"); //Die Essenz der Magie ist der einfachste der magischen Tränke.
		AI_Output (self, other,"DIA_Vulnus_TEACH_Mana01_10_01"); //Nimm Feuernesseln und Feldknöterich und erhitze sie langsam.
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Vulnus_TEACH_Mana02_10_00"); //Da du schon einen Essenz der Magie herstellen kannst, wird es dir mit etwas Mühe sicher auch gelingen, einen Extrakt herzustellen.
	 	AI_Output (self, other,"DIA_Vulnus_TEACH_Mana02_10_01"); //Aber du brauchst das richtige Fingerspitzengefühl, wenn du den Sud auskochst. Nimm Feuerkraut und Feldknöterich für diesen Trank.
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};
func void DIA_Vulnus_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Vulnus_TEACH_PermSTR_10_00"); //Das Elixier der Stärke! Ein meisterlicher Trank. Du brauchst die seltenen Drachenwurzeln und Kronstöckl.
		AI_Output (self, other,"DIA_Vulnus_TEACH_PermSTR_10_01"); //Wenn du den Sud aufkochst, achte darauf, dass die Bläschen nicht zu groß werden, sonst erlebst du dein blaues Wunder!
	};
	Info_ClearChoices (DIA_Vulnus_TEACH);
};