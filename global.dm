var/list/mfirstname = list("Justin","Orlano","Jake","Richard","Charles","Charlie","Aaron","Cliff","Michael","Mark","Tim","Derek","Jason","Ben","Benard","Daniel", "Edward","Faust","Gerald","Howard","Ian","Janus","Leon","Nick","Peter","Raymond","Symus","Thomas","Willy","Leslie")
var/list/ffirstname = list("Amy","Lora","Valerie","Veronica","Michelle","Tina","Sharon","Rachel","Zoey","Aeris","Beatrice","Angela","Fiona","Gina","Helen","Janet","Kat","Leona","Macy","Natalee","Polly","Venus","Yani","Abby","Alicia","Audrey","Chelsea","Ella","Joanne","Lillian")
var/list/lastname = list("Silver","Parker","Smith","Baker","Archer","Brown","Rivers","Windsor","Appleyard","Berry","Broadley","Chester","Coldwell","Downey","Gray","Jenkinson","Larkin","Norton","Rowse","Rush","Shaw","Strong","Wilson","Willow","Combs","Turner")

var/MOTD = ""

icon
	alice
		icon = 'Alice Charmed.bmp'
	empty
		icon = 'empty.dmi'
var/list/expneeded = list(1,3,9,27,30,30,30,30,30,30)
//var/list/expneeded = list(0,0,0,0,0,0,0,0,0,0)
var/list/attacked = new()
var/page = 1
proc/MakeNPC()
	var/mob/Player/m = new()
	//generate gender?
	var/gend = rand(1,2)
	if(gend==1)
		m.gender=MALE
	else
		m.gender=FEMALE
	m.name = randname(m.gender)
	m.tehrgb[1] = rand(1,255)
	m.tehrgb[2] = rand(1,255)
	m.tehrgb[3] = rand(1,255)
	m.tehrgb[4] = rand(1,255)
	m.tehrgb[5] = rand(1,255)
	m.tehrgb[6] = rand(1,255)
	m.alignment = rand(3,5)
	m.class = "innocent"
	m.location = "in Town"
	gend = rand(1,5)
	switch(gend)
		if(1) m.skin = "Pale"
		if(2) m.skin = "Normal"
		if(3) m.skin = "Tan"
		if(4) m.skin = "Tanner"
		if(5) m.skin = "Dark"

	gend = rand(1,5)
	switch(gend)
		if(1) m.hair = "White"
		if(2) m.hair = "Black"
		if(3) m.hair = "Brown"
		if(4) m.hair = "Blonde"
		if(5) m.hair = "Red"

	m.Setme()
	gend = rand(1,10)
	switch(gend)
		if(1) m.loc = locate(/obj/misc/npc/mobstart)
		if(2) m.loc = locate(/obj/misc/npc/mobstart2)
		if(3) m.loc = locate(/obj/misc/npc/mobstart3)
		if(4) m.loc = locate(/obj/misc/npc/mobstart4)
		if(5) m.loc = locate(/obj/misc/npc/mobstart5)
		if(6) m.loc = locate(/obj/misc/npc/mobstart6)
		if(7) m.loc = locate(/obj/misc/npc/mobstart7)
		if(8) m.loc = locate(/obj/misc/npc/mobstart8)
		if(9) m.loc = locate(/obj/misc/npc/mobstart9)
		if(10) m.loc = locate(/obj/misc/npc/mobstart10)
	walk_rand(m,25)
