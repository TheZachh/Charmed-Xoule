turf
	proc
		Mapper(x3,y3)
			var/mob/Player/m = usr
			m.client.perspective = MOB_PERSPECTIVE
			m.client.eye = m

			var/turf/locato = locate(x3,y3,1)
			if(locato.density == 1)
				usr << "You cannot materialize yourself there. Something blocks the way."
				m.control = 0
				m.orb = 0
				return

			var/list/pass = new()
			var/mob/Player/targets
			if(m.shimmer==1)
				call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"shimmer",ICON_ADD)
				for(targets in oview(2))
					if(m.seize == 1)
						spawn()
							call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"shimmer",ICON_ADD)
							pass += targets
							targets.control = 1
				sleep(1)
			if(m.firemove>0)
				if(m.firemove==1)
					call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire",ICON_ADD)
					for(targets in oview(2))
						if(m.seize == 1)
							spawn()
								call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"fire",ICON_ADD)
								pass += targets
								targets.control = 1
				if(m.firemove==2)
					call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire",ICON_MULTIPLY)
					for(targets in oview(2))
						if(m.seize == 1)
							spawn()
								call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"fire",ICON_MULTIPLY)
								pass += targets
								targets.control = 1
				sleep(1)
			if(m.class == "Darklighter")
				spawn()
					call(usr,/mob/Player/proc/Effects)("darkorb2")
				sleep(10)
				for(targets in oview(1))
					if(targets.orb == 1)
						spawn()
							call(targets,/mob/Player/proc/Effects)("darkorb")
							pass += targets
							targets.control = 1

			if(m.class == "Warlock")
				sleep(2)
				m.invisibility = 101
				for(targets in oview(2))
					if(m.seize == 1)
						spawn()
							targets.invisibility = 101
							pass += targets
							targets.control = 1
				sleep(15)
			if(m.class == "Whitelighter" || m.class == "Half Whitelighter")
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
			if(m.moddy==1 || m.text=="Orb Surroundings")
				spawn()
				sleep(1)
				for(targets in oview())
					if(targets.text=="Orb Surroundings")
						spawn()
							call(targets,/mob/Player/proc/Effects)("Orb2")
							pass += targets
							targets.control = 1
							targets.text=null
				sleep(15)
			usr.loc = locate(x3,y3,1)
			usr.overlays = null
			for(var/i=1;i<=length(pass);i++)
				targets = pass[i]
				targets.loc = locate(usr.x+1,y3,1)
				targets.overlays = null
			if(m.shimmer==1)
				call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"shimmer2",ICON_ADD)
				for(var/i=1;i<=length(pass);i++)
					targets = pass[i]
					spawn()
						call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"shimmer2",ICON_ADD)
						targets.control = 0
						targets.orb = 0
						targets.location = "in Town"
			if(m.firemove>0)
				if(m.firemove==1)
					call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_ADD)
					for(var/i=1;i<=length(pass);i++)
						targets = pass[i]
						spawn()
							call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"fire2",ICON_ADD)
							targets.control = 0
							targets.orb = 0
							targets.location = "in Town"
				if(m.firemove==2)
					call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"fire2",ICON_MULTIPLY)
					for(var/i=1;i<=length(pass);i++)
						targets = pass[i]
						spawn()
							call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"fire2",ICON_MULTIPLY)
							targets.control = 0
							targets.orb = 0
							targets.location = "in Town"
				m.control = 0
				m.location = "in Town"
				m.orb = 0
			if(m.class == "Darklighter")
				spawn()
					call(usr,/mob/Player/proc/Effects)("darkorb")
					m.control = 0
					m.location = "in Town"
					m.orb = 0
				sleep(1)
				for(var/i=1;i<=length(pass);i++)
					targets = pass[i]
					spawn()
						call(targets,/mob/Player/proc/Effects)("darkorb")
						targets.control = 0
						targets.orb = 0
						targets.location = "in Town"
			if(m.class == "Warlock")
				sleep(5)
				call(m,/mob/Player/proc/Setme)()
				m.invisibility = 0
				view(m) << './sound/blink.wav'
				m.control = 0
				m.location = "in Town"
				m.orb = 0
				for(var/i=1;i<=length(pass);i++)
					targets = pass[i]
					spawn()
						targets << './sound/blink.wav'
						targets.invisibility = 0
						targets.control = 0
						targets.orb = 0
						targets.location = "in Town"
			if(m.class == "Whitelighter" || m.class == "Half Whitelighter")
				spawn()
					call(usr,/mob/Player/proc/Effects)("Orb")
					m.control = 0
					m.location = "in Town"
					m.orb = 0
				sleep(1)
				for(var/i=1;i<=length(pass);i++)
					targets = pass[i]
					spawn()
						call(targets,/mob/Player/proc/Effects)("Orb")
						targets.control = 0
						targets.orb = 0
						targets.location = "in Town"
			m << sound(,0,1,2,100)
			m.activepower = null
	graveyard
		icon = './pic/graveymap.bmp'
		MouseUp(location,xx,yy)
			var/turf/loca = location
			var/x3 = ((loca.x-127) * 32) + xx
			x3 = round(x3/2) + 161
			var/y3 = ((loca.y-95) * 32) + yy
			y3 = round(y3/2) + 45
			if(x3 > world.maxx || y3 > world.maxy)
				return
			Mapper(x3,y3)
	map
		icon = './pic/townmap.bmp'
		MouseUp(location,xx,yy)
			var/turf/loca = location
			var/x3 = ((loca.x-130) * 32) + xx
			x3 = round(x3/2)
			var/y3 = ((loca.y-92) * 32) + yy
			y3 = round(y3/2)
			if(x3 > world.maxx || y3 > world.maxy)
				return
			Mapper(x3,y3)
	undermap
		icon = './pic/undermap.bmp'
		MouseUp(location,xx,yy)
			var/turf/loca = location
			var/x3 = ((loca.x-131) * 32) + xx
			x3 = round(x3/2) + 158
			var/y3 = ((loca.y-89) * 32) + yy
			y3 = round(y3/2) + 151
			if(x3 > world.maxx || y3 > world.maxy)
				return
			Mapper(x3,y3)

