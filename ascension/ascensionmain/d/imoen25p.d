///////////////////////////////////////////////////////////////////////
// Ascension : IMOEN25P
///////////////////////////////////////////////////////////////////////
// (1) gives more complicated state triggers to imoen leaving
// (2) appends states 4--14, which deal with the final battle
///////////////////////////////////////////////////////////////////////

ADD_STATE_TRIGGER IMOEN25P 0
~!Global("ImoenBackToHuman","GLOBAL",1)
!Global("ImoenHurt","GLOBAL",1)
!Global("ImoenResurrected","GLOBAL",1)
!Global("ImoenResurrected2","GLOBAL",1)~ 
2 // also add this trigger to state 2

APPEND IMOEN25P

IF ~Global("ImoenHurt","GLOBAL",1)~ THEN BEGIN a4 // from:
  SAY @470 /* ~Nnngh!  Ah, it hurts!  <CHARNAME>, stop her...it...it hurts!!~ [IMOEN18] #74349 */
  IF ~~ THEN REPLY @471 /* ~What are you doing to her?!  Stop it, I demand it!!~ #74285 */ DO ~SetGlobal("ImoenHurt","GLOBAL",0)~ EXTERN ~FINMEL01~ a6
  IF ~~ THEN REPLY @472 /* ~I'm the one you're after, Melissan!  Leave her alone!!~ #74286 */ DO ~SetGlobal("ImoenHurt","GLOBAL",0)~ EXTERN ~FINMEL01~ a6
  IF ~~ THEN REPLY @473 /* ~Pull yourself together, Imoen!  Attack!!~ #74287 */ DO ~SetGlobal("ImoenHurt","GLOBAL",0)~ EXTERN ~FINMEL01~ a6
  IF ~~ THEN REPLY @474 /* ~So what do I care about Imoen?  Kill her, Melissan.~ #82762 */ DO ~SetGlobal("ImoenHate","GLOBAL",1)
SetGlobal("ImoenHurt","GLOBAL",0)~ EXTERN ~FINMEL01~ a6
END

IF ~Global("ImoenHurt","GLOBAL",0)
Global("ImoenBackToHuman","GLOBAL",0)
OR(2)
Global("ImoenResurrected","GLOBAL",1)
Global("ImoenResurrected2","GLOBAL",1)~ THEN BEGIN a5 // from:
  SAY @475 /* ~Wh-what...where am I?  What's going on?  <CHARNAME>?~ #74289 */
  IF ~~ THEN EXTERN ~FINMEL01~ a24
END

IF ~False()~ THEN BEGIN a6 // from: FINMEL01:24.1
  SAY @476 /* ~I'm not going anywhere with you!  And nobody's touching my soul!  Not again!!~ #74302 */
  IF ~~ THEN EXTERN ~FINMEL01~ a23
END

IF ~Global("ImoenBackToHuman","GLOBAL",1)~ THEN BEGIN a7 // from:
  SAY @477 /* ~It...it's gone...I'm human again.  Ohhhh, now I know what you went through, <CHARNAME>!  I don't know if I ever want to go through that again!~ #75870 */
  IF ~Global("ImoenHate","GLOBAL",1)~ THEN DO ~SetGlobal("ImoenBackToHuman","GLOBAL",2)~ GOTO a8
  IF ~Global("ImoenResurrected2","GLOBAL",1)
Global("ImoenHate","GLOBAL",0)~ THEN DO ~SetGlobal("ImoenBackToHuman","GLOBAL",2)~ GOTO a10
  IF ~Global("ImoenResurrected2","GLOBAL",0)
Global("ImoenHate","GLOBAL",0)~ THEN DO ~SetGlobal("ImoenBackToHuman","GLOBAL",2)~ GOTO a15
END

