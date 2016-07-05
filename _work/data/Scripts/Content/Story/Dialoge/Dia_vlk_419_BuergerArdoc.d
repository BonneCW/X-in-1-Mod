var int Blood_allow;

//////////////////////////////////////////////////////////// 
//////////////             Exit 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_Exit   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =999; 
   condition   =   Dia_Ardoc_Kahr_Exit_condition; 
   information     = Dia_Ardoc_Kahr_Exit_info; 
   important     = FALSE; 
Permanent = TRUE; 
Description =DIALOG_ENDE; 
}; 
 
func int Dia_Ardoc_Kahr_Exit_condition () 
{ 
return TRUE; 
}; 
 
func void Dia_Ardoc_Kahr_Exit_info () 
{ 
AI_StopProcessInfos (self); 
}; 

//////////////////////////////////////////////////////////// 
//////////////             hallo 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_hallo   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =998; 
   condition   =   Dia_Ardoc_Kahr_hallo_condition; 
   information     = Dia_Ardoc_Kahr_hallo_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Hallo"; 
}; 
 
func int Dia_Ardoc_Kahr_hallo_condition () 
{ 
if (Npc_KnowsInfo(other,Dia_Lea_Schaedel)) 
{
return TRUE;
}; 
}; 
 
func void Dia_Ardoc_Kahr_hallo_info () 
{ 
AI_Output (other,self,"Dia_Ardoc_Kahr_hallo_11");  //Hallo.
 AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_00");  //Wer bist du? Was willst du hier? 
   AI_Output (other,self,"Dia_Ardoc_Kahr_hallo_01");  //Lea schickt mich zu dir. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_02");  //Ja, stimmt! Ich fühle es auch, du bist ein Vampir. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_03");  //Was verschlägt dich hierher? 
   AI_Output (other,self,"Dia_Ardoc_Kahr_hallo_04");  //Jemand hat mich vor nicht allzu langer Zeit zum Vampir gemacht. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_05");  //Seltsam. Wie sind de einzigen Vampire auf Khorinis und wir machen keine neuen Mitglieder. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_06");  //Khorinis kann uns gerade noch gut versorgen, mit mehr Vampiren, gäbe es nur Streitereien und Hunger. 
   AI_Output (other,self,"Dia_Ardoc_Kahr_hallo_07");  //Aber jemand hat mich zum Vampir gemacht! Er trug einen schwarzen Umhang und sein Gesicht war vermummt. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_08");  //(Nachdenklich) Hm... Also da weiß ich selbs nicht weiter. Keiner von uns würde sowas machen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_09");  //Es muss noch einen Vampir auf Khorinis geben. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_hallo_10");  //Und er scheint sehr vorsichtig vorzugehen, sonst häten wir ihn schon bemerkt.
}; 

//////////////////////////////////////////////////////////// 
//////////////             was_nun 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_was_nun   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =997; 
   condition   =   Dia_Ardoc_Kahr_was_nun_condition; 
   information     = Dia_Ardoc_Kahr_was_nun_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Was nun?"; 
}; 
 
func int Dia_Ardoc_Kahr_was_nun_condition () 
{ 
if(Npc_KnowsInfo(other,Dia_Ardoc_Kahr_hallo)) 
{
	return TRUE; 
};
}; 
 
func void Dia_Ardoc_Kahr_was_nun_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_Kahr_was_nun_00");  //Was nun? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_01");  //Naja, erst müssen wir uns um dich kümmern. Am besten wäre, wenn du uns beitrittst. 
   AI_Output (other,self,"Dia_Ardoc_Kahr_was_nun_02");  //Was mus ich tun um bei euch aufgenommen zu werden? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_03");  //Ich gebe dir erstmal einen Auftrag, den du erfüllen sollst. Dann sehen wir weiter. 
   AI_Output (other,self,"Dia_Ardoc_Kahr_was_nun_04");  //Was soll ich machen? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_05");  //Dimitri, einer von uns, sollte mir ein Packet bringen. Eigentlich hätte er schon längst hier sein müssen.  
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_06");  //Du sollst ihn finden und das Paket zu mir bringen. 
  Log_CreateTopic (Ardoc_Paket,LOG_MISSION);
		Log_SetTopicStatus (Ardoc_Paket,LOG_RUNNING);
		B_LogEntry (Ardoc_Paket,"Ardoc will, dass ich Dimitri und ein Paket, dass er Ardoc bringen sollte, finde.");
		Ardocspaket=TRUE;
		
}; 

//////////////////////////////////////////////////////////// 
//////////////             was_nun 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_wo   (C_INFO) 
{ 
   npc     = VLK_419_Buerger;   
   nr          =996; 
   condition   =   Dia_Ardoc_Kahr_wo_condition; 
   information     = Dia_Ardoc_Kahr_wo_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Wo soll ich suchen?"; 
}; 
 
func int Dia_Ardoc_Kahr_wo_condition () 

{ 
   IF (ArdocsPaket == TRUE) 
   && (Pak == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Kahr_wo_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_Kahr_was_nun_08");  //Wo soll ich suchen? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_09");  //Fang am besten bei Orlans Taverne an.  
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_10");  //Dimitri ist ein Säufer. Er hielt sich immer dort auf. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_was_nun_11");  //(lacht) Vielleicht steht er  da und besäuft sich wiedermal. 
   B_LogEntry (Ardoc_Paket,"Ich sollte meine Suche in Orlans Taverne beginnen.");
}; 

//////////////////////////////////////////////////////////// 
//////////////             Hab_Paket 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_Hab_Paket   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =990; 
   condition   =   Dia_Ardoc_Kahr_Hab_Paket_condition; 
   information     = Dia_Ardoc_Kahr_Hab_Paket_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Ich habe das Paket"; 
}; 
 
func int Dia_Ardoc_Kahr_Hab_Paket_condition () 
{ 
   IF (Npc_HasItems(other,ITMI_Ardocspaket) >= 1 ) 
   && (ArdocsPaket == TRUE) 
   { 
   return TRUE; 
   }; 
}; 
 func void Dia_Ardoc_Kahr_Hab_Paket_weiter()
{
 AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_00");  //Aber egal, du hast die Aufgabe erfüllt. 
   AI_Output (other,self,"Dia_Ardoc_Kahr_Hab_Paket_01");  //Wie gehts jetzt weiter? 
   
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_02");  //Jetzt werde ich dir 3 Fragen stellen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_03");  //Nach den Antworten wirst du selbst suchen müssen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_04");  //Wenn du die Antworten hast, kehrst du zu mir zurück und beantwortest mir die Fragen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_05");  //Wenn du alle fragen richtig beantwortet hast, hast du alle Bedingungen erfüllt in unserem Clan aufgenommen zu weden. 
pak = TRUE;
B_GiveInvItems (other,self, ITMI_Ardocspaket,1);

};
 
