EnfeeblingMax = S{"Frazzle","Frazzle II","Distract","Distract II","Poison","Poisonga","Dispel","Break","Silence",}
EnfeeblingPot = S{"Frazzle III","Distract III","Poison II",}
EnfeeblingDur = S{"Sleep","Sleep II","Sleepga","Gravity","Gravity II","Bind",}
EnfeeblingMND = S{"Paralyze","Paralyze II","Slow","Slow II","Addle","Addle II",}
EnfeeblingINT = S{"Blind","Blind II",}
BarElements = S{"Barfire","Barfira","Barblizzard","Barblizzara","Baraero","Baraera","Barstone","Barstonra","Barthunder","Barthundra","Barwater","Barwatera"}
BarAilments = S{"Barsleep","Barsleepra","Barpoison","Barpoisonra","Barparalyze","Barparalyzra","Barblind","Barblindra","Barsilence","Barsilencera","Barpetrify","Barpetra","Barvirus","Barvira","Baramnesia","Baramnesra"}
GainSpells = S{'Gain-STR','Gain-INT','Gain-AGI','Gain-VIT','Gain-DEX','Gain-MND','Gain-CHR'}
EnSpells = S{"Enfire","Enfire II","Enblizzard","Enblizzard II","Enaero","Enaero II","Enstone","Enstone II","Enthunder","Enthunder II","Enwater","Enwater II"}
NaSpells = S{"Blindna","Erase","Paralyna","Poisona","Silena","Stona","Viruna"}
res = require 'resources'

