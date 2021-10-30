AbysseaWS = S{"Red Lotus Blade","Seraph Blade","Cyclone","Energy Drain","Blade: Ei","Seraph Strike","Freezebite","Shadow of Death","Raiden Thrust","Tachi: Jinpu","Tachi: Koki","Earth Crusher","Sunburst"}
res = require 'resources'
ElementalWheel = S{"Katon: Ichi","Katon: Ni","Katon: San","Suiton: Ichi","Suiton: Ni","Suiton: San","Doton: Ichi","Doton: Ni","Doton: San","Hyoton: Ichi","Hyoton: Ni","Hyoton: San","Huton: Ichi","Huton: Ni","Huton: San","Raiton: Ichi","Raiton: Ni","Raiton: San"}
EnfeeblingWheel = S{"Kurayami: Ichi","Kurayami: Ni","Hojo: Ichi","Hojo: Ni","Dokumori: Ichi","Jubaku: Ichi","Aisha: Ichi","Yurin: Ichi"}

function get_sets()
	sets.fc = {}
	sets.aby = {}
	sets.TP = {}
	sets.ws = {}
	sets.ja = {}
	sets.precast = {}
	sets.midcast = {}
	sets.nuke = {}
	
	sets.movement = {feet="Danzo Sune-Ate"}
	
	sets.fc.base = {
	ammo="Sapience Orb",
	head="Herculean helm",
	neck="Baetyl Pendant",
	left_ear="Etiolation Earring",
	right_ear="Loquacious Earring",
	body="Taeon Tabard",
	hands="Leyline Gloves",
	right_ring="Kishar Ring",
	legs="Arjuna Breeches",
	}
	
	sets.fc.utsusemi = set_combine(sets.fc.base, {
	neck="Magoraga Bead Necklace",
	})
	
	sets.acc = {
	ammo="Seki Shuriken",
	head="Mummu Bonnet +2",
	neck="Combatant's Torque",
	left_ear="Telos Earring",
	right_ear="Odr Earring",
	body="Tatenashi Haramaki +1",
	hands="Tatenashi Gote +1",
	left_ring="Regal Ring",
	right_ring="Cacoethic Ring +1",
	back="Agema Cape",
	waist="Kentarch Belt +1",
	legs="Tatenashi Haidate +1",
	feet="Mummu Gamashes +2"
	}
	
	sets.macc = {
	ammo="Yamarang",
	head="Nyame Helm",
	neck="Combatant's Torque",
	left_ear="Dignitary's Earring",
	right_ear="Lugra Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Stikini Ring +1",
	right_ring="Metamorph Ring +1",
	back="Andartia's Mantle",
	waist="Eschan Stone",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.nuke.index = {'Free','MB'}
	nuke_ind = 1 --Free set is the Default
	
	sets.nuke['Free'] = {
	ammo="Seething Bomblet +1",
	head="Nyame Helm",
	neck="Sanctity Necklace",
	left_ear="Dignitary's Earring",
	right_ear="Friomisi Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Stikini Ring +1",
	right_ring="Metamorph Ring +1",
	back="Andartia's Mantle",
	waist="Eschan Stone",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.nuke['MB'] = set_combine(sets.nuke['Free'], {})

	sets.aby.index = {'Staff','Sword','Dagger','Katana','Club','Great Sword','Scythe','Polearm','Great Katana'}
	Aby_ind = 1
	
	sets.aby['Sword'] = set_combine(sets.acc, {
	main={ name="Blizzard Brand +1", priority=2,},
	sub={ name="Mercurial Kris", priority=1,}
	})
	
	sets.aby['Dagger'] = set_combine(sets.acc, {
	main={ name="Hornetneedle", priority=2,},
	sub={ name="Mercurial Kris", priority=1,}
	})
	
	sets.aby['Katana'] = set_combine(sets.acc, {
	main={ name="Trainee Burin", priority=2,},
	sub={ name="Mercurial Kris", priority=1,}
	})
	
	sets.aby['Club'] = set_combine(sets.acc, {
	main={ name="Heartbeater +1", priority=2,},
	sub={ name="Mercurial Kris", priority=1,},
	neck="Combatant's Torque"
	})
	
	sets.aby['Great Sword'] = set_combine(sets.acc, {
	main="Lament",
	neck="Combatant's Torque"
	})
	
	sets.aby['Scythe'] = set_combine(sets.acc, {
	main="Lost Sickle +1"
	})
	
	sets.aby['Polearm'] = set_combine(sets.acc, {
	main="Sha Wujing's Lance"
	})
	
	sets.aby['Great Katana'] = set_combine(sets.acc, {
	main="Mutsunokami +1"
	})
	
	sets.aby['Staff'] = set_combine(sets.acc, {
	main="Aern Staff II"
	})
	
	sets.katana = {
	main={ name="Heishi Shorinken", priority=2,},
	sub={ name="Kanaria", priority=1,},
	}
	
	sets.dagger = {
	main={ name="Tauret", priority=2,},
	sub={ name="Ternion Dagger +1", priority=1,}
	--main={ name="Hornetneedle", priority=2,},
	--sub={ name="Mercurial Kris", priority=1,}
	}
	
	sets.TP.index = {'Standard','DT',}
	TP_ind = 1
	
	sets.TP['Standard'] = set_combine(sets.acc, {
	head="Adhemar Bonnet +1",
	right_ear="Brutal Earring",
	body="Malignance Tabard",
	hands="Adhemar Wristbands +1",
	left_ring="Gere Ring",
	right_ring="Hetairoi Ring",
	waist="Kentarch Belt +1",
	legs="Kendatsuba Hakama +1",
	feet="Tatenashi Sune-Ate +1"
	})
	
	sets.TP['HighAcc'] = set_combine(sets.TP['Standard'], {
	head="Mpaca's Cap",
	hands="Tatenashi Gote +1",
	})
	
	sets.TP['DT'] = {
	head="Blistering Sallet +1",
	neck="Loricate Torque +1",
	hands="Malignance Gloves",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending Ring",
	back="Andartia's Mantle",
	legs="Malignance Tights",
	}
	
	sets.idle = set_combine(sets.TP['Standard'], {
	left_ring="Warp Ring",
	feet="Danzo Sune-Ate"
	})
	
	sets.th = {
	ammo="Perfect Lucky Egg",
	head="White Rarab Cap +1",
	waist="Chaac Belt",
	}
	
	sets.enmity = {
	right_ear="Cryptic Earring",
	right_ring="Petrov Ring",
	back="Agema Cape",
	}
	
	sets.utsusemi = {
	back="Andartia's Mantle",
	}
	
	--Snapshot > Rapid Shot
	sets.precast.RA = {}
	
	--r.acc/stp/crit/agi/recycle
	sets.midcast.RA = {
	head="Nyame Helm",
	neck="Iskur gorget",
	left_ear="Telos Earring",
	right_ear="Enervating Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Ilabrat Ring",
	right_ring="Cacoethic Ring +1",
	waist="Eschan Stone",
	legs="Malignance Tights",
	feet="Nyame Sollerets"
	}
	
	sets.ws.common = {
	head="Nyame Helm",
	neck="Fotia Gorget",
	right_ear="Brutal Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gere Ring",
	right_ring="Epaminondas's Ring",
	back="Andartia's Mantle",
	waist="Fotia Belt",
	--waist="Sailfi Belt +1",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws["Blade: Chi"] = set_combine(sets.ws.common, {
	ammo="Seething Bomblet +1",
	neck="Baetyl Pendant",
	right_ear="Friomisi Earring",
	right_ring="Regal Ring",
	waist="Eschan Stone",
	--waist="Sailfi Belt +1",
	})
	
	sets.ws["Blade: Ten"] = set_combine(sets.ws.common, {
	})
	
	sets.ws["Blade: Hi"] = set_combine(sets.ws.common, {
	head="Adhemar Bonnet +1",
	right_ear="Odr Earring",
	body="Tatenashi Haramaki +1",
	--body=Kendatsuba Samue +1",
	--hands="Mpaca's Gloves",
	right_ring="Hetairoi Ring",
	--waist="Sailfi Belt +1",
	--legs="Mpaca's Hose",
	--feet="Mpaca's Boots"
	})
	
	sets.ws["Blade: Shun"] = set_combine(sets.ws.common, {
	head="Adhemar Bonnet +1",
	right_ring="Regal Ring",
	waist="Fotia Belt",
	})
	
	sets.ws["Aeolian Edge"] = set_combine(sets.ws["Blade: Chi"], {
	neck="Baetyl Pendant",
	waist="Eschan Stone",
	})
	
	sets.ws["Evisceration"] = sets.ws["Blade: Hi"]--50% DEX, crit rate/dmg
end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	if (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
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
		elseif spell.target.distance > (ability_distance * range_mult[ability_distance] + spell.target.model_size + player.model_size) then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		elseif player.TP >= 1000 and not AbysseaWS:contains(spell.name) then
			if player.equipment.main == "Keishi Shorinken" then
				if player.tp >= 1000 and player.tp < 2250 then
					equip({head="Mpaca's Cap", left_ear="Moonshade Earring"})
				elseif player.tp < 2500 then
					equip({left_ear="Moonshade Earring"})
				elseif world.time >= (17*60) or world.time <= (7*60) then
					equip({left_ear="Lugra Earring +1"})
				else
					equip({left_ear="Ishvara Earring"})
				end
			else
				if player.tp >= 1000 and player.tp < 2750 then
					equip({head="Mpaca's Cap", left_ear="Moonshade Earring"})
				elseif player.tp < 3000 then
					equip({left_ear="Moonshade Earring"})
				elseif world.time >= (17*60) or world.time <= (7*60) then
					equip({left_ear="Lugra Earring +1"})
				else
					equip({left_ear="Ishvara Earring"})
				end
			end
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				equip(sets.ws.common)
			end
		end
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			equip(sets.fc.utsusemi)
		else
			equip(sets.fc.base)
		end
	elseif spell.name == 'Provoke' or spell.name == 'Warcry' then
		equip(sets.enmity)
		if spell.name == 'Provoke' then
			equip(sets.th)
		end
	elseif spell.action_type == 'Ranged Attack' then
		equip(sets.precast.RA)
	end
end

function midcast(spell)
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.english:contains('Utsusemi') then
		equip(sets.utsusemi)
		if spell.english == 'Utsusemi: Ichi' then
			if buffactive["Copy Image"] then
				windower.send_command('wait 1;cancel 66;')
			elseif buffactive['Copy Image (2)'] then 
				windower.send_command('wait 1;cancel 444')
			end
		end
	elseif ElementalWheel:contains(spell.name) then
		weathercheck(spell.element,sets.nuke[sets.nuke.index[nuke_ind]])
	elseif EnfeeblingWheel:contains(spell.name) then
		equip(sets.macc)
	elseif spell.action_type == 'Ranged Attack' then
		equip(sets.midcast.RA)
	end
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.idle)
	end
end

function status_change(new,old)
	if new == 'Idle' then
		equip(sets.idle)
	elseif new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
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

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs c toggle Aby set') -- Hit alt+w, toggles the sets
send_command('bind !a gs equip sets.katana') -- Hit alt+a, toggles the sets
send_command('bind !s gs equip sets.dagger') -- Hit alt+s, toggles the sets
--send_command('wait 5;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
send_command('bind !n gs c toggle nuke set') -- Hit alt+n, toggles the sets


function self_command(command)
	if command == 'toggle Aby set' then
		Aby_ind = Aby_ind +1
		if Aby_ind > #sets.aby.index then Aby_ind = 1 end
		windower.add_to_chat(1,'<----- Weapon Set changed to '..sets.aby.index[Aby_ind]..' ----->')
		equip(sets.aby[sets.aby.index[Aby_ind]])
	end
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- Melee Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.status == 'Idle' then
			equip(sets.movement)
		end
	end
	if command == 'toggle nuke set' then
		nuke_ind = nuke_ind +1
		if nuke_ind > #sets.nuke.index then nuke_ind = 1 end
		windower.add_to_chat(1,'<----- nuke Set changed to '..sets.nuke.index[nuke_ind]..' ----->')
	end
end

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
	send_command('unbind !a')
	send_command('unbind !s')
	send_command('unbind !n')
end

function set_macros(sheet,book)
    if book then
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
	add_to_chat (55, 'You are on '..('Samurai'):color(5)..('. '):color(55)..''..('Macros set!'):color(121))
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end
 
--Page, Book--
set_macros(4,1)
--Use the Lockstyle Number
set_style(002)