func void Dia_Ardoc_Kahr_Hab_Paket_info () 
{ 
    AI_Output (other,self,"Dia_Ardoc_Kahr_Hab_Paket_Hab_Paket_00");  //Ich habe das Paket. 
   
    CreateInvItems(self, Itam_Vampirset1,1);
    
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_Hab_Paket_01");  //Gut gemacht! Was war mit Dimitri? 
   Log_SetTopicStatus (ARdoc_Paket,LOG_SUCCESS);
		B_GivePlayerXP(250);
		
  Info_ClearChoices (Dia_Ardoc_Kahr_Hab_Paket); 
  Info_AddChoice (Dia_Ardoc_Kahr_Hab_Paket, "Er hat das Paket verloren und mir bei der Suche geholfen.", Dia_Ardoc_Kahr_Hab_Paket_geholfen); 
  Info_AddChoice (Dia_Ardoc_Kahr_Hab_Paket, "Er hat das Paket verloren und sich dann in der Taverne besoffen.", Dia_Ardoc_Kahr_Hab_Paket_besoffen); 
 
}; 
 
func void Dia_Ardoc_Kahr_Hab_Paket_geholfen () 
{ 
Info_ClearChoices (Dia_Ardoc_Kahr_Hab_Paket); 
     AI_Output (other,self,"Dia_Ardoc_Kahr_Hab_Paket_geholfen_00");  //Er hat das Paket auf dem Weg hierher verloren.  
   AI_Output (other,self,"Dia_Ardoc_Kahr_Hab_Paket_geholfen_01");  //Ich traf ihn und dann haben wir gemeinsam nach dem Paket gesucht, bis wir es fanden. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_geholfen_02");  //Dimitri hat dann wohl mitgeholfen, hätte es nicht von ihm erwartet. 
Dimitri_geholfen=TRUE;
Dia_Ardoc_Kahr_Hab_Paket_weiter();
}; 
 
func void Dia_Ardoc_Kahr_Hab_Paket_besoffen () 
{ 
Info_ClearChoices (Dia_Ardoc_Kahr_Hab_Paket); 
 AI_Output (other,self,"Dia_Ardoc_Kahr_Hab_Paket_geholfen_00");  //Er hat das Paket auf dem Weg hierher verloren. 
   AI_Output (other,self,"Dia_Ardoc_Kahr_Hab_Paket_gesoffen_01");  //Doch anstatt gründlich zu suchen hat er sich in der Taverne besoffen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Hab_Paket_gesoffen_02");  //Nun ja, hätte es auch nicht anders von ihm erwartet. 
 Dimitri_besoffen=TRUE;
  Dia_Ardoc_Kahr_Hab_Paket_weiter();
}; 



//////////////////////////////////////////////////////////// 
//////////////             Fragen_stellen 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_Fragen_stellen   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =989; 
   condition   =   Dia_Ardoc_Kahr_Fragen_stellen_condition; 
   information     = Dia_Ardoc_Kahr_Fragen_stellen_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Stelle die Fragen"; 
}; 
 
func int Dia_Ardoc_Kahr_Fragen_stellen_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardoc_Kahr_Hab_Paket)) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Kahr_Fragen_stellen_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_Kahr_Fragen_stellen_00");  //Stelle die Fragen 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Fragen_stellen_01");  //Gut, hör genau zu: 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Fragen_stellen_02");  //Wer hat die Pyramide im Nordosten erbaut? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Fragen_stellen_03");  //In welcher Sternenkonstellation befinden wir uns? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Fragen_stellen_04");  //Wann starb mein Bruder? 
 Log_CreateTopic (Ardoc_Fragen,LOG_MISSION);
		Log_SetTopicStatus (Ardoc_Fragen,LOG_RUNNING);
		B_LogEntry (Ardoc_Fragen,"Ardoc hat mir 3 Fragen gestellt, dessen Antworten ich suchen muss: Wer hat die Pyramide im Nordosten erbaut?,In welcher Sternenkonstellation befinden wir uns?, Wann starb mein Bruder?");

Brothersdeath = TRUE;
}; 


//////////////////////////////////////////////////////////// 
//////////////             Die_Fragen 
/////////////////////////////////////////////////////// 

