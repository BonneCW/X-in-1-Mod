//*****
// Ende
//*****

instance Nur_Shak_Ende (C_Info)
{
  npc = Orc_9011_Nur_Shak;
  nr = 999;
  condition = Nur_Shak_Ende_Condition;
  information = Nur_Shak_Ende_Info;
  permanent = TRUE;
  description = DIALOG_ENDE;
};

func int Nur_Shak_Ende_Condition ()
{
  return true;
};

func void Nur_Shak_Ende_Info ()
{
  AI_StopProcessInfos(self);
};

//*************
// Wer bist du?
//*************

instance Nur_Shak_Willkommen (C_Info)
{
  npc = Orc_9011_Nur_Shak;
  condition = Nur_Shak_Willkommen_Condition;
  information = Nur_Shak_Willkommen_Info;
  important = TRUE;
};

func int Nur_Shak_Willkommen_Condition ()
{
  if (Orkamulett)
    {
      return true;
    };
  return false;
};

func void Nur_Shak_Willkommen_Info ()
{
  AI_Output(self, other, "Nur_Shak_Willkommen_01"); //Was sehen Nur-Shak? Ein Mensch? Wie du hierher gekommen, Mensch? Egal, nun Nur-Shak werden dich t�ten.
  AI_ReadyMeleeWeapon(self);
  AI_Output(other, self, "Nur_Shak_Willkommen_02"); //Langsam mein Freund, ich trage das Amulett eines Boten der Dunkelmagier.
  AI_Output(self, other, "Nur_Shak_Willkommen_03"); //Nur-Shak sehen, Mensch tragen Zeichen von Boten von Gro�en Schamanen.
  var C_Item Armor;
  Armor = Npc_GetEquippedArmor(other);
  if (Hlp_IsItem(Armor, ITAR_DarkMage))
    {
      AI_Output(self, other, "Nur_Shak_Willkommen_04"); //Mensch selber tragen R�stung von Schamanen.
    };
  if (Hlp_IsItem(Armor, ORE_ARMOR_M))
    {
      AI_Output(self, other, "Nur_Shak_Willkommen_05"); //Mensch tragen R�stung von Menschen-Elite-Krieger.
    };
  AI_RemoveWeapon(self);
  AI_Output(self, other, "Nur_Shak_Willkommen_06"); //Meister hat befohlen, jeder Mensch soll sterben, aber Nur-Shak achtet Gro�en Schamanen und wird h�ren, was Bote hat zu sagen.
};

//*****************
// Waffenstillstand
//*****************

instance Nur_Shak_Waffenstillstand (C_Info)
{
  npc = Orc_9011_Nur_Shak;
  nr = 1;
  condition = Nur_Shak_Waffenstillstand_Condition;
  information = Nur_Shak_Waffenstillstand_Info;
  description = "Ich will mit dir �ber einen Waffenstillstand verhandeln.";
};

func int Nur_Shak_Waffenstillstand_Condition ()
{
  return true;
};

func void Nur_Shak_Waffenstillstand_Info ()
{
  AI_Output(other, self, "Nur_Shak_Waffenstillstand_01"); //Ich will mir dir �ber einen Waffenstillstand verhandeln.
  AI_Output(self, other, "Nur_Shak_Waffenstillstand_02"); //Nur-Shak wird h�ren.
  AI_Output(other, self, "Nur_Shak_Waffenstillstand_05"); //OK, das kann jetzt ein Weilchen dauern ...
  AI_Output(other, self, "Nur_Shak_Waffenstillstand_06"); //(einige Zeit sp�ter) Sind wir uns also einig?
  AI_Output(self, other, "Nur_Shak_Waffenstillstand_07"); //Ja, Orks von Nur-Shak werden nicht gehen in Burg, solange Tor geschlossen, daf�r Paladine hinter Pass kommen nicht her, sondern senden Boten zu Nur-Shak.
  AI_Output(other, self, "Nur_Shak_Waffenstillstand_08"); //Gut, das werde ich den Paladinen mitteilen.
  AI_Output(self, other, "Nur_Shak_Waffenstillstand_09"); //Nur-Shak wird bescheid sagen Orks. Viel Gl�ck, Mensch.
  B_LogEntry(Verhandlungen, "Ich habe mit Nur-Shak einen Waffenstillstand abgeschlossen, dar�ber sollte ich Lord Hagen informieren.");
  B_GivePlayerXP(XP_Ambient);
  AI_StopProcessInfos(self);
};


