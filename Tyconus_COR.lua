--Melee/Range mode doesn't work.

res = require 'resources'

elemental_ws = S{"Aeolian Edge","Leaden Salute","Wildfire"}
no_shoot_ammo = S{}

function get_sets()
	sets.precast = {}
	sets.midcast = {}
	sets.ja = {}
	sets.ws = {}
	bullet = {}
	sets.TP = {}
	sets.attack = {}
	sets.fc = {}
	
	sets.fc.base = {
	head="Carmine Mask +1",
	neck="Baetyl Pendant",
	left_ear="Etiolation Earring",
	right_ear="Loquacious Earring",
	body="Taeon Tabard",
	hands="Leyline Gloves",
	left_ring="Kishar Ring",
	right_ring="Lebeche Ring",
	feet="Carmine Greaves +1"
	}
	
	sets.fc.utsusemi = set_combine(sets.fc.base, {
	neck="Magoraga Beads",
	})
	
	sets.movement = {legs="Carmine Cuisses +1"}
	
	bullet.shooty = {ammo="Chrono Bullet"}
	bullet.MA = {ammo="Chrono Bullet"}
	--bullet.MA = {ammo="Living Bullet"}
	bullet.PA = {ammo="Chrono Bullet"}
	
	sets.TP.index = {'Standard','HighAcc','DT'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
	neck="Iskur gorget",
	right_ear="Dedition Earring",
	body="Mummu Jacket +2",
	hands="Adhemar Wristbands +1",
	left_ring="Regal Ring",
	right_ring="Petrov Ring",
	back="Mecistopins Mantle",
	--legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
	legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
	feet="Mummu Gamashes +2",
	}
	
	sets.TP['HighAcc'] = {
	head="Mummu Bonnet +2",
	neck="Combatant's Torque",
	right_ear="Brutal Earring",
	body="Malignance Tabard",
	hands="Adhemar Wristbands +1",
	left_ring="Cacoethic Ring",
	right_ring="Cacoethic Ring +1",
	--back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	legs="Meg. Chausses +2",
	feet="Mummu Gamash. +2"
	}
	
	sets.TP['DT'] = {
	head="Nyame Helm",
	neck="Loricate Torque +1",
	--left_ear="Genmei Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending Ring",
	--back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	legs="Malignance Tights",
	feet="Nyame Sollerets"
	}
	
	sets.attack.index = {'Range','Melee'}
	attack_ind = 1 --Ranged mode is the Default
	
	--Snapshot > Rapid Shot
	sets.precast.RA = {
	--head="Chass. tricorne +1",
	--neck={ name="Comm. Charm +1", augments={'Path: A',}},
	left_ear="Telos Earring",
	right_ear="Enervating Earring",
	--body="Laksa. Frac +3",
	--hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
	left_ring="Ilabrat Ring",
	right_ring="Cacoethic Ring +1",
	--back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Weapon skill damage +10%',}},
	waist="Eschan Stone",
	--legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
	feet="Meghanada Jambeaux +2"
	}
	
	--r.acc/stp/crit/agi/recycle
	sets.midcast.RA = {
	head="Meghanada Visor +2",
	neck="Iskur gorget",
	left_ear="Telos Earring",
	right_ear="Enervating Earring",
	--body="Laksa. Frac +3",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Regal Ring",
	right_ring="Cacoethic Ring +1",
	--back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Weapon skill damage +10%',}},
	waist="Eschan Stone",
	legs="Malignance Tights",
	feet="Meghanada Jambeaux +2"
	}
	
	sets.midcast['Triple Shot'] = set_combine(sets.midcast.RA, {})
	
	sets.ja.CorsairRoll = {
	--head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}},
	neck="Regal necklace",
	--right_ear="Etiolation Earring",
	--right_ear="Genmei Earring",
	--body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	--hands="Chasseur's Gants +1",
	left_ring="Luzaf's Ring",
	--right_ring="Defending Ring",
	--back="Camulus's Mantle",
	--legs="Mummu Kecks +2",
	--feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}}
	}
	
	--sets.ja["Caster's Roll"] = set_combine(sets.ja.CorsairRoll, {legs="Chas. Culottes +1"})
	--sets.ja["Courser's Roll"] = set_combine(sets.ja.CorsairRoll, {feet="Chass. Bottes +1"})
	--sets.ja["Blitzer's Roll"] = set_combine(sets.ja.CorsairRoll, {head="Chass. Tricorne +1"})
	--sets.ja["Tactician's Roll"] = set_combine(sets.ja.CorsairRoll, {body="Chasseur's Frac +1"})
	--sets.ja["Allies' Roll"] = set_combine(sets.ja.CorsairRoll, {hands="Chasseur's Gants +1"})
	
	--sets.ja["Wild Card"] = {feet="Lanun Bottes +3"}
	sets.ja["Double-Up"] = sets.ja.CorsairRoll
	--sets.ja["Random Deal"] = {body="Lanun Frac +3"}
	--sets.ja["Snake Eye"] = {legs="Lanun Trews"}
	--sets.ja["Fold"] = {--[[hands="Lanun Gants"]]}
	sets.ja.waltz = {body="Passion Jacket",}
	
	sets.ja["Quick Draw"] = {
	--head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+30','Mag. Acc.+23','Damage taken-2%','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
	--neck={ name="Comm. Charm +1", augments={'Path: A',}},
	left_ear="Friomisi Earring",
	--right_ear="Novio Earring",
	--body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	--hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
	--left_ring="Regal Ring",
	--right_ring="Dingir Ring",
	--back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	waist="Eschan Stone",
	--legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','"Store TP"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
	--feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}}
	--feet="Chass. Bottes +1"
	}
	
	sets.midcast.quickmacc = {
	--head={ name="Lanun Tricorne", augments={'Enhances "Winning Streak" effect',}},
	--neck={ name="Comm. Charm +1", augments={'Path: A',}},
	left_ear="Telos Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Regal Ring",
	--right_ring="Mummu Ring",
	--back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	waist="Eschan Stone",
	legs="Malignance Tights",
	--feet="Malignance Boots",
	}
	
	sets.ws.common = {
	head="Nyame Helm",
	neck="Fotia Gorget",
	right_ear="",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Regal Ring",
	right_ring="Epaminondas's ring",
	--back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Damage taken-5%',}},
	waist="Fotia Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws["Last Stand"] = set_combine(sets.ws.common, {
	--body="Laksa. Frac +3",
	right_ring="Cacoethic Ring +1",
	waist="Eschan Stone",
	})
	
	sets.ws["Leaden Salute"] = set_combine(sets.ws.common, {
	head="Pixie Hairpin +1",
	--neck={ name="Comm. Charm +1", augments={'Path: A',}},
	right_ear="Friomisi Earring",
	--body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
	--hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
	--left_ring="Archon ring",
	--right_ring="Dingir Ring",
	--back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	--legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+24','"Store TP"+1','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
	})
	
	sets.ws["Wildfire"] = set_combine(sets.ws["Leaden Salute"], {
	--head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+30','Mag. Acc.+23','Damage taken-2%','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
	--right_ear="Hecate's Earring",
	waist="Eschan stone",
	})
	
	sets.ws["Savage Blade"] = set_combine(sets.ws.common, {
	waist="Grunfeld Rope",
	})
	
	sets.ws["Evisceration"] = {
	head="Adhemar Bonnet +1",
	neck="Fotia Gorget",
	right_ear="Odr Earring",
	body="Mummu Jacket +2",
	hands="Adhemar Wristbands +1",
	left_ring="Regal Ring",
	right_ring="Begrudging Ring",
	waist="Fotia Belt",
	legs="Samnuha Tights",
	feet="Mummu Gamashes +2"
	}
	
	sets.ws["Circle Blade"] = sets.ws["Savage Blade"]
	sets.ws["Aeolian Edge"] = sets.ws["Wildfire"]
	
	sets.low_hp = {
	head="Pixie Hairpin +1",
	body=empty,
	hands=empty,
	left_ring="Mephitas's Ring +1",
	right_ring="Metamorph Ring +1",
	legs=empty,
	feet=empty,
	}
	
	sets.high_hp = {
	head="Nyame Helm",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gelatinous Ring +1",
	right_ring="Ilabrat Ring",
	back="Reiki Cloak",
	waist="Eschan Stone",
	legs="Carmine Cuisses +1",
	feet="Carmine Greaves +1"
	}

