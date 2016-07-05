// ******************************************************************************
// Spell_ProcessMana
// -----------------
// wird pro investiertem Mana aufgerufen 
// wieviele Mana bisher investiert wurden kann über manaInvested abgefragt werden
// diese Methode wird immer vom Caster aufgerufen
// self 	= Der Caster
// other 	= Das Opfer (kann auch leer sein)
// ******************************************************************************

func INT Spell_ProcessMana (VAR INT manaInvested)
{
	var int activeSpell; activeSpell = Npc_GetActiveSpell(self);
	
	//Paladin-Runen
	if (activeSpell == SPL_PalLight				)	{	return  Spell_Logic_PalLight			(manaInvested); };
	if (activeSpell == SPL_PalLightHeal			)	{	return  Spell_Logic_PalLightHeal		(manaInvested); };
	if (activeSpell == SPL_PalHolyBolt			)	{	return  Spell_Logic_PalHolyBolt			(manaInvested); };
	if (activeSpell == SPL_PalMediumHeal		)	{	return  Spell_Logic_PalMediumHeal		(manaInvested); };
	if (activeSpell == SPL_PalRepelEvil			)	{	return  Spell_Logic_PalRepelEvil		(manaInvested); };
	if (activeSpell == SPL_PalFullHeal			)	{	return  Spell_Logic_PalFullHeal			(manaInvested); };
	if (activeSpell == SPL_PalDestroyEvil		)	{	return  Spell_Logic_PalDestroyEvil		(manaInvested); };
	//Teleport-Runen
	if (activeSpell == SPL_PalTeleportSecret	)	{	return  Spell_Logic_PalTeleportSecret	(manaInvested); };
	if (activeSpell == SPL_TeleportSeaport		)	{	return  Spell_Logic_TeleportSeaport		(manaInvested); };
	if (activeSpell == SPL_TeleportMonastery	)	{	return  Spell_Logic_TeleportMonastery	(manaInvested); };
	if (activeSpell == SPL_TeleportFarm			)	{	return  Spell_Logic_TeleportFarm		(manaInvested); };
	if (activeSpell == SPL_TeleportXardas		)	{	return  Spell_Logic_TeleportXardas		(manaInvested); };
	if (activeSpell == SPL_TeleportPassNW		)	{	return  Spell_Logic_TeleportPassNW		(manaInvested); };
	if (activeSpell == SPL_TeleportPassOW		)	{	return  Spell_Logic_TeleportPassOW		(manaInvested); };
	if (activeSpell == SPL_TeleportOC			)	{	return  Spell_Logic_TeleportOC			(manaInvested); };
	if (activeSpell == SPL_TeleportOWDemonTower)	{	return  Spell_Logic_TeleportOWDemonTower(manaInvested); };
	if (activeSpell == SPL_TeleportTaverne		)	{	return  Spell_Logic_TeleportTaverne		(manaInvested); };
	//Runen und Scrolls
	//Kreis 1
	if (activeSpell == SPL_LIGHT				)	{	return  Spell_Logic_Light				(manaInvested); };
	if (activeSpell == SPL_Firebolt				)	{	return	Spell_Logic_Firebolt			(manaInvested);	};
	if (activeSpell == SPL_Icebolt				)	{	return	Spell_Logic_Icebolt				(manaInvested);	};
	if (activeSpell == SPL_Zap					)	{	return	Spell_Logic_Zap					(manaInvested);	};
	if (activeSpell == SPL_LightHeal			)	{	return	Spell_Logic_LightHeal			(manaInvested);	};
	if (activeSpell == SPL_SummonGoblinSkeleton)	{	return	Spell_Logic_SummonGoblinSkeleton(manaInvested);	};
	//Kreis 2
	if (activeSpell == SPL_InstantFireball		)	{	return	Spell_Logic_InstantFireball	(manaInvested);	};
	if (activeSpell == SPL_SummonWolf			)	{	return	Spell_Logic_SummonWolf		(manaInvested);	};
	if (activeSpell == SPL_SummonSnapper			)	{	return	Spell_Logic_SummonSnapper	(manaInvested);	};
	if (activeSpell == SPL_WINDFIST				)	{	return	Spell_Logic_Windfist		(manaInvested);	};
	if (activeSpell == SPL_Sleep				)	{	return	Spell_Logic_Sleep			(manaInvested);	};
	//Kreis 3
	if (activeSpell == SPL_MediumHeal			)	{	return	Spell_Logic_MediumHeal		(manaInvested);	};
	if (activeSpell == SPL_LightningFlash		) 	{	return	Spell_Logic_LightningFlash	(manaInvested);	};
	if (activeSpell == SPL_ChargeFireball	    ) 	{	return	Spell_Logic_ChargeFireball	(manaInvested);	};
	if (activeSpell == SPL_ChargeZap		    ) 	{	return	Spell_Logic_ChargeZap		(manaInvested);	};
	if (activeSpell == SPL_SummonSkeleton	    ) 	{	return	Spell_Logic_SummonSkeleton	(manaInvested);	};
	if (activeSpell == SPL_Fear	    			) 	{	return	Spell_Logic_Fear			(manaInvested);	};
	if (activeSpell == SPL_IceCube	    		) 	{	return	Spell_Logic_IceCube			(manaInvested);	};
	//Kreis 4
	if (activeSpell == SPL_ChargeZap	    	) 	{	return	Spell_Logic_ChargeZap		(manaInvested);	};
	if (activeSpell == SPL_SummonGolem   		) 	{	return	Spell_Logic_SummonGolem		(manaInvested);	};
	if (activeSpell == SPL_DestroyUndead 		)	{	return	Spell_Logic_DestroyUndead	(manaInvested);	};
	if (activeSpell == SPL_Pyrokinesis	    	) 	{	return	Spell_Logic_Pyrokinesis		(manaInvested);	};
	//Kreis 5
	if (activeSpell == SPL_Firestorm       		) 	{	return	Spell_Logic_Firestorm		(manaInvested);	};
	if (activeSpell == SPL_IceWave        		) 	{	return	Spell_Logic_IceWave			(manaInvested);	};
	if (activeSpell == SPL_SummonDemon			)	{	return	Spell_Logic_SummonDemon		(manaInvested);	};
	if (activeSpell == SPL_FullHeal				)	{	return	Spell_Logic_FullHeal		(manaInvested);	};
	//Kreis 6
	if (activeSpell == SPL_Firerain				)	{	return	Spell_Logic_Firerain		(manaInvested);	};
	if (activeSpell == SPL_BreathOfDeath		)	{	return	Spell_Logic_BreathOfDeath	(manaInvested);	};
	if (activeSpell == SPL_MassDeath			)	{	return	Spell_Logic_MassDeath		(manaInvested);	};
	if (activeSpell == SPL_ArmyOfDarkness		)	{	return	Spell_Logic_ArmyOfDarkness	(manaInvested);	};
	if (activeSpell == SPL_Shrink				)	{	return	Spell_Logic_Shrink			(manaInvested);	};
	//Scrolls
	if (activeSpell == SPL_TrfSheep	    		)	{	return	Spell_Logic_TrfSheep 		(manaInvested);	};
	if (activeSpell == SPL_TrfScavenger			)	{	return	Spell_Logic_TrfScavenger 	(manaInvested);	};
	if (activeSpell == SPL_TrfGiantRat			)	{	return	Spell_Logic_TrfGiantRat		(manaInvested);	};
	if (activeSpell == SPL_TrfGiantBug			)	{	return	Spell_Logic_TrfGiantBug		(manaInvested);	};
	if (activeSpell == SPL_TrfWolf				)	{	return	Spell_Logic_TrfWolf			(manaInvested);	};
	if (activeSpell == SPL_TrfWaran				)	{	return	Spell_Logic_TrfWaran		(manaInvested);	};
	if (activeSpell == SPL_TrfSnapper			)	{	return	Spell_Logic_TrfSnapper		(manaInvested);	};
	if (activeSpell == SPL_TrfWarg				)	{	return	Spell_Logic_TrfWarg			(manaInvested);	};
	if (activeSpell == SPL_TrfFireWaran			)	{	return	Spell_Logic_TrfFireWaran	(manaInvested);	};
	if (activeSpell == SPL_TrfLurker			)	{	return	Spell_Logic_TrfLurker		(manaInvested);	};
	if (activeSpell == SPL_TrfShadowbeast		)	{	return	Spell_Logic_TrfShadowbeast	(manaInvested);	};
	if (activeSpell == SPL_TrfDragonSnapper		)	{	return	Spell_Logic_TrfDragonSnapper(manaInvested);	};
	if (activeSpell == SPL_Charm				)	{	return	Spell_Logic_Charm			(manaInvested);	};
	if (activeSpell == SPL_MasterOfDisaster		)	{	return	Spell_Logic_MasterOfDisaster(manaInvested);	};
	
	if (activeSpell == SPL_ConcussionBolt		)	{	return	Spell_Logic_ConcussionBolt	(manaInvested);	};
	if (activeSpell == SPL_Deathbolt			)	{	return	Spell_Logic_Deathbolt		(manaInvested);	};
	if (activeSpell == SPL_Deathball			)	{	return	Spell_Logic_Deathball		(manaInvested);	};
	
	//water
	if (activeSpell == SPL_Thunderstorm			)	{	return	Spell_Logic_Thunderstorm	(manaInvested);	};
	if (activeSpell == SPL_Waterfist			)	{	return	Spell_Logic_Waterfist		(manaInvested);	};
	if (activeSpell == SPL_Whirlwind			)	{	return	Spell_Logic_Whirlwind		(manaInvested);	};
	if (activeSpell == SPL_Geyser				) 	{	return	Spell_Logic_Geyser			(manaInvested);	};
	if (activeSpell == SPL_Inflate				) 	{	return	Spell_Logic_Inflate			(manaInvested);	};
	if (activeSpell == SPL_Icelance				) 	{	return	Spell_Logic_Icelance		(manaInvested);	};
	if (activeSpell == SPL_Summoner				) 	{	return	Spell_Logic_Summoner		(manaInvested);	};
	
	//beliar magic
	if (activeSpell == SPL_Swarm				)	{	return	Spell_Logic_Swarm			(manaInvested);	};
	if (activeSpell == SPL_Greententacle		)	{	return	Spell_Logic_Greententacle	(manaInvested);	};
	if (activeSpell == SPL_SummonGuardian		)	{	return	Spell_Logic_SummonGuardian	(manaInvested);	};
	if (activeSpell == SPL_Energyball			)	{	return	Spell_Logic_Energyball		(manaInvested);	};
	if (activeSpell == SPL_SuckEnergy			)	{	return	Spell_Logic_SuckEnergy		(manaInvested);	};
	if (activeSpell == SPL_Skull				)	{	return	Spell_Logic_Skull			(manaInvested);	};
	if (activeSpell == SPL_SummonZombie			)	{	return	Spell_Logic_SummonZombie	(manaInvested);	};
	if (activeSpell == SPL_SummonMud			)	{	return	Spell_Logic_SummonMud		(manaInvested);	};

	//DM-Magic
	if (activeSpell == SPL_Blutopfer) {return Spell_Logic_Blutopfer (manaInvested);};
	if (activeSpell == SPL_Altern) {return Spell_Logic_Altern (manaInvested);};
	if (activeSpell == SPL_Seelenraub) {return Spell_Logic_Seelenraub (manaInvested);};
	if (activeSpell == SPL_Giftanschlag) {return Spell_Logic_Giftanschlag (manaInvested);};
	if (activeSpell == SPL_Wahnsinn) {return Spell_Logic_Wahnsinn (manaInvested);};
	if (activeSpell == SPL_GHOST)
	{
		return spell_logic_ghost (manaInvested);
	};
	if (activeSpell == SPL_VLIGHT)
	{
		return spell_logic_vlight (manaInvested);
	};
	if (activeSpell == SPL_SUMMONWARG)
	{
		return spell_logic_summonwarg (manaInvested);
	};
	if (activeSpell == SPL_SUMMON3WARG)
	{
		return spell_logic_summon3warg (manaInvested);
	};
	if (activeSpell == SPL_SUMMONSHADOW)
	{
		return spell_logic_summonshadow (manaInvested);
	};
	if (activeSpell == SPL_AMOK)
	{
		return spell_logic_amok (manaInvested);
	};
	if (activeSpell == SPL_GHOSTSPELL)
	{
		return spell_logic_ghostspell (manaInvested);
	};
	if (activeSpell == SPL_SUMMONDRAGON)
	{
		return spell_logic_summondragon (manaInvested);
	};
	if (activeSpell == SPL_EARTH)
	{
		return spell_logic_earth (manaInvested);
	};
	if (activeSpell == SPL_SOUL)
	{
		return spell_logic_soul (manaInvested);
	};
	if (activeSpell == SPL_FOLLOW)
	{
		return spell_logic_follow (manaInvested);
	};


	//modded magic
	if (activeSpell == SPL_fighterWhirl 			)	{	return	Spell_Logic_fighterWhirl 		(manaInvested);	};
	if (activeSpell == SPL_redball			)	{	return	Spell_Logic_redball		(manaInvested);	};
	if (activeSpell == SPL_TeleportOT			)	{	return	Spell_Logic_TeleportOT		(manaInvested);	};

//Leer

//	if (Npc_GetActiveSpell(self) == SPL_B					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_C					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_D					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_E					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_F					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_G					)	{	return	Spell_Logic_XXX				(manaInvested);	};
//	if (Npc_GetActiveSpell(self) == SPL_H					)	{	return	Spell_Logic_XXX				(manaInvested);	};
};
