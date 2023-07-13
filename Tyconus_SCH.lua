target_distance = 8
res = require 'resources'
require('vectors')

BarElements = S{"Barfire","Barfira","Barblizzard","Barblizzara","Baraero","Baraera","Barstone","Barstonra","Barthunder","Barthundra","Barwater","Barwatera"}
BarAilments = S{"Barsleep","Barsleepra","Barpoison","Barpoisonra","Barparalyze","Barparalyzra","Barblind","Barblindra","Barsilence","Barsilencera","Barpetrify","Barpetra","Barvirus","Barvira","Baramnesia","Baramnesra"}
NaSpells = S{"Blindna","Erase","Paralyna","Poisona","Silena","Stona","Viruna"}
BoostSpells = S{"Boost-STR","Boost-DEX","Boost-VIT","Boost-AGI","Boost-INT","Boost-MND","Boost-CHR"}
EnfeeblingMND = S{"Paralyze","Slow"}
EnfeeblingINT = S{"Blind","Bind","Dispel","Sleep","Sleep II","Sleepga","Poison","Poison II","Poisonga"}
ElementalWheel = S{'Stone','Aero','Blizzard','Fire','Water','Thunder'}

--Potency >>>>>> MND > VIT > Skill

-- List of Aliases --
--	Command:				Description:
--	//aoe5					AOE Regen 5

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
	sets.nuke = {}
	
