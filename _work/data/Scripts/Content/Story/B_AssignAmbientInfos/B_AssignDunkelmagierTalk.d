//*************
// Wer bist du?
//*************

instance Bad_Who (C_Info)
{
  nr = 1;
  condition = Bad_Who_Condition;
  information = Bad_Who_Info;
  description = "Wer bist du?";
};

func int Bad_Who_Condition ()
{
  return true;
};

func void Bad_Who_Info ()
{
  AI_Output(other, self, "Bad_Who_01"); //wer bist du?
  AI_Output(self, other, "Bad_Who_02"); //Ich bin einer von vier Brüdern.
  AI_Output(self, other, "Bad_Who_03"); //Gemeinsam haben wir die Macht, alles Leben zu vernichten. Doch sprich: Was willst du?
};

//************
// Steinkreise
//************
instance Bad_Steinkreise (C_Info)
{
  nr = 1;
  condition = Bad_Steinkreise_Condition;
  information = Bad_Steinkreise_Info;
  description = "Wegen des Steinkreises ...";
};

func int Bad_Steinkreise_Condition ()
{
  if ((Npc_KnowsInfo(other, Bad_Krieg_Speak) || Npc_KnowsInfo(other, Bad_Pest_Speak) || Npc_KnowsInfo(other, Bad_Hunger_Speak) || Npc_KnowsInfo(other, Bad_Tod_Speak)) && !(kennt_steinkreis))
    {
      return true;
    };
  return false;
};

func void Bad_Steinkreise_Info ()
{
  Info_ClearChoices(Bad_Steinkreise);
  Info_AddChoice(Bad_Steinkreise, "Auf den Feldern des Großbauern steht ein Steinkreis.", Bad_Steinkreise_Onar);
  Info_AddChoice(Bad_Steinkreise, "In der Nähe der Stadt ist ein Steinkreis.", Bad_Steinkreise_Lobart);
  Info_AddChoice(Bad_Steinkreise, "Vielleicht solltet ihr den Steinkreis im nördlichen Wald benutzen.", Bad_Steinkreise_Wald);
  Info_AddChoice(Bad_Steinkreise, "Wie wäre es mit dem Sonnenkreis der Feuermagier?", Bad_Steinkreise_Sonnenkreis);
  Info_AddChoice(Bad_Steinkreise, "Im Minental steht ein alter Steinkreis.", Bad_Steinkreise_Minental);
};

func void Bad_Steinkreise_Gefahr ()
{
  AI_Output(self, other, "Bad_Steinkreise_03"); //Das ist mir zu gefährlich.
};

func void Bad_Steinkreise_Onar ()
{
  AI_Output(other, self, "Bad_Steinkreise_01"); //Auf den Feldern des Großbauern steht ein Steinkreis.
  AI_Output(self, other, "Bad_Steinkreise_02"); //(nachdenklich) Auf Feldern ... ich denke, dass dort ab und zu mal ein Bauer vorbei kommt.
  Bad_Steinkreise_Gefahr();
  Bad_Steinkreise_Info();
};

func void Bad_Steinkreise_Lobart ()
{
  AI_Output(other, self, "Bad_Steinkreise_04"); //In der Nähe der Stadt ist ein Steinkreis.
  AI_Output(self, other, "Bad_Steinkreise_05"); //(aufgebracht) In der Nähe der Stadt? Du kannst den Meister ja gleich vor den Augen der Paladine rufen!
  AI_Output(other, self, "Bad_Steinkreise_06"); //Komm wieder runter, ich sagt in der Nähe, nicht in der Stadt! Der Steinkreis liegt etwas abseits.
  AI_Output(self, other, "Bad_Steinkreise_07"); //Nun gut, wir werden es versuchen! Aber wenn es dem Meister nicht gefällt, dann wirst du das schon merken!
  kennt_steinkreis = TRUE;
  Info_ClearChoices(Bad_Steinkreise);  
};

func void Bad_Steinkreise_Wald ()
{
  AI_Output(other, self, "Bad_Steinkreise_08"); //Vielleicht solltet ihr den Steinkreis im nördlichen Wald benutzen.
  AI_Output(self, other, "Bad_Steinkreise_09"); //(nachdenklich) Das wäre vermutlich genau das, was der Feind von uns erwartet.
  Bad_Steinkreise_Gefahr();
  Bad_Steinkreise_Info();
};

func void Bad_Steinkreise_Sonnenkreis ()
{
  AI_Output(other, self, "Bad_Steinkreise_10"); //Wie wäre es mit dem Sonnenkreis der Feuermagier?
  AI_Output(self, other, "Bad_Steinkreise_11"); //(aufgeregt) Einen Ort durchflutet von der Macht Innos? Wir könnten wohl seine Macht brechen, aber das würde zu lange dauern.
  Bad_Steinkreise_Gefahr();
  Bad_Steinkreise_Info();
};

func void Bad_Steinkreise_Minental ()
{
  AI_Output(other, self, "Bad_Steinkreise_12"); //Im Minental steht ein alter Steinkreis
  AI_Output(self, other, "Bad_Steinkreise_13"); //(verärgert) Den Meister da rufen, wo sich die Diener des Feindes rumtreiben? Du musst verrückt sein.
  Bad_Steinkreise_Gefahr();
  Bad_Steinkreise_Info();
};

func void B_AssignDunkelmagierTalk (var C_NPC slf)
{
  if ((slf.id < 9010) && (slf.id > 9005))
    {	
      Bad_Who.npc = Hlp_GetInstanceID(slf);	  
      Bad_Steinkreise.npc = Hlp_GetInstanceID(slf);
    };
};
