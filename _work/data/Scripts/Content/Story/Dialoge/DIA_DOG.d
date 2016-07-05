var string HPSTRING;
var string HPSTRING2;
var string statstring;
var string statstring2;
var string statstring3;
var string statstring4;
var string statstring5;
var string statstring6;
var string statstring7;

var int D_CAN_AGGRO;
var int D_CAN_DEF;
var int D_CAN_PASS;
var int D_CAN_ABL;
var int D_CAN_SUCH;



//DOGS ATTRIBUTE


//var int D_HP;


var int D_XP;
var int D_PASS;


var int D_ABL;
var int F_AGGRO;
var int F_DEF;
var int d_noatt;



var int D_last_playaction;
var int D_last_success;

var int Bonus_For_Tricks;



//////////////////////////////////////////////////////////// 
//////////////             Exit 
/////////////////////////////////////////////////////// 
func void dogsay (var C_NPC slf, var C_NPC oth)
{
var int randim;
randim =Hlp_Random(3);
if randim ==2
{
//Snd_Play ("Dog1");
}
else if randim ==0
{
//Snd_Play ("Dog2");
}
else
{

};
};

VAR int dogmenu;

func int GET_DOG_COST (var C_NPC slf)
{
var int DOG_KOSTEN;

		if (slf.attribute[ATR_STRENGTH] >= 200) 	{	DOG_KOSTEN = (3);	}
		else if (slf.attribute[ATR_STRENGTH] >= 100) 	{	DOG_KOSTEN = (2);	}
		else 										{	DOG_KOSTEN = (1);	};
return DOG_KOSTEN;
};
instance Dia_Dog_notalk   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =0; 
   condition   =   Dia_Dog_notalk_condition; 
   information     = Dia_Dog_notalk_info; 
   important     = TRUE; 
Permanent = TRUE; 
Description =DIALOG_ENDE; 
}; 

func int Dia_Dog_notalk_condition () 
{
if (Npc_KnowsInfo (hero, Dia_PEPE_Sell_Dog3)==FALSE)
&& (Npc_IsInState(self, ZS_Talk))
{ 
return TRUE; 
};
}; 
 
func void Dia_Dog_notalk_info () 
{ 
AI_StopProcessInfos (self); 
dogmenu=0;
};
instance Dia_Dog_Exit   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =1020; 
   condition   =   Dia_Dog_Exit_condition; 
   information     = Dia_Dog_Exit_info; 
   important     = FALSE; 
Permanent = TRUE; 
Description =DIALOG_ENDE; 
}; 



instance Dia_Dog_addon_Exit   (C_INFO) 
{ 
   npc     = Dog_Addon; 
   nr          =1020; 
   condition   =   Dia_Dog_Exit_condition; 
   information     = Dia_Dog_Exit_info; 
   important     = FALSE; 
Permanent = TRUE; 
Description =DIALOG_ENDE; 
}; 

instance Dia_Dog_ow_Exit   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =1020; 
   condition   =   Dia_Dog_Exit_condition; 
   information     = Dia_Dog_Exit_info; 
   important     = FALSE; 
Permanent = TRUE; 
Description =DIALOG_ENDE; 
}; 

instance Dia_Dog_di_Exit   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =1020; 
   condition   =   Dia_Dog_Exit_condition; 
   information     = Dia_Dog_Exit_info; 
   important     = FALSE; 
Permanent = TRUE; 
Description =DIALOG_ENDE; 
};  
func int Dia_Dog_Exit_condition () 
{ 
return TRUE; 
}; 
 
func void Dia_Dog_Exit_info () 
{ 
AI_StopProcessInfos (self); 
dogmenu=0;
D_last_playaction=0;
 	D_last_success=0;

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!








//d_IQ=d_iq+30;
//D_LP=60;












//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}; 



//////////////////////////////////////////////////////////// 
//////////////             Spielen 
/////////////////////////////////////////////////////// 
instance Dia_Dog_Spielen   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =998; 
   condition   =   Dia_Dog_Spielen_condition; 
   information     = Dia_Dog_Spielen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Spielen"; 
}; 

instance Dia_Dog_addon_Spielen   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =998; 
   condition   =   Dia_Dog_Spielen_condition; 
   information     = Dia_Dog_Spielen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Spielen"; 
}; 

instance Dia_Dog_ow_Spielen   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =998; 
   condition   =   Dia_Dog_Spielen_condition; 
   information     = Dia_Dog_Spielen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Spielen"; 
}; 

instance Dia_Dog_di_Spielen   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =998; 
   condition   =   Dia_Dog_Spielen_condition; 
   information     = Dia_Dog_Spielen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Spielen"; 
}; 


 
func int Dia_Dog_Spielen_condition () 
{ 
   IF (dogmenu==0) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_Spielen_info () 
{ 
 dogmenu=1;
}; 

//////////////////////////////////////////////////////////// 
//////////////             S_Sitz 
/////////////////////////////////////////////////////// 
instance Dia_Dog_S_Sitz   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =997; 
   condition   =   Dia_Dog_S_Sitz_condition; 
   information     = Dia_Dog_S_Sitz_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Sitz!"; 
}; 

instance Dia_Dog_ow_S_Sitz   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =997; 
   condition   =   Dia_Dog_S_Sitz_condition; 
   information     = Dia_Dog_S_Sitz_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Sitz!"; 
};
instance Dia_Dog_addon_S_Sitz   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =997; 
   condition   =   Dia_Dog_S_Sitz_condition; 
   information     = Dia_Dog_S_Sitz_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Sitz!"; 
};

instance Dia_Dog_di_S_Sitz   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =997; 
   condition   =   Dia_Dog_S_Sitz_condition; 
   information     = Dia_Dog_S_Sitz_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Sitz!"; 
};
 
func int Dia_Dog_S_Sitz_condition () 
{ 
   IF (dogmenu==1) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_S_Sitz_info () 
{ 

AI_Output ( other,self,"Dia_Dog_S_SITZ_00");  //Sitz!
var int randomizer;
var int randomizer2;
randomizer2=Hlp_Random(9);
randomizer=(randomizer2+1)-D_sitz_c;
 
 
 if (randomizer <=1)
 {
 	AI_Wait(self, 0.4);
 	AI_StandUp (self);
 	 AI_PlayAni(self, "T_STAND_2_SIT");
 	D_last_success =1;
 	dogsay (self, other);
 	
 }
 else if (Randomizer2 > 4)
 {
  AI_Wait(self, 0.4);
  AI_StandUp (self);
  dogsay (self, other);
  
 }
 else
 {
 AI_Wait(self, 0.4);
        AI_StandUp (self);
        AI_PlayAni(self, "T_STAND_2_SLEEP");
 };
 
 D_last_playaction=1;

}; 


//////////////////////////////////////////////////////////// 
//////////////             S_Steh 
/////////////////////////////////////////////////////// 
instance Dia_Dog_S_Steh   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =996; 
   condition   =   Dia_Dog_S_Steh_condition; 
   information     = Dia_Dog_S_Steh_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aufgepasst!"; 
}; 

instance Dia_Dog_ow_S_Steh   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =996; 
   condition   =   Dia_Dog_S_Steh_condition; 
   information     = Dia_Dog_S_Steh_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aufgepasst!"; 
}; 

instance Dia_Dog_addon_S_Steh   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =996; 
   condition   =   Dia_Dog_S_Steh_condition; 
   information     = Dia_Dog_S_Steh_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aufgepasst!"; 
}; 

instance Dia_Dog_di_S_Steh   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =996; 
   condition   =   Dia_Dog_S_Steh_condition; 
   information     = Dia_Dog_S_Steh_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aufgepasst!"; 
}; 
 
func int Dia_Dog_S_Steh_condition () 
{ 
   IF (dogmenu==1) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_S_Steh_info () 
{ 
  AI_Output (other,self,"Dia_Dog_S_Steh_00");  //Aufgepasst!
 
  
  var int randomizer;
var int randomizer2;
randomizer2=Hlp_Random(9);
randomizer=(randomizer2+1)-D_aufgepasst_c;
 
 
 if (randomizer <=1)
 {
  AI_Wait(self, 0.4);
 	 AI_StandUp (self);
 	D_last_success =2;
 	dogsay (self, other);
 }
 else if (Randomizer2 > 4)
 {
 
  AI_Wait(self, 0.4);
 	AI_StandUp (self);
 	 AI_PlayAni(self, "T_STAND_2_SIT");
 	 dogsay (self, other);
 }
 else
 {
 AI_Wait(self, 0.4);
        AI_StandUp (self);
        AI_PlayAni(self, "T_STAND_2_SLEEP");
 };
 
 D_last_playaction=2;

  
  
  
}; 
instance Dia_Dog_S_back   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =1019; 
   condition   =   Dia_Dog_S_back_condition; 
   information     = Dia_Dog_S_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_addon_S_back   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =1019; 
   condition   =   Dia_Dog_S_back_condition; 
   information     = Dia_Dog_S_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_di_S_back   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =1019; 
   condition   =   Dia_Dog_S_back_condition; 
   information     = Dia_Dog_S_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_ow_S_back   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =1019; 
   condition   =   Dia_Dog_S_back_condition; 
   information     = Dia_Dog_S_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
 
func int Dia_Dog_S_back_condition () 
{ 
   IF (dogmenu==1) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_S_back_info () 
{ 
  Dogmenu=0;
}; 
//////////////////////////////////////////////////////////// 
//////////////             S_Lieg 
/////////////////////////////////////////////////////// 
instance Dia_Dog_S_Lieg   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =995; 
   condition   =   Dia_Dog_S_Lieg_condition; 
   information     = Dia_Dog_S_Lieg_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Leg dich hin!"; 
}; 
instance Dia_Dog_ow_S_Lieg   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =995; 
   condition   =   Dia_Dog_S_Lieg_condition; 
   information     = Dia_Dog_S_Lieg_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Leg dich hin!"; 
};
instance Dia_Dog_addon_S_Lieg   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =995; 
   condition   =   Dia_Dog_S_Lieg_condition; 
   information     = Dia_Dog_S_Lieg_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Leg dich hin!"; 
};
instance Dia_Dog_di_S_Lieg   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =995; 
   condition   =   Dia_Dog_S_Lieg_condition; 
   information     = Dia_Dog_S_Lieg_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Leg dich hin!"; 
};
 