function get_sets()
	sets.fc = {}
	sets.midcast = {}
	sets.buff = {}
	sets.ja = {}
	sets.TP = {}
	sets.idle = {}
	sets.ws = {}
	
	--List of weapons for off-hand to lock for melee duel wield.--
	SubWeapon = S{'Demersal Degen +1','Tauret','Ternion Dagger +1'}
	
	sets.fc.base = { --30(base)(8JP) +44
	--ammo="Impatiens", --2 qm
	head="Carmine Mask +1", --14
	neck="Baetyl Pendant", --4
	left_ear="Loquacious Earring", --2
	right_ear="Etiolation Earring", --1
	--body="Vitiation Tabard +3", --15
	hands="Leyline Gloves", --5
	left_ring="Kishar Ring", --4
	right_ring="Lebeche Ring", --2 qm
	back="Perimede Cape", --4 qm
	--waist="Witful Belt", --3 qm
	legs="Ayanmo Cosciales +2", --6
	feet="Carmine Greaves +1" --8
	}
	
	sets.fc.cure = set_combine(sets.fc.base, {
	--legs="Doyen Pants", --15
	})
	
	sets.fc.stoneskin = set_combine(sets.fc.base, {
	--head="Umuthi Hat", --15
	--legs="Doyen Pants", --10
	})
	
	sets.fc.healing = set_combine(sets.fc.base, {
	})
	
	sets.fc.utsusemi = set_combine(sets.fc.base, {
	--neck="Magoraga Bead Necklace", --10
	})
	
	sets.midcast.conservemp = {
	head="Vanya Hood", --6
	right_ear="Gifted Earring", --3
	body="Vedic Coat", --10
	hands="Shrieker's Cuffs", --7
	left_ring="Mephitas's Ring +1", --15
	back="Solemnity Cape", --5
	--waist="Shinjutsu-no-obi +1",
	waist="Austerity Belt +1", --9
	legs="Vanya Slops", --12
	feet="Carmine Greaves +1" --8
	}
	
	sets.midcast.cure = set_combine(sets.midcast.conservemp, { --I+45  II+5
	ammo="Regal Gem",
	head="Vanya Hood", --10
	neck="Nodens Gorget", --5
	hands="Kaykaus Cuffs +1", --10
	leftt_ring="Menelaus's Ring", --5
	right_ring="Janniston Ring", --II+5
	back="Solemnity Cape", --7
	legs="Atrophy Tights +2", --11
	legs="Chironic Hose", --8
	})
	
	sets.midcast.cursna = set_combine(sets.midcast.conservemp, {
	neck="Debilis Medallion",
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",
	legs="Carmine Cuisses +1",
	})
	
	sets.midcast.elemental = set_combine(sets.midcast.conservemp, {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Ghastly Tathlum +1",
	neck="Baetyl Pendant",
	left_ear="Regal Earring",
	right_ear="Friomisi Earring",
	body="Cohort Cloak +1",
	hands="Jhakri Cuffs +2",
	left_ring="Stikini Ring +1",
	--left_ring="Metamorph Ring +1",
	right_ring="Freke Ring",
	back="Aurist's Cape +1",
	waist="Refoccilation Stone",
	legs="Jhakri Slops +2",
	feet="Jhakri Pigaches +2"
	})
	
	sets.midcast.raise = set_combine(sets.midcast.conservemp, { --30(base)(8JP) +51  +21 haste
	sub="Chanter's Shield", --3
	head="Carmine Mask +1", --14 --8
	neck="Baetyl Pendant", --4
	left_ear="Loquacious Earring", --2
	left_ring="Kishar Ring", --4
	right_ring="Lebeche Ring", --2 qm
	legs="Ayanmo Cosciales +2", --6 --9
	feet="Carmine Greaves +1" --8 --4
	})
	
	sets.midcast.Enfeebling = {
	--head="Vitiation Chapeau +3",
	--neck="Duelist's Torque +2",
	right_ear="Snotra Earring",
	left_ring="Stikini Ring +1",
	--feet="Vitiation Boots +3",
	}
	
	sets.midcast.maxenfacc = set_combine(sets.midcast.Enfeebling, {
	main="Naegling",
	sub="Ammurapi Shield",
	--range="Ullr",
	left_ear="Regal Earring",
	body="Atrophy Tabard +2",
	hands="Kaykaus Cuffs +1",
	--right_ring="Metamorph Ring +1",
	back="Aurist's Cape +1",
	--waist="Acuity Belt +1",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	})
	
	sets.midcast.fradispot = set_combine(sets.midcast.Enfeebling, {
	--main={ name="Contemplator +1", priority=2,},
	--sub={ name="Mephitis Grip", priority=1,},
	ammo="Regal Gem",
	left_ear="Vor Earring",
	body="Lethargy Sayon +1",
	hands="Lethargy Gantherots +1",
	--right_ring="Stikini Ring +1",
	waist="Rumination Sash",
	--back="Sucellos's Cape", --MND+20, M.acc+30, M.dmg+20
	--legs="Psycloth Lappas",  --Path D
	})
	
	sets.midcast.enfeebleMND = set_combine(sets.midcast.Enfeebling, {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Regal Gem",
	left_ear="Regal Earring",
	body="Lethargy Sayon +1",
	hands="Kaykaus Cuffs +1",
	--right_ring="Metamorph Ring +1",
	--back="Sucellos's Cape", --MND+20, M.acc+30, M.dmg+20
	waist="Luminary Sash",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	})
	
	sets.midcast.enfeebleINT = set_combine(sets.midcast.enfeebleMND, {})
	
	sets.midcast.enfduration = set_combine(sets.midcast.Enfeebling, {
	ammo="Regal Gem",
	left_ear="Regal Earring",
	body="Atrophy Tabard +2",
	hands="Lethargy Gantherots +1",
	--hands="Regal Cuffs",
	right_ring="Kishar Ring",
	--back="Sucellos's Cape", --MND+20, M.acc+30, M.dmg+20
	--waist="Obstinate Sash",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	})
	
	sets.midcast.dia = set_combine(sets.midcast.Enfeebling, {
	ammo="Regal Gem",
	head="Lethargy Chappel +1",
	body="Lethargy Sayon +1",
	hands="Lethargy Gantherots +1",
	--hands="Regal Cuffs",
	right_ring="Kishar Ring",
	--waist="Obstinate Sash",
	legs="Lethargy Fuseau +1",
	feet="Lethargy Houseaux +1"
	})
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.conservemp, {
	head="Befouled Crown",
	neck="Incanter's Torque",
	right_ear="Mimir Earring",
	left_ring="Stikini Ring +1",
	legs="Atrophy Tights +2",
	})
	
	sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
	--main="Colada",
	sub="Ammurapi Shield",
	--head="Telchine Cap",
	head="Lethargy Chappel +1",
	--neck="Duelist's Torque +2",
	body="Lethargy Sayon +1",
	hands="Atrophy Gloves +2",
	--back="Ghostfyre Cape",
	waist="Embla Sash",
	--legs="Telchine Braconi",
	legs="Lethargy Fuseau +1",
	feet="Lethargy Houseaux +1"
	})
	
	sets.midcast['Dark Magic'] = {
	--main="Rubicundity",
	sub="Ammurapi Shield",
	--range="Ullr",
	--head="Vitiation Chapeau +3",
	neck="Erra Pendant",
	left_ear="Regal Earring",
	--right_ear="Mani Earring",
	--body="Shango Robe",
	--hands="Regal Cuffs",
	left_ring="Stikini Ring +1",
	right_ring="Evanescence Ring",
	--waist=Acuity Belt +1",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	--feet="Vitiation Boots +3",
	}
	
	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
	--head="Pixie Hairpin +1",
	--left_ear="Malignance Earring",
	right_ear="Dignitary's Earring",
	--body="Merlinic Jubbah",
	--hands="Merlinic Dastanas",
	--left_ring="Archon Ring",
	back="Aurist's Cape +1",
	waist="Fucho-no-Obi",
	--legs="Merlinic Shalwar",
	--feet="Merlinic Crackows"
	})
	
	sets.midcast.bar_element = {}
	
	sets.midcast.regen = {}
	
	sets.buff.skulk = set_combine(sets.midcast.EnhancingDuration, {back = "Skulker's Cape"})
	
	sets.buff['Phalanx'] = set_combine(sets.midcast.EnhancingDuration, {
	})
	
	sets.buff.selfphalanx = set_combine(sets.buff['Phalanx'], {
	main="Sakpata's Sword",
	})
	
	sets.buff['Refresh III'] = set_combine(sets.midcast.EnhancingDuration, {
	--head="Amalric Coif +1",
	body="Atrophy Tabard +2",
	})
	
	sets.buff.selfrefresh = set_combine(sets.buff['Refresh'], {
	--waist="Gishdubar Sash",
	--feet="Inspirited Boots"(?)
	})
	
	sets.buff['Stoneskin'] = {
	neck="Nodens Gorget",
	left_ear="Earthcry earring",
	--hands="Stone Mufflers",
	waist="Siegel Sash",
	legs="Shedir Seraweels",
	}
	
	sets.buff['Aquaveil'] = {
	head="Chironic Hat",
	--head="Amalric Coif +1",
	--hands="Regal Cuffs",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	}
	
	sets.buff.enspell = {
	head="Umuthi Hat",
	hands="Ayanmo Manopolas +2",
	--back="Ghostfyre Cape",
	}
	
	sets.ja['Chainspell'] = {--[[body="Vitiation Tabard +3",]]}
	
	sets.TP.index = {'Standard'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	head="Ayanmo Zucchetto +2",
	neck="Anu Torque",
	left_ear="Dedition Earring",
	right_ear="Sherida Earring",
	body="Ayanmo Corazza +2",
	hands="Malignance Gloves",
	left_ring="Petrov Ring",
	right_ring="Hetairoi Ring",
	back="Relucent Cape",
	waist="Reiki Yotai",
	legs="Malignance Tights",
	feet="Ayanmo Gambieras +2",
	}
	
	sets.ws.common = {
	hands="Jhakri Cuffs +2",
	right_ring="Epaminondas's Ring",
	}
	
	sets.ws["Savage Blade"] = set_combine(sets.ws.common, {
	ammo="Regal Gem",
	--head="Vitiation Chapeau +3",
	--neck="Duelist's Torque +2",
	right_ear="Regal Earring",
	--body="Vitiation Tabard +3",
	hands="Atrophy Gloves +2",
	left_ring="Shukuyu Ring",
	--left_ring="Metamorph Ring +1",
	--left_ring="Rufescent Ring",
	waist="Sailfi Belt +1",
	legs="Jhakri Slops +2",
	feet="Jhakri Pigaches +2"
	})
	
	sets.ws["Sanguine Blade"] = set_combine(sets.ws.common, {
	--ammo="Ghastly Tathlum +1",
	--head="Pixie Hairpin +1",
	neck="Baetyl Pendant",
	--left_ear="Malignance Earring",
	right_ear="Regal Earring",
	--body="Amalric Doublet +1",
	--left_ring="Archon Ring",
	--legs="Amalric Slops +1",
	--feet="Amalric Nails +1"
	})
	
	sets.idle.index = {'Idle'}
	idle_ind = 1
	
	sets.idle['Idle'] = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Homiliary",
	head="Befouled Crown",
	neck="Loricate Torque +1",
	left_ear="Etiolation Earring",
	right_ear="Dominance Earring +1",
	body="Jhakri Robe +2",
	hands={ name="Chironic Gloves", augments={'"Conserve MP"+2','Mag. Acc.+21','"Refresh"+1','Accuracy+2 Attack+2',}},
	left_ring="Stikini Ring +1",
	right_ring="Defending Ring",
	back="Solemnity Cape",
	waist="Shinjutsu-no-obi +1",
	legs="Carmine Cuisses +1",
	feet={ name="Chironic Slippers", augments={'Accuracy+9','Enmity-5','"Refresh"+1',}},
	}
	