end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	if buffactive['Stun'] or buffactive['Petrify'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) or buffactive[spell.name] then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
	elseif spell.type == 'CorsairRoll' then
		equip(sets.ja.CorsairRoll)
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
			if spell.skill == 'Marksmanship' then
				if no_shoot_ammo:contains(player.equipment.ammo) then
					cancel_spell()
				end
				if elemental_ws:contains(spell.name) then
					equip(bullet.MA)
				else
					equip(bullet.PA)
				end
				if spell.name ~= "Wildfire" then
					if player.equipment.range == "Fomalhaut" then
						if player.tp >= 1000 and player.tp < 2500 then
							equip({left_ear="Moonshade Earring",})
						else
							equip({left_ear="",})
						end
					else
						if player.tp >= 1000 and player.tp < 3000 then
							equip({left_ear="Moonshade Earring",})
						else
							equip({left_ear="",})
						end
					end
				end
			else
				if player.equipment.range == "Anarchy +2" then
					if player.tp >= 1000 and player.tp < 2000 then
						equip({left_ear="Moonshade Earring",})
					else
						equip({left_ear="",})
					end
				else
					if player.tp >= 1000 and player.tp < 3000 then
						equip({left_ear="Moonshade Earring",})
					else
						equip({left_ear="",})
					end
				end
			end
			if elemental_ws:contains(spell.name) then
				weathercheck(spell.element,sets.ws[spell.name],bullet.MA)
			elseif sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				equip(sets.ws.common)
			end
		end
	elseif spell.action_type == 'Ranged Attack' then
		if player.equipment.ammo == 'empty' then
			equip(bullet.shooty)
		end
		equip(bullet.shooty)
		if no_shoot_ammo:contains(player.equipment.ammo) then
			cancel_spell()
		end
		equip(sets.precast.RA)
	elseif spell.action_type == 'Magic' then
		if spell.name:contains('Utsusemi:') then
			equip(sets.fc.utsusemi)
		else 
			equip(sets.fc.base)
		end
	end