func int Dia_Dog_S_Lieg_condition () 
{ 
   IF (dogmenu==1) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_S_Lieg_info () 
{ 
  	AI_Output (other,self,"Dia_Dog_S_Lieg_00");  //Leg dich hin! 
  	
 
  
  var int randomizer;
var int randomizer2;
randomizer2=Hlp_Random(9);
randomizer=(randomizer2+1)-D_lieg_c;
 
 
 if (randomizer <=1)
 {
 	 AI_Wait(self, 0.4);
        AI_StandUp (self);
        AI_PlayAni(self, "T_STAND_2_SLEEP");
      
 	D_last_success =3;
 }
 else if (Randomizer2 > 4)
 {
 
  AI_Wait(self, 0.4);
        AI_StandUp (self);
          dogsay (self, other);
 }
 else
 {

      AI_Wait(self, 0.4);
 	AI_StandUp (self);
 	 AI_PlayAni(self, "T_STAND_2_SIT");
 	 dogsay (self, other);
 };
 
 D_last_playaction=3;

}; 

instance Dia_Dog_S_STREI  (C_INFO) 
{ 
   npc     = Dog; 
   nr          =993; 
   condition   =   Dia_Dog_S_STREI_condition; 
   information     = Dia_Dog_S_STREI_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(Streicheln)"; 
}; 
instance Dia_Dog_ow_S_STREI  (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =993; 
   condition   =   Dia_Dog_S_STREI_condition; 
   information     = Dia_Dog_S_STREI_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(Streicheln)"; 
}; 
instance Dia_Dog_di_S_STREI  (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =993; 
   condition   =   Dia_Dog_S_STREI_condition; 
   information     = Dia_Dog_S_STREI_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(Streicheln)"; 
}; 
instance Dia_Dog_Addon_S_STREI  (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =993; 
   condition   =   Dia_Dog_S_STREI_condition; 
   information     = Dia_Dog_S_STREI_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(Streicheln)"; 
}; 
 
func int Dia_Dog_S_STREI_condition () 
{ 
   IF (dogmenu==1) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_S_STREI_info () 
{ 
  	AI_GotoNpc(other, self);
  	//AI_PlayAni		(other, "T_PLUNDER");
 	AI_PlayAni		(other, "T_GRAVE_STAND_2_S0");
 	AI_PlayAni		(other, "T_GRAVE_S0_2_S1");
 	AI_PlayAni		(other, "T_FISTPARADEJUMPB");
 	
 	AI_StandUp(other);
 	if ((D_last_playaction==1)&&(D_last_success==1))
 	{
 	D_sitz_c=d_sitz_c +1;
 	}
 	else if ((D_last_playaction==1)&&(D_last_success!=1))
 	{
 	D_sitz_c=d_sitz_c -1;
 	};
 	
 	if ((D_last_playaction==2)&&(D_last_success==2))
 	{
 	D_aufgepasst_c=d_aufgepasst_c +1;
 	}
 	else if ((D_last_playaction==2)&&(D_last_success!=2))
 	{
 	D_aufgepasst_c=d_aufgepasst_c -1;
 	};
 	
 	if ((D_last_playaction==3)&&(D_last_success==3))
 	{
 	D_lieg_c=d_lieg_c +1;
 	}
 	else if ((D_last_playaction==3)&&(D_last_success!=3))
 	{
 	D_lieg_c=d_lieg_c -1;
 	};
 	D_last_playaction=0;
 	D_last_success=0;
 	
 	if (Bonus_For_Tricks==FALSE)
 	&& (d_sitz_c>=8)
 	&& (d_aufgepasst_c>=8)
 	&& (d_lieg_c>=8)
 	{
 	 Bonus_For_Tricks=TRUE;
 	 D_IQ=d_IQ+20;
 	 PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
 	 Snd_Play ("LevelUp");
 	   dogsay (self, other);
 	};
}; 


//////////////////////////////////////////////////////////// 
//////////////             Überprüfen 
/////////////////////////////////////////////////////// 
instance Dia_Dog_Überprüfen   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =994; 
   condition   =   Dia_Dog_Überprüfen_condition; 
   information     = Dia_Dog_Überprüfen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(überprüfen)"; //---------------------Zum Werte gucken
}; 

instance Dia_Dog_ow_Überprüfen   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =994; 
   condition   =   Dia_Dog_Überprüfen_condition; 
   information     = Dia_Dog_Überprüfen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(überprüfen)"; //---------------------Zum Werte gucken
}; 
instance Dia_Dog_addon_Überprüfen   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =994; 
   condition   =   Dia_Dog_Überprüfen_condition; 
   information     = Dia_Dog_Überprüfen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(überprüfen)"; //---------------------Zum Werte gucken
}; 
instance Dia_Dog_di_Überprüfen   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =994; 
   condition   =   Dia_Dog_Überprüfen_condition; 
   information     = Dia_Dog_Überprüfen_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "(überprüfen)"; //---------------------Zum Werte gucken
}; 
 
func int Dia_Dog_Überprüfen_condition () 
{ 
   IF (dogmenu==0) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_Überprüfen_info () 
{ 
        AI_GotoNpc(other, self);
  	//AI_PlayAni		(other, "T_PLUNDER");
  	AI_PlayAni		(other, "T_GRAVE_STAND_2_S0");
  	AI_PlayAni		(other, "T_GRAVE_S0_2_S1");
  	AI_PlayAni		(other, "T_FISTPARADEJUMPB");
  	AI_StandUp(other);
  	var int XP_RECH;
  	XP_RECH=D_EXP_NEXT-D_exp;
  	statstring = ConcatStrings ("Maximale Lebensenergie: " , IntToString(self.attribute[ATR_HITPOINTS_MAX]));
  	statstring2 = ConcatStrings ("Intelligenz: " , IntToString(D_IQ));
  	statstring3 = ConcatStrings ("Stärke: " , IntToString(D_STR));
  	statstring4 = ConcatStrings ("Lernpunkte: " , IntToString(D_LP));
  	statstring5 = ConcatStrings ("Level: " , IntToString(D_LEVEL));
	statstring6 = ConcatStrings ("Schutz vor Waffen: " , IntToString(self.protection[PROT_EDGE]));
	statstring7 = ConcatStrings ("EXP für nächste Stufe: " , IntToString(XP_RECH));
	
	PrintScreen	(statstring5, -1, 1, FONT_SCREEN, 10);
	PrintScreen	(statstring7, -1, 3, FONT_SCREEN, 10);
	PrintScreen	(statstring4, -1, 5, FONT_SCREEN, 10);
	PrintScreen	(statstring, -1, 7, FONT_SCREEN, 10);
	PrintScreen	(statstring3, -1, 9, FONT_SCREEN, 10);
	PrintScreen	(statstring2, -1, 11, FONT_SCREEN, 10);
	PrintScreen	(statstring6, -1, 13, FONT_SCREEN, 10);
	
  	
  	//Nicht vergessen!!!
}; 


//////////////////////////////////////////////////////////// 
//////////////             ANWEISUNG 
/////////////////////////////////////////////////////// 
instance Dia_Dog_ANWEISUNG   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =900; 
   condition   =   Dia_Dog_ANWEISUNG_condition; 
   information     = Dia_Dog_ANWEISUNG_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Anweisungen"; 
}; 
instance Dia_Dog_ow_ANWEISUNG   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =900; 
   condition   =   Dia_Dog_ANWEISUNG_condition; 
   information     = Dia_Dog_ANWEISUNG_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Anweisungen"; 
}; 
instance Dia_Dog_di_ANWEISUNG   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =900; 
   condition   =   Dia_Dog_ANWEISUNG_condition; 
   information     = Dia_Dog_ANWEISUNG_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Anweisungen"; 
}; 
instance Dia_Dog_addon_ANWEISUNG   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =900; 
   condition   =   Dia_Dog_ANWEISUNG_condition; 
   information     = Dia_Dog_ANWEISUNG_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Anweisungen"; 
}; 
 
func int Dia_Dog_ANWEISUNG_condition () 
{ 
   IF (dogmenu==0) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_ANWEISUNG_info () 
{ 
 dogmenu=2;
}; 

//////////////////////////////////////////////////////////// 
//////////////             STAY 
/////////////////////////////////////////////////////// 
instance Dia_Dog_STAY   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =500; 
   condition   =   Dia_Dog_STAY_condition; 
   information     = Dia_Dog_STAY_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Bleib hier!"; 
}; 

instance Dia_Dog_ow_STAY   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =500; 
   condition   =   Dia_Dog_STAY_condition; 
   information     = Dia_Dog_STAY_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Bleib hier!"; 
}; 

instance Dia_Dog_di_STAY   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =500; 
   condition   =   Dia_Dog_STAY_condition; 
   information     = Dia_Dog_STAY_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Bleib hier!"; 
}; 
instance Dia_Dog_addon_STAY   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =500; 
   condition   =   Dia_Dog_STAY_condition; 
   information     = Dia_Dog_STAY_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Bleib hier!"; 
}; 
 
func int Dia_Dog_STAY_condition () 
{ 
   IF (dogmenu==2) 
   && (dog_follow==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_STAY_info () 
{ 
   AI_Output (other,self,"Dia_Dog_STAY_00");  //Bleib hier! 
 dog_follow=FALSE;
   dogsay (self, other);
}; 
instance Dia_Dog_a_back   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =1018; 
   condition   =   Dia_Dog_a_back_condition; 
   information     = Dia_Dog_a_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_ow_a_back   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =1018; 
   condition   =   Dia_Dog_a_back_condition; 
   information     = Dia_Dog_a_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_di_a_back   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =1018; 
   condition   =   Dia_Dog_a_back_condition; 
   information     = Dia_Dog_a_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_addon_a_back   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =1018; 
   condition   =   Dia_Dog_a_back_condition; 
   information     = Dia_Dog_a_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
 
func int Dia_Dog_a_back_condition () 
{ 
   IF (dogmenu==2) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_a_back_info () 
{ 
  Dogmenu=0;
}; 

//////////////////////////////////////////////////////////// 
//////////////             COME 
/////////////////////////////////////////////////////// 
instance Dia_Dog_COME   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =501; 
   condition   =   Dia_Dog_COME_condition; 
   information     = Dia_Dog_COME_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Komm mit!"; 
}; 

instance Dia_Dog_ow_COME   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =501; 
   condition   =   Dia_Dog_COME_condition; 
   information     = Dia_Dog_COME_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Komm mit!"; 
}; 

instance Dia_Dog_di_COME   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =501; 
   condition   =   Dia_Dog_COME_condition; 
   information     = Dia_Dog_COME_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Komm mit!"; 
}; 

instance Dia_Dog_addon_COME   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =501; 
   condition   =   Dia_Dog_COME_condition; 
   information     = Dia_Dog_COME_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Komm mit!"; 
}; 
 
func int Dia_Dog_COME_condition () 
{ 
   IF (dogmenu==2) 
   && (DOG_FOLLOW==FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_COME_info () 
{ 
   AI_Output (other,self,"Dia_Dog_COME_00");  //Komm mit! 
   DOG_FOLLOW=TRUE;
     dogsay (self, other);
 
}; 

//////////////////////////////////////////////////////////// 
//////////////             Passiv 
/////////////////////////////////////////////////////// 
instance Dia_dog_Passiv   (C_INFO) 
{ 
   npc     = dog; 
   nr          =502; 
   condition   =   Dia_dog_Passiv_condition; 
   information     = Dia_dog_Passiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich Passiv!"; 
};

instance Dia_dog_ow_Passiv   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =502; 
   condition   =   Dia_dog_Passiv_condition; 
   information     = Dia_dog_Passiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich Passiv!"; 
};

instance Dia_dog_di_Passiv   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =502; 
   condition   =   Dia_dog_Passiv_condition; 
   information     = Dia_dog_Passiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich Passiv!"; 
};

instance Dia_dog_addon_Passiv   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =502; 
   condition   =   Dia_dog_Passiv_condition; 
   information     = Dia_dog_Passiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich Passiv!"; 
}; 
 
func int Dia_dog_Passiv_condition () 
{ 
   IF (dogmenu == 2) 
   &&(D_CAN_PASS==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_Passiv_info () 
{ 
   AI_Output (other,self,"Dia_dog_Passiv_00");  //Verhalte dich Passiv! 
   
	
   
   D_PASS =TRUE;
  D_ABL = FALSE;
   dogsay (self, other);
}; 

//////////////////////////////////////////////////////////// 
//////////////             normal 
/////////////////////////////////////////////////////// 
instance Dia_dog_normal   (C_INFO) 
{ 
   npc     = dog; 
   nr          =503; 
   condition   =   Dia_dog_normal_condition; 
   information     = Dia_dog_normal_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich normal!"; 
}; 

instance Dia_dog_ow_normal   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =503; 
   condition   =   Dia_dog_normal_condition; 
   information     = Dia_dog_normal_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich normal!"; 
}; 

instance Dia_dog_di_normal   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =503; 
   condition   =   Dia_dog_normal_condition; 
   information     = Dia_dog_normal_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich normal!"; 
}; 

instance Dia_dog_addon_normal   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =503; 
   condition   =   Dia_dog_normal_condition; 
   information     = Dia_dog_normal_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Verhalte dich normal!"; 
}; 
 
