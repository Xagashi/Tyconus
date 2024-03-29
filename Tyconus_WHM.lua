res = require 'resources'
target_distance = 8

BarElements = S{"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera"}
BarAilments = S{"Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra"}
NaSpells = S{"Blindna","Erase","Paralyna","Poisona","Silena","Stona","Viruna"}
BoostSpells = S{"Boost-STR","Boost-DEX","Boost-VIT","Boost-AGI","Boost-INT","Boost-MND","Boost-CHR"}
EnfeeblingMND = S{"Paralyze","Slow","Distract","Frazzle","Addle",}
EnfeeblingINT = S{"Blind","Bind","Dispel","Sleep","Sleep II","Sleepga","Poison","Poison II","Poisonga"}

send_command('lua l partybuffs')

--Potency >>>>>> MND > VIT > Skill

-- List of Aliases --
--	Command:				Description:
--	//la					Light Arts + Afflatus Solace
--	//larr					Light Arts + Afflatus Solace + RR4
--	//aoe4					AOE Regen 4
--	//aoecure3				AOE Cure 3
--	//aoecure4				AOE Cure 4
--  //naegling				All buff spells whm has at its disposal; starting with longest duration. For Naegling users.

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
	sets.TP = {}
	
----------------------------------------------------------------------------------------------------------------
-------------------------------------------------- Fast Cast ---------------------------------------------------
----------------------------------------------------------------------------------------------------------------
	
	sets.fc.base = { --82% 11% qm
	main="Cath Palug Hammer", --7
	sub="Chanter's Shield", --3
	ammo="Impatiens", --2 qm
	head="Ebers Cap +3", --13
	neck="Cleric's Torque", --6
	left_ear="Loquacious Earring", --2
	right_ear="Malignance Earring", --4
	body="Inyanga Jubbah +2", --14
	hands="Fanatic Gloves", --7
	left_ring="Lebeche Ring", --2 qm
	right_ring="Medada's Ring", --10
	back="Perimede Cape", --4 qm
	waist="Witful Belt", --3 3 qm
	legs="Volte Brais", --8
	feet="Regal Pumps +1" --5
	--feet="Kaykaus boots +1" --Path D
	}
	
	sets.fc.cure = set_combine(sets.fc.base, {})
	
	sets.fc.healing = set_combine(sets.fc.base, {})
	
	sets.fc.stoneskin = set_combine(sets.fc.base, {})
	
	sets.fc['Enhancing Magic'] = set_combine(sets.fc.base, {})
	
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------- MIDCAST ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.midcast.conservemp = {
	ammo="Pemphredo Tathlum",
	head="Vanya Hood",
	right_ear="Gifted Earring",
	body="Vedic Coat",
	hands="Shrieker's Cuffs",
	left_ring="Mephitas's Ring +1",
	back="Solemnity Cape",
	--waist="Shinjutsu-no-obi +1",
	waist="Austerity Belt +1",
	legs="Vanya Slops",
	}
	
	sets.midcast.cure = { --51(52)%, II +19%
	main="Queller Rod", --15% + II +2%
	sub="Ammurapi Shield",
	ammo="Hydrocera",
	head="Theophany Cap +3", --12%
	neck="Cleric's Torque", --5%
	left_ear="Nourishing Earring +1", --6%
	right_ear="Glorious Earring", --II +2%
	body="Theophany Bliaut +3", --II +6%
	hands="Theophany Mitts +3", --II +4%
	left_ring="Janniston Ring", --II +5%
	right_ring="Menelaus's Ring", --3%
	back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}}, --10%
	waist="Bishop's Sash",
	legs="Ebers Pantaloons +3",
	feet="Theophany Duckbills +3"
	}
	
	sets.midcast.raise = { --FC 84% cap + Haste+25% + leftover slots for conserve mp.
	main="Cath Palug Hammer", --7
	sub="Chanter's Shield", --3
	ammo="Sapience Orb", --2
	head="Ebers Cap +3", --13
	neck="Cleric's Torque", --6
	left_ear={name="Malignance Earring",priority=14}, --4
	right_ear={name="Gifted Earring",priority=15},
	body="Inyanga Jubbah +2", --14
	hands="Fanatic Gloves", --7
	left_ring="Mephitas's Ring +1",
	right_ring="Medada's Ring", --10
	back="Fi Follet Cape +1", --10
	waist="Embla Sash", --5
	legs="Volte Brais", --8
	feet="Regal Pumps +1" --5
	--feet="Kaykaus boots +1" --Path D
	}
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.conservemp, {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','MND+1',}},
	head="Befouled Crown",
	neck="Incanter's Torque",
	left_ear="Andoaa Earring",
	right_ear="Mimir Earring",
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
    legs="Piety Pantaloons +3",
    feet="Theophany Duckbills +3"
	})
	
	sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
	sub="Ammurapi Shield",
	head={ name="Telchine Cap", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	body={ name="Telchine Chasuble", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	hands={ name="Telchine Gloves", augments={'Pet: "Mag.Atk.Bns."+20','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
	waist="Embla Sash",
	legs={ name="Telchine Braconi", augments={'Pet: Evasion+16','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
	feet="Theophany Duckbills +3"
	})
	
	sets.midcast.regen = set_combine(sets.midcast.EnhancingDuration, {
	main="Bolelabunga",
	head="Inyanga Tiara +2",
	body="Piety Bliaut +3",
	hands="Ebers Mitts +3",
	legs="Theophany Pantaloons +3",
	feet="Bunzi's Sabots"
	})
	
	sets.midcast.bar_element = set_combine(sets.midcast.EnhancingDuration, {
	main="Beneficus",
	head="Ebers Cap +3",
	neck="Incanter's Torque",
    body="Ebers Bliaut +3",
	hands="Ebers Mitts +3",
	back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
    legs="Piety Pantaloons +3",
	feet="Ebers Duckbills +3"
	})
	
	sets.midcast.bar_ailment = set_combine(sets.midcast.EnhancingDuration, {
	neck="Sroda Necklace",
	})
	
	sets.midcast.shell = set_combine(sets.midcast.EnhancingDuration, {
	main="Beneficus",
	left_ring="Sheltered Ring",
	legs="Piety Pantaloons +3",
	})
	
	sets.midcast.naremoval = set_combine(sets.midcast.conservemp, {main="Yagrush",})
	
	sets.midcast.cursna = set_combine(sets.midcast.conservemp, {
	main="Yagrush",
	head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	neck="Debilis Medallion",
	left_ear="Meili Earring",
	right_ear="Ebers Earring +1",
	body="Ebers Bliaut +3",
	hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+7',}},
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",
	back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},
	waist="Bishop's Sash",
	legs="Theophany Pantaloons +3",
	feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	})
	
	sets.midcast.enfeeble = set_combine(sets.midcast.conservemp, { --478 enfeebling, 420 mnd, 451 m.acc, 242 m.acc skill
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Hydrocera",
	head="Theophany Cap +3",
	neck="Erra Pendant",
	left_ear="Regal Earring",
	right_ear="Ebers Earring +1",
	body="Theophany Bliaut +3",
	hands="Kaykaus Cuffs +1",
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	back="Aurist's Cape +1",
	waist="Obstinate Sash",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	feet="Theophany Duckbills +3"
	})
	
	sets.midcast.enfeebleMND = set_combine(sets.midcast.enfeeble, {
	})
	
	sets.midcast.enfeebleINT = set_combine(sets.midcast.enfeeble, {
	hands="Inyanga Dastanas +2",
	})
	
	sets.midcast.divine = set_combine(sets.midcast.conservemp, {
	main="Daybreak",
	sub="Ammurapi Shield",
	ammo="Hydrocera",
	head="Theophany Cap +3",
	neck="Jokushu Chain",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	body="Theophany Bliaut +3",
	hands="Theophany Mitts +3",
	--hands="Piety Mitts +3",
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	back="Aurist's Cape +1",
	waist="Luminary Sash",
	legs="Theophany Pantaloons +3",
	feet="Theophany Duckbills +3"
	})
	
	sets.midcast.divinedmg = set_combine(sets.midcast.divine, {
	ammo="Ghastly Tathlum +1",
	head=empty,
	neck="Saevus Pendant +1",
	body="Cohort Cloak +1",
	hands="Fanatic Gloves",
	right_ring="Freke Ring",
	back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Mag.Atk.Bns."+10',}},
	waist="Orpheus's Sash",
	legs="Bunzi's Pants",
	feet="Bunzi's Sabots"
	})
	
	sets.midcast.elemental = set_combine(sets.midcast.divinedmg, {
	hands="Nyame Gauntlets",
	})
	
	sets.midcast.dark = set_combine(sets.midcast.conservemp, {
	neck="Erra Pendant",
	left_ring="Stikini Ring +1",
	right_ring="Evanescence Ring",
	waist="Fucho-no-Obi",
	})

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------- MISC -----------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.movement = {feet="Herald's Gaiters"}
	
	sets.buff.skulk = set_combine(sets.midcast.EnhancingDuration, {back = "Skulker's Cape"})
	
	sets.buff['Stoneskin'] = set_combine(sets.midcast.EnhancingDuration, {
	neck="Nodens Gorget",
	left_ear="Earthcry earring",
	waist="Siegel Sash",
	legs="Shedir Seraweels",
	})
	
	sets.buff['Aquaveil'] = set_combine(sets.midcast.EnhancingDuration, {
	main="Vadose Rod",
	head="Chironic Hat",
	--hands="Regal Cuffs",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	})
	
	sets.buff['Auspice'] = set_combine(sets.midcast.EnhancingDuration, {
	feet="Ebers Duckbills +3",
	})
	
	sets.buff.refresh = set_combine(sets.midcast.EnhancingDuration, {
	--feet="Inspirited Boots",
	})
	
	sets.ja['Benediction'] = {body="Piety Bliaut +3"}
	sets.ja['Devotion'] = {head="Piety Cap"}
	--sets.ja['Martyr'] = {hands="Piety Mitts"}
	sets.sublimation = {waist="Embla Sash"}
	sets.caress = set_combine(sets.midcast.conservemp, {main="Yagrush",hands="Ebers Mitts +3",--[[back="Mending Cape",]]})
	
	sets.idle.index = {'Refresh','DT'}
	idle_ind = 1 --Refresh set is the Default
	
	sets.idle['Refresh'] = {
	main="Daybreak",
	sub="Genmei Shield",
	ammo="Homiliary",
	head="Volte Beret",
	neck="Loricate Torque +1",
	left_ear="Etiolation Earring",
	right_ear="Eabani Earring",
	body="Ebers Bliaut +3",
	hands="Volte Gloves",
	left_ring="Stikini Ring +1",
	right_ring="Defending Ring",
	back="Solemnity Cape",
	waist="Carrier's Sash",
	legs="Volte Brais",
	feet="Volte Gaiters"
	}
	
	sets.idle['DT'] = set_combine(sets.idle['Refresh'], {
	head="Nyame Helm", --ME123 MDB5 DT7
	neck="Loricate Torque +1", --6
	--body="Nyame Mail", --ME139 MDB8 DT9
	--hands="Nyame Gauntlets", --ME112 MDB4 DT7
	back="Solemnity Cape", --4
	waist="Platinum Moogle Belt",
	--legs="Nyame Flanchard", --ME150 MDB7 DT8
	feet="Nyame Sollerets", --ME150 MDB5 DT7
	})
	
	sets.TP.index = {'Melee'}
	TP_ind = 1 --Melee set is the Default
	
	sets.TP['Melee'] = {
	head="Ebers Cap +3",
	neck="Combatant's Torque",
	left_ear="Brutal Earring",
	right_ear="Telos Earring",
	body="Ebers Bliaut +3",
	hands="Bunzi's Gloves",
	left_ring="Petrov Ring",
	right_ring="Ilabrat Ring",
	back="Aurist's Cape +1",
	waist="Olseni Belt",
	legs="Ebers Pantaloons +3",
	feet="Ebers Duckbills +3"
	}
	
	sets.low_hp = {
	head="Piety Cap",
	neck="Incanter's Torque",
	left_ear="Nourishing Earring +1",
	right_ear="Glorious Earring",
	body=empty,
	hands=empty,
	right_ring="Mephitas's Ring +1",
	--back="Vates Cape +1",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	feet="Volte Gaiters"
	}
	
	sets.high_hp = {
	head="Theophany Cap +3",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Ebers Bliaut +3",
	hands="Telchine gloves",
	right_ring="Ilabrat Ring",
	back="Twilight Cape",
	waist="Platinum Moogle Belt",
	legs="Ebers Pantaloons +3",
	feet="Theophany Duckbills +3"
	}
	
	sets.misc.rest = {
	body="Theophany Bliaut +3",
	waist="Shinjutsu-no-obi +1",
	feet="Volte Gaiters"
	}
	
	sets.refresh = sets.idle['Refresh']
	
---------------------------------------------------------------------------------------------------------------
----------------------------------------------- Weaponskills --------------------------------------------------
------------------------------------------- You're in the wrong. ----------------------------------------------
	sets.ws.common = {
	head="Nyame Helm",
	neck="Fotia Gorget",
	right_ear="Ishvara Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Epaminondas's Ring",
	right_ring="Metamorph Ring +1",
	waist="Fotia Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets",
	}
	
	sets.ws['Hexa Strike'] = set_combine(sets.ws.common, {
	--head="Piety Cap +3",
	neck="Fotia Gorget",
	right_ear="Telos Earring",
	body="Piety Bliaut +3",
	--hands="Piety Mitts +3",
	left_ring="Begrudging Ring",
	right_ring="Ilabrat Ring",
	waist="Fotia Belt",
	legs="Piety Pantaloons +3",
	--feet="Piety Duckbills +3",
	})
	
	sets.ws['Mystic Boon'] = set_combine(sets.ws.common, {
	right_ear="Regal Earring",
	waist="Grunfeld Rope",
	})
	
	sets.ws['Black Halo'] = set_combine(sets.ws.common, {
	ammo="Hydrocera",
	right_ear="Regal Earring",
	back="Aurist's Cape +1",
	waist="Luminary Sash",
	})
	
	sets.ws['Earth Crusher'] = set_combine(sets.ws.common, {
	neck="Sibyl Scarf",
	waist="Orpheus's Sash",
	})
	
	sets.ws['Cataclysm'] = set_combine(sets.ws['Earth Crusher'], {
	head="Pixie Hairpin +1",
	right_ring="Archon Ring",
	})

end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	if buffactive['Stun'] or buffactive['Petrify'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
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
				equip(sets.fc.cure)
			else
				equip(sets.fc.healing)
				----------------------------- Uncomment this section if you are under 50-70% Fast Cast -----------------------------
				----------------------------- This section uses Celerity when you cast Raise or Arise. -----------------------------
				--if spell.name == 'Arise' or spell.english:startswith('Raise') then
				--	if buffactive['Light Arts'] and get_available_stratagem_count() >= 1 and not buffactive['Celerity'] then
				--		cancel_spell()
				--		send_command('@input /ja "Celerity" <me>;wait 1; input /ma "'..(spell.name)..'" '..tostring(spell.target.raw))
				--	end
				--end
				--------------------------------------------------------------------------------------------------------------------
			end
		elseif spell.skill == 'Enhancing Magic' then
			if spell.name == "Stoneskin" then
				equip(sets.fc.stoneskin)
			else
				equip(sets.fc['Enhancing Magic'])
			end	
		elseif spell.skill == 'Enfeebling Magic' and spell.name == "Dispelga" then
				equip(set_combine(sets.fc.base,{main="Daybreak"}))
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
		elseif spell.target.distance > (ability_distance * range_mult[ability_distance] + spell.target.model_size + player.model_size) then
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		elseif player.tp >= 1000 then
			if (player.tp >= 1750 and player.tp < 2000) or (player.tp >= 2750 and player.tp < 3000) then
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
		if spell.skill == 'Healing Magic' then
			if string.find(spell.english,'Cur') and spell.english ~='Cursna' then
				--if player.max_hp <= 2185 or buffactive['Max HP Boost'] or world.area:contains("Escha") or world.area == ("Reisenjima") then
					weathercheck(spell.element,sets.midcast.cure)
					if string.find(spell.english,'Cure') and buffactive['Afflatus Solace'] then
						equip({body="Ebers Bliaut +3",back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Spell interruption rate down-10%',}},})
					end
				--end
			elseif spell.english == 'Cursna' then
				equip(sets.midcast.cursna)
			elseif NaSpells:contains(spell.name) then
				if buffactive['Divine Caress'] then
					equip(sets.caress)
				else
					equip(sets.midcast.naremoval)
				end
				if player.equipment.main ~= "Yagrush" then
					equip({head="Ebers Cap +3",})
				end
			elseif spell.name == 'Arise' or spell.english:contains('raise') then
				equip(sets.midcast.raise)
			end
		elseif sets.midcast[spell.name] then
			weathercheck(spell.element,sets.midcast[spell.name])
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
			elseif BarAilments:contains(spell.name) then
				equip(sets.midcast.bar_ailment)
				--if buffactive['Light Arts'] then
				--	equip({head="Ebers Cap +3",feet="Ebers Duckbills +3"})
				--end
			elseif spell.name == 'Erase' then
				equip({main="Yagrush",neck="Cleric's Torque"})
			elseif sets.buff[spell.name] then
				equip(sets.buff[spell.name])
				--if not buffactive['Light Arts'] then
				--	equip({hands="Dynasty Mitts"})
				--end
			elseif string.find(spell.english,'Refresh') and spell.target.type == 'SELF' then
				equip(sets.buff.refresh)
			else
				equip(sets.midcast.EnhancingDuration)
				--if buffactive['Light Arts'] then
				--	equip({hands="Telchine Gloves"})
				--end
			end
		elseif spell.skill == 'Enfeebling Magic' then
			if spell.name == "Dispelga" then
				equip({main="Daybreak"})
			elseif EnfeeblingMND:contains(spell.name) then
				equip(sets.midcast.enfeebleMND)
			elseif EnfeeblingINT:contains(spell.name) then
				equip(sets.midcast.enfeebleINT)
			else
				equip(sets.midcast.enfeeble)
			end
		elseif spell.skill == 'Divine Magic' then
			if spell.name == "Repose" or spell.name == "Flash" then
				weathercheck(spell.element,sets.midcast.divine)
			else
				equip(sets.midcast.divinedmg)
			end
		elseif spell.skill == 'Dark Magic' then
			weathercheck(spell.element,sets.midcast.dark)
		elseif spell.skill == 'Ninjutsu' then
		elseif spell.type == "Item" then
			return
		else
			equip(sets.midcast.conservemp)
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
	if (player.status == "Engaged" and spell.target.distance > target_distance) or player.status == "Idle" then
		equip(sets.idle[sets.idle.index[idle_ind]])
		if player.mpp <= 45 then
			equip({waist="Fucho-no-Obi"})
		end
		if buffactive['Sublimation: Activated'] then
			equip(sets.sublimation)
		end
	elseif player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
	end
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.misc.rest)
	elseif new == 'Engaged' and player.target.distance > target_distance or new == 'Idle' then
		enable('main','sub','ammo')
		equip(sets.idle[sets.idle.index[idle_ind]])
	elseif new == 'Engaged' then
		disable('main','sub','ammo')
		equip(sets.TP[sets.TP.index[TP_ind]])
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
				equip({wait="Shinjutsu-no-obi"})
			end
		end
	elseif S{"afflatus solace"}:contains(name) then
		if gain then
		else
			if player.hp ~= 0 then
				add_to_chat(123, 'Afflatus Solace: [lost]')
			end
		end
	elseif S{"afflatus misery"}:contains(name) then
		if gain then
		else
			if player.hp ~= 0 then
				add_to_chat(123, 'Afflatus Misery: [lost]')
			end
		end
	elseif S{"sleep"}:contains(name) then
		if gain then
			if buffactive["Stoneskin"] then
				send_command('cancel Stoneskin')
			end
			equip({main="Lorg Mor",})
		else
			equip({main="Daybreak"})
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
	elseif command == 'reverse TP set' then
		TP_ind = TP_ind -1
		if TP_ind == 0 then TP_ind = #sets.TP.index end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
    end
	if command == 'toggle idle set' then
		idle_ind = idle_ind +1
		if idle_ind > #sets.idle.index then idle_ind = 1 end
		windower.add_to_chat(1,'<----- idle Set changed to '..sets.idle.index[idle_ind]..' ----->')
		equip(sets.idle[sets.idle.index[idle_ind]])
	elseif command == 'reverse idle set' then
		idle_ind = idle_ind -1
		if idle_ind == 0 then idle_ind = #sets.idle.index end
		windower.add_to_chat(1,'<----- idle Set changed to '..sets.idle.index[idle_ind]..' ----->')
		equip(sets.idle[sets.idle.index[idle_ind]])
	end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs c toggle idle set') -- Hit alt+e, toggles the sets
--send_command('wait 5;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip refresh')
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')
send_command('bind !w gs equip movement') -- Hit alt+w, equips movement equipment

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
	send_command('unbind !a')
	send_command('unbind !u')
	send_command('lua u partybuffs')
end

windower.register_event('zone change',function()
		if world.area:contains("Windurst") or world.area:contains("Heaven's") then
		elseif world.area:contains("Bastok") or world.area:contains("Metalworks") then
		elseif world.area:contains("San d'Oria") or world.area:contains("Chateau d'Oraguille") then
		elseif world.area:contains("Adoulin") then
			equip({body="Councilor's Garb"})
		end
end)

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

---------------------------------- Aliases ----------------------------------

if S{player.sub_job}:contains('SCH') then
	if not buffactive['Light Arts'] and not buffactive['Afflatus Solace'] then
		send_command('alias la input /ja "Light Arts" <me>;wait 1;input /ja "Afflatus Solace" <me>')
		send_command('alias larr input /ja "Light Arts" <me>;wait 1;input /ja "Afflatus Solace" <me>;wait 1;input /ma "Reraise IV" <me>')
	elseif buffactive['Light Arts'] and not buffactive['Afflatus Solace'] then
		send_command('alias la input /ja "Afflatus Solace" <me>')
		send_command('alias larr input /ja "Afflatus Solace" <me>;wait 1;input /ma "Reraise IV" <me>')
		send_command('alias aoe4 input /ja "Accession" <me>;wait 1;input /ma "Regen IV" <t>')
	elseif buffactive['Afflatus Solace'] and not buffactive['Light Arts'] then
		send_command('alias la input /ja "Light Arts" <me>')
		send_command('alias larr input /ja "Light Arts" <me>;wait 1;input /ma "Reraise IV" <me>')
	elseif buffactive['Light Arts'] and buffactive['Afflatus Solace'] then
		send_command('alias la cancel_spell()')
		if not buffactive['Reraise'] then
			send_command('alias larr input /ma "Reraise IV" <me>')
		else
			send_command('alias larr cancel_spell()')
		end
		send_command('alias aoe4 input /ja "Accession" <me>;wait 1;input /ma "Regen IV" <t>')
		send_command('alias aoecure3 input /ja "Accession" <me>;wait 1;input /ma "Cure III" <t>')
		send_command('alias aoecure4 input /ja "Accession" <me>;wait 1;input /ma "Cure IV" <t>')
	end
	if buffactive['Light Arts'] then
		send_command('alias naegling input /ja "Accession" <me>;wait 1;input /ma "Aquaveil" <me>;wait 5;input /ja "Accession" <me>;wait 1;input /ma "Firestorm" <me>;wait 7;input /ma "Protectra V" <me>;wait 7;input /ma "Shellra V" <me>;wait 6;input /ma "Barstonra" <me>;wait 4;input /ma "Baramnesra" <me>;wait 5;input /ma "Boost-STR" <t>;wait 5;input /ma "Auspice" <me>;wait 5;input /ja "Accession" <me>;wait 1;input /ma "Regen IV" <me>')
	else
		send_command('alias naegling input /ja "Light Arts" <me>;wait 2;input /ja "Accession" <me>;wait 1;input /ma "Aquaveil" <me>;wait 5;input /ja "Accession" <me>;wait 1;input /ma "Firestorm" <me>;wait 7;input /ma "Protectra V" <me>;wait 7;input /ma "Shellra V" <me>;wait 6;input /ma "Barstonra" <me>;wait 4;input /ma "Baramnesra" <me>;wait 5;input /ma "Boost-STR" <t>;wait 5;input /ma "Auspice" <me>;wait 5;input /ja "Accession" <me>;wait 1;input /ma "Regen IV" <me>')
		send_command('alias arise input /ja "Celerity" <me>;wait 1; input /ma "Arise" <t>')
	end
else
	if not buffactive['Afflatus Solace'] then
		send_command('alias la input /ja "Afflatus Solace" <me>')
		send_command('alias larr input /ja "Afflatus Solace" <me>;wait 1;input /ma "Reraise IV" <me>')
	end
	send_command('alias naegling input /ma "Protectra V" <me>;wait 7;input /ma "Shellra V" <me>;wait 6;input /ma "Barstonra" <me>;wait 4;input /ma "Baramnesra" <me>;wait 5;input /ma "Boost-STR" <t>;wait 5;input /ma "Auspice" <me>')
end

---------------------------------- Automation ----------------------------------

windower.register_event('zone change',function()
	if world.area:contains("Maquette Abdhaljs-Legion") or world.area:contains("Dynamis") or world.area:contains("Outer Ra'Kaznar [U]") or world.area:contains("Cirdas Caverns [U]") or world.area:contains("Reisenjima Henge") then
		if S{player.sub_job}:contains('SCH') then
			if buffactive['Reraise'] then
				if not (buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']) then
					send_command('@wait 7;input /ja "Sublimation" <me>;wait 1;input /ja "Light Arts" <me>;wait 1;input /ja "Afflatus Solace" <me>')
				else
					send_command('@wait 7;input /ja "Light Arts" <me>;wait 1;input /ja "Afflatus Solace" <me>')
				end
			else
				if not (buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']) then
					send_command('@wait 7;input /ja "Sublimation" <me>;wait 1;input /ja "Light Arts" <me>;wait 1;input /ja "Afflatus Solace" <me>;wait 1;input /ma "Reraise IV" <me>')
				else
					send_command('@wait 7;input /ja "Light Arts" <me>;wait 1;input /ja "Afflatus Solace" <me>;wait 1;input /ma "Reraise IV" <me>')
				end
			end
		else
			if buffactive['Reraise'] then
				send_command('@input /ja "Afflatus Solace" <me>')
			else
				send_command('@input /ja "Afflatus Solace" <me>;wait 1;input /ma "Reraise IV" <me>')
			end
		end
	end
end)

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
	add_to_chat (55, 'You are on '..('White Mage'):color(5)..''..('. '):color(55)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(3,2)
--Use the Lockstyle Number--
set_style(001)