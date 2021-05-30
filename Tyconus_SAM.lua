res = require 'resources'

--Fudo > Kasha > Rana > Shoha

function get_sets()
	sets.fc = {}
	sets.precast = {}
	sets.midcast = {}
	sets.aftercast = {}
	sets.ja = {}
	sets.ws = {}
	sets.Obis = {}
	sets.buff = {}
	sets.misc = {}
	sets.TP = {}
	sets.WEAPON = {}
	
	sets.movement = {feet="Danzo Sune-Ate"}
	
	sets.fashion = {
	head=empty,
	body="Hizamaru Haramaki +2",
	hands="Hizamaru Kote +1",
	legs="Hizamaru Hizayoroi +2",
	feet="Hizamaru Sune-Ate +1"
	}
	
	sets.fc.base = {
	ammo="Sapience Orb",
	left_ear="Etiolation Earring",
	hands="Leyline Gloves",
	legs="Arjuna Breeches",
	}
	
	sets.ja['Meditate'] = {
	head="Wakido Kabuto +3",
	hands="Sakonji Kote +2",
	back="Smertrios's Mantle"
	}
	sets.ja['Sengikori'] = {feet="Kasuga Sune-Ate +1"}
	sets.ja['Warding Circle'] = {head="Wakido Kabuto +3"}
	
	sets.TP.index = {'Standard','DT'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	ammo="Coiste Bodhar",
	head="Flamma Zucchetto +2",
	neck="Samurai's Nodowa +2",
	left_ear="Dedition Earring",
	right_ear="Schere Earring",
	body="Tatenashi Haramaki +1",
	hands="Tatenashi Gote +1",
	--hands="Wakido Kote +3",
	left_ring="Niqmaddu Ring",
	right_ring="Hetairoi Ring",
	back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Ioskeha Belt +1",
	legs="Kendatsuba Hakama +1",
	feet="Flamma Gambieras +2"
	}
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], { --51%
	ammo="Staunch Tathlum +1", --2%
	head="Loess barbuta +1", --20%
	neck="Loricate Torque +1", --5%
	body="Wakido Domaru +3", --8%
	right_ring="Defending Ring", --10%
	back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}, --5%
	})
	
	sets.idle = set_combine(sets.TP['Standard'], {
	left_ring="Warp Ring",
	feet="Danzo Sune-ate"
	})
	
	sets.regen = {
	--head="Rao Kabuto +1",
	neck="Sanctity Necklace",
	--neck="Bathy Choker +1",
	right_ear="Infused Earring",
	body="Hizamaru Haramaki +2",
	--hands="Rao Kote +1",
	--left_ring="Chirich Ring +1",
	right_ring="Paguroidea Ring",
	--legs="Rao Haidate +1",
	--feet="Rao Sune-Ate +1",
	}
	
	sets.ws.common = {
	ammo="Knobkierrie",
	--head={ name="Valorous Mask", augments={'Attack+8','Sklchn.dmg.+1%','Weapon skill damage +7%',}},
	head="Mpaca's Cap",
	neck="Samurai's Nodowa +2",
	right_ear="Thrud Earring",
	body="Sakonji Domaru +3",
	hands={ name="Valorous Mitts", augments={'Mag. Acc.+9','Weapon skill damage +3%','STR+6','Accuracy+9','Attack+10',}},
	right_ring="Epaminondas's Ring",
	back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Fotia Belt",
	legs="Wakido Haidate +3",
	feet={ name="Valorous Greaves", augments={'"Dbl.Atk."+1','STR+9','Weapon skill damage +4%','Accuracy+12 Attack+12','Mag. Acc.+8 "Mag.Atk.Bns."+8',}},
	}
	
	sets.ws['Tachi: Ageha'] = set_combine(sets.ws.common, {
	ammo="Hydrocera",
	head="Flamma Zucchetto +2",
	neck="Sanctity Necklace",
	right_ear="Dignitary's earring",
	body="Flamma Korazin +2",
	hands="Flamma Manopolas +2",
	left_ring="Flamma Ring",
	right_ring="Stikini Ring +1",
	waist="Eschan Stone",
	legs="Flamma Dirs +2",
	feet="Flamma Gambieras +2"
	})
	
	sets.ws['Tachi: Yukikaze'] = sets.ws['Tachi: Ageha']
	
	sets.ws['Tachi: Jinpu'] = set_combine(sets.ws.common, {
	neck="Fotia Gorget",
	right_ear="Friomisi Earring",
	--body="Sacro Breastplate",
	hands="Founder's Gauntlets",
	--waist="Orpheus's Sash",
	feet="Founder's Greaves"
	})
	
	sets.ws['Impulse Drive'] = set_combine(sets.ws.common, {
	head="Flamma Zucchetto +2",
	right_ear="Schere Earring",
	hands="Tatenashi Gote +1",
	feet="Flamma Gambieras +2"
	})
	
	sets.ja['Provoke'] = {--set_combine(sets.enmity, {
	ammo="Sapience Orb",
	head="Loess Barbuta +1",
	neck="Unmoving Collar +1",
	left_ear="Cryptic Earring",
	right_ear="Friomisi Earring",
	left_ring="Petrov Ring",
	back="Reiki Cloak",
	waist="Chaac Belt",
	}--)
	
	sets.weapon = set_combine(sets.TP['Standard'], {
	main={ name="Masamune", priority=2,},
	sub={ name="Utu Grip", priority=1,}
	})
	
	sets.WEAPON.index = {'Slashing','Piercing',--[['Blunt']]}
	WEAPON_ind = 1 --GK set is the Default
	
	sets.WEAPON['Slashing'] = {
	main="Masamune",
	sub="Utu Grip",
	}
	
	sets.WEAPON['Piercing'] = {
	main="Shining One",
	--main="Quint Spear",
	sub="Utu Grip",
	}
	
	sets.WEAPON['Blunt'] = {
	main="Mafic Cudgel",
	sub=empty,
	}
	
	sets.low_hp = {
	head=empty,
	body=empty,
	hands=empty,
	left_ring="Mephitas's Ring +1",
	right_ring="Metamorph Ring",
	legs=empty,
	feet=empty
	}
	
	sets.high_hp = {
	head="Loess Barbuta +1",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Flamma Korazin +2",
	hands="Flamma Manopolas +2",
	left_ring="Gelatinous Ring +1",
	right_ring="Ilabrat Ring",
	back="Reiki Cloak",
	waist="Carrier's Sash",
	legs="Kendatsuba Hakama +1",
	feet="Amm Greaves"
	}
	
	sets.tpgain = {
	head={ name="Valorous Mask", augments={'Attack+8','Sklchn.dmg.+1%','Weapon skill damage +7%',}},
	neck="Vim Torque +1",
	}
	
	sets.phalanx = {
	head={ name="Valorous Mask", augments={'"Conserve MP"+3','"Mag.Atk.Bns."+23','Phalanx +5',}},
	}
	
	sets.ranged = {
	head="Hizamaru Somen +2", --No ranged accuracy/attack.
	neck="Combatant's Torque",
	left_ear="Telos Earring",
	right_ear="Terminus Earring",
	--right_ear="Enervating Earring",
	body="Wakido Domaru +3",
	hands="Kasuga Kote +1",
	left_ring="Regal Ring",
	right_ring="Cacoethic Ring +1",
	waist="Eschan Stone",
	legs="Kendatsuba Hakama +1",
	feet="Tatenashi Sune-Ate +1",
	}
end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

--function hand_check(spell)
--	if (spell.name == 'Seigan' and buffactive['Hasso']) or buffactive['Seigan'] then
--		equip({hands="Tatenashi Gote +1"})
--	elseif spell.name == 'Hasso' or buffactive['Hasso'] then
--		equip({hands="Wakido Kote +3"})
--	end
--end

function precast(spell)
	if buffactive['Stun'] or buffactive['Petrify'] or buffactive['Terror'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
	elseif string.find(spell.english,'Jump') then
		equip({hands="Crusher's Gauntlets", feet="Maenadic gambieras"})
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
			if player.equipment.main == "Dojikiri Yasutsuna" then
				if (player.tp >= 1000 and player.tp < 2300) or buffactive['Sekkanoki'] then
				--if (player.tp >= 1000 and player.tp < 2500) or buffactive['Sekkanoki'] then
					equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
				elseif world.time >= (17*60) or world.time <= (7*60) then
					equip({left_ear="Lugra Earring +1"})
				else
					equip({left_ear="Ishvara Earring"})
				end
			else
				--if (player.tp >= 1000 and player.tp < 3000) or buffactive['Sekkanoki'] then
				if (player.tp >= 1000 and player.tp < 2800) or buffactive['Sekkanoki'] then
					equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
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
			if buffactive['Meikyo Shisui'] and player.tp >= 1750 then
				equip({feet="Sakonji sune-ate +3"})
			elseif buffactive['Sekkanoki'] then
				equip({hands="Kasuga Kote +1"})
			end
		end
	--elseif spell.action_type == 'Ranged Attack' and player.equipment.range ~= 'empty' then
	--	equip(sets.ranged)
	end
end

function midcast(spell)
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.english:contains('Utsusemi') then
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
	if new == 'Engaged' and player.equipment.main == "Soboro Sukehiro" then
		disable('ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet')
	elseif player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
		--hand_check()
		if (spell.name == 'Seigan' and buffactive['Hasso']) or buffactive['Seigan'] then
			equip({hands="Tatenashi Gote +1"})
		elseif spell.name == 'Hasso' or buffactive['Hasso'] then
			equip({hands="Wakido Kote +3"})
		end
	elseif (new == 'Idle' and player.equipment.main ~= "Soboro Sukehiro") or player.status == "Idle" then
		enable('ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet')
		equip(sets.idle)
		if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
			equip(sets.TP['DT'],sets.movement)
		end
		--hand_check()
		if (spell.name == 'Seigan' and buffactive['Hasso']) or buffactive['Seigan'] then
			equip({hands="Tatenashi Gote +1"})
		elseif spell.name == 'Hasso' or buffactive['Hasso'] then
			equip({hands="Wakido Kote +3"})
		end
	end
end

function status_change(new,old)
	if (new == 'Idle' and player.equipment.main ~= "Soboro Sukehiro") or player.status == "Idle" then
		enable('ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet')
		equip(sets.idle)
		if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
			equip(sets.TP['DT'],sets.movement)
		end
		--hand_check()
	elseif new == 'Engaged' and player.equipment.main == "Soboro Sukehiro" then
		equip(sets.TP['Standard'])
		disable('ammo','head','neck','left_ear','right_ear','body','hands','left_ring','right_ring','back','waist','legs','feet')
	elseif new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
		--hand_check()
		if buffactive['Hasso'] then
			equip({hands="Wakido Kote +3"})
		elseif buffactive['Seigan'] then
			equip({hands="Tatenashi Gote +1"})
		end
	end
end

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"hasso"}:contains(name) then
		if gain then
		else
			if player.status == "Engaged" and not buffactive['Seigan'] then
				send_command('@input /ja "Hasso" <me>')
			end
		end
	elseif S{"seigan"}:contains(name) then
		if gain then
		else
			if player.status == "Engaged" and not buffactive['Hasso'] then
				send_command('@input /ja "Seigan" <me>')
			end
		end
	elseif S{"doom"}:contains(name) then
		if gain then
			send_command('@input /p Cursna - Doomed')
		end
	end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !w gs equip sets.movement')
send_command('bind !s gs c toggle WEAPON set') -- Hit alt+s, toggles the sets
send_command('bind !r gs equip sets.regen') -- Hit alt+r, toggles the sets
send_command('bind !a gs equip sets.weapon') -- Hit alt+a
--send_command('wait 5;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip idle')
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')
send_command('bind !p gs equip sets.tpgain')

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive['Seigan'] then
			equip({hands="Tatenashi Gote +1"})
		elseif buffactive['Hasso'] then
			equip({hands="Wakido Kote +3"})
		end
		if player.status == 'Idle' then
			equip(sets.movement)
		end
		--hand_check()
	end
	if command == 'toggle WEAPON set' then
		WEAPON_ind = WEAPON_ind +1
		if WEAPON_ind > #sets.WEAPON.index then WEAPON_ind = 1 end
		equip(sets.WEAPON[sets.WEAPON.index[WEAPON_ind]])
		if WEAPON_ind == 1 then
			send_command('alias fudo @input /ws "Tachi: Fudo" <t>')
			send_command('alias jinpu @input /ws "Tachi: Jinpu" <t>')
		elseif WEAPON_ind == 2 then
			send_command('alias fudo @input /ws "Impulse Drive" <t>')
			send_command('alias jinpu @input /ws "Sonic Thrust" <t>')
		elseif WEAPON_ind == 3 then
			send_command('alias fudo @input /ws "Judgment" <t>')
			send_command('alias jinpu @input /ws "True Strike" <t>')
		end
	end
end

function file_unload()
    send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !e')
	send_command('unbind !r')
	send_command('unbind !a')
	send_command('unbind !s')
	send_command('unbind !p')
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
set_macros(1,3)
--Use the Lockstyle Number--
set_style(002)