func int Dia_dog_normal_condition () 
{ 
   IF (dogmenu == 2) 
   &&((D_CAN_PASS ==TRUE )||(D_CAN_AGGRO ==TRUE)||(D_CAN_DEF ==TRUE)||(D_CAN_ABL==TRUE)||(d_noatt==TRUE))
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_normal_info () 
{ 
   AI_Output (other,self,"Dia_dog_normal_00");  //Verhalte dich normal! 
   
	  D_ABL = FALSE;
	  F_AGGRO =FALSE;
	  F_DEF =FALSE;
	  D_PASS=FALSE;
	  D_sucher =0;
	  D_goestoitm=FALSE;
	B_InitMonsterAttitudes();
   dogsay (self, other);
}; 

//////////////////////////////////////////////////////////// 
//////////////             Ziel 
///////////////////////////////////////////////////////
 
instance Dia_dog_Ziel   (C_INFO) 
{ 
   npc     = dog; 
   nr          =504; 
   condition   =   Dia_dog_Ziel_condition; 
   information     = Dia_dog_Ziel_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Greife nur an, wenn ich angreife!"; 
}; 

instance Dia_dog_ow_Ziel   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =504; 
   condition   =   Dia_dog_Ziel_condition; 
   information     = Dia_dog_Ziel_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Greife nur an, wenn ich angreife!"; 
}; 
instance Dia_dog_di_Ziel   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =504; 
   condition   =   Dia_dog_Ziel_condition; 
   information     = Dia_dog_Ziel_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Greife nur an, wenn ich angreife!"; 
}; 
instance Dia_dog_addon_Ziel   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =504; 
   condition   =   Dia_dog_Ziel_condition; 
   information     = Dia_dog_Ziel_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Greife nur an, wenn ich angreife!"; 
}; 

 
func int Dia_dog_Ziel_condition () 
{ 
   IF (dogmenu == 2) 
   && (d_noatt ==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_Ziel_info () 
{ 
   AI_Output (other,self,"Dia_dog_Ziel_00");  //Greife nur an, wenn ich angreife! 
 
  dogsay (self, other);
	
 
    D_ABL = FALSE;
    d_sucher =0;
D_PASS=FALSE;
    D_goestoitm=FALSE;
  	B_set_dog_att();
   
}; 

//////////////////////////////////////////////////////////// 
//////////////             aggressiv 
/////////////////////////////////////////////////////// 
instance Dia_dog_aggressiv   (C_INFO) 
{ 
   npc     = dog; 
   nr          =505; 
   condition   =   Dia_dog_aggressiv_condition; 
   information     = Dia_dog_aggressiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe aggressiv!"; 
}; 

instance Dia_dog_ow_aggressiv   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =505; 
   condition   =   Dia_dog_aggressiv_condition; 
   information     = Dia_dog_aggressiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe aggressiv!"; 
}; 
instance Dia_dog_addon_aggressiv   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =505; 
   condition   =   Dia_dog_aggressiv_condition; 
   information     = Dia_dog_aggressiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe aggressiv!"; 
}; 
instance Dia_dog_di_aggressiv   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =505; 
   condition   =   Dia_dog_aggressiv_condition; 
   information     = Dia_dog_aggressiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe aggressiv!"; 
}; 
 
func int Dia_dog_aggressiv_condition () 
{ 
   IF (dogmenu == 2) 
   &&(D_CAN_AGGRO ==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_aggressiv_info () 
{ 
   AI_Output (other,self,"Dia_dog_aggressiv_00");  //Kämpfe aggressiv! 
   //D_ABL = FALSE;
   F_AGGRO = TRUE;
   F_DEF =FALSE;

   
     dogsay (self, other);
}; 

//////////////////////////////////////////////////////////// 
//////////////             Defensiv 
/////////////////////////////////////////////////////// 
instance Dia_dog_Defensiv   (C_INFO) 
{ 
   npc     = dog; 
   nr          =506; 
   condition   =   Dia_dog_Defensiv_condition; 
   information     = Dia_dog_Defensiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe defensiv!"; 
}; 
instance Dia_dog_ow_Defensiv   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =506; 
   condition   =   Dia_dog_Defensiv_condition; 
   information     = Dia_dog_Defensiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe defensiv!"; 
}; 
instance Dia_dog_di_Defensiv   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =506; 
   condition   =   Dia_dog_Defensiv_condition; 
   information     = Dia_dog_Defensiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe defensiv!"; 
}; 
instance Dia_dog_addon_Defensiv   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =506; 
   condition   =   Dia_dog_Defensiv_condition; 
   information     = Dia_dog_Defensiv_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Kämpfe defensiv!"; 
}; 
 
func int Dia_dog_Defensiv_condition () 
{ 
   IF (dogmenu == 2) 
   &&(D_CAN_DEF==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_Defensiv_info () 
{ 
   AI_Output (other,self,"Dia_dog_Defensiv_00");  //Kämpfe defensiv! 
    //D_ABL = FALSE;
  F_AGGRO=FALSE;
  F_DEF =TRUE;
  
   dogsay (self, other);
}; 


//////////////////////////////////////////////////////////// 
//////////////             ablenkung 
/////////////////////////////////////////////////////// 
instance Dia_dog_ablenkung   (C_INFO) 
{ 
   npc     = dog; 
   nr          =508; 
   condition   =   Dia_dog_ablenkung_condition; 
   information     = Dia_dog_ablenkung_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Lenke den Gegner ab!"; 
}; 

instance Dia_dog_ow_ablenkung   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =508; 
   condition   =   Dia_dog_ablenkung_condition; 
   information     = Dia_dog_ablenkung_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Lenke den Gegner ab!"; 
}; 
instance Dia_dog_di_ablenkung   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =508; 
   condition   =   Dia_dog_ablenkung_condition; 
   information     = Dia_dog_ablenkung_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Lenke den Gegner ab!"; 
}; 
instance Dia_dog_addon_ablenkung   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =508; 
   condition   =   Dia_dog_ablenkung_condition; 
   information     = Dia_dog_ablenkung_info; 
   important     =  FALSE; 
   permanent     = TRUE;
   Description    = "Lenke den Gegner ab!"; 
}; 
 
func int Dia_dog_ablenkung_condition () 
{ 
   IF (dogmenu == 2) 
   && (D_CAN_ABL ==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_ablenkung_info () 
{ 
   AI_Output (other,self,"Dia_dog_ablenkung_00");  //Lenke den Gegner ab! 
 
   D_ABL = TRUE;
     //F_AGGRO=FALSE;
     D_PASS=FALSE;
    // F_DEF = FALSE;
     
       dogsay (self, other);
}; 

//////////////////////////////////////////////////////////// 
//////////////             ANW_SUCH 
/////////////////////////////////////////////////////// 
instance Dia_dog_ANW_SUCH   (C_INFO) 
{ 
   npc     = dog; 
   nr          =605; 
   condition   =   Dia_dog_ANW_SUCH_condition; 
   information     = Dia_dog_ANW_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Such mir etwas"; 
}; 

instance Dia_dog_ow_ANW_SUCH   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =605; 
   condition   =   Dia_dog_ANW_SUCH_condition; 
   information     = Dia_dog_ANW_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Such mir etwas"; 
}; 

instance Dia_dog_di_ANW_SUCH   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =605; 
   condition   =   Dia_dog_ANW_SUCH_condition; 
   information     = Dia_dog_ANW_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Such mir etwas"; 
}; 

instance Dia_dog_addon_ANW_SUCH   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =605; 
   condition   =   Dia_dog_ANW_SUCH_condition; 
   information     = Dia_dog_ANW_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Such mir etwas"; 
}; 
 
func int Dia_dog_ANW_SUCH_condition () 
{ 
   IF (Dogmenu == 2) 
   && (D_CAN_such ==TRUE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_ANW_SUCH_info () 
{ 

AI_Output (other,self,"DIA_Addon_WispDetector_DetectItems_15_00");  //Such mir etwas 
Info_ClearChoices	(Dia_dog_ANW_SUCH); Info_AddChoice(Dia_dog_ANW_SUCH, "Zurück"		, Dia_dog_ANW_SUCH_Back ); 
if D_sucher >=1 { Info_AddChoice	(Dia_dog_ANW_SUCH, "Hör auf zu suchen"		, Dia_dog_ANW_SUCH_stop ); }; 
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Nahkampfwaffen"		, Dia_dog_ANW_SUCH_2 ); 
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Fernkampfwaffen und Munition"		, Dia_dog_ANW_SUCH_3 ); 
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Gold, Schlüssel und Gebrauchsgegenstände"		, Dia_dog_ANW_SUCH_4 ); 
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Runen und Schriftrollen" , Dia_dog_ANW_SUCH_5 );
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Ringe und Amulette"		, Dia_dog_ANW_SUCH_6 );
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Nahrung und Planzen"		, Dia_dog_ANW_SUCH_7 ); 
Info_AddChoice	(Dia_dog_ANW_SUCH, "Ich brauche Tränke aller Art"		, Dia_dog_ANW_SUCH_8 ); 
Info_AddChoice	(Dia_dog_ANW_SUCH, "Suche alles was du finden kannst"		, Dia_dog_ANW_SUCH_1 ); }; 
func void Dia_dog_ANW_SUCH_Back() 
{ 
Info_ClearChoices(Dia_dog_ANW_SUCH);
 };

func void Dia_dog_ANW_SUCH_stop()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_01");  //Hör auf zu suchen!
 D_Sucher=0;
 D_goestoitm=FALSE;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};

func void Dia_dog_ANW_SUCH_2()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_02");  //Ich brauche Nahkampfwaffen!
 D_Sucher=2;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};

func void Dia_dog_ANW_SUCH_3()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_03");  //Ich brauche Fernkampfwaffen und Munition!
 D_Sucher=3;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};
func void Dia_dog_ANW_SUCH_4()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_04");  //Ich brauche Gold, Schlüssel und Gebrauchsgegenstände!
 D_Sucher=4;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};
func void Dia_dog_ANW_SUCH_5()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_05");  //Ich brauche Runen und Schriftrollen!
 D_Sucher=5;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};
func void Dia_dog_ANW_SUCH_6()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_06");  //Ich brauche Ringe und Amulette!
 D_Sucher=6;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};
func void Dia_dog_ANW_SUCH_7()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_07");  //Ich brauche Nahrung und Planzen!
 D_Sucher=7;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};
func void Dia_dog_ANW_SUCH_8()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_08");  //Ich brauche Tränke aller Art!
 D_Sucher=8;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};
func void Dia_dog_ANW_SUCH_1()
{
   AI_Output (other,self,"Dia_dog_ANW_SUCH_09");  //Suche alles was du finden kannst!
 D_Sucher=1;
 Info_ClearChoices(Dia_dog_ANW_SUCH);
};

//////////////////////////////////////////////////////////// 
//////////////             Trainieren 
/////////////////////////////////////////////////////// 
instance Dia_Dog_Trainieren   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =992; 
   condition   =   Dia_Dog_Trainieren_condition; 
   information     = Dia_Dog_Trainieren_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Trainieren"; 
}; 

instance Dia_Dog_ow_Trainieren   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =992; 
   condition   =   Dia_Dog_Trainieren_condition; 
   information     = Dia_Dog_Trainieren_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Trainieren"; 
}; 

instance Dia_Dog_di_Trainieren   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =992; 
   condition   =   Dia_Dog_Trainieren_condition; 
   information     = Dia_Dog_Trainieren_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Trainieren"; 
}; 

instance Dia_Dog_addon_Trainieren   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =992; 
   condition   =   Dia_Dog_Trainieren_condition; 
   information     = Dia_Dog_Trainieren_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Trainieren"; 
}; 
 
func int Dia_Dog_Trainieren_condition () 
{ 
   IF (dogmenu==0) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_Trainieren_info () 
{ 
 dogmenu=3;
}; 

instance Dia_Dog_t_back   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =1019; 
   condition   =   Dia_Dog_t_back_condition; 
   information     = Dia_Dog_t_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_ow_t_back   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =1019; 
   condition   =   Dia_Dog_t_back_condition; 
   information     = Dia_Dog_t_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 

instance Dia_Dog_addon_t_back   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =1019; 
   condition   =   Dia_Dog_t_back_condition; 
   information     = Dia_Dog_t_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
instance Dia_Dog_di_t_back   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =1019; 
   condition   =   Dia_Dog_t_back_condition; 
   information     = Dia_Dog_t_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
 
func int Dia_Dog_t_back_condition () 
{ 
   IF (dogmenu==3) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_t_back_info () 
{ 
  Dogmenu=0;
}; 
//////////////////////////////////////////////////////////// 
//////////////             SRT 
/////////////////////////////////////////////////////// 
instance Dia_Dog_SRT   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =990; 
   condition   =   Dia_Dog_SRT_condition; 
   information     = Dia_Dog_SRT_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Stärke"; 
}; 

instance Dia_Dog_ow_SRT   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =990; 
   condition   =   Dia_Dog_SRT_condition; 
   information     = Dia_Dog_ow_SRT_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Stärke"; 
};
instance Dia_Dog_di_SRT   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =990; 
   condition   =   Dia_Dog_SRT_condition; 
   information     = Dia_Dog_di_SRT_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Stärke"; 
};
instance Dia_Dog_addon_SRT   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =990; 
   condition   =   Dia_Dog_SRT_condition; 
   information     = Dia_Dog_addon_SRT_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Stärke"; 
};
 
