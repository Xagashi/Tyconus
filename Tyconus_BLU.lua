target_distance = 8

res = require 'resources'
send_command('lua l Skillchains')

BarElements = S{"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera"}
BarAilments = S{"Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra"}
NaSpells = S{"Blindna","Erase","Paralyna","Poisona","Silena","Stona","Viruna"}
BoostSpells = S{"Boost-STR","Boost-DEX","Boost-VIT","Boost-AGI","Boost-INT","Boost-MND","Boost-CHR"}
EnfeeblingMND = S{"Paralyze","Slow"}
EnfeeblingINT = S{"Blind","Bind","Dispel","Sleep","Sleep II","Sleepga","Sleepga II","Poison","Poison II","Poisonga"}

function get_sets()
	sets.fc = {}
	sets.precast = {}
	sets.midcast = {}
	sets.aftercast = {}
	sets.ja = {}
	sets.ws = {}
	sets.buff = {}
	sets.misc = {}
	sets.idle = {}
	sets.nuke = {}
	sets.TP = {}
	sets.main = {}
	sets.sub = {}
	
	sets.movement = {
		idle = {legs="Carmine Cuisses +1"}
	}
	
----------------------------------------------------------------------------------------------------------------
-------------------------------------------------- Fast Cast ---------------------------------------------------
----------------------------------------------------------------------------------------------------------------
	
	sets.fc.base = { --2+14+4+2+1+9+5+10+10+3+8+8=76
	ammo="Sapience Orb", --2
	head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
	neck="Baetyl Pendant", --4
	left_ear="Loquac. Earring", --2
	right_ear="Etiolation Earring", --1
	body={ name="Taeon Tabard", augments={'"Fast Cast"+5',}}, --9
	hands={ name="Leyline Gloves", augments={'Accuracy+4',}}, --5
	left_ring="Medada's Ring", --10
	right_ring="Lebeche Ring",
	back={ name="Fi Follet Cape +1", augments={'Path: A',}}, --10
	waist="Witful Belt", --3
	legs="Enif Cosciales", --8
	feet="Carmine Greaves +1", --8
	}
	
	sets.fc.cure = set_combine(sets.fc.base, {
	})
	
	sets.fc.healing = set_combine(sets.fc.base, {
	})
	
	sets.fc.stoneskin = set_combine(sets.fc.base, {
	})
	
	sets.fc['Enhancing Magic'] = set_combine(sets.fc.base, {
	})
	
	sets.fc['Blue Magic'] = set_combine(sets.fc.base, {
	body="Hashishin Mintan +3",
	})
	
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------- MIDCAST ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.main.index = {--[['Tizona',]]'Naegling','Maxentius'}
	main_ind = 1
	
	--sets.main['Tizona'] = {main="Tizona"}
	sets.main['Naegling'] = {main="Naegling"}
	sets.main['Maxentius'] = {main="Maxentius"}
	
	sets.sub.index = {'Thibron','Bunzi\'s Rod'}
	sub_ind = 1
	
	sets.sub['Thibron'] = {sub="Thibron"}
	sets.sub['Bunzi\'s Rod'] = {sub="Bunzi's Rod"}
	
	sets.TP.index = {'Standard','DT','Learning'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	ammo="Aurgelmir Orb +1",
	head="Malignance Chapeau",
	neck="Mirage Stole +2",
	left_ear="Eabani Earring",
	right_ear="Hashishin Earring +1",
	body="Malignance Tabard",
	hands="Gazu Bracelets +1", 
	left_ring="Chirich Ring +1",
	right_ring="Epona's Ring",
	back="Null Shawl",
	waist="Reiki Yotai",
	legs="Gleti's Breeches",
	feet="Malignance Boots"
	}
	
	sets.TP['Learning'] = set_combine(sets.TP['Standard'], {
	--main={ name="Brass Xiphos", priority=2,},
	--sub={ name="Genmei Shield", priority=1,},
	--ammo="Coiste Bodhar",
	--head="Malignance Chapeau",
	--neck="Null Loop",
	--left_ear="Crepuscular Earring",
	--right_ear="Hashishin Earring +1",
	--body="Malignance Tabard",
	hands="Assimilator's Bazubands +1",
	--left_ring={name="Chirich Ring +1", bag="wardrobe2"},
    --right_ring={name="Chirich Ring +1", bag="wardrobe3"},
	--back="Null Shawl",
	--waist="Sailfi Belt +1",
	--legs="Gleti's Breeches",
	--feet="Malignance Boots"
	})
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], { --49
	ammo="Staunch Tathlum +1", --3
	head="Null Masque",
	neck="Loricate Torque +1", --6
	body="Nyame Mail", --9
	hands="Nyame Gauntlets", --7
	right_ring="Murky Ring", --10
	legs="Nyame Flanchard", --8
	feet="Nyame Sollerets" --7
	})
	
	sets.nuke.index = {'Free'}
	nuke_ind = 1 --Free set is the Default
	
	sets.nuke['Free'] = {
	ammo="Ghastly Tathlum +1",
	head="Hashishin Kavuk +3",
	neck="Sibyl Scarf",
	left_ear="Regal Earring",
	right_ear="Friomisi Earring",
	body="Hashishin Mintan +3",
	hands="Hashishin Bazubands +3",
	left_ring="Medada's Ring",
	right_ring="Metamorph Ring +1",
	back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
	waist="Orpheus's Sash",
	legs="Luhlaza shalwar +4",
	feet="Hashishin Basmak +3"
	}
	
	sets.idle.index = {'Idle','Refresh','DT'}--,'PDT','MDT'}
	idle_ind = 1 --Idle set is the Default
	
	sets.idle['Idle'] = set_combine(sets.TP['Standard'], {
	left_ring="Warp Ring",
	})
	
	sets.idle['Refresh'] = set_combine(sets.idle['Idle'], {
	head="Null Masque",
	body="Hashishin Mintan +3",
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
	right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	waist="Fucho-no-Obi"
	})
	
	sets.idle['DT'] = sets.TP['DT']
	
	sets.ja["Diffusion"] = {feet="Luhlaza Charuqs +4"}
	
	sets.midcast.enhancing = {
	neck="Incanter's Torque",
	left_ear="Andoaa Earring",
	right_ear="Mimir Earring",
	body={ name="Telchine Chasuble", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	back={ name="Fi Follet Cape +1", augments={'Path: A',}},
	waist="Olympus Sash",
	}
	
	sets.midcast.enhancingduration = set_combine(sets.midcast.enhancing, {
	head={ name="Telchine Cap", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	body={ name="Telchine Chasuble", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	hands={ name="Telchine Gloves", augments={'Pet: "Mag.Atk.Bns."+20','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
	legs={ name="Telchine Braconi", augments={'Pet: Evasion+16','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
	feet={ name="Telchine Pigaches", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}}
	})
	
	sets.midcast['Aquaveil'] = set_combine(sets.midcast.enhancingduration, {
	head="Amalric Coif +1",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	})
	
	sets.midcast['Phalanx'] = set_combine(sets.midcast.enhancingduration, {
	head={ name="Herculean Helm", augments={'Weapon skill damage +1%','"Mag.Atk.Bns."+20','Phalanx +3','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
	hands={ name="Herculean Gloves", augments={'Enmity-2','"Snapshot"+3','Phalanx +4','Accuracy+7 Attack+7','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
	legs={ name="Herculean Trousers", augments={'Pet: INT+6','"Mag.Atk.Bns."+18','Phalanx +3','Accuracy+19 Attack+19',}},
	feet={ name="Herculean Boots", augments={'"Mag.Atk.Bns."+23','Pet: "Store TP"+8','Phalanx +3',}}
	})
	
	sets.midcast.blueskill = {
	--ammo="Mavi Tathlum", --5
	--head="Luhlaza Keffiyeh +4", --18
	neck="Mirage Stole +2", --20
	--left_ear="Njordr Earring", --10
	right_ear="Hashishin Earring +1", --11
	--body="Assimilator's Jubbah +4", --25
	left_ring={name="Stikini Ring +1", bag="wardrobe1"}, --8
    right_ring={name="Stikini Ring +1", bag="wardrobe2"}, --8
	back="Cornflower Cape", --15
	legs="Hashishin Tayt +3", --33
	feet="Luhlaza Charuqs +4" --13
	}
	
	sets.midcast.cure = { --Stack healing skill
	ammo="Pemphredo Tathlum",
	head="Nyame Helm",
	neck="Incanter's Torque",
	left_ear="Beatific Earring",
	right_ear="Meili Earring",
	body="Nyame Mail",
	hands="Telchine Gloves",
	left_ring="Menelaus's Ring",
	right_ring="Janniston Ring",
	back="Solemnity Cape",
	waist="Bishop's Sash",
	legs="Carmine Cuisses +1",
	feet="Nyame Sollerets"
	}
	
	sets.midcast.magicacc = {
	--ammo="Mavi Tathlum",
    ammo="Pemphredo Tathlum",
	head="Hashishin Kavuk +3",
	neck="Mirage Stole +2",
	left_ear="Dignitary's Earring",
	right_ear="Hashishin Earring +1",
    body="Hashishin Mintan +3",
    hands="Hashishin Bazubands +3",
	left_ring="Medada's Ring",
    right_ring="Metamor. Ring +1",
	back="Null Shawl",
	waist="Null Belt",
    legs="Hashishin Tayt +3",
    feet="Hashishin Basmak +3"
	}
	
	sets.midcast.dark = set_combine(sets.nuke['Free'], {
	head="Pixie Hairpin +1",
	body="Hashishin Mintan +3",
	left_ring="Archon Ring",
	})
	
	sets.midcast.breath = set_combine(sets.nuke['Free'], {
	--ammo="Mavi Tathlum",
	--head="Luh. Keffiyeh +3",
	})
	
	sets.midcast.whitewind = {
	ammo={name="Ghastly Tathlum +1",priority=335},
	head={name="Blistering Sallet +1",priority=118},
	neck={name="Unmoving Collar +1",priority=200},
	left_ear={name="Tuisto Earring",priority=150},
	right_ear={name="Odnowa Earring +1",priority=200},
	body={name="Nyame Mail",priority=224},
	hands={name="Nyame Gauntlets",priority=164},
	left_ring={name="Gelatinous Ring +1",priority=135},
	right_ring={name="Eihwaz Ring",priority=70},
	waist={name="Platinum Moogle Belt",priority=300},
	legs={name="Nyame Flanchard",priority=163},
	feet={name="Nyame Sollerets",priority=112}
	}

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------- MISC -----------------------------------------------------
---------------------------------------------------------------------------------------------------------------
	
	sets.ws.common = {
	ammo="Coiste Bodhar",
	head="Hashishin Kavuk +3",
	neck="Fotia Gorget",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Ilabrat Ring",
	right_ring="Epaminondas's Ring",
	--back="Aurist's Cape +1",
	waist="Fotia Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws['Savage Blade'] = set_combine(sets.ws.common, {
	nack="Republican Platinum Medal",
	right_ear="Hashishin Earring +1",
	waist="Sailfi Belt +1",
	})
	
	sets.ws['Black Halo'] = sets.ws['Savage Blade']
	
	sets.ws['Sanguine Blade'] = set_combine(sets.ws.common, {
	ammo="Ghastly Tathlum +1",
	neck="Sibyl Scarf",
	left_ear="Regal Earring",
	right_ear="Friomisi Earring",
	hands="Jhakri Cuffs +2",
	left_ring="Archon Ring",
	back="Aurist's Cape +1",
	waist="Orpheus's Sash",
	legs="Hashishin Tayt +3",
	legs="Luhlaza Shalwar +4",
	feet="Hashishin Basmak +3"
	})
	
	sets.low_hp = {
	head="Pixie Hairpin +1",
	neck=empty,
	left_ear=empty,
	right_ear=empty,
	body=empty,
	hands=empty,
	left_ring="Mephitas's Ring +1",
	right_ring="Metamorph Ring +1",
	back=empty,
	legs=empty,
	feet=empty,
	}
	
	sets.high_hp = {
	head="Null Masque",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gelatinous Ring +1",
	right_ring="Murky Ring",
	waist="Platinum Moogle Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}

end

function precast(spell)
	busy = true
	--local dist_mult = range_mult[math.floor(ability_distance + 0.5)] or 1.0
	if buffactive['Stun'] or buffactive['Petrify'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
	elseif spell.action_type == 'Magic' then
		if sets.fc['Blue Magic'] then
			equip(sets.fc['Blue Magic'])
		else
			equip(sets.fc.base)
		end
	elseif spell.type == "WeaponSkill" then 
		local range_mult = {
			[2] = 1.55,
			[3] = 1.490909,
			[4] = 1.44,
			[5] = 1.377778,
			[6] = 1.30,
			[7] = 1.15,
			[8] = 1.25,
			[9] = 1.377778,
			[10] = 1.45,
			[11] = 1.454545454545455,
			[12] = 1.666666666666667,
		}
		ability_distance = res.weapon_skills[spell.id].range
		if player.tp < 1000 then
			cancel_spell()
		--elseif spell.target.distance > (ability_distance * dist_mult + spell.target.model_size + player.model_size) then
		elseif spell.target.distance > (ability_distance * range_mult[ability_distance] + spell.target.model_size + player.model_size) then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		elseif player.tp > 1000 then
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				equip(sets.ws.common)
			end
			if player.tp >= 1000 and player.tp < 2750 then
				equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
			end
		end
	end
end

function midcast(spell)
	if spell.action_type == 'Magic' and not spell.type:contains('Trust') then
		if sets.midcast[spell.name] then
			equip(sets.midcast[spell.name])
		elseif spell.skill == 'Blue Magic' then
			if Blue_SkillBasedBuff:contains(spell.name) then
				equip(sets.midcast.blueskill)
			elseif Blue_Healing:contains(spell.name) then
				equip(sets.midcast.cure)
			elseif Blue_MagicalStat:contains(spell.name) then
				equip(sets.nuke[sets.nuke.index[nuke_ind]])
			elseif Blue_MagicalDark:contains(spell.name) then
				equip(sets.midcast.dark)
			elseif Blue_PhysicalStat:contains(spell.name) or Blue_MagicAccuracy:contains(spell.name) or Blue_StunPhysical:contains(spell.name) or Blue_StunMagical:contains(spell.name) then
				equip(sets.midcast.magicacc)
			elseif Blue_Breath:contains(spell.name) then
				equip(sets.midcast.breath)
			elseif spell.name == "White Wind" then
				equip(sets.midcast.whitewind)
			end
		elseif spell.skill == "Enhancing Magic" then
			equip(sets.midcast.enhancingduration)
		elseif spell.skill == 'Elemental Magic' then
			equip(sets.nuke[sets.nuke.index[nuke_ind]])
		end
	end
	
	if spell.name == "Stoneskin" and buffactive["Stoneskin"] then
		send_command('cancel Stoneskin')
	elseif (spell.name == 'Sneak' or spell.english == 'Spectral Jig') and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif string.find(spell.english,'Utsusemi') and buffactive["Copy Image"] then
		send_command('@wait 1;cancel 66;')
	end
end

function aftercast(spell)
	if player.status == "Idle" then
		equip(sets.idle[sets.idle.index[idle_ind]])
		if player.mpp <= 45 and sets.idle[sets.idle.index[idle_ind]] ~= sets.idle['DT'] then
			equip(sets.idle['Refresh'])
		end
	elseif player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
	end
	busy = false
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.misc.rest)
	elseif new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.idle[sets.idle.index[idle_ind]])
		if player.mpp <= 45 then
			equip({waist="Fucho-no-Obi"})
		end
	end
end

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"silence"}:contains(name) then
		if gain then
			--send_command('@input /item "Echo Drops" <me>')
			send_command('@input /item "Remedy" <me>')
		end
	elseif S{"reraise"}:contains(name) then
		if gain then
		else
			if player.hp ~= 0 then
				add_to_chat(123, 'Reraise: [lost]')
			end
		end
	elseif S{"sublimation: activated"}:contains(name) then
		if gain then
			equip({waist="Embla Sash"})
		else
			if player.mpp <= 45 then
				equip({waist="Fucho-no-Obi"})
			else
				equip({waist="Shinjutsu-no-obi"})
			end
		end
	end
end

function weathercheck(spell_element,set)
    if not set then
		return
	end
    if spell_element == world.weather_element or spell_element == world.day_element then
		equip(set,{back="Twilight Cape",waist="Hachirin-no-Obi"})
    else
		equip(set)
    end
    if set[spell_element] then
		equip(set[spell_element])
	end
end

function zodiaccheck(spell_element)
    if spell_element == world.day_element and spell_element ~= 'Dark' and spell_element ~= 'Light' then
        equip({left_ring="Zodiac Ring"})
    end
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle idle set' then
		idle_ind = idle_ind +1
		if idle_ind > #sets.idle.index then idle_ind = 1 end
		windower.add_to_chat(1,'<----- idle Set changed to '..sets.idle.index[idle_ind]..' ----->')
		equip(sets.idle[sets.idle.index[idle_ind]])
	elseif command == 'toggle nuke set' then
		nuke_ind = nuke_ind +1
		if nuke_ind > #sets.nuke.index then nuke_ind = 1 end
		windower.add_to_chat(1,'<----- nuke Set changed to '..sets.nuke.index[nuke_ind]..' ----->')
	elseif command == 'toggle main set' then
		main_ind = main_ind +1
		if main_ind > #sets.main.index then main_ind = 1 end
		equip(sets.main[sets.main.index[main_ind]])
		
		--[[if main_ind == 1 then
			send_command('alias physical @input /ws "Chant du Cygne" <t>')
		else]]if main_ind == 1 then
			send_command('alias physical @input /ws "Savage Blade" <t>')
			send_command('alias magical @input /ws "Sanguine Blade" <t>')
		elseif main_ind == 2 then
			send_command('alias physical @input /ws "Black Halo" <t>')
			send_command('alias magical @input /ws "Brainshaker" <t>')
		end
	elseif command == 'toggle sub set' then
		sub_ind = sub_ind +1
		if sub_ind > #sets.sub.index then sub_ind = 1 end
		equip(sets.sub[sets.sub.index[sub_ind]])
	elseif command == 'runspeed' then
		if player.status == 'Idle' then
			equip(customize_idle_set(sets.idle))
		end
	end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs c toggle idle set') -- Hit alt+e, toggles the sets
send_command('bind !n gs c toggle nuke set') -- Hit alt+n, toggles the sets
send_command('bind ^` gs c toggle main set') -- Hit ctrl+`, toggles the sets
send_command('bind !` gs c toggle sub set') -- Hit alt+`, toggles the sets
send_command('bind !w gs equip movement.idle') -- Hit alt+w, equips movement equipment

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
	send_command('unbind !n')
	send_command('unbind !w')
	send_command('unbind !`')
	send_command('unbind ^`')
	send_command('lua u Skillchains')
end

moving = false

function check_moving()
	if moving and player.status == 'Idle' and not busy then
		return sets.movement.idle
	elseif player.status == 'Idle' and not busy then
		return sets.idle[sets.idle.index[idle_ind]]
	end
end

function customize_idle_set(idleSet)
	return set_combine(idleSet, check_moving())
end

-- Movement tracker with auto day/night reswap
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
	mov = {counter=0, timecheck=0, last_phase=nil}
	local mob = windower.ffxi.get_mob_by_index(player.index)
	mov.x = mob.x
	mov.y = mob.y
	mov.z = mob.z
	
	windower.raw_register_event('prerender', function()
		mov.counter = mov.counter + 1
		mov.timecheck = mov.timecheck + 1
	
		local pl = windower.ffxi.get_mob_by_index(player.index)
		if mov.counter > 15 and pl and mov.x then
			local dist = math.sqrt((pl.x - mov.x)^2 + (pl.y - mov.y)^2 + (pl.z - mov.z)^2)
			local now_moving = dist > 0.1
			if now_moving ~= moving then
				moving = now_moving
				send_command('gs c runspeed')
			end
			mov.x, mov.y, mov.z = pl.x, pl.y, pl.z
			mov.counter = 0
		end
    end)
end

------------------------------------------
-- Macro and Style Change on Job Change
------------------------------------------
function set_macros(sheet,book)
    if book then
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
	add_to_chat (55, 'You are on '..tostring(player.main_job_full):color(5)..''..('. '):color(55)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(8,5)
--Use the Lockstyle Number--
set_style(008)

-- Physical spell list, not enough difference to be specified
Blue_PhysicalStat = S{'Bilgestorm','Heavy Strike','Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash','Quadrastrike','Saurian Slide','Sinker Drill','Spinal Cleave','Sweeping Gouge','Uppercut','Vertical Cleave','Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault','Vanity Dive','Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash','Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb','Spiral Spin','Wild Oats','Mandibular Bite','Queasyshroom','Ram Charge','Screwdriver','Tourbillion','Bludgeon'}

--[[
--- Physical spells with no particular (or known) stat mods
-Blue_Physical = S{'Bilgestorm'}
-
--- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
-Blue_PhysicalAcc = S{'Heavy Strike'}
-
--- Physical spells with Str stat mod
-Blue_PhysicalStr = S{'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash','Quadrastrike','Saurian Slide','Sinker Drill','Spinal Cleave','Sweeping Gouge','Uppercut','Vertical Cleave'}
-
--- Physical spells with Dex stat mod
-Blue_PhysicalDex = S{'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault','Vanity Dive'}
-
--- Physical spells with Vit stat mod
-Blue_PhysicalVit = S{'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam','Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'}
-
--- Physical spells with Agi stat mod
-Blue_PhysicalAgi = S{'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb','Spiral Spin','Wild Oats'}
-
--- Physical spells with Int stat mod
-Blue_PhysicalInt = S{'Mandibular Bite','Queasyshroom'}
-
--- Physical spells with Mnd stat mod
-Blue_PhysicalMnd = S{'Ram Charge','Screwdriver','Tourbillion'}
-
--- Physical spells with Chr stat mod
-Blue_PhysicalChr = S{'Bludgeon'}

-- Physical spells with HP stat mod
Blue_PhysicalHP = S{'Final Sting'}
]]

-- Magical spell list, not enough difference to be specified
Blue_MagicalStat = S{'Anvil Lightning','Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Droning Whirlwind','Embalming Earth','Entomb','Firespit','Foul Waters','Ice Break','Leafstorm','Maelstrom','Molting Plumage','Nectarous Deluge','Regurgitation','Rending Deluge','Scouring Spate','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval','Water Bomb','Blinding Fulgor','Diffusion Ray','Radiant Breath','Rail Cannon','Retinal Glare','Acrid Stream','Magic Hammer','Mind Blast','Mysterious Light','Thermal Pulse','Charged Whisker','Gates of Hades'}

-- Magical spells with the typical Int mod
--Blue_Magical = S{'Anvil Lightning','Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Droning Whirlwind','Embalming Earth','Entomb','Firespit','Foul Waters','Ice Break','Leafstorm','Maelstrom','Molting Plumage','Nectarous Deluge','Regurgitation','Rending Deluge','Scouring Spate','Silent Storm','Spectral Floe','Subduction','Tem. Upheaval','Water Bomb'}

Blue_MagicalDark = S{'Dark Orb','Death Ray','Eyes On Me','Evryone. Grudge','Palling Salvo','Tenebral Crush'}

--[[
Blue_MagicalLight = S{'Blinding Fulgor','Diffusion Ray','Radiant Breath','Rail Cannon','Retinal Glare'}

-- Magical spells with a primary Mnd mod
Blue_MagicalMnd = S{'Acrid Stream','Magic Hammer','Mind Blast'}

-- Magical spells with a primary Chr mod
Blue_MagicalChr = S{'Mysterious Light'}

-- Magical spells with a Vit stat mod (on top of Int)
Blue_MagicalVit = S{'Thermal Pulse'}

-- Magical spells with a Dex stat mod (on top of Int)
Blue_MagicalDex = S{'Charged Whisker','Gates of Hades'}
]]
-- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
-- Add Int for damage where available, though.
Blue_MagicAccuracy = S{'1000 Needles','Absolute Terror','Actinic Burst','Atra. Libations','Auroral Drape','Awful Eye', 'Blank Gaze','Blistering Roar','Blood Saber','Chaotic Eye','Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest','Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar','Geist Wall','Infrasonics','Jettatura','Light of Penance','Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'}

-- Breath-based spells
Blue_Breath = S{'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath','Hecatomb Wave','Magnetite Cloud','Poison Breath','Self-Destruct','Thunder Breath','Vapor Spray','Wind Breath'}

-- Stun spells
Blue_StunPhysical = S{'Frypan','Head Butt','Sudden Lunge','Tail slap','Whirl of Rage'}
Blue_StunMagical = S{'Blitzstrahl','Temporal Shift','Thunderbolt'}

-- Healing spells
Blue_Healing = S{'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','Wild Carrot'}

-- Buffs that depend on blue magic skill
Blue_SkillBasedBuff = S{'Diamondhide','Magic Barrier','Metallic Body','Occultation'}

-- Other general buffs
Blue_Buff = S{'Amplification','Animating Wail','Barrier Tusk','Carcharian Verve','Cocoon','Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell','Memento Mori','Nat. Meditation','Orcish Counterstance','Plasma Charge','Pyric Bulwark','Reactor Cool','Refueling','Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion','Zephyr Mantle'}

Blue_Refresh = S{'Battery Charge'}

-- Spells that require Unbridled Learning to cast.
Unbridled_spells = S{'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool','Crashing Thunder','Cruel Joke','Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar','Pyric Bulwark','Tearing Gust','Thunderbolt','Tourbillion','Uproot'}