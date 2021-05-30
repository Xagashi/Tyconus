SIRDspells = S{"Cure IV","Raise","Banishga","Crusade","Cocoon","Chaotic Eye","Sheep Song","Blank Gaze","Geist Wall","Jettatura","Phalanx","Sound Blast","Sandspin","Soporific",}
res = require 'resources'

function get_sets()
	sets.fc = {}
	sets.ja = {}
	sets.ws = {}
	sets.buff = {}
	sets.misc = {}
	sets.sword = {}
	sets.shield = {}
	
	sets.movement = {legs="Carmine Cuisses +1"}
	
	sets.fc.base = { --2+14+4+10+4+10+4+8=56
	ammo="Sapience Orb", --2%
	head={name="Carmine Mask +1",priority=12}, --14%
	--neck="Orunmila's Torque", --5%
	neck="Baetyl Pendant", --4%
	body={name="Reverence Surcoat +3",priority=15}, --10%
	--hands="Leyline Gloves", --5%
	left_ring="Kishar ring", --4%
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Phys. dmg. taken-10%',},priority=13},
	--legs="Enif Cosciales", --8%
	legs={name="Arjuna Breeches",priority=11}, --4%
	feet={name="Carmine Greaves +1",priority=14} --8%
	}
	
	sets.fc.cure = set_combine(sets.fc.base, {
	--right_ear="Nourishing Earring +1", --4
	})
	
	sets.fc.healing = set_combine(sets.fc.base, {})
	
	sets.fc["Enhancing Magic"] = set_combine(sets.fc.base, {
	waist="Siegel Sash",
	})
	
	sets.buff["Reprisal"] = {
	sub={name="Srivatsa",priority=8}, --150
	--ammo="Egoist's Tathlum",
	head={name="Souveran Schaller +1",priority=15}, --280
	neck={name="Unmoving Collar +1",priority=11}, --200
	left_ear={name="Tuisto Earring",priority=9}, --150
	right_ear={name="Odnowa Earring +1",priority=6}, --110
	body={name="Reverence Surcoat +3",priority=14}, --254
	--hands="Regal Gauntlets",
	hands={name="Souveran Handschuhs +1",priority=13}, --239
	left_ring={name="Gelatinous Ring +1",priority=7}, --110
	right_ring={name="Moonlight Ring",priority=5}, --110
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',},priority=4}, --80
	--waist="Gold Moogle Belt",
	waist="Creed Baudrier", --40
	legs={name="Souveran diechlings +1",priority=10}, --162
	feet={name="Souveran schuhs +1",priority=12}, --227
	}
	
	sets.buff["Phalanx"] = { --24
	head={ name="Valorous Mask", augments={'"Conserve MP"+3','"Mag.Atk.Bns."+23','Phalanx +5',},priority=10}, --5
	neck="Incanter's Torque",
	body="Valorous Mail", --1
	hands={name="Souveran Handschuhs +1",priority=15}, --5
	back="Weard Mantle", --4
	legs={name="Sakpata's Cuisses",priority=13}, --5
	feet={name="Souveran schuhs +1",priority=14}, --5
	}
	
	sets.phalanx2 = set_combine(sets.buff["Phalanx"], { --31
	main={name="Sakpata's Sword",priority=12}, --5
	sub={name="Priwen",priority=11}, --2
	})
	
	sets.enmity = {
	ammo="Sapience Orb", --2
	head={name="Loess Barbuta +1",priority=12}, --9~14
	neck="Moonlight Necklace", --15
	right_ear="Cryptic Earring", --4
	body={name="Souveran cuirass +1",priority=14}, --20
	hands={name="Souveran Handschuhs +1",priority=15}, --9
	left_ring="Petrov Ring", --4
	right_ring="Apeile Ring +1", --5
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',},priority=11},
	waist={name="Creed Baudrier",priority=10}, --5
	legs={name="Souveran Diechlings +1",priority=13}, --9
	feet={name="Chevalier's Sabatons +1",priority=9} --11
	}
	
	sets.sird = set_combine(sets.enmity, {
	ammo="Staunch Tathlum +1", --11
	head={name="Souveran Schaller +1",priority=15}, --20
	neck="Moonlight Necklace", --15
	waist="Audumbla Sash", --10
	legs={name="Carmine Cuisses +1",priority=14}, --20
	feet="Odyssean Greaves" --20
	})
	
	sets.ja["Provoke"] = sets.enmity
	sets.ja["Invincible"] = {legs="Caballarius Breeches",}
	sets.ja["Holy Circle"] = {feet="Reverence Leggings"}
	sets.ja["Shield Bash"] = {right_ear="Knightly Earring",hands="Caballarius Gauntlets",--[[left_ring="Fenian Ring",]]}
	sets.ja["Weapon Bash"] = {right_ear="Knightly Earring",}
	sets.ja["Sentinel"] = set_combine(sets.enmity, {feet="Caballarius Leggings +3"})
	sets.ja["Cover"] = {--[[head="Reverence Coronet",]]}
	sets.ja["Rampart"] = set_combine(sets.enmity, {head="Caballarius Coronet",})
	sets.ja["Fealty"] = {body="Caballarius Surcoat",}
	sets.ja["Chivalry"] = {hands="Caballarius Gauntlets"}
	sets.ja["Divine Emblem"] = {feet="Chevalier's Sabatons +1"}
	
	sets.dt = {
	ammo={name="Staunch Tathlum +1",priority=1},
	head={name="Sakpata's Helm",priority=8},
	neck={name="Unmoving Collar +1",priority=15},
	left_ear={name="Tuisto Earring",priority=14},
	right_ear={name="Odnowa Earring +1",priority=9},
	body={name="Sakpata's Breastplate",priority=13},
	hands={name="Sakpata's Gauntlets",priority=7},
	left_ring={name="Gelatinous Ring +1",priority=11},
	right_ring={name="Moonlight Ring",priority=10},
	back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',},priority=6},
	waist="Asklepian Belt",
	--waist={name="Creed Baudrier",priority=4},
	legs={name="Sakpata's Cuisses",priority=12},
	feet={name="Sakpata's Leggings",priority=5}
	}
	
	sets.EnhancingDuration = {
	--sub="Ajax +1",
	--body="Shabti cuirass +1",
	--hands="Regal Gauntlets",
	}
	
	sets.divine = {
	neck="Incanter's Torque",
	body={name="Reverence Surcoat +3",priority=15},
	left_ring="Stikini Ring +1",
	waist="Asklepian Belt",
	}
	
	sets.sword.index = {'Malignance Sword','Naegling'}
	sword_ind = 1 --Malignance Sword is the Default
	
	sets.sword['Malignance Sword'] = {main="Malignance Sword"}
	sets.sword['Naegling'] = {main="Naegling"}
	
	sets.shield.index = {'Srivatsa'--[[,'Aegis','Ochain']]}
	shield_ind = 1 --Srivatsa is the Default
	
	sets.shield['Srivatsa'] = {sub="Srivatsa"}
	--sets.shield['Aegis'] = {sub="Aegis"}
	--sets.shield['Ochain'] = {sub="Ochain"}
	
	sets.reequip = set_combine(sets.dt, sets.sword['Malignance Sword'], sets.shield['Srivatsa'], {})
	
	sets.ws.common = {
	ammo="Coiste Bodhar",
	head={ name="Valorous Mask", augments={'Attack+8','Sklchn.dmg.+1%','Weapon skill damage +7%',}},
	neck="Fotia Gorget",
	right_ear="Thrud Earring",
	body="Sakpata Breastplate",
	hands="Sakpata Gauntlets",
	left_ring="Regal Ring",
	right_ring="Epaminondas's Ring",
	waist="Fotia Belt",
	legs="Sakpata Cuisses",
	feet="Sulevia's Leggings +2"
	}
	
	sets.ws["Savage Blade"] = set_combine(sets.ws.common, {
	})