end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' then
		enable('main','sub','range')
	else
		disable('main','sub','range')
	end
	if buffactive['Stun'] or buffactive['Petrify'] or buffactive['Terror'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
		cancel_spell()
	elseif buffactive['Weakness'] and spell.name == "Sublimation" then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Weakness]')
	elseif (buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']) and spell.name == "Sublimation" and player.mpp >= 85 then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
	elseif spell.action_type == 'Magic' then
		if spell.skill == 'Healing Magic' then
			if string.find(spell.english,'Cur') and spell.english ~= 'Cursna' then
				weathercheck(spell.element,sets.fc.cure)
			else
				equip(sets.fc.healing)
			end
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name == "Phalanx II" and spell.target.type == 'SELF' then
				cancel_spell()
				send_command('@input /ma "Phalanx" <me>')
			elseif spell.name == "Stoneskin" then
				if buffactive["Stoneskin"] then
					send_command('cancel 37')
				end
				equip(sets.fc.stoneskin)
			elseif spell.name == 'Sneak' and spell.target.name == player.name and buffactive["Sneak"] then
				send_command('cancel 71')
			else
				equip(sets.fc.base)
			end
		elseif spell.skill == 'Ninjutsu' then
			if spell.name == 'Utsusemi' then
				if buffactive["Copy Image"] or buffactive['Copy Image (2)'] then
					send_command('cancel 66;')
				elseif buffactive['Copy Image (2)'] then
					send_command('cancel 444;')
				end
				equip(sets.fc.utsusemi)
			else
				if spell.name:contains('Monomi') and buffactive["Sneak"] then
					send_command('cancel 71')
				end
				equip(sets.fc.base)
			end
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
		if player.tp < 1000 or player.status == "Idle" then
			cancel_spell()
		elseif spell.target.distance > (ability_distance * range_mult[ability_distance] + spell.target.model_size + player.model_size) then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		elseif player.tp > 1000 then
			if (player.tp >= 1000 and player.tp < 3000) then
				equip({left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}})
			else
				equip({left_ear="Ishvara Earring"})
			end
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				equip(sets.ws.common)
			end
		end
	end