func int Dia_Dog_SRT_condition () 
{ 
   IF (dogmenu==3) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_SRT_info () 
{ 
 
 	Info_ClearChoices (Dia_Dog_SRT);
	Info_AddChoice		(Dia_Dog_SRT, DIALOG_BACK,Dia_Dog_SRT_Back);
	Info_AddChoice		(Dia_Dog_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_SRT_1);
	Info_AddChoice		(Dia_Dog_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_SRT_5);
}; 

func void Dia_Dog_SRT_Back ()
{
	 Info_ClearChoices (Dia_Dog_SRT);
};

func void Dia_Dog_SRT_1 ()
{

	if (D_LP>= GET_DOG_COST(self))
	{
		D_LP = D_LP - GET_DOG_COST(self);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+1;
		D_STR = D_STR + 1;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_SRT);
	Info_AddChoice		(Dia_Dog_SRT, DIALOG_BACK,Dia_Dog_SRT_Back);
	Info_AddChoice		(Dia_Dog_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_SRT_1);
	Info_AddChoice		(Dia_Dog_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_SRT_5);
};

func void Dia_Dog_SRT_5 ()
{
	if (D_LP>= (GET_DOG_COST(self)*5))
	{
		D_LP = D_LP - (GET_DOG_COST(self)*5);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+ 5;
		D_STR = D_STR + 5;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_SRT);
	Info_AddChoice		(Dia_Dog_SRT, DIALOG_BACK,Dia_Dog_SRT_Back);
	Info_AddChoice		(Dia_Dog_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_SRT_1);
	Info_AddChoice		(Dia_Dog_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_SRT_5);

};

func void Dia_Dog_ow_SRT_info () 
{ 
 
 	Info_ClearChoices (Dia_Dog_ow_SRT);
	Info_AddChoice		(Dia_Dog_ow_SRT, DIALOG_BACK,Dia_Dog_ow_SRT_Back);
	Info_AddChoice		(Dia_Dog_ow_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_ow_SRT_1);
	Info_AddChoice		(Dia_Dog_ow_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_ow_SRT_5);
}; 

func void Dia_Dog_ow_SRT_Back ()
{
	 Info_ClearChoices (Dia_Dog_ow_SRT);
};

func void Dia_Dog_ow_SRT_1 ()
{

	if (D_LP>= GET_DOG_COST(self))
	{
		D_LP = D_LP - GET_DOG_COST(self);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+1;
		D_STR = D_STR + 1;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_ow_SRT);
	Info_AddChoice		(Dia_Dog_ow_SRT, DIALOG_BACK,Dia_Dog_ow_SRT_Back);
	Info_AddChoice		(Dia_Dog_ow_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_ow_SRT_1);
	Info_AddChoice		(Dia_Dog_ow_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_ow_SRT_5);
};

func void Dia_Dog_ow_SRT_5 ()
{
	if (D_LP>= (GET_DOG_COST(self)*5))
	{
		D_LP = D_LP - (GET_DOG_COST(self)*5);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+ 5;
		D_STR = D_STR + 5;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_ow_SRT);
	Info_AddChoice		(Dia_Dog_ow_SRT, DIALOG_BACK,Dia_Dog_ow_SRT_Back);
	Info_AddChoice		(Dia_Dog_ow_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_ow_SRT_1);
	Info_AddChoice		(Dia_Dog_ow_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_ow_SRT_5);

};
func void Dia_Dog_di_SRT_info () 
{ 
 
 	Info_ClearChoices (Dia_Dog_di_SRT);
	Info_AddChoice		(Dia_Dog_di_SRT, DIALOG_BACK,Dia_Dog_di_SRT_Back);
	Info_AddChoice		(Dia_Dog_di_SRT,"Stärke + 1 (1-3 LP"		,Dia_Dog_di_SRT_1);
	Info_AddChoice		(Dia_Dog_di_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_di_SRT_5);
}; 

func void Dia_Dog_di_SRT_Back ()
{
	 Info_ClearChoices (Dia_Dog_di_SRT);
};

func void Dia_Dog_di_SRT_1 ()
{

	if (D_LP>= GET_DOG_COST(self))
	{
		D_LP = D_LP - GET_DOG_COST(self);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+1;
		D_STR = D_STR + 1;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_di_SRT);
	Info_AddChoice		(Dia_Dog_di_SRT, DIALOG_BACK,Dia_Dog_di_SRT_Back);
	Info_AddChoice		(Dia_Dog_di_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_di_SRT_1);
	Info_AddChoice		(Dia_Dog_di_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_di_SRT_5);
};

func void Dia_Dog_di_SRT_5 ()
{
	if (D_LP>= (GET_DOG_COST(self)*5))
	{
		D_LP = D_LP - (GET_DOG_COST(self)*5);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+ 5;
		D_STR = D_STR + 5;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_di_SRT);
	Info_AddChoice		(Dia_Dog_di_SRT, DIALOG_BACK,Dia_Dog_di_SRT_Back);
	Info_AddChoice		(Dia_Dog_di_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_di_SRT_1);
	Info_AddChoice		(Dia_Dog_di_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_di_SRT_5);

};
func void Dia_Dog_addon_SRT_info () 
{ 
 
 	Info_ClearChoices (Dia_Dog_addon_SRT);
	Info_AddChoice		(Dia_Dog_addon_SRT, DIALOG_BACK,Dia_Dog_addon_SRT_Back);
	Info_AddChoice		(Dia_Dog_addon_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_addon_SRT_1);
	Info_AddChoice		(Dia_Dog_addon_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_addon_SRT_5);
}; 

func void Dia_Dog_addon_SRT_Back ()
{
	 Info_ClearChoices (Dia_Dog_addon_SRT);
};

func void Dia_Dog_addon_SRT_1 ()
{

	if (D_LP>= GET_DOG_COST(self))
	{
		D_LP = D_LP - GET_DOG_COST(self);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+1;
		D_STR = D_STR + 1;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_addon_SRT);
	Info_AddChoice		(Dia_Dog_addon_SRT, DIALOG_BACK,Dia_Dog_addon_SRT_Back);
	Info_AddChoice		(Dia_Dog_addon_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_addon_SRT_1);
	Info_AddChoice		(Dia_Dog_addon_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_addon_SRT_5);
};

func void Dia_Dog_addon_SRT_5 ()
{
	if (D_LP>= (GET_DOG_COST(self)*5))
	{
		D_LP = D_LP - (GET_DOG_COST(self)*5);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH]+ 5;
		D_STR = D_STR + 5;
		PrintScreen	("Draco ist stärker geworden!!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
	Info_ClearChoices (Dia_Dog_addon_SRT);
	Info_AddChoice		(Dia_Dog_addon_SRT, DIALOG_BACK,Dia_Dog_addon_SRT_Back);
	Info_AddChoice		(Dia_Dog_addon_SRT,"Stärke + 1 (1-3 LP)"		,Dia_Dog_addon_SRT_1);
	Info_AddChoice		(Dia_Dog_addon_SRT,"Stärke + 5 (5-15 LP)"		,Dia_Dog_addon_SRT_5);

};
//////////////////////////////////////////////////////////// 
//////////////             HP 
/////////////////////////////////////////////////////// 
instance Dia_Dog_HP   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =990; 
   condition   =   Dia_Dog_HP_condition; 
   information     = Dia_Dog_HP_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Lebensenergie"; 
}; 

instance Dia_Dog_ow_HP   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =990; 
   condition   =   Dia_Dog_HP_condition; 
   information     = Dia_Dog_ow_HP_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Lebensenergie"; 
}; 
instance Dia_Dog_di_HP   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =990; 
   condition   =   Dia_Dog_HP_condition; 
   information     = Dia_Dog_di_HP_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Lebensenergie"; 
}; 
instance Dia_Dog_addon_HP   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =990; 
   condition   =   Dia_Dog_HP_condition; 
   information     = Dia_Dog_addon_HP_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Lebensenergie"; 
}; 
 
