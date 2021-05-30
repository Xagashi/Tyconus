res = require 'resources'

function get_sets()
	sets = {}
	sets.fc = {}
	sets.aby = {}
	sets.TP = {}
	sets.ws = {}
	sets.ja = {}
	
	sets.movement = {feet="Danzo Sune-Ate"}
	
	sets.fashion = {
	head="Hizamaru Somen +2",
	body="Hizamaru Haramaki +2",
	hands="Hizamaru Kote +1",
	legs="Hizamaru Hizayoroi +2",
	feet="Hizamaru Sune-Ate +1"
	}
	
	sets.fc.base = {
	head="Herculean helm",
	left_ear="Etiolation Earring",
	body="Samnuha Coat",
	}
	
	sets.fc.utsusemi = set_combine(sets.fc.base, {
	neck="Magoraga Bead Necklace",
	body="Passion Jacket",
	})
	
	sets.acc = {
	ammo="Date Shuriken",
	head="Mummu Bonnet +2",
	neck="Combatant's Torque",
	left_ear="Odr Earring",
	right_ear="Telos Earring",
	body="Tatenashi Haramaki +1",
	hands="Tatenashi Gote +1",
	left_ring="Regal Ring",
	right_ring="Cacoethic Ring +1",
	back="Agema Cape",
	waist="Kentarch Belt +1",
	legs="Malignance Tights",
	feet="Mummu Gamashes +2"
	}

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
	main="Zanmato"
	})
	
	sets.aby['Staff'] = set_combine(sets.acc, {
	main="Savagelands Pole"
	})
	
	sets.katana = {
	main={ name="Heishi Shorinken", priority=2,},
	sub={ name="Kanaria", priority=1,},
	}
	
	sets.dagger = {
	main={ name="Hornetneedle", priority=2,},
	sub={ name="Mercurial Kris", priority=1,}
	}
	
	sets.TP.index = {'Standard','DT',}
	TP_ind = 1
	
	sets.TP['Standard'] = set_combine(sets.acc, {
	head="Adhemar Bonnet +1",
	left_ear="Suppanomimi",
	left_ring="Gere Ring",
	right_ring="Hetairoi Ring",
	waist="Sailfi Belt +1",
	legs="Samnuha Tights",
	--legs="Tatenashi Haidate +1",
	--feet="Tatenashi Sune-Ate +1"
	})
	
	sets.TP['DT'] = {
	head="Blistering Sallet +1",
	neck="Loricate Torque +1",
	hands="Malignance Gloves",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending Ring",
	back="Andartia's Mantle",
	legs="Malignance Tights",
	feet="Amm Greaves"
	}
	
	sets.idle = set_combine(sets.TP['Standard'], {
	left_ring="Warp Ring",
	feet="Danzo Sune-Ate"
	})
	
	sets.th = {
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
	
	sets.ws.common = {
	head="Mpaca's Cap",
	neck="Fotia Gorget",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	back="Andartia's Mantle",
	waist="Fotia Belt",
	legs="Hiza. Hizayoroi +2",
	}
	
	sets.ws["Blade: Shun"] = set_combine(sets.ws.common, {
	right_ear="Lugra Earring +1",
	})
	
	sets.ws["Aeolian Edge"] = set_combine(sets.ws.common, {
	ammo="Seething Bomblet +1",
	head="Herculean Helm",
	neck="Baetyl Pendant",
	right_ear="Friomisi Earring",
	body="Samnuha Coat",
	hands="Leyline Gloves",
	waist="Eschan Stone",
	})
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
		if player.tp < 1000 or player.status == "Idle" then
			cancel_spell()
		elseif spell.target.distance > (ability_distance * range_mult[ability_distance] + spell.target.model_size + player.model_size) then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		elseif player.TP > 1000 then
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				if spell.name ~= "Cyclone" or spell.name ~= "Blade: Ei" or spell.name ~= "Tachi: Jinpu" then
					equip(sets.ws.common)
				end
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
	end
end

function midcast(spell)
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.english:contains('Utsusemi') then
		equip(sets.utsusemi)
		if buffactive["Copy Image"] then
			windower.send_command('wait 1;cancel 66;')
		elseif buffactive['Copy Image (2)'] then 
			windower.send_command('wait 1;cancel 444')
		elseif buffactive['Copy Image (3)'] then
			windower.send_command('wait 1;cancel 445')
		elseif buffactive['Copy Image (4+)'] then
			windower.send_command('wait 1;cancel 446')
		end
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

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !w gs c toggle Aby set') -- Hit alt+w, toggles the sets
send_command('bind !a gs equip sets.katana') -- Hit alt+a, toggles the sets
send_command('bind !s gs equip sets.dagger') -- Hit alt+s, toggles the sets
send_command('wait 5;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')


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
end

function file_unload()
    send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !a')
	send_command('unbind !s')
end