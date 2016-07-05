// ******************
// ZS_MM_Rtn_Summoned
// ******************
var int D_Sucher;
var int D_range;
var int D_goestoitm;
var int IQ_BONUS_COUNTER;
var int D_aufgepasst_c;
var int D_sitz_c;
var int D_lieg_c;
var int D_Falltimes;
var int sleeptimes;
var int fallbonusonetime;
var int Ballet_taim;
var int timer_ballet;
var int Vatras_BOnus;
var int d_Suchtimer;
func void B_Dog_Such_item ()
{
	//EXIT IF...
	if (!Hlp_IsValidItem(item))
	{
		return;
	};
	
	if (Npc_GetHeightToItem(self, item) > 400)
	{
		return;
	};
	
	//FUNC
	
	var int randy;
	var int Lastitem;
	randy = Hlp_Random (50);
	
	
	if (Npc_GetDistToItem(self,item) >= 200)
	{
		AI_GotoItem (self, item);
		D_goestoitm = TRUE;
	};		
	if (Npc_GetDistToItem(self,item) < 180)
	{
		D_goestoitm=FALSE;
		
		if(d_Suchtimer==FALSE) 
			{
			
			//lastitem = Hlp_GetInstanceID(item);
			IQ_BONUS_COUNTER =IQ_BONUS_COUNTER +1;
			
			if (IQ_BONUS_COUNTER == 180)
			{
			D_IQ =D_IQ + 10;
			PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
			Snd_Play ("LevelUp");
			};
			if IQ_BONUS_COUNTER >= 2000
			{
				IQ_BONUS_COUNTER=1000;
			};
		};
	};		
	if (Npc_GetDistToItem(self,item) < 230)
	&& (randy <= 1)
	{
		AI_PlayAni(self, "T_STAND_2_EAT");
		AI_StandUp (self);
	};
};




