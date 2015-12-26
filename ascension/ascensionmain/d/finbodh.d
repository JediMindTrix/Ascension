///////////////////////////////////////////////////////////////////////
// Ascension : FINBODH 
///////////////////////////////////////////////////////////////////////
// (1) FINBODH is created from scratch (not in the original game)
///////////////////////////////////////////////////////////////////////

BEGIN ~FINBODH~

IF ~Global("BodhiTalks","LOCALS",0)
!GlobalGT("BodhiHappyBunny","LOCALS",0)~ THEN BEGIN a0 // from:
  SAY @33 /* ~Ahhh...my dear brother calls me at last, does he?  I knew you would not be able to live without my assistance for long.~ #82645 */
  IF ~~ THEN DO ~SetGlobal("BodhiTalks","LOCALS",1)~ EXTERN ~IRENIC2~ a9
END

IF ~False()~ THEN BEGIN a1 // from: IRENIC2:9.0
  SAY @34 /* ~(chuckle)  How very like you to blame me for your own failings.  Poor, poor Irenicus...always so very, very close to getting what he wants and yet always so very, very far.~ #80555 */
  IF ~~ THEN EXTERN ~IRENIC2~ a11
END

IF ~False()~ THEN BEGIN a2 // from: IRENIC2:11.0
  SAY @35 /* ~So I see.  How absolutely delicious to let me in on your little play with the Bhaalspawn again, brother dear.  And how are you, <CHARNAME>?  I do so hope you are as...healthy...as I remember.  Shall we continue our merry dance?~ #81464 */
  IF ~~ THEN REPLY @36 /* ~Still trapped in servitude to Irenicus?  Do you have no will of your own, Bodhi?~ #82788 */ GOTO a4
  IF ~~ THEN REPLY @37 /* ~Why don't you go jump on a stake and spare us both the tedium of battle?~ #81470 */ GOTO a30
  IF ~~ THEN REPLY @38 /* ~Best hike up your skirts and run, Bodhi.  The time when I found vampires remotely threatening is long past!~ #81431 */ GOTO a30
  IF ~~ THEN REPLY @39 /* ~Do I have to suffer your prattle again?  I shall stamp out your evil presence once and for all!~ #82675 */ GOTO a31
END

IF ~~ THEN BEGIN a4 // from: 2.0
  SAY @41 /* ~Oh Child of Bhaal, so serious and grim!  Do you not enjoy that our paths have crossed again?  Does your blood not rejoice?~ #82647 */
  IF ~~ THEN REPLY @42 /* ~You are weak, Bodhi, while the blood of a god flows within me.  I shall enjoy your death...again.~ #82648 */ GOTO a21
  IF ~~ THEN REPLY @43 /* ~Enough of this!  You will fall before me, undead thing.~ #82650 */ GOTO a21
  IF ~CheckStatGT(Player1,15,CHR)
Global("BalthazarFights","GLOBAL",0)
!Alignment(Player1,MASK_GOOD)
!ReputationGT(Player1,11)~ THEN REPLY @44 /* ~You have nothing to gain from this fight.  Will you sacrifice yourself out of sibling loyalty?  Do not make that mistake again.~ #82651 */ GOTO a22
  IF ~OR(4)
!CheckStatGT(Player1,15,CHR)
!Global("BalthazarFights","GLOBAL",0)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,11)~ THEN REPLY @44 /* ~You have nothing to gain from this fight.  Will you sacrifice yourself out of sibling loyalty?  Do not make that mistake again.~ #82656 */ GOTO a26
  IF ~CheckStatGT(Player1,15,CHR)
Global("BalthazarFights","GLOBAL",0)
!Alignment(Player1,MASK_GOOD)
!ReputationGT(Player1,11)~ THEN REPLY @45 /* ~Stand aside Bodhi.  Your brother is blinded by his lust for vengance.  He's prepared to fight me to the death, but you don't need to die at his side.  There is no need for you to die at all.~ #82667 */ GOTO a22
  IF ~OR(4)
