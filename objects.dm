client
	//shops?
	Topic(href)
		/*if(href == "giveupmypower")
			var/mob/Player/m = usr
			usr << "You gave up your powers and return to being human."
			m.class = "Human"
			m.damagecounter2 = 1
			m.damagecounter = 1
			m.astralproj[1] = 0
			m.astralproj[2] = 0
			m.astralproj[3] = 0
			m.telekinesis[1] = 0
			m.telekinesis[2] = 0
			m.telekinesis[3] = 0
			m.molecular[1] = 0
			m.molecular[2] = 0
			m.molecular[3] = 0
			m.premonition[1] = 0
			m.premonition[2] = 0
			m.premonition[3] = 0
			m.telepathy[1] = 0
			m.telepathy[2] = 0
			m.telepathy[3] = 0
			m.summonathame[1] = 0
			m.summonathame[2] = 0
			m.summonathame[3] = 0
			call(usr,/mob/Player/proc/Saveme)()
			m << "You feel giddy as your powers leaves you..."
			m << "<i>You have fainted.</i>"
			del(m)*/
		if(href == "herb")
			var/mob/Player/me = usr
			if(me.money>1)
				var/what = input(usr,"What herbs do you wish to buy?","CHARMED",null) in list("Fungus","White Devil","Mint","Apple","Vriesea","Walnut","*Cancel*")
				switch(what)
					if("Fungus")
						me << "Fungus purchased."
						new /obj/Getables/Herb/Fungus(usr)
					if("White Devil")
						me << "White Devil purchased."
						new /obj/Getables/Herb/White_Devil(usr)
					if("Mint")
						me << "Mint purchased."
						new /obj/Getables/Herb/Mint(usr)
					if("Apple")
						me << "Apple purchased."
						new /obj/Getables/Herb/Apple(usr)
					if("Vriesea")
						me << "Vriesea purchased."
						new /obj/Getables/Herb/Vriesea(usr)
					if("Walnut")
						me << "Walnut purchased."
						new /obj/Getables/Herb/Walnut(usr)
					if("Fungus")
						me << "Fungus purchased."
						new /obj/Getables/Herb/Fungus(usr)
					else
						return
				me.money -= 1
		if(href == "Mild")
			var/mob/Player/me = usr
			if(me.money<5)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='potion'>You purchased a Mild Vanquishing Potion for 5 bucks."
				var/obj/Getables/Throwable/Potions/Mild_Vanquishing/o = new(usr)
				me.money -= 5
				o.owner = me.origname
				o.name = "[me.origname]'s " + o.name
		if(href == "Reju")
			var/mob/Player/me = usr
			if(me.money<5)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='gpotion'>You purchased a Rejuvenation Potion for 5 bucks."
				var/obj/Getables/Drinkable/Potions/Rejuvenation_Potion/o = new(usr)
				me.money -= 5
				o.owner = me.origname
				o.name = "[me.origname]'s " + o.name
		if(href == "bottle")
			var/mob/Player/me = usr
			if(me.money<5)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='empty'>You purchased an Empty Bottle for 5 bucks."
				var/obj/Getables/Drinkable/Potions/Empty_Bottle/o = new(usr)
				me.money -= 5
				o.owner = me.origname
				o.name = "[me.origname]'s " + o.name
		if(href == "pot")
			var/mob/Player/me = usr
			if(me.money<15)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='pot'>You purchased a pot for 15 bucks."
				var/obj/Getables/Pot/o = new(usr)
				me.money -= 15
				o.owner = me.origname
				o.name = "[me.origname]'s " + o.name
		if(href == "Simple")
			var/mob/Player/me = usr
			if(me.money<25)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='athame'>You purchased a Simple Athame for 25 bucks."
				var/obj/Getables/Throwable/Athames/Simple_Athame/o = new(usr)
				me.money -= 25
				o.owner = me.origname
				o.name = "[me.origname]'s " + o.name
		if(href == "Book")
			var/mob/Player/me = usr
			if(me.money<15)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='bos'>You purchased a book for 15 bucks."
				var/obj/Getables/Book/o = new(usr)
				me.money -= 15
				o.owner = me.origname
				o.name = "[me.origname]'s " + o.name
		if(href == "Paper")
			var/mob/Player/me = usr
			if(me.money<1)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='paper'>You purchased a piece of paper for 1 buck."
				var/obj/Getables/Paper/o = new(usr)
				me.money -= 1
				o.owner = me.origname
		if(href == "Candle")
			var/mob/Player/me = usr
			if(me.money<5)
				me << "You don't have enough money."
			else
				me << "<IMG CLASS=icon SRC=\ref['object.dmi'] \ ICONSTATE='cand'>You purchased a candle for 5 bucks."
				var/obj/Getables/Candle/Candleunlit/o = new(usr)
				me.money -= 5
				o.owner = me.origname
		if(href == "firemove1")
			var/mob/Player/me = usr
			if(me.power<100)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Fire Move."
				me.power -= 100
				me.firemove = 1
				me.verbs += /mob/Player/Powers/verb/Fire_Move
				me.verbs += /mob/Player/Powers/verb/Fire_Move_Around
				me.verbs += /mob/Player/Powers/verb/Seize

				me.verbs -= /mob/Player/Powers/verb/Shimmer
				me.verbs -= /mob/Player/Powers/verb/Shimmer_Around
				me.shimmer = 0
		if(href == "firemove2")
			var/mob/Player/me = usr
			if(me.power<100)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Fire Move."
				me.power -= 100
				me.firemove = 2
				me.verbs += /mob/Player/Powers/verb/Fire_Move
				me.verbs += /mob/Player/Powers/verb/Fire_Move_Around
				me.verbs += /mob/Player/Powers/verb/Seize
				me.verbs -= /mob/Player/Powers/verb/Shimmer
				me.verbs -= /mob/Player/Powers/verb/Shimmer_Around
				me.shimmer = 0
		if(href == "shimmer")
			var/mob/Player/me = usr
			if(me.power<50)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Shimmer."
				me.power -= 50
				me.shimmer = 2
				me.verbs += /mob/Player/Powers/verb/Shimmer
				me.verbs += /mob/Player/Powers/verb/Shimmer_Around
				me.verbs += /mob/Player/Powers/verb/Seize

				me.verbs -= /mob/Player/Powers/verb/Fire_Move
				me.verbs -= /mob/Player/Powers/verb/Fire_Move_Around
				me.firemove = 0
		if(href == "tk")
			var/mob/Player/me = usr
			if(me.telekinesis[1]>=1)
				me << "Alexis says,\"You already have Telekinesis.\""
				return
			if(me.power<100)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Fire Move."
				me.power -= 100
				me.telekinesis[1] = 1
				me.telekinesis[2] = 0
				me.telekinesis[1] = expneeded[me.telekinesis[1]]
				call(me,/mob/Player/proc/Levelme)(me)
		if(href == "glightning")
			var/mob/Player/me = usr
			if(me.glightning>=1)
				me << "Alexis says,\"You already have Lightning.\""
				return
			if(me.power<200)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to use Lightning."
				me.power -= 200
				me.glightning = 1
		if(href == "Shapeshift")
			var/mob/Player/me = usr
			if(me.shapeshift==1)
				me << "Alexis says,\"You can already Shapeshift.\""
				return
			if(me.power<80)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Shapeshift"
				me.power -= 80
				me.shapeshift = 1
				call(me,/mob/Player/proc/Levelme)(me)
		if(href == "Sense")
			var/mob/Player/me = usr
			if(me.sensey==1)
				me << "Alexis says,\"You can already Sense.\""
				return
			if(me.power<30)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Sense"
				me.power -= 30
				me.sensey = 1
				call(me,/mob/Player/proc/Levelme)(me)
		if(href == "Energyball")
			var/mob/Player/me = usr
			if(me.energyball==1)
				me << "Alexis says,\"You already have Energyball.\""
				return
			if(me.power<10)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now able to Fire Move."
				me.power -= 10
				me.energyball = 1
				call(me,/mob/Player/proc/Levelme)(me)
				if(me.demonquest==3)
					me.demonquest = 4
		if(href == "Fireball")
			var/mob/Player/me = usr
			if(me.energyball==2)
				me << "Alexis says,\"You already have Fireball.\""
				return
			if(me.power<45)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now can throw fireballs."
				me.power -= 45
				me.energyball = 2
				call(me,/mob/Player/proc/Levelme)(me)
				if(me.demonquest==3)
					me.demonquest = 4
		if(href == "Health")
			var/mob/Player/me = usr
			if(me.damagecounter2 >= 10)
				me << "Alexis says,\"You can't have anymore.\""
				me.class = "Upper Level Demon"
				return
			if(me.power<(me.damagecounter)*20)
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and now gain more durability"
				me.power -= (me.damagecounter)*20
				me.damagecounter2++
				if(me.damagecounter2 == 3)
					me.class = "Demon"
				if(me.damagecounter2 >= 9)
					me.class = "Upper Level Demon"
		if(href == "Healme")
			var/mob/Player/me = usr
			if(me.damagecounter==me.damagecounter2)
				me << "Alexis says,\"you do not need healing.\""
				return
			if(me.power<(me.damagecounter2))
				me << "Alexis says,\"That will require more power if you want to trade.\""
			else
				me << "Your power was absorbed from you, and your wounds begin to seal."
				me.power -= (me.damagecounter2)
				me.damagecounter = me.damagecounter2
		if(href == "Close")
			src << browse(null,"window=name")