IF ~~ THEN BEGIN a8 // from: 7.0
  SAY @478 /* ~And I can't believe what you said, either!  'Go ahead and kill her'?  After all we've been through, that's what you say in my defense?!~ #75871 */
  IF ~CheckStatGT(Player1,15,CHR)~ THEN REPLY @479 /* ~I was trying to convince Melissan to leave you alone, Imoen!~ #74305 */ GOTO a9
  IF ~!CheckStatGT(Player1,15,CHR)~ THEN REPLY @479 /* ~I was trying to convince Melissan to leave you alone, Imoen!~ #74312 */ GOTO a13
  IF ~~ THEN REPLY @480 /* ~Get over yourself, little girl.  I never asked you to come, did I?~ #74314 */ GOTO a14
  IF ~OR(2)
ActuallyInCombat()
See([ENEMY])~ THEN REPLY @481 /* ~We don't have time for this chat, Imoen!  This is the middle of a fight!~ #82743 */ GOTO a16
END

IF ~~ THEN BEGIN a9 // from: 8.0
  SAY @482 /* ~Well...I suppose.  You convinced me more than her, obviously.  I...I'm just glad I didn't do more damage as the slayer.  I don't know how you handled it.  Thank you for...for not killing me.~ #74306 */
  IF ~Global("ImoenResurrected2","GLOBAL",1)~ THEN GOTO a10
  IF ~!Global("ImoenResurrected2","GLOBAL",1)~ THEN GOTO a11
END

IF ~~ THEN BEGIN a10 // from: 9.0 7.1
  SAY @483 /* ~I...I can't stay here, though.  This is way out of my league.  I wish you well, <CHARNAME>, and I hope I'll see you again.  Maybe back at Candlekeep, huh?  Anyway...good luck...~ #74307 */
  IF ~~ THEN DO ~ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN BEGIN a11 // from: 15.0 9.1
  SAY @484 /* ~Do you need me to join back up with you?  I could...leave the Throne, I think...I think I have that power, now, same as you.  But I'll fight by your side again, if you want me to.~ #82742 */
  IF ~~ THEN REPLY @486 /* ~Sure.  Let's join up again.~ #74309 */ DO ~SetGlobal("ImoenResurrected","GLOBAL",0)
JoinParty()~ JOURNAL @485 /* ~Imoen Has Survived

Imoen managed to survive Melissan's attempt to force her into berserk Slayer form.  It seems that in doing so, Imoen has had her own progress in the taint advanced considerably.  She now not only can turn into the same Slayer form that I began to back in Spellhold...but has also gained the ability to go ethereal for brief periods of time.

Ethereal
-------------
Imoen is now able to enter the Ethereal Plane for brief periods of time.  The ability is useable once every minute, and its use prevents her from assuming the Slayer form for a minute, as well.  Imoen can remain fully ethereal and intangible to forces on this plane for a full round...during which she is invisible and completely immune to harm.  During that round, she also cannot cast spells or use abilities.
For another two rounds afterwards, Imoen can remain 'half-phased'...she is partially ethereal and partially in this plane.  She is still invisible, but takes half damage from all sources.  In this state, there is a small chance (10%) that she will miscast a spell.  For all three rounds, she is able to see any invisible targets.
   Reven~ #82749 */ EXIT
  IF ~~ THEN REPLY @487 /* ~No...get out of here while you can, Imoen.~ #74310 */ GOTO a12
END

IF ~~ THEN BEGIN a12 // from: 17.2 16.1 11.1
  SAY @488 /* ~I wish you well, <CHARNAME>, and I hope I'll see you again.  Maybe back at Candlekeep, huh?  Anyway...good luck...~ #74311 */
  IF ~~ THEN DO ~SetGlobal("ImoenEpilogueAnyway","GLOBAL",1)
DropInventory()
ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN BEGIN a13 // from: 8.1
  SAY @489 /* ~Yeah, right.  You do whatever you have to, <CHARNAME>.  Me...I'm getting as far away from here as possible.  Good-bye!~ #74313 */
  IF ~~ THEN DO ~ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN BEGIN a14 // from: 8.2
  SAY @490 /* ~Nope, you sure didn't.  Thanks for nothing, I guess.  You do whatever you have to, <CHARNAME>.  Me...I'm getting as far away from here as possible.  Good-bye!~ #74315 */
  IF ~~ THEN DO ~ForceSpell(Myself,DRYAD_TELEPORT)~ EXIT
END