end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local ja_recasts = windower.ffxi.get_ability_recasts()
	if buffactive['Stun'] or buffactive['Petrify'] or buffactive['Terror'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) --[[or (spell_recasts[spell.recast_id] > 0) or (spell.type == "JobAbility" and ja_recasts[spell.recast_id] > 0)]] then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
	elseif string.find(spell.english,'Jump') then
		equip({hands="Crusher's Gauntlets"})
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
		elseif player.tp > 1000 then
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				equip(sets.ws.common)
			end
			if (player.tp >= 1000 and player.tp < 3000) then
				equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
			elseif world.time >= (17*60) or world.time <= (7*60) then
				equip({left_ear="Lugra Earring +1"})
			else
				equip({left_ear="Ishvara Earring"})
			end
		end
	elseif spell.action_type == 'Magic' then
		if spell.skill == 'Healing Magic' then
			if string.find(spell.english,'Cure') then
				equip(sets.fc.cure)
			end
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.fc["Enhancing Magic"])
		else
			equip(sets.fc.base)
		end
	end
	return
end

function midcast(spell)
	if sets.buff[spell.english] then
		equip(sets.buff[spell.english])
		if spell.name == "Phalanx" and player.tp < 750 then
			equip(sets.phalanx2)
		end
	elseif spell.action_type == 'Magic' and not spell.type:contains('Trust') then
		if SIRDspells:contains(spell.name) then
			equip(sets.sird)
		elseif spell.skill == 'Enhancing Magic' then
			equip(sets.EnhancingDuration)
		elseif string.find(spell.english,'Enlight') then
			equip(sets.divine)
		else
			equip(sets.enmity)
		end
	end
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.english:contains('Utsusemi') then
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
	equip(sets.dt,sets.shield[sets.shield.index[shield_ind]],sets.sword[sets.sword.index[sword_ind]])
	if player.mpp <= 35 then
		equip({ammo="Homiliary",waist="Fucho-no-obi",})
	end