proc/MakeMOB(who)
	switch(who)
		if("steward")
			var/mob/Player/NPCSteward/e = new(locate(109,8,1))
			e.name = "Steward Mason"
			e.gender = MALE
			e.skin = "Pale"
			e.hair = "Black"
			e.alignment = 5
			e.location = "in Shop"
			e.tehrgb[1] = rand(1,255)
			e.tehrgb[2] = rand(1,255)
			e.tehrgb[3] = rand(1,255)
			e.tehrgb[4] = rand(1,255)
			e.tehrgb[5] = rand(1,255)
			e.tehrgb[6] = rand(1,255)
			e.Setme()
		if("rena")
			var/mob/Player/NPCRena/e = new(locate(169,21,1))
			e.name = "Rena Anderson"
			e.gender = FEMALE
			e.skin = "Tan"
			e.hair = "Blonde"
			e.alignment = 5
			e.location = "in Office"
			e.tehrgb[1] = 180
			e.tehrgb[2] = 150
			e.tehrgb[3] = 0
			e.tehrgb[4] = rand(1,255)
			e.tehrgb[5] = rand(1,255)
			e.tehrgb[6] = rand(1,255)
			e.Setme()
		if("beatrice")
			var/mob/Player/NPCBeatrice/e = new(locate(142,62,1))
			e.name = "Beatrice"
			e.gender = FEMALE
			e.skin = "Pale"
			e.hair = "White"
			e.alignment = 20
			e.location = "Up There"
			e.tehrgb[1] = 255
			e.tehrgb[2] = 255
			e.tehrgb[3] = 255
			e.tehrgb[4] = 255
			e.tehrgb[5] = 255
			e.tehrgb[6] = 255
			e.Setme()
		if("alexis")
			var/mob/Player/NPCAlexis/e = new(locate(109,146,1))
			e.name = "Alexis"
			e.gender = FEMALE
			e.skin = "Pale"
			e.hair = "Brown"
			e.location = "in Hell"
			e.alignment = -5
			e.tehrgb[1] = rand(1,255)
			e.tehrgb[2] = rand(1,255)
			e.tehrgb[3] = rand(1,255)
			e.tehrgb[4] = rand(1,255)
			e.tehrgb[5] = rand(1,255)
			e.tehrgb[6] = rand(1,255)
			e.Setme()
			e.dir = EAST
		if("kelnerth")
			var/mob/Player/Monster/NPCKelnerth/e = new(locate(53,100,1))
			e.name = "Kelnerth"
			e.gender = MALE
			e.skin = "Dark"
			e.hair = "Black"
			e.class = "Kelnerth"
			e.location = "in Hell"
			e.alignment = -20
			e.tehrgb[1] = rand(1,255)
			e.tehrgb[2] = rand(1,255)
			e.tehrgb[3] = rand(1,255)
			e.tehrgb[4] = rand(1,255)
			e.tehrgb[5] = rand(1,255)
			e.tehrgb[6] = rand(1,255)
			e.Setme()
		if("dymas")
			var/mob/Player/Monster/NPCDymas/e = new(locate(164,182,1))
			e.name = "Dymas"
			e.gender = MALE
			e.skin = "Pale"
			e.hair = "Brown"
			e.class = "Dymas"
			e.location = "in Hell"
			e.alignment = -10
			e.tehrgb[1] = rand(1,255)
			e.tehrgb[2] = rand(1,255)
			e.tehrgb[3] = rand(1,255)
			e.tehrgb[4] = rand(1,255)
			e.tehrgb[5] = rand(1,255)
			e.tehrgb[6] = rand(1,255)
			e.Setme()
		if("triad")
			var/mob/Player/Monster/Triad/e = new(locate(206,188,1))
			e.name = "Triad"
			e.gender = MALE
			e.skin = "Dark"
			e.hair = "Black"
			e.class = "Triad"
			e.location = "in Hell"
			e.alignment = -20
			e.tehrgb[1] = 0
			e.tehrgb[2] = 0
			e.tehrgb[3] = 0
			e.tehrgb[4] = 0
			e.tehrgb[5] = 0
			e.tehrgb[6] = 0
			e.Setme()
proc/MakeMonster()
	var/mob/Player/Monster/Ghast/e = new()
	var/obj/head/Head = new() // new head
	Head.icon = 'head.dmi'
	Head.icon_state = "ghast"
	e.icon = 'bottom.dmi'
	e.icon_state = "ghast"
	e.overlays += Head
	e.gender = NEUTER
	e.alignment = rand(-3,-5)
	e.location = "in Graveyard"
	var/xx = rand(161,198)
	var/yy = rand(55,80)
	var/turf/locato = locate(xx,yy,1)
	while(locato.density == 1)
		xx = rand(161,198)
		yy = rand(55,80)
		locato = locate(xx,yy,1)
	e.loc = locate(xx,yy,1)