!CheckStatGT(Player1,15,CHR)
!Global("BalthazarFights","GLOBAL",0)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,11)~ THEN REPLY @45 /* ~Stand aside Bodhi.  Your brother is blinded by his lust for vengance.  He's prepared to fight me to the death, but you don't need to die at his side.  There is no need for you to die at all.~ #82668 */ GOTO a29
END

IF ~False()~ THEN BEGIN a19 // from: 44.2 34.2
  SAY @46 /* ~You may be strong, <CHARNAME>, but you are indeed a fool to think us weak.  I shall take your soul for my own, I swear it!~ #81466 */
  IF ~~ THEN EXTERN ~IRENIC2~ a13
END

IF ~False()~ THEN BEGIN a20 // from: 45.0 35.0 34.3
  SAY @47 /* ~You had your chance, brother.  Your plans failed, as I recall, and brought about my death.  No, you are weak and <CHARNAME> is strong and it is <PRO_HESHE> that shall give me what I need.  I look forward to bathing in your blood, dear brother...a suitable reward for your utter failure.~ #82759 */
  IF ~~ THEN EXTERN ~IRENIC2~ a14
END

IF ~~ THEN BEGIN a21 // from: 4.1 4.0
  SAY @48 /* ~Oh Child of Bhaal, you do bore me so with your talk.  Come to me and embrace death as I have.  Let the dance BEGIN aagain!~ #82649 */
  IF ~~ THEN EXTERN ~IRENIC2~ a10
END

IF ~~ THEN BEGIN a22 // from: 4.4 4.2
  SAY @49 /* ~Indeed, I have no intention of dying at all.   I fight with my brother because I have no choice....or would you offer me one now?~ #82652 */
  IF ~InPartyAllowDead("Sarevok")
!StateCheck("Sarevok",4032)~ THEN GOTO a23
  IF ~OR(2)
!InPartyAllowDead("Sarevok")
StateCheck("Sarevok",4032)~ THEN GOTO a25
END

IF ~~ THEN BEGIN a23 // from: 22.0
  SAY @50 /* ~My brother believes he can offer me your soul, yet I see that you too can raise others from the abyss; one who opposed you, no less!  How intriguing.  Perhaps I do not need to taste your blood...~ #82758 */
  IF ~False()~ THEN GOTO a24
  IF ~True()~ THEN EXTERN ~IRENIC2~ a12
END

IF ~~ THEN BEGIN a24 // from: IRENIC2:12.0 23.0
  SAY @51 /* ~I would make you an offer <CHARNAME>.  Promise me a piece of your soul and I shall fight as a sister to you.~ #82750 */
  IF ~False()~ THEN EXIT
  IF ~~ THEN GOTO a44
END

IF ~~ THEN BEGIN a25 // from: 22.1
  SAY @52 /* ~I require a soul <CHARNAME>, as well you know.  I could tear it from young Imoen once again, but she seems....indisposed.  Yet perhaps there is another way...~ #82655 */
  IF ~~ THEN EXTERN ~IRENIC2~ a12
END

IF ~~ THEN BEGIN a26 // from: 4.3
  SAY @53 /* ~I am doomed whether or not I fight.  My stay in the Abyss was not a pleasant one, but since I must return, I shall not pass up a chance to feast on such a fine morsel.~ #82657 */
  IF ~~ THEN REPLY @54 /* ~I have power beyond your brother's.  Join with me and I shall grant the reward he shall not live to bestow; a soul.~ #82658 */ GOTO a27
  IF ~~ THEN REPLY @55 /* ~I have changed since our last encounter, Bodhi.  I am above you and your pitiful games.  They bore me and I shall put an end to them!~ #82664 */ GOTO a28
  IF ~~ THEN REPLY @56 /* ~So much talk from your brother, Bodhi, yet actions speak louder than words.  How many deaths has your brother granted me?  Do you truly believe you can win?  Take the portion of soul I offer and live again.~ #82666 */ GOTO a27
END

IF ~~ THEN BEGIN a27 // from: 29.2 29.0 26.2 26.0
  SAY @57 /* ~Such a delicious offer you make...though I must wonder if you are telling the truth.  Are my chances of survival really any better with you...?
 ~ #82761 */
  IF ~Global("BalthazarFights","GLOBAL",0)