end

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"doom"}:contains(name) then
		if gain then
			send_command('@input /p Cursna - Doomed')
		end
	end
end

send_command('bind !q gs equip dt') -- Hit alt+q, toggles the sets
send_command('bind !w gs equip movement') -- Hit alt+w, toggles the sets
send_command('wait 5;input /lockstyle on')
send_command('bind !a gs equip sets.reequip;wait 1; input /lockstyle on')
send_command('bind !` gs c toggle shield set') -- Hit alt+`, toggles the sets
send_command('bind ^` gs c toggle sword set') -- Hit ctrl+`, toggles the sets

function file_unload()
    send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !a')
	send_command('unbind !`')
	send_command('unbind ^`')
end

function self_command(command)
	if command == 'toggle sword set' then
		sword_ind = sword_ind +1
		if sword_ind > #sets.sword.index then sword_ind = 1 end
		windower.add_to_chat(1,'<----- Sword Set changed to '..sets.sword.index[sword_ind]..' ----->')
		equip(sets.sword[sets.sword.index[sword_ind]])
	end
	if command == 'toggle shield set' then
		shield_ind = shield_ind +1
		if shield_ind > #sets.shield.index then shield_ind = 1 end
		windower.add_to_chat(1,'<----- Shield Set changed to '..sets.shield.index[shield_ind]..' ----->')
		equip(sets.shield[sets.shield.index[shield_ind]])
	end
end

function set_macros(sheet,book)
    if book then
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
	add_to_chat (55, 'You are on '..('Paladin'):color(5)..('. '):color(55)..''..('Macros set!'):color(121))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

--Page, Book--
set_macros(1,4)
--Use the Lockstyle Number--
--set_style(001)