func void Dia_Ardoc_Kahr_Die_Fragen_ende()
{
	if (Fragen_Richtig >=5)
	{
	AI_Output (self, other,"Dia_Ardoc_Kahr_Die_Fragen_ende_00");  //Ausgezeichnet!  
        AI_Output (self, other,"Dia_Ardoc_Kahr_Die_Fragen_ende_01");  //Du hast Alles richtig beantwortet! 
        AI_Output (self, other,"Dia_Ardoc_Kahr_Die_Fragen_ende_02");  //Du hast alle Bedingungen erfüllt um bei uns aufgenommen zu werden. 
        AI_Output (self, other,"Dia_Ardoc_Kahr_Die_Fragen_ende_03");  //Jetzt kannst du das Blutritual duchführen. 
       
        
        Blood_allow = TRUE;
        Log_SetTopicStatus (Ardoc_Fragen,LOG_SUCCESS);
        B_GivePlayerXP(400);
        Brothersdeath = FALSE;
	
	}
	else
	{
	 AI_Output (self, other,"Dia_Ardoc_Kahr_Die_Fragen_ende_04");  //Nein, das war nicht komplett richtig. 
         AI_Output (self, other,"Dia_Ardoc_Kahr_Die_Fragen_ende_05");  //Aber du kannst es nochmal versuchen. 
         Fragen_richtig = 0;
         AI_StopProcessInfos(self);
         
	};

};
func void Dia_Ardoc_Kahr_Die_Fragen_3_3()
{
Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "7", Dia_Ardoc_Kahr_Die_Fragen_nr3_7); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "4", Dia_Ardoc_Kahr_Die_Fragen_nr3_4); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "5", Dia_Ardoc_Kahr_Die_Fragen_nr3_5); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "3", Dia_Ardoc_Kahr_Die_Fragen_nr3_3); 
 
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr3_7 () 
{ 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_4_01");  //7
  Dia_Ardoc_Kahr_Die_Fragen_ende();
  
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr3_4 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_4_02");  //4
  Dia_Ardoc_Kahr_Die_Fragen_ende();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr3_5 () 

{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_4_03");  //5
   Fragen_richtig =  Fragen_richtig+1;
   Dia_Ardoc_Kahr_Die_Fragen_ende();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr3_3 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_03");  //3
  Dia_Ardoc_Kahr_Die_Fragen_ende();
}; 
func void Dia_Ardoc_Kahr_Die_Fragen_3_2 ()
{
Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "8", Dia_Ardoc_Kahr_Die_Fragen_nr2_8); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "6", Dia_Ardoc_Kahr_Die_Fragen_nr2_6); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "4", Dia_Ardoc_Kahr_Die_Fragen_nr2_4); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "1", Dia_Ardoc_Kahr_Die_Fragen_nr2_1); 
 
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr2_8 () 
{ 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_07");  //8
  Fragen_richtig =  Fragen_richtig+1;
  Dia_Ardoc_Kahr_Die_Fragen_3_3();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr2_6 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_08");  //6
  Dia_Ardoc_Kahr_Die_Fragen_3_3();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr2_4 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_09");  //4
  Dia_Ardoc_Kahr_Die_Fragen_3_3();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr2_1 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_10");  //1
  Dia_Ardoc_Kahr_Die_Fragen_3_3 ();
}; 
func void Dia_Ardoc_Kahr_Die_Fragen_3 ()
{
AI_Output (self,other,"Dia_Ardoc_Kahr_Die_Fragen_3_01");  //Wann starb mein Bruder?
 Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "7", Dia_Ardoc_Kahr_Die_Fragen_nr1_7); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "3", Dia_Ardoc_Kahr_Die_Fragen_nr1_3); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "6", Dia_Ardoc_Kahr_Die_Fragen_nr1_6); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "4", Dia_Ardoc_Kahr_Die_Fragen_nr1_4); 
 
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr1_7 () 
{ 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_02");  //7
  Dia_Ardoc_Kahr_Die_Fragen_3_2 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr1_3 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_03");  //3
  Dia_Ardoc_Kahr_Die_Fragen_3_2 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr1_6 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_04");  //6
  Fragen_richtig =  Fragen_richtig+1;
  Dia_Ardoc_Kahr_Die_Fragen_3_2 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_nr1_4 () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_3_05");  //4
  Dia_Ardoc_Kahr_Die_Fragen_3_2 ();
}; 

func void Dia_Ardoc_Kahr_Die_Fragen_2 ()
{
AI_Output (self,other,"Dia_Ardoc_Kahr_Die_Fragen_2_01");  //In welcher Stenenkonstellation befinden wir uns?
 Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "Feuer und Wasser", Dia_Ardoc_Kahr_Die_Fragen_wasser); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "Ochse und Krieger", Dia_Ardoc_Kahr_Die_Fragen_Krieger); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "Drache und Schwert", Dia_Ardoc_Kahr_Die_Fragen_Schwert); 
 
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_wasser () 
{ 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_2_03");  //Feuer und Wasser.
  Dia_Ardoc_Kahr_Die_Fragen_3 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_Krieger () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_2_04");  //Ochse und Krieger.
  Fragen_richtig =  Fragen_richtig+1;
  Dia_Ardoc_Kahr_Die_Fragen_3 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_Schwert () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_2_05");  //Drache und Schwert.
  Dia_Ardoc_Kahr_Die_Fragen_3 ();
}; 

instance Dia_Ardoc_Kahr_Die_Fragen   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =988; 
   condition   =   Dia_Ardoc_Kahr_Die_Fragen_condition; 
   information     = Dia_Ardoc_Kahr_Die_Fragen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Ich bin bereit deine Fragen zu beantworten"; 
}; 
 
func int Dia_Ardoc_Kahr_Die_Fragen_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardoc_Kahr_Fragen_stellen)) 
   && (Blood_allow == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_00");  //Ich bin bereit deine Fragen zu beantworten 
   AI_Output (self,other,"Dia_Ardoc_Kahr_Die_Fragen_01");  //Nun gut: Wer hat die Pyramide im Nordosten erbaut? 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "Eine alte Kultur", Dia_Ardoc_Kahr_Die_Fragen_Kultur); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "Die Orks", Dia_Ardoc_Kahr_Die_Fragen_Orks); 
  Info_AddChoice (Dia_Ardoc_Kahr_Die_Fragen, "Die Wassermagier", Dia_Ardoc_Kahr_Die_Fragen_Wassermagier); 
 
}; 
func void Dia_Ardoc_Kahr_Die_Fragen_Kultur () 
{ 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_02");  //Eine alte Kultur.
  Fragen_richtig =  Fragen_richtig+1;
  Dia_Ardoc_Kahr_Die_Fragen_2 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_Orks () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_03");  //Die Orks.
  Dia_Ardoc_Kahr_Die_Fragen_2 ();
}; 
 
func void Dia_Ardoc_Kahr_Die_Fragen_Wassermagier () 
{ 
 
  Info_ClearChoices (Dia_Ardoc_Kahr_Die_Fragen); 
  AI_Output (other,self,"Dia_Ardoc_Kahr_Die_Fragen_04");  //Die Wassermagier.
  Dia_Ardoc_Kahr_Die_Fragen_2 ();
}; 



//////////////////////////////////////////////////////////// 
//////////////             Blutritual 
/////////////////////////////////////////////////////// 
instance Dia_Ardok_Kahr_Blutritual   (C_INFO) 
{ 
   npc     = VLk_419_Buerger; 
   nr          =800; 
   condition   =   Dia_Ardok_Kahr_Blutritual_condition; 
   information     = Dia_Ardok_Kahr_Blutritual_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Blutritual?"; 
}; 
 