IF ~~ THEN BEGIN a15 // from: 7.2
  SAY @491 /* ~I'm...just glad I didn't do anything worse while I was...when I...oh, I just don't know how you handled it back in Spellhold.  Thank you for...not killing me, okay?~ #82745 */
  IF ~!ActuallyInCombat()
!See([ENEMY])~ THEN GOTO a11
  IF ~OR(2)
ActuallyInCombat()
See([ENEMY])~ THEN GOTO a17
END

IF ~~ THEN BEGIN a16 // from: 8.3
  SAY @492 /* ~Oh, so it is!  Do you need me back in the party?  I could...leave the Throne, I think...I think I have that power, now, same as you.  But I'll fight by your side again, if you want me to.~ #82744 */
  IF ~~ THEN REPLY @486 /* ~Sure.  Let's join up again.~ #74309 */ DO ~SetGlobal("ImoenResurrected","GLOBAL",0)
JoinParty()~ JOURNAL @485 /* ~Imoen Has Survived

Imoen managed to survive Melissan's attempt to force her into berserk Slayer form.  It seems that in doing so, Imoen has had her own progress in the taint advanced considerably.  She now not only can turn into the same Slayer form that I began to back in Spellhold...but has also gained the ability to go ethereal for brief periods of time.

Ethereal
-------------
Imoen is now able to enter the Ethereal Plane for brief periods of time.  The ability is useable once every minute, and its use prevents her from assuming the Slayer form for a minute, as well.  Imoen can remain fully ethereal and intangible to forces on this plane for a full round...during which she is invisible and completely immune to harm.  During that round, she also cannot cast spells or use abilities.
For another two rounds afterwards, Imoen can remain 'half-phased'...she is partially ethereal and partially in this plane.  She is still invisible, but takes half damage from all sources.  In this state, there is a small chance (10%) that she will miscast a spell.  For all three rounds, she is able to see any invisible targets.
   Reven~ #82749 */ EXIT
  IF ~~ THEN REPLY @487 /* ~No...get out of here while you can, Imoen.~ #74310 */ GOTO a12
END

IF ~~ THEN BEGIN a17 // from: 15.1
  SAY @493 /* ~I see the fight's still going on.  Do you need me back in the party?  I could...leave the Throne, I think...I think I have that power, now, same as you.  But I'd like to see this through, same as you.~ #82746 */
  IF ~~ THEN REPLY @486 /* ~Sure.  Let's join up again.~ #74309 */ GOTO a18
  IF ~~ THEN REPLY @494 /* ~Stop distracting me in the middle of combat, already!  Get back in the party!~ #82747 */ GOTO a18
  IF ~~ THEN REPLY @487 /* ~No...get out of here while you can, Imoen.~ #74310 */ GOTO a12
END

IF ~~ THEN BEGIN a18 // from: 17.1 17.0
  SAY @495 /* ~Yes <PRO_SIRMAAM>!  (giggle!)  Time to kick a certain someone's butt, right?~ #82748 */
  IF ~~ THEN DO ~SetGlobal("ImoenResurrected","GLOBAL",0)
JoinParty()~ JOURNAL @485 /* ~Imoen Has Survived

Imoen managed to survive Melissan's attempt to force her into berserk Slayer form.  It seems that in doing so, Imoen has had her own progress in the taint advanced considerably.  She now not only can turn into the same Slayer form that I began to back in Spellhold...but has also gained the ability to go ethereal for brief periods of time.

Ethereal
-------------
Imoen is now able to enter the Ethereal Plane for brief periods of time.  The ability is useable once every minute, and its use prevents her from assuming the Slayer form for a minute, as well.  Imoen can remain fully ethereal and intangible to forces on this plane for a full round...during which she is invisible and completely immune to harm.  During that round, she also cannot cast spells or use abilities.
For another two rounds afterwards, Imoen can remain 'half-phased'...she is partially ethereal and partially in this plane.  She is still invisible, but takes half damage from all sources.  In this state, there is a small chance (10%) that she will miscast a spell.  For all three rounds, she is able to see any invisible targets.
   Reven~ #82749 */ EXIT
END

END /* end of: APPEND IMOEN25P */