/*	Click(X)
		var/mob/Player/me = usr
		if(me.activepower=="Temporal Stasis")
			var/list/targets = view(me.molecular[1],X)
			for(var/i=1;length(targets)!=0&&i<=length(targets);i++)
				if(istype(targets[i],/obj/))
					var/obj/ob = targets[i]
					if(ob.frozen == 0 && ob.loc!=me && ob.movable==1 &&ob.movedby!=null) //you can freeze the number of your level >.>
						ob.frozen = 1
						me << "You throw up your hands and freezes \a [ob]."
						oview(me) << "[me] throw up \his hands and freezes \a [ob]."
						spawn(me.molecular[1]*10)
							if(ob.frozen == 1)
								view(ob) << "[ob] unfreezes."
								walk(ob,ob.dir,10-ob.speed)
								ob.frozen = 0
								spawn(10)
									walk(ob,0)
									call(/obj/proc/Break)(ob)
					else
						if(ob.frozen == 1)
							view(ob) << "[ob] unfreezes."
							walk(ob,ob.dir,10-ob.speed)
							ob.frozen = 0
							spawn(10)
								walk(ob,0)
								call(/obj/proc/Break)(ob)*/
	grave
		icon = 'grave.dmi'
		floor{icon_state="f1";name=""}
		hard{icon_state="f1";name="";density=1}
		tombstone
			t1{icon_state="t1";name="";density=1}
			t2{icon_state="t2";name="";density=1}
			t3{icon_state="t3";name="";density=1}
			t4{icon_state="t4";name="";density=1}
			t5{icon_state="t5";name="";density=1}
			t6{icon_state="t6";name="";density=1}
			t7{icon_state="t7";name="";density=1}
			t8{icon_state="t8";name="";density=0}
			t9{icon_state="t9";name="";density=1}
			t10{icon_state="t10";name="";density=1}
			t11{icon_state="t11";name="";density=0}
			t12{icon_state="t12";name="";density=1}
			t13{icon_state="t13";name="";density=1}
			t14{icon_state="t14";name="";density=1}
			t15{icon_state="t15";name="";density=1}
		house
			density=1
			w1{icon_state="w1";name="";}
			w2{icon_state="w2";name="";}
			w3{icon_state="w3";name="";}
			w4{icon_state="w4";name="";}
			w5{icon_state="w5";name="";}
			w6{icon_state="w6";name="";}
			w7{icon_state="w7";name="";}
			w8{icon_state="w8";name="";}
			w9{icon_state="w9";name="";}
			w10{icon_state="w10";name="";density=0}
			w11{icon_state="w11";name="";}
			w12{icon_state="w12";name="";density=0}
	floor
		icon = 'chipset.dmi'
		upthere
			floor{icon='ruins.dmi';icon_state="floor"}
			sky {icon = './pic/sky.bmp';density=1;}
			sky2 {icon = 'ruins.dmi';icon_state = "sky";name = "";density=1;}
			marble {icon = 'ruins.dmi';icon_state = "marble";name = "";}
		g8
			icon = 'limbo.dmi'
			icon_state = "f1"
			name=""
			density=0
			Enter(O)
				..()
				if(istype(O,/mob/Player/))
					var/mob/Player/o = O
					var/obj/item
					var/pass
					if(o.client)
						if(o.sin)
							for(var/i=1;i<=length(o.contents);i++)
								item = o.contents[i]
								if(istype(item,/obj/Getables/Sins/) && item.name==o.sin)
									o << "[item] sends a jolting shock through your spine and disappears."
									pass = 1
									del(item)
									break()
							if(pass==0) // haven't passed yet
								for(var/i=1;i<=length(o.contents);i++)
									item = o.contents[i]
									if(istype(item,/obj/Getables/Sins/) && item.name=="Sin")
										pass = 1
										del(item)
										break()

							if(pass==1)
								//freedom
								o.death = 0
								o.sin = null
								o << sound(,0,0,2,100)
								o << "You have been granted freedom."
								o << sound('./sound/bluemagic.wav',0,0,2,100)
								o.loc = locate(170,170,1)
								call(o,/mob/Player/proc/Fade)(o,20,20,20,10,0)
							else
								o << "<i>As you pass through the gateway...</i>"
								switch(o.sin)
									if("Lust")
										o << "<i>You feel an obsessive, unlawful, and unnatural sexual drive.</i>"
									if("Gluttony")
										o << "<i>You feel an the desire to consume more than neccessary.</i>"
									if("Avarice")
										o << "<i>A grin forms on your face, as you feel the need to betray for the desire of more power.</i>"
									if("Sloth")
										o << "<i>You feel like idling around, and wasting your time.</i>"
									if("Wrath")
										o << "<i>An overwhelming feeling of hatred and anger consumes you.</i>"
									if("Envy")
										o << "<i>You have a sudden grieving spite and resentment of material objects, wishing ill-fortunes to others who are better than you.</i>"
									if("Pride")
										o << "<i>You have a desire to become more important and attractive than others.</i>"
								return 1
		grass {icon_state = "green";name = "Grass";}
		grass2 {icon_state = "green2";name = "Grass";}
		pavement {icon_state="pavement";name="Pavement";}
		pavement2 {icon_state="rock1";name="Pavement";}
		pavement3 {icon_state="rock2";name="Pavement";}
		stair {icon_state="stair";name="Stairs";}
		dstair {icon_state="dstair";name="Stairs";}
		lstair {icon_state="lstair";name="Stairs";}
		rstair {icon_state="rstair";name="Stairs";}
		road {icon_state="road";name="Road";}
		zebra1 {icon_state="zebra";name="";}
		zebra2 {icon_state="zebra2";name="";}
		start{icon = 'chipset.dmi';icon_state="road";name="Road";}
		limbo{icon = 'limbo.dmi';icon_state="f1";name="";}
		orber{icon_state = "";name = "";}
		marble{icon='ruins.dmi';icon_state = "marble";name = "";density=1}
		dust{icon='limbo.dmi';icon_state = "f1";name = "";}
		water
			water1{icon_state = "water1";name = "";density=1}
			water2{icon_state = "water2";name = "";density=1}
			ceil9{icon='inner2.dmi';icon_state="peri9";name="";opacity=1;density=1}
			Enter()
				return()
		/*ceiling
			icon = 'inner.dmi'
			ceil1{icon_state="peri1";name="";density=1}
			ceil2{icon_state="peri2";name="";density=1}
			ceil3{icon_state="peri3";name="";density=0;layer=MOB_LAYER+5}
			ceil4{icon_state="peri4";name="";density=1}
			ceil5{icon_state="peri5";name="";density=1}
			ceil6{icon_state="peri6";name="";density=1}
			ceil7{icon_state="peri7";name="";density=1}
			ceil8{icon_state="peri8";name="";density=1}*/
		/*inner
			wood{icon = 'inner.dmi';icon_state = "wood";name = "";}*/
		walkway
			icon = 'grass.dmi'
			grass1 {icon_state="grass1";name="Pavement";}
			grass2 {icon_state="grass2";name="Pavement";}
			grass3 {icon_state="grass3";name="Pavement";}
			grass4 {icon_state="grass4";name="Pavement";}
			grass5 {icon_state="grass5";name="Pavement";}
			grass6 {icon_state="grass6";name="Pavement";}
			grass7 {icon_state="grass7";name="Pavement";}
			grass8 {icon_state="grass8";name="Pavement";}
			grass9 {icon_state="grass9";name="Pavement";}
			grass10 {icon_state="grass10";name="Pavement";}
			grass11 {icon_state="grass11";name="Pavement";}
			grass12 {icon_state="grass12";name="Pavement";}
			grass13 {icon_state="grass13";name="Pavement";}
			grass14 {icon_state="grass14";name="Pavement";}
			grass15 {icon_state="grass15";name="Pavement";}
			grass16 {icon_state="grass16";name="Pavement";}
			grass17 {icon_state="grass17";name="Pavement";}

			flower1 {icon_state="flower1";name="Flowers";}
			flower2 {icon_state="flower2";name="Flowers";}
			flower3 {icon_state="flower3";name="Flowers";}
			flower4 {icon_state="flower4";name="Flowers";}
			flower5 {icon_state="flower5";name="Flowers";}
			flower6 {icon_state="flower6";name="Flowers";}
			flower7 {icon_state="flower7";name="Flowers";}
			flower8 {icon_state="flower8";name="Flowers";}
			flowerred {icon_state="flowerred";name="Flowers";}
			floweryellow {icon_state="floweryellow";name="Flowers";}
	inner
		icon = 'inner2.dmi'
		wood{icon_state = "wood";name = "";}
		wall
			wall1 {icon_state="w1";name="";density=1}
			wall2 {icon_state="w2";name="";density=1}
			wall3 {icon_state="w3";name="";density=1}
			wall4 {icon_state="w4";name="";density=1}
			wall5 {icon_state="w5";name="";density=1}
			wall6 {icon_state="w6";name="";density=1}
			wall7 {icon_state="w7";name="";density=1}
			wall8 {icon_state="w8";name="";density=1}
			wall9 {icon_state="w9";name="";density=1}
			wall10 {icon_state="w10";name="";density=1}

			WALL1 {icon_state="nw1";name="";density=1}
			WALL2 {icon_state="nw2";name="";density=1}
			WALL3 {icon_state="nw3";name="";density=1}
			WALL4 {icon_state="nw4";name="";density=1}
			WALL5 {icon_state="nw5";name="";density=1}
			WALL6 {icon_state="nw6";name="";density=1}
			WALL7 {icon_state="nw7";name="";density=1}
			WALL8 {icon_state="nw8";name="";density=1}

			pillar1 {icon_state="c1";name="";density=0;layer=MOB_LAYER+5}
			pillar2 {icon_state="c2";name="";density=0;layer=MOB_LAYER+5}
			pillar3 {icon_state="c3";name="";density=1}
			pillar4 {icon_state="c4";name="";density=1}

		window
			window1 {icon_state="wi1";name="";density=1}
			window2 {icon_state="wi2";name="";density=1}
			window3 {icon_state="wi3";name="";density=1}
			window4 {icon_state="wi4";name="";density=1}
			window5 {icon_state="wi5";name="";density=1}
			window6 {icon_state="wi6";name="";density=1}
			window7 {icon_state="wi7";name="";density=1}
			window8 {icon_state="wi8";name="";density=1}

			WINDOW1 {icon_state="no1";name="";density=1}
			WINDOW2 {icon_state="no2";name="";density=1}
			WINDOW3 {icon_state="no3";name="";density=1}
			WINDOW4 {icon_state="no4";name="";density=1}
			WINDOW5 {icon_state="no5";name="";density=1}
			WINDOW6 {icon_state="no6";name="";density=1}
			WINDOW7 {icon_state="no7";name="";density=1}
			WINDOW8 {icon_state="no8";name="";density=1}
		stairs
			st1 {icon_state="st1";name="";density=0;}
			st2 {icon_state="st2";name="";density=0;}
	loginscreen
		loginscreen{icon = './pic/logo.bmp';name="";density=1;}
		loginstart{name="";}
		blank{name="";}
	miscbuildings
		icon = 'building.dmi'
		door{icon_state="d1";name="Door";density=0}
		door2{icon_state="d2";name="Door";density=0}
		door3{icon_state="d3";name="Door";density=1}
		door4{icon_state="d4";name="Door";density=1}
		/*Enter(O)
			if(src.density == 1 && istype(src,/obj/))
				call(/obj/proc/Break)(O)
				O = null
				return 0
			else
				..()*/
	house
		icon = 'building.dmi'
		//walls
		a1 {icon_state = "1a";name="Building";density=1;}
		b1 {icon_state = "1b";name="Building";density=1;}
		c1 {icon_state = "1c";name="Building";density=1;}
		a2 {icon_state = "2a";name="Building";density=1;}
		b2 {icon_state = "2b";name="Building";density=1;}
		c2 {icon_state = "2c";name="Building";density=1;}
		a3 {icon_state = "3a";name="Building";density=1;}
		b3 {icon_state = "3b";name="Building";density=1;}
		c3 {icon_state = "3c";name="Building";density=1;}
		//roof
		ra1 {icon_state = "r1a";name="Building";density=1;layer = MOB_LAYER+5}
		rb1 {icon_state = "r1b";name="Building";density=1;layer = MOB_LAYER+5}
		re1 {icon_state = "r1e";name="Building";density=1;layer = MOB_LAYER+5}
		ra2 {icon_state = "r2a";name="Building";density=1;layer = MOB_LAYER+5}
		re2 {icon_state = "r2e";name="Building";density=1;layer = MOB_LAYER+5}
		ra3 {icon_state = "r3a";name="Building";density=1;layer = MOB_LAYER+5}
		rb3 {icon_state = "r3b";name="Building";density=1;layer = MOB_LAYER+5}
		rc3 {icon_state = "r3c";name="Building";density=1;layer = MOB_LAYER+5}
		rd3 {icon_state = "r3d";name="Building";density=1;layer = MOB_LAYER+5}
		re3 {icon_state = "r3e";name="Building";density=1;layer = MOB_LAYER+5}
		ra5 {icon_state = "r5a";name="Building";density=1;layer = MOB_LAYER+5}
		rb5 {icon_state = "r5b";name="Building";density=1;layer = MOB_LAYER+5}
		rc5 {icon_state = "r5c";name="Building";density=1;layer = MOB_LAYER+5}
		//roof2
		r1 {icon_state = "rr1a";name="Building";density=1;layer = MOB_LAYER+5}
		r2 {icon_state = "rr1b";name="Building";density=1;layer = MOB_LAYER+5}
		r3 {icon_state = "rr1c";name="Building";density=1;layer = MOB_LAYER+5}
		r4 {icon_state = "rr2a";name="Building";density=1;layer = MOB_LAYER+5}
		r5 {icon_state = "rr2b";name="Building";density=1;layer = MOB_LAYER+5}
		r6 {icon_state = "rr2c";name="Building";density=1;layer = MOB_LAYER+5}
		r7 {icon_state = "rr3a";name="Building";density=1;layer = MOB_LAYER+5}
		r8 {icon_state = "rr3b";name="Building";density=1;layer = MOB_LAYER+5}
		r9 {icon_state = "rr3c";name="Building";density=1;layer = MOB_LAYER+5}
		redbrick {icon_state = "redbrick";name="Wall";density=1;}
		Enter(O)
			if(O!=null && istype(O,/obj/))
				call(/obj/proc/Break)(O)
				return 0
			else
				if(O!=null && istype(O,/mob/Player)) // mob
					var/mob/Player/M = O
					if(M.density==0)
						return 1
				..()
		/*inner
			icon = 'inner.dmi'
			whitewall {icon_state = "whitewall";name="";density=1;}
			beigewall {icon_state = "beigewall";name="";density=1;}
			beigewall2 {icon_state = "beigewall2";name="";density=1;}
			Enter()
				return*/
		city
			icon = 'city.dmi'
			t1 {icon_state = "t1";name="Building";density=1;}
			t2 {icon_state = "t2";name="Building";density=1;}
			t3 {icon_state = "t3";name="Building";density=1;}
			t4 {icon_state = "t4";name="Building";density=1;}
			t5 {icon_state = "t5";name="Building";density=1;}
			t6 {icon_state = "t6";name="Building";density=1;}
			t7 {icon_state = "t7";name="Building";density=1;}
			t8 {icon_state = "t8";name="Building";density=1;}
			door1 {icon_state = "door1";name="Door";density=1;}
			door2 {icon_state = "door2";name="Door";density=1;}
	under
		icon = 'hell.dmi'
		f1 {icon_state = "f1";name="";density=0}
		lava
			l1 {icon_state = "lava1";name="";density=1}
			l2 {icon_state = "lava2";name="";density=1}
			l3 {icon_state = "lava3";name="";density=1}
			l4 {icon_state = "lava4";name="";density=1}
			l5 {icon_state = "lava5";name="";density=1}
			l6 {icon_state = "lava6";name="";density=1}
			l7 {icon_state = "lava7";name="";density=1}
			l8 {icon_state = "lava8";name="";density=1}
			l9 {icon_state = "lava9";name="";density=1}
			l10 {icon_state = "boil";name="";density=1}
		symbol
			m1 {icon_state = "m1";name="";density=0}
			m2 {icon_state = "m2";name="";density=0}
			m3 {icon_state = "m3";name="";density=0}
			m4 {icon_state = "m4";name="";density=0}
			m5 {icon_state = "m5";name="";density=0}
			m6 {icon_state = "m6";name="";density=0}
			m7 {icon_state = "m7";name="";density=0}
			m8 {icon_state = "m8";name="";density=0}
			m9 {icon_state = "m9";name="";density=0}
			m10{icon_state = "m10";name="";density=0}
			m11 {icon_state = "m11";name="";density=0}
			m12 {icon_state = "m12";name="";density=0}
			m13 {icon_state = "m13";name="";density=0}
			m14 {icon_state = "m14";name="";density=0}
			m15 {icon_state = "m15";name="";density=0}
			m16 {icon_state = "m16";name="";density=0}
		stairs
			s1 {icon_state = "s1";name="";}
			s2 {icon_state = "s2";name="";}
			s3 {icon_state = "s3";name="";}
			s4 {icon_state = "s4";name="";}
			s5 {icon_state = "s5";name="";}
			s6 {icon_state = "s6";name="";}
			s7 {icon_state = "s7";name="";}
		wall
			wall1 {icon_state = "w1";name="";density=1;}
			wall2 {icon_state = "w2";name="";density=1;}
			wall3 {icon_state = "w3";name="";density=1;}
			wall4 {icon_state = "w4";name="";density=1;opacity = 1}
			wall5 {icon_state = "w5";name="";density=1;}
			wall6 {icon_state = "w6";name="";density=1;}
			wall7 {icon_state = "w7";name="";density=1;}
			wall8 {icon_state = "w8";name="";density=1;}
			h1 {icon_state = "h1";name=""; density = 1}
			h2 {icon_state = "h2";name=""; density = 1}
			h3 {icon_state = "h3";name="";}
			h5 {icon_state = "h5";name=""; density = 1}
			fire1 {icon_state = "fire1";name="";density=1;}
			fire2 {icon_state = "fire2";name="";density=1;}
			Enter(X)
				if(istype(X,/mob/Player/Monster))
					..()
				else
					return
		ceiling
			c1 {icon_state = "c1";name="";density=1;}
			c2 {icon_state = "c2";name="";density=1;}
			c3 {icon_state = "c3";name="";density=0;layer=MOB_LAYER+5; opacity=1}
			c4 {icon_state = "c4";name="";density=1;}
			c5 {icon_state = "c5";name="";density=1;}
			c6 {icon_state = "c6";name="";density=0;layer=MOB_LAYER+6;}
			spare {icon_state = "spare";name="";density=0;layer=MOB_LAYER+5;opacity=1}