end

function midcast(spell)
	if spell.action_type == 'Magic' and not spell.type:contains('Trust') then
		if sets.midcast[spell.name] then
			weathercheck(spell.element,sets.midcast[spell.name])
		elseif spell.skill == 'Healing Magic' then
			if string.find(spell.english,'Cur') and spell.english ~='Cursna' then
				weathercheck(spell.element,sets.midcast.cure)
			elseif spell.english == 'Cursna' then
				weathercheck(spell.element,sets.midcast.cursna)
			elseif NaSpells:contains(spell.name) then
				equip(sets.midcast.conservemp)
			elseif spell.english:contains('raise') then
				equip(sets.midcast.raise)
			end
		elseif spell.skill == 'Elemental Magic' then
			weathercheck(spell.element,sets.midcast.elemental)
			zodiaccheck(spell.element)
		elseif spell.skill == "Enhancing Magic" and not S{'Warp','Warp II','Retrace','Teleport-Holla','Teleport-Mea','Teleport-Dem','Teleport-Altep','Teleport-Vahzl','Teleport-Yhoat','Recall-Jugner','Recall-Pashh','Recall-Meriph'}:contains(spell.english) then
			if spell.english == "Sneak" or spell.english == "Invisible" then
				equip(sets.buff.skulk)
			elseif string.find(spell.english,'Regen') then
				equip(sets.midcast.regen)
			elseif BarElements:contains(spell.name) then
				equip(sets.midcast.bar_element)
			elseif sets.buff[spell.name] then
				equip(sets.buff[spell.name])
				if string.find(spell.english,'Refresh III') and spell.target.type == 'SELF' then
					equip(sets.buff.selfrefresh)
				elseif string.find(spell.english,'Phalanx') and spell.target.type == 'SELF' then
					equip(sets.buff.selfphalanx)
				end
			else
				equip(sets.midcast.EnhancingDuration)
			end
		elseif spell.skill == 'Enfeebling Magic' then
			if spell.name == "Dispelga" then
				equip({main="Daybreak"})
			elseif EnfeeblingMax:contains(spell.name) then
				equip(sets.midcast.maxenfacc)
			elseif EnfeeblingPot:contains(spell.name) then
				equip(sets.midcast.fradispot)
			elseif EnfeeblingMND:contains(spell.name) then
				equip(sets.midcast.enfeebleMND)
			elseif EnfeeblingINT:contains(spell.name) then
				equip(sets.midcast.enfeebleINT)
			elseif EnfeeblingDur:contains(spell.name) then
				equip(sets.midcast.enfduration)
			else
				equip(sets.midcast.dia)
			end
		elseif spell.skill == 'Dark Magic' then
			if string.find(spell.english,'Bio') then
				equip(sets.midcast['Dark Magic'])
			elseif spell.english:startswith('Drain') or spell.english:startswith('Aspir') then
				weathercheck(spell.element,sets.midcast.drain)
			end
		elseif spell.skill == 'Ninjutsu' then
		else
			equip(sets.midcast.conservemp)
		end
	end