//Higher TK, bugged.
	Click(X,Y)
		//NOTE BUG
		//PLAYERS CAN UNFREEZE THEMSELVES IF THEY HAVE TK
		//MUST PREVENT USAGE OF POWERS IF FROZEN
		var/mob/Player/me = usr

		if(!istype(me,/mob/Player))
			return

		if(me.activepower == null && me.astralbody != "Me")
			if(!(me.stun == 1 && me.orb == 1))
				walk_towards(usr,Y)

		if(me.stun == 1 || me.death == 1 || me.orb == 1 || me.astralbody)
			return
		//temporal stasis
		/*if(me.activepower == "Orbing" && istype(X,/mob/Player/))
			var/mob/Player/m = X
			spawn()
				var/choice = alert(m,"Join orb?","CHARMED","Yes","No")
				if(choice == "Yes")
					if(me.orb == 1)
						m.orb = 1*/
		if(me.activepower == "inviso")
			me.activepower = null
			if(istype(X,/mob/Player/))
				if(me.inviso[1]>=6)
					var/mob/Player/target = X
					if(me.stamina[1]<30 || target==usr)
						return
					me.stamina[1] -= 30
					usr << "You wave a hand over [target]."
					target << "[usr] waves a hand over you, and you feel odd all over."
					target.inviso[4] = 1
					var/i
					if(me.inviso[1]==0)
						i = 1
					else
						i = me.inviso[1]
					target.invisibility = i
					spawn(i*150)
					if(target.inviso[4]==1)
						target.inviso[4] = 0
						target << "Your cloaking fades, and you are now visible to anyone in sight."
						target.invisibility = 0
			if(istype(X,/obj/))
				var/obj/target = X
				if(me.stamina[1]<30 || target==usr)
					return
				me.stamina[1] -= 30
				view() << "[usr] waves \his hand."
				var/i
				if(me.inviso[1]==0)
					i = 1
				else
					i = me.inviso[1]
				target.invisibility = i
				spawn(i*150)
					if(target)
						target.invisibility = 0
		if(me.activepower == "blowup" && istype(X,/mob/Player/))
			me.activepower = null
			var/mob/Player/target = X
			if(me.stamina[1]<30 || target==usr)
				return
			me.stamina[1] -= 30
			view() << sound('./sound/explode.wav',0,1,3,100)
			view() << "[usr] throws up \his hands and attempts to blast [X]."
			spawn()
				call(target,/mob/Player/proc/Fade)(target,40,20,20,5,0,0,)
			sleep(5)
			target.overlays -= /obj/Ungetables/Explode
			target.damagecounter -= 3
			if(target.class == "Warlock")
				target << "You copied [me]'s ability of Molecular Combustion."
				target.verbs += /mob/Player/Powers/verb/Molecular_Combustion
			var/exp = call(usr,/mob/Player/proc/Deathcheck)(target, usr)
			call(usr,/mob/Player/proc/Getexp)(usr,exp)
		if(me.activepower == "Throwing")
			var/obj/item = me.throw
			if(item && me.contents.Find(item))
				if(istype(Y,/turf/))
					item.thereyet = Y
					item.movedby = me
					me.activepower = null
					me.throw = null
					view(me) << "[me] throws \a [item]."
					walk_towards(item,Y,10-item.speed)
			me.throw = null
		if(me.activepower == "Energyball")
			if(me.stamina[1]<=25)
				return
			me.stamina[1] -= 25
			if(istype(Y,/turf/) && Y!=me.loc)
				var/obj/Ungetables/Throwable/Power/Energyball/e = new(usr.loc)
				e.thereyet = Y
				me.throw = null
				e.movedby = me
				me.activepower = null
				oview(me) << "\a [e] begans to form in [me]'s hand."
				me << "\a [e] begans to form in your hand."
				oview(me) << "[me] throws \a [e]."
				me << "You throw \a [e]."
				walk_towards(e,Y,10-e.speed)
				spawn(100)
					if(e)
						view() << "\The [e] dissipates."
						del(e)
			me.throw = null
		if(me.activepower == "lit2")
			if(!istype(X,/mob/Player/))
				return
			var/mob/Player/target = X
			while(me.stamina[1]>4 && (target in oview()))
				me.stamina[1]-=5
				view(me) << sound('./sound/zap.wav',0,0)
				var/obj/Ungetables/Lightning/e = new(usr.loc)
				e.thereyet = target.loc
				e.movedby = me
				walk_towards(e,target,10-e.speed)
				spawn(20)
					if(e)
						del(e)
				sleep(1)
			me.throw = null
		if(me.activepower == "lit3")
			if(!istype(X,/mob/Player/))
				return
			var/mob/Player/target = X
			while(me.stamina[1]>4 && (target in oview()))
				me.stamina[1]-=5
				view(me) << sound('./sound/zap.wav',0,0)
				var/obj/Ungetables/GLightning/e = new(usr.loc)
				e.thereyet = target.loc
				e.movedby = me
				walk_towards(e,target,10-e.speed)
				spawn(20)
					if(e)
						del(e)
				sleep(1)
			me.throw = null
		if(me.activepower == "WEnergyball")
			if(me.stamina[1]<=25)
				return
			me.stamina[1] -= 25
			if(istype(Y,/turf/) && Y!=me.loc)
				var/obj/Ungetables/Throwable/Power/Whitelighter_Energyball/e = new(usr.loc)
				e.thereyet = Y
				me.throw = null
				e.movedby = me
				me.activepower = null
				oview(me) << "\a [e] begans to form in [me]'s hand."
				me << "\a [e] begans to form in your hand."
				oview(me) << "[me] throws \a [e]."
				me << "You throw \a [e]."
				walk_towards(e,Y,10-e.speed)
				spawn(100)
					if(e)
						view() << "\The [e] dissipates."
						del(e)
			me.throw = null
		if(me.activepower == "Fireball")
			if(me.stamina[1]<=25)
				return
			me.stamina[1] -= 25
			if(istype(Y,/turf/) && Y!=me.loc)
				var/obj/Ungetables/Throwable/Power/Fireball/e = new(usr.loc)
				view() << './sound/fire.wav'
				e.thereyet = Y
				me.throw = null
				e.movedby = me
				me.activepower = null
				oview(me) << "\a [e] begans to form in [me]'s hand."
				me << "\a [e] begans to form in your hand."
				oview(me) << "[me] throws \a [e]."
				me << "You throw \a [e]."
				walk_towards(e,Y,10-e.speed)
				spawn(100)
					if(e)
						view() << "\The [e] dissipates."
						del(e)
			me.throw = null
		if(me.activepower == "Look at Profile" && istype(X,/mob/Player/))
			me.activepower = null
			var/mob/Player/target = X
			usr << "You look at [target]."
			usr << browse("<STYLE>link {text-decoration: underline; color: #708090;} visited {text-decoration: none; color: #708090;}  BODY {background:#003333;color:white;} BIG IMG.icon {height: 32px; width: 32px}</STYLE> <b>[target]</b><br><b>Gender:</b>[target.gender]<p><b>Profile:</b><br>[target.profile]")
		if(me.activepower == "Scarring")
			me.activepower = null
			me.stun = 1
			view() << "[usr] squints \his eyes."
			sleep(2*(10-me.firestarter[1]))
			me.stun = 0
			if(me.stamina[1]<50)
				return
			me.stamina[1] -= 50
			var/turf/t = Y
			var/xx
			var/yy
			switch(me.dir)
				if(NORTH)
					xx=0
					yy=1
				if(SOUTH)
					xx=0
					yy=-1
				if(EAST)
					xx=1
					yy=0
				if(WEST)
					xx=-1
					yy=0
				if(NORTHEAST)
					xx=1
					yy=1
				if(SOUTHEAST)
					xx=1
					yy=-1
				if(NORTHWEST)
					xx=-1
					yy=1
				if(SOUTHWEST)
					xx=-1
					yy=-1
			for(var/i=0;i<=5;i++)
				var/turf/solid = locate(t.x+(xx*i),t.y+(yy*i),t.z)
				if(solid.density==1)
					break
				var/obj/Ungetables/Flame/f = new(locate(t.x+(xx*i),t.y+(yy*i),t.z))
				f.owner = usr
				view() << './sound/fire.wav'
				spawn(me.firestarter[1]*20)
					del(f)
			return

		if(me.activepower == "flame barrier")
			me.activepower = null
			me.stun = 1
			view() << "[usr] squints \his eyes."
			sleep(2*(10-me.firestarter[1]))
			me.stun = 0
			if(me.stamina[1]<50)
				return
			me.stamina[1] -= 50
			var/turf/t = Y
			if(me.dir==NORTH || me.dir == SOUTH)
				for(var/i=-3;i<=3;i++)
					var/obj/Ungetables/Flame/f = new(locate(t.x+i,t.y,t.z))
					f.owner = usr
					view() << './sound/fire.wav'
					spawn(me.firestarter[1]*20)
						del(f)
				return
			if(me.dir==EAST || me.dir == WEST)
				for(var/i=-3;i<=3;i++)
					var/obj/Ungetables/Flame/f = new(locate(t.x,t.y+i,t.z))
					f.owner = usr
					view() << './sound/fire.wav'
					spawn(me.firestarter[1]*20)
						del(f)
				return
			if(me.dir==SOUTHEAST || me.dir == NORTHWEST)
				for(var/i=-3;i<=3;i++)
					var/obj/Ungetables/Flame/f = new(locate(t.x-i,t.y-i,t.z))
					f.owner = usr
					view() << './sound/fire.wav'
					spawn(me.firestarter[1]*20)
						del(f)
				return
			else
				for(var/i=-3;i<=3;i++)
					var/obj/Ungetables/Flame/f = new(locate(t.x+i,t.y+i,t.z))
					f.owner = usr
					view() << './sound/fire.wav'
					spawn(me.firestarter[1]*20)
						del(f)
				return
		if(me.activepower == "Torch")
			me.activepower = null
			if(istype(X,/mob/Player/))
				me.activepower = null
				var/mob/Player/target = X
				view() << "[usr] squints \his eyes at [target]."
				me.stun = 1
				sleep(2*(10-me.firestarter[1]))
				me.stun = 0
				if(!target)
					return
				if(me.stamina[1]<10 || me==target)
					return
				me.stamina[1] -= 10
				view() << './sound/fire.wav'
				view() << "A single flame leaps out from nowhere and sets [target] alight."
				var/obj/Ungetables/Flame/f = new(target.loc)
				f.owner = usr
				spawn(me.firestarter[1]*20)
					del(f)
				/*if(target)
					target.damagecounter -= 1
					var/exp = call(target,/mob/Player/proc/Deathcheck)(target, f.owner)
					usr << "[exp] [target] [f.owner]"
					call(f.owner,/mob/Player/proc/Getexp)(f.owner,exp)*/
				return
			if(istype(X,/obj/))
				var/obj/o = X
				if(o.name == "candle")
					view() << "[usr] squints \his eyes at a candle."
					me.stun = 1
					sleep(2*(10-me.firestarter[1]))
					me.stun = 0
					if(!o)
						return
					if(me.stamina[1]<10)
						return
					me.stamina[1] -= 10
					//the candle lights up
					view() << './sound/fire.wav'
					view() << "[usr] squints \his eyes and a small flame begins to dance on top of the candle."
					new /obj/Getables/Candle/Candlelit1(o.loc)
					del(o)
				return
			if(istype(X,/turf/))
				view() << "[usr] squints \his eyes."
				me.stun = 1

				sleep(2*(10-me.firestarter[1]))
				me.stun = 0
				if(me.stamina[1]<10)
					return
				me.stamina[1] -= 10
				view() << "A single flame leaps out from nowhere."
				view() << './sound/fire.wav'
				var/obj/Ungetables/Flame/e = new(X)
				e.owner = usr
				spawn(me.firestarter[1]*20)
					del(e)
		if(me.activepower == "Look" && istype(X,/obj/))
			me.activepower = null
			var/obj/target = X
			if(target.desc)
				usr << "<br><b>[target]</b><br><i>[target.desc]</i>"
		if(me.activepower == "Touch" && istype(X,/mob/Player/))
			me.activepower = null
			var/mob/Player/target = X
			var/list/around = oview(2,me)
			if(around.Find(target))
				if(me.stamina[1]<=150)
					return
				me.stamina[1] -= 150
				me << "Your fingers burn deadly marks onto [target]'s skin."
				oview(me) << "[me] lays \his fingers upon [target], causing the latter's skin to burn."
				target.damagecounter = 0
				var/exp = call(/mob/Player/proc/Deathcheck)(target, me)
				call(/mob/Player/proc/Getexp)(me,exp)
				sleep(10)
				if(target.class == "Warlock")
					target << "You copied [me]'s ability of Touch of Death."
					target.verbs += /mob/Player/Powers/verb/Touch_of_Death
			else
				me << "You need to get closer to [target]."
				return
		if(me.activepower == "Suicide" && istype(X,/mob/Player/))
			if(me.stamina[1]<=25)
				return
			me.stamina[1] -= 25
			usr << "You channel images of self harm into the target."
			var/mob/Player/target = X
			target.Memory(target,"Thoughts of Suicide")
			if(target.class == "Warlock")
				target << "You copied [me]'s ability to implant Suicide Thoughts."
				target.verbs += /mob/Player/Powers/verb/Suicide_Thoughts
			var/count = 0
			for(var/i=1;i<=10;i++)
				if(target.memory[i] == "Thoughts of Suicide")
					count += 1
			if(count==2)
				oview(target) << "<i>[target] has a look of unease on the face.</i>"
			if(count==3)
				target << "You suddenly feel the need to do physical harm upon yourself."
			if(count==5)
				target << "You cannot control your emotions, succumbing to the dark thoughts of your mind and committed suicide."
				oview(target) << "Unable to resist the dark thoughts in the mind, [target] suicides."
				target.damagecounter = 0
				var/exp = call(/mob/Player/proc/Deathcheck)(target, usr)
				call(/mob/Player/proc/Getexp)(usr,exp)
			me.activepower = null
		if(me.activepower == "Heal" && istype(X,/mob/Player/))
			me.activepower = null
			var/mob/Player/target = X
			while(target && target.damagecounter<target.damagecounter2 && me.stamina[1]>=10 && me.stun==0)
				var/list/around = oview(1,me)
				if(around.Find(target))
					me << "You pour your energy into the wounds and slowly heals [target]."
					target << "Warmth spreads over your wounds as [me] heals you."
					me.stamina[1] -= 10
					target.damagecounter++
					if(target.damagecounter>=target.damagecounter2)
						target.damagecounter = target.damagecounter2
					sleep(10)
				else
					me << "You need to get closer to [target]."
					return
		if(me.activepower == "Mental" && istype(X,/mob/Player/))
			me.activepower = null
			var/mob/Player/target = X
			while(target && target.damagecounter>0 && me.stamina[1]>=10 && me.stun==0)
				var/list/around = oview(1,me)
				if(around.Find(target))
					me << "You mentally ignited and invoked [target]'s past memories."
					target << "A sharp pain sears through your head as images flood your mind."
					if(target.class == "Warlock")
						target << "You copied [me]'s ability to electrocute minds."
						target.verbs += /mob/Player/Powers/verb/Electro_Mental_Ignitions
					me.control = 1
					target.control = 1
					target.stun = 1
					spawn()
						call(target, /mob/Player/proc/Effects)("electric")
						if(target.client)
							call(target, /mob/Player/proc/Effects)("vision")
						call(target, /mob/Player/proc/Effects)("float")
					call(usr, /mob/Player/proc/Effects)("float")
					me.stamina[1] -= 10
					target.damagecounter--
					me.control = 0
					var/exp = call(/mob/Player/proc/Deathcheck)(target, me)
					call(/mob/Player/proc/Getexp)(me,exp)
				else
					//me << "You need to get closer to [target]."
					return
		if(me.activepower == "Read Mind")
			me.activepower = null
			if(istype(X,/mob/Player))
				var/mob/Player/target = X
				if(target == me)
					return
				if(me.telepathy[1]<3)
					var/readlevel = rand(1,me.telepathy[1]*2)
					if(me.stamina[1]<5)
						return
					me << "You focus intently into reading [target]'s thoughts."
					me.Memory(me,"Reading [target]'s thoughts.")
					me.stamina[1]-=5
					sleep((10-me.telepathy[1]))
					if(target!=null)
						me << "<i>[target.memory[readlevel]]</i>."
						if(target.client && target.telepathy[1]>3)
							target << "You feel someone probing into your mind."
						if(target.class == "Warlock")
							target << "You copied [me]'s ability to Read Minds."
							target.verbs += /mob/Player/Powers/verb/Read_Mind
				else
					if(me.stamina[1]<5)
						return
					me.stamina[1]-=5
					me << "You focus intently into reading [target]'s thoughts."
					me.Memory(me,"Reading [target]'s thoughts.")
					sleep((10-me.telepathy[1]))
					for(var/i=1;i<=(me.telepathy[1]*2);i++)
						if(target!=null)
							me << "<i>[target.memory[i]]</i>."
							if(target.memory[i]=="Nothing")
								break
					if(target.client && target.telepathy[1]>3)
						target << "You feel someone probing into your mind."
					if(target.class == "Warlock")
						target << "You copied [me]'s ability to Read Minds."
						target.verbs += /mob/Player/Powers/verb/Read_Mind
		if(me.activepower=="Temporal Stasis" || me.activepower =="Temporal Stasis (Individual)")
			var/list/targets
			if(me.activepower=="Temporal Stasis (Individual)")
				if(me.stamina[1]>=5)
					targets = view(0,X)
					me.stamina[1] -= 5
			else
				if(me.stamina[1]>=25)
					targets = view(me.molecular[1],X)
					me.stamina[1] -= 25
			view() << sound('./sound/freeze1.wav',0,0,0,60)
			var/individual = 0
			for(var/i=1;length(targets)!=0&&i<=length(targets);i++)
				if(individual==0 && (istype(targets[i],/obj/) || istype(targets[i],/mob/Player/)))
					if(istype(targets[i],/obj/))
						var/obj/ob = targets[i]
						if(ob.frozen == 0 && ob.loc!=me && ob.movable==1 && ob.movedby!=null) //you can freeze the number of your level >.>
							if(me.activepower =="Temporal Stasis (Individual)")
								individual = 1
							walk(ob,0)
							ob.frozen = 1
							me << "You throw up your hands and freezes \a [ob]."
							me.Memory(me,"Freezing \a [ob] in time.")
							oview(me) << "[me] throw up \his hands and freezes \a [ob]."
							spawn(me.molecular[1]*10)
								if(ob.frozen == 1)
									view(ob) << "[ob] unfreezes."
									walk_towards(ob,ob.thereyet,10-ob.speed)
									ob.frozen = 0
						else
							if(ob.frozen == 1)
								view(ob) << "[ob] unfreezes."
								walk_towards(ob,ob.thereyet,10-ob.speed)
								ob.frozen = 0
					if(istype(targets[i],/mob/Player/))
						var/mob/Player/target = targets[i]
						if(target.stun == 0 && target!=me)
							if(me.activepower =="Temporal Stasis (Individual)")
								individual = 1
							target.stun = 1
							me << "You throw up your hands and freezes [target]."
							if(target.class == "Warlock")
								target << "You copied [me]'s ability to freeze time."
								target.verbs += /mob/Player/Powers/verb/Temporal_Stasis
							me.Memory(me,"Freezing \a [target] in time.")
							oview(me) << "[me] throw up \his hands and freezes [target]."
							spawn(me.molecular[1]*10)
								if(target && target.stun == 1)
									target.stun = 0
									view(target) << "[target] unfreezes."
						else
							if(target && target.stun == 1)
								view(target) << "[target] unfreezes."
								target.stun = 0
			me.activepower=null
		//when tk witch clicks on
		if(istype(X,/obj))
			var/obj/O = X
			if(istype(O,/obj) && O!=null && O.movable==1 && me.activepower=="Telekinetic Repel")
				me.activepower = null
				if(me.stamina[1]<5)
					me << "You try to move \the [O], but you are too mentally exhausted."
					return
				me.stamina[1] -= 5
				var/lag = 5 - me.telekinesis[1]
				if(lag < 0) lag = 0//too fast
				var/dist = me.telekinesis[1] + 1
				if(dist>5) dist = 5
				O.frozen = 0
				me << "You flick, you send the [O] away from you."
				me.Memory(me,"Using telekinesis on [O]")
				oview(me) << "[me] telekinetically repelled the [O]."
				walk_away(O,me,dist,lag)
				O.movedby = me
				spawn(10)
					walk(O,0)
					O.movedby = null
					call(O,/obj/proc/Break)(O)
					//O.movedby = null
			if(istype(O,/obj) && O!=null && O.movable==1 && me.activepower=="Telekinetic Towards")
				me.activepower = null
				if(me.stamina[1]<5)
					me << "You try to move \the [O], but you are too mentally exhausted."
					return
				me.stamina[1] -= 5
				var/lag = 5 - me.telekinesis[1]
				if(lag < 0) lag = 0//too fast
				O.frozen = 0
				me << "You mentally moved the [O] towards you."
				me.Memory(me,"Using telekinesis on [O]")
				oview(me) << "[me] telekinetically attracted the [O]."
				walk_to(O,me.loc,1,lag)
				O.movedby = me
				spawn(10)
					O.movedby = null
					walk(O,0)
					call(O,/obj/proc/Break)(O)
			..()
		if(istype(X,/mob/Player))
			var/mob/Player/O = X
			if(istype(O,/mob/Player) && O!=null && me.telekinesis[1]>=4 && me.activepower=="Telekinetic Repel")
				me.activepower = null
				if(me.stamina[1]<5)
					me << "You try to move [O], but you are too mentally exhausted."
					return
				me.stamina -= 5
				O.control = 1
				var/dist = me.telekinesis[1] + 1
				if(dist>5) dist = 5
				me << "You flick, you send [O] away from you."
				me.Memory(me,"Using telekinesis on [O]")
				oview(me) << "[me] telekinetically repelled the [O]."
				if(O.class == "Warlock")
					O << "You copied [me]'s ability of telekinesis."
					O.verbs += /mob/Player/Powers/verb/Telekinesis
				walk_away(O,me,dist)
				spawn(10)
					walk(O,0)
					O.control = 0
			if(istype(O,/mob/Player) && O!=null && me.telekinesis[1]>=5 && me.activepower=="Telekinetic Towards")
				me.activepower = null
				if(me.stamina[1]<5)
					me << "You try to move [O], but you are too mentally exhausted."
					return
				me.stamina -= 5
				me << "You mentally moved [O] towards you."
				me.Memory(me,"Using telekinesis on [O]")
				oview(me) << "[me] telekinetically attracted [O]."
				if(O.class == "Warlock")
					O << "You copied [me]'s ability of telekinesis."
					O.verbs += /mob/Player/Powers/verb/Telekinesis
				O.control = 1
				walk_to(O,me,1)
				spawn(10)
					walk(O,0)
					O.control = 0
			..()
		..()
	MouseDrag(O,undero)
		var/turf/locato = undero
		var/mob/Player/M = usr
		if(M.stun == 1)
			return
		if(O!=null && istype(O,/mob/Player) && M.activepower=="Telekinesis")// && M.telekinesis[1]>=3)
			var/mob/Player/target = O
		//check if move into object too! ><
			if(target.class == "Warlock")
				target.activepower = "Telekinesis"
				target << "You copied [usr]'s ability of telekinesis."
				target.verbs += /mob/Player/Powers/verb/Telekinesis
			if(locato!=null && locato.density == 0)
				if(M.stamina[1]>1)
					//if(locato.density!=1)
					walk_to(target,locate(locato.x,locato.y,locato.z),0)
					target.control = 1
					var/period
					if(M.telekinesis[1]>=3 && M.telekinesis[1]<7)
						period = 4
					if(M.telekinesis[1]>=7)
						period = 20
					spawn(period)
						target.control = 0
						M.activepower = null
						walk_to(target,0,0,10-M.telekinesis[1])
					//o.loc = locate(locato.x,locato.y,locato.z)
						M.stamina[1] -= 2
				else
					usr << "Your mental reserves are not enough."
			else
				walk_to(target,0)
				M.activepower = null
				target.control = 0
		if(O!=null && istype(O,/obj) && M.activepower=="Telekinesis")// && M.telekinesis[1]>=3) //need to be level 5 to use
			var/obj/o = O
			if(o.movable==1)
		//check if move into object too! ><
				if(locato!=null && locato.density == 0)
					if(M.stamina[1]>0)
						//if(locato.density!=1)
						var/lag = 8 - M.telekinesis[1]
						if(lag < 0) lag = 0//too fast
						walk_to(o,locate(locato.x,locato.y,locato.z),0,lag)
						//o.loc = locate(locato.x,locato.y,locato.z)
						M.stamina[1]--
						o.movedby = M
						o.frozen = 0
					else
						usr << "Your mental reserves are not enough."
				else
					o.movedby = null
					M.activepower = null
					..()
		if(O!=null && istype(O,/turf/) && M.activepower=="Burn")// && M.telekinesis[1]>=3) //need to be level 5 to use
			if(locato!=null && locato.density == 0)
				if(M.stamina[1]>0)
					M.stamina[1]--
					var/obj/Ungetables/Flame/f = new(undero)
					f.owner = usr
					view() << './sound/fire.wav'
					spawn(M.firestarter[1]*20)
						del(f)
				else
					usr << "Your mental reserves are not enough."
			else
				M.activepower = null
				..()
		if(O!=null && istype(O,/turf/) && M.activepower=="lit")// && M.telekinesis[1]>=3) //need to be level 5 to use
			if(M.stamina[1]>0)
				M.stamina[1]--
				view(M) << sound('./sound/zap.wav',0,0)
				var/obj/Ungetables/Lightning/e = new(usr.loc)
				e.thereyet = undero
				M.throw = null
				e.movedby = usr
				walk_towards(e,undero,10-e.speed)
				spawn(30)
					if(e)
						del(e)
			else
				M.activepower = null
				..()
					/*o.movedby = null
					M.activepower = null
					walk_to(o,0)
					if(istype(locato, /mob/Player/))
						var/mob/Player/v = locato
						locato << "You have been impaled by \a [o.name]."
						oview(locato) << "[locato.name] has been impaled by \a [o.name]."
						o.loc = (locate(locato.x,locato.y,locato.z))
						v.damagecounter -= o.damage
						//check if mob died
						var/death = call(/mob/Player/proc/Deathcheck)(v)
						//check if skill level up
						if(death==1)
							M.telekinesis[2]+= v.damagecounter2
							call(/mob/Player/proc/Levelme)(M)
					call(/obj/proc/Break)(o)
					walk_to(o,0)*/