func int Dia_Dog_HP_condition () 
{ 
   IF (dogmenu==3) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_HP_info () 
{ 
 Info_ClearChoices (Dia_Dog_HP);
	Info_AddChoice		(Dia_Dog_HP, DIALOG_BACK,Dia_Dog_HP_Back);
	Info_AddChoice		(Dia_Dog_HP,"Lebensenergie + 4"		,Dia_Dog_HP_1);
	Info_AddChoice		(Dia_Dog_HP,"Lebensenergie + 20"		,Dia_Dog_HP_5);
}; 

func void Dia_Dog_HP_Back ()
{
 Info_ClearChoices (Dia_Dog_HP);
};

func void Dia_Dog_HP_1 ()
{
	if (D_LP>= 1)
	{
		D_LP = D_LP - 1;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 4;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 4;
		D_HP = D_HP + 4;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_HP);
	Info_AddChoice		(Dia_Dog_HP, DIALOG_BACK,Dia_Dog_HP_Back);
	Info_AddChoice		(Dia_Dog_HP,"Lebensenergie + 4"		,Dia_Dog_HP_1);
	Info_AddChoice		(Dia_Dog_HP,"Lebensenergie + 20"		,Dia_Dog_HP_5);
};

func void Dia_Dog_HP_5 ()
{
	if (D_LP>= 5)
	{
		D_LP = D_LP - 5;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
		D_HP = D_HP + 20;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_HP);
	Info_AddChoice		(Dia_Dog_HP, DIALOG_BACK,Dia_Dog_HP_Back);
	Info_AddChoice		(Dia_Dog_HP,"Lebensenergie + 4"		,Dia_Dog_HP_1);
	Info_AddChoice		(Dia_Dog_HP,"Lebensenergie + 20"		,Dia_Dog_HP_5);
};

func void Dia_Dog_ow_HP_info () 
{ 
 Info_ClearChoices (Dia_Dog_ow_HP);
	Info_AddChoice		(Dia_Dog_ow_HP, DIALOG_BACK,Dia_Dog_ow_HP_Back);
	Info_AddChoice		(Dia_Dog_ow_HP,"Lebensenergie + 4"		,Dia_Dog_ow_HP_1);
	Info_AddChoice		(Dia_Dog_ow_HP,"Lebensenergie + 20"		,Dia_Dog_ow_HP_5);
}; 

func void Dia_Dog_ow_HP_Back ()
{
 Info_ClearChoices (Dia_Dog_ow_HP);
};

func void Dia_Dog_ow_HP_1 ()
{
	if (D_LP>= 1)
	{
		D_LP = D_LP - 1;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 4;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 4;
		D_HP = D_HP + 4;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_ow_HP);
	Info_AddChoice		(Dia_Dog_ow_HP, DIALOG_BACK,Dia_Dog_ow_HP_Back);
	Info_AddChoice		(Dia_Dog_ow_HP,"Lebensenergie + 4"		,Dia_Dog_ow_HP_1);
	Info_AddChoice		(Dia_Dog_ow_HP,"Lebensenergie + 20"		,Dia_Dog_ow_HP_5);
};

func void Dia_Dog_ow_HP_5 ()
{
	if (D_LP>= 5)
	{
		D_LP = D_LP - 5;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
		D_HP = D_HP + 20;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_ow_HP);
	Info_AddChoice		(Dia_Dog_ow_HP, DIALOG_BACK,Dia_Dog_ow_HP_Back);
	Info_AddChoice		(Dia_Dog_ow_HP,"Lebensenergie + 4"		,Dia_Dog_ow_HP_1);
	Info_AddChoice		(Dia_Dog_ow_HP,"Lebensenergie + 20"		,Dia_Dog_ow_HP_5);
};

func void Dia_Dog_di_HP_info () 
{ 
 Info_ClearChoices (Dia_Dog_di_HP);
	Info_AddChoice		(Dia_Dog_di_HP, DIALOG_BACK,Dia_Dog_di_HP_Back);
	Info_AddChoice		(Dia_Dog_di_HP,"Lebensenergie + 4"		,Dia_Dog_di_HP_1);
	Info_AddChoice		(Dia_Dog_di_HP,"Lebensenergie + 20"		,Dia_Dog_di_HP_5);
}; 

func void Dia_Dog_di_HP_Back ()
{
 Info_ClearChoices (Dia_Dog_di_HP);
};

func void Dia_Dog_di_HP_1 ()
{
	if (D_LP>= 1)
	{
		D_LP = D_LP - 1;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 4;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 4;
		D_HP = D_HP + 4;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_di_HP);
	Info_AddChoice		(Dia_Dog_di_HP, DIALOG_BACK,Dia_Dog_di_HP_Back);
	Info_AddChoice		(Dia_Dog_di_HP,"Lebensenergie + 4"		,Dia_Dog_di_HP_1);
	Info_AddChoice		(Dia_Dog_di_HP,"Lebensenergie + 20"		,Dia_Dog_di_HP_5);
};

func void Dia_Dog_di_HP_5 ()
{
	if (D_LP>= 5)
	{
		D_LP = D_LP - 5;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
		D_HP = D_HP + 20;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_di_HP);
	Info_AddChoice		(Dia_Dog_di_HP, DIALOG_BACK,Dia_Dog_di_HP_Back);
	Info_AddChoice		(Dia_Dog_di_HP,"Lebensenergie + 4"		,Dia_Dog_di_HP_1);
	Info_AddChoice		(Dia_Dog_di_HP,"Lebensenergie + 20"		,Dia_Dog_di_HP_5);
};
func void Dia_Dog_addon_HP_info () 
{ 
 Info_ClearChoices (Dia_Dog_addon_HP);
	Info_AddChoice		(Dia_Dog_addon_HP, DIALOG_BACK,Dia_Dog_addon_HP_Back);
	Info_AddChoice		(Dia_Dog_addon_HP,"Lebensenergie + 4"		,Dia_Dog_addon_HP_1);
	Info_AddChoice		(Dia_Dog_addon_HP,"Lebensenergie + 20"		,Dia_Dog_addon_HP_5);
}; 

func void Dia_Dog_addon_HP_Back ()
{
 Info_ClearChoices (Dia_Dog_addon_HP);
};

func void Dia_Dog_addon_HP_1 ()
{
	if (D_LP>= 1)
	{
		D_LP = D_LP - 1;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 4;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 4;
		D_HP = D_HP + 4;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_addon_HP);
	Info_AddChoice		(Dia_Dog_addon_HP, DIALOG_BACK,Dia_Dog_addon_HP_Back);
	Info_AddChoice		(Dia_Dog_addon_HP,"Lebensenergie + 4"		,Dia_Dog_addon_HP_1);
	Info_AddChoice		(Dia_Dog_addon_HP,"Lebensenergie + 20"		,Dia_Dog_addon_HP_5);
};

func void Dia_Dog_addon_HP_5 ()
{
	if (D_LP>= 5)
	{
		D_LP = D_LP - 5;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 20;
		D_HP = D_HP + 20;
		PrintScreen	("Draco hat nun mehr Lebenskraft!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_addon_HP);
	Info_AddChoice		(Dia_Dog_addon_HP, DIALOG_BACK,Dia_Dog_addon_HP_Back);
	Info_AddChoice		(Dia_Dog_addon_HP,"Lebensenergie + 4"		,Dia_Dog_addon_HP_1);
	Info_AddChoice		(Dia_Dog_addon_HP,"Lebensenergie + 20"		,Dia_Dog_addon_HP_5);
};
instance Dia_Dog_IQ   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =971; 
   condition   =   Dia_Dog_IQ_condition; 
   information     = Dia_Dog_IQ_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Intelligenz"; 
}; 

instance Dia_Dog_ow_IQ   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =971; 
   condition   =   Dia_Dog_IQ_condition; 
   information     = Dia_Dog_ow_IQ_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Intelligenz"; 
}; 
instance Dia_Dog_di_IQ   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =971; 
   condition   =   Dia_Dog_IQ_condition; 
   information     = Dia_Dog_di_IQ_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Intelligenz"; 
}; 
instance Dia_Dog_addon_IQ   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =971; 
   condition   =   Dia_Dog_IQ_condition; 
   information     = Dia_Dog_addon_IQ_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Intelligenz"; 
}; 
 
func int Dia_Dog_IQ_condition () 
{ 
   IF (dogmenu==3) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_IQ_info () 
{ 
 Info_ClearChoices (Dia_Dog_IQ);
	Info_AddChoice		(Dia_Dog_IQ, DIALOG_BACK,Dia_Dog_IQ_Back);
	Info_AddChoice		(Dia_Dog_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_IQ_1);
	Info_AddChoice		(Dia_Dog_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_IQ_5);
}; 

func void Dia_Dog_IQ_Back ()
{
 Info_ClearChoices (Dia_Dog_IQ);
};

func void Dia_Dog_IQ_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		
		D_IQ =D_IQ +1;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_IQ);
	Info_AddChoice		(Dia_Dog_IQ, DIALOG_BACK,Dia_Dog_IQ_Back);
	Info_AddChoice		(Dia_Dog_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_IQ_1);
	Info_AddChoice		(Dia_Dog_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_IQ_5);
};

func void Dia_Dog_IQ_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		
		D_IQ =D_IQ +5;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_IQ);
	Info_AddChoice		(Dia_Dog_IQ, DIALOG_BACK,Dia_Dog_IQ_Back);
	Info_AddChoice		(Dia_Dog_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_IQ_1);
	Info_AddChoice		(Dia_Dog_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_IQ_5);
};


func void Dia_Dog_ow_IQ_info () 
{ 
 Info_ClearChoices (Dia_Dog_ow_IQ);
	Info_AddChoice		(Dia_Dog_ow_IQ, DIALOG_BACK,Dia_Dog_ow_IQ_Back);
	Info_AddChoice		(Dia_Dog_ow_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_ow_IQ_1);
	Info_AddChoice		(Dia_Dog_ow_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_ow_IQ_5);
}; 

func void Dia_Dog_ow_IQ_Back ()
{
 Info_ClearChoices (Dia_Dog_ow_IQ);
};

func void Dia_Dog_ow_IQ_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		
		D_IQ =D_IQ +1;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_ow_IQ);
	Info_AddChoice		(Dia_Dog_ow_IQ, DIALOG_BACK,Dia_Dog_ow_IQ_Back);
	Info_AddChoice		(Dia_Dog_ow_IQ,"Intelligenz + 1  (2 LP)"		,Dia_Dog_ow_IQ_1);
	Info_AddChoice		(Dia_Dog_ow_IQ,"Intelligenz + 5  (10 LP)"		,Dia_Dog_ow_IQ_5);
};

func void Dia_Dog_ow_IQ_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		
		D_IQ =D_IQ +5;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_ow_IQ);
	Info_AddChoice		(Dia_Dog_ow_IQ, DIALOG_BACK,Dia_Dog_ow_IQ_Back);
	Info_AddChoice		(Dia_Dog_ow_IQ,"Intelligenz + 1  (2 LP)"		,Dia_Dog_ow_IQ_1);
	Info_AddChoice		(Dia_Dog_ow_IQ,"Intelligenz + 5  (10 LP)"		,Dia_Dog_ow_IQ_5);
};

func void Dia_Dog_di_IQ_info () 
{ 
 Info_ClearChoices (Dia_Dog_di_IQ);
	Info_AddChoice		(Dia_Dog_di_IQ, DIALOG_BACK,Dia_Dog_di_IQ_Back);
	Info_AddChoice		(Dia_Dog_di_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_di_IQ_1);
	Info_AddChoice		(Dia_Dog_di_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_di_IQ_5);
}; 

func void Dia_Dog_di_IQ_Back ()
{
 Info_ClearChoices (Dia_Dog_di_IQ);
};

func void Dia_Dog_di_IQ_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		
		D_IQ =D_IQ +1;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_di_IQ);
	Info_AddChoice		(Dia_Dog_di_IQ, DIALOG_BACK,Dia_Dog_di_IQ_Back);
	Info_AddChoice		(Dia_Dog_di_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_di_IQ_1);
	Info_AddChoice		(Dia_Dog_di_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_di_IQ_5);
};

func void Dia_Dog_di_IQ_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		
		D_IQ =D_IQ +5;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_di_IQ);
	Info_AddChoice		(Dia_Dog_di_IQ, DIALOG_BACK,Dia_Dog_di_IQ_Back);
	Info_AddChoice		(Dia_Dog_di_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_di_IQ_1);
	Info_AddChoice		(Dia_Dog_di_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_di_IQ_5);
};

func void Dia_Dog_addon_IQ_info () 
{ 
 Info_ClearChoices (Dia_Dog_addon_IQ);
	Info_AddChoice		(Dia_Dog_addon_IQ, DIALOG_BACK,Dia_Dog_addon_IQ_Back);
	Info_AddChoice		(Dia_Dog_addon_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_addon_IQ_1);
	Info_AddChoice		(Dia_Dog_addon_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_addon_IQ_5);
}; 

func void Dia_Dog_addon_IQ_Back ()
{
 Info_ClearChoices (Dia_Dog_addon_IQ);
};

func void Dia_Dog_addon_IQ_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		
		D_IQ =D_IQ +1;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_addon_IQ);
	Info_AddChoice		(Dia_Dog_addon_IQ, DIALOG_BACK,Dia_Dog_addon_IQ_Back);
	Info_AddChoice		(Dia_Dog_addon_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_addon_IQ_1);
	Info_AddChoice		(Dia_Dog_addon_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_addon_IQ_5);
};

func void Dia_Dog_addon_IQ_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		
		D_IQ =D_IQ +5;
		PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_addon_IQ);
	Info_AddChoice		(Dia_Dog_addon_IQ, DIALOG_BACK,Dia_Dog_addon_IQ_Back);
	Info_AddChoice		(Dia_Dog_addon_IQ,"Intelligenz + 1 (2 LP)"		,Dia_Dog_addon_IQ_1);
	Info_AddChoice		(Dia_Dog_addon_IQ,"Intelligenz + 5 (10 LP)"		,Dia_Dog_addon_IQ_5);
};

//////////////////////////////////////////////////////////// 
//////////////             RST 
/////////////////////////////////////////////////////// 
instance Dia_Dog_RST   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =989; 
   condition   =   Dia_Dog_RST_condition; 
   information     = Dia_Dog_RST_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zähigkeit (Rüstungsschutz)"; 
};

instance Dia_Dog_ow_RST   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =989; 
   condition   =   Dia_Dog_RST_condition; 
   information     = Dia_Dog_ow_RST_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zähigkeit (Rüstungsschutz)"; 
}; 

instance Dia_Dog_di_RST   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =989; 
   condition   =   Dia_Dog_RST_condition; 
   information     = Dia_Dog_di_RST_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zähigkeit (Rüstungsschutz)"; 
}; 

instance Dia_Dog_addon_RST   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =989; 
   condition   =   Dia_Dog_RST_condition; 
   information     = Dia_Dog_addon_RST_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zähigkeit (Rüstungsschutz)"; 
};  
 
func int Dia_Dog_RST_condition () 
{ 
   IF (dogmenu==3) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_RST_info () 
{ 
 
Info_ClearChoices (Dia_Dog_RST);
	Info_AddChoice		(Dia_Dog_RST, DIALOG_BACK,Dia_Dog_RST_Back);
	Info_AddChoice		(Dia_Dog_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_RST_1);
	Info_AddChoice		(Dia_Dog_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_RST_5);
}; 

func void Dia_Dog_RST_Back ()
{
 Info_ClearChoices (Dia_Dog_RST);
};

func void Dia_Dog_RST_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +1;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +1;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +1;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +1;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +1;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +1;
		
		D_RST_blunt=D_RST_blunt+1;
		D_RST_edge=D_RST_edge+1;
		D_RST_point=D_RST_point+1;
		D_RST_fire=D_RST_fire+1;
		D_RST_fly=D_RST_fly+1;
		D_RST_magic=D_RST_magic+1;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_RST);
	Info_AddChoice		(Dia_Dog_RST, DIALOG_BACK,Dia_Dog_RST_Back);
	Info_AddChoice		(Dia_Dog_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_RST_1);
	Info_AddChoice		(Dia_Dog_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_RST_5);
};

