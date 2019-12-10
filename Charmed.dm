#define WALK_SPEED 7
#define RUN_SPEED 10

#define AUTOSAVE_TIME 1200

#define REDCHARM "<IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='redcharm'>"
client
	North()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, NORTH)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	South()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, SOUTH)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	East()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, EAST)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	West()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, WEST)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	Northeast()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, NORTHEAST)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	Northwest()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, NORTHWEST)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	Southeast()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, SOUTHEAST)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
	Southwest()
		var/mob/Player/s = usr
		if(s.astralbody)
			var/mob/Player/astral = s.astralbody
			step(astral, SOUTHWEST)
			return
		if(istype(s,/mob/Player/) && s.control ==1)
			return
		else
			..()
/*
BloodRayne666  Ban Never Xoule Please read the rules. For flaming.
Blaze125 Ban Never [Automated] Please read the rules. For flaming.
Bloodrayne94 Ban Never [Automated] Please read the rules. For flaming.
Grand elder Ban Never [Automated] Please read the rules. For flaming.

blend() to do effects

mob
	Login()
		world << "[usr] has logged in."
		usr << "Still in the making, you can chat here though. About it. :P"
	Logout()
		world << "[usr] has logged out."
	verb
		say(msg as text)
			world << "[usr] says,\"[msg]\""
		emote(msg as text)
			world << "<font color=red>[usr] [msg]</font><br>"
*/
mob
/*	Enter(O) // hit by object =.=..........
		world << "Huh?"
		if(O!=null && istype(O,/obj/))
			world << "hehe"
			var/mob/Player/target = src
			var/obj/ob = O
			var/mob/Player/user = ob.movedby
			target << "You have been hit by [ob], controlled by [ob.movedby]."
			target.damagecounter -= ob.damage
			//checkdeath =.=///
			var/death = call(/mob/Player/proc/Deathcheck)(target)
			if(death == 1) //died, give exp to rewarding party
				if(user.class == "TK Witch")//give tk exp
					user.telekinesis[2]+=target.damagecounter2
					call(/mob/Player/proc/Levelme)(user)
		else
			world << "Nothing happened"*/
	Player
		Bump()
			if(src.client)
				walk(src,0)
		Monster
			var
				damage = 1
				sequence[4]
				arouse = 0
			New()
				spawn(10)
					Look()
			proc/Look()
				switch(src.name)
					if("Triad")
						var/mob/Player/M
						for(M in oview(10))
							if(M.client)
								if(arouse == 0)
									//oview(src) << sequence[1]
									sleep(30)
									var/seq = rand(2,4)
									oview(src) << sequence[seq]
									sleep(10)
									arouse = 1
									walk_to(src,M,10-speed)
									while(M in oview(10))
										if(src.stun!=1)
											if(M in view(1))
												Fight(M)
											else
												walk(src,0)
												var/obj/Ungetables/Throwable/Power/Fireball/e = new(src.loc)
												e.damage = 5
												e.thereyet = M.loc
												e.movedby = src
												oview(M) << "\a [e] begans to form in [src]'s hand."
												oview(M) << "[src] throws \a [e]"
												walk_towards(e,e.thereyet,0)
												walk_to(src,M,10-speed)
												sleep(10)
										else
											sleep(5)
									arouse = 0
							else
								walk_rand(src,10-speed)
								arouse = 0
								sleep(10)
							sleep(5)	//oview() << sound('./soul.wav',0,0,1,100)
						spawn(5)
							Look()
					if("Kelnerth")
						var/mob/Player/M
						while(src)
							if(demonquest)
								M = demonquest
								src.Say("HOW DARE YOU ATTACK ME!")
								while(M in oview(10))
									if(src.stun!=1)
										if(M in view(1))
											Fight(M)
										else
											var/obj/Ungetables/Throwable/Power/Energyball/e = new(src.loc)
											e.thereyet = M.loc
											e.movedby = src
											oview(M) << "\a [e] begans to form in [M]'s hand."
											oview(M) << "[M] throws \a [e]"
											walk_towards(e,e.thereyet,0)
											walk_to(src,M,10-speed)
											walk(src,0)
											sleep(50)
									else
										sleep(20)
								demonquest = null
							for(M in oview(10))
								if(M.class=="Telekinetic Witch" || M.class=="Molecular Witch" || M.class=="Premonition Witch" || M.class=="Telepathy Witch" || M.class == "Half Whitelighter" || M.name == "Ghast" || M.name == "Zombie" || M.class == "Astral Witch" || M.class == "Witch" || M.class == "Invisibility Witch")
									if(arouse == 0 )
										//oview(src) << sequence[1]
										Emote("sniffs the air deeply, taking note of the scent before cursing loudly.")
										sleep(30)
										Say("How dare you come snooping around.")
										sleep(10)
										arouse = 1
										walk_to(src,M,10-speed)
										while(M in oview(10))
											if(src.stun!=1)
												if(M in view(1))
													Fight(M)
												else
													walk(src,0)
													var/obj/Ungetables/Throwable/Power/Energyball/e = new(src.loc)
													e.thereyet = M.loc
													e.movedby = src
													oview(M) << "\a [e] begans to form in [src]'s hand."
													oview(M) << "[src] throws \a [e]"
													walk_towards(e,e.thereyet,0)
													walk_to(src,M,10-speed)
													sleep(20)
											else
												sleep(20)
										Say("Damned witches.")
										sleep(20)
										Emote("grinds his fist into one of his palms and swears loudly.")
										arouse = 0
										call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire",ICON_ADD)
										src.loc = locate(53,100,1)
										call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_ADD)
								else
									arouse = 0
									sleep(10)
							sleep(10)	//oview() << sound('./soul.wav',0,0,1,100)
						spawn(5)
							Look()
					if("Dymas")
						var/mob/Player/M
						while(src)
							if(demonquest)
								M = demonquest
								src.Say("Watch where you're firing!")
								src.Emote("growls.")
								while(M in oview(10))
									if(src.stun!=1)
										if(M in view(1))
											Fight(M)
										else
											var/obj/Ungetables/Throwable/Power/Energyball/e = new(src.loc)
											e.thereyet = M.loc
											e.movedby = src
											oview(M) << "\a [e] begans to form in [src]'s hand."
											oview(M) << "[src] throws \a [e]"
											walk_towards(e,e.thereyet,0)
											walk_to(src,M,10-speed)
											walk(src,0)
											sleep(50)
									else
										sleep(20)
								demonquest = null
							for(M in oview(10))
								if(M.class=="Telekinetic Witch" || M.class=="Molecular Witch" || M.class=="Premonition Witch" || M.class=="Telepathy Witch" || M.class == "Half Whitelighter" || M.name == "Demon" || M.class == "Astral Witch" || M.class == "Witch" || M.class == "Invisibility Witch")
									if(arouse == 0)
										//oview(src) << sequence[1]
										Emote("suddenly jumps and look around wildly.")
										sleep(30)
										Say("Drats!")
										sleep(10)
										arouse = 1
										walk_to(src,M,10-speed)
										while(M in oview(10))
											if(src.stun!=1)
												if(M in view(1))
													Fight(M)
												else
													walk(src,0)
													var/obj/Ungetables/Throwable/Power/Energyball/e = new(src.loc)
													e.thereyet = M.loc
													e.movedby = src
													oview(M) << "\a [e] begans to form in [M]'s hand."
													oview(M) << "[M] throws \a [e]"
													walk_towards(e,e.thereyet,0)
													walk_to(src,M,10-speed)
													sleep(20)
											else
												sleep(20)
										Say("Grrrrrrrrrrrrrrr.")
										sleep(20)
										arouse = 0
								else
									arouse = 0
									sleep(10)
							sleep(10)	//oview() << sound('./soul.wav',0,0,1,100)
						spawn(5)
							Look()
					else
						var/mob/Player/M
						while(src)
							if(M in oview(10))
								step_towards(src,M)
								sleep(10-speed)
								if(arouse == 0)
									oview(src) << sequence[1]
									oview(src) << sound('./soul.wav',0,0,1,100)
									arouse = 1
								if(M in view(1))
									Fight(M)
								//for(P in oview(1))
								//	break //spell sequence
							else
								oview() << sound('./soul.wav',0,0,1,100)
								arouse = 0
								step_rand(src)
								sleep(10)
								for(M in oview(7))
									break
						spawn(20)
							Look()

			proc/Fight(O)
				//attack?
				if(istype(O,/mob/Player/)&&src.stun!=1)
					var/mob/Player/M = O
					var/seq = rand(2,4)
					if(src.name=="Ghast"||src.name=="Zombie")
						oview() << sound('./soul.wav',0,0,1,100)
					oview(src) << sequence[seq]
					M.damagecounter -= damage
					call(/mob/Player/proc/Deathcheck)(M, src)
					sleep((10-speed)*10)
			Ghast
				speed = 4
				monster=1
				text="Monster"
				density = 1
				damage = 1
				class = "spirit"
				sequence = list("The spirit of a ghast stirs from its restless sleep, disturbed.","The ghast raises its formless claws, poised to strike.","Eyes glowing, the ghast pounces on its target.","With a deafening shriek, the ghast attacks.")
			Triad
				damagecounter2 = 10
				damagecounter = 15
				monster=1
				text="Monster"
				speed = 8
				density = 1
				damage = 5
				class = "Triad"
				sequence = list("","The Triad observes you quietly, waiting to make the next attack.","The triad moves swiftly across the floor.","\"You wish to challenge us?!\"")
			Zombie
				speed = 3
				density = 1
				text="Monster"
				monster=1
				damage = 5
				damagecounter = 1
				class = "undead"
				sequence = list("The undead craving for living flesh, begins to awaken from its slumber.","The zombie swings its lengthy arms.","The zombie grabs the nearest target and sinks its teeth into the victim.","The zombie moans.")
			Speed_Demon
				speed = 10
				text="Monster"
				density = 1
				monster=1
				damage = 1
				class = "demon"
				sequence = list("In a frenzy blur, the demon moves in swiftly to attack its victim.","Claws brandished, the demon impales his victim with the silvery metal, staining it blood red.","Something zoomed passed, and the next thing you know, a demon has his victim impaled with a deadly claw.","")
			NPCKelnerth
				damagecounter2 = 10
				damagecounter = 10
				monster=1
				text="Monster"
				speed = 8
				density = 1
				damage = 2
				class = "demon"
				sequence = list("","Kelnerth readies his fists, having caught sight of his prey.","Kelnerth pulls back his fists and drove them into his victim's face.","Kelnerth growls, cracking his knuckles as he prepares for the next attack.")
				verb
					Talk()
						set src in view(1)
						var/mob/Player/me = usr
						if(me.class == "Human")
							if(me.demonquest==0)
								if(!src.arouse)
									src.Say("Come closer [me], I have a very interesting proposal for you.")
									sleep(20)
								else
									Say("I'll be right back, [me]. I have things to settle.")
									return
								if(!src.arouse)
									src.Emote("glances around, checking that no one else is in the vicinity, before continuing.")
									sleep(50)
								else
									Say("I'll be right back, [me]. I have things to settle.")
									return
								if(!src.arouse)
									me << "<i>[src] whispers,\"You look tough, just the person I need. But you also look like you have some problems troubling you.\"</i>"
									sleep(50)
								else
									Say("I'll be right back, [me]. I have things to settle.")
									return
								if(!src.arouse)
									me << "<i>[src] whispers,\"I can turn you into a demon, powerful creatures like me with powers that can help them control their lives.\"</i>"
									sleep(50)
									src.Emote("grins, showing his yellowed teeth.")
									sleep(30)
								else
									Say("I'll be right back, [me]. I have things to settle.")
									return
								if(!src.arouse)
									me << "<i>[src] whispers,\"So what do you think? Is that a yes?\"</i>"
									var/choice = alert("Accept his offer?","Become a Demon","Yes","No")
									if(choice=="Yes")
										me.demonquest=2
										src.Emote("says to himself.")
										src.Say("Very good. Very good.")
									else
										me.demonquest=1
										src.Emote("growls, shoving you roughly a few feet away from him.")
										src.Say("Stupid human. You may refuse now, but sooner or later you will come crawling back for help.")
										me.control=1
										walk(me,SOUTH)
										sleep(5)
										walk(me,0)
										me.control=0
										return
								else
									Say("I'll be right back, [me]. I have things to settle.")
							if(me.demonquest==1)
								Emote("has a cocky look on his face. Apparently, he's been right about something.")
								sleep(40)
								Say("So you've came crawling back like I thought you would.")
								var/choice = alert("Accept his offer?","Become a Demon","Yes","No")
								if(choice=="Yes")
									me.demonquest=2
									src.Emote("smirks.")
									src.Say("Very good. Very good.")
								else
									me.demonquest=1
									src.Emote("growls, shoving you roughly a few feet away from him.")
									src.Say("Stupid human. You may refuse now, but sooner or later you will come crawling back for help.")
									me.control=1
									walk(me,SOUTH)
									sleep(20)
									walk(me,0)
									me.control=0
									return
							if(me.demonquest==2)
								src.Say("Now lets begin.")
								src.Emote("lowers his voice so no one else can hear him.")
								sleep(10)
								me << "<i>[src] whispers,\"You need to be as evil as you can get. Grab some athames from the store, and kill the innocents on the streets.\""
								sleep(40)
								if(!src.arouse)
									src.Emote("smirks.")
									me << "<i>[src] whispers,\"When you have -20 alignment or less, come back to me.\""
									sleep(40)
								else
									return
								if(me && src && me.alignment<=-20)
									src.Say("I see you've returned.")
									me << "<i>Objective completed.</i>"
									me.class = "Lower Demon"
									var/lighter = me.CheckUnlock(me.ckey, "Lower Demon")
									if(!lighter)
										me.Unlock(me.ckey,"Lower Demon")
										me << "Lower Demon unlocked."
									me.sighty = 1
									me.see_invisible = 1
									me.demonquest = 3
									Emote("waves a hand over [me].")
									me << "You feel partially stronger."
									sleep(30)
						if(me.demonquest==3)
							if(me && src && arouse == 0 && me.power < 15)
								me << "<i>[src] whispers,\"Before we continue any further, I want you to collect and absorb stray powers from the recently deceased.\"</i>"
								me << "<i>[src] whispers,\"You HAVE TO BE quick, or they will vanish after a while. Stronger beings like witches leaves behind more powers.\"</i>"
								sleep(50)
								me << "<i>[src] whispers,\"Once you get enough 15, I will trade it with you for <b>Energyball</b>.\"</i>"
								return
							if(me && src && arouse == 0 && me.power >= 15)
								src.Emote("nods, and without further time wasted, he grips [me] by the neck.")
								sleep(10)
								me << "At the same time, you feel a different form of power being transferred into you."
								sleep(10)
								src.Emote("lets go, [me] lands on the floor roughly.")
								me.energyball = 1
								me.verbs += /mob/Player/Powers/verb/Energyball
								me << "<i>You can now use Energyball.</i>"
								me.demonquest = 4
								me << "<i>[src] whispers,\"Anytime you want to drop by hell, talk to me. It'll require some fees though.\""
								me.power -= 15
								return
						if(me.demonquest == 4)
							if(me.power >= 10)
								var/i = alert("Kelnerth: Teleport to hell for 10 power?","CHARMED","Yes","No")
								if(i=="Yes")
									Emote("waves a hand over [me].")
									me.loc = locate(156,195,1)
									me.power -= 10

			NPCDymas
				damagecounter2 = 4
				damagecounter = 4
				speed = 5
				text="Monster"
				monster=1
				density = 1
				damage = 1
				class = "demon"
				sequence = list("Dymas summons an athame, ready for battle.","","Gripping the handle tight, Dymas thrusts the athame deep into his target.","Dymas growls, \"To hell with you!\"")
				verb
					Talk()
						set src in view(1)
						var/mob/Player/me = usr
						if(me.power >= 10)
							var/i = alert("Dymas: Teleport back to surface for 10 power?","CHARMED","Yes","No")
							if(i=="Yes")
								Emote("waves a hand over [me].")
								me.loc = locate(46,57,1)
								me.power -= 10
		NPCRena
			monster=1
			text="Monster"
			verb
				Job()
					set src in view(1)
					var/mob/Player/me = usr
					switch(me.job)
						if("Accountant")
							Say("You'll like to quit your job? People don't just join and quit like that. You'll have to pay 50 bucks to leave.")
							var/yesno = alert("Would you like to quit your job?","CHARMED","Quit","No, thanks.")
							if(yesno == "Quit")
								if(me.money>=50)
									me.money -= 50
									Say("Alright, I'll take 50 cash from you.")
									Emote("takes the money and keeps it inside a drawer.")
									me.job = null
									return
						if(null)
							Say("Would you like a job, [usr]?")
							Say("Accountancy is a rather boring job, I must say. But it puts money in your pockets.")
							var/yesno = alert("Take up the job as an accountant?","CHARMED","I'll take the job","No Thanks")
							if(yesno!="No Thanks")
								Say("You can start work immediately. Just copy some documents over there at the desks and I'll pay you for them.")
								me.job = "Accountant"
						else
							Say("Sorry, you already have a job, [usr].")
				Hand_In_Documents()
					set src in view(1)
					var/mob/Player/me = usr
					if(me.job != "Accountant")
						return
					var/have
					if(me.control==0)
						me.control = 1
						for(var/i=1;i<=length(me.contents);i++)
							var/obj/item = me.contents[i]
							if(istype(item,/obj/Getables/Documents/) && item.name=="Documents")
								have++
								spawn(5)
									del(item)
						if(have!=null)
							Say("Here's [have*5] bucks for your hardwork, [usr].")
							me.money += 5*have
						me.control = 0
		NPCBeatrice
			monster=1
			text="Monster"
			verb
				Request_to_become_Elder()
					set src in view(1)
					var/mob/Player/me = usr
					if(me.class=="Whitelighter")
						var/list/helpers = new()
						var/amountcollected = 0
						if(me.elderquest==null || me.elderquest == 0)
							usr << "Beatrice says,\"To become an Elder, you will need to depend heavily on your charges. Their combined good deeds must be equivalent to 1000, those would be taken from them to help you grow your new wings.\""
							var/yesno = alert("Will you want to apply?","CHARMED","Make me an Elder","No")
							if(yesno!="No")
								usr << "Beatrice says,\"Very well, I can see glow to help more innocents in you. I will now ask your charges for their opinions.\""
								for(var/mob/Player/charge in world)
									if(charge.whitelighter == me.origname)
										var/choice = alert("[usr] requires you to lend \him your good deeds to help \him become an Elder.","CHARMED","Yes, I will help him.","No")
										if(choice!="No")
											usr << "[charge] has agreed to help you out."
											helpers += charge
											amountcollected += charge.alignment
											usr << "You now have a total of: [amountcollected] alignment."
								usr << "Beatrice says,\"[amountcollected] is the collected good deeds from your witches.\""
								if(amountcollected>=1000)
									for(var/i=1;i<=length(helpers);i++)
										var/mob/Player/charge = helpers[i]
										charge.alignment = 0
										charge << "Your good deeds are now used to help [usr] become an Elder"
									me.elderquest = 1
						if(me.elderquest == 1)
							if(me.alignment<100)
								usr << "Beatrice says,\"You have come a long way as a whitelighter, but to become an Elder you still have more to learn.\""
								usr << "Beatrice says,\"Get more alignment before coming to find me.\""
								return
							usr << "Beatrice says,\"Meditation is important to maintain inner harmony, and is thus essential for an Elder to be in control of thyself.\""
							usr << "Beatrice says,\"Come back to me when you have find inner balance..\""
							if(me.meditate > 20)
								usr << "Beatrice says,\"Welcome to a higher level.\""
								me.rank = "<FONT COLOR=#ccffff>E</FONT><FONT COLOR=#b3ffff>l</FONT><FONT COLOR=#99ffff>d</FONT><FONT COLOR=#4dffff>e</FONT><FONT COLOR=#00ffff>r</FONT> "
								me.verbs += /mob/Player/Powers/verb/Lightning
								me << "<i>You can now use Lightning.</i>"
								me.elderquest = 2
								usr << "Beatrice says,\"Be aware, that an Elder should not commit any form of sins, or his elderly powers shall be stripped.\""
								sleep(20)
								me.verbs += /mob/Player/Powers/verb/Remote_Orb1
								me << "<i>You can now use Remote Orb.</i>"
								me.text = "Elder"



		NPCSteward
			monster=1
			text="Monster"
			verb
				Purchase_From_Store()
					set category = "Shop"
					set src = view(4)
					var/shop = {"
					<html>
					<head>
					<title>Wiccan Needs</title>
					<STYLE>
						BODY {background:#000000;color:white;}
						TABLE {background: black;color=white; size=1;}

						.:link {text-decoration: none; color: silver;}
						.:visited {text-decoration: none; color: silver;}
						.:hover {text-decoration: underline; color: white;}

						</STYLE>
					</head>
					<body bgcolor=black>
					<center>
					<u><b>Stuffs</b></u>
					<table border=1>
						<tr>
							<td>
								<a href=?Simple>Simple Athame</a>
							</td>
							<td>
								25
							</td>
						</tr>
						<tr>
							<td>
								<a href=?Paper>Paper</a>
							</td>
							<td>
								1
							</td>
						</tr>
						<tr>
							<td>
								<a href=?Candle>Candle</a>
							</td>
							<td>
								5
							</td>
						</tr>
						<tr>
							<td>
								<a href=?Book>Book</a>
							</td>
							<td>
								15
							</td>
						</tr>
						<tr>
							<td>
								<a href=?herb>Herbs</a>
							</td>
							<td>
								1
							</td>
						</tr>
						<tr>
							<td>
								<a href=?bottle>Empty Bottle</a>
							</td>
							<td>
								5
							</td>
						</tr>
						<tr>
							<td>
								<a href=?pot>Pot</a>
							</td>
							<td>
								15
							</td>
						</tr>
					</table>
					</center>
					</body>
					<a href=?Close>Close</a></html>
					"}
					usr << browse(shop, "window=name;display=1;clear=1; size=300x300;border=1;can_close=0; can_resize=1;can_minimize=1;titlebar=1")
		NPCAlexis
			text="Monster"
			verb
				Exchange_Powers()
					set category = "Shop"
					set src = view(4)
					var/shop = {"
					<html>
					<head>
					<title>Exchange Powers</title>
					<STYLE>
						BODY {background:#000000;color:white;}
						TABLE {background: black;color=white; size=1;}

						.:link {text-decoration: none; color: silver;}
						.:visited {text-decoration: none; color: silver;}
						.:hover {text-decoration: underline; color: white;}

						</STYLE>
					</head>
					<body bgcolor=black>
					<center>
					<u><b>Teleportation</b></u>
					<table border=1 width = 100%>
						<tr>
							<td>
							<b>Ability</b>
							</td>
							<td>
							<b>Power Required</b>
							</td>
						</tr>
						<tr>
							<td>
								<a href=?firemove1>Fire Move</a>
							</td>
							<td>
								100
							</td>
						</tr>
						<tr>
							<td>
								<a href=?firemove2>Shadowed Fire Move</a>
							</td>
							<td>
								100
							</td>
						</tr>
						<tr>
							<td>
								<a href=?shimmer>Shimmer</a>
							</td>
							<td>
								50
							</td>
						</tr>
					</table>

					<u><b>Abilities</b></u>
					<table border=1>
						<tr>
							<td>
								<a href=?Energyball>Energyball</a>
							</td>
							<td>
								10
							</td>
							<td>
								<a href=?Fireball>Fireball</a>
							</td>
							<td>
								45
							</td>
							<td>
								<a href=?tk>Telekinesis</a>
							</td>
							<td>
								100
							</td>
						</tr>
						<tr>
							<td>
								<a href=?Shapeshift>Shapeshift</a>
							</td>
							<td>
								80
							</td>
							<td>
								<a href=?Sense>Sense</a>
							</td>
							<td>
								30
							</td>
							<td>
								<a href=?glightning>Golden Lightning</a>
							</td>
							<td>
								200
							</td>
						</tr>
					</table>

					<u><b>Others</b></u>
					<table border=1>
						<tr>
							<td>
								<a href=?Health>Buy More Health</a>
							</td>
							<td>
								20 x Max Health
							</td>
							<td>
								<a href=?Healme>Heal Me</a>
							</td>
							<td>
								1 X MaxHealth
							</td>
						</tr>
					</table>

					</center>
					</body>
					<a href=?Close>Close</a></html>
					"}
					usr << browse(shop, "window=name;display=1;clear=1; size=300x300;border=1;can_close=0; can_resize=1;can_minimize=1;titlebar=1")

		Powers
			verb
				Invoke()
					set category = "Special"
					usr << "This verb is given only once. Once used, or if you log out, it is gone forever!"
					var/choice = input("You are given a choice to keep these temporary skills.","CHARMED",null) in list("Energy Waves","Cancel")
					switch(choice)
						if("Energy Waves")
							usr << "You are given Energy Waves to play with until you log out."
							verbs += /mob/Player/Powers/verb/Energy_Waves
							verbs -= /mob/Player/Powers/verb/Invoke
							Saveme()
				Meditate()
					set category = "Skills"
					var
						mind = rand(1,50)
						body = rand(1,500)
						spirit = rand(1,50)
					while(1)
						if((mind == body) && (body == spirit))
							usr << "You have acquire some inner peace."
							meditate++
							return
						var/choice = input("Inner Peace: [meditate]\nYou meditate, and try to acquire inner peace.\nHelp: Work on each of the following, and try to get them to the same level.\n\nMind : [mind]\nBody : [body]\nSpirit : [spirit]","CHARMED",null) in list("Mind","Body","Spirit","Cancel")
						if(choice!="Cancel")
							switch(choice)
								if("Mind")
									mind = rand(1,50)
								if("Body")
									body = rand(1,50)
								if("Spirit")
									spirit = rand(1,50)
						else
							return
				Cloaking()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1] <= 20)
						return
					stamina[1] -= 20
					if(inviso[4]==1)
						inviso[4] = 0
						if(inviso[1]<3)
							control = 0
						call(usr,/mob/Player/proc/Effects)("summon")
						usr << "Your cloaking fades, and you are now visible to anyone in sight."
						invisibility = 0
					else
						call(usr,/mob/Player/proc/Effects)("summon")
						usr << "You willed yourself to become invisible."
						inviso[4] = 1
						if(inviso[1]<3)
							control = 1 //you can't move with a weak invisibility
						var/i
						if(inviso[1]==0)
							i = 1
						else
							i = inviso[1]
						invisibility = i
						spawn(i*150)
							if(inviso[4]==1)
								inviso[4] = 0
								if(inviso[1]<3)
									control = 0
								call(usr,/mob/Player/proc/Effects)("summon")
								usr << "Your cloaking fades, and you are now visible to anyone in sight."
								invisibility = 0
				Ghostly_Touch()
					set category = "Skills"
					activepower = "inviso"
					usr << "You are now using Ghostly Touch."
					usr << "<i>Click on the target to make it disappear.</i>"
				Freestyle_Lightning()
					set category = "Skills"
					activepower = "lit"
					usr << "Your fingers tingle with static."
					usr << "<i>Click and drag around the place.</i>"
				Lightning()
					set category = "Skills"
					activepower = "lit2"
					usr << "Your fingers tingle with static."
					usr << "<i>Click on your target.</i>"
				Golden_Lightning()
					set category = "Skills"
					activepower = "lit3"
					usr << "Your fingers tingle with static."
					usr << "<i>Click on your target.</i>"
				Astral_Projection()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1)
						return
					if(astralbody!=null)
						src << "You feel yourself being pulled back into your body."
						src.client.perspective = MOB_PERSPECTIVE
						src.client.eye = src
						del(src.astralbody) //delete my body
						src.astralbody = null
						call(src,/mob/Player/proc/Fade)(src,60,30,30,3,0,0)
						return
					//make a new mob which i will be faking
					var/mob/Player/M = new()
					if(astralproj[1]>=5)
						var/list/targets = new()
						var/mob/Player/e
						for(e in world)
							targets += e
						e = input("Who to astral to?","CHARMED",null) in targets
						control = 1
						view() << sound('./sound/astral.wav',0,0,0,100)
						call(src,/mob/Player/proc/Fade)(usr,60,30,30,3,1,0)
						control = 0
						Setme()
						M.loc = e.loc
					else
						control = 1
						view() << sound('./sound/astral.wav',0,0,0,100)
						call(src,/mob/Player/proc/Fade)(usr,60,30,30,3,1,0)
						control = 0
						Setme()
						M.loc = loc
					M.tehrgb[1] = tehrgb[1]
					M.tehrgb[2] = tehrgb[2]
					M.tehrgb[3] = tehrgb[3]
					M.tehrgb[4] = tehrgb[4]
					M.tehrgb[5] = tehrgb[5]
					M.tehrgb[6] = tehrgb[6]
					M.skin = skin
					M.hair = hair
					M.name = name
					M.gender = gender
					M.Setme()
					call(M,/mob/Player/proc/Fade)(M,60,30,30,3,0,0)
					//done, change perspective
					client.perspective = EYE_PERSPECTIVE
					client.eye = M
					//my astral body is M
					astralbody = M
					//he is astral, can't get hurt!
					M.astralbody = "Me"
					M.density = 0
					Astral() //i call astral proc
				Energy_Waves(msg as text)
					set category = "Skills"
					Shout(uppertext(msg))
					view() << sound('./sound/energy.wav',0,1,3,100)
					call(usr,/mob/Player/proc/Fade)(usr,50,30,20,5,0,0)
					for(var/atom/a in oview(5))
						if(istype(a,/obj/) || istype(a,/mob/))
							if(istype(a,/obj/))
								var/obj/o = a
								o.icon += rgb (40,20,10)
								spawn(50)
									del(a)
							else
								var/mob/Player/M = a
								M.control = 1
								spawn()
									call(M,/mob/Player/proc/Fade)(M,50,30,20,5,0,0,"fire",ICON_AND)
									M << "You feel lava-hot energy waves wash over you as you are incinerated from this world."
									spawn(30)
										del(a)
						walk_away(a,usr,5,0)
						spawn(30)
						walk(a,0)
					call(usr,/mob/Player/proc/Fade)(usr,50,30,20,5,1,0)
					sleep(5)
					Setme()
				Molecular_Combustion()
					set category = "Skills"
					activepower = "blowup"
					usr << "A feel a slow growing anger inside you, as you prepare to use blow up."
				Glamour()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1] <= 20)
						return
					stamina[1] -= 20
					var/list/target = new()
					var/mob/Player/m
					for(m in world)
						target+=m
					target += "Cancel"
					m = input("Who do you wish to glamour into?","CHARMED",null) in target
					if(m!="Cancel")
						if(!m)
							return
						usr << "With a snap of a finger, you transform in [m]."
						view() << sound('./sound/snap.wav',0,1,3,100)
						spawn()
							call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"glamor",ICON_OR)
						spawn(6)
							name = m.name
							gender = m.gender
							tehrgb[1] = m.tehrgb[1]
							tehrgb[2] = m.tehrgb[2]
							tehrgb[3] = m.tehrgb[3]
							tehrgb[4] = m.tehrgb[4]
							tehrgb[5] = m.tehrgb[5]
							tehrgb[6] = m.tehrgb[6]
							hair = m.hair
							skin = m.skin
							Setme()
				Revert_Whitelighter()
					set name = "Revert"
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1  || astralbody)
						return
					if(stamina[1] <= 20)
						return
					stamina[1] -= 20
					spawn()
						view() << sound('./sound/snap.wav',0,1,3,100)
						call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"glamor",ICON_OR)
					spawn(6)
						Revert()
						Setme()

				Shapeshift()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1] <= 20)
						return
					stamina[1] -= 20
					var/list/target = new()
					var/mob/Player/m
					for(m in world)
						target+=m
					target += "Cancel"
					m = input("Who do you wish to shapeshift into?","CHARMED",null) in target
					if(m!="Cancel")
						if(!m)
							return
						usr << "With a single thought, your body morphs into [m]."
						spawn()
							call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_OR)
						spawn(6)
							name = m.name
							gender = m.gender
							tehrgb[1] = m.tehrgb[1]
							tehrgb[2] = m.tehrgb[2]
							tehrgb[3] = m.tehrgb[3]
							tehrgb[4] = m.tehrgb[4]
							tehrgb[5] = m.tehrgb[5]
							tehrgb[6] = m.tehrgb[6]
							hair = m.hair
							skin = m.skin
							Setme()


				Revert_Demon()
					set name = "Revert"
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1  || astralbody)
						return
					if(stamina[1] <= 20)
						return
					stamina[1] -= 20
					spawn()
						call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_OR)
					spawn(6)
						Revert()
						Setme()
						density = 1
						invisibility = 0
				Torch()
					set category = "Skills"
					activepower = "Torch"
					usr << "You prepare to set something ablaze."
				Scarring()
					set category = "Skills"
					activepower = "Scarring"
					usr << "You prepare to channel enormous amounts of heat energy."
				Firewall()
					set category = "Skills"
					activepower = "flame barrier"
					usr << "A slow burning begins inside you as you harness its energy."
				Burn()
					set category = "Skills"
					activepower = "Burn"
					oview(usr) << "You can see the fire in [usr]'s eyes..."
					usr << "Your whole body feels warm, anticipating the damage it's about to deal."
				Energyball()
					set category = "Skills"
					activepower = "Energyball"
					usr << "Your fingers tingle, as energy flows into them."
				Whitelighter_Energyball()
					set category = "Skills"
					activepower = "WEnergyball"
					usr << "Your fingers tingle, as energy flows into them."
				Fireball()
					set category = "Skills"
					activepower = "Fireball"
					usr << "Your fingers burns, ready to toss a fireball at someone."
				Touch_of_Death()
					set category = "Skills"
					activepower = "Touch"
					usr << "Dark energies pour into your fingers, ready to maim the next person you touch."
				Conjure_Crossbow()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1  || astralbody)
						return
					if(stamina[1] <= 50)
						return
					stamina[1] -= 50
					var/obj/Getables/Weapon/Crossbow/o = new(usr)
					o.owner = origname
					o.name = "[origname]'s " + o.name
					view() << "Wisps of smoke encircles [usr]'s hands, taking the shape of a crossbow."
					o.amount = telepathy[1]
				Electro_Mental_Ignitions()
					set category = "Skills"
					activepower = "Mental"
					usr << "Your hands tingle with electricity, ready to give someone a good mental shocking,"
				Telekinetic_Orbing()
					set category = "Skills"
					activepower = "tkorb"
					usr << "You are now using Telekinetic Orbing."
				Telekinetic_Orb_Return()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1  || astralbody)
						return
					if(stamina[1] <= 20)
						return
					stamina[1] -= 20
					for(var/obj/o in oview())
						if(o.movedby!=null)
							//return it
							var/mob/target = o.movedby
							o.thereyet = target
							walk_towards(o,target,10-o.speed)
							o.movedby = usr

							oview(usr) << "[usr] says, \"[o]!\""
							usr << "You say, \"[o]!\""

							var/icon/origic = o.icon
							view() << sound('./sound/orb2.wav',0,0,1,100)
							for(var/i=0;i<5;i++)
								o.icon += rgb (20,20,40)
								sleep(1)

							for(var/i=0;i<5;i++)
								var/icon/look = new(origic)
								switch(i)
									if(1)
										look.Blend('./smallorb/orb1.dmi',ICON_AND)
									if(2)
										look.Blend('./smallorb/orb2.dmi',ICON_AND)
									if(3)
										look.Blend('./smallorb/orb3.dmi',ICON_AND)
									if(4)
										look.Blend('./smallorb/orb4.dmi',ICON_AND)
								o.icon = look
								sleep(1)
								del(look)
							for(var/i=0;i<5;i++)
								var/icon/look = new(origic)
								switch(i)
									if(1)
										look.Blend('./smallorb/orb4.dmi',ICON_AND)
									if(2)
										look.Blend('./smallorb/orb3.dmi',ICON_AND)
									if(3)
										look.Blend('./smallorb/orb2.dmi',ICON_AND)
									if(4)
										look.Blend('./smallorb/orb1.dmi',ICON_AND)
								o.icon = look
								sleep(1)
								del(look)

							o.icon = origic
				Conjure_Bolts()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1] <= 50)
						return
					stamina[1] -= 50
					var/list/con = contents
					usr << "[usr] conjures up a bundle of bolts."
					var/obj/Getables/Bolt/o = new(usr)
					if(!con.Find("Bolts"))
						o.amount = 10
						o.owner = usr
						o.suffix = "[o.amount]"
					else
						o.amount += 10
						o.suffix = "[o.amount]"
				Suicide_Thoughts()
					set category = "Skills"
					activepower = "Suicide"
					usr << "You prepare your mind to implant thoughts of suicide into a victim..."
				Whitelighter_Chat(msg as text)
					set category = "Skills"
					if(mute==1)
						usr << REDCHARM+" You are muted."
						return
					if(length(msg) == 0 )
						return
					if(length(msg) > 255)
						usr << REDCHARM+" <b>Your message is too long.</b>"
						return
					for(var/mob/Player/M in world)
						if(M.client && M.class=="Whitelighter")
							M << "<b>Whitelighter Chat</b>: <img src=\ref[myicon] height=32 width=32 align=left> <b>[origname]</b> says,\"[msg]\""
					Memory(usr,"[msg]")
				Forced_Thoughts(msg as text)
					set category = "Skills"
					Memory(usr,"Trying to alter thoughts.")
					var/list/tars = new()
					tars += "Yourself"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1] >= 25)
						stamina[1] -= 25
					else
						return
					if(length(msg)<=(telepathy[1]*10))
						for(var/mob/Player/target in world)
							if(target.client && target!= usr)
								tars += target
						tars += "Cancel"
						var/choice = input("Who do you want to implant fake thoughts in?","Telepathy",null) in tars
						if(choice=="Yourself")
							usr << "<i>You think hard on the image you want to implant in your mind.<br>[msg]</i>"
							Memory(usr,"[msg]")
						if(choice!="Cancel")
							Memory(choice,"[msg]")
					else
						usr << "There's a limit to how much thoughts you can implant into the victim."
				Telepathy()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					Memory(usr,"Mentally connecting with someone.")
					if(!connect)
						var/list/tars = new()
						for(var/mob/Player/target in world)
							if(target.client && target!= usr)
								tars += target
						tars += "Cancel"
						var/choice = input("Who do you want to establish mental connection with?","Telepathy",null) in tars
						var/mob/Player/c = choice
						if(c)
							c.connect = usr
							connect = c
							Sap(usr)
					else
						var/mob/Player/c = connect
						c.connect = null
						connect = null
				Sense_Charges()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(sense == 0)
						Memory(usr,"A feeling of vastness.")
						client.eye = null
						control = 1
						sense=1
						for(var/mob/Player/target in world)
							if(sense==0)
								break
							var/tx
							var/ty
							var/loci
							var/locii
							if(target && target.whitelighter == origname)
								sleep(rand(0,20))
								tx = target.x - usr.x //+ve = east -ve = west
								ty = target.y - usr.y // +ve = north -ve = south
								if(tx>0) //east
									loci = ""
									if(tx>5)
										loci = "near the East"
									if(tx>20)
										loci = "slightly further East"
									if(tx>50)
										loci = "far East"
								else
									if(tx<=0) //west
										loci = ""
										if(tx<-5)
											loci = "near the West"
										if(tx<-20)
											loci = "slightly further West"
										if(tx<-50)
											loci = "far West"
								if(ty>0) //north
									locii = "somewhere around here"
									if(ty>5)
										locii = "a bit North from here"
									if(ty>20)
										locii = "lingering somewhere further North"
									if(ty>50)
										locii = "near the North border"
								else
									if(ty<=0)
										locii = "somewhere around here"
										if(ty<-5) //south
											locii = "a bit South from here"
										if(ty<-20)
											locii = "lingering somewhere further South"
										if(ty<-50)
											locii = "near the South border"
								if(target.location!=location)
									locii = ""
									loci = target.location
								if(target!=usr)
									usr << "<i>You sense [target] [locii] [loci].</i>"
						client.eye = usr
						control = 0
						sense = 0
					else
						client.eye = null
						control = 1
						sense = 0
				Tracking()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(sense == 0)
						Memory(usr,"Seeking out the forces of good.")
						client.eye = null
						control = 1
						sense=1
						for(var/mob/Player/target in world)
							if(sense==0)
								break
							var/tx
							var/ty
							var/loci
							var/locii
							if(target && target.class == "Whitelighter")
								sleep(rand(0,20))
								tx = target.x - usr.x //+ve = east -ve = west
								ty = target.y - usr.y // +ve = north -ve = south
								if(tx>0) //east
									loci = ""
									if(tx>5)
										loci = "near the East"
									if(tx>20)
										loci = "slightly further East"
									if(tx>50)
										loci = "far East"
								else
									if(tx<=0) //west
										loci = ""
										if(tx<-5)
											loci = "near the West"
										if(tx<-20)
											loci = "slightly further West"
										if(tx<-50)
											loci = "far West"
								if(ty>0) //north
									locii = "somewhere around here"
									if(ty>5)
										locii = "a bit North from here"
									if(ty>20)
										locii = "lingering somewhere further North"
									if(ty>50)
										locii = "near the North border"
								else
									if(ty<=0)
										locii = "somewhere around here"
										if(ty<-5) //south
											locii = "a bit South from here"
										if(ty<-20)
											locii = "lingering somewhere further South"
										if(ty<-50)
											locii = "near the South border"
								if(target.location!=location)
									locii = ""
									loci = target.location
								if(target!=usr)
									usr << "<i>You sense [target] [locii] [loci].</i>"
						client.eye = usr
						control = 0
						sense = 0
					else
						client.eye = null
						control = 1
						sense = 0
				Sense()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(sense == 0 && orb == 0)
						Memory(usr,"A feeling of vastness.")
						client.eye = null
						control = 1
						sense=1
						for(var/mob/Player/target in world)
							if(sense==0)
								break
							sleep(rand(0,10))
							var/tx
							var/ty
							var/loci
							var/locii
							var/align
							if(target)
								tx = target.x - usr.x //+ve = east -ve = west
								ty = target.y - usr.y // +ve = north -ve = south
								if(tx>0) //east
									loci = ""
									if(tx>5)
										loci = "near the East"
									if(tx>20)
										loci = "slightly further East"
									if(tx>50)
										loci = "far East"
								else
									if(tx<=0) //west
										loci = ""
										if(tx<-5)
											loci = "near the West"
										if(tx<-20)
											loci = "slightly further West"
										if(tx<-50)
											loci = "far West"
								if(ty>0) //north
									locii = "somewhere around here"
									if(ty>5)
										locii = "a bit North from here"
									if(ty>20)
										locii = "lingering somewhere further North"
									if(ty>50)
										locii = "near the North border"
								else
									if(ty<=0)
										locii = "somewhere around here"
										if(ty<-5) //south
											locii = "a bit South from here"
										if(ty<-20)
											locii = "lingering somewhere further South"
										if(ty<-50)
											locii = "near the South border"
								if(target.location!=location)
									loci = ""
									locii = target.location
								if(target.alignment>=50)
									align = " good "
								if(target.alignment<=-50)
									align = " evil "
								if(target.alignment<50 && target.alignment>-50)
									align = " "
								if(target!=usr)
									usr << "<i>You sense a[align][target.gender] [target.class] [locii] [loci].</i>"
						client.eye = usr
						control = 0
						sense = 0
					else
						client.eye = null
						control = 1
						sense = 0
				Charge()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					var/list/l = new()
					var/mob/Player/m
					for(m in oview())
						if(m.client)
							l += m
					l += "Cancel"
					var/inp = input("Who do you want as your charge?","Whitelighter",null) in l
					if(inp!="Cancel")
						m = inp
						if(m && m.alignment>=0)
							if(m.class!="Warlock" && m.class!="Lower Demon" && m.class!="Demon" && m.class != "Darklighter" && m.class != "Whitelighter" && m.class != "Human")
								var/yesno = alert(m,"[usr] has offered to become your whitelighter.","CHARMED","Accept","Reject")
								if(yesno == "Accept")
									if(m.whitelighter)
										m << "[m.whitelighter] is not your whitelighter anymore."
									m << "You have agreed to let [usr] become your whitelighter."
									usr << "You have acquired a new charge, [m]!"
									var/mob/Player/me = usr
									m.whitelighter = me.origname
								else
									m << "You rejected the offer."
									usr << "Your offer has been rejected."
									Memory(usr,"Accepting a new charge.")
						else
							usr << "[inp] does not fulfil the requirements to have a whitelighter."
				Heal()
					set category = "Skills"
					activepower = "Heal"
					usr << "Warmth spreads into your hands as you prepare to heal the wounded."
					Memory(usr,"A rush of loving energy.")
				Invite_into_Orb()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(orber==0)
						verbs += /mob/Player/Powers/verb/Join_Orb
						oview(1) << "[usr] is now inviting people to join his orb."
						usr << "You're now inviting people to join you."
						orber = 1
					else
						verbs -= /mob/Player/Powers/verb/Join_Orb
						usr << "You stop inviting people."
						orber = 0
				Join_Orb()
					set category = "Skills"
					set src in oview(1)
					var/mob/Player/me = usr
					me.orb = 1
					src << "[usr] is now joining your orb."
					usr << "You joined [src]'s orb."
				Up_There()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(sense == 0 && orb == 0)
						control = 1
						orb = 1
						var/list/pass = new()
						var/mob/Player/targets
						if(class == "Whitelighter")
							spawn()
								call(usr,/mob/Player/proc/Effects)("Orb2")
							sleep(1)
							for(targets in oview(1))
								if(targets.orb == 1)
									spawn()
										call(targets,/mob/Player/proc/Effects)("Orb2")
										pass += targets
										targets.control = 1
						sleep(15)
						usr.loc = locate(/turf/floor/orber)
						usr.overlays = null
						for(var/i=1;i<=length(pass);i++)
							targets = pass[i]
							targets.loc = locate(/turf/floor/orber)
							targets.overlays = null
						if(class == "Whitelighter")
							spawn()
								call(usr,/mob/Player/proc/Effects)("Orb")
								control = 0
								location = "Up There"
								orb = 0
							sleep(1)
							for(var/i=1;i<=length(pass);i++)
								spawn()
									call(targets,/mob/Player/proc/Effects)("Orb")
									targets.control = 0
									targets.orb = 0
									location = "Up There"
				Orb()
					set category = "Skills"
					if(stun==1 || death == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					if(class=="Whitelighter"||class=="Darklighter"||(class=="Half Whitelighter"&&telekinesis[1]>=3))
						if(sense == 0 && orb == 0)
							control=1
							orb = 1
							sense = 1
							if(class=="Whitelighter"||class=="Half Whitelighter")
								call(usr,/mob/Player/proc/Effects)("Orb2")
							else
								call(usr,/mob/Player/proc/Effects)("darkorb2")
							invisibility = 101
							density = 0
							control=0
							sleep(20)
							sense = 0
						else
							if(sense == 0 && orb == 1)
								var/turf/v = usr.loc
								if(v.density != 1)
									orb = 0
									sense = 1
									control=1
									if(class=="Whitelighter"||class=="Half Whitelighter")
										call(usr,/mob/Player/proc/Effects)("Orb")
									else
										call(usr,/mob/Player/proc/Effects)("darkorb")
									density = 1
									control=0
									sleep(20)
									sense = 0
								else
									usr << "You cannot materialize here."
					else
						if(sense == 0 && orb == 0)
							control=1
							orb = 1
							sense = 1
							call(usr,/mob/Player/proc/Effects)("Orb2")
							invisibility = 101
							density = 0
							control=0
							sleep(telekinesis[1]*5)
							orb = 0
							sense = 1
							control=1
							call(usr,/mob/Player/proc/Effects)("Orb")
							density = 1
							control=0
							sleep(20)
							sense = 0
				Blink()
					set category = "Skills"
					if(stun==1 || death == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					if(sense == 0 && orb == 0)
						control=1
						orb = 1
						sense = 1

						view() << './sound/blink.wav'
						invisibility = 100
						density = 0
						control=0
						sleep(5)
						sense = 0
					else
						if(sense == 0 && orb == 1)
							var/turf/v = usr.loc
							if(v.density != 1)
								orb = 0
								sense = 1
								control=1
								invisibility = 0
								view() << './sound/blink.wav'
								density = 1
								control=0
								sleep(5)
								sense = 0
							else
								usr << "That's not very sensible."
				Fire_Move()
					set category = "Skills"
					if(stun==1 || death == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					if(sense == 0 && orb == 0)
						control=1
						orb = 1
						sense = 1
						if(firemove==1)
							call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire",ICON_ADD)
						if(firemove==2)
							call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire",ICON_MULTIPLY)
						density = 0
						control=0
						sleep(20)
						sense = 0
					else
						if(sense == 0 && orb == 1)
							var/turf/v = usr.loc
							if(v.density != 1)
								orb = 0
								sense = 1
								control=1
								if(firemove==1)
									call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_ADD)
								if(firemove==2)
									call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_MULTIPLY)
								density = 1
								control=0
								sleep(20)
								sense = 0
							else
								usr << "There is something there that prevents you from materializing."
				Shimmer()
					set category = "Skills"
					if(stun==1 || death == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					if(sense == 0 && orb == 0)
						control=1
						orb = 1
						sense = 1
						call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"shimmer",ICON_ADD)
						density = 0
						control=0
						sleep(20)
						sense = 0
					else
						if(sense == 0 && orb == 1)
							var/turf/v = usr.loc
							if(v.density != 1)
								orb = 0
								sense = 1
								control=1
								call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"shimmer2",ICON_ADD)
								density = 1
								control=0
								sleep(20)
								sense = 0
							else
								usr << "That's not very sensible."
				Remote_Orb1()
					set category="Skills"
					set name = "Remote Orb"
					set desc="Teleport Self or Other to Target"
					var/mob/WH
					var/YN
					var/XT=alert("Select Who to Orb, then Who to Orb that person to. You cannot Orb any Monsters or NPC's, however you can orb someone to them.","Remote Orbing","Ok")
					var/mob/Targ
					if(XT=="Ok")
						WH=input("Whom Do You Wish To Orb?")as mob in world
						Targ=input("Whom do you wish to Orb [WH] to?")as mob in world
						YN=alert({"Confirm your Decision
		 Teleport: [WH]
		 Target: [Targ]"},"Correct?","Yes","No")
					if(XT=="")
						Targ=input("Whom do you wish to Orb to?")as mob in world
						WH=usr
						YN=alert({"Is This Correct?
		 Teleport: [XT]
		 Target [Targ]"},"Correct?","Yes","No","Cancel")
					if(YN=="No")
						return
					if(YN=="Cancel")
						return
					if(WH.text=="Monster")
						usr<<"You cannot orb [WH]"
						return
					else
						call(WH,/mob/Player/proc/Effects)("Orb2")
						WH.invisibility = 101
						sleep(10)
						WH.loc=locate(Targ.x,Targ.y-1,Targ.z)
						call(WH,/mob/Player/proc/Effects)("Orb")
						WH.invisibility = 0
						usr<<"<b>Done.</b>"
						WH << "<IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='whitecharm'> <b>Elder [usr]</b> remote orbed you to <b>[Targ]</b>"
				Remote_Orb2()
					set category="Skills"
					set name = "RemoteOrb"
					set desc="Teleport Self or Other to Target"
					var/mob/WH
					var/YN
					var/XT=alert("Select Who to Orb, then Who to Orb that person to. You cannot Orb any Monsters or NPC's, however you can orb someone to them.","Remote Orbing","Ok")
					var/mob/Targ
					if(XT=="Ok")
						WH=input("Whom Do You Wish To Orb?")as mob in world
						Targ=input("Whom do you wish to Orb [WH] to?")as mob in world
						YN=alert({"Confirm your Decision
		 Teleport: [WH]
		 Target: [Targ]"},"Correct?","Yes","No")
					if(XT=="")
						Targ=input("Whom do you wish to Orb to?")as mob in world
						WH=usr
						YN=alert({"Is This Correct?
		 Teleport: [XT]
		 Target [Targ]"},"Correct?","Yes","No","Cancel")
					if(YN=="No")
						return
					if(YN=="Cancel")
						return
					if(WH.text=="Monster")
						usr<<"You cannot orb [WH]"
						return
					if(Targ.name=="Beatrice")
						usr<<"You cannot Orb anyone into Heaven."
						return
					if(WH.text=="Elder")
						usr<<"You cannot orb Elders."
						WH<<REDCHARM+"<b>[class]: [usr]</b> tried to Remote Orb you to [Targ], but your Divine Elder Magic repelled the demonic orb."
						return
					if(Targ.text=="Elder")
						usr<<"You cannot teleport anyone to Elders. Their power is too Divine."
						Targ<<REDCHARM+"<b>[class]: [usr]</b> tried to Remote Orb [WH] to you, but your Divine Elder Magic repelled the demonic orb."
						return
					if(Targ.text=="Whitelighter")
						usr<<"You cannot teleport anyone to Whitelighters. Their power is too Divine."
						Targ<<REDCHARM+"<b>[class]: [usr]</b> tried to Remote Orb [WH] to you, but your Divine Whitelighter Magic repelled the demonic orb."
						return
					else
						call(WH,/mob/Player/proc/Effects)("darkorb2")
						WH.invisibility = 101
						sleep(10)
						WH.loc=locate(Targ.x,Targ.y-1,Targ.z)
						call(WH,/mob/Player/proc/Effects)("darkorb")
						WH.invisibility = 0
						usr<<"<b>Done.</b>"
						WH << "<IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='whitecharm'> <b>Darklighter [usr]</b> remote orbed you to <b>[Targ]</b>"

				Orb_Around()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					density = 1
					if(orb==0 && sense==0)
						orb=1
						activepower = "Orbing"
						client.perspective = EYE_PERSPECTIVE
						client.eye = locate(/obj/misc/map)
						control = 1


				Orb_Summon(mob/m in world)
					set category="Skills"
					if(!m.key)
						usr<<REDCHARM+"You can't summon NPC's."
						return
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<50)
						return
					stamina[1] -= 50
					density = 1
					var/c = alert("Summon [m]?","Charmed Whitelighter","Summon","Cancel")
					if(c=="Summon")
							//if(m.client)
						usr<<" Requesting Permission from <b>[m]</b>."
						var/a = alert(m,"A Whitelighter called [usr] is trying to summon you. Do you want to be whisked away?","Charmed Whitelighter :: [usr] ","Yes","No")
						if(a=="Yes")
							call(m,/mob/Player/proc/Effects)("Orb2")
							m.loc = locate(usr.x,usr.y-1,usr.z)
							m << "You have been summoned by [usr]."
							view() << sound('./sound/orb2.wav',0,0,1,100)
							call(m,/mob/Player/proc/Effects)("Orb")
						if(a=="No")
							usr<<REDCHARM+ "<b>[m] does not wish to be summoned."
					if(c=="Cancel")
						return
				Fire_Move_Around()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					density = 1
					if(orb==0 && sense==0)
						orb=1
						activepower = "Firemoving"
						client.perspective = EYE_PERSPECTIVE
						client.eye = locate(/obj/misc/map)

						control = 1
				Shimmer_Around()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					density = 1
					if(orb==0 && sense==0)
						orb=1
						activepower = "Shimmer"
						client.perspective = EYE_PERSPECTIVE
						client.eye = locate(/obj/misc/map)
						control = 1
					/*set category = "Whitelighter"
					if(orb==0)
						orb = 1
						invisibility = 0

						control=1
						spawn()
							usr << sound('./sound/orb2.wav',0,0,1,100)
							Fade(usr,20,20,40,10,1)
						spawn(5)
							Effects("Orb")
						sleep(7)
						invisibility = 101
						overlays = null
						sleep(10)
						var/turf/o = locate(/obj/misc/map)
						usr.loc = locate(o.x,o.y,o.z)
						location = "nowhere"
						Memory(usr,"Orbing.")*/
				Seize()
					if(seize == null)
						seize = 1
						usr << "When you teleport now, the people around you will be sucked into it as well."
					else
						seize = null
						usr << "You will now teleport solo."
				Blink_Around()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<25)
						return
					stamina[1] -= 25
					density = 1
					if(orb==0 && sense==0)
						activepower = "Orbing"
						orb=1
						client.perspective = EYE_PERSPECTIVE
						client.eye = locate(/obj/misc/map)
						control = 1
				Read_Mind()
					set category = "Skills"
					activepower = "Read Mind"
					usr << "You are now Reading Minds."
				Clear_Thoughts()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					usr << "You empty your thoughts."
					for(var/i=1;i<=10;i++)
						memory[i] = "Nothing"
				Mass_Read()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					var/mob/Player/target
					var/readlevel
					usr << "You focus intently into reading those around you."
					Memory(usr,"Reading a massive amount of thoughts.")
					telepathy[4] = 1
					sleep((10-telepathy[1]))
					telepathy[4] = 0
					for(target in oview())
						if(istype(target,/mob/Player))
							readlevel = rand(1,telepathy[1]*2)
							if(stamina[1]<10)
								return
							stamina[1]-=10
							if(target!=null)
								usr << "[target] is thinking: <i>[target.memory[readlevel]]</i>."
								if(target.client && target.telepathy[1]>3)
									target << "You feel someone probing into your mind."
								if(target.class == "Warlock")
									target << "You copied [usr]'s ability to Read Minds."
									target.verbs += /mob/Player/Powers/verb/Read_Mind
				Premonition()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(premonition[4]==0)
						premonition[4] = 1
						usr << "You closed your mind to all premonitions."
					else
						premonition[4] = 0
						usr << "You free your mind of all troubles, allowing yourself to have premonitions."
				Interrupt_Premonition()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<=0)
						usr << "You don't have enough mental power to do that."
						return
					stamina[1]--
					if(client.eye!=usr)
						control = 0
						usr << "You pull yourself together and broke out of the premonition."
						client.eye = usr
						usr.client.perspective = MOB_PERSPECTIVE
				Force_Premonition()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<=10)
						usr << "You don't have enough mental power to do that."
						return
					stamina[1]-=10
					var/list/objects = new()
					objects = contents.Copy()
					objects += "Cancel"
					objects = input("What item will you like to force premonition on?","Premonition",null) in  objects
					if(objects!="Cancel")
						var/obj/o = objects
						usr << "You empty your mind of all distractions, holding on to \the [o] as you seek out the owner."
						var/random = (10-premonition[1]) * rand(10,20)
						client.perspective = EYE_PERSPECTIVE
						client.eye = null
						control = 1
						sleep(random)
						var/success = null
						for(var/mob/Player/Play in world)
							if(Play.name == o.owner)
								success = Play
						if(success!=null && success!=usr)
							client.perspective = EYE_PERSPECTIVE
							client.eye = success
							usr << "You gasps as a vision suddenly hits you."
							oview(usr) << "[usr] gasps as a vision hits \him."
							sleep(premonition[1]*10)
							client.eye = usr
							usr.client.perspective = MOB_PERSPECTIVE
							control = 0
						else
							usr << "Try as you might, your power fails you."
							client.eye = usr
							usr.client.perspective = MOB_PERSPECTIVE
							control = 0
				Empathy()
					set category = "Skills"
					for(var/mob/Player/m in oview())
						//if(m.emotion)
						//	usr << "You sense [m] feeling [emotion]."

						usr<<"You tap into your empathic abilities, and sense the alignments of those around you."
						sleep(15)
						usr<<"<b>Name:</b> [m]  <B>Alignment:</b> [m.alignment]"
				Temporal_Stasis()
					set category = "Skills"
					activepower = "Temporal Stasis"
					usr << "You are now using [activepower]."
				Temporal_Stasis_One()
					set category = "Skills"
					set name = "Temporal Stasis (Individual)"
					activepower = "Temporal Stasis (Individual)"
					usr << "You are now using [activepower]."
				Telekinesis()
					set category = "Skills"
					activepower = "Telekinesis"
					usr << "You are now using [activepower]."
					screen_loc ="1:1 to 11:11"
				Telekinetic_Repel()
					set category = "Skills"
					activepower = "Telekinetic Repel"
					usr << "You are now using [activepower]."
				Telekinetic_Towards()
					set category = "Skills"
					activepower = "Telekinetic Towards"
					usr << "You are now using [activepower]."
				Levitate()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<=100)
						return
					stamina[1] -= 100
					if(density==1)
						call(usr, /mob/Player/proc/Effects)("float")
						density=0
						usr<<"You begin to hover above the ground."
					else
						if(density==0)
							usr<<"You land gently on your feet."
							density=1

				Summon_Athame()
					set category = "Skills"
					if(stun==1 || death == 1 || orb == 1 || astralbody)
						return
					if(stamina[1]<=125)
						return
					stamina[1] -= 125
					var/list/athames = new()
					if(summonathame[1] >= 1)
						athames += "Simple Athame"
					if(summonathame[1] >= 2)
						athames += "Silver Athame"
					if(summonathame[1] >= 4)
						athames += "Golden Athame"
					athames += "Cancel"
					var/athame = input("Which athame to summon?","Summon Athame", null) in athames
					switch(athame)
						if("Simple Athame")
							var/obj/Getables/Throwable/Athames/Simple_Athame/o = new(usr)
							o.owner = origname
							o.name = "[origname]'s " + o.name
						if("Silver Athame")
							var/obj/Getables/Throwable/Athames/Silver_Athame/o = new(usr)
							o.owner = origname
							o.name = "[origname]'s " + o.name
						if("Golden Athame")
							var/obj/Getables/Throwable/Athames/Golden_Athame/o = new(usr)
							o.owner = origname
							o.name = "[origname]'s " + o.name
						else
							return
					usr << "You summoned \a [athame]."
		Builder
			verb
				Build_Turf()
					set category = "Build"
					var/choice = input("What kind of turf do you wish to build?","CHARMED ONLINE",null) in typesof(/turf/floor/)
					if(usr.z != 2)
						usr << "You can't build here."
						return
					new choice(loc)
				Build_Rooms()
					set category = "Build"
					var/choice = input("What kind of object do you wish to build?","CHARMED ONLINE",null) in typesof(/turf/inner/)
					if(usr.z != 2)
						usr << "You can't build here."
						return
					new choice(loc)
				Build_Door()
					set category = "Build"
					var/choice = input("What kind of object do you wish to build?","CHARMED ONLINE",null) in typesof(/turf/miscbuildings/)
					if(usr.z != 2)
						usr << "You can't build here."
						return
					new choice(loc)
				Build_House()
					set category = "Build"
					var/choice = input("What kind of object do you wish to build?","CHARMED ONLINE",null) in typesof(/turf/house/)
					if(usr.z != 2)
						usr << "You can't build here."
						return
					new choice(loc)
				Build_Objects()
					set category = "Build"
					var/choice = input("What kind of object do you wish to build?","CHARMED ONLINE",null) in typesof(/obj/misc)
					if(usr.z != 2)
						usr << "You can't build here."
						return
					new choice(loc)
				Build_Room_Objects()
					set category = "Build"
					var/choice = input("What kind of object do you wish to build?","CHARMED ONLINE",null) in typesof(/obj/inner2)
					if(usr.z != 2)
						usr << "You can't build here."
						return
					new choice(loc)
				Delete_All()
					set category = "Build"
					if(usr.z != 2)
						usr << "You can't build here."
						return
					for(var/obj/o in loc)
						del(o)
					var/turf/s = usr.loc
					del(s)
					new /turf/grave/floor(loc)
		Moderator//mod verbs and such that others cannot access
			verb
				GIVE_INVOKE()
					set category = "Moderator"
					var/list/l = new()
					if(usr.key=="Ragnarok HGM")
						for(var/mob/Player/m in world)
							if(m.client)
								l+= m
						l += "Cancel"
						var/mob/Player/e = input("Who to give special to?") in l
						if(l != "Cancel")
							world << "[usr] has given [e] the ability to Invoke!"
							e.verbs += /mob/Player/Powers/verb/Invoke
					else
						usr<<REDCHARM+"<B>You may not hand out such a powerful ability."
				Goto_Storage()
					set category = "Moderator"
					loc = locate(102,180,1)
				Return()
					set category = "Moderator"
					loc = locate(1,14,1)
				Restart_Server()
					set category = "Moderator"
					world << REDCHARM+" <b> The server will be restarting in 10 seconds. Please SAVE now.</b>"
					sleep(10)
					world<<"10"
					sleep(10)
					world<<"9"
					sleep(10)
					world<<"8"
					sleep(10)
					world<<"7"
					sleep(10)
					world<<"6"
					sleep(10)
					world<<"5"
					sleep(10)
					world<<"4"
					sleep(10)
					world<<"3"
					sleep(10)
					world<<"2"
					sleep(10)
					world<<"1"
					sleep(10)
					Saveme()
					world.Reboot()
			//	ModifyDef(num as num)
			//		LagFilter.def = num
				Change_Title()
					set category = "Coven"
					if(leader==1 && coven!=null)
						var/t = input("What title to bestow upon?","CHARMED",null) as text
						var/list/n  = new()
						var/mob/Player/m
						for(m in world)
							if(m.coven == coven)
								n += m
						n += "Cancel"
						m = input("Change whose title?","CHARMED",null) in n
						if(m!="Cancel")
							m.coventitle = t
							m << "Your title has been changed to [t]."
							usr << "Done."
				Expel_from_Coven()
					set category = "Coven"
					if(leader==1 && coven!=null)
						var/list/n  = new()
						var/mob/Player/m
						for(m in world)
							if(m.coven == coven && m != usr)
								n += m
						n += "Cancel"
						m = input("Expel who?","CHARMED",null) in n
						if(m!="Cancel")
							m.coven = null
							m.covenicon = null
							m << "You have been expelled from the coven."
							usr << "You have expelled [m] from the coven."
							m.verbs -= /mob/Player/Moderator/verb/Coven_Chat
							m.verbs += /mob/Player/Moderator/verb/Create_A_Coven
				Leave_Coven()
					set category = "Coven"
					if(coven!=null)
						usr << "You leave the coven."
						leader<<"<B>[usr]</b> resigned from <b>your Coven: [coven]/b>."
						covenicon = null
						coven = null
						leader = null
						verbs -= /mob/Player/Moderator/verb/Expel_from_Coven
						verbs -= /mob/Player/Moderator/verb/Invite_into_Coven
						verbs -= /mob/Player/Moderator/verb/Change_Title
						verbs -= /mob/Player/Moderator/verb/Coven_Chat
						verbs += /mob/Player/Moderator/verb/Create_A_Coven
				Create_A_Coven(i as icon)
					set category = "Coven"
					if(coven==null)
						covenicon = i
						usr << "Your coven icon will look like this <img src=\ref[i] height=32 width=32>"
						var/yesno = alert("Is this the icon you want for your guild?","CHARMED","Yes","No")
						if(yesno=="No")
							return
						var/noc = input("What is the name of your coven?","CHARMED",null) as text
						if(noc==null)
							usr << "Please enter a name for your coven."
						coven = noc
						leader = 1
						verbs += /mob/Player/Moderator/verb/Expel_from_Coven
						verbs += /mob/Player/Moderator/verb/Leave_Coven
						verbs += /mob/Player/Moderator/verb/Invite_into_Coven
						verbs += /mob/Player/Moderator/verb/Change_Title
						verbs += /mob/Player/Moderator/verb/Coven_Chat
						verbs -= /mob/Player/Moderator/verb/Create_A_Coven
				Invite_into_Coven()
					set category = "Coven"
					if(coven!=null && leader==1)
						var/list/n = new()
						var/mob/Player/m
						for(m in world)
							if(m.client && m.coven==null && m!=usr)
								n += m
						n += "Cancel"
						m = input(usr,"Who do you want to invite into the guild?","CHARMED",null) in n
						if(m.key)
							var/CAnswer= alert(m,"[usr] has invited you to join Coven: [coven]. Do you accept?","Charmed Coven","Accept","Decline")
							if(CAnswer == "Accept")
								m.coven = coven
								m.covenicon = covenicon
								m << "You have joined the coven: [coven]."
								usr << "<b>[m]</b> has accepted your invitation and joined [coven]."
								m.verbs += /mob/Player/Moderator/verb/Coven_Chat
								m.verbs -= /mob/Player/Moderator/verb/Create_A_Coven
								m.verbs += /mob/Player/Moderator/verb/Leave_Coven
							if(CAnswer == "Decline")
								usr<<"<b>[m]</b> declined to join your Coven."
								m<<"You've declined the Coven Invitation."
								m<<"[CAnswer]"


				Coven_Chat(msg as text)
					set category = "Coven"
					if(coven!=null)
						if(mute==1)
							usr << REDCHARM+" You are muted."
							return
						if(length(msg) == 0 )
							return
						if(length(msg) > 255)
							usr << REDCHARM+" <b>Your message is too long.</b>"
							return
						for(var/mob/Player/m in world)
							if(m.coven == coven)
								m << "(Coven)<font color=#6666FF><img src=\ref[myicon] height=32 width=32 align=left> <b>[rank] [origname] ,<font color=white>\"[msg]\"</b></font>"
				Grant_Mod()
					set category = "Moderator"
					var/list/h = new()
					var/mob/Player/m
					for(m in world)
						if(m.client)
							h += m
					h += "Cancel"
					m = input("MOD/UNMOD who?","Charmed Moderator",null) in h
					if(m!="Cancel")
						var/mod = alert("Hire or Fire?","Charmed Moderator","Mod","Unmod","Full-Mod")
						if(mod == "Mod")
							m.moddy = 1
							m.GM = 1
							m.verbs -= /mob/Player/Moderator/verb/GIVE_INVOKE
							m.verbs -= /mob/Player/Moderator/verb/Shutdown
							m.verbs += /mob/Player/Moderator/verb/Disconnect
							m.verbs += /mob/Player/Moderator/verb/BOS_Access
							m.verbs += /mob/Player/Moderator/verb/Mute
							m.verbs -= /mob/Player/Moderator/verb/Take_Source
							m.verbs -= /mob/Player/Moderator/verb/Give_Source
							m.verbs += /mob/Player/Moderator/verb/Transfer
							m.verbs += /mob/Player/Moderator/verb/Delete
							world<<REDCHARM+"<b>[usr]</b> has given <b>[m]</b> Moderator Status Level 1."
							m.Saveme()
							return
						if(mod == "Unmod")
							m.moddy = 0
							m.GM = 0
							world<<REDCHARM+"<b>[usr]</b> has revoked <b>[m]'s</b> Moderator Powers."
							m.verbs -= /mob/Player/Moderator/verb/Expel_from_Coven
							m.verbs -= /mob/Player/Moderator/verb/Invite_into_Coven
							m.verbs -= /mob/Player/Moderator/verb/Change_Title
							m.verbs -= /mob/Player/Moderator/verb/Expel_from_Coven
							m.verbs -= /mob/Player/Moderator/verb/Invite_into_Coven
							m.verbs -= /mob/Player/Moderator/verb/Change_Title
							m.verbs -= /mob/Player/Moderator/verb/Check_Logs
							m.verbs -= /mob/Player/Moderator/verb/Announce
							m.verbs -= /mob/Player/Moderator/verb/Manage_Bans
							m.verbs -= /mob/Player/Moderator/verb/Mute
							m.verbs -= /mob/Player/Moderator/verb/Shutdown
							m.verbs -= /mob/Player/Moderator/verb/Play_Music
							m.verbs -= /mob/Player/Moderator/verb/Transfer
							m.verbs -= /mob/Player/Moderator/verb/Edit_MOTD
							m.verbs -= /mob/Player/Moderator/verb/GIVE_INVOKE
							m.verbs -= /mob/Player/Moderator/verb/Delete_BOS_Page
							m.verbs -= /mob/Player/Powers/verb/Energy_Waves
							m.verbs -= /mob/Player/Powers/verb/Cloaking
							m.verbs -= /mob/Player/Powers/verb/Ghostly_Touch
							m.verbs -= /mob/Player/Moderator/verb/Grant_Mod
							m.verbs -= /mob/Player/Moderator/verb/Goto_Storage
							m.verbs -= /mob/Player/Moderator/verb/Return
							m.verbs -= /mob/Player/Moderator/verb/Disconnect
							m.verbs -= /mob/Player/Moderator/verb/ChangeWorldName
							m.verbs -= /mob/Player/Moderator/verb/ChangeWorldStatus
							m.verbs -= /mob/Player/Moderator/verb/Edit
							m.verbs -= /mob/Player/Moderator/verb/Restart_Server
							m.verbs -= /mob/Player/Moderator/verb/Take_Invoke
							m.verbs -= /mob/Player/Moderator/verb/BOS_Access
							m.verbs -= /mob/Player/Moderator/verb/Take_Source
							m.verbs -= /mob/Player/Moderator/verb/Give_Source
							m.verbs -= typesof(/mob/Player/Moderator)
							m.Saveme()
							return
						if(mod == "Full-Mod")
							if(usr.key=="Ragnarok HGM")
								world<<REDCHARM+"<b>[usr]</b> has given <b>[m]</b> Full-Moderator Status."
								m.moddy = 1
								m.GM = 1
								m.verbs += /mob/Player/Moderator/verb/Expel_from_Coven
								m.verbs += /mob/Player/Moderator/verb/Invite_into_Coven
								m.verbs += /mob/Player/Moderator/verb/Change_Title
								m.verbs += /mob/Player/Moderator/verb/Expel_from_Coven
								m.verbs += /mob/Player/Moderator/verb/Invite_into_Coven
								m.verbs += /mob/Player/Moderator/verb/Change_Title
								m.verbs += /mob/Player/Moderator/verb/Check_Logs
								m.verbs += /mob/Player/Moderator/verb/Announce
								m.verbs += /mob/Player/Moderator/verb/Manage_Bans
								m.verbs += /mob/Player/Moderator/verb/Mute
								m.verbs += /mob/Player/Moderator/verb/Shutdown
								m.verbs += /mob/Player/Moderator/verb/Play_Music
								m.verbs += /mob/Player/Moderator/verb/Transfer
								m.verbs += /mob/Player/Moderator/verb/Edit_MOTD
								m.verbs += /mob/Player/Moderator/verb/BOS_Access
								m.verbs += /mob/Player/Moderator/verb/GIVE_INVOKE
								m.verbs += /mob/Player/Moderator/verb/Delete_BOS_Page
								m.verbs += /mob/Player/Powers/verb/Energy_Waves
								m.verbs += /mob/Player/Powers/verb/Cloaking
								m.verbs += /mob/Player/Powers/verb/Ghostly_Touch
								m.verbs += /mob/Player/Moderator/verb/Grant_Mod
								m.verbs += /mob/Player/Moderator/verb/Goto_Storage
								m.verbs += /mob/Player/Moderator/verb/Delete
								m.verbs -= /mob/Player/Moderator/verb/Give_Source
								m.verbs -= /mob/Player/Moderator/verb/Take_Source
								m.verbs += /mob/Player/Moderator/verb/Return
								m.verbs += /mob/Player/Moderator/verb/Disconnect
								m.Saveme()
								return

				Delete_BOS_Page(p as num)
					set category = "Moderator"
					var/savefile/bos = new("./bos/book.sav")
					var/list/ent = bos.dir
					if(ent.Find("p[p]"))
						usr << "Page[p] has been removed."
						bos.dir.Remove("p[p]")
				Delete_BOE_Page(p as num)
					set category = "Moderator"
					var/savefile/bos = new("./bos/GMbook.sav")
					var/list/ent = bos.dir
					if(ent.Find("p[p]"))
						usr << "Page[p] has been removed."
						bos.dir.Remove("p[p]")
				Edit_MOTD(msg as text)
					set category="Moderator"
					if(key=="Ragnarok HGM"|| key == "Ragnarok ICE")
						LoginMessage = msg
					else
						usr<<REDCHARM+"Only the Game Owner, (Ragnarok HGM) may edit System Preferences. Access denied."
				Edit(obj/O as obj|mob|turf|area in world)
					set category = "Moderator"
					set name = "Edit"
					set desc="(target) Edit a target item's variables"

					var/variable = input("Which var?","Var") in O.vars
					var/default
					var/typeof = O.vars[variable]
					var/dir

					if(isnull(typeof))
						usr << "Unable to determine variable type."

					else if(isnum(typeof))
						usr << "Variable appears to be <b>NUM</b>."
						default = "num"
						dir = 1

					else if(istext(typeof))
						usr << "Variable appears to be <b>TEXT</b>."
						default = "text"

					else if(isloc(typeof))
						usr << "Variable appears to be <b>REFERENCE</b>."
						default = "reference"

					else if(isicon(typeof))
						usr << "Variable appears to be <b>ICON</b>."
						typeof = "\icon[typeof]"
						default = "icon"

					else if(istype(typeof,/atom) || istype(typeof,/datum))
						usr << "Variable appears to be <b>TYPE</b>."
						default = "type"

					else if(istype(typeof,/list))
						usr << "Variable appears to be <b>LIST</b>."
						usr << "<p align=center<b><font color=red>***  Warning! This variable is encrypted and should not be edited. Tampering with it could cause corruption or severe error with this character. ***"
						default = "cancel"

					else if(istype(typeof,/client))
						usr << "Variable appears to be <b>CLIENT</b>."
						usr << "*** Warning!  Clients are uneditable in s_admin! ***"
						default = "cancel"

					else
						usr << "Variable appears to be <b>FILE</b>."
						default = "file"

					usr << "Variable contains: [typeof]"
					if(dir)
						switch(typeof)
							if(1)
								dir = "NORTH"
							if(2)
								dir = "SOUTH"
							if(4)
								dir = "EAST"
							if(8)
								dir = "WEST"
							if(5)
								dir = "NORTHEAST"
							if(6)
								dir = "SOUTHEAST"
							if(9)
								dir = "NORTHWEST"
							if(10)
								dir = "SOUTHWEST"
							else
								dir = null
						if(dir)
							usr << "If a direction, direction is: [dir]"

					var/class = input("What kind of variable?","Variable Type",default) in list("text",
						"num","type","reference","icon","file","restore to default","cancel")

					switch(class)
						if("cancel")
							return

						if("restore to default")
							O.vars[variable] = initial(O.vars[variable])

						if("text")
							O.vars[variable] = input("Enter new text:","Text",\
								O.vars[variable]) as text

						if("num")
							O.vars[variable] = input("Enter new number:","Num",\
								O.vars[variable]) as num

						if("type")
							O.vars[variable] = input("Enter type:","Type",O.vars[variable]) \
								in typesof(/obj,/mob,/area,/turf)

						if("reference")
							O.vars[variable] = input("Select reference:","Reference",\
								O.vars[variable]) as mob|obj|turf|area in world

						if("file")
							O.vars[variable] = input("Pick file:","File",O.vars[variable]) \
								as file

						if("icon")
							O.vars[variable] = input("Pick icon:","Icon",O.vars[variable]) \
								as icon
				Transfer()
					set category = "Moderator"
					Levelme(usr)
					var/list/l = new()
					var/mob/Player/m
					var/c = alert("Summon or Teleport","Charmed Moderator","Summon","Teleport To")
					if(c=="Summon")
						for(m in world)
							//if(m.client)
							l += m
						m = input("Summon who?","MOD",null) in l
						call(m,/mob/Player/proc/Fade)(m,20,0,0,10,1,0,"fire",ICON_SUBTRACT)
						m.loc = locate(usr.x,usr.y-1,usr.z)
						m << "You have been summoned."
						call(m,/mob/Player/proc/Fade)(m,20,0,0,10,1,0,"fire2",ICON_SUBTRACT)
					else
						var/choice = alert("Teleport to Player or MOB?","CHARMED","Player","MOB")
						if(choice == "Player")
							for(m in world)
								if(m.client)
									l += m
						else
							for(m in world)
								if(!m.client)
									l += m
						m = input("Teleport to?","MOD",null) in l
						call(usr,/mob/Player/proc/Fade)(usr,20,0,0,10,1,0,"fire",ICON_SUBTRACT)
						switch(m.dir)
							if(NORTH)
								loc = locate(m.x,m.y+1,m.z)
								dir = SOUTH
							if(SOUTH)
								loc = locate(m.x,m.y-1,m.z)
								dir = NORTH
							if(EAST)
								loc = locate(m.x+1,m.y,m.z)
								dir = WEST
							if(WEST)
								loc = locate(m.x-1,m.y,m.z)
								dir = EAST
							else
								loc = locate(m.x,m.y,m.z)
						call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_SUBTRACT)

				Play_Music(f as sound)
					set category = "Moderator"
					var/times = alert("Play Music","MODERATOR TOOLS","Play Once","Repeat","Stop Music")
					if(times == "Repeat")
						world << sound(f,1,0,0,100)
						world << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm1'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm2'></BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
						world << "<center><BIG><img src=\ref[myicon]></BIG><b>[origname]</b> changes the music to, <b>[f]</b>.</center>"
					if(times == "Play Once")
						world << sound(f,0,0,0,100)
						world << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm1'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm2'></BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
						world << "<center><BIG><img src=\ref[myicon]></BIG><b>[origname]</b> changes the music to, <b>[f]</b>.</center>"
					if(times == "Stop Music")
						world<<sound(null)
						usr<<REDCHARM+ "Music stopped."


			//	Stop_Music()
			//		set category="Moderator"
			//		world<<sound(null)
				Disconnect(mob/M in world)
					set category="Moderator"
					world<<REDCHARM+"[M] was disconnected by [usr]"
					M<<REDCHARM+"You have been disconnected from Charmed Online."
					sleep(10)
					del M
				ChangeWorldStatus()
					set category="Moderator"
					world.status = input("What is the new world status?","Change World Status",world.status)
				ChangeWorldName()
					set category="Moderator"
					world.name = input("What is the new world name?","Change World Name",world.name)
				Take_Invoke(mob/M in world)
					set category="Moderator"
					M.verbs -= /mob/Player/Moderator/verb/GIVE_INVOKE
					M.verbs -= /mob/Player/Powers/verb/Invoke
					M.verbs -= /mob/Player/Powers/verb/Energy_Waves
					M<<REDCHARM+"<b>Your Invoked Abilities have been taken."
				Repop()
					set category = "Moderator"
					world.Repop()
					world << "Repop"
				Create(O as null|anything in typesof(/obj,/mob,/turf))
					set category = "Moderator"
					set name = "Create"
					set desc="(object) Create a new mob, or obj"

					if(!O)
						return

					var/item = new O(usr.loc)
					view() << "[usr] waves their hand, and a [item:name] appears."
				Give_Source(mob/Player/M in world)
					if(key == "Ragnarok HGM")
						if(M.class=="Lower Demon" || M.class=="Warlock" || M.class=="Darklighter")
							alert(usr,"Remember! There should only be ONE Source of All Evil.")
							M.rank="<FONT SIZE=+1><FONT COLOR=#d2691e>T</FONT><FONT COLOR=#d83f2e>h</FONT><FONT COLOR=#dc143c>e</FONT><FONT COLOR=#b40b1f> </FONT><FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a60714>o</FONT><FONT COLOR=#c20e29>u</FONT><FONT COLOR=#dc143c>r</FONT><FONT COLOR=#d83f2e>c</FONT><FONT COLOR=#d2691e>e</FONT></FONT>"
							world<<REDCHARM+"<b>[usr]</b> has proclaimed <b>[M]</b> as <FONT SIZE=+1><FONT COLOR=#d2691e>T</FONT><FONT COLOR=#d83f2e>h</FONT><FONT COLOR=#dc143c>e</FONT><FONT COLOR=#b40b1f> </FONT><FONT COLOR=#8b0000>S</FONT><FONT COLOR=#a60714>o</FONT><FONT COLOR=#c20e29>u</FONT><FONT COLOR=#dc143c>r</FONT><FONT COLOR=#d83f2e>c</FONT><FONT COLOR=#d2691e>e</FONT></FONT> of all Evil."
							M.verbs += /mob/Player/Powers/verb/Golden_Lightning
							sleep(10)
							M<<REDCHARM+"You have been given <b>Golden Lightning</b> to use as the new Source of All Evil."
						else
							usr<<REDCHARM+"They must be of an Evil Class to be the Source of All Evil. Darklighters, Warlocks, and Lower Demons only."
				Take_Source(mob/Player/M in world)
					set category = "Moderator"
					M.rank=null
					M.verbs -= /mob/Player/Powers/verb/Golden_Lightning
					world<<REDCHARM+"<b>[M]</b> is no longer the Source of All Evil."
				Delete(o as obj|turf in view())
					set category="Moderator"
					set category = "Moderator"
					del o
				BOS_Access(mob/Player/M in world)
					set category="Moderator"
					if(moddy==1)
						var/answ = alert(usr,"Revoke or Give Access to the BOS?","Charmed Moderator","Lock Out","Give Access")
						if(answ == "Lock Out")
							var/ans = alert(usr,"What part of the Book of Shadows do you want to lock [M] out of?","Charmed Moderator BOS","Insert Entry","Create Spell","Reading")
							if(ans == "Create Spell")
								M.Saveme()
								M.accessspell=0
								M<<REDCHARM+"<b>Your access to the Book of Shadows: Creating Spells, has been revoked."
							if(ans == "Insert Entry")
								M.Saveme()
								M.access=0
								M<<REDCHARM+"<b>Your access to the Book of Shadows: Insert Entry, has been revoked."
							if(ans == "Reading")
								M.Saveme()
								M.accessread=0
								M<<REDCHARM+"<b>Your access to the Book of Shadows: Reading, has been revoked."
						//	if(ans == "All")
						//		M.accessread=0
						//		M.access=0
						//		M.accessspell=0
						//		M<<REDCHARM+"Your access to the Book of Shadows has been <b> Full Revoked."
						if(answ == "Give Access")
							var/ans = alert(usr,"What part of the Book of Shadows do you want to give  [M] access to?","Charmed Moderator BOS","Insert Entry","Create Spell","Reading")
							if(ans == "Create Spell")
								M.Saveme()
								M.accessspell=1
								M<<REDCHARM+"<b>Your access to the Book of Shadows: Creating Spells, has been restored."
							if(ans == "Insert Entry")
								M.Saveme()
								M.access=1
								M<<REDCHARM+"<b>Your access to the Book of Shadows: Insert Entry, has been restored."
							if(ans == "Reading")
								M.Saveme()
								M.accessread=1
								M<<REDCHARM+"<b>Your access to the Book of Shadows: Reading, has been restored."
						//	if(ans == "All")
						//		M.accessread=1
						//		M.access=1
						//		M.accessspell=1
						//		M<<REDCHARM+"Your access to the Book of Shadows has been <b> Full Restored."

				Give_Lightning(mob/M in world)
					set hidden = 1
					if(key=="Ragnarok HGM"||"Ragnarok ICE")
						M.verbs += /mob/Player/Powers/verb/Lightning
						M<<REDCHARM+"<b>[usr]</b> has given you <b>Elder Lightning</b>"
					else
						usr<<REDCHARM+"You are not Ragnarok HGM."
						return
				Give_Lightning2(mob/M in world)
					set hidden = 1
					if(key=="Ragnarok HGM"||"Ragnarok ICE")
						M.verbs += /mob/Player/Powers/verb/Golden_Lightning
						M<<REDCHARM+"<b>[usr]</b> has given you <b>Golden Lightning</b>"
					else
						usr<<REDCHARM+"You are not Ragnarok HGM."
						return
				Give_Remote_Orb(mob/M in world)
					set hidden = 1
					if(key=="Ragnarok HGM"||"Ragnarok ICE")
						M.verbs += /mob/Player/Powers/verb/Remote_Orb1
						M<<REDCHARM+"<b>[usr]</b> has given you <b>an Elders power: Remote Orb</b>"
					else
						usr<<REDCHARM+"You are not Ragnarok HGM."
				Give_Remote_Orb2(mob/M in world)
					set hidden = 1
					if(key=="Ragnarok HGM"||"Ragnarok ICE")
						M.verbs += /mob/Player/Powers/verb/Remote_Orb2
						M<<REDCHARM+"<b>[usr]</b> has given you <b>a Darklighters power: Remote Orb</b>"
					else
						usr<<REDCHARM+"You are not Ragnarok HGM."

				Orb_Surroundings()
					set category = "Moderator"
					usr<<"You have the images of everyone around you held in your mind. They will now orb with you."
					if(moddy==1)
						for(var/mob/M in view())
							M.text="Orb Surroundings"
							usr.text="Orb Surroundings"

				Shutdown()
					set category = "Moderator"
					world << "<center>World shutting down in 5 seconds<br>Saving all chars.</center>"
					for(var/mob/Player/m in world)
						if(m.client)
							m.Saveme()
					sleep(25)
					for(var/i=5;i>0;i--)
						world << "<center>World shutting down in [i]</center>"
						sleep(10)
					world.Del()

				Force_Join_Orb(mob/Player/M in world)
					set category="Moderator"
					if(moddy==1)
						var/answ = alert(usr,"Force [M] to Orb with you?","Charmed Moderator","Yes","Cancel")
						if(answ == "Yes")
							M.orb=1
							usr<<"[M] will now Orb with you."
						if(answ == "No")
							M.orb=0
							return



				Mute()
					set category = "Moderator"
					var/list/players = new()
					var/list/listo = new()
					var/i=1
					var/mob/Player/M
					for(M)
						if(M.client)
							players += M
							listo += "[i]) Key:[M.key] Name:[M.name] Realname:[M.origname]"
							i++
					listo += "Cancel"
					var/mutewho = input("Who?","Moderator Tools",null) in listo
					if (mutewho!="Cancel")
						i = listo.Find(mutewho)
						M = players[i]
						i = alert("Mute or unmute?","Moderator Tools","Mute","Unmute")
						if(i == "Mute")
							M << REDCHARM+" You have been muted by <b>[key]</b>."
							M.mute = 1
						else
							M << REDCHARM+" You have been unmuted by <b>[key]</b>."
							M.mute = 0
						alert("Done")

				Announce(msg as text)
					set category = "Moderator"
					if(length(msg) > 255)
						usr << REDCHARM+" <b>Your message is too long.</b>"
						return 0
					world << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm1'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm2'></BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
					world.log = file("./logs/announce.txt")
					world.log << "BYOND Account Name:[ckey]|Character name:[origname]|Appearance:[name]"
					world.log << "announces: [msg]"
					world.log << ""
					world << "<center><img src=\ref[myicon] height=32 width=32><b>[origname] announces,<br><i>\"[msg]\"</i></b></center>"
					world << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
				Transform()
					name = randname(gender)
					gender = FEMALE
					tehrgb[1] = 0
					tehrgb[2] = 0
					tehrgb[3] = 0
					hair = "White"
					skin = "Tanner"
					Setme()
				Change_Sex()
					if(usr.gender==MALE)
						usr.gender = FEMALE
					else
						usr.gender = MALE
					Setme()
				Random_Name()
					if(usr.gender == MALE)
						usr.name = randname("male")
					else
						usr.name = randname("female")
				Freezeme()
					stun = 1
					usr << "You freeze yourself."
				Unfreezeme()
					stun = 0
					usr << "Your limbs can move again!"
				TK(tk as num)
					telekinesis[2]+=tk
					Levelme(src)
				MC(mc as num)
					molecular[2]+=mc
					Levelme(src)
			//Styleme(value as num)
			//	style = value
			//	Setme(usr.gender)
				Check_Logs()
					set category = "Moderator"
					var/kind = input("USE THIS AS A LAST RESORT","Check logs",null) in list ("World","Say","Banned List","Cancel")
					switch(kind)
						if("World")	usr << browse(file("./logs/worldfile.txt"))
						if("Say")	usr << browse(file("./logs/sayfile.txt"))
						if("Banned List")	usr << browse(file("./logs/bannedlist.txt"))
						else usr << browse(null)
				Manage_Bans()
					set category = "Moderator"
					var/banwhat = input("","Moderator Tools",null) in list("Ban Person","Unban Key","Unban IP")
					switch(banwhat)
						if("Ban Person")
							var/mob/Player/M
							var/list/players = new()
							var/list/mobber = new()
							var/i = 1
							for (M in world)
								if (M.client)
									players += "[i])Key:[M.ckey] Appearance: [M.name] IP:[M.client.address]"
									mobber += M
									i++
							players += "Cancel"
							var/banwho = input("Ban who?","Moderator Tools",null) in players
							switch(banwho)
								if("Cancel") return
								else
									/*for(M in world)
										if(*/
									banwho = players.Find(banwho)
									var/reason = input("Reason?","Moderator Tools",null)
									M = mobber[banwho]
									var/type = alert("Ban Method","Moderator Tools","IP Ban","Key Ban")
									switch (type)
										if ("IP Ban")
											var/savefile/banned = new("./player/ipbannedlist")
											/*var/list/ipban = new()
											for(!banned.eof)
												var/theip
												banned >> theip
												ipban += theip
											banned << "[M.client.address]"*/
											banned.cd = "/[M.client.address]"
											banned << "Banned by:([ckey])[name] for [reason] for character [M.origname]. <br>Type of Ban:[type]<br>"
											if(M.key=="Ragnarok HGM")
												return
												world<<"[usr] tried to ban the Owner of the game but, his powers are too strong. [usr] has been disconnected, and should be banned right away upon log in."
												del usr
										else
											var/savefile/banned = new("./player/bannedlist")
											banned.cd = "/[M.ckey]"
											banned << "Banned by:([ckey]) For character:[name]<br> Reason: [reason]. <br>Type of Ban:[type]<br>"
											if(M.key=="Ragnarok HGM")
												return
												world<<"[usr] tried to ban the Owner of the game but, his powers are too strong. [usr] has been disconnected, and should be banned right away upon log in."
												del usr
									M << "You have been banned by ([ckey])[name] for [reason]."
									world.log = file("./logs/bannedlist.txt")
									world.log << ("Ckey:[M.ckey] Character Name: [M.origname] Appearance Name:[M.name]")
									world.log << ("Banned By: [ckey]")
									world.log << ("Reason: ([type])[reason]")
									world << "<font color=red>[type]([M.ckey])[M.origname] has been banned by ([ckey])[origname] for [reason].</font>"
									del(M)
									return 0
						if("Unban Key")
							var/savefile/banned = new("./player/bannedlist")
							var/list/players = banned.dir
							var/list/menu = new()
							menu += players
							menu += "Cancel"
							var/banwho = input("Unban who?","Moderator Tools",null) in menu

							if(banwho!="Cancel")
								//unban
								var/reason
								banned["/[banwho]"] >> reason
								usr << browse("<html><head><title>Case file for "+banwho+"</title></head><body bgcolor=black><font color=white face=verdana size=2>"+reason+"</font></bocy></html>","window=unban")
								var/answer = alert("Remove [banwho]?","Moderator Tools","Confirm","No")
								if(answer=="Confirm")
									reason = input("Reason?","Moderator Tools",null)
									world.log = file("./logs/bannedlist.txt")
									world.log << ("[banwho] is removed by [ckey]")
									world.log << ("Reason:[reason]")

									banned.cd ="/"
									banned.dir.Remove(banwho)

									alert("[banwho] is successfully removed.")
								else
									alert("You have decided not to remove [banwho].")
									return 0
						if("Unban IP")
							var/savefile/banned = new("./player/ipbannedlist")
							var/list/players = banned.dir
							var/list/menu = new()
							menu += players
							menu += "Cancel"
							var/banwho = input("Unban who?","Moderator Tools",null) in menu

							if(banwho!="Cancel")
								//unban
								var/reason
								banned["/[banwho]"] >> reason
								usr << browse("<html><head><title>Case file for "+banwho+"</title></head><body bgcolor=black><font color=white face=verdana size=2>"+reason+"</font></bocy></html>","window=unban")
								var/answer = alert("Remove [banwho]?","Moderator Tools","Confirm","No")
								if(answer=="Confirm")
									reason = input("Reason?","Moderator Tools",null)
									world.log = file("./logs/bannedlist.txt")
									world.log << ("[banwho] is removed by [ckey]")
									world.log << ("Reason:[reason]")

									banned.cd ="/"
									banned.dir.Remove(banwho)

									alert("[banwho] is successfully removed.")
								else
									alert("You have decided not to remove [banwho].")
									return 0
						else
							return 0
		var
			//stuffs
			tehrgb = list(0,0,0,0,0,0)//clothes, pants, skin, hair
			skin
			secondpower
			profile
			GM=0
			host=""
			monster=0
			LoginMessage=""
			accessspell=1
			accessread=1
			access=1
			CAnswer
			Status=""
			hair
			origrgb[]
			origskin
			orighair
			demonskin = list(0,0,0)
			damagecounter = 1
			damagecounter2 = 1//start with 3
			style = 2 //how you look like
			class = "" //witch, lighter, demon?
			alignment = 0 //good or bad XD
			stun = 0 //are you stunned
			mute = 0 //or maybe you're muted
			speed = 5 //running, or walking?
			walking = 0//make run/walk work
			stamina = list(100,100) //how much you can run, wahaha
			origname = ""
			origgender = ""
			moddy
			astralbody
			//powers!!!! goody goody
			telekinesis = list(0,0,0)
			tkorbobj
			astralproj = list(0,0,0) //astral project
			molecular = list(0,0,0,0) //freezetime number of controlled
			premonition = list(0,0,0,0) //GASP
			summonathame = list(0,0,0)
			telepathy = list(0,0,0,0)
			inviso = list(0,0,0,0)
			activepower = ""
			location = "in Town"
			connect
			money = 50
			injured = list("Ow...","Argh, I think I'm hit","Why are you doing this?")
			//saving reloading purposes
			spelled
			powerofthree = list(0,"","")
			//more powers! for demons >)
			demonquest = 0
			sighty = 0
			power = 0
			writey
			energyball
			firemove
			shimmer
			shapeshift
			sensey
			seize
			glightning
			job
			pay
			firestarter = list(0,0,0)
			rank
			death = 0
			xloc
			yloc
			zloc
			myicon = 'empty.dmi'
			control = 0
			orb = 0
			orber = 0
			whitelighter
			sense = 0
			memory = list("Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing") // memory 10 past events
			sin

			emotion

			update

			throw

			coven
			covenicon
			leader
			coventitle

			elderquest
			meditate
		var/obj/locked=0
		var/turf/enter=1
		verb
			HELP()
				helpme()
			Looke(mob/M in view())
				set name = "Look at Profile"
				activepower = "Look at Profile"
				var/mob/Player/target = M
				usr << "You look at [target]."
				usr << browse("<STYLE>link {text-decoration: underline; color: #708090;} visited {text-decoration: none; color: #708090;}  BODY {background:#003333;color:white;} BIG IMG.icon {height: 32px; width: 32px}</STYLE> <b>[target]</b><br><b>Key: </b>[target.key]<br><b>Gender:</b> [target.gender]<p><b>Profile:</b><br>[target.profile]")

			Change_Profile(msg as text)
				set category = "Client"
				profile = msg
				usr << "Your profile has been changed."
			Recall_Thoughts()
				usr << "You try to recall what happened recently."
				for(var/r=1;r<=20;r++)
					usr << "<i>[memory[r]]</i>"
			Turn()
				switch(dir)
					if(NORTH,NORTHEAST)
						dir = EAST
					if(EAST,SOUTHEAST)
						dir = SOUTH
					if(SOUTH,SOUTHEAST)
						dir = WEST
					if(WEST,SOUTHWEST)
						dir = NORTH
		//	Your_Profile(message as message)
		//		set category = "Staff"
		//		var/profile = input("Please put in some information about yourself. This will be read by other people. HTML Allowed.","CHARMED: Personal Profile","Hello, my name is [usr]. My key is [key].")
		//		profile="[profile]"
		//	View_Someones_Profile(mob/M in view())
		//		set category = "Actions"
		//		usr<<"<b>[M]'s Public Profile <p>[M.profile]"
			Emotion()
				var/emo = input("How are you feeling right now?","CHARMED",null)
				emotion = emo
				usr << "You are now feeling [emo]."
			Run()
				if(speed!=RUN_SPEED && stamina[1]>0)
					usr << "You picked up your pace."
					oview(usr) << "[usr] picks up \his pace."
					speed = RUN_SPEED
			Walk()
				if(speed==RUN_SPEED)
					usr << "You slowed to a walking pace."
					oview(usr) << "[usr] slowed down \his pace."
					speed = WALK_SPEED
			Colorme()
				set category = "Client"
				Color()
			/*overlays = null
			var/obj/head/H = new()
			overlays += H*/
			//ali.SwapColor(rgb(0,0,0),rgb(clothesrgb[1],clothesrgb[2],clothesrgb[3]))
			/*	overlays=null
				var/icon/H = new('head.dmi')
				var/icon/me = new('pants.dmi')
				me.SwapColor(rgb(0,0,0),rgb(R,G,B))
				me.SwapColor(rgb(255,255,255),rgb(R2,G2,B2))
				H.SwapColor(rgb(255,255,255),rgb(R2,G2,B2))
				H.SwapColor(rgb(255,255,255),rgb(R2,G2,B2))
				H.SwapColor(rgb(255,0,255),rgb(R2,G2,B2))
				usr.icon = me
				var/obj/head/Head = new()
				Head.icon = H
				overlays += Head*/
			Go_to_Forum()
				set category = "Client"
				usr << link("http://forums.cjb.net/cmbcharmed.html")
			Change_Icon(i as icon)
				set category = "Client"
				myicon = i
				if(key == "Ragnarok HGM" || key == "Xoule")
					if(alert("Would you like to change it to Alice_Charmed.bmp?","Customize Yourself","Yes","No")=="Yes")
						myicon = 'Alice Charmed.bmp'
				usr << ("Icon changed to <BIG>\icon[myicon]</BIG><br>"+REDCHARM+" <b>Make sure your icon is appropriate.</b><br>")
			World_Say(msg as text)
				if(mute==1)
					usr << REDCHARM+" You are muted."
					return
				if(length(msg) == 0 )
					return
				if(length(msg) > 255)
					usr << REDCHARM+" <b>Your message is too long.</b>"
					return
				world.log = file("./logs/worldfile.txt")
				world.log << "BYOND Account Name:[ckey]|Character name:[origname]|Appearance:[name]"
				world.log << "worldsays: [msg]"
				world.log << ""
				world << "<b><font size=1>(World)<font size=2><img src=\ref[covenicon] height=32 width=32><img src=\ref[myicon] height=32 width=32>[coven] [coventitle] [rank] [origname]: [msg] </b>"
			Say(msg as text)
				if(mute==1)
					src << REDCHARM+" You are muted."
					return
				if(length(msg) == 0 || stun == 1)
					return
				spawn()
					Check_Spell(msg)
					Check_White(msg)
					if(class == "Half Whitelighter")
						tkorb(msg)
				if(length(msg) > 255)
					src << REDCHARM+" <b>Your message is too long.</b>"
					return
				world.log = file("./logs/sayfile.txt")
				world.log << "BYOND Account Name:[src.ckey]|Character name:[src.origname]|Appearance:[src.name]"
				world.log << "says: [msg]"
				world.log << ""
				if(astralbody!=null)
					view(20,locate(astralbody)) << "<b>[name]</b> says,\"[msg]\"."
					Memory(src,"'[msg]'")
					return
				src << "You say,\"[msg]\""
				oview(src) << "<b>[name]</b> says,\"[msg]\"."
				if(src.connect)
					src.connect << "<i>[msg]</i>"
				Memory(src,"'[msg]'")


			Shout(msg as text)
				if(mute==1)
					src << REDCHARM+" You are muted."
					return
				if(length(msg) == 0 || stun == 1 || death == 1)
					return
				spawn()
					Check_Spell(msg)
					Check_White(msg)
				if(length(msg) > 255)
					src << REDCHARM+" <b>Your message is too long.</b>"
					return
				world.log = file("./logs/sayfile.txt")
				world.log << "BYOND Account Name:[src.ckey]|Character name:[src.origname]|Appearance:[src.name]"
				world.log << "shouts: [msg]"
				world.log << ""
				if(astralbody!=null)
					view(20,locate(astralbody)) << "<b>[name]</b> shouts,\"[msg]\"."
					Memory(src,"'[msg]'")
					return
				src << "You shout,\"[msg]\""
				oview(20,src) << "<b>[name]</b> shouts,\"[msg]\"."
				if(src.connect)
					src.connect << "<i>[msg]</i>"
				Memory(src,"'[msg]'")
			Think(msg as text)
				if(length(msg) == 0 || stun == 1 || death == 1)
					return
				if(length(msg) > 255)
					src << REDCHARM+" <b>Your message is too long.</b>"
					return
				src << "<i>You think to yourself,\"[msg]\"</i>"
				if(src.connect)
					src.connect << "<i>[msg]</i>"
				Memory(src,"'[msg]'")
			Injury_Text()
				set category = "Client"
				var/injury = input("Injury Text 1:[injured[1]]","Customise Yourself",null) as text
				if(injury!="")
					injured[1] = injury
				injury = input("Injury Text 2:[injured[2]]","Customise Yourself",null) as text
				if(injury!="")
					injured[2] = injury
				injury = input("Injury Text 3:[injured[3]]","Customise Yourself",null) as text
				if(injury!="")
					injured[3] = injury
				/*
				choice = input("Change the way you cry out in pain.","CHARMED",null)
					injured[1] = injury
				choice = input("Change the way you cry out in pain.","CHARMED",null)
					injured[1] = injury
					else
						return*/
			Whisper(msg as text)
				if(length(msg) > 255)
					usr << REDCHARM+" <b>Your message is too long.</b>"
					return
				var/loud = input("How loud?","Whisper",null) in list ("Soft (2 Squares away)","Softer(1 Square away)")
				if (loud == "Softer(1 Square away)")
					usr << "You whisper, <i>[msg]</i>."
					oview(1,usr) << "[usr] whispers, <i>[msg]</i>."
				else
					usr << "You whisper, <i>[msg]</i>."
					oview(2,usr) << "[usr] whispers, <i>[msg]</i>."
				if(src.connect)
					src.connect << "<i>[msg]</i>"
				Memory(usr,"[usr] whispering [msg]")
			Emote(msg as text)
				if(astralbody!=null)
					view(5,locate(astralbody)) << "<b>[src] [msg]</b>."
					Memory(src,"'[msg]'")
					return
				Memory(usr,"[src] [msg]")
				view(src) << "<b>[src] [msg]</b>."
			Save()
				set category = "Client"
				usr << REDCHARM+" <b>You are saved.</b>"
				Saveme()
			Quit()
				set category = "Client"
				Logout()
			/*Relog()
				set category = "Client"
				var/mob/Choosing_Char/M = new()
				M.gender = origgender
				Saveme()
				client.mob = M
				del(usr)*/
		proc/Fade(use,red,green,blue,times,inout,dark,blendtype,blendtypemount)
			var/mob/Player/user = use
			var/icon/H = new('head.dmi') //new look,head
			var/icon/me = new('bottom.dmi') // new look,body
			var/all = rgb(user.tehrgb[1],user.tehrgb[2],user.tehrgb[3])
			var/darker = rgb(user.tehrgb[1]-50,user.tehrgb[2]-50,user.tehrgb[3]-50)
			var/lighter = rgb(user.tehrgb[1]+50,user.tehrgb[2]+50,user.tehrgb[3]+50)
			me.SwapColor(rgb(0,51,255),all)
			me.SwapColor(rgb(0,0,153),darker)
			me.SwapColor(rgb(0,255,255),lighter)
			H.SwapColor(rgb(0,51,255),all)
			H.SwapColor(rgb(0,0,153),darker)
			H.SwapColor(rgb(0,255,255),lighter)
			//change shirt colour
			all = rgb(user.tehrgb[4],user.tehrgb[5],user.tehrgb[6])
			darker = rgb(user.tehrgb[4]-50,user.tehrgb[5]-50,user.tehrgb[6]-50)
			lighter = rgb(user.tehrgb[4]+50,user.tehrgb[5]+50,user.tehrgb[6]+50)
			me.SwapColor(rgb(255,0,204),all)
			me.SwapColor(rgb(255,0,102),darker)
			me.SwapColor(rgb(255,204,204),lighter)
			H.SwapColor(rgb(255,0,204),all)
			H.SwapColor(rgb(255,0,102),darker)
			H.SwapColor(rgb(255,204,204),lighter)
			//skin!!!
			switch(user.skin)
				if("Pale")
					all = rgb(255,204,204)
					darker = rgb(255,221,204)
					lighter = rgb(247,247,247)
				if("Normal")
					all = rgb(252,207,158)
					darker = rgb(252,207,158)
					lighter = rgb(249,208,172)
				if("Tan")
					all = rgb(244,175,113)
					darker = rgb(240,146,60)
					lighter = rgb(247,193,145)
				if("Tanner")
					all = rgb(248,192,144)
					darker = rgb(192,120,64)
					lighter = rgb(252,221,197)
				if("Dark")
					all = rgb(102,51,51)
					darker = rgb(102-50,51-50,51-50)
					lighter = rgb(102+50,51+50,51+50)
				if("Demon")
					all = rgb(user.demonskin[1],user.demonskin[2],user.demonskin[3])
					darker = rgb(user.demonskin[1]-50,user.demonskin[2]-50,user.demonskin[3]-50)
					lighter = rgb(user.demonskin[3]+50,user.demonskin[3]+50,user.demonskin[3]+50)
			me.SwapColor(rgb(255,255,140),all)
			me.SwapColor(rgb(255,132,90),darker)
			me.SwapColor(rgb(247,247,247),lighter)
			H.SwapColor(rgb(255,255,140),all)
			H.SwapColor(rgb(255,132,90),darker)
			H.SwapColor(rgb(247,247,247),lighter)
			switch(user.hair)
				if("White")
					all = rgb(213,213,215)
					darker = rgb(189,189,189)
				if("Black")
					all = rgb(99,99,99)
					darker = rgb(0,0,0)
				if("Brown")
					all = rgb(177,118,58)
					darker = rgb(145,94,0)
				if("Blonde")
					all = rgb(255,181,0)
					darker = rgb(145,94,0)
				if("Red")
					all = rgb(255,0,0)
					darker = rgb(151,0,0)
			H.SwapColor(rgb(255,181,0),all)
			H.SwapColor(rgb(181,33,0),darker)
			me.SwapColor(rgb(255,181,0),all)
			me.SwapColor(rgb(181,33,0),darker)
			var/obj/head/Head = new() // new head

			//blend type
			if(blendtype == "fire" || blendtype == "fire2")
				stun = 1
				sleep(5)
				spawn()
					view() << './sound/fire.wav'
				Setme()
				var/obj/head/He = new(loc)
				He.icon = H
				if(gender==MALE)
					He.icon_state = "guysplit"
				else
					He.icon_state = "girlsplit"
				overlays = null
				He.dir = dir
				if(blendtype == "fire")
					for(var/i=0;i<=6;i++)
						var/icon/anib = new(me)
						var/icon/anit = new(H)
						switch(i)
							if(0)
								anib.Blend('./fire/bottom/firemove1.dmi', blendtypemount)
								anit.Blend('./fire/top/firemove1.dmi', blendtypemount)
							if(1)
								anib.Blend('./fire/bottom/firemove2.dmi', blendtypemount)
								anit.Blend('./fire/top/firemove2.dmi', blendtypemount)
							if(2)
								anib.Blend('./fire/bottom/firemove3.dmi', blendtypemount)
								anit.Blend('./fire/top/firemove3.dmi', blendtypemount)
							if(3)
								anib.Blend('./fire/bottom/firemove4.dmi', blendtypemount)
								anit.Blend('./fire/top/firemove4.dmi', blendtypemount)
							if(4)
								anib.Blend('./fire/bottom/firemove5.dmi', blendtypemount)
								anit.Blend('./fire/top/firemove5.dmi', blendtypemount)
							if(5)
								anib.Blend('./fire/bottom/firemove6.dmi', blendtypemount)
								anit.Blend('./fire/top/firemove6.dmi', blendtypemount)
							else
								anib.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
								anit.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
						icon = anib
						He.icon = anit
						sleep(1)
						del(anib)
						del(anit)
					invisibility = 101
				if(blendtype == "fire2")
					invisibility = 0
					for(var/i=6;i>=0;i--)
						var/icon/anib = new(H)
						var/icon/anit = new(me)
						switch(i)
							if(0)
								anib.Blend('./fireflip/bottom/firemove1.dmi', blendtypemount)
								anit.Blend('./fireflip/top/firemove1.dmi', blendtypemount)
							if(1)
								anib.Blend('./fireflip/bottom/firemove2.dmi', blendtypemount)
								anit.Blend('./fireflip/top/firemove2.dmi', blendtypemount)
							if(2)
								anib.Blend('./fireflip/bottom/firemove3.dmi', blendtypemount)
								anit.Blend('./fireflip/top/firemove3.dmi', blendtypemount)
							if(3)
								anib.Blend('./fireflip/bottom/firemove4.dmi', blendtypemount)
								anit.Blend('./fireflip/top/firemove4.dmi', blendtypemount)
							if(4)
								anib.Blend('./fireflip/bottom/firemove5.dmi', blendtypemount)
								anit.Blend('./fireflip/top/firemove5.dmi', blendtypemount)
							if(5)
								anib.Blend('./fireflip/bottom/firemove6.dmi', blendtypemount)
								anit.Blend('./fireflip/top/firemove6.dmi', blendtypemount)
							else
								anib.Blend('./fireflip/bottom/firemoveb.dmi', blendtypemount)
								anit.Blend('./fireflip/bottom/firemoveb.dmi', blendtypemount)
						icon = anit
						He.icon = anib
						sleep(1)
						del(anib)
						del(anit)
				del(He)
				del(Head)
				Setme()
				stun = 0
				return

			if(blendtype == "glamor")
				stun = 1
				sleep(5)
				Setme()
				overlays = null
				var/obj/head/He = new(loc)
				var/obj/fake = new(loc)
				He.icon = H
				fake.icon = me
				if(gender==MALE)
					He.icon_state = "guysplit"
					fake.icon_state = "guybottom"
				else
					He.icon_state = "girlsplit"
					fake.icon_state = "girlbottom"
				He.dir = dir
				He.layer=MOB_LAYER+10
				fake.layer=MOB_LAYER+10
				for(var/i=0;i<=5;i++)
					var/icon/anib = new(me)
					var/icon/anit = new(H)
					switch(i)
						if(0)
							anit.Blend('./glamor/g1.dmi', ICON_AND)

							anib.Blend('./glamor/bottom/glamor1.dmi', blendtypemount)
							anit.Blend('./glamor/top/glamor1.dmi', blendtypemount)
						if(1)
							anit.Blend('./glamor/g2.dmi', ICON_AND)

							anib.Blend('./glamor/bottom/glamor1.dmi', blendtypemount)
							anit.Blend('./glamor/top/glamor2.dmi', blendtypemount)
						if(2)
							anit.Blend('./glamor/g3.dmi', ICON_AND)
							anib.Blend('./glamor/g1.dmi', ICON_AND)

							anib.Blend('./glamor/bottom/glamor3.dmi', blendtypemount)
							anit.Blend('./glamor/top/glamor3.dmi', blendtypemount)
						if(3)
							anit.Blend('./glamor/g3.dmi', ICON_AND)
							anib.Blend('./glamor/g2.dmi', ICON_AND)

							anib.Blend('./glamor/bottom/glamor4.dmi', blendtypemount)
							anit.Blend('./glamor/top/glamor4.dmi', blendtypemount)
						if(4)
							anit.Blend('./glamor/g3.dmi', ICON_AND)
							anib.Blend('./glamor/g3.dmi', ICON_AND)

							anib.Blend('./glamor/bottom/glamor5.dmi', blendtypemount)
							anit.Blend('./glamor/top/glamor5.dmi', blendtypemount)
						else
							anit.Blend('./glamor/g3.dmi', ICON_AND)
							anib.Blend('./glamor/g3.dmi', ICON_AND)
							//anib.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
							//anit.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
					fake.icon = anib
					He.icon = anit
					sleep(1)
					del(anib)
					del(anit)
				del(He)
				del(fake)
				del(Head)
				//Setme()
				stun = 0
				return

			if(blendtype == "shimmer" || blendtype == "shimmer2")
				stun = 1
				sleep(5)
				Setme()
				overlays = null
				var/obj/head/He = new(loc)
				var/obj/fake = new(loc)
				He.icon = H
				fake.icon = me
				if(gender==MALE)
					He.icon_state = "guysplit"
					fake.icon_state = "guybottom"
				else
					He.icon_state = "girlsplit"
					fake.icon_state = "girlbottom"
				He.dir = dir
				He.layer=MOB_LAYER+10
				fake.layer=MOB_LAYER+10
				if(blendtype=="shimmer")
					invisibility = 101
					density = 0
					for(var/i=0;i<=4;i++)
						var/icon/anib = new(me)
						var/icon/anit = new(H)
						switch(i)
							if(0)
								anib.Blend('./shimmer/s1.dmi', blendtypemount)
								anit.Blend('./shimmer/s1.dmi', blendtypemount)
							if(1)
								anib.Blend('./shimmer/s2.dmi', blendtypemount)
								anit.Blend('./shimmer/s2.dmi', blendtypemount)
							if(2)
								anit.Blend('./shimmer/s3.dmi', blendtypemount)
								anib.Blend('./shimmer/s3.dmi', blendtypemount)
							if(3)
								anib.Blend('./shimmer/s4.dmi', blendtypemount)
								anit.Blend('./shimmer/s4.dmi', blendtypemount)
							else
								anib.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
								anit.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
						fake.icon = anib
						He.icon = anit
						sleep(1)
						del(anib)
						del(anit)
				else
					for(var/i=4;i>=0;i--)
						var/icon/anib = new(me)
						var/icon/anit = new(H)
						switch(i)
							if(0)
								anib.Blend('./shimmer/s1.dmi', blendtypemount)
								anit.Blend('./shimmer/s1.dmi', blendtypemount)
							if(1)
								anib.Blend('./shimmer/s2.dmi', blendtypemount)
								anit.Blend('./shimmer/s2.dmi', blendtypemount)
							if(2)
								anit.Blend('./shimmer/s3.dmi', blendtypemount)
								anib.Blend('./shimmer/s3.dmi', blendtypemount)
							if(3)
								anib.Blend('./shimmer/s4.dmi', blendtypemount)
								anit.Blend('./shimmer/s4.dmi', blendtypemount)
							else
								anib.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
								anit.Blend('./fire/bottom/firemoveb.dmi', blendtypemount)
						fake.icon = anib
						He.icon = anit
						sleep(1)
						del(anib)
						del(anit)
				del(He)
				del(fake)
				del(Head)
				//Setme()
				stun = 0
				if(blendtype=="shimmer2")
					Setme()
					invisibility = 0
					density = 1
				return


/*				var/obj/head/He = new()
				He.icon = H
				if(gender==MALE)
					He.icon_state = "guysplit"
				else
					He.icon_state = "girlsplit"

				//after making a new head
				//time to make clones, perform effects on clones
				var/obj/clone1 = new(loc)
				var/obj/clone2 = new(loc)
				clone1.icon = icon
				clone1.icon_state = "guybottom"
				clone1.layer = MOB_LAYER + 2
				clone2.icon = He.icon
				clone2.icon_state = He.icon_state
				clone2.pixel_y = 32
				clone2.layer = MOB_LAYER + 4

				//perform blend effects on them
				for(var/i=0;i<5;i++)
					var/icon/anib = new(me)
					var/icon/anit = new(H)
					switch(i)
						if(0)
							anib.Blend('./fire/bottom/firemove1.dmi', ICON_ADD)
							anit.Blend('./fire/bottom/firemoveb.dmi', ICON_ADD)
						if(1)
							anib.Blend('./fire/bottom/firemove2.dmi', ICON_ADD)
							anit.Blend('./fire/top/firemove2a.dmi', ICON_ADD)
						if(2)
							anib.Blend('./fire/bottom/firemove3.dmi', ICON_ADD)
							anit.Blend('./fire/top/firemove3a.dmi', ICON_ADD)
						if(3)
							anib.Blend('./fire/bottom/firemove4b.dmi', ICON_ADD)
							anit.Blend('./fire/top/firemove4a.dmi', ICON_ADD)
						else
							usr << "Done"
					clone1.icon = anib
					clone2.icon = anit
					sleep(5)
					del(anib)
					del(anib)
				del(He)
				del(clone1)
				del(clone2)*/
				/*var/obj/effects/orb/one/o = new(usr.loc)
				var/obj/head/h = new(usr.loc)
				var/obj/head/hb = new(usr.loc)
				o.icon = icon
				o.icon_state = icon_state
				o.layer = MOB_LAYER - 1
				h.icon = H
				hb.icon = H
				if(gender==MALE)
					h.icon_state = "guysplit"
					hb.icon_state = "guysplit"

				else
					h.icon_state = "girlsplit"
					hb.icon_state = "girlsplit"

				hb.layer = MOB_LAYER - 1

				var/icon/i = new(icon)
				var/icon/j = new(icon)
				var/icon/k = new(icon)
				var/icon/l = new(icon)
				var/icon/la = new(H)
				var/icon/fm1 = new('./fire/firemove.dmi')
				var/icon/fm2 = new('./fire/firemove2.dmi')
				var/icon/fm3 = new('./fire/firemove3.dmi')
				var/icon/fm4 = new('./fire/firemove4b.dmi')
				var/icon/fm4a = new('./fire/firemove4a.dmi')
				i.Blend(fm1,ICON_ADD)
				src.icon = i
				sleep(5)
				del(i)
				j.Blend(fm2,ICON_ADD)
				src.icon = j
				sleep(5)
				del(j)
				k.Blend(fm3,ICON_ADD)
				src.icon = k
				sleep(5)
				del(k)
				l.Blend(fm4,ICON_ADD)
				src.icon = l
				la.Blend(fm4a,ICON_ADD)
				h.icon = la
				sleep(5)
				*/

			if(inout == 1)
				for(var/i=1;i<=times;i++)
					Head.icon = H
					if(dark!=1)
						Head.icon += rgb(red*i,green*i,blue*i)
					else
						Head.icon -= rgb(red*i,green*i,blue*i)
					if(user.gender==MALE)
						user.icon_state = "guybottom"
						Head.icon_state = "guysplit"
					else
						user.icon_state = "girlbottom"
						Head.icon_state = "girlsplit"
					user.overlays += Head
					user.icon = me
					if(dark!=1)
						user.icon += rgb(red*i,green*i,blue*i)
					else
						user.icon -= rgb(red*i,green*i,blue*i)
					sleep(1)
			else
				for(var/i=times;i>=0;i--)
					Head.icon = H
					if(dark!=1)
						Head.icon += rgb(red*i,green*i,blue*i)
					else
						Head.icon -= rgb(red*i,green*i,blue*i)
					if(user.gender==MALE)
						user.icon_state = "guybottom"
						Head.icon_state = "guysplit"
					else
						user.icon_state = "girlbottom"
						Head.icon_state = "girlsplit"
					user.overlays += Head
					user.icon = me
					if(dark!=1)
						user.icon += rgb(red*i,green*i,blue*i)
					else
						user.icon -= rgb(red*i,green*i,blue*i)
					sleep(1)

		proc/Getexp(user,expgain)
			var/mob/Player/target = user
			if(!target.client)
				return
			if(expgain > 0)
				user << "<b>Exp gain:[expgain]</b>"
			if(target.telekinesis[1] > 0)
				target.telekinesis[2]+=expgain
				if(expgain!=0)
					if(target.telekinesis[2]<1)
						target.telekinesis[2] = 0
			if(target.molecular[1] > 0)
				target.molecular[2]+=expgain
				if(expgain!=0)
					if(target.molecular[2]<1)
						target.molecular[2] = 0
			if(target.premonition[1] > 0)
				target.premonition[2]+=expgain
				if(expgain!=0)
					if(target.premonition[2]<1)
						target.premonition[2] = 0
			if(target.telepathy[1] > 0)
				target.telepathy[2]+=expgain
				if(expgain!=0)
					if(target.telepathy[2]<1)
						target.telepathy[2] = 0
			if(target.summonathame[1] > 0)
				target.summonathame[2]+=expgain
				if(expgain!=0)
					if(target.summonathame[2]<1)
						target.summonathame[2] = 0
			if(target.firestarter[1] > 0)
				target.firestarter[2]+=expgain
				if(expgain!=0)
					if(target.firestarter[2]<1)
						target.firestarter[2] = 0
			if(target.astralproj[1] > 0)
				target.astralproj[2]+=expgain
				if(expgain!=0)
					if(target.astralproj[2]<1)
						target.astralproj[2] = 0
			if(target.inviso[1] > 0)
				target.inviso[2]+=expgain
				if(expgain!=0)
					if(target.inviso[2]<1)
						target.inviso[2] = 0
			target.Levelme(user)
		proc/Revert()
			//make sure old look is the same as new look
			//m.tehrgb = m.origrgb.copy()
			src.tehrgb = src.origrgb.Copy()
			src.skin = src.origskin
			src.hair = src.orighair
			src.name = src.origname
			src.gender = src.origgender
			//ask for shirt color
/*			var/icon/H = new('head.dmi') //new look,head
			var/icon/me = new('bottom.dmi') // new look,body
			//change colour of pants =.=
			var/all = rgb(origrgb[1],origrgb[2],origrgb[3])
			var/darker = rgb(origrgb[1]-50,origrgb[2]-50,origrgb[3]-50)
			var/lighter = rgb(origrgb[1]+50,origrgb[2]+50,origrgb[3]+50)
			me.SwapColor(rgb(0,51,255),all)
			me.SwapColor(rgb(0,0,153),darker)
			me.SwapColor(rgb(0,255,255),lighter)
			H.SwapColor(rgb(0,51,255),all)
			H.SwapColor(rgb(0,0,153),darker)
			H.SwapColor(rgb(0,255,255),lighter)
			//change shirt colour
			all = rgb(origrgb[4],origrgb[5],origrgb[6])
			darker = rgb(origrgb[4]-50,origrgb[5]-50,origrgb[6]-50)
			lighter = rgb(origrgb[4]+50,origrgb[5]+50,origrgb[6]+50)
			me.SwapColor(rgb(255,0,204),all)
			me.SwapColor(rgb(255,0,102),darker)
			me.SwapColor(rgb(255,204,204),lighter)
			H.SwapColor(rgb(255,0,204),all)
			H.SwapColor(rgb(255,0,102),darker)
			H.SwapColor(rgb(255,204,204),lighter)
			//skin!!!
			switch(origskin)
				if("Pale")
					all = rgb(255,204,204)
					darker = rgb(255,221,204)
					lighter = rgb(247,247,247)
				if("Normal")
					all = rgb(252,207,158)
					darker = rgb(252,207,158)
					lighter = rgb(249,208,172)
				if("Tan")
					all = rgb(244,175,113)
					darker = rgb(240,146,60)
					lighter = rgb(247,193,145)
				if("Tanner")
					all = rgb(248,192,144)
					darker = rgb(192,120,64)
					lighter = rgb(252,221,197)
				if("Dark")
					all = rgb(102,51,51)
					darker = rgb(102-50,51-50,51-50)
					lighter = rgb(102+50,51+50,51+50)
				if("Demon")
					all = rgb(demonskin[1],demonskin[2],demonskin[3])
					darker = rgb(demonskin[1]-50,demonskin[2]-50,demonskin[3]-50)
					lighter = rgb(demonskin[3]+50,demonskin[3]+50,demonskin[3]+50)
			me.SwapColor(rgb(255,255,140),all)
			me.SwapColor(rgb(255,132,90),darker)
			me.SwapColor(rgb(247,247,247),lighter)
			H.SwapColor(rgb(255,255,140),all)
			H.SwapColor(rgb(255,132,90),darker)
			H.SwapColor(rgb(247,247,247),lighter)
			switch(orighair)
				if("White")
					all = rgb(213,213,215)
					darker = rgb(189,189,189)
					hair = "White"
				if("Black")
					all = rgb(99,99,99)
					darker = rgb(0,0,0)
					hair = "Black"
				if("Brown")
					all = rgb(177,118,58)
					darker = rgb(145,94,0)
					hair = "Brown"
				if("Blonde")
					all = rgb(255,181,0)
					darker = rgb(145,94,0)
					hair = "Blonde"
				if("Red")
					all = rgb(255,0,0)
					darker = rgb(151,0,0)
					hair = "Red"
			H.SwapColor(rgb(255,181,0),all)
			H.SwapColor(rgb(181,33,0),darker)
			me.SwapColor(rgb(255,181,0),all)
			me.SwapColor(rgb(181,33,0),darker)
			overlays = null
			//now change icon!!
			icon = me
			var/obj/head/Head = new() // new head
			Head.icon = H
			//set the graphics
			if(gender==MALE)
				icon_state = "guybottom"
				Head.icon_state = "guysplit"
				overlays += Head
			else
				icon_state = "girlbottom"
				Head.icon_state = "girlsplit"
				overlays += Head
*/
		proc/tkorb(msg as text)
			var/object = ckey(msg)
			for(var/obj/o in oview())
				var/oname = ckey(o.name)
				if(findtext(oname,object)) //yeah
					if(o.movable==1)
						var/ic = o.icon
						o.movedby = null
						walk(o,0)
						o.frozen = 1
						view() << "\A [o] orbs into [usr]'s hands."
						view() << sound('./sound/orb2.wav',0,0,1,100)
						var/obj/fakeo = new(o.loc)
						fakeo.icon = o.icon
						fakeo.icon_state = o.icon_state
						o.invisibility = 101
						//clone in place, now to effect it
						for(var/i=0;i<10;i++)
							fakeo.icon += rgb (10,10,20)
							sleep(1)
						//coloured it, orb away
						for(var/i=0;i<5;i++)
							fakeo.pixel_y = i*2
							var/icon/look = new(o.icon)
							switch(i)
								if(1)
									look.Blend('./smallorb/orb1.dmi',ICON_AND)
								if(2)
									look.Blend('./smallorb/orb2.dmi',ICON_AND)
								if(3)
									look.Blend('./smallorb/orb3.dmi',ICON_AND)
								if(4)
									look.Blend('./smallorb/orb4.dmi',ICON_AND)
							fakeo.icon = look
							sleep(1)
							del(look)
						del(fakeo)
						o.invisibility = 0
						o.loc = usr
						o.frozen = 0
						o.icon = ic
						break
		proc/helpme()
			switch(class)
				if("Whitelighter")
					var/whattodo = input("Help File","CHARMED",null) in list("How do I level up?","What do I do?","What are my powers?","Cancel")
					switch(whattodo)
						if("How do I level up?")
							alert("Whitelighters do not need to level up.","CHARMED","Ok")
						if("What do I do?")
							alert("You get charges, they call to you when they need help by saying your name with a !.\nBasically, you act as their guardian angel, and try to protect them as much as you can.","CHARMED","Ok")
						if("What are my powers?")
							alert("Orb/Orb Around: A form of teleportation\nUp There: Teleport to heaven\nHeal:Use this, and standing close to someone, click on them to heal them.\nCharge: Offer a witch around you to become his/her whitelighter.\nSense/SenseCharges: Find out their location\nWhitelighter Chat: Talk to other Whitelighters\nWhitelighter Energyball: Use this, and click on the place you want to throw the energyball.")
						else
							return
				if("Darklighter")
					var/whattodo = input("Help File","CHARMED",null) in list("How do I level up?","What do I do?","What are my powers?","Cancel")
					switch(whattodo)
						if("How do I level up?")
							alert("Using conjure bolts and conjure crossbow, kill the npcs running around or other players.","CHARMED","Ok")
						if("What do I do?")
							alert("As a darklighter, your mission is to eradicate Whitelighters and their charges.","CHARMED","Ok")
						if("What are my powers?")
							alert("Orb/Orb Around: A form of teleportation\nTelepathy: Use it on someone, whatever you think, say, shout, or whisper, they can hear and vice versa.\nSuicide thoughts:Use it, and click on the victim. After using it a couple of times, the victim will kill himself/herself.\nTouch of Death: Use it, stand close to someone and click on them. It kills them instantly.\nTracking: Find the location of a whitelighter\nConjure Crossbow/Bolts:Create weapons that you can use.")
						else
							return
				if("Lower Demon")
					var/whattodo = input("Help File","CHARMED",null) in list("How do I level up?","What do I do?","What are my powers?","Cancel")
					switch(whattodo)
						if("How do I level up?")
							alert("For the time being, do what Kelnerth says until you get energyball. Kill innocents as well as other players to get stronger.","CHARMED","Ok")
						if("What do I do?")
							alert("As a demon, you need to kill people and absorb their lifeforce, which you can use to buy more powers. Witches will try to stop you, so you need to get stronger and finish them off.","CHARMED","Ok")
						if("What are my powers?")
							alert("It depends on what you have bought from Alexis, who resides in the MAZE in hell.")
						else
							return
				if("Warlock")
					var/whattodo = input("Help File","CHARMED",null) in list("How do I level up?","What do I do?","What are my powers?","Cancel")
					switch(whattodo)
						if("How do I level up?")
							alert("Kill other players or npc to get stronger in your powers.","CHARMED","Ok")
						if("What do I do?")
							alert("As a warlock, an evil witch, you strive to become stronger so you can become more powerful. When witches use their abilites on you, you gain them temporarily till you log out.","CHARMED","Ok")
						if("What are my powers?")
							alert("Mimicry: Passive ability that lets you copies skills\nWhatever powers you had as a good witch.\nThe ability to reside Warlock spells.","CHARMED","Ok")
						else
							return
				if("Human")
					var/whattodo = input("How do I become a...","CHARMED",null) in list("Witch","Lower Demon","Warlock","Lighters","Cancel")
					switch(whattodo)
						if("Witch")
							alert("You need to purchase a candle from the store, then reside a certain spell from the Book of Shadows.\n\nThe Book of Shadows contains very important information that you can use in various expects.","CHARMED","Ok")
						if("Lower Demon")
							alert("You need to talk to Kelnerth in the top left corner of the field. He will give you a quest to do to become a demon.","CHARMED","Ok")
						if("Warlock")
							alert("An evil witch. Simply become a witch, and turn evil of -40 alignment by killing innocent npcs and good players.","CHARMED","Ok")
						if("Lighters")
							alert("Whitelighter(Guardian Angel): Die as a human with good 20 alignment (kill bad npcs or players)\nDarklighter: Die as a human with bad -20 alignment (kill good npcs or players)","CHARMED","Ok")
						else
							return
				else
					var/whattodo = input("Help File","CHARMED",null) in list("How do I level up?","What do I do?","What are my powers?","Cancel")
					switch(whattodo)
						if("How do I level up?")
							alert("As a witch, you can level up by killing evil npcs/players with athames, or by CREATING SPELLS with the Book of Shadows to kill them.","CHARMED","Ok")
						if("What do I do?")
							alert("Prevent demons from becoming stronger at all costs!","CHARMED","Ok")
						if("What are my powers?")
							alert("There are many witches with different powers. Check the forum for more details.\nGenerally though, you can use a witch's power by first using it, and clicking on the spot you want to use it on.")
						else
							return
			helpme()

		proc/Check_Spell(msg as text)
			msg = ckey(msg)
			if(msg == "shadowsunseenfromtheskiesinthishourofhardshipriseguidemetomydestinywitchingpowersgivetome")
				var/yesno
				for(var/obj/candle in view())
					if(candle.name == "burning candle")
						yesno = 1
						break
				if(class=="Human" && yesno == 1)
					spawn(20)
						Which_Witch()
						damagecounter=damagecounter2
			if(class == "Telekinetic Witch" || class == "Molecular Witch" || class == "Premonition Witch" || class == "Telepath Witch" || class == "Half Whitelighter" || class == "Astral Witch" || class == "Witch" || class == "Invisibility Witch")
				//requires names!
				if(copytext(msg,1,17)=="takethesewordsto")
					var/wherend = findtext(msg,"thewindasmymessenger")
					var/sms
					var/yesno
					for(var/obj/candle in view())
						if(candle.name == "burning candle")
							yesno = 1
							break
					if(wherend && yesno) //yeah, completed spell
						var/whole = copytext(msg,17,wherend)
						//which paper to send to?
						for(var/obj/o in contents)
							if(o.name == "paper")
								sms = "<i><b>[name] has send you a message...</b><br>[o.desc]</i>"
								usr << "You set the paper alight and watch it catch fire."
								oview(usr) << "[usr] sets the paper alight."
								spawn(30)
									oview() << "The paper burns into ashes."
								del(o)
								break
						if(sms==null)
							return
						for(var/mob/Player/m in world)
							var/cname = ckey(m.origname)
							if(cname == whole)
								m << "[sms]"
								//found it
								return

				switch(msg)
					if("inthistimeofimpendingdarknesscomeraincomeshinegrantmestrongerwitchingpowersofgranddivine")
						if(powerofthree[1]!=1 || stamina[2]<100 || class=="Half Whitelighter")
							usr << "You need to be the power of three, and 50 stamina to give away to get a new power. You must not be a half whitelighter."
							return
						//if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch")
						if(secondpower==1)
							usr << "You already have 2 powers."
							return
						var/yesno
						for(var/obj/candle in view())
							if(candle.name == "burning candle")
								yesno = 1
								break
						if(yesno==1)
							Which_Witch2()
							secondpower=1
							stamina[2] -= 50
					if("inthistimeandinthisplacetakemetothedemonsbase")
						if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch" || class=="Witch")
							view()<<"There is a sudden draft, as [usr] is whisked away."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(177,158,1)
							call(usr,/mob/Player/proc/Effects)("summon")

					if("thisplaceifeartakemeawayfromhere")
						if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch" || class=="Witch")
							view()<<"There is a sudden draft, as [usr] is whisked away."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(22,11,1)
							call(usr,/mob/Player/proc/Effects)("summon")
					if("takemehomewithhasteandawayfromthisplace")
						if(moddy==1)
							view()<<"There is a sudden draft, as [usr] is whisked away by the spell."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(15,69,1)
							call(usr,/mob/Player/proc/Effects)("summon")
						else
							usr<<REDCHARM+"Sorry, this is a Moderator spell."
					if("protectourhomefromthosewhomaynotenter")
						if(moddy==1)
							sleep(10)
							for(var/turf/teleporter/Housing/z1/t in view())
								view()<<"A Magical Barrier appears and surrounds the Manor's entrance."
								t.overlays += /obj/effects/sparkle/one
								t.text="lock"
							for(var/turf/teleporter/Housing/z2/Z in view())
								Z.overlays += /obj/effects/sparkle/one
								Z.text="lock"
							for(var/turf/house/city/door1/T in view())
								T.overlays += /obj/effects/sparkle/one
					if("openourhome")
						if(moddy==1)
							sleep(10)
							for(var/turf/teleporter/Housing/z1/t in view())
								view()<<"The barrier around the Manor fades."
								t.overlays -= /obj/effects/sparkle/one
								t.text= null
							for(var/turf/teleporter/Housing/z2/Z in view())
								Z.overlays -= /obj/effects/sparkle/one
								Z.text= null
							for(var/turf/house/city/door1/T in view())
								T.overlays -= /obj/effects/sparkle/one



							//icon = 'chipset.dmi'
							//icon_state = "road"

					if("takemehomewherefromothersihide")
						if(moddy==1)
							view()<<"There is a sudden draft, as [usr] is whisked away by the spell."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(155,10,1)
							call(usr,/mob/Player/proc/Effects)("summon")
						else
							usr<<REDCHARM+"Sorry, this is a Moderator spell."

					if("thepowerofthreewecalluponnowtohelpinanywayitknowshowinthisdaywecallupontheetomakeuswitchesthepowerofthree")
						if(stamina[1]>=100 && powerofthree[1]==0) //not charmed, and enough stam
							stamina[1] -= 100
							spelled = "powerofthree"
							spawn(600)
								spelled = ""
							var/three = 0
							for(var/mob/Player/M in oview())
								var/t = three + 2
								if(M.spelled == "powerofthree")
									powerofthree[t] = M
									three++
									if(three==2)
										//enough!
										world << "<b>[usr],[powerofthree[2]],[powerofthree[3]] are now the power of three!</b>"
										var/mob/Player/c1 = src.powerofthree[2]
										var/mob/Player/c2 = src.powerofthree[3]

										src.powerofthree[1] = 1
										c1.powerofthree[1] = 1
										c2.powerofthree[1] = 1

										c1.powerofthree[2] = name
										c1.powerofthree[3] = c2.name
										c2.powerofthree[2] = name
										c2.powerofthree[3] = c1.name
										src.powerofthree[2] = c1.name
										src.powerofthree[3] = c2.name
										src.damagecounter2 += 2
										c1.damagecounter2 += 2
										c2.damagecounter2 += 2
										spelled = ""
					if("callingsherecallingsthereinthisroomsobareinthisdayinthishourisummonawhitelighterwithmypower")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							sleep(20)
							for(var/mob/Player/M in world)
								if(M.class == "Whitelighter" && M.death!=1 && M.client)
									var/yesno = alert(M,"Someone is trying to summon a whitelighter, answer?","CHARMED","Answer","Ignore")
									if(yesno == "Answer")
										call(M,/mob/Player/proc/Effects)("Orb2")
										switch(dir)
											if(NORTH)
												M.loc = locate(x,y+1,z)
											if(SOUTH)
												M.loc = locate(x,y-1,z)
											if(EAST)
												M.loc = locate(x+1,y,z)
											if(WEST)
												M.loc = locate(x-1,y,z)
											else
												M.loc = locate(x,y,z)
										call(M,/mob/Player/proc/Effects)("Orb")
					if("isummonaghastisummonitherecometomeandsettlehere")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							sleep(20)
							for(var/mob/Player/M in world)
								if(M.name == "Ghast" && M.class == "spirit")
									switch(dir)
										if(NORTH)
											M.loc = locate(x,y+1,z)
										if(SOUTH)
											M.loc = locate(x,y-1,z)
										if(EAST)
											M.loc = locate(x+1,y,z)
										if(WEST)
											M.loc = locate(x-1,y,z)
										else
											M.loc = locate(x,y,z)
									M.stun = 1
									oview(M) << "A surprised Ghast was summoned."
									M.stun = 0
//									break
					if("icastthisspelltohelptheeovercomeyourdestinyloseyourpowersloseyourgiftloseyoursoulforevermoreyoushallhavenopowersanymore")
						if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch")

							if(stamina[1]>=length(msg))
								stamina[1] -= length(msg)
								var/list/target = new()
								for(var/mob/Player/m in oview())
									if(m.client)
										target += m
								target += "Cancel"
								var/mob/Player/who = input("Who to cast the spell on?","CHARMED",null) in target
								if(target!="Cancel")
									usr << "You cast the spell to remove [who]'s powers, it's now their choice whether or not to lose their powers."
									who << "Your body tingle as the spell takes effect, are you willing to <a href=?giveupmypower>give up your powers</a>?"
									var/ans = alert(who,"[usr] has cast a power-binding spell on you. Give up your powers and become a Human?","CHARMED","Yes","No")
									if(ans == "Yes")
										who.verbs -= typesof(/mob/Player/Powers/verb)
										who.class = "Human"
										call(who,/mob/Player/proc/Fade)(who,20,20,40,10,0,"Orb2",ICON_SUBTRACT)
										view()<<"There is a sudden draft, as [who]'s powers leave their body forever."
									if(ans == "No")
										usr<<REDCHARM+"[who] decides not to bind their powers."
										who<<"You chose not to bind your powers."
					if("yourdeedshavenotbeenkindyourpowersiwillnowbind")
						if(moddy==1)
							if(stamina[1]>=length(msg))
								stamina[1] -= length(msg)
								var/list/target = new()
								for(var/mob/Player/m in oview())
									if(m.client)
										target += m
								target += "Cancel"
								var/mob/Player/who = input("Who to cast the spell on?","CHARMED",null) in target
								if(target!="Cancel")
									var/ans = alert(usr,"Are you sure you wish to bind [who]'s powers forever and turn them into a Human?","CHARMED","Yes","No")
									if(ans == "Yes")
										who << "Your body tingle as the spell takes effect. You feel a sudden shock of tiredness as each power leaves your body one by one."
										sleep(20)
										who.verbs -= typesof(/mob/Player/Powers/verb)
										who.class = "Human"
										call(who,/mob/Player/proc/Fade)(who,20,20,40,10,0,"Orb",ICON_SUBTRACT)
										view()<<"[usr] waves his hand, and [who]'s powers are binded forever."
										sleep(30)
										who<<REDCHARM+"<b>You are now a Human."
										who.alignment=0
										who.text = null
										who.Saveme()
									if(ans == "No")
										return
										who<<REDCHARM+"<b>[usr]</b> changed their mind and decided not to bind your powers."
						else
							usr<<REDCHARM+"<b>You cannot cast this spell."
							return
					if("ashestoashesspirittospirittakethissoulbanishthisevilwithharmtonone" || "withthisspellitakeyouawayleavenowtothespiritrealmicommandthee")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							for(var/mob/Player/m in view())
								if(m.name == "Ghast")
									view() << "[usr]'s spell takes effect, vanquishing the restless spirit."
									m.damagecounter = 0
									var/exp = call(usr,/mob/Player/proc/Deathcheck)(m, usr)
									call(usr,/mob/Player/proc/Getexp)(usr,exp)
									break
					if("awitchwithpowersiswhatiambutthesepowershavemeinajamsohearmecryinthisdarkhourandgivemeanewsetofpowers")
						if(stamina[1]>=length(msg) && class!="Half Whitelighter")
							stamina[1] -= length(msg)
							astralproj[1] = 0
							astralproj[2] = 0
							astralproj[3] = 0
							telekinesis[1] = 0
							telekinesis[2] = 0
							telekinesis[3] = 0
							molecular[1] = 0
							molecular[2] = 0
							molecular[3] = 0
							premonition[1] = 0
							premonition[2] = 0
							premonition[3] = 0
							telepathy[1] = 0
							telepathy[2] = 0
							telepathy[3] = 0
							verbs -= /mob/Player/Powers/verb/Telekinesis
							verbs -= /mob/Player/Powers/verb/Telekinetic_Towards
							verbs -= /mob/Player/Powers/verb/Telekinetic_Repel
							verbs -= /mob/Player/Powers/verb/Temporal_Stasis_One
							verbs -= /mob/Player/Powers/verb/Temporal_Stasis
							verbs -= /mob/Player/Powers/verb/Premonition
							verbs -= /mob/Player/Powers/verb/Force_Premonition
							verbs -= /mob/Player/Powers/verb/Interrupt_Premonition
							verbs -= /mob/Player/Powers/verb/Electro_Mental_Ignitions
							verbs -= /mob/Player/Powers/verb/Read_Mind
							verbs -= /mob/Player/Powers/verb/Clear_Thoughts
							verbs -= /mob/Player/Powers/verb/Mass_Read
							verbs -= /mob/Player/Powers/verb/Astral_Projection
							usr << "You give up your powers, and wait for the new ones to descend into your body."
							sleep(20)
							Which_Witch()
							Saveme()
					if("icallthebookofshadowscometomeandsettlehere")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							sleep(20)
							for(var/obj/Book_of_Shadows)
								if(Book_of_Shadows.name=="Book of Shadows"||Book_of_Shadows.name=="Book of Shadows_")
									switch(dir)
										if(NORTH)
											Book_of_Shadows.loc = locate(x,y+1,z)
										if(SOUTH)
											Book_of_Shadows.loc = locate(x,y-1,z)
										if(EAST)
											Book_of_Shadows.loc = locate(x+1,y,z)
										if(WEST)
											Book_of_Shadows.loc = locate(x-1,y,z)

										else
											Book_of_Shadows.loc = locate(x,y,z)
									oview(Book_of_Shadows) << "[usr] has summoned the Book of Shadows."

							//else
							//	return
							//	usr<<REDCHARM+"This spell can only be said by Moderators."
					if("fromwhenceiwasborniwascreatedichangenowtomakefornowiassendedmakemenowicommand")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							usr << "You feel strangely different..."
							if(origgender==FEMALE)
								gender = MALE
								origgender = MALE
							else
								gender = FEMALE
								origgender = FEMALE
							Setme()
					if("ohgreateldershearmycryinmybodyiswherelightshouldlyealthoughmyalignmentcouldbelightergrantmethepowersofawhitelighter")
						if(stamina[1]>=length(msg))
							telekinesis[1] = 0
							telekinesis[2] = 0
							telekinesis[3] = 0
							molecular[1] = 0
							molecular[2] = 0
							molecular[3] = 0
							premonition[1] = 0
							premonition[2] = 0
							premonition[3] = 0
							telepathy[1] = 0
							telepathy[2] = 0
							telepathy[3] = 0
							stamina[1] -= length(msg)
							var/success = rand(3,10)
							if(success == 2 && alignment >= 50)
								usr << "Your witching ways vanishes when the elders hear your plea, and decided to turn you into a whitelighter."
								usr << "You have to relog for the new changes to take effect."
								class = "Whitelighter"
								Levelme(usr)
								damagecounter2 = 3
								damagecounter = 3
								Saveme()
								del(usr)
					else
						var
							cost //stamina needed
							pthree //power of three required?
							type //summoning, vanquishing?
							spellshrunk //the ckey of the spell
							candle //candle required?
							approved //approved by mod yet?
							affectwho
							affectarea
							spellfound
						var/mob/Player/me = usr
						var/savefile/bos = new("./bos/spell.sav")
						bos.cd = "/"
						if(bos.dir.Find("[msg]"))
							spellfound = 1
						if(spellfound==null)
							return
						bos["/[msg]/approved"] >> approved
						if(approved=="Not Approved")
							usr << "This spell has not been approved by a moderator yet."
							return
						bos["/[msg]/cost"] >> cost
						if(me.stamina[1]<cost)
							usr << "Not enough stamina. This spell requires [cost] to cast."
							return
						me.stamina[1] -= cost
						bos["/[msg]/pthree"] >> pthree
						bos["/[msg]/candle"] >> candle
						bos["/[msg]/affectwho"] >> affectwho
						bos["/[msg]/affectarea"] >> affectarea
						bos["/[msg]/type"] >> type

						//2 conditions, candles, p3 fulfilled?
						var/condition
						//does it require the power of three?
						spelled = "[spellshrunk]"
						spawn(600)
							if(spelled == "[spellshrunk]")
								spelled = null

						if(pthree=="Yes") //needed
							var/three = 0
							for(var/mob/Player/M in oview())
								if(M.spelled == spelled) //casting the same spell as I am!
									three++
									if(three==2)
										condition=1
										//three spellcasters found! sucess!
						else
							condition = 1
						if(condition<1)
							return
						condition = 0

						if(candle=="Yes")
							for(var/obj/c in oview())
								if(c.name == "burning candle")
									condition = 1
						else
							condition = 1
						if(condition<1)
							usr << "You don't have a candle in sight."
							return

						//success, on with the spell
						var/mob/Player/target
						switch(affectarea)
							if("Yourself")
								target = usr
							if("Those Around You")
								var/list/targets = new()
								for(var/mob/Player/Around in oview())
									targets += Around
								target = input("Who do you want the spell to target?","CHARMED",null) in targets
							if("Someone")
								for(var/mob/Player/Around in world)
									if(Around.name == affectwho)
										target = Around
							if("Someone (Must be In Sight)")
								for(var/mob/Player/Around in oview())
									if(Around.name == affectwho)
										target = Around
						if(target==null)
							return
						switch(type)
							if("Summon")
								if(target.death==1)
									usr << "[target] is by death's side, and may not be summoned."
								if(target==usr)
									usr << "Can't summon yourself."
								else
									usr << "You try to summon [target]."

									switch(me.dir)
										if(NORTH)
											target.loc = locate(me.x,me.y+1,me.z)
										if(SOUTH)
											target.loc = locate(me.x,me.y-1,me.z)
										if(EAST)
											target.loc = locate(me.x+1,me.y,me.z)
										if(WEST)
											target.loc = locate(me.x-1,me.y,me.z)
										else
											target.loc = locate(me.x,me.y,me.z)
									target << "You have been summoned."
							if("Vanquish")
								oview(usr) << "The spell takes effect, vanquishing [target]."
								target.damagecounter=0
								var/exp = call(/mob/Player/proc/Deathcheck)(target, usr)
								for(var/mob/Player/M in oview())
									if(M.spelled == spelled)
										call(/mob/Player/proc/Getexp)(M,exp)
		proc/Check_Spell2(msg as text)
			msg = ckey(msg)
			if(msg == "shadowsunseenfromtheskiesinthishourofhardshipriseguidemetomydestinywitchingpowersgivetome")
				var/yesno
				for(var/obj/candle in view())
					if(candle.name == "burning candle")
						yesno = 1
						break
				if(class=="Human" && yesno == 1)
					spawn(20)
						Which_Witch()
						damagecounter=damagecounter2
			if(class == "Telekinetic Witch" || class == "Molecular Witch" || class == "Premonition Witch" || class == "Telepath Witch" || class == "Half Whitelighter" || class == "Astral Witch" || class == "Witch" || class == "Invisibility Witch")
				//requires names!
				if(copytext(msg,1,17)=="takethesewordsto")
					var/wherend = findtext(msg,"thewindasmymessenger")
					var/sms
					var/yesno
					for(var/obj/candle in view())
						if(candle.name == "burning candle")
							yesno = 1
							break
					if(wherend && yesno) //yeah, completed spell
						var/whole = copytext(msg,17,wherend)
						//which paper to send to?
						for(var/obj/o in contents)
							if(o.name == "paper")
								sms = "<i><b>[name] has send you a message...</b><br>[o.desc]</i>"
								usr << "You set the paper alight and watch it catch fire."
								oview(usr) << "[usr] sets the paper alight."
								spawn(30)
									oview() << "The paper burns into ashes."
								del(o)
								break
						if(sms==null)
							return
						for(var/mob/Player/m in world)
							var/cname = ckey(m.origname)
							if(cname == whole)
								m << "[sms]"
								//found it
								return

				switch(msg)
					if("inthistimeofimpendingdarknesscomeraincomeshinegrantmestrongerwitchingpowersofgranddivine")
						if(powerofthree[1]!=1 || stamina[2]<100 || class=="Half Whitelighter")
							usr << "You need to be the power of three, and 50 stamina to give away to get a new power. You must not be a half whitelighter."
							return
						//if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch")
						if(secondpower==1)
							usr << "You already have 2 powers."
							return
						var/yesno
						for(var/obj/candle in view())
							if(candle.name == "burning candle")
								yesno = 1
								break
						if(yesno==1)
							Which_Witch2()
							secondpower=1
							stamina[2] -= 50
					if("inthistimeandinthisplacetakemetothedemonsbase")
						if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch" || class=="Witch")
							view()<<"There is a sudden draft, as [usr] is whisked away."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(177,158,1)
							call(usr,/mob/Player/proc/Effects)("summon")

					if("thisplaceifeartakemeawayfromhere")
						if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch" || class=="Witch")
							view()<<"There is a sudden draft, as [usr] is whisked away."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(22,11,1)
							call(usr,/mob/Player/proc/Effects)("summon")
					if("takemehomewithhasteandawayfromthisplace")
						if(moddy==1)
							view()<<"There is a sudden draft, as [usr] is whisked away by the spell."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(15,69,1)
							call(usr,/mob/Player/proc/Effects)("summon")
						else
							usr<<REDCHARM+"Sorry, this is a Moderator spell."
					if("takemefromthisrealityandtoeternity")
						if(moddy==1)
							view()<<"There is a sudden draft, as [usr] is whisked away by the spell."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(155,10,1)
							call(usr,/mob/Player/proc/Effects)("summon")
						else
							usr<<REDCHARM+"Sorry, this is a Moderator spell."
					if("protectourhomefromthosewhomaynotenter")
						if(moddy==1)
							sleep(10)
							for(var/turf/teleporter/Housing/z1/t in view())
								view()<<"A Magical Barrier appears and surrounds the Manor's entrance."
								t.overlays += /obj/effects/sparkle/one
								t.text="lock"
							for(var/turf/teleporter/Housing/z2/Z in view())
								Z.overlays += /obj/effects/sparkle/one
								Z.text="lock"
							for(var/turf/house/city/door1/T in view())
								T.overlays += /obj/effects/sparkle/one
					if("openourhome")
						if(moddy==1)
							sleep(10)
							for(var/turf/teleporter/Housing/z1/t in view())
								view()<<"The barrier around the Manor fades."
								t.overlays -= /obj/effects/sparkle/one
								t.text= null
							for(var/turf/teleporter/Housing/z2/Z in view())
								Z.overlays -= /obj/effects/sparkle/one
								Z.text= null
							for(var/turf/house/city/door1/T in view())
								T.overlays -= /obj/effects/sparkle/one



							//icon = 'chipset.dmi'
							//icon_state = "road"

					if("takemeinsidewherefromothersihide")
						if(moddy==1)
							view()<<"There is a sudden draft, as [usr] is whisked away by the spell."
							call(usr,/mob/Player/proc/Effects)("summon")
							sleep(10)
							usr.loc = locate(155,10,1)
							call(usr,/mob/Player/proc/Effects)("summon")
						else
							usr<<REDCHARM+"Sorry, this is a Moderator spell."

					if("thepowerofthreewecalluponnowtohelpinanywayitknowshowinthisdaywecallupontheetomakeuswitchesthepowerofthree")
						if(stamina[1]>=100 && powerofthree[1]==0) //not charmed, and enough stam
							stamina[1] -= 100
							spelled = "powerofthree"
							spawn(600)
								spelled = ""
							var/three = 0
							for(var/mob/Player/M in oview())
								var/t = three + 2
								if(M.spelled == "powerofthree")
									powerofthree[t] = M
									three++
									if(three==2)
										//enough!
										view() << "<b>[usr],[powerofthree[2]],[powerofthree[3]] are now the power of three!</b>"
										var/mob/Player/c1 = src.powerofthree[2]
										var/mob/Player/c2 = src.powerofthree[3]

										src.powerofthree[1] = 1
										c1.powerofthree[1] = 1
										c2.powerofthree[1] = 1

										c1.powerofthree[2] = name
										c1.powerofthree[3] = c2.name
										c2.powerofthree[2] = name
										c2.powerofthree[3] = c1.name
										src.powerofthree[2] = c1.name
										src.powerofthree[3] = c2.name
										src.damagecounter2 += 2
										c1.damagecounter2 += 2
										c2.damagecounter2 += 2
										spelled = ""
					if("callingsherecallingsthereinthisroomsobareinthisdayinthishourisummonawhitelighterwithmypower")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							sleep(20)
							for(var/mob/Player/M in world)
								if(M.class == "Whitelighter" && M.death!=1 && M.client)
									var/yesno = alert(M,"Someone is trying to summon a whitelighter, answer?","CHARMED","Answer","Ignore")
									if(yesno == "Answer")
										call(M,/mob/Player/proc/Effects)("Orb2")
										switch(dir)
											if(NORTH)
												M.loc = locate(x,y+1,z)
											if(SOUTH)
												M.loc = locate(x,y-1,z)
											if(EAST)
												M.loc = locate(x+1,y,z)
											if(WEST)
												M.loc = locate(x-1,y,z)
											else
												M.loc = locate(x,y,z)
										call(M,/mob/Player/proc/Effects)("Orb")
					if("isummonaghastisummonitherecometomeandsettlehere")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							sleep(20)
							for(var/mob/Player/M in world)
								if(M.name == "Ghast" && M.class == "spirit")
									switch(dir)
										if(NORTH)
											M.loc = locate(x,y+1,z)
										if(SOUTH)
											M.loc = locate(x,y-1,z)
										if(EAST)
											M.loc = locate(x+1,y,z)
										if(WEST)
											M.loc = locate(x-1,y,z)
										else
											M.loc = locate(x,y,z)
									M.stun = 1
									oview(M) << "A surprised Ghast was summoned."
									M.stun = 0
//									break
					if("icastthisspelltohelptheeovercomeyourdestinyloseyourpowersloseyourgiftloseyoursoulforevermoreyoushallhavenopowersanymore")
						if(class=="Preminition Witch" || class=="Telepath Witch" || class=="Telekinetic Witch" || class=="Astral Witch" || class=="Invisibility Witch")

							if(stamina[1]>=length(msg))
								stamina[1] -= length(msg)
								var/list/target = new()
								for(var/mob/Player/m in oview())
									if(m.client)
										target += m
								target += "Cancel"
								var/mob/Player/who = input("Who to cast the spell on?","CHARMED",null) in target
								if(target!="Cancel")
									usr << "You cast the spell to remove [who]'s powers, it's now their choice whether or not to lose their powers."
									who << "Your body tingle as the spell takes effect, are you willing to <a href=?giveupmypower>give up your powers</a>?"
									var/ans = alert(who,"[usr] has cast a power-binding spell on you. Give up your powers and become a Human?","CHARMED","Yes","No")
									if(ans == "Yes")
										who.verbs -= typesof(/mob/Player/Powers/verb)
										who.class = "Human"
										call(who,/mob/Player/proc/Fade)(who,20,20,40,10,0,"Orb2",ICON_SUBTRACT)
										view()<<"There is a sudden draft, as [who]'s powers leave their body forever."
									if(ans == "No")
										usr<<REDCHARM+"[who] decides not to bind their powers."
										who<<"You chose not to bind your powers."
					if("yourdeedshavenotbeenkindyourpowersiwillnowbind")
						if(src.moddy==1)
							if(stamina[1]>=length(msg))
								stamina[1] -= length(msg)
								var/list/target = new()
								for(var/mob/Player/m in oview())
									if(m.client)
										target += m
								target += "Cancel"
								var/mob/Player/who = input("Who to cast the spell on?","CHARMED",null) in target
								if(target!="Cancel")
									var/ans = alert(usr,"Are you sure you wish to bind [who]'s powers forever and turn them into a Human?","CHARMED","Yes","No")
									if(ans == "Yes")
										who << "Your body tingle as the spell takes effect. You feel a sudden shock of tiredness as each power leaves your body one by one."
										sleep(20)
										who.verbs -= typesof(/mob/Player/Powers/verb)
										who.class = "Human"
										call(who,/mob/Player/proc/Fade)(who,20,20,40,10,0,"Orb",ICON_SUBTRACT)
										view()<<"[usr] waves his hand, and [who]'s powers are binded forever."
										sleep(30)
										who<<REDCHARM+"<b>You are now a Human."
										who.alignment=0
										who.Saveme()
									if(ans == "No")
										return
										who<<REDCHARM+"<b>[usr]</b> changed their mind and decided not to bind your powers."
						else
							usr<<REDCHARM+"<b>You cannot cast this spell."
							return
					if("ashestoashesspirittospirittakethissoulbanishthisevilwithharmtonone" || "withthisspellitakeyouawayleavenowtothespiritrealmicommandthee")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							for(var/mob/Player/m in view())
								if(m.name == "Ghast")
									view() << "[usr]'s spell takes effect, vanquishing the restless spirit."
									m.damagecounter = 0
									var/exp = call(usr,/mob/Player/proc/Deathcheck)(m, usr)
									call(usr,/mob/Player/proc/Getexp)(usr,exp)
									break
					if("awitchwithpowersiswhatiambutthesepowershavemeinajamsohearmecryinthisdarkhourandgivemeanewsetofpowers")
						if(stamina[1]>=length(msg) && class!="Half Whitelighter")
							stamina[1] -= length(msg)
							astralproj[1] = 0
							astralproj[2] = 0
							astralproj[3] = 0
							telekinesis[1] = 0
							telekinesis[2] = 0
							telekinesis[3] = 0
							molecular[1] = 0
							molecular[2] = 0
							molecular[3] = 0
							premonition[1] = 0
							premonition[2] = 0
							premonition[3] = 0
							telepathy[1] = 0
							telepathy[2] = 0
							telepathy[3] = 0
							verbs -= /mob/Player/Powers/verb/Telekinesis
							verbs -= /mob/Player/Powers/verb/Telekinetic_Towards
							verbs -= /mob/Player/Powers/verb/Telekinetic_Repel
							verbs -= /mob/Player/Powers/verb/Temporal_Stasis_One
							verbs -= /mob/Player/Powers/verb/Temporal_Stasis
							verbs -= /mob/Player/Powers/verb/Premonition
							verbs -= /mob/Player/Powers/verb/Force_Premonition
							verbs -= /mob/Player/Powers/verb/Interrupt_Premonition
							verbs -= /mob/Player/Powers/verb/Electro_Mental_Ignitions
							verbs -= /mob/Player/Powers/verb/Read_Mind
							verbs -= /mob/Player/Powers/verb/Clear_Thoughts
							verbs -= /mob/Player/Powers/verb/Mass_Read
							verbs -= /mob/Player/Powers/verb/Astral_Projection
							usr << "You give up your powers, and wait for the new ones to descend into your body."
							Which_Witch()
							Saveme()
					if("icallthebookofshadowscometomeandsettlehere")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							sleep(20)
							for(var/obj/Book_of_Shadows)
								if(Book_of_Shadows.name=="Book of Shadows"||Book_of_Shadows.name=="Book of Shadows_")
									switch(dir)
										if(NORTH)
											Book_of_Shadows.loc = locate(x,y+1,z)
										if(SOUTH)
											Book_of_Shadows.loc = locate(x,y-1,z)
										if(EAST)
											Book_of_Shadows.loc = locate(x+1,y,z)
										if(WEST)
											Book_of_Shadows.loc = locate(x-1,y,z)

										else
											Book_of_Shadows.loc = locate(x,y,z)
									oview(Book_of_Shadows) << "[usr] has summoned the Book of Shadows."

							//else
							//	return
							//	usr<<REDCHARM+"This spell can only be said by Moderators."
					if("fromwhenceiwasborniwascreatedichangenowtomakefornowiassendedmakemenowicommand")
						if(stamina[1]>=length(msg))
							stamina[1] -= length(msg)
							usr << "You feel strangely different..."
							if(origgender==FEMALE)
								gender = MALE
								origgender = MALE
							else
								gender = FEMALE
								origgender = FEMALE
							Setme()
					if("ohgreateldershearmycryinmybodyiswherelightshouldlyealthoughmyalignmentcouldbelightergrantmethepowersofawhitelighter")
						if(stamina[1]>=length(msg))
							telekinesis[1] = 0
							telekinesis[2] = 0
							telekinesis[3] = 0
							molecular[1] = 0
							molecular[2] = 0
							molecular[3] = 0
							premonition[1] = 0
							premonition[2] = 0
							premonition[3] = 0
							telepathy[1] = 0
							telepathy[2] = 0
							telepathy[3] = 0
							stamina[1] -= length(msg)
							var/success = rand(3,10)
							if(success == 2 && alignment >= 50)
								usr << "Your witching ways vanishes when the elders hear your plea, and decided to turn you into a whitelighter."
								usr << "You have to relog for the new changes to take effect."
								class = "Whitelighter"
								Levelme(usr)
								damagecounter2 = 3
								damagecounter = 3
								Saveme()
								del(usr)
					else
						var
							cost //stamina needed
							pthree //power of three required?
							type //summoning, vanquishing?
							spellshrunk //the ckey of the spell
							candle //candle required?
							approved //approved by mod yet?
							affectwho
							affectarea
							spellfound
						var/mob/Player/me = usr
						var/savefile/bos = new("./bos/GMspell.sav")
						bos.cd = "/"
						if(bos.dir.Find("[msg]"))
							spellfound = 1
						if(spellfound==null)
							return
						bos["/[msg]/approved"] >> approved
						if(approved=="Not Approved")
							usr << "This spell has not been approved by a moderator yet."
							return
						bos["/[msg]/cost"] >> cost
						if(me.stamina[1]<cost)
							usr << "Not enough stamina. This spell requires [cost] to cast."
							return
						me.stamina[1] -= cost
						bos["/[msg]/pthree"] >> pthree
						bos["/[msg]/candle"] >> candle
						bos["/[msg]/affectwho"] >> affectwho
						bos["/[msg]/affectarea"] >> affectarea
						bos["/[msg]/type"] >> type

						//2 conditions, candles, p3 fulfilled?
						var/condition
						//does it require the power of three?
						spelled = "[spellshrunk]"
						spawn(600)
							if(spelled == "[spellshrunk]")
								spelled = null

						if(pthree=="Yes") //needed
							var/three = 0
							for(var/mob/Player/M in oview())
								if(M.spelled == spelled) //casting the same spell as I am!
									three++
									if(three==2)
										condition=1
										//three spellcasters found! sucess!
						else
							condition = 1
						if(condition<1)
							return
						condition = 0

						if(candle=="Yes")
							for(var/obj/c in oview())
								if(c.name == "burning candle")
									condition = 1
						else
							condition = 1
						if(condition<1)
							usr << "You don't have a candle in sight."
							return

						//success, on with the spell
						var/mob/Player/target
						switch(affectarea)
							if("Yourself")
								target = usr
							if("Those Around You")
								var/list/targets = new()
								for(var/mob/Player/Around in oview())
									targets += Around
								target = input("Who do you want the spell to target?","CHARMED",null) in targets
							if("Someone")
								for(var/mob/Player/Around in world)
									if(Around.name == affectwho)
										target = Around
							if("Someone (Must be In Sight)")
								for(var/mob/Player/Around in oview())
									if(Around.name == affectwho)
										target = Around
						if(target==null)
							return
						switch(type)
							if("Summon")
								if(target.death==1)
									usr << "[target] is by death's side, and may not be summoned."
								if(target==usr)
									usr << "Can't summon yourself."
								else
									usr << "You try to summon [target]."

									switch(me.dir)
										if(NORTH)
											target.loc = locate(me.x,me.y+1,me.z)
										if(SOUTH)
											target.loc = locate(me.x,me.y-1,me.z)
										if(EAST)
											target.loc = locate(me.x+1,me.y,me.z)
										if(WEST)
											target.loc = locate(me.x-1,me.y,me.z)
										else
											target.loc = locate(me.x,me.y,me.z)
									target << "You have been summoned."
							if("Vanquish")
								oview(usr) << "The spell takes effect, vanquishing [target]."
								target.damagecounter=0
								var/exp = call(/mob/Player/proc/Deathcheck)(target, usr)
								for(var/mob/Player/M in oview())
									if(M.spelled == spelled)
										call(/mob/Player/proc/Getexp)(M,exp)
		proc/Check_White(msg as text)
			if(msg == "[whitelighter]!")
				for(var/mob/Player/m in world)
					if(m.origname == whitelighter)
						m << "<i>You can hear [usr]'s distance voice calling out to you.</i>"
						var/ans = alert(m,"Answer call?","CHARMED","Yes","No")
						if(ans=="Yes")
							call(m,/mob/Player/proc/Effects)("Orb2")
							m.loc = usr.loc
							m.overlays = null
							call(m,/mob/Player/proc/Effects)("Orb")
							m.control = 0
							m.location = location
							m.orb = 0
		proc/Which_Witch2()
			var/which = rand(1,6)
			for(var/i=0;i<5;i++)
				client.eye = null
				sleep(1)
				client.eye = usr
				sleep(1)
			switch(which)
				if(1)
					if(src.telekinesis[1]>=1)
						src << "Maybe you should try the spell another time."
						return
					src.telekinesis[1] = 1
					src.telekinesis[2] = 0
					src.telekinesis[3] = expneeded[src.telekinesis[1]]
					src.class="Telekinetic Witch"
					src.verbs += /mob/Player/Powers/verb/Telekinetic_Repel
					src.verbs += /mob/Player/Powers/verb/Levitate
					src.Unlock(ckey,"Telekinetic Witch")
					src.Memory(src,"[src] becoming a witch.")
					src << "<i>You can now use Telekinetic Repel.</i>"
					src << "<i>You can now Levitate.</i>"
				if(2)
					if(src.molecular[1]>=1)
						src << "Maybe you should try the spell another time."
						return
					src.molecular[1] = 1
					src.molecular[2] = 0
					src.molecular[3] = expneeded[src.molecular[1]]
					src.class = "Molecular Witch"
					src.verbs += /mob/Player/Powers/verb/Temporal_Stasis_One
					src.Unlock(ckey,"Molecular Witch")
					src.Memory(src,"[src] becoming a witch.")
					src << "<i>You can now use Temporal Stasis Individual.</i>"
				if(3)
					if(src.premonition[1]>=1)
						src << "Maybe you should try the spell another time."
						return
					src.premonition[1] = 1
					src.premonition[2] = 0
					src.premonition[3] = expneeded[src.premonition[1]]
					src.class = "Premonition Witch"
					src.Unlock(ckey,"Premonition Witch")
					src.Memory(src,"[src] becoming a witch.")
					src << "<i>You now have the ability of clairvoyance.</i>"
					src.verbs += /mob/Player/Powers/verb/Premonition
				if(4)
					if(src.telepathy[1]>=1)
						src << "Maybe you should try the spell another time."
						return
					src.telepathy[1] = 1
					src.telepathy[2] = 0
					src.telepathy[3] = expneeded[src.telepathy[1]]
					src.class = "Telepath Witch"
					src.Unlock(ckey,"Telepath Witch")
					src.Memory(src,"[src] becoming a witch.")
					src << "<i>You can now Read Minds.</i>"
					src.verbs += /mob/Player/Powers/verb/Read_Mind
				if(5)
					if(src.astralproj[1]>=1)
						src << "Maybe you should try the spell another time."
						return
					src.astralproj[1] = 1
					src.astralproj[2] = 0
					src.astralproj[3] = expneeded[src.astralproj[1]]
					src.class="Astral Witch"
					src.verbs += /mob/Player/Powers/verb/Astral_Projection
					src.Unlock(ckey,"Astral Witch")
					src.Memory(src,"[src] becoming a witch.")
					src << "<i>You can now use Astral Projection.</i>"
				if(6)
					if(src.inviso[1]>=1)
						src << "Maybe you should try the spell another time."
						return
					src.inviso[1] = 1
					src.inviso[2] = 0
					src.inviso[3] = expneeded[src.inviso[1]]
					src.class="Invisibility Witch"
					src.verbs += /mob/Player/Powers/verb/Cloaking
					src.Unlock(ckey,"Invisibility Witch")
					src.Memory(src,"[src] becoming a witch.")
					src << "<i>You can now use Cloaking.</i>"
			src << "The air around you picks up its pace..."
			src.class = "Witch"
			src << "<i>You are now a [class].</i>"
			var/lighter = CheckUnlock(ckey, "Whitelighter")
			if(lighter)
				Unlock(ckey,"Half Whitelighter")
				usr << "Half Whitelighter unlocked."
		proc/Which_Witch()
			var/which = rand(1,6)
			for(var/i=0;i<5;i++)
				client.eye = null
				sleep(1)
				client.eye = usr
				sleep(1)
			switch(which)
				if(1)
					telekinesis[1] = 1
					telekinesis[2] = 0
					telekinesis[3] = expneeded[telekinesis[1]]
					class="Telekinetic Witch"
					verbs += /mob/Player/Powers/verb/Telekinetic_Repel
					verbs += /mob/Player/Powers/verb/Levitate
					Unlock(ckey,"Telekinetic Witch")
					Memory(usr,"[usr] becoming a witch.")
					usr << "<i>You can now use Telekinetic Repel.</i>"
				if(2)
					molecular[1] = 1
					molecular[2] = 0
					molecular[3] = expneeded[molecular[1]]
					class = "Molecular Witch"
					verbs += /mob/Player/Powers/verb/Temporal_Stasis_One
					Unlock(ckey,"Molecular Witch")
					Memory(usr,"[usr] becoming a witch.")
					usr << "<i>You can now use Temporal Stasis Individual.</i>"
				if(3)
					premonition[1] = 1
					premonition[2] = 0
					premonition[3] = expneeded[premonition[1]]
					class = "Premonition Witch"
					Unlock(ckey,"Premonition Witch")
					Memory(usr,"[usr] becoming a witch.")
					usr << "<i>You now have the ability of clairvoyance.</i>"
					verbs += /mob/Player/Powers/verb/Premonition
				if(4)
					telepathy[1] = 1
					telepathy[2] = 0
					telepathy[3] = expneeded[telepathy[1]]
					class = "Telepath Witch"
					Unlock(ckey,"Telepath Witch")
					Memory(usr,"[usr] becoming a witch.")
					usr << "<i>You can now Read Minds.</i>"
					verbs += /mob/Player/Powers/verb/Read_Mind
				if(5)
					astralproj[1] = 1
					astralproj[2] = 0
					astralproj[3] = expneeded[astralproj[1]]
					class="Astral Witch"
					verbs += /mob/Player/Powers/verb/Astral_Projection
					Unlock(ckey,"Astral Witch")
					Memory(usr,"[usr] becoming a witch.")
					usr << "<i>You can now use Astral Projection.</i>"
				if(6)
					inviso[1] = 1
					inviso[2] = 0
					inviso[3] = expneeded[inviso[1]]
					class="Invisibility Witch"
					verbs += /mob/Player/Powers/verb/Cloaking
					Unlock(ckey,"Invisibility Witch")
					Memory(usr,"[usr] becoming a witch.")
					usr << "<i>You can now use Cloaking.</i>"
			usr << "The air around you picks up its pace..."
			damagecounter = 3
			damagecounter2 = 3 // for now
			usr << "<i>You are now a [class].</i>"

			var/lighter = CheckUnlock(ckey, "Whitelighter")
			if(lighter)
				Unlock(ckey,"Half Whitelighter")
				usr << "Half Whitelighter unlocked."
		proc/Sap()
			var/verify = 0
			var/mob/Player/c = connect
			for(var/mob/Player/d in world)
				if(d==c)
					verify = 1
			if(!verify)
				usr << "The connection breaks."
				connect = null
				return
			if(stamina[1]>=(10-telepathy[1]))
				stamina[1] -= 10 - telepathy[1]
			else
				usr << "The connection breaks."
				connect = null
				c.connect = null
				return
			sleep(5)
			Sap()
		proc/Astral()
			if(src.astralbody==null || src.death == 1)
				return
			if(src.stamina[1]>=(10-src.astralproj[1]))
				stamina[1] -= 10 - src.astralproj[1]
			else
				src << "You return to your body."
				src.client.perspective = MOB_PERSPECTIVE
				src.client.eye = src
				del(src.astralbody) //delete my body
				src.astralbody = null
				call(src,/mob/Player/proc/Fade)(src,60,30,30,3,0,0)
				view() << sound('./sound/astral.wav',0,0,0,100)
				return
			sleep(10)
			src.Astral()
		proc/Effects(type as text)
			switch(type)
				if("sparkle")
					overlays += /obj/effects/sparkle/one
					overlays += /obj/effects/sparkle/two
					spawn(10) {overlays -= /obj/effects/sparkle/one;overlays -= /obj/effects/sparkle/two}
				if("electric")
					src.overlays += /obj/effects/electric/
					view(src) << './sound/zap.wav'
					spawn(10) view(src) << './sound/zap.wav'
					spawn(20) {src.overlays -= /obj/effects/electric}
				if("float")
					for(var/i=0;i<15;i++)
						src.pixel_y += 3
						sleep(1)
					for(var/i=0;i<3;i++)
						src.pixel_y -= 3
						sleep(1)
					for(var/i=0;i<3;i++)
						src.pixel_y += 3
						sleep(1)
					for(var/i=0;i<15;i++)
						src.pixel_y -= 3
						sleep(1)
				if("Orb")
					var/obj/effects/orb/one/orb1 = new(src.loc)
					var/obj/effects/orb/two/orb2 = new(src.loc)
					orb1.pixel_y += 91
					orb2.pixel_y += 91
					for(var/i=13;i>0;i--)
						orb1.pixel_y -= i
						orb2.pixel_y -= i
						sleep(1)
					del(orb1)
					del(orb2)
					src.invisibility = 0
					view() << sound('./sound/orb2.wav',0,0,1,100)
					call(/mob/Player/proc/Fade)(src,20,20,40,10,0)
				if("summon")
					src.invisibility = 0
					view(src) << './sound/bluemagic.wav'
					spawn()
						call(/mob/Player/proc/Fade)(src,30,30,20,10,0)
					orb = 0
					control = 0
				if("Orb2")
					spawn()
						view() << sound('./sound/orb2.wav',0,0,1,100)
						Fade(src,20,20,40,10,1)
					spawn(5)
						var/obj/effects/orb/one/orb1 = new(src.loc)
						var/obj/effects/orb/two/orb2 = new(src.loc)
						var/obj/effects/orb/one/orb3 = new(src.loc)
						for(var/i=0;i<15;i++)
							orb1.pixel_y = orb1.pixel_y+i
							orb2.pixel_y = orb2.pixel_y+i
							orb3.pixel_y = orb3.pixel_y+i+(i/2)
							sleep(1)
						del(orb1)
						del(orb2)
						del(orb3)
					sleep(7)
					src.invisibility = 101
				if("darkorb")
					spawn()
						src.invisibility = 0
						call(/mob/Player/proc/Fade)(src,20,40,20,10,0,1)
					spawn(5)
						var/obj/effects/darkorb/one/orb1 = new(src.loc)
						var/obj/effects/darkorb/two/orb2 = new(src.loc)
						sleep(10)
						del(orb1)
						del(orb2)
					sleep(10)
				if("vision")
					spawn()
						src.client.perspective = EYE_PERSPECTIVE
						for(var/i=0;i<20;i++)
							if(src)
								var/xx = rand(1,100)
								var/yy = rand(1,100)
								src.client.eye = locate(xx,yy,1)
								sleep(1)
						src.client.perspective = MOB_PERSPECTIVE
						src.client.eye = locate(src)
				if("darkorb2")
					spawn()
						call(/mob/Player/proc/Fade)(src,20,40,20,10,1,1)
					spawn(5)
						var/obj/effects/darkorb/one/orb1 = new(src.loc)
						var/obj/effects/darkorb/two/orb2 = new(src.loc)
						var/obj/effects/darkorb/one/orb3 = new(src.loc)
						orb3.pixel_y = 16
						sleep(10)
						del(orb1)
						del(orb2)
						del(orb3)
						src.invisibility = 101
				else
					..()
		proc/Color()
			origrgb[1] = input("Pants color: Amount of Red","Customise me",null) as num
			origrgb[2] = input("Pants color: Amount of green","Customise me",null) as num
			origrgb[3] = input("Pants color: Amount of blue","Customise me",null) as num
			origrgb[4] = input("Shirt color: Amount of Red","Customise me",null) as num
			origrgb[5] = input("Shirt color: Amount of green","Customise me",null) as num
			origrgb[6] = input("Shirt color: Amount of blue","Customise me",null) as num
			tehrgb[1] = origrgb[1]
			tehrgb[2] = origrgb[2]
			tehrgb[3] = origrgb[3]
			tehrgb[4] = origrgb[4]
			tehrgb[5] = origrgb[5]
			tehrgb[6] = origrgb[6]
			Setme()
		proc/Skin_Hair()
			var/icon/me = new('bottom.dmi')
			var/icon/H = new('head.dmi')
			var/all
			var/darker
			var/lighter
			var/color = input("Skin tone?","Customise me",null) in list("Pale","Normal","Tan","Tanner","Dark")
			switch(color)
				if("Pale")
					all = rgb(255,204,204)
					darker = rgb(255,221,204)
					lighter = rgb(247,247,247)
					skin = "Pale"
				if("Normal")
					all = rgb(252,207,158)
					darker = rgb(252,207,158)
					lighter = rgb(249,208,172)
					skin = "Normal"
				if("Tan")
					all = rgb(244,175,113)
					darker = rgb(240,146,60)
					lighter = rgb(247,193,145)
					skin = "Tan"
				if("Tanner")
					all = rgb(248,192,144)
					darker = rgb(192,120,64)
					lighter = rgb(252,221,197)
					skin = "Tanner"
				if("Dark")
					all = rgb(102,51,51)
					darker = rgb(102-50,51-50,51-50)
					lighter = rgb(102+50,51+50,51+50)
					skin = "Dark"
				if("Demon")
					all = rgb(demonskin[1],demonskin[2],demonskin[3])
					darker = rgb(demonskin[1]-50,demonskin[2]-50,demonskin[3]-50)
					lighter = rgb(demonskin[3]+50,demonskin[3]+50,demonskin[3]+50)
			me.SwapColor(rgb(255,255,140),all)
			me.SwapColor(rgb(255,132,90),darker)
			me.SwapColor(rgb(247,247,247),lighter)
			H.SwapColor(rgb(255,255,140),all)
			H.SwapColor(rgb(255,132,90),darker)
			H.SwapColor(rgb(247,247,247),lighter)
			color = input("Hair Colour?","Customise me",null) in list("White","Black","Brown","Blonde","Red")
			switch(color)
				if("White")
					all = rgb(213,213,215)
					darker = rgb(189,189,189)
					hair = "White"
				if("Black")
					all = rgb(99,99,99)
					darker = rgb(0,0,0)
					hair = "Black"
				if("Brown")
					all = rgb(177,118,58)
					darker = rgb(145,94,0)
					hair = "Brown"
				if("Blonde")
					all = rgb(255,181,0)
					darker = rgb(145,94,0)
					hair = "Blonde"
				if("Red")
					all = rgb(255,0,0)
					darker = rgb(151,0,0)
					hair = "Red"
			H.SwapColor(rgb(255,181,0),all)
			H.SwapColor(rgb(181,33,0),darker)

			overlays = null
			//now change icon!!
			icon = me
			var/obj/head/Head = new() // new head
			Head.icon = H
			//set the graphics
			if(gender==MALE)
				icon_state = "guybottom"
				Head.icon_state = "guysplit"
				overlays += Head
			else
				icon_state = "girlbottom"
				Head.icon_state = "girlsplit"
			overlays += Head
		proc/Memory(user,memory as text)
			var/mob/Player/M = user

			M.memory[20] = M.memory[19]
			M.memory[19] = M.memory[18]
			M.memory[18] = M.memory[17]
			M.memory[17] = M.memory[16]
			M.memory[16] = M.memory[15]
			M.memory[15] = M.memory[14]
			M.memory[14] = M.memory[13]
			M.memory[13] = M.memory[12]
			M.memory[12] = M.memory[11]
			M.memory[11] = M.memory[10]


			M.memory[10] = M.memory[9]
			M.memory[9] = M.memory[8]
			M.memory[8] = M.memory[7]
			M.memory[7] = M.memory[6]
			M.memory[6] = M.memory[5]
			M.memory[5] = M.memory[4]
			M.memory[4] = M.memory[3]
			M.memory[3] = M.memory[2]
			M.memory[2] = M.memory[1]
			M.memory[1] = memory
		proc/Unlock(ckey as text,class as text)
			var/savefile/unlock = new("./player/[ckey].sav")
			unlock.cd = "/Unlock/[class]"
			unlock << "1"
		proc/CheckUnlock(ckey as text,class as text)
			var/savefile/unlock = new("./player/[ckey].sav")
			unlock.cd = "/Unlock/"
			var/list/unlocked = unlock.dir
			if(unlocked.Find(class))
				return 1
			else
				return 0
		proc/DeleteYou(mob/M in world,ckey as text,class as text)
			M<<"Your save file has been deleted."
			del("./player/[ckey].sav")
			del M

		/*proc/Setme(gender)
			usr.icon_state = "[style]body"
			overlays = 0
			if(usr.gender == MALE)
				usr << "[style]"
				switch(style)
					if (1) overlays += /obj/head/male/m1
					if (2) overlays += /obj/head/male/m2
					else overlays += /obj/head2
			else
				switch(style)
					if (1) overlays += /obj/head/female/f1
					if (2) overlays += /obj/head/female/f2*/
		proc/Modme()
			verbs += typesof(/mob/Player/Builder/verb)
			if(ckey=="Ragnarok HGM")
				moddy = 1
			if(leader == 1) //guild leader
				verbs += /mob/Player/Moderator/verb/Expel_from_Coven
				verbs += /mob/Player/Moderator/verb/Invite_into_Coven
				verbs += /mob/Player/Moderator/verb/Change_Title
			if(coven != null)
				verbs += /mob/Player/Moderator/verb/Coven_Chat
				verbs += /mob/Player/Moderator/verb/Leave_Coven
			else
				verbs += /mob/Player/Moderator/verb/Create_A_Coven
			if(moddy == 1)
				usr << REDCHARM+" <b> Login to MOD status.</b>"
				verbs += /mob/Player/Moderator/verb/Check_Logs
				verbs += /mob/Player/Moderator/verb/Announce
				verbs += /mob/Player/Moderator/verb/Manage_Bans
				verbs += /mob/Player/Moderator/verb/Mute
				verbs += /mob/Player/Moderator/verb/Shutdown
				verbs += /mob/Player/Moderator/verb/Play_Music
				verbs += /mob/Player/Moderator/verb/Transfer
				verbs += /mob/Player/Moderator/verb/Edit_MOTD
				verbs += /mob/Player/Moderator/verb/GIVE_INVOKE
			else
				moddy = 0
			if(key == "Xoule" || key == "Ragnarok ICE" || key == "AnDeRwOLFe" || key == "Goditz")
				moddy=1
				verbs += /mob/Player/Moderator/verb/Delete_BOS_Page
			//	verbs += /mob/Player/Moderator/verb/ModifyDef
				verbs += /mob/Player/Powers/verb/Energy_Waves
				verbs += /mob/Player/Powers/verb/Cloaking
				verbs += /mob/Player/Powers/verb/Ghostly_Touch
				verbs += /mob/Player/Moderator/verb/Grant_Mod
				verbs += /mob/Player/Moderator/verb/Goto_Storage
				verbs += /mob/Player/Moderator/verb/Return
				verbs += /mob/Player/Moderator/verb/Disconnect
				verbs += /mob/Player/Moderator/verb/BOS_Access
				verbs += typesof(/mob/Player/Builder/verb)
				verbs += typesof(/mob/Player/Moderator/verb)
				verbs += typesof(/mob/Player/Powers/verb)
				rank = "<FONT COLOR=#ccffff>E</FONT><FONT COLOR=#b3ffff>l</FONT><FONT COLOR=#99ffff>d</FONT><FONT COLOR=#4dffff>e</FONT><FONT COLOR=#00ffff>r</FONT>"
				stamina[1] = 250
				stamina[2] = 250

			if(key=="Ragnarok HGM")
				moddy=1
				verbs += /mob/Player/Moderator/verb/Delete_BOS_Page
				//verbs += /mob/Player/Moderator/verb/ModifyDef
				verbs += /mob/Player/Powers/verb/Energy_Waves
				verbs += /mob/Player/Powers/verb/Cloaking
				verbs += /mob/Player/Powers/verb/Ghostly_Touch
				verbs += /mob/Player/Moderator/verb/Grant_Mod
				verbs += /mob/Player/Moderator/verb/Goto_Storage
				verbs += /mob/Player/Moderator/verb/Return
				verbs += /mob/Player/Moderator/verb/Disconnect
				verbs += /mob/Player/Moderator/verb/BOS_Access
				verbs += typesof(/mob/Player/Builder/verb)
				verbs += typesof(/mob/Player/Moderator/verb)
				verbs += typesof(/mob/Player/Powers/verb)

				class="Half Whitelighter"
				rank = "<FONT COLOR=#33ffff>H</FONT><FONT COLOR=#b3ffff>e</FONT><FONT COLOR=#99ffff>a</FONT><FONT COLOR=#4dffff>d</FONT><FONT COLOR=#00ffff> </FONT><FONT COLOR=#33ffff>E</FONT><FONT COLOR=#67ffff>l</FONT><FONT COLOR=#99ffff>d</FONT><FONT COLOR=#b3ffff>e</FONT><FONT COLOR=#ccffff>r</FONT></FONT> "
				power += 2000
				alignment = 5000
				var/announce = alert(src,"Announce your entrance?","CHARMED","Announce","Enter Quietly")
				if(announce == "Announce")
					world<<REDCHARM+"[usr] the <b>Administrator</b> has entered Charmed Online."
					return
				if(announce == "Enter Quietly")
					return
			if(key=="Dexii")
				moddy=1
				verbs += /mob/Player/Moderator/verb/Delete_BOS_Page
				//verbs += /mob/Player/Moderator/verb/ModifyDef
				verbs -= /mob/Player/Powers/verb/Energy_Waves
				verbs += /mob/Player/Powers/verb/Cloaking
				verbs += /mob/Player/Powers/verb/Ghostly_Touch
				verbs -= /mob/Player/Moderator/verb/Grant_Mod
				verbs += /mob/Player/Moderator/verb/Goto_Storage
				verbs += /mob/Player/Moderator/verb/Return
				verbs += /mob/Player/Moderator/verb/Disconnect
				verbs += /mob/Player/Moderator/verb/BOS_Access
				verbs += typesof(/mob/Player/Builder/verb)
				verbs += typesof(/mob/Player/Moderator/verb)
				verbs += typesof(/mob/Player/Powers/verb)
				usr<<"You have been given full Game Master status except for the ability to hire other game masters. Contact the game owner, Ragnarok HGM for GM requests."
				world<<REDCHARM+ "<b>Gamer Runner <font color=red>[usr] </b><font color=white> has entered Charmed Online."
		proc/Setme()
			//ask for shirt color
			var/icon/H = new('head.dmi') //new look,head
			var/icon/me = new('bottom.dmi') // new look,body
			var/all = rgb(src.tehrgb[1],src.tehrgb[2],src.tehrgb[3])
			var/darker = rgb(src.tehrgb[1]-50,src.tehrgb[2]-50,src.tehrgb[3]-50)
			var/lighter = rgb(src.tehrgb[1]+50,src.tehrgb[2]+50,src.tehrgb[3]+50)
			me.SwapColor(rgb(0,51,255),all)
			me.SwapColor(rgb(0,0,153),darker)
			me.SwapColor(rgb(0,255,255),lighter)
			H.SwapColor(rgb(0,51,255),all)
			H.SwapColor(rgb(0,0,153),darker)
			H.SwapColor(rgb(0,255,255),lighter)
			//change shirt colour
			all = rgb(src.tehrgb[4],src.tehrgb[5],src.tehrgb[6])
			darker = rgb(src.tehrgb[4]-50,src.tehrgb[5]-50,src.tehrgb[6]-50)
			lighter = rgb(src.tehrgb[4]+50,src.tehrgb[5]+50,src.tehrgb[6]+50)
			me.SwapColor(rgb(255,0,204),all)
			me.SwapColor(rgb(255,0,102),darker)
			me.SwapColor(rgb(255,204,204),lighter)
			H.SwapColor(rgb(255,0,204),all)
			H.SwapColor(rgb(255,0,102),darker)
			H.SwapColor(rgb(255,204,204),lighter)
			//skin!!!
			switch(src.skin)
				if("Pale")
					all = rgb(255,204,204)
					darker = rgb(255,221,204)
					lighter = rgb(247,247,247)
				if("Normal")
					all = rgb(252,207,158)
					darker = rgb(252,207,158)
					lighter = rgb(249,208,172)
				if("Tan")
					all = rgb(244,175,113)
					darker = rgb(240,146,60)
					lighter = rgb(247,193,145)
				if("Tanner")
					all = rgb(248,192,144)
					darker = rgb(192,120,64)
					lighter = rgb(252,221,197)
				if("Dark")
					all = rgb(102,51,51)
					darker = rgb(102-50,51-50,51-50)
					lighter = rgb(102+50,51+50,51+50)
				if("Demon")
					all = rgb(demonskin[1],demonskin[2],demonskin[3])
					darker = rgb(demonskin[1]-50,demonskin[2]-50,demonskin[3]-50)
					lighter = rgb(demonskin[3]+50,demonskin[3]+50,demonskin[3]+50)
			me.SwapColor(rgb(255,255,140),all)
			me.SwapColor(rgb(255,132,90),darker)
			me.SwapColor(rgb(247,247,247),lighter)
			H.SwapColor(rgb(255,255,140),all)
			H.SwapColor(rgb(255,132,90),darker)
			H.SwapColor(rgb(247,247,247),lighter)
			switch(src.hair)
				if("White")
					all = rgb(213,213,215)
					darker = rgb(189,189,189)
					hair = "White"
				if("Black")
					all = rgb(99,99,99)
					darker = rgb(0,0,0)
					hair = "Black"
				if("Brown")
					all = rgb(177,118,58)
					darker = rgb(145,94,0)
					hair = "Brown"
				if("Blonde")
					all = rgb(255,181,0)
					darker = rgb(145,94,0)
					hair = "Blonde"
				if("Red")
					all = rgb(255,0,0)
					darker = rgb(151,0,0)
					hair = "Red"
			H.SwapColor(rgb(255,181,0),all)
			H.SwapColor(rgb(181,33,0),darker)
			me.SwapColor(rgb(255,181,0),all)
			me.SwapColor(rgb(181,33,0),darker)

			src.overlays = null
			//now change icon!!
			src.icon = me
			var/obj/head/Head = new() // new head
			Head.icon = H
			//set the graphics
			if(src.gender==MALE)
				src.icon_state = "guybottom"
				Head.icon_state = "guysplit"
			else
				src.icon_state = "girlbottom"
				Head.icon_state = "girlsplit"
			src.overlays += Head
		/*
			overlays = null
			if(usr.gender==MALE)
				usr.icon = 'male.dmi'
			else
				usr.icon = 'female.dmi'
			usr.icon_state = "[style]body"
			var/obj/head/H = new()
			if(usr.gender == MALE)
				H.icon = 'male.dmi'
			else
				H.icon = 'female.dmi'
			H.icon_state = "[style]head"
			var/icon/me = new(H.icon)
			//ali.SwapColor(rgb(0,0,0),rgb(clothesrgb[1],clothesrgb[2],clothesrgb[3]))
			me.Blend(H.icon,ICON_ADD)
			H.icon = me
			overlays += H*/

		proc/Deathcheck(var/mob/Player/who,var/mob/Player/attacker)
			if(who.astralbody == "Me") //I'm a fake body, can't hurt me!
				attacker << "That didn't seem to have an effect on [who]"
				//i can't die....
				return 0
			if(who.astralbody) //if I have an astral body! summon it back
				who << "You are brought back harshly into your real body!"
				who.client.perspective = MOB_PERSPECTIVE
				who.client.eye = who
				del(who.astralbody) //delete my body
				who.astralbody = null
				who << sound('./sound/astral.wav',0,0,0,100)
				call(who,/mob/Player/proc/Fade)(who,60,30,30,3,0,0)
				return
			if(attacker.class == "Whitelighter")
				attacker.Levelme()
			if(attacker.client)
				var/a = who.alignment
				if(a>=20)
					attacker.alignment -= 20
				else
					if(a<=-20)
						attacker.alignment -= -20
					else
						attacker.alignment -= who.alignment
				if(attacker.class=="Telekinetic Witch" || attacker.class=="Molecular Witch" || attacker.class=="Premonition Witch" || attacker.class == "Telepath Witch" || attacker.class == "Astral Witch" || attacker.class == "Invisibility Witch")
					if(attacker.alignment <= -40)
						attacker << "<i>The evil inside you turns you into a warlock.</i>"
						usr << "<i>You can now Summon Athames.</i>"
						attacker.class = "Warlock"
						attacker.summonathame[1] = 1
						attacker.summonathame[3] = expneeded[attacker.summonathame[1]]
						attacker.class="Warlock"
						attacker.verbs += /mob/Player/Powers/verb/Summon_Athame
						attacker.Unlock(attacker.ckey,"Warlock")
						call(attacker,/mob/Player/proc/Memory)(attacker,"[attacker] becoming a warlock.")
				if(who.stamina[2]>50)
					who.stamina[2] -= who.damagecounter2
				if(attacker.stamina[2]<250)
					attacker.stamina[2] += 1
			who.Memory(who,"Being attacked by [attacker].")
			attacker.Memory(attacker,"Attacking [who].")


			if(who.client)
				who << sound(,0,1,2,100)
				if(who.damagecounter<=0)
					var/obj/Ungetables/Soul/o = new(who.loc)
					o.amount = rand(1,who.damagecounter2)
					walk_rand(o,10)
					spawn(50)
						for(var/i=0;i<15;i++)
							if(o)
								o.invisibility = 101
								sleep(2)
							if(o)
								o.invisibility = 1
								sleep(2)
						if(o)
							del(o)

					for(var/mob/Player/witch in world)
						if(istype(witch,/mob/Player/) && witch.premonition[1] >= 1 && witch.premonition[4]==0 && witch!=who && attacker!=witch && who.alignment > -50 && witch.death==0 && witch.stun==0)//
							witch.client.perspective = EYE_PERSPECTIVE
							witch.client.eye = who.loc
							witch << "You have a vision of [who]'s death under [attacker]."
							oview(witch) << "[witch] gasps as a vision hits \him."
							attacked += "[who.name]"
							spawn(10)
								witch.client.eye = attacker.loc
								sleep(10)
								witch.client.eye = witch
								witch.client.perspective = MOB_PERSPECTIVE
								witch.client.eye = witch
								witch.Memory(witch,"A vision of [who] getting attacked by [attacker].")
						if(istype(witch,/mob/Player/) && witch.class == "Whitelighter")
							if(who.whitelighter == witch.origname)
								witch << "<i>You felt a sudden sense of loss.</i>"
					if(who.alignment<=-20 && who.class == "Human")
						usr << "After your death, the evil inside you brings you back to life as a darklighter, intending to spread the seeds of evil."
						var/lighter = who.CheckUnlock(who.ckey, "Darklighter")
						if(!lighter)
							who.Unlock(who.ckey,"Darklighter")
							who << "Darklighter unlocked."
						who.class = "Darklighter"
						who.Levelme(who)
						who.damagecounter2 = 3
						who.damagecounter = 3
						who.telepathy[1] = 1
						who.telepathy[2] = 2
						who.telepathy[3] = expneeded[who.telepathy[1]]
					if(who.alignment>=20 && who.class == "Human")
						usr << "The Elders have offered you to become a whitelighter."
						var/lighter = who.CheckUnlock(who.ckey, "Whitelighter")
						if(!lighter)
							who.Unlock(who.ckey,"Whitelighter")
							who << "Whitelighter unlocked."
						who.class = "Whitelighter"
						who.Levelme(who)
						who.damagecounter2 = 3
						who.damagecounter = 3
						lighter = 0
						lighter += who.CheckUnlock(who.ckey, "Telekinetic Witch")
						lighter += who.CheckUnlock(who.ckey, "Molecular Witch")
						lighter += who.CheckUnlock(who.ckey, "Premonition Witch")
						lighter += who.CheckUnlock(who.ckey, "Telepath Witch")
						lighter += who.CheckUnlock(who.ckey, "Astral Witch")
						lighter += who.CheckUnlock(who.ckey, "Half Whitelighter")
						lighter += who.CheckUnlock(who.ckey, "Invisibility Whitelighter")
						if(lighter>=1)
							who.Unlock(who.ckey,"Half Whitelighter")
							who << "Half Whitelighter unlocked."
					if(who.class == "Human")
						who.loc = locate(46,57,1)
						who.invisibility = 0
						who.client.perspective = MOB_PERSPECTIVE
						who.client.eye = who
						who.orb = 0
						who.damagecounter = who.damagecounter2
						who.stun = 0
						who.control = 0
						who.death = 0
						who.Saveme()
					if(who.class != "Human")
						call(who,/mob/Player/proc/Deathseq)()
					return who.damagecounter2
				else
					var/random = rand(1,3)
					switch(random)
						if(1)
							who << "That hurts!"
							who.Say("[who.injured[1]]")
						if(2)
							who << "Ouch!"
							who.Say("[who.injured[2]]")
						if(3)
							who << "Now that was PAINFUL."
							who.Say("[who.injured[3]]")
						else
							..()
					/*premonition witch code*/
					for(var/mob/Player/witch in world)
						var/hpinit = who.damagecounter2-1
						var/hpnow = who.damagecounter
						if(istype(witch,/mob/Player/) && witch.premonition[1] >= 1 && witch.premonition[4]==0 && witch!=who && hpinit==hpnow && attacker!=witch && who.alignment > -50 && witch.death==0 && witch.stun==0)//if(istype(witch,/mob/Player/) &&  && witch.premonition[4]==0 && witch!=who && attacker!=witch && who.alignment > 0)
							witch.client.perspective = EYE_PERSPECTIVE
							witch.client.eye = who.loc
							witch << "You have a vision of [who] attacked by [attacker]."
							oview(witch) << "[witch] gasps as a vision hits \him."
							spawn(10)
								witch.client.eye = attacker.loc
								sleep(10)
								witch.client.eye = witch
								witch.client.perspective = MOB_PERSPECTIVE
								witch.client.eye = witch
								witch.Memory(witch,"A vision of [who] getting attacked by [attacker].")
						if(istype(witch,/mob/Player/) && witch.class == "Whitelighter")
							if(who.whitelighter == witch.origname)
								witch << "<i>A ringing sound began in your ear.</i>"
								witch << sound('./sound/ring.wav',1,0,0,100)
								sleep(20)
								witch << sound(null,0,0,0,100)
					return 0
			else //mob
				if(who.damagecounter<=0)
					var/obj/Ungetables/Soul/o = new(who.loc)
					o.amount = rand(1,who.damagecounter2)
					walk_rand(o,10)
					spawn(50)
						for(var/i=0;i<15;i++)
							if(o)
								o.invisibility = 101
								sleep(2)
							if(o)
								o.invisibility = 1
								sleep(2)
						if(o)
							del(o)

					oview(who) << "Death has claimed [who]."
					var/exp = who.damagecounter2
					switch(who.name)
						if("Ghast")
							spawn(50)
								MakeMonster()
						if("Ghast")
							spawn(50)
								MakeMonsterGk()
						if("Zombie")
							var/i = rand(1,3)
							if(i==3)
								var/obj/Getables/Herb/Rotten_Flesh/gm = new(who.loc)
								gm.owner = attacker.origname
							spawn(50)
								MakeMonster3()
						if("Speed Demon")
							spawn(600)
								MakeMonster2()
						if("Steward Mason")
							spawn(600)
								MakeMOB("steward")
						if("Rena Anderson")
							spawn(600)
								MakeMOB("rena")
						if("Alexis")
							spawn(600)
								MakeMOB("alexis")
						if("Kelnerth")
							spawn(600)
								MakeMOB("kelnerth")
						if("Dymas")
							spawn(600)
								MakeMOB("dymas")
						if("Beatrice")
							spawn(600)
								MakeMOB("beatrice")
						if("Triad")
							var/obj/Getables/Golden_Mark/gm = new(who.loc)
							gm.owner = attacker.origname
							spawn(600)
								MakeMOB("triad")
						else
							MakeNPC()
					del(who)
					return exp
				else
					return 0
		proc/Levelme(var/mob/Player/M)
			if(M.telekinesis[1]!=0) //you have the power!
				if(M.telekinesis[1]<length(expneeded) && M.telekinesis[2] >= expneeded[M.telekinesis[1]])
					//considered yourself upped
					usr << "You get better at telekinesis."
					var/remainder = M.telekinesis[2]-expneeded[M.telekinesis[1]]
					M.telekinesis[1]++
					M.telekinesis[2] = remainder
					M.telekinesis[3] = expneeded[telekinesis[1]]
					Levelme(M)
			if(M.molecular[1]!=0)
				if(M.molecular[1]<length(expneeded) && M.molecular[2] >= expneeded[M.molecular[1]])
					//considered yourself upped
					usr << "You get better at molecular control."
					var/remainder = M.molecular[2]-expneeded[M.molecular[1]]
					M.molecular[1]++
					M.molecular[2] = remainder
					M.molecular[3] = expneeded[molecular[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()
			if(M.premonition[1]!=0)
				if(M.premonition[1]<length(expneeded) && M.premonition[2] >= expneeded[M.premonition[1]])
					//considered yourself upped
					usr << "You get better at having premonitions."
					var/remainder = M.premonition[2]-expneeded[M.premonition[1]]
					M.premonition[1]++
					M.premonition[2] = remainder
					M.premonition[3] = expneeded[premonition[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()
			if(M.telepathy[1]!=0)
				if(M.telepathy[1]<length(expneeded) && M.telepathy[2] >= expneeded[M.telepathy[1]])
					//considered yourself upped
					usr << "You get better at telepathy."
					var/remainder = M.telepathy[2]-expneeded[M.telepathy[1]]
					M.telepathy[1]++
					M.telepathy[2] = remainder
					M.telepathy[3] = expneeded[telepathy[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()
			if(M.summonathame[1]!=0)
				if(M.summonathame[1]<length(expneeded) && M.summonathame[2] >= expneeded[M.summonathame[1]])
					//considered yourself upped
					usr << "You get better at summoning athames."
					var/remainder = M.summonathame[2]-expneeded[M.summonathame[1]]
					M.summonathame[1]++
					M.summonathame[2] = remainder
					M.summonathame[3] = expneeded[summonathame[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()
			if(M.firestarter[1]!=0)
				if(M.firestarter[1]<length(expneeded) && M.firestarter[2] >= expneeded[M.firestarter[1]])
					//considered yourself upped
					usr << "You get better at starting fires."
					var/remainder = M.firestarter[2]-expneeded[M.firestarter[1]]
					M.firestarter[1]++
					M.firestarter[2] = remainder
					M.firestarter[3] = expneeded[firestarter[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()
			if(M.astralproj[1]!=0)
				if(M.astralproj[1]<length(expneeded) && M.astralproj[2] >= expneeded[M.astralproj[1]])
					//considered yourself upped
					usr << "You get better at astral projection."
					var/remainder = M.astralproj[2]-expneeded[M.astralproj[1]]
					M.astralproj[1]++
					M.astralproj[2] = remainder
					M.astralproj[3] = expneeded[astralproj[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()
			if(M.inviso[1]!=0)
				if(M.inviso[1]<length(expneeded) && M.inviso[2] >= expneeded[M.inviso[1]])
					//considered yourself upped
					usr << "You get better at invisibility"
					var/remainder = M.inviso[2]-expneeded[M.inviso[1]]
					M.inviso[1]++
					M.inviso[2] = remainder
					M.inviso[3] = expneeded[inviso[1]]
					//give appropriate verbs?
					Levelme(M)
				else
					..()

			//Give skills *sigh*
			if(M.firestarter[1]>=1)
				verbs += /mob/Player/Powers/verb/Torch
			if(M.firestarter[1]>=3)
				verbs += /mob/Player/Powers/verb/Fireball
			if(M.firestarter[1]>=5)
				verbs += /mob/Player/Powers/verb/Scarring
				verbs += /mob/Player/Powers/verb/Firewall
			if(M.firestarter[1]>=10)
				verbs += /mob/Player/Powers/verb/Burn

			if(M.class!="Half Whitelighter")
				if(M.telekinesis[1]>=3)
					verbs += /mob/Player/Powers/verb/Telekinesis
				if(M.telekinesis[1]>=2)
					verbs += /mob/Player/Powers/verb/Telekinetic_Towards
				if(M.telekinesis[1]>=1)
					verbs += /mob/Player/Powers/verb/Telekinetic_Repel
					verbs += /mob/Player/Powers/verb/Levitate

			if(M.molecular[1]>=1)
				verbs += /mob/Player/Powers/verb/Temporal_Stasis_One
			if(M.molecular[1]>=3)
				verbs += /mob/Player/Powers/verb/Temporal_Stasis
			if(M.molecular[1]>=7)
				verbs += /mob/Player/Powers/verb/Molecular_Combustion

			if(M.astralproj[1]>=1)
				verbs += /mob/Player/Powers/verb/Astral_Projection

			if(M.premonition[1]>=1)
				verbs += /mob/Player/Powers/verb/Premonition
			if(M.premonition[1]>=5)
				verbs += /mob/Player/Powers/verb/Force_Premonition
			if(M.premonition[1]>=3)
				verbs += /mob/Player/Powers/verb/Interrupt_Premonition
			if(M.premonition[1]>=2)
				verbs += /mob/Player/Powers/verb/Clear_Thoughts
			if(M.premonition[1]>=7)
				verbs += /mob/Player/Powers/verb/Electro_Mental_Ignitions

			if(M.inviso[1] >= 1)
				verbs += /mob/Player/Powers/verb/Cloaking
				if(M.inviso[1] >= 3)
					verbs += /mob/Player/Powers/verb/Ghostly_Touch

			if(M.class=="Telepath Witch" || M.class == "Witch" || M.class == "Warlock")
				if(M.telepathy[1]>=1)
					verbs += /mob/Player/Powers/verb/Read_Mind
				if(M.telepathy[1]>=3)
					verbs += /mob/Player/Powers/verb/Clear_Thoughts
				if(M.telepathy[1]>=5)
					verbs += /mob/Player/Powers/verb/Mass_Read

			if(M.telepathy[1]>=5)
				verbs += /mob/Player/Powers/verb/Telepathy
				verbs += /mob/Player/Powers/verb/Empathy
			if(M.telepathy[1]>=6)
				verbs += /mob/Player/Powers/verb/Forced_Thoughts

			if(M.summonathame[1] > 0)
				verbs += /mob/Player/Powers/verb/Summon_Athame
				if(M.summonathame[1] > 1)
					verbs += /mob/Player/Powers/verb/Blink
				if(M.summonathame[1] > 2)
					verbs += /mob/Player/Powers/verb/Blink_Around
					verbs += /mob/Player/Powers/verb/Seize
			if(M.class == "Darklighter")
				if(M.telepathy[1] >= 7)
					verbs += /mob/Player/Powers/verb/Suicide_Thoughts
				if(M.telepathy[1] >= 10)
					verbs += /mob/Player/Powers/verb/Touch_of_Death
				if(M.telepathy[1] >= 10)
					verbs += /mob/Player/Powers/verb/Remote_Orb2
				if(M.telepathy[1] >= 3)
					verbs += /mob/Player/Powers/verb/Orb_Around
					verbs += /mob/Player/Powers/verb/Tracking
					verbs += /mob/Player/Powers/verb/Seize
				verbs += /mob/Player/Powers/verb/Orb
				verbs += /mob/Player/Powers/verb/Conjure_Crossbow
				verbs += /mob/Player/Powers/verb/Conjure_Bolts
			if(M.class == "Whitelighter")
				verbs -= /mob/Player/Powers/verb/Heal
				verbs -= /mob/Player/Powers/verb/Whitelighter_Chat
				verbs -= /mob/Player/Powers/verb/Orb
				verbs -= /mob/Player/Powers/verb/Orb_Around
				verbs -= /mob/Player/Powers/verb/Charge
				verbs -= /mob/Player/Powers/verb/Invite_into_Orb
				verbs -= /mob/Player/Powers/verb/Join_Orb
				verbs -= /mob/Player/Powers/verb/Up_There
				verbs -= /mob/Player/Powers/verb/Sense_Charges
				verbs -= /mob/Player/Powers/verb/Sense
				verbs -= /mob/Player/Powers/verb/Whitelighter_Energyball
				verbs -= /mob/Player/Powers/verb/Glamour
				verbs -= /mob/Player/Powers/verb/Revert_Whitelighter
				if(M.rank=="<font color=#2211aa>E</font><font color=#2539b8>l</font><font color=#2860c6>d</font><font color=#2b88d5>e</font><font color=#2db0e3>r</font>")
					if(M.alignment < 100)
						usr << "Your alignment is not enough for you to maintain your Elder status, and has thus reverted you back to a whitelighter."
						M.verbs -= /mob/Player/Powers/verb/Lightning
						M.verbs -= /mob/Player/Powers/verb/Remote_Orb1
						M.verbs -= /mob/Player/Powers/verb/Remote_Orb2
						M.text = "Whitelighter"
						M.rank = null
						sleep(20)
						M<<REDCHARM+"Your Elderly powers have been taken. You can no longer Remote Orb people, or throw Lightning."
				if(M.alignment >= 0)
					verbs += /mob/Player/Powers/verb/Heal
				if(M.alignment >= 20)
					verbs += /mob/Player/Powers/verb/Whitelighter_Chat
					verbs += /mob/Player/Powers/verb/Orb
					verbs += /mob/Player/Powers/verb/Orb_Around
					verbs += /mob/Player/Powers/verb/Orb_Summon
					verbs += /mob/Player/Powers/verb/Charge
					verbs += /mob/Player/Powers/verb/Invite_into_Orb
					verbs += /mob/Player/Powers/verb/Up_There
					text = "Whitelighter"
					if(M.orber == 1)
						verbs += /mob/Player/Powers/verb/Join_Orb
				if(M.alignment >= 50)
					verbs += /mob/Player/Powers/verb/Sense_Charges
					verbs += /mob/Player/Powers/verb/Sense
				if(M.alignment >= 100)
					verbs += /mob/Player/Powers/verb/Whitelighter_Energyball
					verbs += /mob/Player/Powers/verb/Glamour
					verbs += /mob/Player/Powers/verb/Revert_Whitelighter
					verbs += /mob/Player/Powers/verb/Meditate
					if(M.rank=="<font color=#2211aa>E</font><font color=#2539b8>l</font><font color=#2860c6>d</font><font color=#2b88d5>e</font><font color=#2db0e3>r</font>")
						verbs += /mob/Player/Powers/verb/Lightning
						verbs += /mob/Player/Powers/verb/Remote_Orb1
			if(M.class == "Half Whitelighter")
				verbs += /mob/Player/Powers/verb/Orb
				if(M.telekinesis[1]>=2)
					verbs += /mob/Player/Powers/verb/Telekinetic_Orb_Return
				if(M.telekinesis[1]>=3)
					verbs += /mob/Player/Powers/verb/Glamour
					verbs += /mob/Player/Powers/verb/Revert_Whitelighter
				if(M.telekinesis[1]>=4)
					verbs += /mob/Player/Powers/verb/Heal
					verbs += /mob/Player/Powers/verb/Telekinetic_Orbing
				if(M.telekinesis[1]>=5)
					verbs += /mob/Player/Powers/verb/Orb_Around
					verbs += /mob/Player/Powers/verb/Invite_into_Orb
					verbs += /mob/Player/Powers/verb/Orb_Summon
					if(M.orber == 1)
						verbs += /mob/Player/Powers/verb/Join_Orb
			if(M.energyball==1)
				verbs += /mob/Player/Powers/verb/Energyball
			if(M.energyball==2)
				verbs += /mob/Player/Powers/verb/Fireball
			if(M.sighty >= 1)
				M.see_invisible = 1
			if(M.firemove >= 1)
				verbs += /mob/Player/Powers/verb/Fire_Move
				verbs += /mob/Player/Powers/verb/Fire_Move_Around
				verbs += /mob/Player/Powers/verb/Seize
			if(M.shimmer >= 1)
				verbs += /mob/Player/Powers/verb/Shimmer
				verbs += /mob/Player/Powers/verb/Shimmer_Around
				verbs += /mob/Player/Powers/verb/Seize
			if(M.shapeshift >= 1)
				verbs += /mob/Player/Powers/verb/Shapeshift
				verbs += /mob/Player/Powers/verb/Revert_Demon
			if(M.sensey >= 1)
				verbs += /mob/Player/Powers/verb/Sense
			if(M.glightning >= 1)
				verbs += /mob/Player/Powers/verb/Golden_Lightning
			return
		proc/Saveme()
			if(src.client)
				var/savefile/save = new("./player/[src.ckey].sav")
				var/safename = ckey(src.origname)
				src.xloc = src.x
				src.yloc = src.y
				src.zloc = src.z
				src.walking=0
				save["/[safename]"] << src
				save["/[safename]/name"] << src.origname
				save["/[safename]/hash"] << md5("[stamina[1]]/[damagecounter]/[damagecounter2]/[class]/[rank]")
			/*save["/[safename]"] << x
			save["/[safename]"] << y
			save["/[safename]"] << z*/
		/*proc/Autosave()
			usr << REDCHARM+" <b>Auto-saved.</b>"
			Saveme()
			spawn(AUTOSAVE_TIME)
				src.Autosave()*/




		proc/Recoverme()
			stamina[1] += damagecounter*5
			if(stamina[1]>stamina[2])
				stamina[1] = stamina[2]
			spawn(50)
				Recoverme()
		proc/Deathseq()
			src.death = 1
			src.Saveme()
			src.invisibility = 101
			src.density = 0
			src.client.eye = null
			var/what
			if(src.class=="Whitelighter")
				what = "Whitelighter"
			if(src.class=="Warlock" || src.class == "Demon" || src.class == "Upper Level Demon")
				what = "Evil"
			if(src.class=="Human")
				what = "Human"
			if(src.class == "Lower Demon" || src.class == "Darklighter")
				what = "Lower Demon"
			if(what == null)
				what = "Witch"
			switch(what)
				if("Lower Demon")
					sleep(20)
					src.loc = locate(46,57,1)
					src << "The pain was temporary, as you find yourself back into the physical plane."
					src << "Perhaps it was still too soon for you to move on."
					src.death = 0
				if("Whitelighter")
					src << "<i>You try to open your eyes, but your heavy eyelids refuse to obey.</i>"
					sleep(50)
					src << "A soft female voice says, \"[src.]'s going to be alright?\""
					sleep(30)
					src << "A male's voice replies grimly, \"It'll take a while to recover. Wounds like that.\""
					sleep(20)
					src << "<i>You feel warmth enter your body as healing energy pours into you in all directions.</i>"
					sleep(50)
					src << "<i>You jump as consciousness hits you.</i>"
					src.loc = locate(/turf/floor/orber)
					src.location = "Up There"
					src.death = 0
				if("Human")
					src.helpme()
					src.client.perspective = EYE_PERSPECTIVE
					src << "This is your life in the middle of San Francisco."
					for(var/i=57;i<=70;i++)
						src.client.eye = locate(i,59,1)
						sleep(3)
					sleep(40)
					src << "Your day begins early at dawn, and ends when the darkness falls over the city, unaware that danger is lurking in every possible corner."
					for(var/i=156;i<=170;i++)
						src.client.eye = locate(169,i,1)
						sleep(3)
					sleep(50)
					src.client.eye = null
					alert("Hey, this is the Creator here.","CHARMED","Continue")
					var/listen = alert("Would you like to listen to what I have to say?","CHARMED","Yes","No")
					if(listen == "Yes")
						alert("This game is made not just for killing other players/npcs and becoming stronger.","CHARMED","Continue")
						alert("Well, it is partly, but you'll find that your time will be more enjoyable if you're a Charmed fan and/or an avid roleplayer.","CHARMED","Continue")
						alert("Although there are good and evil players, their identity is not always revealed. You'll never know if the stranger who just asked you for directions if actually a warlock in disguise, ready to jump out at you and rip your throat out.","CHARMED","Continue")
						alert("You'll probably find it easier to adjust yourself into the game if you can think like your character :P","CHARMED","Continue")
						alert("Hmmm, what else... you're probably getting bored by now so I'll end it quickly.","CHARMED","Continue")
						alert("Like I've mentioned, this game is not solely about killing things. Develop relationship with other players, and if you're interested it serves as a community for Wiccans. If you happen to be, the Book of Shadows may even contain useful in real life (and also in game) knowledge you can take with you offered by other players.","CHARMED","Continue")
						alert("Well, that's about it. For being so attentive and not having figid the last few minutes, I'm giving you some extra cash to start you off.","CHARMED","Continue")
						money += 25
						alert("And yeah, lastly, be a responsible player and obey the rules (though there are none, we just ask you to maintain your integrity and show respect for the other players). Have fun ;)","CHARMED","Yes")
					for(var/i=50;i<=57;i++)
						src.client.eye = locate(46,i,1)
						sleep(1)
					src.loc = locate(46,57,1)
					src << "Good luck with the game. If you need assistance, you could always seek help at the forums."
					src.location = "in Town"
					src.death = 0
				if("Evil")
					src << "That last thing you remember was being vanquished, as fragments of your body find themselves being pieced back together."
					sleep(20)
					src << "The pain was temporary, as you find yourself in a desolated place, where demons and other vanquished villians go after death.<br>Limbo."
					var/xx = rand(1,84)
					var/yy = rand(103,200)
					var/turf/locato = locate(xx,yy,1)
					while(locato.density == 1)
						xx = rand(1,84)
						yy = rand(103,200)
						locato = locate(xx,yy,1)
					src.loc = locate(xx,yy,1)
					src << sound('./sound/gale.wav',1,1,2,100)
					src.location = "in Limbo"
					if(!sin)
						var/sin = rand(1,7)
						switch(sin)
							if(1)
								src.sin = "Lust"
								src << "<i>You feel an obsessive, unlawful, and unnatural sexual drive.</i>"
							if(2)
								src.sin = "Gluttony"
								src << "<i>You feel an the desire to consume more than neccessary.</i>"
							if(3)
								src.sin = "Avarice"
								src << "<i>A grin forms on your face, as you feel the need to betray for the desire of more power.</i>"
							if(4)
								src.sin = "Sloth"
								src << "<i>You feel like idling around, and wasting your time.</i>"
							if(5)
								src.sin = "Wrath"
								src << "<i>An overwhelming feeling of hatred and anger consumes you.</i>"
							if(6)
								src.sin = "Envy"
								src << "<i>You have a sudden grieving spite and resentment of material objects, wishing ill-fortunes to others who are better than you.</i>"
							if(7)
								src.sin = "Pride"
								src << "<i>You have a desire to become more important and attractive than others.</i>"
				else // witch
					sleep(10)
					src << sound("./sound/gale.wav",0,0,1,60)
					src << "<i>You feel that you can't move your limbs. Almost as if they were stuck in place</i>"
					sleep(20)
					src << "<i>There are whispering voices far away, but you cannot make head or tails of them.</i>"
					sleep(50)
					src << "<i>It's almost as if you were drifting in space...</i>"
					src << sound("./sound/gale.wav",0,0,1,60)
					sleep(50)
					src << "<i>Voices: We call upon the ancient powers,</i>"
					sleep(20)
					src << "<i>Voices: To summon one to save a soul.</i>"
					sleep(50)
					src << "<i>You feel slightly tingly all over, as the spell begin to take effect.</i>"
					src << sound("./sound/gale.wav",0,0,1,60)
					sleep(30)

					src.loc = locate(140,10,1)
					src << "<i>You feel yourself being sucked through space.</i>"
					src << "<b>You've been summoned!</b>"
					src.Effects("summon")
					src << "<i>Seems like someone has left a piece of paper here and fled.</i>"
					src.location = "in the Hallowell Manor"
					src.death = 0
			src.client.eye = src
			src.client.perspective = MOB_PERSPECTIVE
			src.client.eye = src
			src.density = 1
			src.damagecounter = src.damagecounter2
			src.invisibility = 0
			src.orb = 0
			src.stun = 0
			src.control = 0

/*		proc/Loadme()
			client << "argh"
			world.log << "[xloc][yloc][zloc]"
			//var { savex;savey;savez }
			var/savefile/save = new("./player/[ckey].sav")
			var/safename = ckey(origname)
			save["/[safename]"] >> usr
			save["/[safename]"] >> savex
			save["/[safename]"] >> savey
			save["/[safename]"] >> savez
			Move(locate(xloc, yloc, zloc))
		Read(savefile/F)
			..()
			Move(locate(xloc, yloc, zloc))
			var/savefile/save = new("./player/[ckey].sav")
			safename = ckey(usr.name)
			save.cd = "/[safename]"
			usr << "Written"
			Read(save)
			var/mob/Player/M
			save >> M
			client.mob = M
			M.Move(locate(/turf/misc/start/))
			del(usr)*/
		Move() //stunned? running? Walking?
			if (stun == 1)
				return 0//sorry, you can't move
			else
				if(control)
					..()
					return
				if(walking == 0)
					walking = 1
					..()
					sleep(10-speed)
					if(speed==RUN_SPEED && stamina[1] > 0) //you're running alright
						stamina[1]--
					else if(speed==RUN_SPEED && stamina[1] <= 0)
						usr << "You slowed down, lacking the stamina to run any further."
						oview(usr) << "[usr] slowed down, lacking the stamina to run any further."
						speed = WALK_SPEED
					walking = 0
				else
					return
		Login()
			..()
			src << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm1'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='charm2'></BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
			src << "<center>"+WELCOME+"</center>"
			src << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
			src << "<center><b>Announcements:</b><br>"/*+ANNOUNCEMENT+*/+LoginMessage+"</center>"
		//	src << "<center><b>MOTD:</b><br>"+LoginMessage+"</center>"
			src << "<center><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></center>"
			world << "<IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='whitecharm'> <b>[origname]</b> has logged in."
			usr << sound("./sound/bluemagic.wav",0,0,1,60)
			if(death == 1) // dead
				Deathseq()
			else
				loc = locate(xloc,yloc,zloc)
			//add memory
			if(length(memory) == 10)
				usr << "Giving you more memory"
				var/list/a  = memory
				a.Add("Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing","Nothing")
		//	if(rank=="<font color=#2211aa>E</font><font color=#2539b8>l</font><font color=#2860c6>d</font><font color=#2b88d5>e</font><font color=#2db0e3>r</font><font color=#30d7f1>s</font>")
		//		usr << "All elders have been demoted back to whitelighter status, due to the sudden surge of Elderhood."
		//		rank = null
			if(!(class=="Lower Demon"||class=="Demon"||class=="Upper Level Demon"))
				if(rank=="<font color=#ff0000 >T</font><font color=#ff3100 >h</font><font color=#ff6200 >e</font> <font color=#ffc400 >T</font><font color=#ff9300 >r</font><font color=#ff6200 >i</font><font color=#ff3100 >a</font><font color=#ff0000 >d</font>")
					usr << "Non-demons are not suppose to be given Triad status.  Status Removed."
					rank = null
					power = 0
					energyball = 0
					sighty = 0
					firemove = 0
					shimmer = 0
					shapeshift = 0
					sensey = 0
					glightning = 0
			if(class=="Whitelighter")
				text = "Whitelighter"
			if(rank=="<FONT COLOR=#ccffff>E</FONT><FONT COLOR=#b3ffff>l</FONT><FONT COLOR=#99ffff>d</FONT><FONT COLOR=#4dffff>e</FONT><FONT COLOR=#00ffff>r</FONT>")
				text = "Elder"
				verbs += /mob/Player/Powers/verb/Lightning
			astralbody = null
			Setme()
			writey = 0
			Modme()
			Levelme(usr)
			Recoverme()
			stun = 0
			control = 0
			invisibility = 0
			inviso[4] = 0
			orb = 0
			sense = 0
			emotion = null
			activepower = null
			throw = null
		/*Enter(var/obj/o)
			if(istype(o,/obj/Getables/Throwable/Athames))
				world << "You are hit by [o] "
			else
				world << "Haha"*/
		Logout()
			Saveme()
			if(astralbody)
				del(astralbody)
				astralbody = null
			connect = null
			usr << REDCHARM+" <b>You are saved.</b>"
			world << "<IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='whitecharm'> <b>[origname]</b> has logged out."
			..()
			del(usr)
		Stat()
			if(client)
				stat("[name]","[class]")
				stat("Health Counter:","[damagecounter]/[damagecounter2]")
				stat("Stamina:","[stamina[1]]/[stamina[2]]")
				stat("Money:","[money] bucks")
				if(alignment>50)
					stat("Good Alignment:"," [alignment]")
				if(alignment<-50)
					stat("Evil Alignment:"," [alignment]")
				if(alignment<=50 && alignment >=-50)
					stat("Neutral Alignment:"," [alignment]")
				if(sighty==1 && (class=="Lower Demon" || class=="Demon"))
					stat("Power:"," [power]")
				if(telekinesis[1]>=1) stat("Telekinesis:[telekinesis[1]]","[telekinesis[2]]/[telekinesis[3]]")
				if(molecular[1]>=1) stat("Molecular:[molecular[1]]","[molecular[2]]/[molecular[3]]")
				if(premonition[1]>=1) stat("Premonition:[premonition[1]]","[premonition[2]]/[premonition[3]]")
				if(telepathy[1]>=1) stat("Telepathy:[telepathy[1]]","[telepathy[2]]/[telepathy[3]]")
				if(astralproj[1]>=1) stat("Astral Projection:[astralproj[1]]","[astralproj[2]]/[astralproj[3]]")
				if(summonathame[1]>=1) stat("Summon Athame:[summonathame[1]]","[summonathame[2]]/[summonathame[3]]")
				if(firestarter[1]>=1) stat("Firestarting:[firestarter[1]]","[firestarter[2]]/[firestarter[3]]")
				if(inviso[1]>=1) stat("Invisibility:[inviso[1]]","[inviso[2]]/[inviso[3]]")
				if(powerofthree[1]==1)
					stat("You are the Power of Three with [powerofthree[2]] and [powerofthree[3]]")
				if(class == "Whitelighter")
					statpanel("Charges")
					for(var/mob/Player/M in world)
						if(M.client && M.whitelighter == origname)
							stat("[M.name] the [M.class]")
				if(coven)
					statpanel("Coven")
					stat("Coven Members Online:")
					for(var/mob/Player/M in world)
						if(M.client && M.coven==coven)
							stat("[M.name]")
				if(length(usr.contents)!=0) statpanel("Inventory",usr.contents)

				statpanel("Players")
				for(var/mob/Player/M in world)
					if(M.client && M.moddy == 0)
						stat("[M.key]", "[M.name]")
					if(M.client && M.moddy == 1)
						stat("(GM)[M.key]", "[M.name]")
/*obj/head
	density = 0
	layer = MOB_LAYER + 2
	pixel_y = 32
	male
		icon = 'male.dmi'
		m1{icon_state = "1head";}
		m2{icon_state = "2head";}
	female
		icon = 'female.dmi'
		f1{icon_state = "1head";}
		f2{icon_state = "2head";}
*/
obj/head
	density = 0
	layer = MOB_LAYER + 2
	pixel_y = 32
obj/effects
	density = 0
	layer = MOB_LAYER + 3
	icon = 'spell.dmi'
	sparkle
		icon_state = "sparkle"
		one
		two
			pixel_y = 32
	orb
		one
			icon_state = "orbup"
		two
			icon_state = "orbup2"
			pixel_y = 32
	darkorb
		one
			icon_state = "darkorb2"
		two
			icon_state = "darkorb"
			pixel_y = 32
	electric
		icon_state = "electric"
		pixel_y = 32
	star
		icon_state = "star"
