#define CREATE_NEW "Create a new Character"
#define DELETE "Delete a Character"
#define LOAD "Load into Existing"
#define QUIT "Leave the Game"
#define NUMBER_OF_CHAR_ALLOWED 3
#define WORLD_VIEW 7
#define WELCOME "<b>Welcome to Charmed Online</b><br>Based on the TV Series created by <b>Constance M.Burge</b><br>Game made by <b>Xoule and Ragnarok HGM</b>"
#define ANNOUNCEMENT "<b>The game is now under the command of Ragnarok HGM, and will begin receiving new updates and features. Everyone, Enjoy your stay here at Charmed Online.</b>"
//#define MOTD ""


world
	New()
		for(var/i=0;i<20;i++)
			MakeNPC()
		for(var/i=0;i<4;i++)
			MakeMonster()
			MakeMonster3()
		MakeMonster2()
		MakeMOB("steward")
		MakeMOB("kelnerth")
		MakeMOB("dymas")
		MakeMOB("alexis")
		MakeMOB("rena")
		MakeMOB("triad")
		MakeMOB("triad")
		MakeMOB("triad")
		MakeMOB("beatrice")
		//LoadMap(1,1)
	hub = "RagnarokHGM.CharmedOnline"
	mob = /mob/Choosing_Char
	view = WORLD_VIEW
	status = "<b><font color=black>Main Server || <font color=blue>Charmed Online</font></b>"
	turf = /turf/floor/water/ceil9/
client
	//command_text = ".alt"
	command_prompt = "Constance M. Burge's Charmed - Based on the TV Series by Xoule and Ragnarok HGM (2006)"
	mouse_pointer_icon = 'mouse.dmi'
	default_verb_category = "Actions"
	client/script = "<STYLE> BODY {background:#003333;color:white;} BIG IMG.icon {height: 32px; width: 32px}</STYLE>"//link {text-decoration: underline; color: #708090;} visited {text-decoration: none; color: #708090;}
client/New()
	//src.client.address
//	if(key == "Xoule" || key == "Gamemaster123")
//		src << "You have been allowed into the game."
//	else
//		src << "It's not opened yet. It's here probably for debugging purposes."
//		return
/*
client.preload for faster transfer and saves server lag
client.show_map 2 for big?
client.inactivity
..()*/
	var/savefile/lock = new("./player/ragnarokice.sav")
	if(key=="Ragnarok Ice" || key == "Zachh")
		var/lockyes = alert(src,"Lock this server and prevent the host from hosting? Or Unlock it and allow it to be hosted?","HGM Server Control","Lock","Unlock","Lock 30")
		if(lockyes=="Lock")
			lock["/locked/"] << 1
			world << "<p align=center><font color=red>This server has been <b>Locked</b> by an Administrator. This server has shut down. "
			sleep(10)
			world<<"<p align=center><font color=red>For more information, contact the System Operator: Ragnarok HGM.  Goodbye."
			spawn(50)
				world.Del()
				del world
		//	for(var/mob/M in world)
		//		if(M.key)
		//			M<<"You have been disconnected from Charmed Online.  Server Locked Down.
		//			del M
		if(lockyes=="Lock 30")
			lock["/locked2/"] << 1
			world << "<font color=red><p align=center>This server has been <b>Locked</b> by an Administrator. This server will be terminated in 30 seconds."
			sleep(10)
			world<<"<p align=center><font color=red>For more information, contact the System Operator: Ragnarok HGM."
			sleep(10)
			world<<"<font color=red>System disconnected."
			sleep(10)
			world<<"<font color=red>Goodbye."
			spawn(300)
				world.Del()
				del world

		else
			lock.dir.Remove("locked")
			lock.dir.Remove("locked2")
			world<<"<p align=center><font color=red>System Operator: Ragnarok HGM, has <b>unlocked</b> this server."
			sleep(20)
			world<<"<p align=center><font color=red>World Opened."
			sleep(20)
			world<<"<p align=center><font color=red>Have fun."
	if(lock.dir.Find("locked"))
		src << "<font color=red>This server has been <b>Locked</b> by a Game Administrator. Access Denied."
		del src
	if(lock.dir.Find("locked2"))
		src << "<font color=red>This server has been <b>Locked</b> by a Game Administrator. Access Denied."
		sleep(300)
		del src
	if(ckey == "guest")
		src << "You are currently logged in as <b>Guest</b>"
		src << "Please get yourself a BYOND Key to proceed."
		src << "<a href=http://www.byond.com>Click here</a>"
		del(src)
	var/savefile/banned = new("./player/bannedlist")
	if(banned.dir.Find(ckey))
		src << "Your account has been revoked."
		src << "If you were wrongly banned from Charmed Online, please post on our forums."
		banned.cd = "/[ckey]/"
		var/reason
		banned >> reason
		src << "[reason]"
		src << "<a href=http://www.twc.jconserv.net>Click here</a>"
		del(src)
	var/savefile/ipbanned = new("./player/ipbannedlist")
	if(ipbanned.dir.Find(address))
		src << "Your have been suspended from Charmed Online."
		src << "If you were wrongly banned from Charmed Online, please post on our forums."
		ipbanned.cd = "/[address]/"
		var/reason
		ipbanned >> reason
		src << "[reason]"
		src << "<a href=http://www.twc.jconserv.net>Click here</a>"
		del(src)
	//one more, check if ip is already present ><;
	if(key=="Grand elder"||key=="Bloodrayne94"||key=="Blaze125"||key=="BloodRayne666"||key=="Ragnagirl")
		var/savefile/ban = new("./player/ipbannedlist")
		ban.cd = "/[address]"
		ban << "Banned by: <b> HGM Security System<br>"
		src << "Banned for life."
		del(src)
		//for(var/mob/M in world)
		//	if(M.key == "Ragnarok HGM")
		//		world << "Blade has logged in. IP: [address]  <font color=red>WARNING: This idiot needs to be banned immediately.  Disconnecting in 10 seconds if not banned."
		//		sleep(100)
		//		del M