func int Dia_Ardok_Kahr_Blutritual_condition () 
{ 
   IF (Blood_allow == TRUE) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardok_Kahr_Blutritual_info () 
{ 
   AI_Output (other,self,"Dia_Ardok_Kahr_Blutritual_00");  //Blutritual? 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_01");  //Es ist ein uraltes Ritual, dass die Gründer unseres Clans eingeführt haben. Wenn du es vollzogen hast, bist du ein vollwertiges Mitglied. 
   AI_Output (other,self,"Dia_Ardok_Kahr_Blutritual_02");  //Und wie funktioniert es? 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_03");  //Hör genau zu: Also, zuerst gehst du zum Steinkreis nahe Onars Hof. Du stellst dich mitten auf das Altar in der Mitte. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_04");  //Dabei musst du genau darauf achten, dass du wirklich ganau in der Mitte stehst. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_05");  //Dann beobachtest du den Mond. Genau in dem Augenblick, in dem der obere Rand der Mondscheibe hinter dem südlichen Steinbogen verschwunden ist, opferst du ein Schaf, indem du es tötest. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_06");  //Am besten ist natürlich, wenn du dir das Schaf vorher kaufst und mit zum Steinkreis nimmst. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_07");  //Das Blut des Schafes, das unter diesen besonderen Umständen geopfert wurde ist etwas besonderes. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_08");  //Du zapfst es in eine Flasche ab. Dann wendest du dich dem zweiten Teil des Rituals zu. 
 Log_CreateTopic (das_Blutritual,LOG_MISSION);
		Log_SetTopicStatus (das_Blutritual,LOG_RUNNING);
		B_LogEntry (das_Blutritual,"Um ein vollständiges Mitglied in Ardocs Clan zu werden muss ich das Blutritual durchführen. Ich soll mich mitten auf das Altar im Steinkreis bei Onars Hof stellen und warten, bis der obere Rand der Mondscheibe hinter dem südlichen Steinbogen verschwunden ist und genau dann ein Schaf schlachten und sein Blut in eine Flasche füllen.");
}; 






//////////////////////////////////////////////////////////// 
//////////////             Blutritual 
/////////////////////////////////////////////////////// 
instance Dia_Ardok_Kahr_Blutritual_2   (C_INFO) 
{ 
   npc     = VLk_419_Buerger; 
   nr          =895; 
   condition   =   Dia_Ardok_Kahr_Blutritual_2_condition; 
   information     = Dia_Ardok_Kahr_Blutritual_2_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Was ist der zweite Teil?"; 
}; 
 
func int Dia_Ardok_Kahr_Blutritual_2_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardok_Kahr_Blutritual)) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardok_Kahr_Blutritual_2_info () 
{ 
   AI_Output (other,self,"Dia_Ardok_Kahr_Blutritual_2_00");  //Was ist der zweite Teil? 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_2_01");  //Der zweite Teil läuft ähnlich ab: Du gehst zum Steinkreis von Lobarts Hof und stellst dich mitten in den Steinbogen, der genau zu seinem Hof zeigt. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_2_02");  //Aber achte darauf, dass du genau in der Mitte des Steinbgens stehst. Bei Astronomie muss man sehr genau sein. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_2_03");  //Jetzt wartest du, bis der untere Rand der Mondscheibe den oberen Rand des gegenüberliegenden Steinbogens berührt. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_2_04");  //Genau zu diesem Zeitpunkt stichst du dir mit dem Ritualmesser in den Arm und füllst das Blut in ein Fläschchen. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_2_05");  //Anschließend hast du zwei Fläschchen, eins mit deinem und eins mit dem Schafblut. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_2_06");  //Diese vermischst du an einem Alchemitisch und bringst es mir dann. 
   B_GiveInvItems (self,other, itwr_ritual_1, 1);
 B_LogEntry (das_Blutritual,"Anschließend muss ich zum Steikreis nahe Lobarts Hof. Ich soll mich mitten in den Steinbogen stellen der genau zu seinem Hof zeigt und warten bis der untere Rand der Mondscheibe den oberen Rand des gegenüberligenden Steinbogens berührt. Dann soll ich mich in den Arm stechen und das Blut in eine Flasche abfüllen. Das Blut beider Flaschen muss ich an einem Alchemietisch vermischen und zu Ardoc bringen.");
};
//////////////////////////////////////////////////////////// 
//////////////             Blutritual_3 
/////////////////////////////////////////////////////// 
instance Dia_Ardok_Kahr_Blutritual_3   (C_INFO) 
{ 
   npc     = VLk_419_Buerger; 
   nr          =895; 
   condition   =   Dia_Ardok_Kahr_Blutritual_3_condition; 
   information     = Dia_Ardok_Kahr_Blutritual_3_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Woher bekomme ich ein Schaf?"; 
}; 
 
func int Dia_Ardok_Kahr_Blutritual_3_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardok_Kahr_Blutritual_2)) 
   && (Vampirgilde == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardok_Kahr_Blutritual_3_info () 
{ 
   AI_Output (other,self,"Dia_Ardok_Kahr_Blutritual_3_00");  //Woher bekomme ich ein Schaf? 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_3_01");  //Da musst du die Bauern fragen, die verkaufen bestimmt welche. 
   B_LogEntry (das_Blutritual,"Ein Schaf kann ich bei den Bauern kaufen.");

 
}; 
//////////////////////////////////////////////////////////// 
//////////////             Blutritual_4 
/////////////////////////////////////////////////////// 
instance Dia_Ardok_Kahr_Blutritual_4   (C_INFO) 
{ 
   npc     = VLk_419_Buerger; 
   nr          =892; 
   condition   =   Dia_Ardok_Kahr_Blutritual_4_condition; 
   information     = Dia_Ardok_Kahr_Blutritual_4_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Woher bekomme ich ein Ritualmesser?"; 
}; 
 
func int Dia_Ardok_Kahr_Blutritual_4_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardok_Kahr_Blutritual_2)) 
   && (Vampirgilde == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardok_Kahr_Blutritual_4_info () 
{ 
   AI_Output (other,self,"Dia_Ardok_Kahr_Blutritual_4_00");  //Woher bekomme ich ein Ritualmesser? 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_4_01");  //Stimmt, das Ritualmesser hatte ich ganz vergessen. 
   AI_Output (self, other,"Dia_Ardok_Kahr_Blutritual_4_02");  //Frag mal Berox, den Söldner oder Dimitri. Einer von ihnen müsste es haben. 
  B_LogEntry (das_Blutritual,"Das Ritualmesser müsste Berox oder Dimitri haben. Ich werde sie Fragen müssen");

}; 

//////////////////////////////////////////////////////////// 
//////////////             Mitglied 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_Mitglied   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =850; 
   condition   =   Dia_Ardoc_Kahr_Mitglied_condition; 
   information     = Dia_Ardoc_Kahr_Mitglied_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Ich habe das Blutgemisch!"; 
}; 
 
