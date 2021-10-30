--[[Steal:
ammo-Barathrum (3)
head-
neck-Pentalagus Charm (2)
ear1-
ear2-
body-
hands-Thief's Kote (3)
ring1-
ring2-
back-
waist-
legs-Relic (5)
feet-AF+3 (15)]]

res = require 'resources'

function get_sets()
	sets.fc = {}
	sets.TP = {}
	sets.TH = {}
	sets.ws = {}
	sets.ja = {}
	sets.magic = {}
	sets.midcast = {}
	sets.DEF = {}
	
	sets.fc.base = {
	head="Herculean Helm",
	neck="Baetyl Pendant",
	left_ear="Etiolation Earring",
	right_ear="Loquacious Earring",
	body="Taeon Tabard",
	hands="Leyline Gloves",
	left_ring="Lebeche Ring",
	legs="Limbo Trousers",
	}
	
	sets.regen = {
	neck="Sanctity Necklace",
	left_ear="Infused Earring",
	body="Meghanada Cuirie +2",
	hands="Meghanada Gloves +2",
	right_ring="Paguroidea Ring",
	legs="Meghanada Chausses +2",
	}
	
	-- Melee Sets --
	
	sets.TP.index = {'Standard','Acc','Hybrid','DT'}	
	TP_ind = 1 -- Standard set is the Default
	
	sets.TP['Standard'] = {
	head="Adhemar Bonnet +1",
	neck="Assassin's Gorget +2",
	left_ear="Dedition Earring",
	right_ear="Sherida Earring",
	body="Pillager's Vest +3",
	hands="Adhemar Wristbands +1",
	left_ring="Gere Ring",
	right_ring="Hetairoi Ring",
	back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	waist="Reiki Yotai",
	--legs="Samnuha Tights",
	legs="Pillager's Culottes +3",
	feet="Plunderer's Poulaines +3"
	}
	
	sets.TP['Acc'] = set_combine(sets.TP['Standard'], {
	head="Pillager's Bonnet +3",
	left_ear="Telos Earring",
	hands="Malignance Gloves",
	right_ring="Regal Ring",
	legs="Pillager's Culottes +3",
	feet="Plunderer's Poulaines +3"
	})
	
	sets.TP['Hybrid'] = set_combine(sets.TP['Standard'], { --30%
	hands="Malignance Gloves",
	right_ring="Moonlight Ring",
	legs="Malignance Tights",
	})
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], { --48%
	--head="Nyame Helm", --ME123 MDB5 DT7
	--neck="Loricate Torque +1", --6
	left_ear="Odnowa Earring +1",
	body="Nyame Mail", --ME139 MDB8 DT9
	--hands="Nyame Gauntlets", --ME112 MDB4 DT7
	right_ring="Moonlight Ring", --5
	legs="Nyame Flanchard", --ME150 MDB7 DT8
	--feet="Nyame Sollerets", --ME150 MDB5 DT7
	})
	
	sets.TH.index = {'None','TH','Full'}	
	TH_ind = 1 -- Standard set is the Default
	
	sets.TH['TH'] = {
	hands="Plunderer's Armlets +3",
	}
	
	sets.TH['Full'] = { --9
	head="White Rarab cap +1", --1
	hands="Plunderer's Armlets +3", --4
	waist="Chaac Belt", --1
	feet="Skulker's Poulaines +1" --3
	}
	
	sets.melee = sets.TP['Standard']
	
	sets.idle = {left_ring="Warp Ring",feet="Pillager's Poulaines +3"}
	
	sets.refresh = set_combine(sets.idle, {
	head="Rawhide Mask",
	left_ring="Stikini Ring +1",
	})
	
	sets.midcast['Enhancing Magic'] = {
	neck="Incanter's Torque",
	left_ear="Mimir Earring",
	}
	
	sets.phalanx = {
	neck="Incanter's Torque",
	left_ear="Mimir Earring",
	right_ear="Andoaa Earring",
	left_ring="Stikini Ring +1",
	}
	
	sets.ranged = {
	head="Mummu Bonnet +2",
	neck="Iskur Gorget",
	left_ear="Telos Earring",
	right_ear="Enervating Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Regal Ring",
	right_ring="Cacoethic Ring +1",
	waist="Eschan Stone",
	legs="Malignance Tights",
	feet="Mummu Gamashes +2",
	}
	
	sets.Dagger = set_combine(sets.TP['Standard'], {
	main={ name="Aeneas", priority=2,},
	--sub={ name="Tauret", priority=1,},
	sub={ name="Ternion Dagger +1", priority=1,},
	})
	
	-- Weaponskills --
	sets.ws.common = {
	head="Adhemar Bonnet +1",
	neck="Fotia Gorget",
	right_ear="Odr Earring",
	body="Plunderer's Vest +3",
	hands="Meghanada Gloves +2",
	left_ring="Regal Ring",
	right_ring="Epaminondas's Ring",
	back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	waist="Grunfeld Rope",
	legs="Mummu Kecks +2",
	feet="Mummu Gamashes +2"
	}
	
	sets.ws["Evisceration"] = set_combine(sets.ws.common, { --50% DEX, crit rate/dmg
	head="Adhemar Bonnet +1",
	right_ear="Odr Earring",
	body="Plunderer's Vest +3",
	right_ring="Ilabrat Ring",
	hands="Adhemar Wristbands +1",
	waist="Fotia Belt",
	legs="Pillager's Culottes +3",
	feet="Plunderer's Poulaines +3"
	})
	
	sets.ws["Aeolian Edge"] = set_combine(sets.ws.common, { --40% DEX / 40% INT
	head="Nyame Helm",
	neck="Baetyl Pendant",
	right_ear="Friomisi Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	waist="Eschan Stone",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	})
	
	sets.ws["Rudra's Storm"] = set_combine(sets.ws.common, {
	head="Pillager's Bonnet +3",
	neck="Assassin's Gorget +2",
	body="Plunderer's Vest +3",
	hands="Meghanada Gloves +2",
	waist="Kentarch Belt +1",
	})
	
	sets.ws["Exenterator"] = set_combine(sets.ws.common, {
	right_ear="Sherida Earring",
	hands="Mummu Wrists +2",
	left_ring="Regal Ring",
	right_ring="Ilabrat Ring",
	legs="Meghanada Chausses +2",
	feet="Plunderer's Poulaines +3"
	})
	
	sets.ws["Savage Blade"] = set_combine(sets.ws.common, {
	head="Nyame Helm",
	right_ear="Sherida Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gere Ring",
	--waist="Sailfi Belt +1",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	})
	
	-- Magic --
	sets.magic['Utsusemi'] = set_combine(sets.fc.base, {
	neck="Magoraga Bead Necklace",
	})
	
	sets.macc = {
	head="Nyame Helm",
	neck="Incanter's Torque",
	left_ear="Vor Earring",
	right_ear="Dignitary's Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Stikini Ring +1",
	right_ring="Metamorph Ring +1",
	waist="Eschan Stone",
	legs="Malignance Tights",
	feet="Nyame Sollerets"
	}
	
	sets.THwhore = set_combine(sets.macc, {
	--head="White Rarab Cap +1",
	hands="Plunderer's Armlets +3",
	--waist="Chaac Belt",
	--feet="Skulker's Poulaines +1"
	})
	
	-- ja --
	sets.ja['Perfect Dodge'] = {hands="Plunderer's Armlets +3"}
	sets.ja['Hide'] = {body="Pillager's Vest +3"}
	sets.ja['Steal'] = set_combine(sets.THwhore, {hands="Pillager's Armlets +1",legs="Assassin's Culottes",feet="Pillager's Poulaines +3"})
	sets.ja['Mug'] = set_combine(sets.THwhore, {head="Assassin's Bonnet"})
	sets.ja['Flee'] = {feet="Pillager's Poulaines +3"}
	sets.ja['Despoil'] = set_combine(sets.THwhore, {feet="Skulker's Poulaines +1",})
	sets.ja.waltz = {body="Passion Jacket",feet="Rawhide Boots"}
	
	sets.low_hp = {
	head=empty,
	neck=empty,
	left_ear=empty,
	right_ear=empty,
	body=empty,
	hands=empty,
	left_ring="Mephitas's Ring +1",
	right_ring="Metamorph Ring +1",
	back="Solemnity Cape",
	waist="Flume Belt +1",
	legs=empty,
	feet=empty
	}
	
	sets.high_hp = {
	head="Nyame Helm",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gelatinous Ring +1",
	right_ring="Moonlight Ring",
	back="Reiki Cloak",
	waist="Carrier's Sash",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	if buffactive['Stun'] or buffactive['Petrify'] or buffactive['Terror'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
		if (spell.name == "Steal" or spell.name == "Despoil") and player.equipment.range == 'empty' then
			equip({ammo="Barathrum",})
		end
	elseif string.find(spell.english,'Waltz') then
		equip(sets.ja.waltz)
		if spell.target.type == 'SELF' then
			equip({head="Mummu Bonnet +2",})
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
		elseif spell.target.distance > (ability_distance * range_mult[ability_distance] + spell.target.model_size + player.model_size) then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		elseif player.tp >= 1000 then
			if player.equipment.main == "Aeneas" then
				if (player.tp >= 1000 and player.tp < 2500) then
					equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
				else
					equip({left_ear="Ishvara Earring"})
				end
			else
				if (player.tp >= 1000 and player.tp < 3000) then
					equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
				else
					equip({left_ear="Ishvara Earring"})
				end
			end
			if player.equipment.range == 'empty' then
				if spell.name == "Aeolian Edge" or spell.name == "Rudra's Storm" or spell.name == "Savage Blade" then
					equip({ammo="Seething Bomblet +1"})
				elseif spell.name == "Mandalic Stab" or spell.name == "Shark Bite" then
					equip({ammo="Coiste Bodhar"})
				else
					equip({ammo="Yamarang"})
				end
			end
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
				if spell.name == "Aeolian Edge" and (sets.TH[sets.TH.index[TH_ind]] == sets.TH['TH']) or (sets.TH[sets.TH.index[TH_ind]] == sets.TH['Full']) then
					equip({hands="Plunderer's Armlets +3",waist="Chaac Belt"})
				end
			else
				equip(sets.ws.common)
			end
		end
	elseif spell.action_type == 'Magic' then
		if spell.name:contains('Utsusemi:') then
			if buffactive['Copy Image (3)'] then
				cancel_spell()
			else
				equip(sets.magic['Utsusemi'])
			end
		else
			equip(sets.fc.base)
		end
		if player.equipment.range == 'empty' then
			equip({ammo="Sapience Orb"})
		end
	elseif spell.action_type == 'Ranged Attack' and player.equipment.range ~= 'empty' then
		equip(sets.ranged)
	end
end

function midcast(spell)
	if spell.skill == 'Enfeebling Magic' then
		if player.equipment.range == 'empty' then
			equip({ammo="Yamarang"})
		end
		if S{player.sub_job}:contains('BLM') then
			equip(sets.THwhore)
			if player.equipment.range == 'empty' then
				equip({ammo="Per. Lucky Egg",})
			else
				equip({waist="Chaac Belt",})
			end
		else
			weathercheck(spell.element,sets.macc)
		end
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast['Enhancing Magic'])
		if spell.name == 'Phalanx' then
			equip(sets.phalanx)
		elseif spell.name == 'Stoneskin' then
			equip({right_ear="Earthcry Earring",})
		end
	end
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.name == 'Utsusemi: Ichi' then
		if buffactive["Copy Image"] then
			windower.send_command('wait 1;cancel 66;')
		elseif buffactive['Copy Image (2)'] then 
			windower.send_command('wait 1;cancel 444')
		elseif buffactive['Copy Image (3)'] then
			windower.send_command('wait 1;cancel 445')
		end
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]],sets.TH[sets.TH.index[TH_ind]])
		if sets.TH[sets.TH.index[TH_ind]] ~= sets.TH['None'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Per. Lucky Egg"})
			else
				equip({left_ear="Suppanomimi",waist="Chaac Belt",})
			end
		elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['Acc'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Yamarang"})
			end
		elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['Hybrid'] or sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Staunch Tathlum +1"})
			end
		else
			if player.equipment.range == 'empty' then
				--equip({ammo="Coiste Bodhar"})
				equip({ammo="Yamarang"})
			end
		end
	else
		if (S{player.sub_job}:contains('BLM') or S{player.sub_job}:contains('DRK') or S{player.sub_job}:contains('RDM')) and player.mpp <= 50 then
			equip(sets.refresh)
		else
			equip(sets.TP[sets.TP.index[TP_ind]],sets.idle)
			if player.equipment.range == 'empty' then
				--equip({ammo="Coiste Bodhar",})
				equip({ammo="Yamarang"})
			end
		end
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]],sets.TH[sets.TH.index[TH_ind]])
		if sets.TH[sets.TH.index[TH_ind]] ~= sets.TH['None'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Per. Lucky Egg"})
			else
				equip({left_ear="Suppanomimi",waist="Chaac Belt",})
			end
		elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['Acc'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Yamarang"})
			end
		elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['Hybrid'] or sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Staunch Tathlum +1"})
			end
		else
			if player.equipment.range == 'empty' then
				--equip({ammo="Coiste Bodhar"})
				equip({ammo="Yamarang"})
			end
		end
	elseif new == 'Idle' then
		if (S{player.sub_job}:contains('BLM') or S{player.sub_job}:contains('DRK') or S{player.sub_job}:contains('RDM')) and player.mpp <= 50 then
			equip(sets.refresh)
		else
			equip(sets.TP[sets.TP.index[TP_ind]],sets.idle)
			if player.equipment.range == 'empty' then
				--equip({ammo="Coiste Bodhar"})
				equip({ammo="Yamarang"})
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

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs equip sets.DEF.DT') -- Hit alt+e, toggles the sets
send_command('bind !m gs equip sets.DEF.MEVA')
send_command('bind !a gs c reequip') -- Hit alt+a, reequips your gear
send_command('bind !s gs equip sets.Dagger') -- Hit alt+s
send_command('bind !r gs equip sets.regen')
send_command('bind !w gs c toggle TH set') -- Hit alt+n, toggles the sets
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')

function file_unload()
    send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !e')
	send_command('unbind !a')
	send_command('unbind !s')
	send_command('unbind !m')
	send_command('unbind !r')
	send_command('unbind !u')
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]],sets.TH[sets.TH.index[TH_ind]])
		if player.status == 'Idle' then
			equip(sets.TP[sets.TP.index[TP_ind]],sets.idle)
			if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
				equip({left_ring="Defending Ring",})
			end
		elseif player.status == 'Engaged' then
			if player.equipment.range == 'empty' then
				if sets.TP[sets.TP.index[TP_ind]] == sets.TP['Acc'] then
					equip({ammo="Yamarang"})
				elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['Hybrid'] or sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
					equip({ammo="Staunch Tathlum +1",})
				else
					--equip({ammo="Coiste Bodhar"})
					equip({ammo="Yamarang"})
				end
			end
			equip(sets.TP[sets.TP.index[TP_ind]],sets.TH[sets.TH.index[TH_ind]])
		end
    end
	if command == 'toggle TH set' then
		TH_ind = TH_ind +1
		if TH_ind > #sets.TH.index then TH_ind = 1 end
		windower.add_to_chat(1,'<----- TH Set changed to '..sets.TH.index[TH_ind]..' ----->')
		if player.status == 'Engaged' then
			equip(sets.TP[sets.TP.index[TP_ind]],sets.TH[sets.TH.index[TH_ind]])
		elseif player.status == 'Idle' then
			equip(sets.TP[sets.TP.index[TP_ind]],sets.idle)
			if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
				equip({left_ring="Defending Ring",})
			end
		end
		if sets.TH[sets.TH.index[TH_ind]] ~= sets.TH['None'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Per. Lucky Egg"})
			else
				equip({left_ear="Suppanomimi",waist="Chaac Belt",})
			end
		else
			if player.equipment.range == 'empty' and (sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] or sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['Hybrid']) then
				equip(sets.TP[sets.TP.index[TP_ind]],equip({ammo="Yamarang"})--[[{ammo="Coiste Bodhar"}]])
			end
		end
	end
	if command == 'reequip' then
		equip(sets.TP[sets.TP.index[TP_ind]],{main={ name="Aeneas",priority=2},sub={ name="Tauret",priority=1},})
		--equip(sets.TP[sets.TP.index[TP_ind]],sets.TH[sets.TH.index[TH_ind]])
		if sets.TH[sets.TH.index[TH_ind]] ~= sets.TH['None'] then
			if player.equipment.range == 'empty' then
				equip({ammo="Per. Lucky Egg"})
			else
				equip({left_ear="Suppanomimi",waist="Chaac Belt",})
			end
		else
			if player.equipment.range == 'empty' then
				equip(sets.TP[sets.TP.index[TP_ind]],equip({ammo="Yamarang"})--[[{ammo="Coiste Bodhar"}]])
			end
		end
		if player.status == 'Idle' then
			equip(sets.TP[sets.TP.index[TP_ind]],sets.idle)
			if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
				equip({left_ring="Defending Ring",})
			end
		end
	end
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
set_macros(3,1)
--Use the Lockstyle Number
set_style(003) 