OR(2)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,11)
GlobalGT("WorkingForBodhi","GLOBAL",0)~ THEN GOTO a32
  IF ~Global("BalthazarFights","GLOBAL",0)
OR(2)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,11)
Global("WorkingForBodhi","GLOBAL",0)~ THEN GOTO a33
  IF ~Global("BalthazarFights","GLOBAL",0)
!Alignment(Player1,MASK_GOOD)
!ReputationGT(Player1,11)~ THEN GOTO a34
  IF ~Global("BalthazarFights","GLOBAL",1)
GlobalGT("WorkingForBodhi","GLOBAL",0)~ THEN GOTO a36
  IF ~Global("BalthazarFights","GLOBAL",1)
Global("WorkingForBodhi","GLOBAL",0)~ THEN GOTO a46
END

IF ~~ THEN BEGIN a28 // from: 29.3 29.1 26.1
  SAY @58 /* ~So <CHARNAME>, the creature of darkness that rests within you has also stolen your wit.  Such a shame for one with the divine essence.  It will almost be a mercy to end your existence.~ #82665 */
  IF ~~ THEN EXTERN ~IRENIC2~ a10
END

IF ~~ THEN BEGIN a29 // from: 4.5
  SAY @59 /* ~An opportunity to feast on the blood of a God, and yet you think I will stand aside?  (chuckle)  You know me no better than my dear brother here.~ #82669 */
  IF ~~ THEN REPLY @54 /* ~I have power beyond your brother's.  Join with me and I shall grant the reward he shall not live to bestow; a soul.~ #82670 */ GOTO a27
  IF ~~ THEN REPLY @55 /* ~I have changed since our last encounter, Bodhi.  I am above you and your pitiful games.  They bore me and I shall put an end to them!~ #82671 */ GOTO a28
  IF ~~ THEN REPLY @56 /* ~So much talk from your brother, Bodhi, yet actions speak louder than words.  How many deaths has your brother granted me?  Do you truly believe you can win?  Take the portion of soul I offer and live again.~ #82672 */ GOTO a27
  IF ~~ THEN REPLY @60 /* ~Nor would I care to.  Soon enough you will return to the torment you deserve.~ #82673 */ GOTO a28
END

IF ~~ THEN BEGIN a30 // from: 2.2 2.1
  SAY @61 /* ~Well, well, well...if the Child of Bhaal hasn't gone and found <PRO_HIMHER>self a sense of humour.  Did <PRO_HESHE> dig it up all by <PRO_HIMHER>self, dear brother, or did you implant it in <PRO_HIMHER> in one of your more bizarre experiments?~ #82778 */
  IF ~~ THEN EXTERN ~IRENIC2~ a10
END

IF ~~ THEN BEGIN a31 // from: 2.3
  SAY @62 /* ~I see you are now more Slayer than <PRO_MANWOMAN>.  How dull.  You provided such small amusement last time, I doubt that this will be different.~ #82676 */
  IF ~~ THEN EXTERN ~IRENIC2~ a10
END

IF ~~ THEN BEGIN a32 // from: 27.0
  SAY @63 /* ~No, <CHARNAME>.  Sadly, I do not think we are destined to work together again.  I am content to fight by my brother and revel in your blood and that of those that follow at your heel.~ #82681 */
  IF ~~ THEN EXTERN ~IRENIC2~ a13
END

IF ~~ THEN BEGIN a33 // from: 27.1
  SAY @64 /* ~Oh Child of Bhaal, such a game you play.  You think to trick me, but I shall not be fooled so easily.  I know you to be ever so desperate to do 'good' and this would not bode well for me.  No, this ends here.~ #82682 */
  IF ~~ THEN EXTERN ~IRENIC2~ a13
END