turf
	attic
		window{icon = './pic/window.bmp';name="";density=1;}
		left{icon = './pic/left.bmp';name="";density=1;}
		right{icon = './pic/right.bmp';name="";density=1;}
obj //building objects
	others
		brazen
			icon = 'hell.dmi'
			icon_state = "brazen"
			layer = MOB_LAYER + 1
			verb
				Challenge_Triad()
					set src in oview(5)
					var/mob/Player/m = usr
					if(m.demonquest < 4)
						usr << "<i>The skull grins at you. \"You're not up for it.\""
						return
					if(m.demonquest == 5)
						usr << "<i>You've beaten the Triad once, and are now a Triad member. It is not within my power to make you any stronger.</i>"
						return
					usr << "<i>The smiling skull turns towards you, its skeletal jaws grinning widely so you can see the dark hollow inside its gaping mouth.</i>"
					sleep(50)
					usr << "<i>So you wish you challenge the Triad? If you can kill just one of them, and bring back some proof of your valiant success, I will promote you to something better.</i>"
					var/chal = alert("Will you challenge the Triad now?","CHARMED","Yes","No")
					if(chal == "Yes")
						usr << "<i>Off you go now. Don't expect it to be easy.</i>"
						usr.loc = locate(213,181,1)
					else
						usr << "<i>Brazen snickers at you, before growing lifeless again.</i>"
				Change_Rank()
					set src in oview(5)
					var/mob/Player/me = usr
					var/have
					for(var/i=1;i<=length(me.contents);i++)
						var/obj/item = me.contents[i]
						if(istype(item,/obj/) && item.name=="Golden Mark" && item.owner == me.origname)
							have=1
							del(item)
							break
					if(have==1)
						usr << "<i>Oooooooooh, that wasn't so bad. Perhaps you're ready to ascend your ranking in the demon realm.</i>"
						me.rank = "<font color=#ff0000 >T</font><font color=#ff3100 >h</font><font color=#ff6200 >e</font> <font color=#ffc400 >T</font><font color=#ff9300 >r</font><font color=#ff6200 >i</font><font color=#ff3100 >a</font><font color=#ff0000 >d</font>"
						usr << "<i>You have been awarded 100 power to trade with Alexis.</i>"
						me.power += 100
						me.demonquest = 5
					else
						usr << "<i>Have you defeated the triad?</i>"
	job
		paperwork
			verb
				Perform_Paperwork()
					set src in view(1)
					var/mob/Player/me = usr
					if(me.control==0 && me.job == "Accountant")
						me.control = 1
						usr << "You took your time to copy some documents."
						var/income = rand(500,1000)
						var/expend = rand(0,499)
						var/balance = income - expend
						income = input("Balance = Income - Expenditure\n\nTotal Income:[income]\nTotal Expenditure:[expend]\nCalculate the balance.","Accountancy",null) as num
						if(income == balance)
							me.control = 0
							oview() << "[usr] finishes the calculations and sets the paper aside."
							usr << "You finished the calculations and set it aside."
							new /obj/Getables/Documents(usr)
						else
							me.control = 0
							oview() << "[usr] crumbles the messed up calculations"
							usr << "You messed up calculations, and crumbled up the piece of paper."
					else
						usr << "You need to get a job as an accountant before you can do this!"
	grave
		icon = 'grave.dmi'
		gate
			g1{icon_state="g1";name="";density=1;}
			g2{icon_state="g2";name="";density=1;}
			g3{icon_state="g3";name="";density=1;}
			g4{icon_state="g4";name="";density=1;}
			g5{icon_state="g5";name="";density=0;layer=MOB_LAYER+5}
			g6{icon_state="g6";name="";density=0;layer=MOB_LAYER+5}
			g7{icon_state="g7";name="";density=0;layer=MOB_LAYER+5}
			g8{icon_state="g8";name="";density=0;layer=MOB_LAYER+5}
			g9{icon_state="g9";name="";density=0;layer=MOB_LAYER+5}
			g10{icon_state="g10";name="";density=0;layer=MOB_LAYER+5}
			g11{icon_state="g11";name="";density=1;}
			g13{icon_state="g11";name="";density=0;layer=MOB_LAYER+5}
			g12{icon_state="g12";name="";density=0;layer=MOB_LAYER+5}

			u1{icon_state="z1";name="";density=0;layer=MOB_LAYER+1}
			u2{icon_state="z2";name="";density=0;layer=MOB_LAYER+1}
			u3{icon_state="z3";name="";density=0;layer=MOB_LAYER+5}
			u4{icon_state="z4";name="";density=0;layer=MOB_LAYER+5}
		rock
			r1{icon_state="r1";name="";density=1}
			r2{icon_state="r2";name="";density=1}
			r3{icon_state="r3";name="";density=1}
		cross2
			d1{icon_state="d1";name="";density=1}
			d2{icon_state="d2";name="";density=0;layer=MOB_LAYER+5}
		tree
			t1{icon_state="a1";name="";density=0;layer=MOB_LAYER+5}
			t2{icon_state="a2";name="";density=0;layer=MOB_LAYER+5}
			t3{icon_state="a3";name="";density=0;layer=MOB_LAYER+5}
			t4{icon_state="a4";name="";density=0;layer=MOB_LAYER+5}
			t5{icon_state="a5";name="";density=0;layer=MOB_LAYER+5}
			t6{icon_state="a6";name="";density=0;layer=MOB_LAYER+5}
			t7{icon_state="a7";name="";density=0;layer=MOB_LAYER+5}
			t8{icon_state="a8";name="";density=0;layer=MOB_LAYER+5}
			t9{icon_state="a9";name="";density=0;layer=MOB_LAYER+5}
			t10{icon_state="a10";name="";density=0;layer=MOB_LAYER+5}
			t11{icon_state="a11";name="";density=0;layer=MOB_LAYER+5}
			t12{icon_state="a12";name="";density=0;layer=MOB_LAYER+5}
			t13{icon_state="a13";name="";density=0;layer=MOB_LAYER+5}
			t14{icon_state="a14";name="";density=0;layer=MOB_LAYER+5}

			t15{icon_state="a15";name="";density=1}
			t16{icon_state="a16";name="";density=1}
			t17{icon_state="a17";name="";density=1}
			t18{icon_state="a18";name="";density=1}
	gateway
		icon = 'limbo.dmi'
		g1 {icon_state = "g1";name="";density=1}
		g2 {icon_state = "g2";name="";density=0;layer=MOB_LAYER+5;}
		g3 {icon_state = "g3";name="";density=0;layer=MOB_LAYER+5;}
		g4 {icon_state = "g4";name="";density=0;layer=MOB_LAYER+5;}
		g5 {icon_state = "g5";name="";density=0;layer=MOB_LAYER+5;}
		g6 {icon_state = "g6";name="";density=0;layer=MOB_LAYER+5;}
		g7 {icon_state = "g7";name="";density=1}
	glass {icon = 'chipset.dmi';icon_state = "Glass";density = 1; layer = MOB_LAYER+5}
	skull
		icon = 'limbo.dmi'
		icon_state = "s1"
		name="Skull"
		density=0
		var/done = 0
		verb
			Knock()
				set src in view(1)
				if(done==0)
					done = 1
					icon_state = "s2"
					usr << "You knock on the skull."
					oview(usr) << "[usr] knocks on the skull."
					usr << sound('./sound/knock.wav',0,0,1,100)
					sleep(20)
					oview(src) << "The smiling skull diminishes gradually, losing its eerie glow."
					sleep(20)
					icon_state = "s3"
					//give a sin
					//if no sin of you sin type, give it to you
					var/mob/Player/me = usr
					var/have
					for(var/i=1;i<=length(me.contents);i++)
						var/obj/item = me.contents[i]
						if(istype(item,/obj/Getables/Sins/) && item.name==me.sin)
							have = 1
					if(have==1)
						var/s = rand(1,71)
						if(s==71)
							var/obj/Getables/Sins/Sin/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=1 && s < 10)
							var/obj/Getables/Sins/Lust/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=10 && s < 20)
							var/obj/Getables/Sins/Gluttony/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=20 && s < 30)
							var/obj/Getables/Sins/Avarice/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=30 && s < 40)
							var/obj/Getables/Sins/Sloth/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=40 && s < 50)
							var/obj/Getables/Sins/Wrath/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=50 && s < 60)
							var/obj/Getables/Sins/Envy/o = new(usr)
							o.owner = "dsrysdhysd"
						if(s>=60 && s < 70)
							var/obj/Getables/Sins/Pride/o = new(usr)
							o.owner = "dsrysdhysd"
					else
						switch(me.sin)
							if("Lust")
								var/obj/Getables/Sins/Lust/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Gluttony")
								var/obj/Getables/Sins/Gluttony/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Lust")
								var/obj/Getables/Sins/Lust/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Avarice")
								var/obj/Getables/Sins/Avarice/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Sloth")
								var/obj/Getables/Sins/Sloth/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Wrath")
								var/obj/Getables/Sins/Wrath/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Envy")
								var/obj/Getables/Sins/Envy/o = new(usr)
								o.owner = "dsrysdhysd"
							if("Pride")
								var/obj/Getables/Sins/Pride/o = new(usr)
								o.owner = "dsrysdhysd"
					usr << "Your pockets feel a little heavier."

					sleep(20)
					oview(src) << "Dust began to cover the skull up, as it fades into the ground."
					icon_state = ""
					sleep(5)

					var/xx = rand(1,84)
					var/yy = rand(103,200)
					var/turf/locato = locate(xx,yy,1)
					while(locato.density == 1)
						xx = rand(1,103)
						yy = rand(84,200)
						locato = locate(xx,yy,1)

					//done
					var/obj/skull/s = new(locate(xx,yy,1))
					s.icon_state = "s3"
					view(s) << "A small grinding sound could be heard as something surfaces from the earth."
					sleep(1)
					s.icon_state = "s2"
					sleep(1)
					s.icon_state = "s1"

					del(src)

	upthere
		icon = 'ruins.dmi'
		base
			base1{icon_state = "base1";name="";density=1;}
			Enter(O)
				if(O!=null && istype(O,/obj/))
					call(/obj/proc/Break)(O)
					return 0
				else
					if(O!=null && istype(O,/mob/Player)) // mob
						var/mob/Player/M = O
						if(M.density==0)
							return 1
					..()
		p1{icon_state = "p1";name="";density=0;layer=MOB_LAYER+5}
		p2{icon_state = "p2";name="";density=0;layer=MOB_LAYER+5}
		p3{icon_state = "p3";name="";density=0;layer=MOB_LAYER+5}
		p4{icon_state = "p4";name="";density=0;layer=MOB_LAYER+5}
		p5{icon_state = "p5";name="";density=0;layer=MOB_LAYER+5}
		p6{icon_state = "p6";name="";density=0;layer=MOB_LAYER+5}
		p7{icon_state = "p7";name="";density=0;layer=MOB_LAYER+5}
		p8{icon_state = "p8";name="";density=0;layer=MOB_LAYER+5}
		p10{icon_state = "p10";name="";density=0;layer=MOB_LAYER+5}
		glass {icon_state = "glass";name = "";density=0;layer=TURF_LAYER}
	mountain
		icon = 'limbo.dmi'
		m1{icon_state = "m1";name="";density=0;}
		m2{icon_state = "m2";name="";density=1;}
		m3{icon_state = "m3";name="";density=1;}
		m4{icon_state = "m4";name="";density=0;}
		m5{icon_state = "m5";name="";density=0;}
		m6{icon_state = "m6";name="";density=1;}
		m7{icon_state = "m7";name="";density=1;}
		m8{icon_state = "m8";name="";density=1;}
		m9{icon_state = "m9";name="";density=1;}
		m10{icon_state = "m10";name="";density=1;}
		m11{icon_state = "m11";name="";density=0;layer=MOB_LAYER+5}
		m12{icon_state = "m12";name="";density=0;layer=MOB_LAYER+5}
		m13{icon_state = "m13";name="";density=0;layer=MOB_LAYER+5}
		m14{icon_state = "m14";name="";density=0;layer=MOB_LAYER+5}
		m15{icon_state = "m15";name="";density=0;layer=MOB_LAYER+5}
		m16{icon_state = "m16";name="";density=0;layer=MOB_LAYER+5}
		m17{icon_state = "m17";name="";density=0;layer=MOB_LAYER+5}
		m18{icon_state = "m18";name="";density=0;layer=MOB_LAYER+5}
		m19{icon_state = "m19";name="";density=0;layer=MOB_LAYER+5}
		dust{icon_state = "dust";name="";density=0;layer=MOB_LAYER+10}
	inner2
		icon = 'inner2.dmi'
		chair
			chair1 {icon_state="cu";name="";density=0;layer = MOB_LAYER + 5}
			chair3 {icon_state="ocu";name="";density=0;layer = MOB_LAYER + 5}
			bottom
				chair2 {icon_state="cd";name="";density=0;}
				chair4 {icon_state="ocd";name="";density=0;}
				verb
					Sit()
						set src in view(1)
						usr.loc = src.loc
		cupboard
			c1 {icon_state="s1";name="";density=1;}
			c2 {icon_state="s2";name="";density=1;}
			c3 {icon_state="s3";name="";density=1;}
			c4 {icon_state="s4";name="";density=1;}
			c5 {icon_state="s5";name="";density=1;}
			c6 {icon_state="s6";name="";density=1;}
			c7 {icon_state="s7";name="";density=1;}
			c8 {icon_state="s8";name="";density=1;}
		shelf
			s1 {icon_state="sh1";name="";density=0;layer=MOB_LAYER+5}
			s2 {icon_state="sh2";name="";density=0;layer=MOB_LAYER+5}
			s3 {icon_state="sh3";name="";density=0;layer=MOB_LAYER+5}
			s4 {icon_state="sh4";name="";density=0;layer=MOB_LAYER+5}
			s5 {icon_state="sh5";name="";density=1;}
			s6 {icon_state="sh6";name="";density=1;}
			s7 {icon_state="sh7";name="";density=1;}
			s8 {icon_state="sh8";name="";density=1;}
			s9 {icon_state="sh9";name="";density=1;}
			s10 {icon_state="sh10";name="";density=1;}
		bookshelf
			s1 {icon_state="se1";name="";density=1;}
			s2 {icon_state="se2";name="";density=1;}
			s3 {icon_state="se3";name="";density=1;}
			s4 {icon_state="se4";name="";density=1;}
			s5 {icon_state="se5";name="";density=1;}
			s6 {icon_state="se6";name="";density=1;}
			s7 {icon_state="se7";name="";density=1;}
			s8 {icon_state="se8";name="";density=1;}
		table
			t1 {icon_state="t1";name="";density=0;layer= MOB_LAYER + 5}
			t2 {icon_state="t2";name="";density=0;layer= MOB_LAYER + 5}
			t3 {icon_state="t3";name="";density=1;}
			t4 {icon_state="t4";name="";density=1;}
			t5 {icon_state="t5";name="";density=1;}
			t6 {icon_state="t6";name="";density=1;}
		table2
			t1 {icon_state="rt1";name="";density=0;layer= MOB_LAYER + 5}
			t2 {icon_state="rt2";name="";density=0;layer= MOB_LAYER + 5}
			t3 {icon_state="rt3";name="";density=1;}
			t4 {icon_state="rt4";name="";density=1;}
			t5 {icon_state="rt5";name="";density=1;}
			t6 {icon_state="rt6";name="";density=1;}
		plant
			p1 {icon_state="p1";name="";density=0;layer= MOB_LAYER + 5}
			p2 {icon_state="p2";name="";density=1;}
		kitchen
			k1 {icon_state="k1";name="";density=1;}
			k2 {icon_state="k2";name="";density=1;}
			k3 {icon_state="k3";name="";density=1;}
			k4 {icon_state="k4";name="";density=1;}
			k5 {icon_state="k5";name="";density=1;}
			k6 {icon_state="k6";name="";density=1;}
			k7 {icon_state="k7";name="";density=1;}
			k8 {icon_state="k8";name="";density=1;}
			k9 {icon_state="k9";name="";density=1;}
			k10 {icon_state="k10";name="";density=1;}
			k11 {icon_state="k11";name="";density=1;}
			k12 {icon_state="k12";name="";density=1;}
			k13 {icon_state="k13";name="";density=1;}
			k14 {icon_state="k14";name="";density=1;}
			k15 {icon_state="k15";name="";density=1;}
			k16 {icon_state="k16";name="";density=1;}
			k17 {icon_state="k17";name="";density=1;}
			k18 {icon_state="k18";name="";density=1;}
			k19 {icon_state="k19";name="";density=1;}

	window
		icon = 'building.dmi'
		window1 {icon_state="window1";name="Window";}
		window2 {icon_state="window2";name="Window";}
		window3 {icon_state="window3";name="Window";}
		window4 {icon_state="window4";name="Window";}
		upper {icon_state="upper";name="";}
	misc
		icon = 'chipset.dmi'
		bush {icon_state="bush";name="bush";density=1;}
		npc
			mobstart{icon_state = "";name = "";invisibility=101}
			mobstart2{icon_state = "";name = "";invisibility=101}
			mobstart3{icon_state = "";name = "";invisibility=101}
			mobstart4{icon_state = "";name = "";invisibility=101}
			mobstart5{icon_state = "";name = "";invisibility=101}
			mobstart6{icon_state = "";name = "";invisibility=101}
			mobstart7{icon_state = "";name = "";invisibility=101}
			mobstart8{icon_state = "";name = "";invisibility=101}
			mobstart9{icon_state = "";name = "";invisibility=101}
			mobstart10{icon_state = "";name = "";invisibility=101}

		/*table
			icon = 'inner.dmi'
			table1 {icon_state = "table1";name = "";density=1}
			table2 {icon_state = "table2";name = "";density=1}
			table3 {icon_state = "table3";name = "";density=1}
			table4 {icon_state = "table4";name = "";density=1}
			table5 {icon_state = "table5";name = "";density=1}
			table6 {icon_state = "table6";name = "";density=1}
			table7 {icon_state = "table7";name = "";density=1}
			table8 {icon_state = "table8";name = "";density=1}
			table9 {icon_state = "table9";name = "";density=1}
			Enter(O)
				return*/
		stairs
			lstair2 {icon_state="lstair2";name="Stairs";}
			lstair3 {icon_state="lstair3";name="Stairs";}
			rstair2 {icon_state="rstair2";name="Stairs";}
			rstair3 {icon_state="rstair3";name="Stairs";}

			under
				icon = 'hell.dmi'
				us1 {icon_state="s1";name="";density=1}
				us2 {icon_state="s6";name="";density=1}
		white
			right {icon_state="right";name="";}
			down {icon_state="down";name="";}
		light
			icon = 'hell.dmi'
			light1 {icon_state="light1";name="";density=0;layer=MOB_LAYER+5}
			light2 {icon_state="light2";name="";density=1}
			bl {icon_state="bl";name="";density=1}
			br {icon_state="br";name="";density=1}
			crack1 {icon_state="crack1";name="";density=0}
			crack2 {icon_state="crack2";name="";density=0}
			crack3 {icon_state="crack3";name="";density=0}
			crack4 {icon_state="crack4";name="";density=0}

			rock2 {icon_state="rock2";name="";density=1}
			rock1 {icon_state="rock1";name="";density=0;layer=MOB_LAYER+5}
			rock4 {icon_state="rock4";name="";density=1}
			rock3 {icon_state="rock3";name="";density=0;layer=MOB_LAYER+5}
			rock6 {icon_state="rock6";name="";density=1}
			rock5 {icon_state="rock5";name="";density=0;layer=MOB_LAYER+5}
			rock7 {icon_state="rock7";name="";density=1}
			rock8 {icon_state="rock8";name="";density=0}

			d1 {icon_state="d1";name="";density=1}
			d2 {icon_state="d2";name="";density=1}
			d3 {icon_state="d3";name="";density=1}

			dark {name="";opacity=1}
		lamppost
			lamppost1{icon_state="lamppost1";name="";density=1}
			lamppost2{icon_state="lamppost2";name="";density=0;layer=MOB_LAYER+5}
			lamppost3{icon_state="lamppost3";name="";density=0;layer=MOB_LAYER+5}
			lamppost4{icon_state="lamppost4";name="";density=0;layer=MOB_LAYER+5}
			lamppost5{icon_state="lamppost5";name="";density=0;layer=MOB_LAYER+5}
			lamppost6{icon_state="lamppost6";name="";density=0;layer=MOB_LAYER+5}
			clock1{icon_state="clock1";name="";density=0;layer=MOB_LAYER+5}
			clock2{icon_state="clock2";name="";density=0;layer=MOB_LAYER+5}
		fence
			icon= 'building.dmi'
			f1 {icon_state = "f1";name="Fence";density=1;}
			f2 {icon_state = "f2";name="Fence";density=1;}
			f3 {icon_state = "f3";name="Fence";density=1;}
			f4 {icon_state = "f4";name="Fence";density=1;}
			f5 {icon_state = "f5";name="Fence";density=0;layer = MOB_LAYER+1}
			f6 {icon_state = "f6";name="Fence";density=1;}
			f7 {icon_state = "f7";name="Fence";density=1;}
			f8 {icon_state = "f8";name="Fence";density=1;}
			f9 {icon_state = "f9";name="Fence";density=1;}
			f10 {icon_state = "f10";name="Fence";density=1;}
			f11 {icon_state = "f11";name="Fence";density=0;layer = MOB_LAYER+1}
			f12 {icon_state = "f12";name="Fence";density=0;layer = MOB_LAYER+1}
		bench
			icon = 'chipset.dmi'
			lbench1 {icon_state = "lbench1";name="Bench";density=1}
			lbench2 {icon_state = "lbench2";name="Bench";density=0}
			lbench3 {icon_state = "lbench3";name="Bench";density=1}
			rbench1 {icon_state = "rbench1";name="Bench";density=1}
			rbench2 {icon_state = "rbench2";name="Bench";density=0}
			rbench3 {icon_state = "rbench3";name="Bench";density=1}
			dbench1 {icon_state = "dbench1";name="Bench";density=0}
			dbench2 {icon_state = "dbench2";name="Bench";density=0}
			dbench3 {icon_state = "dbench3";name="Bench";density=0}
			ubench1 {icon_state = "ubench1";name="Bench";density=1}
			ubench2 {icon_state = "ubench2";name="Bench";density=1}
			ubench3 {icon_state = "ubench3";name="Bench";density=1}
		tree
			icon = 'grass.dmi'
			tree1 {icon_state = "tree1";name="Tree";density=0;layer=MOB_LAYER+5}
			tree2 {icon_state = "tree2";name="Tree";density=0;layer=MOB_LAYER+5}
			tree3 {icon_state = "tree3";name="Tree";density=0;layer=MOB_LAYER+5}
			tree4 {icon_state = "tree4";name="Tree";density=0;layer=MOB_LAYER+5}
			tree5 {icon_state = "tree5";name="Tree";density=0;layer=MOB_LAYER+5}
			tree6 {icon_state = "tree6";name="Tree";density=0;layer=MOB_LAYER+5}
			tree7 {icon_state = "tree7";name="Tree";density=0;layer=MOB_LAYER+5}
			tree8 {icon_state = "tree8";name="Tree";density=0;layer=MOB_LAYER+5}
			tree9 {icon_state = "tree9";name="Tree";density=0;layer=MOB_LAYER+5}
			tree10 {icon_state = "tree10";name="Tree";density=0;}
			tree11 {icon_state = "tree11";name="Tree";density=1;layer = MOB_LAYER + 1}
			tree12 {icon_state = "tree12";name="Tree";density=0;}
		barrier
			icon = 'city.dmi'
			center {icon_state = "center";name="";density=1;layer=MOB_LAYER+1}
			left1 {icon_state = "left";name="";density=1;layer=MOB_LAYER+1}
			left2 {icon_state = "left2";name="";density=1;layer=MOB_LAYER+1}
			left3 {icon_state = "left3";name="";density=1;layer=MOB_LAYER+1}
			right1 {icon_state = "right1";name="";density=1;layer=MOB_LAYER+1}
			right2 {icon_state = "right2";name="";density=1;layer=MOB_LAYER+1}
			right3 {icon_state = "right3";name="";density=1;layer=MOB_LAYER+1}
		void
		map
		arrow
			layer = MOB_LAYER + 10
			icon = 'chipset.dmi'
			icon_state = "arrow"
			density = 0
		number
			layer = MOB_LAYER + 10
			icon = 'chipset.dmi'
			icon_state = "number"
			density = 0