/*		if(O!=null && istype(O,/mob/Player) && M.activepower=="Burn")// && M.telekinesis[1]>=3)
			var/mob/Player/target = O
		//check if move into object too! ><
			if(target.class == "Warlock")
				target << "You copied [usr]'s ability of telekinesis."
				target.verbs += /mob/Player/Powers/verb/Telekinesis
			if(locato!=null && locato.density == 0)
				if(M.stamina[1]>1)
					//if(locato.density!=1)
					walk_to(target,locate(locato.x,locato.y,locato.z),0)
					if(!target)
						return
					target.control = 1
					var/period
					if(M.telekinesis[1]>=3 && M.telekinesis[1]<7)
						period = 4
					if(M.telekinesis[1]>=7)
						period = 20
					spawn(period)
						target.control = 0
						M.activepower = null
						walk_to(target,0,0,10-M.telekinesis[1])
					//o.loc = locate(locato.x,locato.y,locato.z)
						M.stamina[1] -= 2
				else
					usr << "Your mental reserves are not enough."
			else
				walk_to(target,0)
				M.activepower = null
				target.control = 0*/
	MouseUp(O,L)
		if(istype(usr,/mob/Player))
			var/mob/Player/me = usr
			if(me.activepower == "Telekinesis")
				me.activepower = null
			if(me.activepower == "Burn")
				me.activepower = null
			if(me.activepower == "lit")
				me.activepower = null
			if(me.activepower == "tkorb" && me.tkorbobj)
				me.activepower = null
				var/turf/ll = L
				if(me.stamina[1]<20 || ll.density == 1)
					return
				me.stamina -= 20
				var/obj/o = me.tkorbobj
				var/obj/fakeo = new(o.loc)
				var/ic = o.icon
				o.movedby = null
				walk(o,0)
				o.frozen = 1
				view() << sound('./sound/orb2.wav',0,0,1,100)
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



				fakeo.loc = L
				view() << sound('./sound/orb2.wav',0,0,1,100)
				fakeo.icon = o.icon
				fakeo.icon_state = o.icon_state
				//clone in place, now to effect it
				for(var/i=5;i>0;i--)
					fakeo.pixel_y = i*2
					var/icon/look = new(o.icon)
					switch(i)
						if(1)
							look.Blend('./smallorb/orb4.dmi',ICON_AND)
						if(2)
							look.Blend('./smallorb/orb3.dmi',ICON_AND)
						if(3)
							look.Blend('./smallorb/orb2.dmi',ICON_AND)
						if(4)
							look.Blend('./smallorb/orb1.dmi',ICON_AND)
					fakeo.icon = look
					sleep(1)
					del(look)

				for(var/i=10;i>=0;i--)
					fakeo.icon = o.icon
					fakeo.icon_state = o.icon_state
					fakeo.icon += rgb (10*i,10*i,20*i)
					sleep(1)
				//coloured it, orb away

				del(fakeo)
				o.invisibility = 0
				o.loc = L
				o.frozen = 0
				o.icon = ic

				me.tkorbobj = null
			..()
	MouseDown(O)
		if(istype(usr,/mob/Player))
			var/mob/Player/me = usr
			if(istype(O,/obj/))
				var/obj/o = O
				if(o.movable == 1)
					if(me.activepower=="tkorb")
						me.tkorbobj = o

		//check movement object again