func int Dia_Ardoc_Kahr_Mitglied_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardok_Kahr_Blutritual)) 
   && (Npc_HasItems(other,ItPo_Blood_mix) >= 1 ) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Kahr_Mitglied_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_Kahr_Mitglied_00");  //Ich habe das Blutgemisch! 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_01");  //Zeig mal her! 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_02");  //Hmm... Jaaa... Du hast das Blutritual korrekt vollzogen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_03");  //Jetzt musst du nur noch den Schwur leisten. Sprich mir nach:
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_04");  //Hiermit schwöre ich,
   AI_Output (other,self,"Dia_Ardoc_Kahr_Mitglied_05");  //Hiermit schwöre ich,
   
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_06");  //dass ich dem Clan treu dienen werde,
   AI_Output (other,self,"Dia_Ardoc_Kahr_Mitglied_07");  //dass ich dem Clan treu dienen werde,
   
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_08");  //dass das Geheimnis bewahre,
   AI_Output (other,self,"Dia_Ardoc_Kahr_Mitglied_09");  //dass das Geheimnis bewahre,
   
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_10");  //dass ich meine Opfer nicht im Blutrausch töte,
   AI_Output (other,self,"Dia_Ardoc_Kahr_Mitglied_11");  //dass ich meine Opfer nicht im Blutrausch töte,
   
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_12");  //und dass ich das Leben ehre.
   AI_Output (other,self,"Dia_Ardoc_Kahr_Mitglied_13");  //und dass ich das Leben ehre.
   
   AI_Output (self, other,"Dia_Ardoc_Kahr_Mitglied_14");  //Herzlichen Glückwunsch! Du bist jetzt ein vollwertiges Mitglied des Silverclans!
   
   B_GiveInvItems (other, self, ITPO_Blood_mix, 1);
  Vampirgilde = TRUE;
  Log_SetTopicStatus (das_Blutritual,LOG_SUCCESS);
  B_GivePlayerXP(400); 
  B_GiveInvItems(self, other, ItRu_SumWolf , 1);
}; 
//////////////////////////////////////////////////////////// 
//////////////             What_to_do 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_What_to_do   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =849; 
   condition   =   Dia_Ardoc_Kahr_What_to_do_condition; 
   information     = Dia_Ardoc_Kahr_What_to_do_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Und jetzt? Was ist mit dem Vampirkerl?"; 
}; 
 
func int Dia_Ardoc_Kahr_What_to_do_condition () 
{ 
   IF (Vampirgilde == TRUE) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Kahr_What_to_do_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_Kahr_What_to_do_00");  //Und jetzt? Was ist mit dem Vampirkerl? 
   AI_Output (self, other,"Dia_Ardoc_Kahr_What_to_do_01");  //Alles zu seiner Zeit. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_What_to_do_02");  //Wir halten die Augen auf, irgendwann muss er auffallen. Wir werden ihn schon kriegen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_What_to_do_03");  //Ich gebe dir jetzt erstmal einen Auftrag: Die Wassermagier, scheinen einen alten Tempel nahe der Pyramide ausgebuddelt zu haben.  
   AI_Output (self, other,"Dia_Ardoc_Kahr_What_to_do_04");  //Finde heraus, was es damit auf sich hat und komm dann zu mir! 
   AI_Output (other,self,"Dia_Ardoc_Kahr_What_to_do_05");  //Geht klar! 
   Mis_die_WMS = TRUE;
 Log_CreateTopic (die_WMs,LOG_MISSION);
		Log_SetTopicStatus (die_WMs,LOG_RUNNING);
		B_LogEntry (die_WMs,"Ich soll für Ardoc herausfinden, was die Wassermagier ausgegraben haben.");
}; 

//////////////////////////////////////////////////////////// 
//////////////             Kultur 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_Kahr_Kultur   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =848; 
   condition   =   Dia_Ardoc_Kahr_Kultur_condition; 
   information     = Dia_Ardoc_Kahr_Kultur_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Die Wassermagier haben ein Portal entdeckt"; 
}; 
 