func void Dia_Dog_RST_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +5;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +5;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +5;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +5;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +5;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +5;
		
		D_RST_blunt=D_RST_blunt+5;
		D_RST_edge=D_RST_edge+5;
		D_RST_point=D_RST_point+5;
		D_RST_fire=D_RST_fire+5;
		D_RST_fly=D_RST_fly+5;
		D_RST_magic=D_RST_magic+5;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_RST);
	Info_AddChoice		(Dia_Dog_RST, DIALOG_BACK,Dia_Dog_RST_Back);
	Info_AddChoice		(Dia_Dog_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_RST_1);
	Info_AddChoice		(Dia_Dog_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_RST_5);
}; 

func void Dia_Dog_ow_RST_info () 
{ 
 
Info_ClearChoices (Dia_Dog_ow_RST);
	Info_AddChoice		(Dia_Dog_ow_RST, DIALOG_BACK,Dia_Dog_ow_RST_Back);
	Info_AddChoice		(Dia_Dog_ow_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_ow_RST_1);
	Info_AddChoice		(Dia_Dog_ow_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_ow_RST_5);
}; 

func void Dia_Dog_ow_RST_Back ()
{
 Info_ClearChoices (Dia_Dog_ow_RST);
};

func void Dia_Dog_ow_RST_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +1;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +1;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +1;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +1;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +1;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +1;
		
		D_RST_blunt=D_RST_blunt+1;
		D_RST_edge=D_RST_edge+1;
		D_RST_point=D_RST_point+1;
		D_RST_fire=D_RST_fire+1;
		D_RST_fly=D_RST_fly+1;
		D_RST_magic=D_RST_magic+1;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_ow_RST);
	Info_AddChoice		(Dia_Dog_ow_RST, DIALOG_BACK,Dia_Dog_ow_RST_Back);
	Info_AddChoice		(Dia_Dog_ow_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_ow_RST_1);
	Info_AddChoice		(Dia_Dog_ow_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_ow_RST_5);
};

func void Dia_Dog_ow_RST_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +5;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +5;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +5;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +5;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +5;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +5;
		
		D_RST_blunt=D_RST_blunt+5;
		D_RST_edge=D_RST_edge+5;
		D_RST_point=D_RST_point+5;
		D_RST_fire=D_RST_fire+5;
		D_RST_fly=D_RST_fly+5;
		D_RST_magic=D_RST_magic+5;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_ow_RST);
	Info_AddChoice		(Dia_Dog_ow_RST, DIALOG_BACK,Dia_Dog_ow_RST_Back);
	Info_AddChoice		(Dia_Dog_ow_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_ow_RST_1);
	Info_AddChoice		(Dia_Dog_ow_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_ow_RST_5);
}; 

func void Dia_Dog_di_RST_info () 
{ 
 
Info_ClearChoices (Dia_Dog_di_RST);
	Info_AddChoice		(Dia_Dog_di_RST, DIALOG_BACK,Dia_Dog_di_RST_Back);
	Info_AddChoice		(Dia_Dog_di_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_di_RST_1);
	Info_AddChoice		(Dia_Dog_di_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_di_RST_5);
}; 

func void Dia_Dog_di_RST_Back ()
{
 Info_ClearChoices (Dia_Dog_di_RST);
};

func void Dia_Dog_di_RST_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +1;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +1;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +1;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +1;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +1;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +1;
		
		D_RST_blunt=D_RST_blunt+1;
		D_RST_edge=D_RST_edge+1;
		D_RST_point=D_RST_point+1;
		D_RST_fire=D_RST_fire+1;
		D_RST_fly=D_RST_fly+1;
		D_RST_magic=D_RST_magic+1;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_di_RST);
	Info_AddChoice		(Dia_Dog_di_RST, DIALOG_BACK,Dia_Dog_di_RST_Back);
	Info_AddChoice		(Dia_Dog_di_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_di_RST_1);
	Info_AddChoice		(Dia_Dog_di_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_di_RST_5);
};

func void Dia_Dog_di_RST_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +5;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +5;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +5;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +5;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +5;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +5;
		
		D_RST_blunt=D_RST_blunt+5;
		D_RST_edge=D_RST_edge+5;
		D_RST_point=D_RST_point+5;
		D_RST_fire=D_RST_fire+5;
		D_RST_fly=D_RST_fly+5;
		D_RST_magic=D_RST_magic+5;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_di_RST);
	Info_AddChoice		(Dia_Dog_di_RST, DIALOG_BACK,Dia_Dog_di_RST_Back);
	Info_AddChoice		(Dia_Dog_di_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_di_RST_1);
	Info_AddChoice		(Dia_Dog_di_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_di_RST_5);
}; 

func void Dia_Dog_addon_RST_info () 
{ 
 
Info_ClearChoices (Dia_Dog_addon_RST);
	Info_AddChoice		(Dia_Dog_addon_RST, DIALOG_BACK,Dia_Dog_addon_RST_Back);
	Info_AddChoice		(Dia_Dog_addon_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_addon_RST_1);
	Info_AddChoice		(Dia_Dog_addon_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_addon_RST_5);
}; 

func void Dia_Dog_addon_RST_Back ()
{
 Info_ClearChoices (Dia_Dog_addon_RST);
};

func void Dia_Dog_addon_RST_1 ()
{
	if (D_LP>= 2)
	{
		D_LP = D_LP - 2;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +1;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +1;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +1;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +1;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +1;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +1;
		
		D_RST_blunt=D_RST_blunt+1;
		D_RST_edge=D_RST_edge+1;
		D_RST_point=D_RST_point+1;
		D_RST_fire=D_RST_fire+1;
		D_RST_fly=D_RST_fly+1;
		D_RST_magic=D_RST_magic+1;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_addon_RST);
	Info_AddChoice		(Dia_Dog_addon_RST, DIALOG_BACK,Dia_Dog_addon_RST_Back);
	Info_AddChoice		(Dia_Dog_addon_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_addon_RST_1);
	Info_AddChoice		(Dia_Dog_addon_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_addon_RST_5);
};

func void Dia_Dog_addon_RST_5 ()
{
	if (D_LP>= 10)
	{
		D_LP = D_LP - 10;
		self.protection	[PROT_BLUNT]		=	self.protection	[PROT_BLUNT] +5;
		self.protection	[PROT_EDGE]		=	self.protection	[PROT_EDGE] +5;
		self.protection	[PROT_POINT]		=	self.protection	[PROT_POINT] +5;
		self.protection	[PROT_FIRE]		=	self.protection	[PROT_FIRE] +5;
		self.protection	[PROT_FLY]		=	self.protection	[PROT_FLY] +5;
		self.protection	[PROT_MAGIC]		=	self.protection	[PROT_MAGIC] +5;
		
		D_RST_blunt=D_RST_blunt+5;
		D_RST_edge=D_RST_edge+5;
		D_RST_point=D_RST_point+5;
		D_RST_fire=D_RST_fire+5;
		D_RST_fly=D_RST_fly+5;
		D_RST_magic=D_RST_magic+5;
		PrintScreen	("Draco ist zäher geworden!", -1, -1, FONT_SCREEN, 2);
	}
	else
	{
		PrintScreen	("Nicht genug Lernpunkte!", -1, -1, FONT_SCREEN, 2);
	};
Info_ClearChoices (Dia_Dog_addon_RST);
	Info_AddChoice		(Dia_Dog_addon_RST, DIALOG_BACK,Dia_Dog_addon_RST_Back);
	Info_AddChoice		(Dia_Dog_addon_RST,"Zähigkeit + 1 (2 LP)"		,Dia_Dog_addon_RST_1);
	Info_AddChoice		(Dia_Dog_addon_RST,"Zähigkeit + 5 (10 LP)"		,Dia_Dog_addon_RST_5);
}; 
//////////////////////////////////////////////////////////// 
//////////////             RST 
/////////////////////////////////////////////////////// 
instance Dia_Dog_VER   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =988; 
   condition   =   Dia_Dog_VER_condition; 
   information     = Dia_Dog_VER_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Verhalten"; 
}; 

instance Dia_Dog_ow_VER   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =988; 
   condition   =   Dia_Dog_VER_condition; 
   information     = Dia_Dog_VER_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Verhalten"; 
}; 

instance Dia_Dog_di_VER   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =988; 
   condition   =   Dia_Dog_VER_condition; 
   information     = Dia_Dog_VER_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Verhalten"; 
}; 

instance Dia_Dog_addon_VER   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =988; 
   condition   =   Dia_Dog_VER_condition; 
   information     = Dia_Dog_VER_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Verhalten"; 
}; 
 
func int Dia_Dog_VER_condition () 
{ 
   IF (dogmenu==3) 
   { 
   return TRUE; 
   }; 
}; 
  
func void Dia_Dog_VER_info () 
{ 
 dogmenu=4;
}; 
instance Dia_Dog_v_back   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =1019; 
   condition   =   Dia_Dog_v_back_condition; 
   information     = Dia_Dog_v_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
};
instance Dia_Dog_ow_v_back   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =1019; 
   condition   =   Dia_Dog_v_back_condition; 
   information     = Dia_Dog_v_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
};
instance Dia_Dog_di_v_back   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =1019; 
   condition   =   Dia_Dog_v_back_condition; 
   information     = Dia_Dog_v_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
};
instance Dia_Dog_addon_v_back   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =1019; 
   condition   =   Dia_Dog_v_back_condition; 
   information     = Dia_Dog_v_back_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Zurück"; 
}; 
 
func int Dia_Dog_v_back_condition () 
{ 
   IF (dogmenu==4) 
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_Dog_v_back_info () 
{ 
  Dogmenu=3;
}; 
//////////////////////////////////////////////////////////// 
//////////////             VER_Aggro 
/////////////////////////////////////////////////////// 
instance Dia_dog_VER_Aggro   (C_INFO) 
{ 
   npc     = dog; 
   nr          =300; 
   condition   =   Dia_dog_VER_Aggro_condition; 
   information     = Dia_dog_VER_Aggro_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aggressiver Kampfstil (5 LP 30 Intelligenz)"; 
}; 
instance Dia_dog_di_VER_Aggro   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =300; 
   condition   =   Dia_dog_VER_Aggro_condition; 
   information     = Dia_dog_VER_Aggro_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aggressiver Kampfstil (5 LP 30 Intelligenz)"; 
}; 
instance Dia_dog_ow_VER_Aggro   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =300; 
   condition   =   Dia_dog_VER_Aggro_condition; 
   information     = Dia_dog_VER_Aggro_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aggressiver Kampfstil (5 LP 30 Intelligenz)"; 
}; 
instance Dia_dog_addon_VER_Aggro   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =300; 
   condition   =   Dia_dog_VER_Aggro_condition; 
   information     = Dia_dog_VER_Aggro_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Aggressiver Kampfstil (5 LP 30 Intelligenz)"; 
}; 
 
func int Dia_dog_VER_Aggro_condition () 
{ 
   IF (dogmenu == 4) 
   && (D_CAN_AGGRO == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_VER_Aggro_info () 
{ 
if (D_LP>= 5)
&& (D_IQ >=30)
{
D_CAN_AGGRO = TRUE;
PrintScreen	("Draco hat den aggressiven Kampfstil gelernt!", -1, -1, FONT_SCREEN, 2);
D_LP = D_LP - 5;
}
else
{
PrintScreen	("Zu wenig Lernpunkte oder Intelligenz!", -1, -1, FONT_SCREEN, 2);
};
 
}; 

//////////////////////////////////////////////////////////// 
//////////////             VER_Def 
/////////////////////////////////////////////////////// 
instance Dia_dog_VER_Def   (C_INFO) 
{ 
   npc     = dog; 
   nr          =301; 
   condition   =   Dia_dog_VER_Def_condition; 
   information     = Dia_dog_VER_Def_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Defensiver Kampfstil (5 LP 45 Intelligenz)"; 
}; 

instance Dia_dog_ow_VER_Def   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =301; 
   condition   =   Dia_dog_VER_Def_condition; 
   information     = Dia_dog_VER_Def_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Defensiver Kampfstil (5 LP 45 Intelligenz)"; 
}; 

instance Dia_dog_di_VER_Def   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =301; 
   condition   =   Dia_dog_VER_Def_condition; 
   information     = Dia_dog_VER_Def_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Defensiver Kampfstil (5 LP 45 Intelligenz)"; 
}; 