//Lower TK?
	//MouseDown()
		//memorise the item
		//walk_to(Ref,Trg,Min=0,Lag=0)


//	Walkaway
/*
			/*Automove.... it T_T*/
			var/objx
			var/objy
			var/locx
			var/locy
			//move x first...
			if( (locx-objx) > 0)//positive=loc on right of obj, viceversa

*/
/*Mouseup - When button removed, return TURF beneath obj.
				NO OBJ, no return
	  Click - Mouse must go up and down on the same object.
	  			Returns TURF beneath it.
	  Mousedown - Immediately whe mouse goes down, returns turf under
	*/
/*	MouseUp(loca)
		var/mob/Player/me = usr
		var/obj/o = me.tempvar
		if(o != null)
			o.Move(loca)
	MouseDown(var/obj/o,start,end)
		var/mob/Player/me = usr
		if(me.tempvar==null)
			me.tempvar = o
		me.tempvar = end

		if(istype(o,/obj/) && o.movable == 1)
			usr << "moving: [o]"
			var/mob/Player/me = usr
			if(me.telekinesis[1] >= 1)
				me.tempvar = o
				usr << "mobing [o] from [start] to [end]"
				o.loc = end
*/
obj
	Bump(T)
		if(istype(T,/mob/Player))
			var/mob/Player/tar = T
			var/mob/Player/user = src.movedby
			if(tar != src.movedby)
				if(tar.name == "Triad" && user.name == "Triad")
					return
				else
					view(tar) << "[tar] has been hit by [src.movedby]!"
			else
				return
			tar.damagecounter -= src.damage
			walk_to(src,0)
			var/exp = call(/mob/Player/proc/Deathcheck)(tar, user)
			if(tar == user)
				exp = -exp
			call(/mob/Player/proc/Getexp)(user,exp)

			if(user.activepower == "Telekinesis")
				user.activepower = null
			if(tar && (tar.class == "Kelnerth" || tar.class=="Dymas"))
				tar.demonquest = user
		if(istype(T,/obj/))
			var/obj/o = T
			if(o.name==src.name)
				return
		call(src,/obj/proc/Break)(src)
	Move(l)
		/*var/turf/t = l
		if(t.density == 1)
			walk(src,0)
			call(src,/obj/proc/Break)(src)
			return*/
		..()
		if(movable==0)
			return
		//when we move, we check argh!!!
