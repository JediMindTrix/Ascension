///////////////////////////////////////////////////////////////////////
// Ascension : PPGUY02   (final battle pool effects)
///////////////////////////////////////////////////////////////////////
// (1) created from scratch (not in the original game)
///////////////////////////////////////////////////////////////////////

BEGIN ~PPGUY02~

IF ~!InPartySlot(LastTalkedToBy,0)
!Name("Imoen2",LastTalkedToBy)~ THEN BEGIN a0 // from:
  SAY @1 /* ~You interpose your hand in the swirl of energy within the pool, but its power is obviously too much for you.  You do not interrupt its flow and, instead, the energy leaps out and damages you.~ #74335 */
  IF ~~ THEN DO ~ReallyForceSpellRES("baldead",Myself)
DestroySelf()~ EXIT
END

IF ~Global("Pool1Active","AR6200",2)~ THEN BEGIN a1 // from:
  SAY @2 /* ~You place your hand within the energies of the pool and draw the essence into yourself, diverting it away from Melissan.  Boundless power fills you briefly, and while most of it dissipates a portion fuels your inner energies.  You are now immune to death magics and vorpal effects, and have also gained the ability to unleash the power within you as a short burst of destructive power.  The energies also restore the powers of all present.~ #74345 */
  IF ~!Global("Pool2Active","AR6200",3)