func int Dia_Ardoc_Kahr_Kultur_condition () 
{ 
   if (Nefarius_Info == TRUE)
   && (Vampirgilde == TRUE) 
	
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Kahr_Kultur_info () 
{ 
    AI_Output (other,self,"Dia_Ardoc_Kahr_Kultur_00");  //Die Wassermagier haben ein Portal entdeckt, dass zu enem unbekannten Teil der Insel führen soll! 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Kultur_01");  //Ein unbekannter Teil der Insel? Ich habe nie davon gehört! 
   AI_Output (other,self,"Dia_Ardoc_Kahr_Kultur_02");  //Es ist aber war, im Tempel befindet sich ein riesiges Portal! 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Kultur_03");  //Nun gut, du sollst für mich durch das Portal gehen. 
   AI_Output (self, other,"Dia_Ardoc_Kahr_Kultur_04");  //Vielleicht gibts auf der anderen Seite etwas wirklich interessantes! Wenn du etwas findest, erstatte mir Bericht!
Log_SetTopicStatus (die_WMs,LOG_SUCCESS);
 B_GivePlayerXP(250); 
 
}; 
//////////////////////////////////////////////////////////// 
//////////////             Ornament 
/////////////////////////////////////////////////////// 
var int PC_got_ORNAMENT;
instance Dia_Ardoc_kahr_Ornament   (C_INFO) 
{ 
   npc     = vlk_419_buerger; 
   nr          =820; 
   condition   =   Dia_Ardoc_kahr_Ornament_condition; 
   information     = Dia_Ardoc_kahr_Ornament_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Ich möchte das Ornament haben, dass du Lord Hagen abgekauft hast."; 
}; 
 
func int Dia_Ardoc_kahr_Ornament_condition () 
{ 
   IF (Npc_KnowsInfo(other,DIA_Addon_Lord_Hagen_Ornament)) 
   && (PC_got_ORNAMENT == FALSE) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_kahr_Ornament_info () 
{ 
    	AI_Output (other,self,"Dia_Ardoc_kahr_Ornament_00");  //Ich möchte das Ornament haben, dass du Lord Hagen abgekauft hast. 

	if (Vampirgilde == FALSE)
	&& (SC_Ist_Ein_Vampir == TRUE)
	{
 		AI_Output (self, other,"Dia_Ardoc_kahr_Ornament_01");  //Es ist nicht verkäuflich. 
	}
	else
	{
		AI_Output (self, other,"Dia_Ardoc_kahr_Ornament_02");  //Wenn du es unbedingt haben willst, hier ist es. 
   		AI_Output (other,self,"Dia_Ardoc_kahr_Ornament_03");  //Du gibst es mir einfach so? 
   		AI_Output (self, other,"Dia_Ardoc_kahr_Ornament_04");  //Ich hab keinerlei Verwendung dafür, vielleicht aber du. 
   		CreateInvItems (self, ItMi_Ornament_Addon, 1);									
		B_GiveInvItems (self, other, ItMi_Ornament_Addon, 1);	
		PC_got_ORNAMENT = TRUE;
 		B_GivePlayerXP(100); 
	};
}; 


//////////////////////////////////////////////////////////// 
//////////////             VAMSINADW 
/////////////////////////////////////////////////////// 
instance Dia_ARDOC_KAHR_VAMSINADW   (C_INFO) 
{ 
   npc     = VLK_419_buerger; 
   nr          =800; 
   condition   =   Dia_ARDOC_KAHR_VAMSINADW_condition; 
   information     = Dia_ARDOC_KAHR_VAMSINADW_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Ich habe Neuigkeiten."; 
}; 
 
func int Dia_ARDOC_KAHR_VAMSINADW_condition () 
{ 
   IF (SC_Later == TRUE) 
   || (SC_okay ==True)
   {
   if (Klaue_drusus == FALSE)
   && (Ardoc_Klaue == FALSE)
   
   { 
   return TRUE; 
   }; 
   };
}; 
 
func void Dia_ARDOC_KAHR_VAMSINADW_info () 
{ 
   AI_Output (other,self,"Dia_ARDOC_KAHR_VAMSINADW_00");  //Ich habe Neuigkeiten. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_01");  //Sprich! 
   AI_Output (other,self,"Dia_ARDOC_KAHR_VAMSINADW_02");  //Ich habe auf dem unbekannten Teil der Insel Vampire endeckt. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_03");  //Was? 
   AI_Output (other,self,"Dia_ARDOC_KAHR_VAMSINADW_04");  //Dort leben Vampire. Sie sind die letzten Überlebenden einer Kultur, die vor vielen Jahrhunderten unterging. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_05");  //Das ist sehr besorgniserregend. 
   Log_SetTopicStatus (VAM_IN_ADW,LOG_SUCCESS);
    B_GivePlayerXP(400); 
 
 IF (Vampirgilde_ADW == FALSE)
 
 {
   AI_Output (other,self,"Dia_ARDOC_KAHR_VAMSINADW_06");  //Sie haben mich gefragt, ob ich mich ihnen anschließe. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_07");  //Hmm... Keine so schlechte Idee. Du tust so, als ob du bei ihnen mitmachst. So kannst du mehr Informationen über sie sammeln. 
   AI_Output (other,self,"Dia_ARDOC_KAHR_VAMSINADW_08");  //Mir scheint, dass sie Beliar anbeten und leicht fanatisch sind.
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_09");  //Dann sei vorsichtig und denk immer an deinen Schwur! 
 }
 else
 {
    AI_Output (other,self,"Dia_ARDOC_KAHR_VAMSINADW_11");  //Ich habe mich ihnen angeschlossen. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_12");  //Es könnte ein Vorteil sein, einen unserer Leute in ihren Reihen zu haben. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_13");  //Du kannst so für uns wichtige Informationen sammeln. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_VAMSINADW_14");  //Aber denk immer an den Schwur!
 };
 
 
}; 

//////////////////////////////////////////////////////////// 
//////////////             Clanplan 
/////////////////////////////////////////////////////// 
instance Dia_ARDOC_KAHR_Clanplan   (C_INFO) 
{ 
   npc     = VLK_419_buerger; 
   nr          =500; 
   condition   =   Dia_ARDOC_KAHR_Clanplan_condition; 
   information     = Dia_ARDOC_KAHR_Clanplan_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Ich weiß, was der Clan in Jharkendar vorhat."; 
}; 
 
func int Dia_ARDOC_KAHR_Clanplan_condition () 
{ 
   IF (Ardoc_interest == TRUE) 
   && (Klaue_drusus == FALSE)
   
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_ARDOC_KAHR_Clanplan_info () 
{ 
   AI_Output (other,self,"Dia_ARDOC_KAHR_Clanplan_00");  //Ich weiß, was der Clan in Jharkendar vorhat. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_01");  //Was? 
   AI_Output (other,self,"Dia_ARDOC_KAHR_Clanplan_02");  //Sie wollen die 'Klaue Beliars' ,ein altes Artefakt, in ihren Besitz bringen. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_03");  //Das musst du unter allen Umständen verhindern! 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_04");  //Drusus darf unter keinen Umständen die Klaue erhalten.  
   AI_Output (other,self,"Dia_ARDOC_KAHR_Clanplan_05");  //Momentmal! Woher weist du seinen Namen? 
   AI_Output (other,self,"Dia_ARDOC_KAHR_Clanplan_06");  //Ich habe dir nie den Namen des Anführers gesagt! 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_07");  //Das ist Unwichtig! Du bist der Einzige der uns helfen kann! Du... 
   AI_Output (other,self,"Dia_ARDOC_KAHR_Clanplan_08");  //Du warst es! Du hast mich zum Vampirgemacht!  
   AI_Output (other, self,"Dia_ARDOC_KAHR_Clanplan_09");  //Du warst der Fremde in der Kutte! 
 AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_10");  //Verstehe doch! Es war nötig! Du bist der Auserwählte. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_11");  //Es geht hier um das Schicksal der Meschheit! Begreifst du denn nicht? 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_12");  //Die Klaue hat die Macht, alle Orks zu kontrollieren, sie zu willenlosen Sklaven zu machen. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_13");  //Und nicht nur das! Sie werden von der magischen Kraft der Klaue erfüllt und sind dann kaum Besiegbar! 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_14");  //Drusus will mit ihnen die Menscheit unterjochen. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_15");  //Aber in den richtigen Händen, kann die Klaue die Menschen retten! Du weißt, dass der Krieg aussichtslos ist? 
   AI_Output (other,self,"Dia_ARDOC_KAHR_Clanplan_16");  //Warum ich? Warum hast du das getan? Warum sollte ich dir trauen? 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_17");  //Du stehst vor der Wahl: 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_18");  //Bring mir die Waffe und rette die Menschheit. 
   AI_Output (self, other,"Dia_ARDOC_KAHR_Clanplan_19");  //Oder bring Drusus die Waffe und besiegel ihr Schicksal. 
   AI_StopProcessInfos (self);
   B_GivePlayerXP(450);
}; 

//////////////////////////////////////////////////////////// 
//////////////             Klaue 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_kahr_Klaue   (C_INFO) 
{ 
   npc     = VLK_419_buerger; 
   nr          =400; 
   condition   =   Dia_Ardoc_kahr_Klaue_condition; 
   information     = Dia_Ardoc_kahr_Klaue_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Ich habe die Klaue."; 
}; 
 
func int Dia_Ardoc_kahr_Klaue_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_ARDOC_KAHR_Clanplan)) 
  && (C_ScHasBeliarsWeapon ()) 
  && (Alles_zu_Ende== FALSE)
  && (Klaue_Drusus == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_kahr_Klaue_info () 
{ 
	AI_Output (other,self,"Dia_Ardoc_kahr_Klaue_00");  //Ich habe die Klaue. 
	AI_Output (self, other,"Dia_Ardoc_kahr_Klaue_01");  //Deine Entscheidung war Weise. 
	AI_Output (self, other,"Dia_Ardoc_kahr_Klaue_02");  //Nahe der Stadt ist eine Höhle mit einer Orkstatue. 
	AI_Output (self, other,"Dia_Ardoc_kahr_Klaue_03");  //Durch sie können wir Kontakt mit den Orks aufnehen, den Krieg beenden und die Menschheit retten. 
	AI_Output (self, other,"Dia_Ardoc_kahr_Klaue_04");  //Wir treffen uns dann in der Höhle. 
	AI_Output (self, other,"Dia_Ardoc_kahr_Klaue_05"); //Bring die Klaue mit.
	Ardoc_Klaue = TRUE;
    
	Npc_ExchangeRoutine (ardoc,"ORK");
   
	AI_Teleport (lea, "NW_CITY_SMFOREST_92");
	Npc_ExchangeRoutine (lea,"ORK");

	AI_Teleport (BEROX, "NW_CITY_SMFOREST_9000");
	Npc_ExchangeRoutine (Berox,"ORK");

	AI_StopProcessInfos(self);
}; 


//////////////////////////////////////////////////////////// 
//////////////             secondchance 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_secondchance   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =45; 
   condition   =   Dia_Ardoc_secondchance_condition; 
   information     = Dia_Ardoc_secondchance_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "(Vorfall berichten und Klaue anbieten)"; 
}; 
 