/*		if(damage == 0)
			return
		var/list/beep = view(0,src)
		var/mob/Player/target
		for(var/i=1;length(beep)!=0&&i<=length(beep);i++)
			if(istype(beep[i],/mob/Player))
				target = beep[i]
				//prepare to attack
		if(target && src)
			var/mob/Player/tar = target
			var/mob/Player/user = src.movedby
			tar.damagecounter -= src.damage
			if(target != src.movedby)
				view(target) << "[target] has been hit by [src.movedby]!"
			walk_to(src,0)
			var/exp = call(/mob/Player/proc/Deathcheck)(tar, user)
			if(target == user)
				exp = -exp
			call(/mob/Player/proc/Getexp)(user,exp)

			if(user.activepower == "Telekinesis")
				user.activepower = null
			if(tar && (tar.class == "Kelnerth" || tar.class=="Dymas"))
				tar.demonquest = user
			call(src,/obj/proc/Break)(src)
*/
		if(loc == thereyet)
			thereyet = null
			call(src,/obj/proc/Break)(src)

			//world << "My location is [beep.x][beep.y][beep.z]"
				/*if(istype(beep.contents[i],/mob/Player))
					target = beep.contents[i]
					i++*/
/*			if(target!=null) // yes! hit someone!
				target << "Ouch!!!!!!!!!"
				world << "Hit [target][i]"
			else
				world << "No target"*/

	//more skills for the tk witch
	icon = 'object.dmi'
	var
		thereyet
		moving = 0
		movable = 0 //not movable
		breakable = 0 //0 for no, 1 for yes, 2 for vanish
		speed = 10 //moves at norm speed?
		damage = 0
		movedby
		frozen = 0
		movement = 0
		owner = null
		amount
	Misc
		Paper
			icon = 'object.dmi'
			icon_state = "paper"
			name = "paper"
			desc = "In scribbly handwriting, a spell has been written on this greasy piece of paper. <p> <b>We call upon the ancient powers<br>To summon one to save a soul.</b>"
		Book_of_Shadows
			movable = 0
			icon = 'object.dmi'
			desc = "A thick looking tome, looking very important, sits here."
			bottom
				icon_state = "bost"
				name = "Book of Shadows"
			top
				icon_state = "bosb"
				name = "Book of Shadows"
			Click()
				re()
			verb
				Create_Spell()
					set src in view(1)
					set category = "Book of Shadows"
					var
						entry
						cost //stamina needed
						pthree //power of three required?
						type //summoning, vanquishing?
						spell //the spell itself
						spellshrunk //the ckey of the spell
						candle //candle required?
						affectwho
						affectarea
						bywho
						bywhokey
					var/mob/Player/me = usr
					if(me.accessspell==0)
						view()<<"<b>The Book of Shadows, rejects [me]'s request to Create A Spell."
						me<<REDCHARM+"Your access to the Book of Shadows: Creating Spells, has been revoked."
						return
					entry = "Spell"
					candle = alert("Candle required?","CHARMED","Yes","No")
					spell = input("And the spell goes like?","CHARMED",null)
					pthree = alert("Power of Three required?","CHARMED","Yes","No")
					if(spell==null)
						usr << "Please enter something."
						return
					spellshrunk = ckey(spell)
					if(spellshrunk=="" || spellshrunk == null)
						usr << "Please enter something."
						return
					type = input("What does the spell do? (for others effects, post on the forum. I'll make it available in spell making soon)","CHARMED",null) in list("Summon","Vanquish")
					affectarea = input("Who does it involve?","CHARMED",null) in list("Yourself","Those Around You","Someone","Someone (Must be In Sight)")
					if(affectarea == "Someone" || "Someone (Must be In Sight)")
						affectwho = input("Who do you have in mind? (Insert the whole full name with correct capitalization of the victim here)","CHARMED",null)
					bywho = me.origname
					bywhokey = me.key
					cost = 100//cost of the spell is the length of it
					if(candle=="Yes")
						cost -= 20
					if(affectarea == "Someone" || affectarea == "Those Around You")
						cost += 50
					if(type=="Vanquish")
						cost += 50
					if(pthree=="Yes")
						cost /= 3
					cost = round(cost) - rand(0,10)

					var/yesno = alert("Candle:[candle]\nPower of Three:[pthree]\n\n[spell]\n\n\An [type] spell for [affectarea][affectwho].\nRequires [cost] stamina.","CHARMED","Create Spell","No")
					if(yesno != "No")
						usr << "Spell created. Waiting for Moderator's approval."
						var/mob/Player/mod
						for(mod in world)
							if(mod.moddy == 1)
								yesno = alert(mod,"New spell:\n[spell]","Charmed Moderator","Approve","Disapprove")
								if(yesno == "Approve")
									usr << "Your spell has been approved by [mod.key]."
									break
								else
									return
						var/savefile/bos = new("./bos/spell.sav")
						bos["/[spellshrunk]/entry"] << entry
						bos["/[spellshrunk]/bywho"] << bywho
						bos["/[spellshrunk]/bywhokey"] << bywhokey
						bos["/[spellshrunk]/cost"] << cost
						bos["/[spellshrunk]/pthree"] << pthree
						bos["/[spellshrunk]/type"] << type
						bos["/[spellshrunk]/spell"] << spell
						bos["/[spellshrunk]/spellshrunk"] << spellshrunk
						bos["/[spellshrunk]/candle"] << candle
						bos["/[spellshrunk]/approved"] << "[mod.key]"
						bos["/[spellshrunk]/affectwho"] << affectwho
						bos["/[spellshrunk]/affectarea"] << affectarea
				Turn_Page_Forwards()
					set category = "Book of Shadows"
					set src in view(1)
					page++
					oview(usr) << "[usr] flips a page in the Book of Shadows."
					view() << sound('./sound/turn.wav',0,0,0,100)
					re()
				Turn_Page_Backwards()
					set category = "Book of Shadows"
					set src in view(1)
					if(page<=1)
						page=1
					else
						page--
						oview(usr) << "[usr] flips a page in the Book of Shadows."
						view() << sound('./sound/turn.wav',0,0,0,100)
					re()
				Turn_to_Page(p as num)
					set category = "Book of Shadows"
					set src in view(1)
					if(p<=1)
						p=1
					page = p
					oview(usr) << "[usr] turns the pages of the Book of Shadows."
					view() << sound('./sound/turn.wav',0,0,0,100)
					re()
				Insert_Entry()
					set category = "Book of Shadows"
					set src in view(1)
					var/mob/Player/me = usr
					var/ans = alert("NO Blank Entries or False Entries. If your spell hasn't been approved then do NOT enter it in here or you will lose your access to the Book of Shadows.","Book of Shadows","Proceed","Cancel")
					if(ans == "Proceed")
						if(me.access==0)
							view()<<"<b>The Book of Shadows, shocks [me] as they try to open it."
							me<<REDCHARM+"Your access to the Book of Shadows: Inserting Entries, has been revoked."
							return
						if(me.writey == 0 || me.access == 1)
							me.writey = 1
							var/title = input("What is the title of your entry?","Book Of Shadows",null)
							var/cont = input("What are the contents?","Book Of Shadows",null)
							me.writey = 0
							var/pageno=1
							var/savefile/bos = new("./bos/book.sav")
							while(bos.dir.Find("p[pageno]")) //start at page 2
								pageno++ //next page
							usr << "Info written into page [pageno]"
							bos["/p[pageno]/entry"] << "Info"
							bos["/p[pageno]/title"] << title
							bos["/p[pageno]/bywho"] << me.origname
							bos["/p[pageno]/bywhokey"] << me.key
							bos["/p[pageno]/explanation"] << cont
						re()

						if(ans == "Cancel")
							return
				Read_Entry()
					set category = "Book of Shadows"
					set src in view(1)
					var/mob/Player/M = usr
					if(M.accessread==0)
						view()<<"<b>The Book of Shadows, shocks [M] as they try to open it."
						M<<REDCHARM+"Your access to the Book of Shadows: Creating Spells, has been revoked."
						return
					re()
			proc/re()
				if(page==1)
					var/bo = {"
						<html>
						<head>
						<title>Book of Shadows</title>
						<STYLE>
						link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
						TABLE {background: black;color=brown; size=1;}
						.:link {text-decoration: none; color: brown;}
						.:visited {text-decoration: none; color: brown;}
						.:hover {text-decoration: none; color: silver;}
						</STYLE>
						</head>
						<body bgcolor=Black bgproperties=fixed>
						<center>
						<b><font size=5 color=brown>BOOK OF SHADOWS</font></b>
						</center>
						</font>
						</body>
						</html>
						"}
					usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")
					return
				var
					title // of the page
					bywho
					bywhokey
					entry
					explanation
				var/pageno = page
				var/savefile/bos = new("./bos/book.sav")
				bos["/p[pageno]/entry"] >> entry
				switch(entry)
					if("Info")
						bos["/p[pageno]/title"] >> title
						bos["/p[pageno]/bywho"] >> bywho
						bos["/p[pageno]/bywhokey"] >> bywhokey
						bos["/p[pageno]/explanation"] >> explanation

						var/bo = {"
							<html>
							<head>
							<title>Book of Shadows</title>
							<STYLE>
							link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
							TABLE {background: black;color=brown; size=1;}

							.:link {text-decoration: none; color: brown;}
							.:visited {text-decoration: none; color: brown;}
							.:hover {text-decoration: none; color: silver;}

							</STYLE>

							</head>
							<body bgcolor=Black bgproperties=fixed>
							<center>
							<b><font size=5 color=brown>[title]</font></b><br>
							<font size=2 color=brown>[bywho]([bywhokey])
							</center>
							<p>[explanation]
							<hr color=brown>
							<center>Page[page]</center>
							</font>
							</body>
							</html>
							"}
						usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")
/*
					if("Spell")
						bos["/p[pageno]/cost"] >> cost
						bos["/p[pageno]/pthree"] >> pthree
						bos["/p[pageno]/type"] >> type
						bos["/p[pageno]/bywho"] >> bywho
						bos["/p[pageno]/bywhokey"] >> bywhokey
						bos["/p[pageno]/spell"] >> spell
						bos["/p[pageno]/spellshrunk"] >> spellshrunk
						bos["/p[pageno]/candle"] >> candle
						bos["/p[pageno]/explantion"] >> explanation
						bos["/p[pageno]/approved"] >> approved
						bos["/p[pageno]/title"] >> title
						bos["/p[pageno]/affectwho"] >> affectwho
						bos["/p[pageno]/affectarea"] >> affectarea

						if(candle=="Yes")
							candle = "A candle is needed."
						if(pthree=="Yes")
							pthree = "The Power of Three is required."
						if(affectwho==null)
							affectarea = null
					// background='http://img.photobucket.com/albums/v291/spirare/bos.gif'
						var/bo = {"
							<html>
							<head>
							<title>Book of Shadows</title>
							<STYLE>
							link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
							TABLE {background: black;color=brown; size=1;}

							.:link {text-decoration: none; color: brown;}
							.:visited {text-decoration: none; color: brown;}
							.:hover {text-decoration: none; color: silver;}

							</STYLE>

							</head>
							<body bgcolor=Black bgproperties=fixed>
							<center>
							<b><font size=5 color=brown>[title]</font></b><br>
							<font size=2 color=brown>[bywho]([bywhokey])
							[approved]
							</center>
							<p>[explanation]
							<p>[type] spell for [affectarea][affectwho]. [candle] [pthree] [cost] stamina needed.
							<p>[spell]
							<hr color=brown>
							<center>Page[page]</center>
							</font>
							</body>
							</html>
							"}
						usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")
*/

					else
						var/bo = {"
							<html>
							<head>
							<title>Book of Shadows</title>
							<STYLE>
							link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
							TABLE {background: black;color=brown; size=1;}

							.:link {text-decoration: none; color: brown;}
							.:visited {text-decoration: none; color: brown;}
							.:hover {text-decoration: none; color: silver;}

							</STYLE>

							</head>
							<body bgcolor=Black bgproperties=fixed>
							<hr color=brown>
							<font size=2 color=brown>
							<center>Page[page]</center>
							</font>
							</body>
							</html>
							"}
						usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")


//						usr << "Nothing inside for now (under test)"
//						usr << "1 Temp Entry: Powers unseen from the skies, witching powers now be mine."






		GMBook_of_Shadows
			movable = 0
			icon = 'book.dmi'
			desc = "A thick looking tome, looking very important, sits here."
			bottom
				icon_state = "bosf"
				name = "Book of Eternity"
			top
				icon_state = "bosb"
				name = "Book of Eternity"
			stand1
				icon_state = "stand1"
				name = "Book of Eternity"
			stand2
				icon_state = "stand2"
				name = "Book of Eternity"
			Click()
				re()
			verb
				Create_Spell()
					set src in view(1)
					set category = "Book of Eternity"
					var
						entry
						cost //stamina needed
						pthree //power of three required?
						type //summoning, vanquishing?
						spell //the spell itself
						spellshrunk //the ckey of the spell
						candle //candle required?
						affectwho
						affectarea
						bywho
						bywhokey
					var/mob/Player/me = usr
					entry = "Spell"
					candle = alert("Candle required?","CHARMED","Yes","No")
					spell = input("And the spell goes like?","CHARMED",null)
					pthree = alert("Power of Three required?","CHARMED","Yes","No")
					if(spell==null)
						usr << "Please enter something."
						return
					spellshrunk = ckey(spell)
					if(spellshrunk=="" || spellshrunk == null)
						usr << "Please enter something."
						return
					type = input("What does the spell do? (for others effects, post on the forum. I'll make it available in spell making soon)","CHARMED",null) in list("Summon","Vanquish")
					affectarea = input("Who does it involve?","CHARMED",null) in list("Yourself","Those Around You","Someone","Someone (Must be In Sight)")
					if(affectarea == "Someone" || "Someone (Must be In Sight)")
						affectwho = input("Who do you have in mind? (Insert the whole full name with correct capitalization of the victim here)","CHARMED",null)
					bywho = me.origname
					bywhokey = me.key
					cost = 100//cost of the spell is the length of it
					if(candle=="Yes")
						cost -= 20
					if(affectarea == "Someone" || affectarea == "Those Around You")
						cost += 50
					if(type=="Vanquish")
						cost += 50
					if(pthree=="Yes")
						cost /= 3
					cost = round(cost) - rand(0,10)

					var/yesno = alert("Candle:[candle]\nPower of Three:[pthree]\n\n[spell]\n\n\An [type] spell for [affectarea][affectwho].\nRequires [cost] stamina.","CHARMED","Create Spell","No")
					if(yesno != "No")
						usr << "Spell created. Waiting for Moderator's approval."
						var/mob/Player/mod
						for(mod in world)
							if(mod.moddy == 1)
								yesno = alert(mod,"New spell:\n[spell]","Charmed Moderator","Approve","Disapprove")
								if(yesno == "Approve")
									usr << "Your spell has been approved by [mod.key]."
									break
								else
									return
						var/savefile/bos = new("./bos/GMspell.sav")
						bos["/[spellshrunk]/entry"] << entry
						bos["/[spellshrunk]/bywho"] << bywho
						bos["/[spellshrunk]/bywhokey"] << bywhokey
						bos["/[spellshrunk]/cost"] << cost
						bos["/[spellshrunk]/pthree"] << pthree
						bos["/[spellshrunk]/type"] << type
						bos["/[spellshrunk]/spell"] << spell
						bos["/[spellshrunk]/spellshrunk"] << spellshrunk
						bos["/[spellshrunk]/candle"] << candle
						bos["/[spellshrunk]/approved"] << "[mod.key]"
						bos["/[spellshrunk]/affectwho"] << affectwho
						bos["/[spellshrunk]/affectarea"] << affectarea
				Turn_Page_Forwards()
					set category = "Book of Eternity"
					set src in view(1)
					page++
					oview(usr) << "[usr] flips a page in the Book of Eternity."
					view() << sound('./sound/turn.wav',0,0,0,100)
					re()
				Turn_Page_Backwards()
					set category = "Book of Eternity"
					set src in view(1)
					if(page<=1)
						page=1
					else
						page--
						oview(usr) << "[usr] flips a page in the Book of Eternity."
						view() << sound('./sound/turn.wav',0,0,0,100)
					re()
				Turn_to_Page(p as num)
					set category = "Book of Eternity"
					set src in view(1)
					if(p<=1)
						p=1
					page = p
					oview(usr) << "[usr] turns the pages of the Book of Eternity."
					view() << sound('./sound/turn.wav',0,0,0,100)
					re()
				Insert_Entry()
					set category = "Book of Eternity"
					set src in view(1)
					var/mob/Player/me = usr
					var/ans = alert("NO Blank Entries or False Entries. If your spell hasn't been approved then do NOT enter it in here or you will lose your access to the Book of Shadows.","Book of Eternity","Proceed","Cancel")
					if(ans == "Proceed")
						if(me.moddy==0)
							view()<<"<b>The Book of Eternity, shocks [me] as they try to open it."
							me<<REDCHARM+"Your access to the Book of Eternity Inserting Entries, has been revoked."
							return
						if(me.writey == 0 || me.access == 1)
							me.writey = 1
							var/title = input("What is the title of your entry?","Book Of Shadows",null)
							var/cont = input("What are the contents?","Book Of Eternity",null)
							me.writey = 0
							var/pageno=1
							var/savefile/bos = new("./bos/GMbook.sav")
							while(bos.dir.Find("p[pageno]")) //start at page 2
								pageno++ //next page
							usr << "Info written into page [pageno]"
							bos["/p[pageno]/entry"] << "Info"
							bos["/p[pageno]/title"] << title
							bos["/p[pageno]/bywho"] << me.origname
							bos["/p[pageno]/bywhokey"] << me.key
							bos["/p[pageno]/explanation"] << cont
						re()

						if(ans == "Cancel")
							return
				Read_Entry()
					set category = "Book of Eternity"
					set src in view(1)
					var/mob/Player/M = usr
					if(M.moddy==0)
						view()<<"<b>The Book of Eternity, shocks [M] as they try to open it."
						M<<REDCHARM+"Your access to the Book of Eternity: Creating Spells, has been revoked."
						return
					re()
			proc/re()
				if(page==1)
					var/bo = {"
						<html>
						<head>
						<title>Book of Eternity</title>
						<STYLE>
						link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
						TABLE {background: black;color=brown; size=1;}
						.:link {text-decoration: none; color: brown;}
						.:visited {text-decoration: none; color: brown;}
						.:hover {text-decoration: none; color: silver;}
						</STYLE>
						</head>
						<body bgcolor=Black bgproperties=fixed>
						<center>
						<b><font size=5 color=brown face="Comic Sans MS"><font color=blue>BOOK OF ETERNITY</font></b><p>
						<p align=center>Standard Book of Spells <p align=center><font size=2>Game Master's Edition <p>If you have ideas
						for new spells, contact Ragnarok HGM.
						</center>
						</font>
						</body>
						</html>
						"}
					usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")
					return
				var
					title // of the page
					bywho
					bywhokey
					entry
					explanation
				var/pageno = page
				var/savefile/bos = new("./bos/GMbook.sav")
				bos["/p[pageno]/entry"] >> entry
				switch(entry)
					if("Info")
						bos["/p[pageno]/title"] >> title
						bos["/p[pageno]/bywho"] >> bywho
						bos["/p[pageno]/bywhokey"] >> bywhokey
						bos["/p[pageno]/explanation"] >> explanation

						var/bo = {"
							<html>
							<head>
							<title>Book of Eternity</title>
							<STYLE>
							link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
							TABLE {background: black;color=brown; size=1;}

							.:link {text-decoration: none; color: brown;}
							.:visited {text-decoration: none; color: brown;}
							.:hover {text-decoration: none; color: silver;}

							</STYLE>

							</head>
							<body bgcolor=Black bgproperties=fixed>
							<center>
							<b><font size=5 color=brown>[title]</font></b><br>
							<font size=2 color=brown>[bywho]([bywhokey])
							</center>
							<p>[explanation]
							<hr color=brown>
							<center>Page[page]</center>
							</font>
							</body>
							</html>
							"}
						usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")
/*
					if("Spell")
						bos["/p[pageno]/cost"] >> cost
						bos["/p[pageno]/pthree"] >> pthree
						bos["/p[pageno]/type"] >> type
						bos["/p[pageno]/bywho"] >> bywho
						bos["/p[pageno]/bywhokey"] >> bywhokey
						bos["/p[pageno]/spell"] >> spell
						bos["/p[pageno]/spellshrunk"] >> spellshrunk
						bos["/p[pageno]/candle"] >> candle
						bos["/p[pageno]/explantion"] >> explanation
						bos["/p[pageno]/approved"] >> approved
						bos["/p[pageno]/title"] >> title
						bos["/p[pageno]/affectwho"] >> affectwho
						bos["/p[pageno]/affectarea"] >> affectarea

						if(candle=="Yes")
							candle = "A candle is needed."
						if(pthree=="Yes")
							pthree = "The Power of Three is required."
						if(affectwho==null)
							affectarea = null
					// background='http://img.photobucket.com/albums/v291/spirare/bos.gif'
						var/bo = {"
							<html>
							<head>
							<title>Book of Shadows</title>
							<STYLE>
							link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
							TABLE {background: black;color=brown; size=1;}

							.:link {text-decoration: none; color: brown;}
							.:visited {text-decoration: none; color: brown;}
							.:hover {text-decoration: none; color: silver;}

							</STYLE>

							</head>
							<body bgcolor=Black bgproperties=fixed>
							<center>
							<b><font size=5 color=brown>[title]</font></b><br>
							<font size=2 color=brown>[bywho]([bywhokey])
							[approved]
							</center>
							<p>[explanation]
							<p>[type] spell for [affectarea][affectwho]. [candle] [pthree] [cost] stamina needed.
							<p>[spell]
							<hr color=brown>
							<center>Page[page]</center>
							</font>
							</body>
							</html>
							"}
						usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")
*/

					else
						var/bo = {"
							<html>
							<head>
							<title>Book of Eternity</title>
							<STYLE>
							link {text-decoration: underline; color: brown;} visited {text-decoration: none; color: brown;}  BODY {background:#000000;color:white;}
							TABLE {background: black;color=brown; size=1;}

							.:link {text-decoration: none; color: brown;}
							.:visited {text-decoration: none; color: brown;}
							.:hover {text-decoration: none; color: silver;}

							</STYLE>

							</head>
							<body bgcolor=Black bgproperties=fixed>
							<hr color=brown>
							<font size=2 color=brown>
							<center>Page[page]</center>
							</font>
							</body>
							</html>
							"}
						usr << browse(bo,"window=name;file=name;display=1;clear=0; size=300x500;border=0;can_close=1; can_resize=0;can_minimize=1;titlebar=1")


//						usr << "Nothing inside for now (under test)"
//						usr << "1 Temp Entry: Powers unseen from the skies, witching powers now be mine."




		Grimoire
			movable = 0
			icon = 'object.dmi'
			icon_state = "bos"
			verb
				readbook()
					set src in usr.loc
					set name = "Read"
					var/mob/Player/m = usr
					m << "You turn into a warlock."
					m.class = "Warlock"
					m.summonathame[1] = 1
					m.summonathame[3] = expneeded[m.summonathame[1]]
					m.class="Warlock"
					m.verbs += /mob/Player/Powers/verb/Summon_Athame
					m.verbs += /mob/Player/Powers/verb/Blink
					m.Unlock(m.ckey,"Warlock")
					call(m,/mob/Player/proc/Memory)(m,"[m] becoming a warlock.")
	Ungetables
		Lightning
			movable = 1
			density = 1
			icon = 'spell.dmi'
			name = "lightning"
			damage = 1
			speed = 10
			icon_state = "lit"
			desc = "Lightning!!"
			breakable = 2
		GLightning
			movable = 1
			density = 1
			icon = 'spell.dmi'
			name = "lightning"
			damage = 1
			speed = 10
			icon_state = "glit"
			desc = "Lightning!!"
			breakable = 2
		Throwable
			movable = 1
			density = 1
			Power
				verb/Throw()
					var/mob/Player/me = usr
					if(me.stun == 1 || me.death == 1 || me.orb == 1 || me.astralbody)
						return
/*					if(usr.dir==NORTH)
						src.loc = locate(usr.x,usr.y+1,usr.z)
					if(usr.dir==SOUTH)
						src.loc = locate(usr.x,usr.y-1,usr.z)
					if(usr.dir==EAST)
						src.loc = locate(usr.x+1,usr.y,usr.z)
					if(usr.dir==WEST)
						src.loc = locate(usr.x-1,usr.y,usr.z)*/
					me.activepower = "Throwing"
					me << "You prepare to throw \a [src]."
					me.throw = src
					//src.loc = usr.loc
				//	Moveit(usr.dir, src.speed)
				Energyball
					icon = 'spell.dmi'
					name = "energyball"
					damage = 1
					speed = 9
					icon_state = "energyball"
					desc = "A swirling ball of energy."
					breakable = 2
				Whitelighter_Energyball
					icon = 'spell.dmi'
					name = "energyball"
					damage = 1
					speed = 9
					icon_state = "energyball"
					desc = "A swirling ball of energy."
					breakable = 2
				Fireball
					icon = 'spell.dmi'
					name = "fireball"
					damage = 2
					speed = 9
					icon_state = "fireball"
					desc = "An orb of burning fire."
					breakable = 2
		Flame
			icon = 'spell.dmi'
			icon_state = "flame"
			name = "\improper flame"
			movable = 0
			density = 0
			layer = MOB_LAYER+1
			New()
				spawn()
					var/mob/Player/m
					while(1)
						for(m in view(0,src))
							if(m!=src.owner)
								m.damagecounter -= 1
								var/exp = call(src.owner,/mob/Player/proc/Deathcheck)(m, src.owner)
								call(src.owner,/mob/Player/proc/Getexp)(src.owner,exp)
						sleep(5)
		Explode
			icon = 'spell.dmi'
			icon_state = "blowup"
			name = "\improper explosion"
			movable = 0
			density = 0
			layer = MOB_LAYER+5
			pixel_y = 16
			/*New()
				spawn()
					var/mob/Player/m
					for(m in view(0,src))
						if(m!=src.owner)
							m.damagecounter -= 1
							var/exp = call(src.owner,/mob/Player/proc/Deathcheck)(m, src.owner)
							call(src.owner,/mob/Player/proc/Getexp)(src.owner,exp)*/
		Soul
			icon = 'object.dmi'
			icon_state = "soul"
			name = "Fragmented power"
			movable = 1
			density = 0
			invisibility = 1
			breakable = 0
			desc = "Tangible energy floating in the air."
			verb
				Absorb()
					set src in view(1)
					var/mob/Player/me = usr
					me.power += src.amount
					me << "You absorb the fragmented power, taking it as your own."
					del(src)
	Getables
		movable = 1
		density = 0
		verb
			Get()
				set src in oview(1)
				var/mob/Player/me = usr
				if(me.stun == 1)
					return
				usr << "You pick up the [src.name]."
				walk_to(src,0)
				loc = usr
				if(owner == null)
					owner = me.origname
					name = "[me.origname]'s " + name
				movedby = null
			Drop()
				var/mob/Player/me = usr
				if(me.stun == 1)
					return
				usr << "You drop \the [src.name]."
				loc = usr.loc
		Golden_Mark
			icon = 'object.dmi'
			icon_state = "ring"
			name = "Golden Mark"
		Paper
			icon = 'object.dmi'
			icon_state = "paper"
			name = "paper"
			desc = ""
			owner = "56345645634"
			movable = 1
			verb
				Write_onto_Paper(msg as text)
					if(src.desc == "")
						src.desc = msg
					else
						usr << "It already has something written on it."
		Book
			var/p
			icon = 'object.dmi'
			icon_state = "bos"
			name = "Book"
			desc = "A simple book that is used to record stuffs."
			movable = 1
			verb
				Add_Entry(msg as text)
					var/title = input("What title do you want to give it?","CHARMED",null)
					var/cont = input("What contents do you want to give it?","CHARMED",null)
					src.desc += "Page[p] - [title]<p>[cont]<hr>"
		Documents
			icon = 'object.dmi'
			icon_state = "paper"
			name = "Documents"
			desc = ""
			owner = "56345645634"
			movable = 1
		Candle
			icon = 'object.dmi'
			Candleunlit
				icon_state = "cand"
				name = "candle"
				desc = "A newly bought candle for spell casting needs."
				verb
					Light()
						set src in view(1)
						usr << "You light the candle."
						oview() << "[usr] lights the candle."
						spawn(1)
							del(src)
						new /obj/Getables/Candle/Candlelit1(src.loc)
			Candlelit1
				icon_state = "candle"
				name = "burning candle"
				luminosity = 3
				desc = "A small flame dances on the candle, as melted wax drops from the sides."
				New()
					sleep(600)
					oview(src) << "The candle burns slowly..."
					spawn(1)
						del(src)
					new /obj/Getables/Candle/Candlelit2(src.loc)
			Candlelit2
				icon_state = "candle2"
				name = "burning candle"
				luminosity = 3
				desc = "A small flame dances on the candle, as melted wax drops from the sides."
				New()
					sleep(600)
					oview(src) << "The candle burns lazily..."
					spawn(1)
						del(src)
					new /obj/Getables/Candle/Candlelit3(src.loc)
			Candlelit3
				icon_state = "candle3"
				name = "burning candle"
				luminosity = 3
				desc = "A small flame dances on the candle, not much of it is left!"
				New()
					sleep(600)
					oview(src) << "The candle burns itself out."
					del(src)
		Fragments
			breakable = 2
			damage = 1
			icon = 'object.dmi'
			icon_state = "fragments"
			name = "\proper fragments"
			desc = "Just a few pieces of fragments from something that has broken."
		Bolt
			breakable = 2
			damage = 1
			density = 1
			icon = 'object.dmi'
			icon_state = "bolt"
			name = "bolts"
			desc = "A few crude looking crossbow ammunitions."
			speed = 9
		Sins
			icon = 'limbo.dmi'
			desc = "A strange looking rune with a shape carved onto it. Used by vanquished souls to liberate themselves from Limbo."
			damage = 0
			breakable = 0
			Sin
				icon_state = "r1"
			Lust
				icon_state = "r2"
			Gluttony
				icon_state = "r3"
			Avarice
				icon_state = "r4"
			Sloth
				icon_state = "r5"
			Wrath
				icon_state = "r6"
			Envy
				icon_state = "r7"
			Pride
				icon_state = "r8"
		Herb
			icon = 'object.dmi'
			owner = "346346346346"
			var
				stam
				health
				dam
				red
				green
				blue
			Fungus
				icon_state = "mushroom"
				stam = 10
				health = 0
				dam = 0
				red = 40
				green = 20
				blue = 0
			White_Devil
				icon_state = "whiteleaf"
				stam = -10
				health = 0
				dam = 1
				red = 30
				green = 30
				blue = 30
			Mint
				icon_state = "leaf"
				stam = 10
				health = 0
				dam = -1
				red = 0
				green = 30
				blue = 0
			Apple
				icon_state = "apple"
				stam = 20
				health = 0
				dam = 0
				red = 30
				green = 0
				blue = 0
			Vriesea
				icon_state = "redleaf"
				stam = -5
				health = -1
				dam = 2
				red = 60
				green = 0
				blue = 0
			Rotten_Flesh
				icon_state = "rotten"
				stam = -50
				health = -3
				dam = 1
				red = 0
				green = 30
				blue = 50
			Walnut
				icon_state = "walnut"
				stam = 20
				health = 0
				dam = 0
				red = 30
				green = 30
				blue = 0
		Pot
			icon = 'object.dmi'
			icon_state = "pot"
			density = 1
			verb
				Drop_Herb_Into_Pot()
					set src in view(1)
					if(length(src.contents)>=5)
						usr << "You can't add any herbs into this anymore."
						return
					var/list/herb = new()
					for(var/o in usr.contents)
						if(istype(o,/obj/Getables/Herb))
							herb += o
					if(length(herb)==0)
						return
					var/obj/choice = input("What ingredient to add into the pot?","CHARMED",null) in herb
					choice.loc = src
					view(src) << "[usr] drops the [choice] into the pot."
				Prepare_Potion()
					set src in view(1)
					var
						tstam
						thealth
						tdam
						tred = 100
						tblue = 100
						tgreen = 100
						vanquishing
					if(length(contents)<2)
						usr << "Not enough ingredients. Minimum 2."
						return
					for(var/obj/Getables/Herb/o in src.contents)
						if(o.name == "Rotten Flesh")
							vanquishing = 1
						tstam += o.stam
						thealth += o.health
						tdam += o.dam
						tred += o.red
						tblue += o.blue
						tgreen += o.green
					for(var/obj/potion in usr.contents)
						if(istype(potion,/obj/Getables/Drinkable/Potions/Empty_Bottle))
							del(potion)
							usr << "You fill your empty potion bottle with the solution."
							for(var/obj/e in src.contents)
								del(e)
							if(vanquishing == 1)
								var/obj/Getables/Throwable/Potions/Mild_Vanquishing/n = new(usr)
								n.damage = tdam
								n.name = "Vanquishing Potion"
								var/icon/pot = new('object.dmi')
								pot.SwapColor(rgb(255,255,255),rgb(tred,tgreen,tblue))
								n.icon = pot
							else
								var/obj/Getables/Drinkable/Potions/Potion/n = new(usr)
								n.addstam = tstam
								n.addhealth = thealth
								n.adddam = tdam
								var/icon/pot = new('object.dmi')
								pot.SwapColor(rgb(255,255,255),rgb(tred,tgreen,tblue))
								n.icon = pot
							return
		Drinkable
			Potions
				var
					addstam
					addhealth
					adddam
				icon = 'object.dmi'
				Potion
					icon = 'object.dmi'
					icon_state = "newpotion"
					verb
						Drink()
							usr << "You gulp the contents of a [src] down."
							var/mob/Player/me = usr
							if(addhealth<0)
								usr << "The potion's contents make you weaker."
							me.stamina[1]+=addstam
							if(me.stamina[1]>=me.stamina[2])
								me.stamina[1] = me.stamina[2]
							if(addhealth<0)
								usr << "The potion's contents make you sick."
								call(/mob/Player/proc/Deathcheck)(me, me)
							me.damagecounter+=addhealth
							if(me.damagecounter>=me.damagecounter2)
								me.damagecounter = me.damagecounter2
							del(src)
				Rejuvenation_Potion
					icon_state = "gpotion"
					desc = "A potion that can restore your stamina."
					verb
						Drink()
							usr << "You gulp the contents of a [src] down."
							var/mob/Player/me = usr
							me.stamina[1]+=50
							if(me.stamina[1]>=me.stamina[2])
								me.stamina[1] = me.stamina[2]
							del(src)
				Empty_Bottle
					icon_state = "empty"
					desc = "An empty potion bottle."
		Weapon
			Crossbow
				icon = 'object.dmi'
				icon_state = "crossbow"
				desc = "A deadly crossbow used by Darklighters."
				verb
					Fire_Bolts()
						var/mob/Player/m = usr
						var/obj/o
						for(var/i=1;i<length(m.contents);i++)
							o = m.contents[i]
							if(o.name == "bolts")
								break()
						if(m.control==0)
							if(!o)
								usr << "You don't have any bolts to fire."
							else
								m.control = 1
								amount--
								o.amount -= 1
								o.suffix = "[o.amount]"
								if(o.amount <= 0)
									del(o)
								var/obj/Getables/Bolt/bolt = new(usr.loc)
								bolt.amount = 1
								bolt.suffix = "1"
								bolt.movedby = usr
								bolt.Moveit(usr.dir, bolt.speed)
								sleep(10)
								m.control = 0
							if(amount<=0)
								view() << "The crossbow explodes into strands of thin smoke."
								del(src)
						else
							return
		Throwable
			density = 1
			verb
				Throw()
					var/mob/Player/me = usr
					if(me.stun == 1 || me.death == 1 || me.orb == 1 || me.astralbody)
						return
/*					if(usr.dir==NORTH)
						src.loc = locate(usr.x,usr.y+1,usr.z)
					if(usr.dir==SOUTH)
						src.loc = locate(usr.x,usr.y-1,usr.z)
					if(usr.dir==EAST)
						src.loc = locate(usr.x+1,usr.y,usr.z)
					if(usr.dir==WEST)
						src.loc = locate(usr.x-1,usr.y,usr.z)*/
					me.activepower = "Throwing"
					me << "You prepare to throw \a [src]."
					me.throw = src
					//src.loc = usr.loc
				//	Moveit(usr.dir, src.speed)
			Athames
				Simple_Athame
					name = "simple athame"
					damage = 1
					speed = 8
					icon_state = "oathame"
					desc = "A crude looking athame that can be purchased at a cheap price."
				Silver_Athame
					name = "silver athame"
					damage = 1
					speed = 9
					icon_state = "sathame"
					desc = "A razor sharp silver athame."
				Golden_Athame
					name = "gold athame"
					damage = 2
					speed = 9
					icon_state = "gold athame"
					desc = "An athame made of gold."
			Potions
				breakable=1
				Mild_Vanquishing
					icon_state = "newpotion"
					name = "Mild Vanquishing Potion"
					damage = 1
					speed = 8
					desc = "A bottle full of swirling liquid."
	proc/Moveit(dir, speed)
		speed = 10-speed
		walk(src,dir,speed)
		//sleep(20) //lasts for 3 seconds
		sleep(20)
		if(src)
			walk(src,0) //stop moving it
			call(/obj/proc/Break)(src)
	//throw something , must click on terrain and moveit will (walkto) there?
	proc/Break(var/obj/source)
		if(istype(source,/obj/) && source!=null && source.frozen==0)
			walk_to(source,0)
			source.movedby = null
			switch(source.breakable)
				if(1)
					new /obj/Getables/Fragments(source.loc)
					del(source)
				if(2)
					del(source)
				else
		return 0