IF ~~ THEN BEGIN a34 // from: 27.2
  SAY @65 /* ~Oh Child of Bhaal, such a game you play.  I fight with my 'dear' brother for your soul, yet you would offer it willingly?  Promise me a piece of your essence and I will join you...for now.~ #82683 */
  IF ~~ THEN REPLY @66 /* ~I swear to you Bodhi, fight by my side, kill my enemies, and you shall have the soul you desire.~ #82684 */ DO ~SetGlobal("BodhiPromised","GLOBAL",1)~ GOTO a35
  IF ~~ THEN REPLY @67 /* ~You have my word Bodhi that when this is done, you shall have a piece of my essence.~ #82686 */ DO ~SetGlobal("BodhiPromised","GLOBAL",1)~ GOTO a35
  IF ~~ THEN REPLY @68 /* ~Actually Bodhi, I have changed my mind.  I enjoy watching you die too much, to pass up an opportunity to see it again.~ #82756 */ GOTO a19
  IF ~CheckStatGT(Player1,15,WIS)~ THEN REPLY @69 /* ~Bodhi, when this is over, I swear that you will be fittingly rewarded.~ #82688 */ GOTO a20
END

IF ~~ THEN BEGIN a35 // from: 34.1 34.0
  SAY @70 /* ~Pray that you hold to your word, failure to do so would be...unpleasant for you.  Now to finalize matters...~ #82685 */
  IF ~~ THEN GOTO a20
END

IF ~~ THEN BEGIN a36 // from: 27.3
  SAY @71 /* ~No, <CHARNAME>.  Sadly, I do not think we are destined to work together again.  Despite the attractiveness of what you offer, your words ring more hollow than my brother's.  Far better to rip your soul from your living breast than beg for it at your side.~ #82767 */
  IF ~~ THEN EXTERN ~IRENIC2~ a13
END

IF ~False()~ THEN BEGIN a37 // from: FINSOL01:4.4
  SAY @72 /* ~I require satisfaction before the Child of Bhaal makes any sort of decision, creature.  Both my brother and this...Melissan, lie dead.  Your hunt has been delightfully successful, <CHARNAME>.~ #82690 */
  IF ~~ THEN GOTO a38
END

IF ~~ THEN BEGIN a38 // from: 37.0
  SAY @73 /* ~But do not forget our deal.  I am impatient for the piece of your soul you promised me.  I have enjoyed our dance Child of Bhaal, but I tire of this place.  Give me what I want so I may leave...we need not meet each other again, unless you wish it.~ #82691 */
  IF ~~ THEN REPLY @74 /* ~It was a pleasure to have you fight by my side, Bodhi.  You have earned this reward.~ #82692 */ DO ~SetGlobal("BodhiHappyBunny","LOCALS",1)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif01")~ EXIT
  IF ~~ THEN REPLY @75 /* ~You shall have nothing.  Your use to me is at an end.  I shall enjoy sending you screaming back into the abyss.~ #82693 */ GOTO a39
  IF ~~ THEN REPLY @76 /* ~Hmmm, I could kill you...no, I have better things to do.  Take these scraps of my essence and depart.~ #82699 */ DO ~SetGlobal("BodhiHappyBunny","LOCALS",2)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif01")~ EXIT
  IF ~~ THEN REPLY @77 /* ~No Bodhi, I think I will keep all of my soul.  You will fall back into the abyss.  Give Bhaal my regards.~ #82700 */ GOTO a40
END