func int Dia_Ardoc_secondchance_condition () 
{ 
    IF (C_ScHasBeliarsWeapon ()) 
  && (Alles_zu_Ende==TRUE)
  && (Klaue_Drusus ==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_secondchance_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_secondchance_00");  //Wegen der Klaue... 
   AI_Output (self, other,"Dia_Ardoc_secondchance_01");  //Ja? Was ist damit? Hat es was mit den Lichtern über der Höhle nahe der Stadt zu tun? 
   AI_Output (self, other,"Dia_Ardoc_secondchance_02");  //Du hast Drusus doch nicht etwa geholfen? 
   AI_Output (other,self,"Dia_Ardoc_secondchance_03");  //Nein, Meister! Sein Clan hat mich gefesselt und die Klaue abgenommen. Sie wollten, dass ich Zeuge ihres Triumpfs werde. 
   AI_Output (other,self,"Dia_Ardoc_secondchance_04");  //Doch plötzlich erschien ein Magier und tötete alle bis auf mich. 
   AI_Output (self, other,"Dia_Ardoc_secondchance_05");  //Er ließ dich am Leben? 
   AI_Output (other,self,"Dia_Ardoc_secondchance_06");  //Ja, anscheinend wusste er nicht, dass ich ein Vampir bin. Ich konnte die Klaue retten ich habe sie bei mir. 
   AI_Output (self, other,"Dia_Ardoc_secondchance_07");  //Also solange dieser Magier hier auf der Insel ist, ist es zu gefährlich das Ritual durchzuführen. Er scheint die Statue zu bewachen. 
   AI_Output (self, other,"Dia_Ardoc_secondchance_08");  //Wir müssen abwarten, bis er verschwindet. Wenn er weg ist, sagst du mir bescheid. 
   AI_Output (other, self,"Dia_Ardoc_secondchance_09");  //Ja, Meister. 
 
}; 

//////////////////////////////////////////////////////////// 
//////////////             badboy 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_badboy   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =44; 
   condition   =   Dia_Ardoc_badboy_condition; 
   information     = Dia_Ardoc_badboy_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Der Magier ist weg."; 
}; 
 
func int Dia_Ardoc_badboy_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardoc_secondchance)) 
   &&  (MIS_Xardas_SCCanOpenIrdorathBook  ==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_badboy_info () 
{ 
   AI_Output (other,self,"Dia_Ardoc_badboy_00");  //Der Magier ist weg. 
   AI_Output (self, other,"Dia_Ardoc_badboy_01");  //Sicher? 
   AI_Output (other,self,"Dia_Ardoc_badboy_02");  //Ja, ich bin sicher. 
   AI_Output (self, other,"Dia_Ardoc_badboy_03");  //Gut, dann können wir das Ritual durchführen. Wir treffen uns an der Orkstatue in der Höhle nördlich der Stadt, bring die Klaue mit. 
   AI_StopProcessInfos(self);
   
   B_GivePlayerXP(250);
   Npc_ExchangeRoutine (ardoc,"ORK");
}; 

//////////////////////////////////////////////////////////// 
//////////////             badboy_end 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_badboy_end   (C_INFO) 
{ 
   npc     = VLK_419_Buerger; 
   nr          =46; 
   condition   =   Dia_Ardoc_badboy_end_condition; 
   information     = Dia_Ardoc_badboy_end_info; 
   important     =  TRUE; 
   permanent     = FALSE; 
}; 
 
func int Dia_Ardoc_badboy_end_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardoc_badboy)) 
  &&(C_ScHasBeliarsWeapon ()) 
  && (Npc_GetDistToWP (self, "XARDAS_KOMMT") < 4000 )
  { 
   return TRUE; 
  }; 
}; 
 
