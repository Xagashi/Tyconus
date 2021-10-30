target_distance = 8

res = require 'resources'

BarElements = S{"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera"}
BarAilments = S{"Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra"}
NaSpells = S{"Blindna","Erase","Paralyna","Poisona","Silena","Stona","Viruna"}
BoostSpells = S{"Boost-STR","Boost-DEX","Boost-VIT","Boost-AGI","Boost-INT","Boost-MND","Boost-CHR"}
EnfeeblingMND = S{"Paralyze","Slow"}
EnfeeblingINT = S{"Blind","Bind","Dispel","Sleep","Sleep II","Sleepga","Poison","Poison II","Poisonga"}

--Potency >>>>>> MND > VIT > Skill

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
	
----------------------------------------------------------------------------------------------------------------
-------------------------------------------------- Fast Cast ---------------------------------------------------
----------------------------------------------------------------------------------------------------------------
	
	sets.fc.base = { --rdm sub: 15+72%
	main={ name="Gada", augments={'"Fast Cast"+6','Mag. Acc.+11','"Mag.Atk.Bns."+18','DMG:+3',}}, --6
	sub="Chanter's Shield", --3
	range="Dunna", --3
	head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, --10
	neck="Baetyl Pendant", --4
	left_ear="Etiolation Earring", --1
	right_ear="Loquacious Earring", --2
	body="Merlinic Jubbah", --12
	hands="Volte Gloves", --6
	left_ring="Kishar Ring", --4
	right_ring="Lebeche Ring", --2 qm
	back="Perimede Cape", --4 qm
	waist="Witful Belt", --3 3 qm
	--back="Lifestream Cape", --7
	--waist="Embla Sash", --5
	legs="Geomancy Pants +2", --13
	feet="Regal Pumps +1" --5
	}
	
	sets.fc.cure = set_combine(sets.fc.base, {
	--legs="Doyen Pants",
	})
	
	sets.fc.healing = set_combine(sets.fc.base, {
	--main="Vadose Rod",
	})
	
	sets.fc.stoneskin = set_combine(sets.fc.base, {
	--head="Umuthi Hat",
	--legs="Doyen Pants",
	})
	
	sets.fc['Enhancing Magic'] = set_combine(sets.fc.base, {
	waist="Siegel Sash"
	})
	
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------- MIDCAST ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.midcast.conservemp = {
	main="Solstice",
	head="Vanya Hood",
	right_ear="Gifted Earring",
	body="Vedic Coat",
	hands="Shrieker's Cuffs",
	right_ring="Mephitas's Ring +1",
	back="Solemnity Cape",
	--waist="Shinjutsu-no-obi +1",
	waist="Austerity Belt +1",
	legs="Vanya Slops",
	}
	
	sets.midcast.cure = { 
	main="",
	sub="Ammurapi Shield",
	head="Vanya Hood",
	neck="",
	left_ear="",
	right_ear="",
	body="",
	hands="",
	left_ring="Janniston Ring", --II +5%
	right_ring="Lebeche Ring", --3%
	back="",
	waist="Luminary Sash",
	legs="",
	feet=""
	}
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.conservemp, {
	main="Gada",
	head="Befouled Crown",
	neck="Incanter's Torque",
	left_ear="Andoaa Earring",
	right_ear="Mimir Earring",
	body="Telchine Chasuble",
	left_ring="Stikini Ring +1",
	back="Perimede Cape",
    feet="Regal Pumps +1"
	})
	
	sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
	sub="Ammurapi Shield",
	head="Telchine Cap",
	--body="Telchine Chasuble",
	hands="Telchine Gloves",
	waist="Embla Sash",
	legs="Telchine Braconi",
	feet="Telchine Pigaches"
	})
	
	sets.midcast.MagicMAB = {
		Dark={
			head={ name="Pixie Hairpin +1", hp=-35,mp=120},
			left_ear="Regal Earring",
			--right_ring="Archon Ring",
		}
	}
	
	sets.midcast.enfeeble = set_combine(sets.midcast.conservemp, {
	main="Daybreak",
	sub="Ammurapi Shield",
	--main="Contemplator +1",
	--sub="Khonsu",
	head=empty,
	neck="Bagua Charm +2",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	body="Cohort Cloak +1",
	hands="Geomancy Mitaines +3",
	left_ring="Stikini Ring +1",
	right_ring="Metamorph Ring +1",
	back="Aurist's Cape +1",
	waist="Luminary Sash",
	legs="Geomancy Pants +2",
	feet="Bagua Sandals +3"
	})
	
	sets.midcast.enfeebleMND = set_combine(sets.midcast.enfeeble, {
	})
	
	sets.midcast.enfeebleINT = set_combine(sets.midcast.enfeeble, {
	})
	
	sets.nuke.index = {'Free','MB'}
	nuke_ind = 1 --Free set is the Default
	
	sets.nuke['Free'] = {
	--main="Daybreak",
	--sub="Ammurapi Shield",
	main={name="Marin Staff +1",priority=2},
	sub={name="Enki Strap",priority=1},
	ammo="Ghastly Tathlum +1",
	head=empty,
	neck="Baetyl Pendant",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	body="Cohort Cloak +1",
	hands="Amalric Gages +1",
	left_ring="Freke Ring",
	right_ring="Metamorph Ring +1",
	back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
	waist="Refoccilation Stone",
	legs="Bagua Pants +3",
	feet="Amalric Nails +1"
	}
	
	sets.nuke['MB'] = set_combine(sets.nuke['Free'], {
	head="Ea Hat +1",
	neck="Mizukage-no-Kubikazari",
	body="Ea Houppelande +1",
	right_ring="Mujin Band",
	legs="Ea Slops +1",
	})
	
	sets.midcast['Dark Magic'] = set_combine(sets.midcast.conservemp, {
	neck="Erra Pendant",
	left_ring="Stikini Ring +1",
	right_ring="Evanescence Ring",
	})
	
	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
	head="Bagua Galero +3",
	waist="Fucho-no-Obi",
	})
	
	sets.midcast['Geomancy'] = set_combine(sets.midcast.conservemp, {
	neck="Bagua Charm +2",
	hands="Geomancy Mitaines +3",
	left_ring="Stikini Ring +1",
	})
	
	sets.midcast.indiduration = set_combine(sets.midcast['Geomancy'], {
	main={ name="Gada", augments={'Indi. eff. dur. +9','Mag. Acc.+2','"Mag.Atk.Bns."+3',}},
	back="Lifestream Cape",
	legs="Bagua Pants +3",
	feet="Azimuth Gaiters +1",
	})

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------- MISC -----------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.ja['Full Circle'] = {head="Azimuth Hood +1",hands="Bagua Mitaines +1",}
	sets.ja['Life Cycle'] = {body="Geomancy Tunic +2",back={ name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},}
	sets.ja['Bolster'] = {body="Bagua Tunic +3",}
	sets.ja['Radial Arcana'] = {feet="Bagua Sandals +3"}
	sets.ja['Sentinel'] = {
	neck="Unmoving Collar +1",
	left_ear="Cryptic Earring",
	right_ear="Friomisi Earring",
	left_ring="Petrov Ring",
	}

	sets.buff.skulk = set_combine(sets.midcast.EnhancingDuration, {back = "Skulker's Cape"})
	
	sets.buff['Stoneskin'] = set_combine(sets.midcast.EnhancingDuration, {
	neck="Nodens Gorget",
	left_ear="Earthcry earring",
	waist="Siegel Sash",
	legs="Shedir Seraweels",
	})
	
	sets.buff['Aquaveil'] = set_combine(sets.midcast.EnhancingDuration, {
	main="Vadose Rod",
	--hands="Regal Cuffs",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	})
	
	sets.buff.refresh = set_combine(sets.midcast.EnhancingDuration, {
	feet="Inspirited Boots",
	})
	
	sets.sublimation = {waist="Embla Sash"}
	
	sets.pet ={ --PetDT/Regen 18/27 --+2R25 neck = -23 perpetuation cost bubble BoG/EA
	main="Solstice", --4/0
	sub="Genmei Shield",
	ammo="Staunch Tathlum +1",
	head="Azimuth Hood +1", --0/3
	neck="Bagua Charm +2",
	hands="Geomancy Mitaines +3", --11/0
	back={ name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}}, --0/15
	waist="Isa Belt", --3/1
	legs="Telchine Braconi", --0/3
	feet="Bagua Sandals +3" --0/5
	}
	
	sets.idle.index = {'Refresh','DT'}--,'PDT','MDT'}
	idle_ind = 1 --Refresh set is the Default
	
	sets.idle['Refresh'] = {
	main="Daybreak",
	sub="Genmei Shield",
	range="Dunna",
	head="Befouled Crown",
	neck="Loricate Torque +1",
	left_ear="Etiolation Earring",
	right_ear="Lugalbanda Earring",
	body="Jhakri Robe +2",
	hands="Shrieker's Cuffs",
	left_ring="Stikini Ring +1",
	right_ring="Defending Ring",
	back="Solemnity Cape",
	waist="Shinjutsu-no-obi +1",
	legs="Lengo Pants",
	feet="Geomancy Sandals +3"
	}
	
	sets.idle['DT'] = {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	back="Solemnity Cape",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending Ring",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.TP.index = {'Melee'}
	TP_ind = 1 --Melee set is the Default
	
	sets.TP['Melee'] = {
	head="Nyame Helm",
	neck="Combatant's Torque",
	left_ear="Telos Earring",
	right_ear="Dignitary's Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	--left_ring="Cacoethic Ring",
	--right_ring="Cacoethic Ring +1",
	back="Relucent Cape",
	waist="Grunfeld Rope",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.low_hp = {
	head="",
	neck="Incanter's Torque",
	left_ear="",
	right_ear="",
	body=empty,
	hands="",
	right_ring="Mephitas's Ring +1",
	--back="Vates Cape +1",
	legs="",
	feet=""
	}
	
	sets.high_hp = {
	head="",
	neck="Sanctity Necklace",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="",
	hands="Telchine gloves",
	right_ring="Ilabrat Ring",
	back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','HP+27','Accuracy+5','DEF+4',}},
	legs="",
	feet=""
	}
	
	sets.misc.rest = {
	head="Befouled Crown",
	body="",
	hands="",
	waist="Shinjutsu-no-obi +1",
	--legs="Assiduity Pants",
	feet=""
	}
	
	sets.fashion = {
	head=empty,
	body="Cohort Cloak +1",
	hands="Shrieker's Cuffs",
	legs="Vanya Slops",
	feet="Jhakri Pigaches +2"
	}
	
	sets.refresh = sets.idle['Refresh']
	
	sets.ws.common = {
	head="Nyame Helm",
	neck="Fotia Gorget",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	back="Solemnity Cape",
	waist="Fotia Belt",
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
	if buffactive['Stun'] or buffactive['Petrify'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
		cancel_spell()
	elseif buffactive['Weakness'] and spell.name == "Sublimation" then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Weakness]')
	elseif (buffactive['Sublimation: Activated'] or buffactive['Sublimation: Complete']) and spell.name == "Sublimation" and player.mpp >= 85 then
		cancel_spell()
	elseif buffactive['Entrust'] and spell.english:startswith('Indi-') and spell.target.type == 'SELF' then
		cancel_spell()
	elseif (sets.ja[spell.english]) then
		equip(sets.ja[spell.english])
	elseif spell.action_type == 'Magic' and not spell.type:contains('Trust') then
		if spell.skill == 'Healing Magic' then
			if string.find(spell.english,'Cur') and spell.english ~= 'Cursna' then
				if player.max_hp <= 2185 or buffactive['Max HP Boost'] then
					equip(sets.fc.cure)
				end
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
		elseif player.tp > 1000 then
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
				if player.max_hp <= 2185 or buffactive['Max HP Boost'] then
					weathercheck(spell.element,sets.midcast.cure)
				end
			elseif spell.english == 'Cursna' then
				weathercheck(spell.element,sets.midcast.cursna)
			elseif NaSpells:contains(spell.name) or spell.name == 'Arise' or spell.english:contains('raise') then
				if buffactive['Divine Caress'] then
					equip(sets.caress)
				else
					equip(sets.midcast.conservemp)
				end
			end
		elseif sets.midcast[spell.name] then
			weathercheck(spell.element,sets.midcast[spell.name])
		elseif spell.skill == 'Elemental Magic' then
			weathercheck(spell.element,sets.nuke[sets.nuke.index[nuke_ind]])
			zodiaccheck(spell.element)
		elseif spell.skill == "Enhancing Magic" and not S{'Warp','Warp II','Retrace','Teleport-Holla','Teleport-Mea','Teleport-Dem','Teleport-Altep','Teleport-Vahzl','Teleport-Yhoat'}:contains(spell.english) then
			if spell.english == "Sneak" or spell.english == "Invisible" then
				equip(sets.buff.skulk)
			elseif string.find(spell.english,'Regen') then
				equip(sets.midcast.regen)
			elseif BarElements:contains(spell.name) then
				equip(sets.midcast.bar_element)
				if buffactive['Light Arts'] then
					equip({head="",feet=""})
				end
			elseif spell.name == 'Erase' then
				equip({neck=""})
			elseif sets.buff[spell.name] then
				equip(sets.buff[spell.name])
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
				weathercheck(spell.element,sets.midcast.divinedmg)
			end
		elseif spell.skill == 'Dark Magic' then
			weathercheck(spell.element,sets.midcast.dark)
		elseif spell.skill == 'Ninjutsu' then
		elseif spell.skill == 'Geomancy' then
			if string.find(spell.english,'Indi-') then
				equip(sets.midcast.indiduration)
			else
				equip(sets.midcast['Geomancy'])
				if buffactive['Blaze of Glory'] then
					equip({head="Bagua Galero +3",})
				end
			end
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
		if (spell.english:contains('Geo-') or pet.isvalid) and spell.name ~= "Full Circle" then
			equip(sets.pet)
		end
	elseif player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
		if (spell.english:contains('Geo-') or pet.isvalid) and spell.name ~= "Full Circle" then
			equip({neck="Bagua Charm +2",})
		end
	end
end

function status_change(new,old)
	if new == 'Resting' then
		equip(sets.misc.rest)
	elseif new == 'Engaged' and player.target.distance > target_distance or new == 'Idle' then
		enable('main','sub')
		equip(sets.idle[sets.idle.index[idle_ind]])
	elseif new == 'Engaged' then
		disable('main','sub')
		equip(sets.TP[sets.TP.index[TP_ind]])
	end
	if pet.isvalid then
		equip(sets.pet)
	end
end

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"silence"}:contains(name) then
		if gain then
			send_command('@input /item "Echo Drops" <me>')
			--send_command('@input /item "Remedy" <me>')
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
	--elseif pet.isvalid then
	--	if gain then
	--	else
	--		equip(sets.idle[sets.idle.index[idle_ind]])
	--	end
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
	if command == 'toggle nuke set' then
		nuke_ind = nuke_ind +1
		if nuke_ind > #sets.nuke.index then nuke_ind = 1 end
		windower.add_to_chat(1,'<----- nuke Set changed to '..sets.nuke.index[nuke_ind]..' ----->')
	end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs c toggle idle set') -- Hit alt+e, toggles the sets
send_command('bind !n gs c toggle nuke set') -- Hit alt+n, toggles the sets
send_command('wait 5;gs equip fashion;wait 1;input /lockstyle on;wait 1;gs equip refresh')
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')

send_command('alias frailty input /ja "Blaze of Glory" <me>;wait 1;input /ma "Geo-Frailty" <t>;wait 4;input /ja "Ecliptic Attrition" <me>;wait 1;input /ja "Dematerialize" <me>')
send_command('alias Malaise input /ja "Blaze of Glory" <me>;wait 1;input /ma "Geo-Malaise" <t>;wait 4;input /ja "Ecliptic Attrition" <me>;wait 1;input /ja "Dematerialize" <me>')
send_command('alias Fury input /ja "Blaze of Glory" <me>;wait 1;input /ma "Geo-Fury" <me>;wait 4;input /ja "Ecliptic Attrition" <me>;wait 1;input /ja "Dematerialize" <me>')

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
	send_command('unbind !a')
	send_command('unbind !n')
	send_command('unbind !u')
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
set_macros(1,5)
--Use the Lockstyle Number--
--set_style(001)