!Global("Pool3Active","AR6200",3)
DifficultyLT(4)~ THEN DO ~SetGlobal("Pool1Active","AR6200",3)
ReallyForceSpellRES("pool1a",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool1b")~ JOURNAL @3 /* ~New power gained: "Unleash"

The "Unleash" ability releases your inner power upon a target that is within melee range, hitting them for 10d12 magic damage (half on a successful save vs. Death) and sending them flying back and perhaps unconscious for a short period.  This ability may only be used once ever thirty seconds...and after using it the Bhaalspawn will be incredibly fatigued and have a 25% miscast chance on all spells for 2 rounds.  Due to the amount of divine essence used, the Slayer form will also not be available for thirty seconds. h~ #77370 */ EXIT
  IF ~Global("Pool2Active","AR6200",3)
Global("Pool3Active","AR6200",3)~ THEN JOURNAL @4 /* ~New power gained: "Unleash"

The "Unleash" ability releases your inner power upon a target that is within melee range, hitting them for 10d12 magic damage (half on a successful save vs. Death) and sending them flying back and perhaps unconscious for a short period.  This ability may only be used once ever thirty seconds...and after using it the Bhaalspawn will be incredibly fatigued and have a 25% miscast chance on all spells for 2 rounds.  Due to the amount of divine essence used, the Slayer form will also not be available for thirty seconds.  ~ #77371 */ GOTO a4
  IF ~!Global("Pool2Active","AR6200",3)
Global("Pool3Active","AR6200",3)~ THEN JOURNAL @4 /* ~New power gained: "Unleash"

The "Unleash" ability releases your inner power upon a target that is within melee range, hitting them for 10d12 magic damage (half on a successful save vs. Death) and sending them flying back and perhaps unconscious for a short period.  This ability may only be used once ever thirty seconds...and after using it the Bhaalspawn will be incredibly fatigued and have a 25% miscast chance on all spells for 2 rounds.  Due to the amount of divine essence used, the Slayer form will also not be available for thirty seconds.  ~ #80538 */ GOTO a5
  IF ~Global("Pool2Active","AR6200",3)
!Global("Pool3Active","AR6200",3)~ THEN JOURNAL @4 /* ~New power gained: "Unleash"

The "Unleash" ability releases your inner power upon a target that is within melee range, hitting them for 10d12 magic damage (half on a successful save vs. Death) and sending them flying back and perhaps unconscious for a short period.  This ability may only be used once ever thirty seconds...and after using it the Bhaalspawn will be incredibly fatigued and have a 25% miscast chance on all spells for 2 rounds.  Due to the amount of divine essence used, the Slayer form will also not be available for thirty seconds.  ~ #80539 */ GOTO a5
  IF ~!Global("Pool2Active","AR6200",3)
!Global("Pool3Active","AR6200",3)
DifficultyGT(3)~ THEN DO ~SetGlobal("Pool1Active","AR6200",3)
ReallyForceSpellRES("pool1a",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool1b2")~ JOURNAL @3 /* ~New power gained: "Unleash"

The "Unleash" ability releases your inner power upon a target that is within melee range, hitting them for 10d12 magic damage (half on a successful save vs. Death) and sending them flying back and perhaps unconscious for a short period.  This ability may only be used once ever thirty seconds...and after using it the Bhaalspawn will be incredibly fatigued and have a 25% miscast chance on all spells for 2 rounds.  Due to the amount of divine essence used, the Slayer form will also not be available for thirty seconds. h~ #77370 */ EXIT
END

IF ~Global("Pool2Active","AR6200",2)~ THEN BEGIN a2 // from:
  SAY @5 /* ~You place your hand within the energies of the pool and draw the essence into yourself, diverting it away from Melissan.  Boundless power fills you, and while most of it dissipates you are left with much of Bhaal's essence.  For the moment, you have gained the ability to teleport freely throughout space and also fight for control of abyssal demons that are under Melissan's control. Part of this ability to teleport also means you are now completely immune to the spells Maze and Imprisonment.  The energies also restore the powers of all present.~ #74346 */
  IF ~!Global("Pool1Active","AR6200",3)
!Global("Pool3Active","AR6200",3)
DifficultyLT(4)~ THEN DO ~SetGlobal("Pool2Active","AR6200",3)
ReallyForceSpellRES("POOL2A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool2b")~ JOURNAL @6 /* ~New power gained: "Control Demon"

This ability allows the Bhaalspawn to attempt to wrest control of a demon away from Melissan and make them an ally.  The Bhaalspawn engages the demon in mental combat for 1 round, at the end of which the demon has a chance of becoming an ally.  The demon is not under the Bhaalspawn's direct control, however.  This ability may be used once every 3 rounds.

New power gained: "Dimension Door"

The Bhaalspawn may now move freely through space and the planes.  This teleportation power is useable once per round.      ~ #77375 */ EXIT
  IF ~Global("Pool1Active","AR6200",3)
Global("Pool3Active","AR6200",3)~ THEN JOURNAL @6 /* ~New power gained: "Control Demon"

This ability allows the Bhaalspawn to attempt to wrest control of a demon away from Melissan and make them an ally.  The Bhaalspawn engages the demon in mental combat for 1 round, at the end of which the demon has a chance of becoming an ally.  The demon is not under the Bhaalspawn's direct control, however.  This ability may be used once every 3 rounds.

New power gained: "Dimension Door"

The Bhaalspawn may now move freely through space and the planes.  This teleportation power is useable once per round.      ~ #77376 */ GOTO a6
  IF ~!Global("Pool1Active","AR6200",3)
Global("Pool3Active","AR6200",3)~ THEN JOURNAL @6 /* ~New power gained: "Control Demon"

This ability allows the Bhaalspawn to attempt to wrest control of a demon away from Melissan and make them an ally.  The Bhaalspawn engages the demon in mental combat for 1 round, at the end of which the demon has a chance of becoming an ally.  The demon is not under the Bhaalspawn's direct control, however.  This ability may be used once every 3 rounds.

New power gained: "Dimension Door"

The Bhaalspawn may now move freely through space and the planes.  This teleportation power is useable once per round.      ~ #80540 */ GOTO a7
  IF ~Global("Pool1Active","AR6200",3)
!Global("Pool3Active","AR6200",3)~ THEN JOURNAL @6 /* ~New power gained: "Control Demon"

This ability allows the Bhaalspawn to attempt to wrest control of a demon away from Melissan and make them an ally.  The Bhaalspawn engages the demon in mental combat for 1 round, at the end of which the demon has a chance of becoming an ally.  The demon is not under the Bhaalspawn's direct control, however.  This ability may be used once every 3 rounds.

New power gained: "Dimension Door"

The Bhaalspawn may now move freely through space and the planes.  This teleportation power is useable once per round.      ~ #80541 */ GOTO a7
  IF ~!Global("Pool1Active","AR6200",3)
!Global("Pool3Active","AR6200",3)
DifficultyGT(3)~ THEN DO ~SetGlobal("Pool2Active","AR6200",3)
ReallyForceSpellRES("POOL2A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool2b2")~ JOURNAL @6 /* ~New power gained: "Control Demon"

This ability allows the Bhaalspawn to attempt to wrest control of a demon away from Melissan and make them an ally.  The Bhaalspawn engages the demon in mental combat for 1 round, at the end of which the demon has a chance of becoming an ally.  The demon is not under the Bhaalspawn's direct control, however.  This ability may be used once every 3 rounds.

New power gained: "Dimension Door"

The Bhaalspawn may now move freely through space and the planes.  This teleportation power is useable once per round.      ~ #77375 */ EXIT
END

IF ~Global("Pool3Active","AR6200",2)~ THEN BEGIN a3 // from:
  SAY @7 /* ~You place your hand within the energies of the pool and draw the essence into yourself, diverting it away from Melissan.  You are filled with boundless power for a moment...and while most of it leaves you and dissipates into the cosmos, a part of it remains with you.  You have gained the ability to focus the energies within you to protect yourself from such magics as Time Stop, Disintegrate and Flesh to Stone for a short period.  The energies also restore the powers of all present.~ #74347 */
  IF ~!Global("Pool1Active","AR6200",3)
!Global("Pool2Active","AR6200",3)
DifficultyLT(4)~ THEN DO ~SetGlobal("Pool3Active","AR6200",3)
ReallyForceSpellRES("POOL3A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool3b")~ JOURNAL @9 /* ~New power gained: "Focus"

This ability allows the Bhaalspawn to focus his energy within him to resist spell effects from without.  For a 30-second duration, the Bhaalspawn becomes immune to the spells Flesh to Stone, Disintegration and Time Stop.  All minor spells of 1st through 3rd level will also not affect the Bhaalspawn.  This ability is useable once per minute.  ~ #77380 */ EXIT
  IF ~Global("Pool1Active","AR6200",3)
Global("Pool2Active","AR6200",3)~ THEN JOURNAL @9 /* ~New power gained: "Focus"

This ability allows the Bhaalspawn to focus his energy within him to resist spell effects from without.  For a 30-second duration, the Bhaalspawn becomes immune to the spells Flesh to Stone, Disintegration and Time Stop.  All minor spells of 1st through 3rd level will also not affect the Bhaalspawn.  This ability is useable once per minute.  ~ #77381 */ GOTO a8
  IF ~Global("Pool1Active","AR6200",3)
!Global("Pool2Active","AR6200",3)~ THEN JOURNAL @9 /* ~New power gained: "Focus"

This ability allows the Bhaalspawn to focus his energy within him to resist spell effects from without.  For a 30-second duration, the Bhaalspawn becomes immune to the spells Flesh to Stone, Disintegration and Time Stop.  All minor spells of 1st through 3rd level will also not affect the Bhaalspawn.  This ability is useable once per minute.  ~ #80542 */ GOTO a9
  IF ~!Global("Pool1Active","AR6200",3)
Global("Pool2Active","AR6200",3)~ THEN JOURNAL @9 /* ~New power gained: "Focus"

This ability allows the Bhaalspawn to focus his energy within him to resist spell effects from without.  For a 30-second duration, the Bhaalspawn becomes immune to the spells Flesh to Stone, Disintegration and Time Stop.  All minor spells of 1st through 3rd level will also not affect the Bhaalspawn.  This ability is useable once per minute.  ~ #80543 */ GOTO a9
  IF ~!Global("Pool1Active","AR6200",3)
!Global("Pool2Active","AR6200",3)
DifficultyGT(3)~ THEN DO ~SetGlobal("Pool3Active","AR6200",3)
ReallyForceSpellRES("POOL3A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool3b2")~ JOURNAL @9 /* ~New power gained: "Focus"

This ability allows the Bhaalspawn to focus his energy within him to resist spell effects from without.  For a 30-second duration, the Bhaalspawn becomes immune to the spells Flesh to Stone, Disintegration and Time Stop.  All minor spells of 1st through 3rd level will also not affect the Bhaalspawn.  This ability is useable once per minute.  ~ #77380 */ EXIT
END

IF ~~ THEN BEGIN a4 // from: 1.1
  SAY @10 /* ~The final pool has been stilled.  The light of the energy column has begun to ebb.  You have only moments to prepare for what is surely the final confrontation...~ #77372 */
  IF ~DifficultyLT(5)~ THEN DO ~SetGlobal("Pool1Active","AR6200",3)
SetGlobalTimer("MelissanComes","AR6200",15)
ReallyForceSpellRES("pool1a",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool1b")~ EXIT
  IF ~Difficulty(5)~ THEN DO ~SetGlobal("Pool1Active","AR6200",3)
SetGlobalTimer("MelissanComes","AR6200",15)
ReallyForceSpellRES("pool1a",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool1b2")~ EXIT
END

IF ~~ THEN BEGIN a5 // from: 1.3 1.2
  SAY @11 /* ~Already Melissan begins to stir within the stream of divine energies.  Once the last pool is stilled, there will be very little time before she reacts.~ #77374 */
  IF ~DifficultyLT(3)~ THEN DO ~SetGlobal("Pool1Active","AR6200",3)
ReallyForceSpellRES("pool1a",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool1b")~ EXIT
  IF ~DifficultyGT(2)~ THEN DO ~SetGlobal("Pool1Active","AR6200",3)
ReallyForceSpellRES("pool1a",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool1b2")~ EXIT
END

IF ~~ THEN BEGIN a6 // from: 2.1
  SAY @10 /* ~The final pool has been stilled.  The light of the energy column has begun to ebb.  You have only moments to prepare for what is surely the final confrontation...~ #77377 */
  IF ~DifficultyLT(5)~ THEN DO ~SetGlobal("Pool2Active","AR6200",3)
SetGlobalTimer("MelissanComes","AR6200",15)
ReallyForceSpellRES("POOL2A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool2b")~ EXIT
  IF ~Difficulty(5)~ THEN DO ~SetGlobal("Pool2Active","AR6200",3)
SetGlobalTimer("MelissanComes","AR6200",15)
ReallyForceSpellRES("POOL2A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool2b2")~ EXIT
END

IF ~~ THEN BEGIN a7 // from: 2.3 2.2
  SAY @11 /* ~Already Melissan begins to stir within the stream of divine energies.  Once the last pool is stilled, there will be very little time before she reacts.~ #77379 */
  IF ~DifficultyLT(3)~ THEN DO ~SetGlobal("Pool2Active","AR6200",3)
ReallyForceSpellRES("POOL2A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool2b")~ EXIT
  IF ~DifficultyGT(2)~ THEN DO ~SetGlobal("Pool2Active","AR6200",3)
ReallyForceSpellRES("POOL2A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool2b2")~ EXIT
END

IF ~~ THEN BEGIN a8 // from: 3.1
  SAY @10 /* ~The final pool has been stilled.  The light of the energy column has begun to ebb.  You have only moments to prepare for what is surely the final confrontation...~ #77382 */
  IF ~DifficultyLT(5)~ THEN DO ~SetGlobal("Pool3Active","AR6200",3)
SetGlobalTimer("MelissanComes","AR6200",15)
ReallyForceSpellRES("POOL3A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool3b")~ EXIT
  IF ~Difficulty(5)~ THEN DO ~SetGlobal("Pool3Active","AR6200",3)
SetGlobalTimer("MelissanComes","AR6200",15)
ReallyForceSpellRES("POOL3A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool3b2")~ EXIT
END

IF ~~ THEN BEGIN a9 // from: 3.3 3.2
  SAY @11 /* ~Already Melissan begins to stir within the stream of divine energies.  Once the last pool is stilled, there will be very little time before she reacts.~ #77384 */
  IF ~DifficultyLT(3)~ THEN DO ~SetGlobal("Pool3Active","AR6200",3)
ReallyForceSpellRES("POOL3A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool3b")~ EXIT
  IF ~DifficultyGT(2)~ THEN DO ~SetGlobal("Pool3Active","AR6200",3)
ReallyForceSpellRES("POOL3A",LastTalkedToBy)
ClearAllActions()
StartCutSceneMode()
StartCutScene("pool3b2")~ EXIT
END