func void Dia_Ardoc_badboy_end_info () 
{ 
   AI_Output (self, other,"Dia_Ardoc_badboy_end_00");  //Da bist du ja endlich! 
   AI_Output (self, other,"Dia_Ardoc_badboy_end_01");  //Gib mir die Klaue. 
   AI_Output (other,self,"Dia_Ardoc_badboy_end_02");  //Hier ist sie! 
   AI_Output (self, other,"Dia_Ardoc_badboy_end_03");  //Hahaha! Nun werde ich, der mächtige Rodan, absolute Macht erlangen! 
   AI_Output (other,self,"Dia_Ardoc_badboy_end_04");  //Rodan? 
   AI_Output (self, other,"Dia_Ardoc_badboy_end_05");  //Ja, ich bin Rodan. Damals war ich in Drusus Clan, doch er hält mich für tot.  
   AI_Output (self, other,"Dia_Ardoc_badboy_end_06");  //Ich habe dich für meine Zwecke benützt, ich habe dich glauben lassen wir wären die Guten und Drusus Clan die Bösen! Und du hast es geglaubt! 
   AI_Output (self, other,"Dia_Ardoc_badboy_end_07");  //Aber ich werde dich nicht töten. Du hast mir geholfen und ich schulde dir Dank. 
   AI_Output (self, other,"Dia_Ardoc_badboy_end_08");  //Tritt zurück, Berliar wird uns erwählen! 
   AI_TurnAway (self, other);
   
   CreateInvItems(self, ItMw_BeliarWeapon_1H_01,1);
    B_ClearBeliarsWeapon ();
   EquipItem(self, ItMw_BeliarWeapon_1H_01);
   AI_ReadyMeleeWeapon(self);
   AI_PlayAni  (self,"T_MAGRUN_2_HEASHOOT");
    AI_Output (self, other,"Dia_Ardoc_badboy_end_09");  //LAGO MA SHI DAGO! 
     AI_Output (self, other,"Dia_Ardoc_badboy_end_10");  //LAGO MA SHI DAGO! 
      
   AI_PlayAni  (self,"T_HEASHOOT_2_STAND");
     AI_Output (self, other,"Dia_Ardoc_badboy_end_11");  //Orks! Tötet die Menschheit!
 
}; 

instance Dia_Ardoc_Badboy_Beliar  (C_INFO) 
{ 
   npc     = vlk_419_buerger; 
   nr          =44; 
   condition   =   Dia_Ardoc_Badboy_Beliar_condition; 
   information     = Dia_Ardoc_Badboy_Beliar_info; 
   important     =  FALSE; 
   permanent     = FALSE; 
   Description    = "Beliar!"; 
}; 
 
func int Dia_Ardoc_Badboy_Beliar_condition () 
{ 
   IF (Npc_KnowsInfo(other,Dia_Ardoc_Badboy_end)) 
   
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_Badboy_Beliar_info () 
{ 
Wld_PlayEffect("spellFX_BELIARSRAGE",  self, self, 0, 0, 0, FALSE ); 
   AI_Output (other,self,"Dia_Drusus_Badboy_end_00");  //Beliar! 
   AI_StopProcessInfos(self);
   Wld_PlayEffect("SLEEP_BLEND3",  hero, hero, 0, 0, 0, FALSE );
 AI_Teleport(hero, "GAMMELPLATZNW01");
  self.aivar[AIV_INVINCIBLE] = FALSE; 
hero.aivar[AIV_INVINCIBLE] = FALSE;
SC_IST_EIN_VAMPIR=FALSE;
}; 

//////////////////////////////////////////////////////////// 
//////////////             Endofdays 
/////////////////////////////////////////////////////// 
instance Dia_Ardoc_kahr_Endofdays   (C_INFO) 
{ 
   npc     = VLK_419_buerger; 
   nr          =22; 
   condition   =   Dia_Ardoc_kahr_Endofdays_condition; 
   information     = Dia_Ardoc_kahr_Endofdays_info; 
   important     =  TRUE; 
   permanent     = FALSE; 
}; 
 
func int Dia_Ardoc_kahr_Endofdays_condition () 
{ 
   IF (ARdoc_Klaue == TRUE) 
   && (Npc_GetDistToWP (self, "XARDAS_KOMMT") < 4000 )
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Ardoc_kahr_Endofdays_info () 
{ 
B_ClearBeliarsWeapon ();
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_00");  //Gut, da bist du endlich! 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_01");  //Wir können Anfangen gib mir die Klaue. 
   AI_Output (other,self,"Dia_Ardoc_kahr_Endofdays_02");  //Hier! 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_03");  //Du Idiot! Hast du das Ganze etwa abgekauft? Du bist so naiv! 
   AI_Output (other,self,"Dia_Ardoc_kahr_Endofdays_04");  //Was meinst du? 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_05");  //Alles war geplant! Du solltest im Glauben sein, wir, der Silverclan, wären die Guten, dass wir die Menschen retten. 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_06");  //Und es hat funktioniert! Du warst der Einzige, der In der Lage war uns die Klaue zu beschaffen und du hast es geschafft. Respekt! 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_07");  //Als Dank lass ich dich am Leben, ich der große Rodan! 
   AI_Output (other,self,"Dia_Ardoc_kahr_Endofdays_08");  //Rodan? 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_09");  //Ja, ich bin in Wahrheit Rodan, Drusus hält mich für Tot. Er ist ein Narr! 
   AI_Output (self, other,"Dia_Ardoc_kahr_Endofdays_10");  //Ich werde Beliars rechte Hand! Er wird mich reich entlohnen! Hahaha...
   Info_ClearChoices (Dia_Ardoc_kahr_Endofdays); 
   B_GivePlayerXP(500);
    B_ClearBeliarsWeapon ();
  Info_AddChoice (Dia_Ardoc_kahr_Endofdays, "Neein!", Dia_Ardoc_kahr_Endofdays_noxa); 
 
}; 
 
func void Dia_Ardoc_kahr_Endofdays_noxa () 
{ 
Info_ClearChoices (Dia_Ardoc_kahr_Endofdays); 
Xardas_laber_los =TRUE;
   Npc_ExchangeRoutine (None_100_Xardas, "ORK");
   AI_Teleport (None_100_Xardas, "XARDAS_KOMMT");
   Wld_PlayEffect("SPELLFX_TELEPORT",  NONE_100_Xardas, NONE_100_Xardas, 0, 0, 0, FALSE );
 CreateInvItems(self, ItMw_BeliarWeapon_Raven,1);
 AI_StopProcessInfos(self);
  
}; 

  
  
  