/*	for(var/mob/M in world)
		if(M.client) //is PC
			if(address == M.client.address)
				src << "You're already logged into another account."
				src << "Please note that multikeying is disabled on this server."
				del(src)*/
	..()

mob
	Choosing_Char
		var/helptext = "What will you be called?"
		var/title = "CHARMED: New Character"
		Move()
			return
		Login()
			var/noofpple
			for(var/mob/Player/m in world)
				if(noofpple==1)
					del(usr)
			loc = locate(/turf/loginscreen/loginstart)
			name = ""
			usr << sound("./sound/charmed.wav",1,0,1,100)
			RELOG
			var/savefile/save = new("./player/[ckey].sav")
			save.cd = "/"
			//var/list/characters = save.dir

			//TO GET NAME OF CHAR
			var/char_name
			var/list/names = new()
			for (var/entry in save.dir)
				if(entry!="unlock")
					save["[entry]/name"] >> char_name
					names += char_name

			if(!names.len)
				sleep(10)
				usr << ""
				call(/mob/Player/proc/Unlock)(ckey, "Human")
				while(Create_New()==0);
			else
				save.cd = "/"
				var/list/menu = new()
				if(names.len<=NUMBER_OF_CHAR_ALLOWED)
					menu += CREATE_NEW
				//menu += characters
				menu += names
				if(names.len>1)
					menu += DELETE
				menu += QUIT

				//menu -= "Unlock"
				//check ip
				var/choice = input("","CHARMED: Main Menu",null) in menu
				switch(choice)
					if(CREATE_NEW)
						while(Create_New()==0);
					if(DELETE)
						while(Deleteme()==1);
						goto RELOG;
					if(QUIT)
						Logout()
					else
						Loadme(choice)
		proc/Loadme(choice as text)
			//var { savex;savey;savez }
			var/hash
			var/savefile/save = new("./player/[ckey].sav")
			var/safe = lowertext(choice)
			safe = ckey(choice)
			save["/[safe]"] >> usr
			save["/[safe]/hash"] >> hash
			var/mob/Player/m = usr
			if(md5("[m.stamina[1]]/[m.damagecounter]/[m.damagecounter2]/[m.class]/[m.rank]")!= hash)
				//client << "Corrupted savefile."
				//del(usr)
				return
			//var { savex;savey;savez }
			//Move(locate(usr.locx, savey, savez))
		proc/Deleteme()
			var/savefile/save = new("./player/[ckey].sav")
			save.cd = "/"

			var/char_name
			var/list/names = new()
			for (var/entry in save.dir)
				if(entry!="unlock")
					save["[entry]/name"] >> char_name
					names += char_name

			//var/list/characters = save.dir
			//var/list/menu = new()
			//menu+=characters
			names += "Cancel"
			var/choice = input("Who to delete?","CHARMED: Delete a Character",null) in names
			switch(choice)
				if("Cancel") return 0
				else
					var/deletecon = alert("[choice] will be deleted.",null,"Confirm","No")
					switch(deletecon)
						if("Confirm")
							var/safe = lowertext(choice)
							safe = ckey(choice)
							save.dir.Remove(safe)
							return 1
						else
							return 1
		proc/Create_New()
			var/namechosen = input(helptext,title,null)
			if(namechosen == "")
				var/choice = alert("Your need to have a name.",title, "Continue","Auto-Generate Name")
				switch(choice)
					if("Continue")
						return 0
					else namechosen = randname(usr.gender)
				choice = alert("Use this name:[namechosen]?",null, "Yes", "No")
				switch(choice)
					if("Yes")
						..() //do continue
					else
						return 0
			var/safename = lowertext(namechosen)
			safename = ckey(safename)
			var/savefile/save = new("./player/[ckey].sav")
			save.cd = "/"
			if(safename in save.dir)
				alert("That name has already been taken.",title, "Continue")
				return 0
			//continue
			save.cd = "/"
			save.cd = "/Unlock"
			var/list/classes = save.dir
			classes -= "name"
			var/whattobe = input("What are you?",title,null) in classes
			var/mob/Player/m = new()
			m.death = 1
			m.name = namechosen
			m.class = whattobe
			m.icon_state = "body2"
			m.origname = namechosen
			m.style = 2
			var/hair = input("What is the colour of your hair?",title,null) in list("White","Black","Brown","Blonde","Red")
			m.orighair = hair
			m.hair = hair
			var/skin = input("What is the colour of your skin?",title,null) in list("Pale","Normal","Tan","Tanner","Dark")
			m.origskin = skin
			m.skin = skin
			if(gender==MALE)
				m.gender=MALE
				m.origgender=MALE
			else
				m.gender=FEMALE
				m.origgender=FEMALE
			var/list/thergb = m.tehrgb
			m.origrgb = thergb.Copy()

			//for witches
			if(whattobe != "Human")
				switch(whattobe)
					if("Lower Demon")
						m.energyball = 1
						m.demonquest = 3
						m.alignment = -50
					if("Warlock")
						m.telekinesis[1] = 1
						m.telekinesis[2] = 0
						m.telekinesis[3] = expneeded[m.telekinesis[1]]
						m.summonathame[1] = 1
						m.summonathame[2] = 0
						m.summonathame[3] = expneeded[m.summonathame[1]]
						//m.verbs += /mob/Player/Powers/verb/Telekinetic_Repel
						m.damagecounter2 = 3
						m.damagecounter = 3
						m.alignment = -40
					if("Whitelighter")
						m.damagecounter2 = 3
						m.damagecounter = 3
						m.alignment = 20
					if("Darklighter")
						m.damagecounter2 = 3
						m.damagecounter = 3
						m.telepathy[1] = 1
						m.telepathy[2] = 1
						m.telepathy[3] = expneeded[m.telepathy[1]]
						m.alignment = -20
					if("Telekinetic Witch")
						m.telekinesis[1] = 1
						m.telekinesis[2] = 0
						m.telekinesis[3] = expneeded[m.telekinesis[1]]
						//m.verbs += /mob/Player/Powers/verb/Telekinetic_Repel
						m.damagecounter2 = 3
						m.damagecounter = 3
					if("Invisibility Witch")
						m.inviso[1] = 1
						m.inviso[2] = 0
						m.inviso[3] = expneeded[m.inviso[1]]
						//m.verbs += /mob/Player/Powers/verb/Telekinetic_Repel
						m.damagecounter2 = 3
						m.damagecounter = 3
					if("Astral Witch")
						m.astralproj[1] = 1
						m.astralproj[2] = 0
						m.astralproj[3] = expneeded[m.astralproj[1]]
						//m.verbs += /mob/Player/Powers/verb/Telekinetic_Repel
						m.damagecounter2 = 3
						m.damagecounter = 3
					if("Half Whitelighter")
						m.telekinesis[1] = 1
						m.telekinesis[2] = 0
						m.telekinesis[3] = expneeded[m.telekinesis[1]]
						//m.verbs += /mob/Player/Powers/verb/Telekinetic_Repel
						m.damagecounter2 = 3
						m.damagecounter = 3
					if("Molecular Witch")
						m.molecular[1] = 1
						m.molecular[2] = 0
						m.molecular[3] = expneeded[m.molecular[1]]
						//m.verbs += /mob/Player/Powers/verb/Temporal_Stasis_One
						m.damagecounter2 = 3
						m.damagecounter = 3
					if("Premonition Witch")
						m.premonition[1] = 1
						m.premonition[2] = 0
						m.premonition[3] = expneeded[m.premonition[1]]
						m.damagecounter2 = 3
						m.damagecounter = 3
					if("Telepath Witch")
						m.telepathy[1] = 1
						m.telepathy[2] = 0
						m.telepathy[3] = expneeded[m.telepathy[1]]
						m.class = "Telepath Witch"
						m.damagecounter2 = 3
						m.damagecounter = 3
			else
				var/fire = rand(10,100)
				if(fire==77)
					m.class = "Firestarter"
					m.firestarter[1] = 1
					m.firestarter[2] = 0
					m.firestarter[3] = expneeded[m.firestarter[1]]
					m.damagecounter2 = 3
					m.damagecounter = 3
					m << "<p align=center>REDCHARM+<i>You have been given a rare inner talent.</i>REDCHARM+"
			client.mob = m
			//m.loc = locate(/turf/floor/start/)
			del(usr)