proc/MakeMonsterGk()
	var/mob/Player/Monster/Ghast/e = new()
	var/obj/head/Head = new() // new head
	Head.icon = 'head.dmi'
	Head.icon_state = "ghast"
	e.icon = 'bottom.dmi'
	e.icon_state = "ghast"
	e.overlays += Head
	e.gender = NEUTER
	e.alignment = rand(-3,-5)
	e.location = "in the Cascade Mountains"
	var/xx = rand(161,198)
	var/yy = rand(55,80)
	var/turf/locato = locate(xx,yy,1)
	while(locato.density == 1)
		xx = rand(27,151)
		yy = rand(27,151)
		locato = locate(xx,yy,1)
	e.loc = locate(xx,yy,1)

proc/MakeMonster3()
	var/mob/Player/Monster/Zombie/e = new()
	e.name = "Zombie"
	e.gender = MALE
	e.skin = "Demon"
	e.location = "in Graveyard"
	e.demonskin[1] = 100
	e.demonskin[2] = 100
	e.demonskin[3] = 100
	e.hair = "White"
	e.alignment = rand(-5,-10)
	e.tehrgb[1] = rand(1,255)
	e.tehrgb[2] = rand(1,255)
	e.tehrgb[3] = rand(1,255)
	e.tehrgb[4] = rand(1,255)
	e.tehrgb[5] = rand(1,255)
	e.tehrgb[6] = rand(1,255)
	e.Setme()

	var/xx = rand(161,198)
	var/yy = rand(55,80)
	var/turf/locato = locate(xx,yy,1)
	while(locato.density == 1)
		xx = rand(161,198)
		yy = rand(55,80)
		locato = locate(xx,yy,1)
	e.loc = locate(xx,yy,1)

proc/MakeMonster2()
	var/mob/Player/Monster/Speed_Demon/e = new()
	var/obj/head/Head = new() // new head
	Head.icon = 'head.dmi'
	Head.icon_state = "guysplit"
	e.icon = 'bottom.dmi'
	e.location = "in Hell"
	e.alignment = rand(-10,-12)
	e.icon_state = "guybottom"
	e.overlays += Head
	e.gender = MALE
	e.alignment = rand(0,-5)
	e.loc = locate(170,170,1)
	e.name = "Demon"

proc/randname(gender as text)
	var/firstname
	var/surname
	var/random
	if(gender == "male")
		//select a male name XD!
		random = mfirstname.len
		firstname = mfirstname[rand(1,random)]
	else
		random = ffirstname.len
		firstname = ffirstname[rand(1,random)]
	random = lastname.len
	surname = lastname[rand(1,random)]

	firstname = "[firstname] [surname]"
	return firstname

proc/genline(type as text)
	switch(type)
		if("user") usr << "<center><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></BIG></center>"
		if("source") src << "<center><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></BIG></center>"
		if("world") world << "<center><BIG><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'><IMG CLASS=icon SRC=\ref['charmed.dmi'] \ ICONSTATE='line'></BIG></center>"

	//generates a random name from the list

/*


obj
	head
		icon = 'player.dmi'
		icon_state = "head"
		density = 0
		layer = MOB_LAYER + 2
		pixel_y = 32
*/

//Set the style of the char
/*			SetStyle()
		proc/SetStyle()
			icon_state = "[style]"
			/*if(style == 1)
				//overlays += /obj/head
			else
				usr << "Error, no style chosen"*/
*/

/*area/birthing_hut
   Entered(O)
      O << "Waaaaah!  You land in a pile of straw."
      return ..()
   verb/exit()
      var/mob/Player/me = usr
      if(me.Move(locate(1,1,1))) //jump to the map or whatever
         usr << "You crawl into the open air..."
      else
         usr << "The hut door is blocked.  You cannot get out."
         //rooms
*/