end

function midcast(spell)
	if spell.type == 'CorsairShot' then
		if spell.name == 'Light Shot' or spell.name == 'Dark Shot' then
			equip(sets.midcast.quickmacc)
		else
			weathercheck(spell.element,sets.ja["Quick Draw"])
		end
	elseif spell.action_type == 'Ranged Attack' then
		if buffactive['Triple Shot'] then
			equip(sets.midcast['Triple Shot'])
		else
			equip(sets.midcast.RA)
		end
	end
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.english:contains('Utsusemi') then
		if buffactive["Copy Image"] then
			windower.send_command('wait 1;cancel 66;')
		elseif buffactive['Copy Image (2)'] then
			windower.send_command('wait 1;cancel 444')
		end
	end
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' then
			equip({left_ear="Telos Earring",waist="Grunfeld Rope"})
		else
			equip({left_ear="Suppanomimi",waist="Reiki Yotai"})
		end
	elseif player.status == 'Idle' then
		equip(sets.TP[sets.TP.index[TP_ind]],sets.movement)
	end
end

function status_change(new,old)
	if new == 'Idle' then
		equip(sets.TP[sets.TP.index[TP_ind]],sets.movement)
	elseif new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' then
			equip({left_ear="Telos Earring",waist="Grunfeld Rope"})
		else
			equip({left_ear="Suppanomimi",waist="Reiki Yotai"})
		end
	end
end

function weathercheck(spell_element,set)
    if not set then
		return
	end
    if spell_element == world.weather_element or spell_element == world.day_element then
		equip(set,{waist="Hachirin-no-Obi"})
    else
		equip(set)
    end
    if set[spell_element] then
		equip(set[spell_element])
	end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !w gs equip movement') -- Hit alt+w, toggles the sets
send_command('bind !` gs c toggle attack set') -- Hit alt+`, toggles the sets
send_command('alias 500hp gs equip low_hp;wait 1; gs equip high_hp')
send_command('alias food input /item "Grape Daifuku" <me>')
send_command('alias bolt input /ja "Bolter\'s roll" <me>')

function file_unload()
	send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !`')
	send_command('lua u Skillchains')
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' then
			equip({left_ear="Telos Earring",waist="Grunfeld Rope"})
		else
			equip({left_ear="Suppanomimi",waist="Reiki Yotai"})
		end
	end
	if command == 'toggle attack set' then
		attack_ind = attack_ind +1
		if attack_ind > #sets.attack.index then attack_ind = 1 end
		windower.add_to_chat(1,'<----- Attack mode changed to '..sets.attack.index[attack_ind]..' ----->')
	end
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
	add_to_chat (55, 'You are on '..('Samurai'):color(5)..('. '):color(55)..''..('Macros set!'):color(121))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end
 
--Page, Book--
set_macros(1,6)
--Use the Lockstyle Number--
set_style(002)