----------------------------------------------------------------------------------------------------------------
-------------------------------------------------- Fast Cast ---------------------------------------------------
----------------------------------------------------------------------------------------------------------------
	
	sets.fc.base = { --74%
	ammo="Impatiens", --2 qm
	head="Amalric Coif +1", --11
	neck="Baetyl Pendant", --4
	left_ear="Loquacious Earring", --2
	right_ear="Malignance Earring", --4
	body="Merlinic Jubbah", --13
	hands="Agwu's Gages", --6
	left_ring="Medada's Ring", --10
	right_ring="Lebeche Ring", --2 qm
	--back="Fi Follet Cape +1", --10
	back="Perimede Cape", --4 qm
	waist="Witful Belt", --3 3 qm
	--waist="Embla Sash", --5
	legs="Volte Brais", --8
	feet="Merlinic Crackows" --12
	}
	
	sets.fc.cure = set_combine(sets.fc.base, {})
	
	sets.fc.healing = set_combine(sets.fc.base, {})
	
	sets.fc.stoneskin = set_combine(sets.fc.base, {})
	
	sets.fc['Enhancing Magic'] = set_combine(sets.fc.base, {})
	
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------- MIDCAST ---------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.midcast.conservemp = {
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
	
	sets.midcast.cure = { --59%, II +19%
	ammo="Hydrocera",
	head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}, --10
	neck="Nodens Gorget",
	left_ear="Meili Earring",
	right_ear="Beatific Earring",
	body="Annointed Kalasiris", --10
	hands="Kaykaus Cuffs +1", --11
	left_ring="Janniston Ring", --II +5%
	right_ring="Lebeche Ring", --3%
	back="Solemnity Cape", --7
	waist="Luminary Sash",
	legs="Chironic Hose", --8
	feet="Vanya Clogs" --5
	}
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.conservemp, {
	head="Befouled Crown",
	neck="Incanter's Torque",
	left_ear="Andoaa Earring",
	right_ear="Mimir Earring",
	body="Pedagogy Gown +3",
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	back="Fi Follet Cape +1",
	})
	
	sets.midcast.EnhancingDuration = set_combine(sets.midcast['Enhancing Magic'], {
	main={ name="Musa", priority=2,},
	sub={ name="Enki Strap", priority=1,},
	head={ name="Telchine Cap", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	--body={ name="Telchine Chasuble", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	body="Pedagogy Gown +3",
	hands={ name="Telchine Gloves", augments={'Pet: "Mag.Atk.Bns."+20','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
	waist="Embla Sash",
	legs={ name="Telchine Braconi", augments={'Pet: Evasion+16','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}},
	feet={ name="Telchine Pigaches", augments={'"Conserve MP"+3','Enh. Mag. eff. dur. +10',}},
	})
	
	sets.midcast.regen = set_combine(sets.midcast.EnhancingDuration, {
	main={ name="Musa", priority=2,},
	sub={ name="Enki Strap", priority=1,},
	head="Arbatel Bonnet +3",
	back="Bookworm's Cape",
	})
	
	sets.midcast.bar_element = set_combine(sets.midcast.EnhancingDuration, {
	})
	
	sets.midcast.shell = set_combine(sets.midcast.EnhancingDuration, {
	})
	
	sets.midcast.cursna = set_combine(sets.midcast.conservemp, {
	--main={ name="Gada", augments={'"Fast Cast"+6','Mag. Acc.+11','"Mag.Atk.Bns."+18','DMG:+3',}},
	ammo="Pemphredo Tathlum",
	head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
	neck="Debilis Medallion",
	left_ear="Beatific Earring",
	right_ear="Meili Earring",
	left_ring="Haoma's Ring",
	right_ring="Menelaus's Ring",
	waist="Bishop's Sash",
	feet="Gendewitha Galoshes +1"
	})
	
	sets.midcast.enfeeble = set_combine(sets.midcast.conservemp, {
	ammo="Hydrocera",
	head=empty,
	neck="Erra Pendant",
	left_ear="Regal Earring",
	right_ear="Vor Earring",
	body="Cohort Cloak +1",
	hands="Inyanga Dastanas +2",
	left_ring="Stikini Ring +1",
	--right_ring="Vertigo Ring",
	back="",
	waist="Luminary Sash",
	legs={ name="Chironic Hose", augments={'Mag. Acc.+13','MND+15','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
	feet=""
	})
	
	sets.midcast.enfeebleMND = set_combine(sets.midcast.enfeeble, {
	})
	
	sets.midcast.enfeebleINT = set_combine(sets.midcast.enfeeble, {
	})
	
	sets.nuke.index = {'Free'--[[,'MB']]}
	nuke_ind = 1 --Free set is the Default
	
	sets.nuke['Free'] = {
	main="Bunzi's Rod",
	sub="Ammurapi Shield",
	ammo="Ghastly Tathlum +1",
	head="Agwu's Cap",
	neck="Argute Stole +2",
	left_ear="Regal Earring",
	right_ear="Malignance Earring",
	body="Arbatel Gown +3",
	hands="Agwu's Gages",
	left_ring="Freke Ring",
	right_ring="Metamorph Ring +1",
	back="Aurist's Cape +1",
	waist="Acuity Belt +1",
	legs="Agwu's Slops",
	feet="Arbatel Loafers +3"
	}
	
	--sets.nuke['MB'] = set_combine(sets.nuke['Free'], {
	--neck="Mizukage-no-Kubikazari",
	--right_ring="Mujin Band",
	--})
	
	sets.nuke.helix = set_combine(sets.nuke['Free'], {
	head="Agwu's Cap",
	body="Agwu's Robe",
	waist="Acuity Belt +1",
	legs="Arbatel Pants +3",
	})
	
	sets.midcast.dark = set_combine(sets.midcast.conservemp, {
	neck="Erra Pendant",
	left_ring="Stikini Ring +1",
	right_ring="Evanescence Ring",
	waist="Fucho-no-Obi",
	})
	
	sets.midcast.nodmg = {
	main="Malignance Pole",
	ammo=empty,
	head=empty,
	left_ear=empty,
	right_ear=empty,
	neck=empty,
	body=empty,
	hands=empty,
	left_ring=empty,
	right_ring="Defending Ring",
	back=empty,
	waist=empty,
	legs=empty,
	feet=empty
	}

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
	--main="Vadose Rod",
	head="Amalric Coif +1",
	--hands="Regal Cuffs",
	waist="Emphatikos Rope",
	legs="Shedir Seraweels",
	})
	
	sets.buff.refresh = set_combine(sets.midcast.EnhancingDuration, {
	--feet="Inspirited Boots",
	})
	sets.sublimation = {head="Academic's Mortarboard +1",body="Pedagogy Gown +3",waist="Embla Sash"}
	sets.ja['Tabula Rasa'] = {legs="Pedagogy Pants +1"}
	
	sets.idle.index = {'Refresh','DT'}
	idle_ind = 1 --Refresh set is the Default
	
	sets.idle['Refresh'] = {
	ammo="Homiliary",
	head="Volte Beret",
	neck="Loricate Torque +1",
	left_ear="Etiolation Earring",
	right_ear="Eabani Earring",
	body="Arbatel Gown +3",
	hands="Volte Gloves",
	left_ring="Stikini Ring +1",
	right_ring="Defending Ring",
	back="Solemnity Cape",
	waist="Shinjutsu-no-obi +1",
	legs="Volte Brais",
	feet="Volte Gaiters"
	}
	
	sets.idle['DT'] = set_combine(sets.idle['Refresh'], {
	ammo="Homiliary",
	head="Nyame Helm", --7
	neck="Loricate Torque +1", --6
	left_ear="Etiolation Earring",
	right_ear="Eabani Earring",
	body="Arbatel Gown +3", --13
	hands="Nyame Gauntlets", --7
	left_ring="Stikini Ring +1",
	right_ring="Defending Ring", --10
	back="Solemnity Cape", --4
	waist="Shinjutsu-no-obi +1",
	legs="Volte Brais",
	feet="Volte Gaiters"
	})
	
	sets.TP.index = {'Melee'}
	TP_ind = 1 --Melee set is the Default
	
	sets.TP['Melee'] = {
	ammo="Oshasha's Treatise",
	head="Nyame Helm",
	neck="Combatant's Torque",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring={name="Chirich Ring +1", bag="wardrobe2"},
    right_ring={name="Chirich Ring +1", bag="wardrobe6"},
	back="Aurist's Cape +1",
	waist="Olseni Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
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
	head="Nyame Helm",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gelatinous Ring +1",
	right_ring="Defending Ring",
	waist="Platinum Moogle Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.refresh = sets.idle['Refresh']
	
---------------------------------------------------------------------------------------------------------------
----------------------------------------------- Weaponskills --------------------------------------------------
	sets.ws.common = {
	head="Nyame Helm",
	neck="Fotia Gorget",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	right_ring="Epaminondas's Ring",
	waist="Fotia Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws['Myrkr'] = {
	head="Pixie Hairpin +1",
	neck="Sanctity Necklace",
	left_ear="Etiolation Earring",
	right_ear="Gifted Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Mephitas's Ring +1",
	right_ring="Metamorph Ring +1",
	back="Fi Follet Cape +1",
	waist="Shinjutsu-no-obi +1",
	legs="Nyame Flanchard",
	}
	
	sets.ws['Aeolian Edge'] = set_combine(sets.ws.common, {
	ammo="Pemphredo Tathlum",
	neck="Sibyl Scarf",
	right_ear="Malignance Earring",
	left_ring="Freke Ring",
	waist="Orpheus's Sash",
	})
	
	sets.ws['Earth Crusher'] = sets.ws['Aeolian Edge']
	
	sets.ws['Cataclysm'] = set_combine(sets.ws['Aeolian Edge'], {
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
	if buffactive['Weakness'] and spell.name == "Sublimation" then
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
		if spell.skill == 'Healing Magic' then
			if string.find(spell.english,'Cur') and spell.english ~='Cursna' then
				weathercheck(spell.element,sets.midcast.cure)
			elseif spell.english == 'Cursna' then
				weathercheck(spell.element,sets.midcast.cursna)
			elseif NaSpells:contains(spell.name) or spell.name == 'Arise' or spell.english:contains('raise') then
				equip(sets.midcast.conservemp)
			end
		elseif sets.midcast[spell.name] then
			weathercheck(spell.element,sets.midcast[spell.name])
		elseif spell.skill == 'Elemental Magic' then
			--if ElementalWheel:contains(spell.name) then
			--	equip(sets.midcast.nodmg)
			--elseif string.find(spell.english,'helix') then
			if string.find(spell.english,'helix') then
				equip(sets.nuke.helix)
			else
				weathercheck(spell.element,sets.nuke[sets.nuke.index[nuke_ind]])
			end
			if buffactive['Klimaform'] then
				equip({feet="Arbatel Loafers +3"})
			end
			if buffactive['Ebullience'] then
				equip({head="Arbatel Bonnet +3",})
			end
		elseif spell.skill == "Enhancing Magic" and not S{'Warp','Warp II','Retrace','Teleport-Holla','Teleport-Mea','Teleport-Dem','Teleport-Altep','Teleport-Vahzl','Teleport-Yhoat','Recall-Jugner','Recall-Pashh','Recall-Meriph'}:contains(spell.english) then
			if spell.english == "Sneak" or spell.english == "Invisible" then
				equip(sets.buff.skulk)
			elseif string.find(spell.english,'Regen') then
				equip(sets.midcast.regen)
			elseif BarElements:contains(spell.name) then
				equip(sets.midcast.bar_element)
			elseif sets.buff[spell.name] then
				equip(sets.buff[spell.name])
			elseif string.find(spell.english,'Refresh') and spell.target.type == 'SELF' then
				equip(sets.buff.refresh)
			else
				equip(sets.midcast.EnhancingDuration)
			end
			if string.find(spell.english,'storm') then
				equip({feet="Pedagogy Loafers +1"})
			end
			if buffactive['Perpetuance'] then
				equip({hands="Arbatel Bracers +3"})
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
	--elseif new == 'Engaged' and player.target.distance > target_distance or new == 'Idle' then
	--	enable('main','sub','ammo')
	--	equip(sets.idle[sets.idle.index[idle_ind]])
	elseif new == 'Engaged' then
		disable('main','sub','ammo')
		equip(sets.TP[sets.TP.index[TP_ind]])
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
			equip(sets.sublimation)
		else
			if player.mpp <= 45 then
				equip({waist="Fucho-no-Obi"})
			else
				equip({wait="Shinjutsu-no-obi"})
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
		if buffactive['Klimaform'] then
			equip({feet="Arbatel Loafers +3"})
		end
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
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')
send_command('bind !w gs equip movement') -- Hit alt+w, equips movement equipment

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
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

---------------------------------- Aliases ----------------------------------

send_command('alias aoe5 input /ja "Accession" <me>;wait 1;input /ja "Perpetuance" <me>;wait 1;input /ma "Regen V" <t>')

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
set_macros(9,2)
--Use the Lockstyle Number--
--set_style(001)