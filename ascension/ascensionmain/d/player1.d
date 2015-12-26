///////////////////////////////////////////////////////////////////////
// Ascension : PLAYER1
///////////////////////////////////////////////////////////////////////
// (1) adds a "we're not in the final fight" state trigger to just about
//      every state here
// (2) changes the slayer ability so that you get the new slayer powers
// (3) adds states 55--57 (final battle options)
///////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER PLAYER1 0 
~!Global("FinalFight","AR6200",4)
!Global("MelStillImmortal","AR6200",2)~ 
1 7 10 13 15 16 18 21 28 30 // also add this trigger to all these states

REPLACE PLAYER1 

IF ~Global("Slayer10","GLOBAL",1)
!Global("FinalFight","AR6200",4)
!Global("MelStillImmortal","AR6200",2)~ THEN BEGIN 27 // from:
  SAY #55324 
  IF ~~ THEN REPLY #55326 DO ~SetGlobal("Slayer10","GLOBAL",0)~ EXIT
  IF ~XPLT(Player1,2000001)~ THEN REPLY #61320 DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-1)
ApplySpell(Player1,SLAYER_CHANGE_TWO)~ EXIT
  IF ~XPLT(Player1,4000001)
XPGT(Player1,2000000)~ THEN REPLY #61320 DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-1)
ApplySpellRES("slayer2",Player1)~ JOURNAL @314 /* ~Slayer Ability Changed

It appears my ability to control the transformation to the slayer has increased.  The slayer form itself is stronger, deadlier...and I am able to maintain it for longer.  The chances of going berserk while in the form have also decreased.  ~ #77386 */ EXIT
  IF ~XPGT(Player1,4000000)~ THEN REPLY #61320 DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-2)
ApplySpellRES("slayer3",Player1)~ JOURNAL @315 /* ~Slayer Ability Changed Again

My control over the slayer transformation continues to increase.  The slayer has become incredibly immune to harm and most magics, and it appears it is now immune to most diseases, poisons as well as any slow or hasting effects.  Even the slayer's claws now sometimes rip through magical effects and defenses.  ~ #77388 */ EXIT
  IF ~XPGT(Player1,6000000)~ THEN REPLY @317 /* ~I choose to turn into the ravager.~ #77389 */ DO ~IncrementGlobal("SlayerDeath","GLOBAL",1)
SetGlobal("Slayer10","GLOBAL",2)
SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
ReputationInc(-3)
ApplySpellRES("slayer4",Player1)~ JOURNAL @316 /* ~The Ravager Form

I am not sure if this is a good thing or not...but my ability to control my transformation has progressed to the point where I can now become the ravager...optionally.  Although incredibly powerful...the ravager receives half damage from most attacks, is immune to any kind of immobilization or buffeting attack...the ravager is difficult for me to control and may be a danger to those nearby.  ~ #77390 */ EXIT
END

END /* end of: REPLACE PLAYER1 */

APPEND PLAYER1

IF ~Global("FinalFight","AR6200",4)
!Global("MelStillImmortal","AR6200",2)~ THEN BEGIN a55 // from:
  SAY @396 /* ~With the initial battle now over, you consider your options.  In the stream of energy within the center of the Throne, Melissan appears to be invulnerable to harm...and growing in power every second.  She must be drawn out willingly in order to defeat her.~ #74321 */
  IF ~~ THEN GOTO a56
END

IF ~~ THEN BEGIN a56 // from: 55.0
  SAY @397 /* ~The only option you can think of seem to be regarding the three 'essence pools' that adjoin the Throne.  Your own link to the essence might allow you to cut off the flow of energy to Melissan from these pools, forcing her to fight.  The pools are, however, likely to be guarded...~ #74322 */
  IF ~~ THEN DO ~SetGlobal("FinalFight","AR6200",5)~ EXIT
END

IF ~Global("MelStillImmortal","AR6200",2)~ THEN BEGIN a57 // from:
  SAY @398 /* ~Melissan continues to restore her divine energies at the fountain, keeping her immortality intact.  There must be a way to weaken her further, or you will never be able to defeat her.~ #82773 */
  IF ~~ THEN DO ~SetGlobal("MelStillImmortal","AR6200",3)~ EXIT
END

END /* end of: APPEND PLAYER1 */