instance Dia_dog_addon_VER_Def   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =301; 
   condition   =   Dia_dog_VER_Def_condition; 
   information     = Dia_dog_VER_Def_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Defensiver Kampfstil (5 LP 45 Intelligenz)"; 
}; 
 
func int Dia_dog_VER_Def_condition () 
{ 
   IF (dogmenu == 4) 
    && (D_CAN_DEF == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_VER_Def_info () 
{ 
 if (D_LP>= 5)
&& (D_IQ >=45)
{
D_CAN_def = TRUE;
PrintScreen	("Draco hat den defensiven Kampfstil gelernt!", -1, -1, FONT_SCREEN, 2);
D_LP = D_LP - 5;
}
else
{
PrintScreen	("Zu wenig Lernpunkte oder Intelligenz!", -1, -1, FONT_SCREEN, 2);
};
}; 

//////////////////////////////////////////////////////////// 
//////////////             VER_Pass 
/////////////////////////////////////////////////////// 
instance Dia_dog_VER_Pass   (C_INFO) 
{ 
   npc     = dog; 
   nr          =299; 
   condition   =   Dia_dog_VER_Pass_condition; 
   information     = Dia_dog_VER_Pass_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Passives Kampfverhalten (5 LP 20 Intelligenz)"; 
}; 
instance Dia_dog_ow_VER_Pass   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =299; 
   condition   =   Dia_dog_VER_Pass_condition; 
   information     = Dia_dog_VER_Pass_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Passives Kampfverhalten (5 LP 20 Intelligenz)"; 
}; 
instance Dia_dog_di_VER_Pass   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =299; 
   condition   =   Dia_dog_VER_Pass_condition; 
   information     = Dia_dog_VER_Pass_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Passives Kampfverhalten (5 LP 20 Intelligenz)"; 
}; 
instance Dia_dog_addon_VER_Pass   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =299; 
   condition   =   Dia_dog_VER_Pass_condition; 
   information     = Dia_dog_VER_Pass_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Passives Kampfverhalten (5 LP 20 Intelligenz)"; 
}; 
 
func int Dia_dog_VER_Pass_condition () 
{ 
   IF (dogmenu == 4) 
    && (D_CAN_pass == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_VER_Pass_info () 
{ 
if (D_LP>= 5)
&& (D_IQ >=20)
{
D_CAN_pass = TRUE;
PrintScreen	("Draco hat das passive Kampfverhalten gelernt!", -1, -1, FONT_SCREEN, 2);
D_LP = D_LP - 5;
}
else
{
PrintScreen	("Zu wenig Lernpunkte oder Intelligenz!", -1, -1, FONT_SCREEN, 2);
};
 
}; 

//////////////////////////////////////////////////////////// 
//////////////             VER_Pass 
/////////////////////////////////////////////////////// 
instance Dia_dog_VER_abl  (C_INFO) 
{ 
   npc     = dog; 
   nr          =303; 
   condition   =   Dia_dog_VER_abl_condition; 
   information     = Dia_dog_VER_abl_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Ablenken der Gegner (5 LP 60 Intelligenz)"; 
}; 

instance Dia_dog_ow_VER_abl  (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =303; 
   condition   =   Dia_dog_VER_abl_condition; 
   information     = Dia_dog_VER_abl_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Ablenken der Gegner (5 LP 60 Intelligenz)"; 
}; 
instance Dia_dog_di_VER_abl  (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =303; 
   condition   =   Dia_dog_VER_abl_condition; 
   information     = Dia_dog_VER_abl_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Ablenken der Gegner (5 LP 60 Intelligenz)"; 
}; 
instance Dia_dog_addon_VER_abl  (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =303; 
   condition   =   Dia_dog_VER_abl_condition; 
   information     = Dia_dog_VER_abl_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Ablenken der Gegner (5 LP 60 Intelligenz)"; 
};  
func int Dia_dog_VER_abl_condition () 
{ 
   IF (dogmenu == 4) 
    && (D_CAN_ABL == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_VER_abl_info () 
{ 
 if (D_LP>= 5)
&& (D_IQ >=60)
{
D_CAN_abl = TRUE;
PrintScreen	("Draco hat gelernt den Gegner abzulenken!", -1, -1, FONT_SCREEN, 2);
D_LP = D_LP - 5;
}
else
{
PrintScreen	("Zu wenig Lernpunkte oder Intelligenz!", -1, -1, FONT_SCREEN, 2);
};
}; 
instance Dia_dog_VER_noatt  (C_INFO) 
{ 
   npc     = dog; 
   nr          =308; 
   condition   =   Dia_dog_VER_noatt_condition; 
   information     = Dia_dog_VER_noatt_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gezügeltes Angriffsverhalten (5 LP 30 Intelligenz)"; 
}; 
instance Dia_dog_ow_VER_noatt  (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =308; 
   condition   =   Dia_dog_VER_noatt_condition; 
   information     = Dia_dog_VER_noatt_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gezügeltes Angriffsverhalten (5 LP 30 Intelligenz)"; 
}; 
instance Dia_dog_di_VER_noatt  (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =308; 
   condition   =   Dia_dog_VER_noatt_condition; 
   information     = Dia_dog_VER_noatt_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gezügeltes Angriffsverhalten (5 LP 30 Intelligenz)"; 
}; 
instance Dia_dog_addon_VER_noatt  (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =308; 
   condition   =   Dia_dog_VER_noatt_condition; 
   information     = Dia_dog_VER_noatt_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gezügeltes Angriffsverhalten (5 LP 30 Intelligenz)"; 
}; 
 
func int Dia_dog_VER_noatt_condition () 
{ 
   IF (dogmenu == 4) 
    && (D_noatt == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_VER_noatt_info () 
{ 
 if (D_LP>= 5)
&& (D_IQ >=30)
{
D_noatt = TRUE;
PrintScreen	("Draco hat gelernt seine Kampfwut zu drosseln!", -1, -1, FONT_SCREEN, 2);
D_LP = D_LP - 5;
}
else
{
PrintScreen	("Zu wenig Lernpunkte oder Intelligenz!", -1, -1, FONT_SCREEN, 2);
};
}; 

//////////////////////////////////////////////////////////// 
//////////////             TRAIN_SUCH 
/////////////////////////////////////////////////////// 
instance Dia_dog_TRAIN_SUCH   (C_INFO) 
{ 
   npc     = dog; 
   nr          =305; 
   condition   =   Dia_dog_TRAIN_SUCH_condition; 
   information     = Dia_dog_TRAIN_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gegenstände Suchen (5 LP 25 Intelligenz)"; 
}; 
instance Dia_dog_ow_TRAIN_SUCH   (C_INFO) 
{ 
   npc     = dog_ow; 
   nr          =305; 
   condition   =   Dia_dog_TRAIN_SUCH_condition; 
   information     = Dia_dog_TRAIN_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gegenstände Suchen (5 LP 25 Intelligenz)"; 
}; 
instance Dia_dog_di_TRAIN_SUCH   (C_INFO) 
{ 
   npc     = dog_di; 
   nr          =305; 
   condition   =   Dia_dog_TRAIN_SUCH_condition; 
   information     = Dia_dog_TRAIN_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gegenstände Suchen (5 LP 25 Intelligenz)"; 
}; 
instance Dia_dog_addon_TRAIN_SUCH   (C_INFO) 
{ 
   npc     = dog_addon; 
   nr          =305; 
   condition   =   Dia_dog_TRAIN_SUCH_condition; 
   information     = Dia_dog_TRAIN_SUCH_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Gegenstände Suchen (5 LP 25 Intelligenz)"; 
}; 
 
func int Dia_dog_TRAIN_SUCH_condition () 
{ 
   IF (Dogmenu == 4) 
   && (D_CAN_SUCH == FALSE)
   { 
   return TRUE; 
   }; 
}; 
 
func void Dia_dog_TRAIN_SUCH_info () 
{ 
  if (D_LP>= 5)
&& (D_IQ >=25)
{
D_CAN_such = TRUE;
PrintScreen	("Draco kann nun Gegenstände suchen!", -1, -1, FONT_SCREEN, 2);
D_LP = D_LP - 5;
}
else
{
PrintScreen	("Zu wenig Lernpunkte oder Intelligenz!", -1, -1, FONT_SCREEN, 2);
};
}; 


instance Dia_Dog_food   (C_INFO) 
{ 
   npc     = Dog; 
   nr          =910; 
   condition   =   Dia_Dog_food_condition; 
   information     = Dia_Dog_food_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Füttern"; 
}; 

instance Dia_Dog_ow_food   (C_INFO) 
{ 
   npc     = Dog_ow; 
   nr          =910; 
   condition   =   Dia_Dog_food_condition; 
   information     = Dia_Dog_ow_food_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Füttern"; 
}; 

instance Dia_Dog_di_food   (C_INFO) 
{ 
   npc     = Dog_di; 
   nr          =910; 
   condition   =   Dia_Dog_food_condition; 
   information     = Dia_Dog_di_food_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Füttern"; 
}; 

instance Dia_Dog_addon_food   (C_INFO) 
{ 
   npc     = Dog_addon; 
   nr          =910; 
   condition   =   Dia_Dog_food_condition; 
   information     = Dia_Dog_addon_food_info; 
   important     =  FALSE; 
   permanent     = TRUE; 
   Description    = "Füttern"; 
}; 
 
func int Dia_Dog_food_condition () 
{ 
   IF (dogmenu==0) 
   { 
   return TRUE; 
   }; 
}; 
  
func void Dia_Dog_food_info () 
{ 
 Info_ClearChoices (Dia_Dog_food);
	Info_AddChoice		(Dia_Dog_food, DIALOG_BACK,Dia_Dog_food_Back);
	Info_AddChoice		(Dia_Dog_food,"Fleischkeule"		,Dia_Dog_food_1);
	Info_AddChoice		(Dia_Dog_food, "Schinken"		,Dia_Dog_food_2);
	Info_AddChoice		(Dia_Dog_food, "Mehrere Fleischkeulen"		,Dia_Dog_food_3);
}; 


FUNC VOID Dia_Dog_food_Back ()
{
	Info_ClearChoices (Dia_Dog_food);
};

func void Dia_Dog_food_1 ()
{
	
	if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		if (self.attribute[ATR_HITPOINTS]>=(self.attribute[ATR_HITPOINTS_MAX]-10))
		{ 
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		}
		else
		{
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS]+10;
			  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_food);
	Info_AddChoice		(Dia_Dog_food, DIALOG_BACK,Dia_Dog_food_Back);
	Info_AddChoice		(Dia_Dog_food,"Fleischkeule"		,Dia_Dog_food_1);
	Info_AddChoice		(Dia_Dog_food, "Schinken"		,Dia_Dog_food_2);
	Info_AddChoice		(Dia_Dog_food, "Mehrere Fleischkeulen"		,Dia_Dog_food_3);
};

func void Dia_Dog_food_2 ()
{

	if (Npc_HasItems(hero,ItFo_Bacon)>=1)
	{
		Npc_RemoveInvItems(hero,ItFo_Bacon,1);
		if (self.attribute[ATR_HITPOINTS]<=self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		};
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
	hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_food);
	Info_AddChoice		(Dia_Dog_food, DIALOG_BACK,Dia_Dog_food_Back);
	Info_AddChoice		(Dia_Dog_food,"Fleischkeule"		,Dia_Dog_food_1);
	Info_AddChoice		(Dia_Dog_food, "Schinken"		,Dia_Dog_food_2);
	Info_AddChoice		(Dia_Dog_food, "Mehrere Fleischkeulen"		,Dia_Dog_food_3);
};

func void Dia_Dog_food_3 ()
{
var int hphp;
var int fleischzahl;
if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		hphp = self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS];
		hphp=hphp/10;
		fleischzahl= Npc_HasItems(hero,ItFoMuttonRaw);
		if (Npc_HasItems(hero,ItFoMuttonRaw)>=hphp)
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,hphp);
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
		  dogsay (self, other);
		}
		else
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,fleischzahl);
		self.attribute[ATR_HITPOINTS]=(self.attribute[ATR_HITPOINTS]+ (fleischzahl*10));
		  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);

Info_ClearChoices (Dia_Dog_food);
	Info_AddChoice		(Dia_Dog_food, DIALOG_BACK,Dia_Dog_food_Back);
	Info_AddChoice		(Dia_Dog_food,"Fleischkeule"		,Dia_Dog_food_1);
	Info_AddChoice		(Dia_Dog_food, "Schinken"		,Dia_Dog_food_2);
	Info_AddChoice		(Dia_Dog_food, "Mehrere Fleischkeulen"		,Dia_Dog_food_3);
};