func void ZS_dog ()
{
	Npc_SetPercTime	(self,	1);
	//Npc_PercEnable	(self,	PERC_ASSESSPLAYER,		B_MM_AssessPlayer);
	if D_pass == FALSE
	{
	Npc_PercEnable	(self,	PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	};
	Npc_PercEnable	(self, 	PERC_ASSESSTALK			,	B_AssessTalk);
	
	Npc_PercEnable	(self,	PERC_ASSESSMAGIC,  		B_AssessMagic);
	Npc_PercEnable	(self,	PERC_ASSESSDAMAGE,		B_MM_AssessDamage);
	if D_pass == FALSE
	{
	Npc_PercEnable	(self,  PERC_ASSESSFIGHTSOUND, 	B_MM_AssessOthersDamage);
	};
	// FUNC
	
	B_SetAttitude (self, ATT_FRIENDLY);
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StandUp (self);
	AI_SetWalkmode	(self, NPC_RUN);
};

func int ZS_dog_Loop()
{
var int fest;
var int fest2;
	// ------ beim Spieler bleiben ------
	if (dog_follow==TRUE)
	{
	Npc_PerceiveAll	(self) ;
	//D_goestoitm=FALSE;
	
	if D_SUCHER >=1
	{
		if (D_SucHER == 1)||(D_SUCHER==2)
		&& (D_goestoitm ==FALSE)
		{
			if (Wld_DetectItem (self,ITEM_KAT_NF))
			{
			
				B_Dog_Such_item();
			};
		};
		
		if (D_SucHER == 1)||(D_SUCHER==3)
		&& (D_goestoitm ==FALSE)
		{
			if (Wld_DetectItem (self,ITEM_KAT_FF | ITEM_KAT_MUN))
			{
				// Print(item.name);
				B_Dog_Such_item();
			};
		};
		
		if (D_SucHER == 1)||(D_SUCHER==4)
		&& (D_goestoitm ==FALSE)
		{
			if (Wld_DetectItem (self,ITEM_KAT_NONE | ITEM_KAT_KEYS | ITEM_KAT_LIGHT))
			{
				// Print(item.name);
				B_Dog_Such_item();
			};
		};
		
		if (D_SucHER == 1)||(D_SUCHER==5)
		&& (D_goestoitm ==FALSE)
		{
			if (Wld_DetectItem (self,ITEM_KAT_RUNE | ITEM_KAT_DOCS))
			{
				// Print(item.name);
				B_Dog_Such_item();
			};
		};
		
		if (D_SucHER == 1)||(D_SUCHER==6)
		&& (D_goestoitm ==FALSE)
		{
			if (Wld_DetectItem (self,ITEM_KAT_MAGIC))
			{
				// Print(item.name);
				B_Dog_Such_item();
			};
		};
		
		if (D_SucHER == 1)||(D_SUCHER==7)
		&& (D_goestoitm ==FALSE)
		{
			if (Wld_DetectItem (self,ITEM_KAT_FOOD))
			{
				// Print(item.name);
				B_Dog_Such_item();
			};
		};
		
		if (D_SucHER == 1)||(D_SUCHER==8)
		{
			if (Wld_DetectItem (self,ITEM_KAT_POTIONS))
			&& (D_goestoitm ==FALSE)
			{
				// Print(item.name);
				B_Dog_Such_item();
			};
		};
	};
	if D_Sucher >= 1
	{
	D_range=850;
	}
	else
	{
	D_Range=450;
	};
	if (Npc_GetDistToNpc (self, hero) > D_RANGE)
	{	
		if (!C_BodyStateContains(self,BS_SWIM))
		{
		AI_StandUp (self);
		AI_SetWalkmode	(self, NPC_RUN);
		};
		AI_GotoNpc (self, hero);
		
		fest = TRUE;
		fest2= TRUE;
	}
	else //<= 500
	{
		if (Npc_GetStateTime(self) >= 1)
		{
			if (Npc_GetDistToWP (self,"NW_CITY_MERCHANT_TEMPLE_FRONT") < 800) 
			&& (Vatras_Bonus == FALSE)
			&& (D_IQ >=40)
			{	
				D_Falltimes=D_Falltimes+1;
				if D_Falltimes >=60
				{
				D_IQ =D_IQ + 10;
				PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
				Snd_Play ("LevelUp");
				
				Vatras_BOnus =TRUE;
				};
				
			};
		
			//AI_PlayAni(self, "S_SIT");
			// ------ zum Spieler drehen ------
			if (!Npc_CanSeeNpc(self, hero))
			&& (D_goestoitm ==FALSE)
			{	
				if (!C_BodyStateContains(self,BS_SWIM))
				{AI_StandUp (self);
				AI_SetWalkmode	(self, NPC_RUN);
				};
				AI_TurnToNpc (self, hero);
				
				fest = TRUE;
				fest2= TRUE;
				
			};
			
			// ------ Summon Time -------
			
			if (d_Suchtimer == FALSE)
			{
			d_Suchtimer=TRUE;
			}
			else
			{
			d_Suchtimer=FALSE;
			};
			ballet_taim=ballet_taim+1;
			
			if D_iq >= 167
			{
			self.damagetype=DAM_MAGIC;
			if  (Hlp_StrCmp(self.effect, "SPELLFX_CROSSBOW")==FALSE)
			{
			self.effect = "SPELLFX_CROSSBOW";
			};
			};
	
			Npc_SetStateTime (self, 0);
		};
	};
	
	if (Npc_GetDistToNpc (self, hero) < 200)
	&& (fest == TRUE)
	&& (D_Sitz_c>=8)
	&& (!C_BodyStateContains(self,BS_SWIM))
	&& (D_goestoitm==FALSE)
	{
		AI_PlayAni(self, "T_STAND_2_SIT");
		fest = FALSE;
	};
	
	if (PLAYER_MOBSI_PRODUCTION	==	MOBSI_SleepAbit)
	&& (fest2==TRUE)
	{
		AI_PlayAni(self,"T_STAND_2_SLEEP");
		self.attribute[ATR_HITPOINTS]=self.attribute[ATR_HITPOINTS_MAX];
	
		sleeptimes=sleeptimes+1;

		if sleeptimes==30
		{
			D_iq=d_iq+5;
			PrintScreen	("Draco ist schlauer geworden!", -1, -1, FONT_SCREEN, 2);
			Snd_Play ("LevelUp");
		};

		fest2=FALSE;
	
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
	else
	{
	var int once;
	if Once ==FALSE
	{AI_GotoNextFP	(self,	"FP_ROAM"); once =TRUE;};
	
	if (D_Sitz_c>=8)
	&& (!C_BodyStateContains(self,BS_SWIM))
	&& (D_goestoitm==FALSE)
	{
	if (fest == TRUE)
	{
	AI_PlayAni(self, "T_STAND_2_SIT");
	fest = FALSE;
	};
	}
	else if (Hlp_Random(1000) <= 5)
		{
			var int randomMove;
			randomMove = Hlp_Random(3);
			if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
			if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
			if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
		};
	};
	
	
	if ballet_taim >300
	{
	ballet_taim =200;
	};
	//self.wp = Npc_GetNearestWP (self);
	return LOOP_CONTINUE;
};

func void ZS_dog_End()
{

};

			/*// ------ MANA - Entzug ------			
			if (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOBBO_SKELETON)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -1);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_WOLF)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -2);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_SKELETON)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -3);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_GOLEM)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -4);
			};
			
			if (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON)
			{					
				Npc_ChangeAttribute (hero, ATR_MANA, -5);
			};
			
			if (hero.attribute[ATR_MANA] <= 0)
			{
				if (self.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_DEMON)
				{
					B_SetAttitude (self, ATT_HOSTILE);
				}
				else
				{
					Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			};*/