end

function aftercast(spell)
	if player.status == "Engaged" then
		disable('main','sub','range')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive['Enblizzard'] then
			equip(sets.buff.enspell)
		end
	elseif player.status == "Idle" then
		equip(sets.idle[sets.idle.index[idle_ind]])
	end
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.aftercast.rest)
	elseif new == 'Engaged' then
		disable('main','sub','range')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive['Enblizzard'] then
			equip(sets.buff.enspell)
		end
	elseif new == 'Idle' then
		equip(sets.idle[sets.idle.index[idle_ind]])
	end
end

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"silence"}:contains(name) then
        if gain then
			send_command('@input /item "Echo Drops" <me>')
		end
	elseif S{"reraise"}:contains(name) then
		if gain then
		else
			if player.hp ~= 0 then
				add_to_chat(123, 'Reraise: [lost]')
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
    end
	if command == 'toggle idle set' then
		idle_ind = idle_ind +1
		if idle_ind > #sets.idle.index then idle_ind = 1 end
		windower.add_to_chat(1,'<----- idle Set changed to '..sets.idle.index[idle_ind]..' ----->')
		equip(sets.idle[sets.idle.index[idle_ind]])
	end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs c toggle idle set') -- Hit alt+e, toggles the sets
--send_command('wait 5;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip refresh')

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
end

--function zone_change(new,old)
--	if areas.Cities:contains(world.area) then
--		equip(sets.idle[sets.idle.index[idle_ind]])
--		if world.area:contains("Bastok") or world.area:contains("Metalworks") then
--		elseif world.area:contains("Adoulin") then
--			equip({body="Councilor's Garb"})
--		elseif world.area:contains("Windurst") or world.area:contains("Heaven's") then
		--end
	--end
--end

---------------------------------- Stratagems ----------------------------------

local strat_charge_time = {[1]=240,[2]=120,[3]=80,[4]=60,[5]=48}
local settings = {pos={x=0,y=0}}
local stratBox = texts.new(settings)

windower.register_event('prerender', function()
	if player then
		if S{player.main_job, player.sub_job}:contains('SCH') then
			local strats = get_available_stratagem_count()
			local col = '\\cs(0,255,0)'
			if (strats == 0) then
				col = '\\cs(255,0,0)'
			end
			stratBox:text('Stratagems: '..col..strats..'\\cr')
			stratBox:visible(true)
		else
			stratBox:hide()
		end
	else
		stratBox:hide()
	end
end)

-- Calculates and returns the maximum number of SCH stratagems available for use. --
function get_max_stratagem_count()
	if S{player.main_job, player.sub_job}:contains('SCH') then
		local lvl = (player.main_job == 'SCH') and player.main_job_level or player.sub_job_level
		return math.floor(((lvl  - 10) / 20) + 1)
	else
		return 0
	end
end

--[[
	Calculates the number of SCH stratagems that are currently available for use. Calculated from the combined recast timer for stratagems and the maximum number
	of stratagems that are available.  The recast time for each stratagem charge corresponds directly with the maximum number of stratagems that can be used.
--]]
function get_available_stratagem_count()
	local recastTime = windower.ffxi.get_ability_recasts()[231] or 0
	local maxStrats = get_max_stratagem_count()
	if (maxStrats == 0) then return 0 end
	local stratsUsed = (recastTime/strat_charge_time[maxStrats]):ceil()
	return maxStrats - stratsUsed
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
	add_to_chat (55, 'You are on '..('White Mage'):color(5)..('. '):color(55)..''..('Macros set!'):color(121))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end
 
--Page, Book--
--set_macros(3,2)
--Use the Lockstyle Number--
--set_style(001)  