func void Dia_Dog_ow_food_info () 
{ 
 Info_ClearChoices (Dia_Dog_ow_food);
	Info_AddChoice		(Dia_Dog_ow_food, DIALOG_BACK,Dia_Dog_ow_food_Back);
	Info_AddChoice		(Dia_Dog_ow_food,"Fleischkeule"		,Dia_Dog_ow_food_1);
	Info_AddChoice		(Dia_Dog_ow_food, "Schinken"		,Dia_Dog_ow_food_2);
	Info_AddChoice		(Dia_Dog_ow_food, "Mehrere Fleischkeulen"		,Dia_Dog_ow_food_3);
}; 


FUNC VOID Dia_Dog_ow_food_Back ()
{
	Info_ClearChoices (Dia_Dog_ow_food);
};

func void Dia_Dog_ow_food_1 ()
{
	
	if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		if (self.attribute[ATR_HITPOINTS]>=(self.attribute[ATR_HITPOINTS_MAX]-10))
		{ 
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		}
		else
		{
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS]+10;
			  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_ow_food);
	Info_AddChoice		(Dia_Dog_ow_food, DIALOG_BACK,Dia_Dog_ow_food_Back);
	Info_AddChoice		(Dia_Dog_ow_food,"Fleischkeule"		,Dia_Dog_ow_food_1);
	Info_AddChoice		(Dia_Dog_ow_food, "Schinken"		,Dia_Dog_ow_food_2);
	Info_AddChoice		(Dia_Dog_ow_food, "Mehrere Fleischkeulen"		,Dia_Dog_ow_food_3);
};

func void Dia_Dog_ow_food_2 ()
{

	if (Npc_HasItems(hero,ItFo_Bacon)>=1)
	{
		Npc_RemoveInvItems(hero,ItFo_Bacon,1);
		if (self.attribute[ATR_HITPOINTS]<=self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		};
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
	hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_ow_food);
	Info_AddChoice		(Dia_Dog_ow_food, DIALOG_BACK,Dia_Dog_ow_food_Back);
	Info_AddChoice		(Dia_Dog_ow_food,"Fleischkeule"		,Dia_Dog_ow_food_1);
	Info_AddChoice		(Dia_Dog_ow_food, "Schinken"		,Dia_Dog_ow_food_2);
	Info_AddChoice		(Dia_Dog_ow_food, "Mehrere Fleischkeulen"		,Dia_Dog_ow_food_3);
};

func void Dia_Dog_ow_food_3 ()
{
var int hphp;
var int fleischzahl;
if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		hphp = self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS];
		hphp=hphp/10;
		fleischzahl= Npc_HasItems(hero,ItFoMuttonRaw);
		if (Npc_HasItems(hero,ItFoMuttonRaw)>=hphp)
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,hphp);
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
		  dogsay (self, other);
		}
		else
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,fleischzahl);
		self.attribute[ATR_HITPOINTS]=(self.attribute[ATR_HITPOINTS]+ (fleischzahl*10));
		  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);

Info_ClearChoices (Dia_Dog_ow_food);
	Info_AddChoice		(Dia_Dog_ow_food, DIALOG_BACK,Dia_Dog_ow_food_Back);
	Info_AddChoice		(Dia_Dog_ow_food,"Fleischkeule"		,Dia_Dog_ow_food_1);
	Info_AddChoice		(Dia_Dog_ow_food, "Schinken"		,Dia_Dog_ow_food_2);
	Info_AddChoice		(Dia_Dog_ow_food, "Mehrere Fleischkeulen"		,Dia_Dog_ow_food_3);
};

func void Dia_Dog_di_food_info () 
{ 
 Info_ClearChoices (Dia_Dog_di_food);
	Info_AddChoice		(Dia_Dog_di_food, DIALOG_BACK,Dia_Dog_di_food_Back);
	Info_AddChoice		(Dia_Dog_di_food,"Fleischkeule"		,Dia_Dog_di_food_1);
	Info_AddChoice		(Dia_Dog_di_food, "Schinken"		,Dia_Dog_di_food_2);
	Info_AddChoice		(Dia_Dog_di_food, "Mehrere Fleischkeulen"		,Dia_Dog_di_food_3);
}; 


FUNC VOID Dia_Dog_di_food_Back ()
{
	Info_ClearChoices (Dia_Dog_di_food);
};

func void Dia_Dog_di_food_1 ()
{
	
	if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		if (self.attribute[ATR_HITPOINTS]>=(self.attribute[ATR_HITPOINTS_MAX]-10))
		{ 
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		}
		else
		{
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS]+10;
			  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_di_food);
	Info_AddChoice		(Dia_Dog_di_food, DIALOG_BACK,Dia_Dog_di_food_Back);
	Info_AddChoice		(Dia_Dog_di_food,"Fleischkeule"		,Dia_Dog_di_food_1);
	Info_AddChoice		(Dia_Dog_di_food, "Schinken"		,Dia_Dog_di_food_2);
	Info_AddChoice		(Dia_Dog_di_food, "Mehrere Fleischkeulen"		,Dia_Dog_di_food_3);
};

func void Dia_Dog_di_food_2 ()
{

	if (Npc_HasItems(hero,ItFo_Bacon)>=1)
	{
		Npc_RemoveInvItems(hero,ItFo_Bacon,1);
		if (self.attribute[ATR_HITPOINTS]<=self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		};
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
	hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_di_food);
	Info_AddChoice		(Dia_Dog_di_food, DIALOG_BACK,Dia_Dog_di_food_Back);
	Info_AddChoice		(Dia_Dog_di_food,"Fleischkeule"		,Dia_Dog_di_food_1);
	Info_AddChoice		(Dia_Dog_di_food, "Schinken"		,Dia_Dog_di_food_2);
	Info_AddChoice		(Dia_Dog_di_food, "Mehrere Fleischkeulen"		,Dia_Dog_di_food_3);
};

func void Dia_Dog_di_food_3 ()
{
var int hphp;
var int fleischzahl;
if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		hphp = self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS];
		hphp=hphp/10;
		fleischzahl= Npc_HasItems(hero,ItFoMuttonRaw);
		if (Npc_HasItems(hero,ItFoMuttonRaw)>=hphp)
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,hphp);
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
		  dogsay (self, other);
		}
		else
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,fleischzahl);
		self.attribute[ATR_HITPOINTS]=(self.attribute[ATR_HITPOINTS]+ (fleischzahl*10));
		  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);

Info_ClearChoices (Dia_Dog_di_food);
	Info_AddChoice		(Dia_Dog_di_food, DIALOG_BACK,Dia_Dog_di_food_Back);
	Info_AddChoice		(Dia_Dog_di_food,"Fleischkeule"		,Dia_Dog_di_food_1);
	Info_AddChoice		(Dia_Dog_di_food, "Schinken"		,Dia_Dog_di_food_2);
	Info_AddChoice		(Dia_Dog_di_food, "Mehrere Fleischkeulen"		,Dia_Dog_di_food_3);
};

func void Dia_Dog_addon_food_info () 
{ 
 Info_ClearChoices (Dia_Dog_addon_food);
	Info_AddChoice		(Dia_Dog_addon_food, DIALOG_BACK,Dia_Dog_addon_food_Back);
	Info_AddChoice		(Dia_Dog_addon_food,"Fleischkeule"		,Dia_Dog_addon_food_1);
	Info_AddChoice		(Dia_Dog_addon_food, "Schinken"		,Dia_Dog_addon_food_2);
	Info_AddChoice		(Dia_Dog_addon_food, "Mehrere Fleischkeulen"		,Dia_Dog_addon_food_3);
}; 


FUNC VOID Dia_Dog_addon_food_Back ()
{
	Info_ClearChoices (Dia_Dog_addon_food);
};

func void Dia_Dog_addon_food_1 ()
{
	
	if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
		if (self.attribute[ATR_HITPOINTS]>=(self.attribute[ATR_HITPOINTS_MAX]-10))
		{ 
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		}
		else
		{
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS]+10;
			  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_addon_food);
	Info_AddChoice		(Dia_Dog_addon_food, DIALOG_BACK,Dia_Dog_addon_food_Back);
	Info_AddChoice		(Dia_Dog_addon_food,"Fleischkeule"		,Dia_Dog_addon_food_1);
	Info_AddChoice		(Dia_Dog_addon_food, "Schinken"		,Dia_Dog_addon_food_2);
	Info_AddChoice		(Dia_Dog_addon_food, "Mehrere Fleischkeulen"		,Dia_Dog_addon_food_3);
};

func void Dia_Dog_addon_food_2 ()
{

	if (Npc_HasItems(hero,ItFo_Bacon)>=1)
	{
		Npc_RemoveInvItems(hero,ItFo_Bacon,1);
		if (self.attribute[ATR_HITPOINTS]<=self.attribute[ATR_HITPOINTS_MAX])
		{
			self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
			  dogsay (self, other);
		};
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
	hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);
Info_ClearChoices (Dia_Dog_addon_food);
	Info_AddChoice		(Dia_Dog_addon_food, DIALOG_BACK,Dia_Dog_addon_food_Back);
	Info_AddChoice		(Dia_Dog_addon_food,"Fleischkeule"		,Dia_Dog_addon_food_1);
	Info_AddChoice		(Dia_Dog_addon_food, "Schinken"		,Dia_Dog_addon_food_2);
	Info_AddChoice		(Dia_Dog_addon_food, "Mehrere Fleischkeulen"		,Dia_Dog_addon_food_3);
};

func void Dia_Dog_addon_food_3 ()
{
var int hphp;
var int fleischzahl;
if (Npc_HasItems(hero,ItFoMuttonRaw)>=1)
	{
		hphp = self.attribute[ATR_HITPOINTS_MAX] - self.attribute[ATR_HITPOINTS];
		hphp=hphp/10;
		fleischzahl= Npc_HasItems(hero,ItFoMuttonRaw);
		if (Npc_HasItems(hero,ItFoMuttonRaw)>=hphp)
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,hphp);
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
		  dogsay (self, other);
		}
		else
		{
		Npc_RemoveInvItems(hero,ItFoMuttonRaw,fleischzahl);
		self.attribute[ATR_HITPOINTS]=(self.attribute[ATR_HITPOINTS]+ (fleischzahl*10));
		  dogsay (self, other);
		};
		
	}
	else
	{
	PrintScreen	("Kein Fleisch vohanden!", -1, -1, FONT_SCREEN, 2);
	};
hpstring = ConcatStrings (IntToString(self.attribute[ATR_HITPOINTS]), " / ");
	hpstring2 = ConcatStrings (HPSTRING, IntToString(self.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen	(HPstring2, -1, 6, FONT_SCREEN, 2);

Info_ClearChoices (Dia_Dog_addon_food);
	Info_AddChoice		(Dia_Dog_addon_food, DIALOG_BACK,Dia_Dog_addon_food_Back);
	Info_AddChoice		(Dia_Dog_addon_food,"Fleischkeule"		,Dia_Dog_addon_food_1);
	Info_AddChoice		(Dia_Dog_addon_food, "Schinken"		,Dia_Dog_addon_food_2);
	Info_AddChoice		(Dia_Dog_addon_food, "Mehrere Fleischkeulen"		,Dia_Dog_addon_food_3);
};