turf
	opaque
		opacity = 0
		name = ""
		density = 1
	teleporter
		Hell
			icon = 'hell.dmi'
			tostair1
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toin1)
			tostair2
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toin2)
			toin1
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tostair1)
			toin2
				name = ""
				icon_state = "m6"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tostair2)

			tofr1
				name = ""
				icon_state = "s2"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toin21)
			tofr2
				name = ""
				icon_state = "s2"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toin22)
			toin21
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tofr1)
			toin22
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tofr2)

			tofr21
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tomaze1)
			tofr22
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tomaze2)
			tomaze1
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tofr21)
			tomaze2
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tofr22)

			toinup1
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tooutup1)
			toinup2
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tooutup2)
			tooutup1
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toinup1)
			tooutup2
				name = ""
				icon_state = "f1"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toinup2)

			tooutdown1
				name = ""
				icon_state = "s3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toindown1)
			tooutdown2
				name = ""
				icon_state = "s5"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/toindown2)
			toindown1
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tooutdown1)
			toindown2
				name = ""
				icon_state = "h3"
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/k = o
						k.loc = locate(/turf/teleporter/Hell/tooutdown2)
		shop1
			i1
				icon = 'hell.dmi'
				icon_state = "c6"
				name=""
				density=0
				layer=MOB_LAYER+5
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/shop1/o1)
						mo << browse(null,"window=name")
						mo << sound("./sound/open.wav",0,0,1,60)
						mo.location = "in Town"
			i2
				icon = 'hell.dmi'
				icon_state = "c6"
				name=""
				density=0
				layer=MOB_LAYER+5
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/shop1/o2)
						mo << browse(null,"window=name")
						mo << sound("./sound/open.wav",0,0,1,60)
						mo.location = "in Town"
			o1
				icon = 'building.dmi'
				icon_state = "d1"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/shop1/i1)
						mo << sound("./sound/open.wav",0,0,1,60)
						mo.location = "shop"

			o2
				icon = 'building.dmi'
				icon_state = "d2"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/shop1/i2)
						mo << sound("./sound/open.wav",0,0,1,60)
						mo.location = "shop"

		house
			i1
				icon = 'hell.dmi'
				icon_state = "c6"
				name=""
				density=0
				layer=MOB_LAYER+5
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/house/o1)
						mo << browse(null,"window=name")
						mo << sound("./sound/open.wav",0,0,1,60)
						mo.location = "in Town"
			i2
				icon = 'hell.dmi'
				icon_state = "c6"
				name=""
				density=0
				layer=MOB_LAYER+5
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/house/o2)
						mo << browse(null,"window=name")
						mo << sound("./sound/open.wav",0,0,1,60)
						mo.location = "in Town"
			o1
				icon = 'city.dmi'
				icon_state = "door2"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						if(mo.alignment>=0)
							mo.loc = locate(/turf/teleporter/house/i1)
							mo << sound("./sound/open.wav",0,0,1,60)
							mo.location = "in a house"
						else
							mo << "An invisible force prevents you from entering."
			o2
				icon = 'city.dmi'
				icon_state = "door2"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						if(mo.alignment>=0)
							mo.loc = locate(/turf/teleporter/house/i2)
							mo << sound("./sound/open.wav",0,0,1,60)
							mo.location = "in a house"
						else
							mo << "An invisible force prevents you from entering."

			s1
				icon = 'inner2.dmi'
				icon_state = "st1"
				name=""
				density=0
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/house/a1)
			s2
				icon = 'inner2.dmi'
				icon_state = "st2"
				name=""
				density=0
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/house/a2)
			a1
				icon = 'inner2.dmi'
				icon_state = "wood"
				name=""
				density=0
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/house/s1)
			a2
				icon = 'inner2.dmi'
				icon_state = "wood"
				name=""
				density=0
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/house/s2)
		Graveyard
			i1
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Graveyard/o1)
						mo << sound(,0,1,2,100)
						mo.location = "in Graveyard"

			i2
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Graveyard/o2)
						mo << sound(,0,1,2,100)
						mo.location = "in Graveyard"
			o1
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Graveyard/i1)
						mo << sound('./sound/grave.wav',0,1,2,100)
						mo.location = "in Town"
			o2
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Graveyard/i2)
						mo << sound('./sound/grave.wav',0,1,2,100)
						mo.location = "in Town"
		City
			icon = 'chipset.dmi'
			icon_state = "road"
			i1
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/City/o1)
						mo.location = "in City"
			i2
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/City/o2)
						mo.location = "in City"
			o1
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/City/i1)
						mo.location = "in Town"
			o2
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/City/i2)
						mo.location = "in Town"
		Office
			i1
				icon = 'city.dmi'
				icon_state = "door2"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Office/o1)
						mo.location = "in Office"
			i2
				icon = 'city.dmi'
				icon_state = "door2"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Office/o2)
						mo.location = "in Office"
			o1
				icon = 'hell.dmi'
				icon_state = "c6"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Office/i1)
						mo.location = "in Town"
			o2
				icon = 'hell.dmi'
				icon_state = "c6"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Office/i2)
						mo.location = "in Town"
		Housing
			i1
				icon = 'chipset.dmi'
				icon_state = "road"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Housing/o1)
			i2
				icon = 'chipset.dmi'
				icon_state = "road"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Housing/o2)
			o1
				icon = 'chipset.dmi'
				icon_state = "road"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Housing/i1)
			o2
				icon = 'chipset.dmi'
				icon_state = "road"
				name = ""
				Enter(o)
					if(istype(o,/mob/Player/))
						var/mob/Player/mo = o
						mo.loc = locate(/turf/teleporter/Housing/i2)
			z1
				icon = 'city.dmi'
				icon_state = "door2"
				name = ""
				Entered(mob/Player/M)
					if(text=="lock")
						M<<"You may not enter this Manor, it is protected my a magical barrier."
						return
					else
						M.loc = locate (158,10,1)
						M.location = "in Zach's Manor"
			z2
				icon = 'city.dmi'
				icon_state = "door2"
				name = ""
				Entered(mob/Player/M)
					if(text=="lock")
						M<<"You may not enter this Manor, it is protected my a magical barrier."
						return
					else
						M.loc = locate (158,10,1)
						M.location = "in Zach's Manor"