IF ~~ THEN BEGIN a39 // from: 38.1
  SAY @78 /* ~Fool!  You think to betray me, Child of Bhaal?  I refuse to return to the abyss.  I shall rip every shred of that soul from your body!  Let the dance end here!~ #82694 */
  IF ~Global("BodhiPromised","GLOBAL",1)~ THEN DO ~SetGlobal("BodhiHappyBunny","LOCALS",3)~ EXTERN ~FINSOL01~ a40
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @79 /* ~This is my realm, Bodhi.  I control everything here.  It is time for you to join your brother.~ #82695 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @80 /* ~Enough talk!  The dance has come to an end, Bodhi, and so has your part in it.~ #82696 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @81 /* ~Die!  Witness my power, insect!~ #82697 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @82 /* ~Oh Bodhi, you should have begged.  I would have liked to see that.  Too late now.~ #82698 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
END

IF ~~ THEN BEGIN a40 // from: 38.3
  SAY @83 /* ~So you have betrayed me, <CHARNAME>.  It would seem that working together was never our true calling.~ #82701 */
  IF ~Global("BodhiPromised","GLOBAL",1)~ THEN DO ~SetGlobal("BodhiHappyBunny","LOCALS",3)~ EXTERN ~FINSOL01~ a40
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @79 /* ~This is my realm, Bodhi.  I control everything here.  It is time for you to join your brother.~ #82702 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @80 /* ~Enough talk!  The dance has come to an end, Bodhi, and so has your part in it.~ #82703 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @81 /* ~Die!  Witness my power, insect!~ #82704 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
  IF ~Global("BodhiPromised","GLOBAL",0)~ THEN REPLY @82 /* ~Oh Bodhi, you should have begged.  I would have liked to see that.  Too late now.~ #82705 */ DO ~SetGlobal("BodhiFights","GLOBAL",0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif02")~ EXIT
END

IF ~Global("BodhiHappyBunny","LOCALS",1)~ THEN BEGIN a41 // from:
  SAY @84 /* ~Ahhhhh, such feeling.  I feel the life flow through me!  Such a gift you carry Child of Bhaal... such power... such strength.  Oh this is simply divine!~ #82707 */
  IF ~~ THEN GOTO a43
END

IF ~Global("BodhiHappyBunny","LOCALS",2)~ THEN BEGIN a42 // from:
  SAY @85 /* ~Such an ungrateful <PRO_MANWOMAN> you are.  Still, I have life once more, and I intend to enjoy it.  Perhaps the wizards of Spellhold still wish to play?~ #82708 */
  IF ~~ THEN GOTO a43
END

IF ~Global("BodhiHappyBunny","LOCALS",3)~ THEN BEGIN a43 // from: 42.0 41.0
  SAY @86 /* ~Well, Child of Bhaal, it would seem that our time together is at an end.  I shall enjoy carrying this piece of you with me.  Prehaps we shall meet again, you and I...~ #82709 */
  IF ~~ THEN DO ~SetGlobal("BodhiFights","GLOBAL",2)
ClearAllActions()
StartCutSceneMode()
StartCutScene("bodhif03")~ EXIT
END

IF ~~ THEN BEGIN a44 // from: 24.1
  SAY @87 /* ~Now, now, <CHARNAME>...there is no need to look at me so.  A tiny piece of your soul would give me all I require and more.  Decide quickly, for I doubt my dear brother will be content with merely withering me with his own delightfully evil glare.~ #82733 */
  IF ~~ THEN REPLY @66 /* ~I swear to you Bodhi, fight by my side, kill my enemies, and you shall have the soul you desire.~ #82751 */ DO ~SetGlobal("BodhiPromised","GLOBAL",1)~ GOTO a45
  IF ~~ THEN REPLY @67 /* ~You have my word Bodhi that when this is done, you shall have a piece of my essence.~ #82752 */ DO ~SetGlobal("BodhiPromised","GLOBAL",1)~ GOTO a45
  IF ~~ THEN REPLY @88 /* ~Why you assumed I would even be interested in your allegiance, Bodhi, I have no idea.  I shall be pleased to know that you both die again just as you lived: without a single redeeming or worthwhile quality.~ #82753 */ GOTO a19
  IF ~CheckStatGT(Player1,15,WIS)~ THEN REPLY @69 /* ~Bodhi, when this is over, I swear that you will be fittingly rewarded.~ #82754 */ GOTO a45
END

IF ~~ THEN BEGIN a45 // from: 44.3 44.1 44.0
  SAY @89 /* ~Pray that you hold to your word, failure to do so would be...unpleasant for you.  Now to finalize matters....~ #82755 */
  IF ~~ THEN GOTO a20
END

IF ~~ THEN BEGIN a46 // from: 27.4
  SAY @90 /* ~No, <CHARNAME>.  Despite the attractiveness of what you offer, your words ring more hollow than my brother's.  Far better to rip your soul from your living breast than beg for it at your side.~ #82768 */
  IF ~~ THEN EXTERN ~IRENIC2~ a13
END
