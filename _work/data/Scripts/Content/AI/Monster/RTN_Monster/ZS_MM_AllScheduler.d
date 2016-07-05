// ***********************************************************************************
// 										DAYCYCLE
// ***********************************************************************************

var int mal;

func void ZS_MM_AllScheduler()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	
	//ADDON>
	if (self.guild == GIL_STONEGUARDIAN)
	&& (RavenIsDead == TRUE)
	{	
		B_KillNpc (self);
	};
	//ADDON<
	
	if (self.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = YWOLFHP * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = YWOLFHP * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = YWOLFHP * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = YWOLFHP / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = YWOLFHP / 2;
			self.attribute[ATR_STRENGTH] = YWOLFHP / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = YWOLFHP / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = YWOLFHP / 3;
			self.attribute[ATR_STRENGTH] = YWOLFHP / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_BLATTCRAWLER)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 150 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 150 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 75 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 150 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 150 / 2;
			self.attribute[ATR_STRENGTH] = 75 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 150 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 150 / 3;
			self.attribute[ATR_STRENGTH] = 75 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Bloodhound)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 90 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 2;
			self.attribute[ATR_STRENGTH] = 90 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 3;
			self.attribute[ATR_STRENGTH] = 90 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_BLACK)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 55 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 55 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 55 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 55 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 55 / 2;
			self.attribute[ATR_STRENGTH] = 55 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 55 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 55 / 3;
			self.attribute[ATR_STRENGTH] = 55 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Icewolf)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 150 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 2;
			self.attribute[ATR_STRENGTH] = 150 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 3;
			self.attribute[ATR_STRENGTH] = 150 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Keiler)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 100 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 100 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 50 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 100 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 100 / 2;
			self.attribute[ATR_STRENGTH] = 50 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 100 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 100 / 3;
			self.attribute[ATR_STRENGTH] = 50 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_OrcBiter)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 60 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 2;
			self.attribute[ATR_STRENGTH] = 60 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 3;
			self.attribute[ATR_STRENGTH] = 60 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Razor)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 90 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 2;
			self.attribute[ATR_STRENGTH] = 90 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 3;
			self.attribute[ATR_STRENGTH] = 90 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Gargoyle)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 100 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 2;
			self.attribute[ATR_STRENGTH] = 100 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 3;
			self.attribute[ATR_STRENGTH] = 100 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Stoneguardian)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 90 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 2;
			self.attribute[ATR_STRENGTH] = 90 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 3;
			self.attribute[ATR_STRENGTH] = 90 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 100 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 100 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 50 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 100 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 100 / 2;
			self.attribute[ATR_STRENGTH] = 50 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 100 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 100 / 3;
			self.attribute[ATR_STRENGTH] = 50 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Swampgolem)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 250 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 250 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 125 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 250 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 250 / 2;
			self.attribute[ATR_STRENGTH] = 125 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 250 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 250 / 3;
			self.attribute[ATR_STRENGTH] = 125 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_Swamprat)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 60 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 2;
			self.attribute[ATR_STRENGTH] = 60 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 3;
			self.attribute[ATR_STRENGTH] = 60 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 100 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 2;
			self.attribute[ATR_STRENGTH] = 100 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 3;
			self.attribute[ATR_STRENGTH] = 100 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 40 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 40 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 20 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 40 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 40 / 2;
			self.attribute[ATR_STRENGTH] = 20 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 40 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 40 / 3;
			self.attribute[ATR_STRENGTH] = 20 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_DEMON)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 600 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 600 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 250 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 600 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 600 / 2;
			self.attribute[ATR_STRENGTH] = 250 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 600 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 600 / 3;
			self.attribute[ATR_STRENGTH] = 250 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_DEMON_LORD)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 800 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 800 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 400 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 800 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 800 / 2;
			self.attribute[ATR_STRENGTH] = 400 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 800 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 800 / 3;
			self.attribute[ATR_STRENGTH] = 400 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_DRACONIAN)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 260 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 260 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 130 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 260 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 260 / 2;
			self.attribute[ATR_STRENGTH] = 130 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 260 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 260 / 3;
			self.attribute[ATR_STRENGTH] = 130 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 200 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 2;
			self.attribute[ATR_STRENGTH] = 200 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 3;
			self.attribute[ATR_STRENGTH] = 200 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_FIREGOLEM)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 200 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 2;
			self.attribute[ATR_STRENGTH] = 200 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 3;
			self.attribute[ATR_STRENGTH] = 200 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 150 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 2;
			self.attribute[ATR_STRENGTH] = 150 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 3;
			self.attribute[ATR_STRENGTH] = 150 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_GIANT_BUG)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 80 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 80 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 40 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 80 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 80 / 2;
			self.attribute[ATR_STRENGTH] = 40 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 80 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 80 / 3;
			self.attribute[ATR_STRENGTH] = 40 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_GREEN)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 20 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 20 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 20 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 20 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 20 / 2;
			self.attribute[ATR_STRENGTH] = 20 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 20 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 20 / 3;
			self.attribute[ATR_STRENGTH] = 20 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 75 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 75 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 75 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 75 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 75 / 2;
			self.attribute[ATR_STRENGTH] = 75 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 75 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 75 / 3;
			self.attribute[ATR_STRENGTH] = 75 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_HARPY)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 90 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 2;
			self.attribute[ATR_STRENGTH] = 90 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 3;
			self.attribute[ATR_STRENGTH] = 90 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_ICEGOLEM)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 450 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 450 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 225 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 450 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 450 / 2;
			self.attribute[ATR_STRENGTH] = 225 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 450 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 450 / 3;
			self.attribute[ATR_STRENGTH] = 225 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_LURKER)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 60 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 2;
			self.attribute[ATR_STRENGTH] = 60 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 3;
			self.attribute[ATR_STRENGTH] = 60 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 90 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 2;
			self.attribute[ATR_STRENGTH] = 90 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 180 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 180 / 3;
			self.attribute[ATR_STRENGTH] = 90 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 50 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 50 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 25 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 50 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 50 / 2;
			self.attribute[ATR_STRENGTH] = 25 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 50 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 50 / 3;
			self.attribute[ATR_STRENGTH] = 25 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 70 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 70 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 35 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 70 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 70 / 2;
			self.attribute[ATR_STRENGTH] = 35 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 70 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 70 / 3;
			self.attribute[ATR_STRENGTH] = 35 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_DEMON)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 60 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 2;
			self.attribute[ATR_STRENGTH] = 60 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 3;
			self.attribute[ATR_STRENGTH] = 60 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 150 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 2;
			self.attribute[ATR_STRENGTH] = 150 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 3;
			self.attribute[ATR_STRENGTH] = 150 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_SKELETON)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 200 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 2;
			self.attribute[ATR_STRENGTH] = 200 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 400 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 400 / 3;
			self.attribute[ATR_STRENGTH] = 200 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 150 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 2;
			self.attribute[ATR_STRENGTH] = 150 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 3;
			self.attribute[ATR_STRENGTH] = 150 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 60 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 2;
			self.attribute[ATR_STRENGTH] = 60 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 3;
			self.attribute[ATR_STRENGTH] = 60 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 250 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 250 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 125 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 250 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 250 / 2;
			self.attribute[ATR_STRENGTH] = 125 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 250 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 250 / 3;
			self.attribute[ATR_STRENGTH] = 125 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 240 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 240 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 120 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 240 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 240 / 2;
			self.attribute[ATR_STRENGTH] = 120 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 240 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 240 / 3;
			self.attribute[ATR_STRENGTH] = 120 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_TROLL)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 500 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 500 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 100 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 500 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 500 / 2;
			self.attribute[ATR_STRENGTH] = 100 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 500 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 500 / 3;
			self.attribute[ATR_STRENGTH] = 100 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_TROLL_BLACK)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 1000 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 1000 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 200 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 1000 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 1000 / 2;
			self.attribute[ATR_STRENGTH] = 200 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 1000 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 1000 / 3;
			self.attribute[ATR_STRENGTH] = 200 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_WARAN)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 60 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 2;
			self.attribute[ATR_STRENGTH] = 60 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 120 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 120 / 3;
			self.attribute[ATR_STRENGTH] = 60 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_WARG)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 150 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 2;
			self.attribute[ATR_STRENGTH] = 150 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 300 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 300 / 3;
			self.attribute[ATR_STRENGTH] = 150 / 3;
		};
	};
	if (self.aivar[AIV_MM_REAL_ID] == ID_GIANT_RAT)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 30 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 30 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 15 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 30 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 30 / 2;
			self.attribute[ATR_STRENGTH] = 15 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 30 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 30 / 3;
			self.attribute[ATR_STRENGTH] = 15 / 3;
		};
	}
	else if (self.aivar[AIV_MM_REAL_ID] == ID_YOUNG_GIANT_RAT)
	{
		if (MFAKTOR >= 10)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 10 * (MFAKTOR / 10);
			};
			self.attribute[ATR_HITPOINTS_MAX] = 10 * (MFAKTOR / 10);
			self.attribute[ATR_STRENGTH] = 5 * (MFAKTOR / 10);
		}
		else if (MFAKTOR == 5)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 10 / 2;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 10 / 2;
			self.attribute[ATR_STRENGTH] = 5 / 2;
		}
		else
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX])
			{
				self.attribute[ATR_HITPOINTS] = 10 / 3;
			};
			self.attribute[ATR_HITPOINTS_MAX] = 10 / 3;
			self.attribute[ATR_STRENGTH] = 5 / 3;
		};
	};
	
	if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_OrcSitStart],00,self.aivar[AIV_MM_OrcSitEnd],00) || (self.aivar[AIV_MM_OrcSitStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_OrcSit, 1, "");
	}
	else
	{
		AI_StartState (self, ZS_MM_Rtn_Rest, 1, ""); //Default = Rest
	};
};