turf
	proc
		Mapp(x3,y3)
			var/mob/Player/m
			m.client.perspective = MOB_PERSPECTIVE
			m.client.eye = m

			var/turf/locato = locate(x3,y3,1)
			if(locato.density == 1)
				usr << "You cannot materialize yourself there. Something blocks the way."
				m.control = 0
				m.orb = 0
				return

			var/list/pass = new()
			var/mob/Player/targets
			if(m.shimmer==1)
				call(usr,/mob/Player/proc/Fade)(usr,20,20,40,10,0,0,"shimmer",ICON_ADD)
				for(targets in oview(2))
					if(m.seize == 1)
						spawn()
							call(targets,/mob/Player/proc/Fade)(targets,20,20,40,10,0,0,"shimmer",ICON_ADD)
							pass += targets
							targets.control = 1
				sleep(1)
			if(m.class == "Darklighter")
				spawn()
					call(usr,/mob/Player/proc/Effects)("darkorb2")
				sleep(1)
				for(targets in oview(2))
					if(m.seize == 1)
						spawn()
							call(targets,/mob/Player/proc/Effects)("darkorb2")
							pass += targets
							targets.control = 1
				sleep(15)
			if(m.class == "Whitelighter" || m.class == "Half Whitelighter")
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
			m.loc = locate(x3,y3,1)
			m.overlays = null





area
//	Enter_Zach
//		Entered(mob/Player/M)
//			M.loc = locate (158,10,1)
//			M.location = "in Zach's Manor"
//			if(icon_state=="sparkle")
//				M<<"You may not enter this Manor, it is protected my a magical barrier."
//				return
	Enter_Zach_Attic
		Entered(mob/Player/M)
			M.loc = locate (214,70,1)
			M.location = "in GM Sanctuary"
	Exit_Zach_Attic
		Entered(mob/Player/M)
			M.loc = locate (168,9,1)
			M.location = "in Zach's Manor"
	Exit_Zach
		Entered(mob/Player/M)
			M.loc = locate(15,69,1)
			M.location = "in San Fransico"
	Enter_Mountains
		Entered(mob/Player/M)
			M.loc = locate(35,115,1)
			M.location = "in the Hades Desert"

	Exit_Mountains
		Entered(mob/Player/M)
			M.loc = locate(99,200,2)
			M.location = "in the Cascade Mountains"


turf
	Enter_Zach
		Entered(mob/Player/M)
			M.loc = locate (158,10,1)
			M.location = "in Zach's Manor"
			if(icon_state=="sparkle")
				M<<"You may not enter this Manor, it is protected my a magical barrier."
				return