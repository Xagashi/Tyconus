res = require 'resources'
Lockstyle = 18
Macro = {book = 10, sheet = 9}

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !w gs equip sets.movement')
send_command('bind !s gs c toggle weapon set') -- Hit alt+s, toggles the sets
send_command('bind !e gs c toggle ws set') -- Alt+E toggles WS power level (Low/Medium/High)
send_command('bind !r gs equip sets.regen') -- Hit alt+r, equips the set
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')
send_command('bind !p gs equip sets.tpgain')

send_command('lua l Skillchains')

-- Macro Options:
-- Specific weapons listed within "weapon_overrides", while a more broader range is listed within "weapon_aliases".
-- /console physical
--		Sets a "physical" ws based on the type of weapon you have equipped.  Caladbolg for Torcleaver, Apoc for Catastrophe, etc.
-- /console magical
--		Sets a "magical" ws based on the type of weapon you have equipped.  Normally AoE ws

function get_sets()
	sets.fc = {}
	sets.precast = {}
	sets.midcast = {}
	sets.ja = {}
	sets.ws = {}
	sets.TP = {}
	sets.weapon = {}
	
	sets.movement = {legs="Carmine Cuisses +1"}
	
	sets.af = {
		head="Ignominy Burgeonet +1",
		body="Ignominy Cuirass +4",
		hands="Ignominy Gauntlets +3",
		legs="Ignominy Flanchard +4",
		feet="Ignominy Sollerets +1"
	}
	
	sets.relic = {
		head="Fallen's Burgeonet +4",
		neck="Abyssal Bead Necklace +2",
		body="Fallen's Cuirass +4",
		hands="Fallen's Finger Gauntlets +4",
		legs="Fallen's Flanchard +4",
		feet="Fallen's Sollerets +4"
	}
	
	sets.empy = {
		head="Heathen's Burgeonet +3",
		right_ear="Heathen's Earring +2",
		body="Heathen's Cuirass +3",
		hands="Heathen's Gauntlets +3",
		legs="Heathen's Flanchards +3",
		feet="Heathen's Sollerets +3"
	}
	
	sets.su = {
		head={name="Ratri Sallet +1",priority=510},
		feet={name="Ratri Sollerets +1",priority=487},
	}
	
	sets.fc.base = { --71
	ammo="Sapience Orb", --2
	head="Carmine Mask +1", --14
	neck="Baetyl Pendant", --4
	left_ear="Malignance Earring", --4
	right_ear="Loquacious Earring", --2
	body=sets.relic.body, --10
	hands="Leyline Gloves", --5
	left_ring="Medada's Ring", --10
	right_ring="Kishar Ring", --4
	legs="Enif Cosciales", --8
	feet="Carmine Greaves +1", --8
	}
	
	sets.enmity = {
	head="Loess Barbuta +1",
	neck="Unmoving Collar +1",
	body="Emet Harness +1",
	left_ring="Petrov Ring",
	right_ring="Begrudging Ring",
	feet="Eschite Greaves"
	}
	
	sets.ja['Last Resort'] = {back="Ankou's Mantle",feet=sets.relic.feet}
	sets.ja['Souleater'] = {head=sets.af.head}
	sets.ja['Arcane Circle'] = {feet=sets.af.feet}
	sets.ja['Blood Weapon'] = {body=sets.relic.bdoy}
	sets.ja['Dark Seal'] = {head=sets.relic.head}
	sets.ja['Nether Void'] = {legs=sets.empy.legs}
	sets.ja['Weapon Bash'] = {hands=sets.af.hands}
	sets.ja['Diabolic Eye'] = {hands=sets.relic.hands}
	sets.ja['Provoke'] = sets.enmity
	
	sets.TP.index = {'Standard','DT','Sakpata'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	ammo="Coiste Bodhar",
	head="Flamma Zucchetto +2",
	neck="Vim Torque +1",
	left_ear="Dedition Earring",
	--right_ear="Schere Earring",
	right_ear=sets.empy.right_ear,
	body="Sakpata's Breastplate",
	hands="Sakpata's Gauntlets",
	left_ring="Petrov Ring",
	right_ring="Niqmaddu Ring",
	back="Null Shawl",
	--back={ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}, --5/5
	waist="Ioskeha Belt +1",
	legs=sets.af.legs,
	feet="Carmine Greaves +1"
	}
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], { --50%
	left_ear="Brutal Earring",
	left_ring="Murky Ring",
	right_ring="Moonlight Ring",
	legs="Sakpata's Cuisses", --9/9
	})
	
	sets.TP['Sakpata'] = set_combine(sets.TP['Standard'], { --50%
	ammo="Seething Bomblet +1",
	head="Sakpata's Helm",
	left_ear="Dedition Earring",
	right_ear="Schere Earring",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings"
	})
	
	sets.idle = {
	ammo="Staunch Tathlum +1",
	head="Null Masque",
	neck="Republican Platinum Medal",
	left_ear="Alabaster Earring",
	right_ear="Eabani Earring",
	body="Crepuscular Mail",
	hands="Sakpata's Gauntlets",
	left_ring={name="Chirich Ring +1", bag="wardrobe2"},
    right_ring={name="Chirich Ring +1", bag="wardrobe3"},
	waist="Null Belt",
	legs="Sakpata's Cuisses",
	feet="Nyame Sollerets"
	}
	
	sets.regen = {
	--ammo="Staunch Tathlum +1",
	head="Null Masque",
	neck="Sanctity Necklace",
	body="Sacro Breastplate", --13/0
	left_ring={name="Chirich Ring +1", bag="wardrobe2"},
    right_ring={name="Chirich Ring +1", bag="wardrobe3"},
	}
	
	sets.ws_modes = {'Medium','High'} -- can expand to {'Low','Medium','High'} if desired
	ws_mode_ind = 1 -- default is Medium
	
	sets.ws.common = {
	ammo="Knobkierrie",
	head="Nyame Helm",
	neck=sets.relic.neck,
	left_ear="Ishvara Earring",
	right_ear="Thrud Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Epaminondas's Ring",
	right_ring="Niqmaddu Ring",
	back={ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
	waist="Sailfi Belt +1",
	legs="Nyame Flanchard",
	feet=sets.empy.feet
	}
	
	sets.ws['Catastrophe'] = set_combine(sets.ws.common, {})
	
	sets.ws['Catastrophe'].High = set_combine(sets.ws['Catastrophe'], {
	head=sets.empy.head,
	left_ear="Thrud Earring",
	right_ear=sets.empy.right_ear,
	right_ring="Sroda Ring",
	waist="Fotia Belt",
	})
	
	sets.ws['Cross Reaper'] = set_combine(sets.ws.common, {
	head=sets.su.head,
	left_ring="Regal Ring",
	})
	
	sets.ws['Cross Reaper'].High = set_combine(sets.ws['Cross Reaper'], {
	head=sets.empy.head,
	right_ear=sets.empy.right_ear,
	left_ring="Epaminondas's Ring",
	right_ring="Sroda Ring",
	})
	
	sets.ws['Entropy'] = set_combine(sets.ws.common, {
	head=sets.empy.head,
	neck="Fotia Gorget",
	right_ear=sets.empy.right_ear,
	left_ring="Metamorph Ring +1",
	waist="Fotia Belt",
	feet="Nyame Sollerets"
	})
	
	sets.ws['Entropy'].High = set_combine(sets.ws['Entropy'], {
	neck=sets.relic.neck,
	body="Sakpata's Plate",
	hands="Sakpata's Gauntlets",
	legs="Sakpata's Cuisses",
	})
	
	sets.ws['Torcleaver'] = set_combine(sets.ws.common, {
	body=sets.af.body,
	left_ring="Regal Ring",
	legs=sets.relic.legs,
	})
	
	sets.ws['Torcleaver'].High = set_combine(sets.ws['Torcleaver'], {
	head=sets.empy.head,
	right_ear=sets.empy.right_ear,
	body="Nyame Mail",
	left_ring="Epaminondas's Ring",
	right_ring="Sroda Ring",
	waist="Fotia Belt",
	})
	
	sets.ws['Resolution'] = set_combine(sets.ws.common, {
	head=sets.empy.head,
	right_ear=sets.empy.right_ear,
	hands="Sakpata's Gauntlets",
	left_ring="Sroda Ring",
	waist="Fotia Belt",
	})
	
	sets.ws['Resolution'].High = set_combine(sets.ws['Resolution'], {
	body="Sakpata's Plate",
	legs="Sakpata's Cuisses",
	feet="Sakpata's Leggings"
	})
	
	sets.ws['Judgment'] = set_combine(sets.ws.common, {
	body=sets.af.body,
	right_ring="Regal Ring",
	})
	
	sets.ws['Judgment'].High = set_combine(sets.ws['Judgment'], {
	right_ear=sets.empy.right_ear,
	right_ring="Sroda Ring",
	})
	
	sets.ws['Aeolian Edge'] = set_combine(sets.ws.common, {
	ammo="Ghastly Tathlum +1",
	right_ear="Friomisi Earring",
	right_ring="Medada's Ring",
	waist="Orpheus's Sash",
	})
	
	sets.weapon.index = {'Scythe',--[['Great Sword',]]'Sword','Club',--[['Great Axe']]}
	weapon_ind = 1 --GS set is the Default
	
	sets.weapon['Scythe'] = {
	main={name="Apocalypse",priority=2,},
	sub={name="Utu Grip",priority=1,},
	}
	
	sets.weapon['Great Sword'] = {
	main={name="Montante +1",priority=2,},
	sub={name="Utu Grip",priority=1,},
	}
	
	sets.weapon['Sword'] = {
	main="Naegling",
	sub="Blurred Shield +1",
	}
	
	sets.weapon['Club'] = {
	main="Loxotic Mace +1",
	sub="Blurred Shield +1",
	}
	
	sets.weapon['Great Axe'] = {
	main={name="Lycurgos",priority=2,},
	sub={name="Utu Grip",priority=1,},
	}
	
	sets.midcast['Dark Magic'] = {
	head=sets.af.head,
	neck="Incanter's Torque",
	body="Carmine Scale Mail +1",
	hands=sets.relic.hands,
	left_ring="Evanescence Ring",
	right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	back="Niht Mantle",
	legs=sets.empy.legs,
	feet=sets.su.feet
	}
	
	sets.midcast.spikes = set_combine(sets.midcast['Dark Magic'], {
	head=sets.su.head,
	neck={name="Unmoving Collar +1",priority=200},
	left_ear="Alabaster Earring",
	right_ear="Tuisto Earring",
	body=sets.empy.body,
	left_ring={name="Gelatinous Ring +1",priority=110}, --110
	right_ring={name="Moonlight Ring",priority=110}, --110
	waist={name="Platinum Moogle Belt",priority=300},
	feet=sets.su.feet
	})
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
	head="Pixie Hairpin +1",
	neck="Erra Pendant",
	left_ear="Hirudinea Earring",
	right_ear=sets.empy.right_ear,
	right_ring="Archon Ring",
	waist="Austerity Belt +1",
	})
	
	sets.midcast.absorb = set_combine(sets.midcast['Dark Magic'], {
	right_ring="Kishar Ring",
	})
	
	sets.low_hp = {
	}
	
	sets.high_hp = sets.midcast.spikes
end

busy = false

function precast(spell)
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local ja_recasts = windower.ffxi.get_ability_recasts()
	busy = true
	if buffactive['Stun'] or buffactive['Petrify'] or buffactive['Terror'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) or (spell.recast_id and spell_recasts[spell.recast_id] and spell_recasts[spell.recast_id] > 0) or (spell.type == "JobAbility" and spell.recast_id and ja_recasts[spell.recast_id] and ja_recasts[spell.recast_id] > 0) then
		cancel_spell()
		return
	elseif (sets.ja[spell.english]) then
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
		elseif player.tp > 1000 then
			if sets.ws[spell.name] then
				local mode = sets.ws_modes[ws_mode_ind]
				if sets.ws[spell.name][mode] then
					equip(sets.ws[spell.name][mode])
				else
					equip(sets.ws[spell.name])
				end
			else
				equip(sets.ws.common)
			end
			if player.equipment.main == "Anguta" then
				if (player.tp >= 1000 and player.tp < 2500) or buffactive['Sekkanoki'] then
					equip({left_ear="Moonshade Earring"})
				else
					equip({left_ear="Ishvara Earring"})
				end
			else
				if (player.tp >= 1000 and player.tp < 3000) or buffactive['Sekkanoki'] and not (spell.name == "Entropy" or spell.name == "Catastrophe") then
					equip({left_ear="Moonshade Earring"})
				elseif world.time >= (17*60) or world.time <= (7*60) then
					equip({left_ear="Lugra Earring +1"})
				else
					equip({left_ear="Ishvara Earring"})
				end
			end
		end
	elseif spell.action_type  == "Magic" then
        equip(sets.fc.base)
	end
end

function midcast(spell)
    if spell.action_type == 'Magic' and not spell.type:contains('Trust') then
        if spell.skill == 'Dark Magic' then
            if spell.english:contains('Drain') or spell.english:contains('Aspir') then 
				equip(sets.midcast.Drain)
			elseif spell.name == 'Dread Spikes' then
				equip(sets.midcast.spikes)
			else
				equip(sets.midcast['Dark Magic'])
            end
			--if string.find(spell.english,'Absorb') and spell.english ~= 'Absorb-TP' then
			--	equip({head=sets.ja['Souleater'].head})
			--end
			if buffactive["Nether Void"] then
				equip({legs=sets.ja['Nether Void'].legs})
			end
			if buffactive["Dark Seal"] then
				equip({head=sets.ja['Dark Seal'].head})
			end
        elseif spell.type == "Item" then
            return
        else
            equip(sets.midcast.conservemp)
        end
    end
    if (spell.name == 'Sneak' or spell.english == 'Spectral Jig') and spell.target.name == player.name and buffactive["Sneak"] then
        send_command('cancel Sneak')
    elseif string.find(spell.english,'Utsusemi') and buffactive["Copy Image"] then
        send_command('@wait 1;cancel 66;')
    end
end

function aftercast(spell)
    if player.status == "Engaged" then
        equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive["Last Resort"] then
			equip({feet=sets.ja['Last Resort'].feet})
		end
    else
        equip(sets.idle)
    end
	busy = false
end

function status_change(new,old)
    if new == 'Idle' then
        equip(sets.idle)
    elseif new == 'Engaged' then
        equip(sets.TP[sets.TP.index[TP_ind]])
		if buffactive["Last Resort"] then
			equip({feet=sets.ja['Last Resort'].feet})
		end
    end
end

runspeed = false

local last_x, last_y, last_z = nil, nil, nil
local last_move_time = 0
local last_stop_time = 0
local MOVE_DELAY = 0.1

function is_moving()
    local me = windower.ffxi.get_mob_by_id(player.id)
    if not me then return false end

    local moving = false
    if last_x and (me.x ~= last_x or me.y ~= last_y or me.z ~= last_z) then
        moving = true
    end

    last_x, last_y, last_z = me.x, me.y, me.z
    return moving
end

function updateRunspeedGear()
    if midaction() or player.status == 'Event' then
        return
    end

    local now = os.clock()
    local moving = is_moving()

    if moving then
        last_move_time = now
        if not runspeed and (now - last_stop_time) > MOVE_DELAY then
            runspeed = true
            equip(sets.movement)
            --windower.add_to_chat(8, "Movement detected: Equipping runspeed gear.")
        end
    else
        last_stop_time = now
        if runspeed and (now - last_move_time) > MOVE_DELAY then
            runspeed = false
            if player.status == "Engaged" then
                equip(sets.TP[sets.TP.index[TP_ind]])
				if buffactive["Last Resort"] then
					equip({feet=sets.ja['Last Resort'].feet})
				end
            else
                equip(sets.idle)
            end
            --windower.add_to_chat(8, "Idle detected: Equipping idle set.")
        end
    end
end

function buff_change(n, gain, buff_table)
	local name
	name = string.lower(n)
	if S{"doom"}:contains(name) then
		if gain then
			send_command('@input /p Cursna - Doomed')
		else
			send_command('@input /p Doom - Off')
		end
	--elseif S{"silence"}:contains(name) then
    --    if gain then
	--		EchoDropsCheck = player.inventory['Echo Drops']
	--		RemedyCheck = player.inventory['Remedy']
	--		
	--		if EchoDropsCheck then
	--			send_command('@input /item "Echo Drops" <me>')
	--		elseif RemedyCheck then
	--			send_command('@input /item "Remedy" <me>')
	--		end
	--	end
	elseif S{"hasso"}:contains(name) then
		if not gain then
			if player.status == "Engaged" and not buffactive['Seigan'] then
				send_command('@input /ja "Hasso" <me>')
			end
		end
	elseif S{"seigan"}:contains(name) then
		if not gain then
			if player.status == "Engaged" and not buffactive['Hasso'] then
				send_command('@input /ja "Seigan" <me>')
			end
		end
	end
end

weapon_overrides = {
	["Apocalypse"] = {
		physical  = "Catastrophe",
	},
	["Foenaria"] = {
		physical = "Origin",
	},
	["Anguta"] = {
		physical = "Entropy",
	},
	["Redemption"] = {
		physical = "Quietus",
	},
	["Liberator"] = {
		physical = "Insurgency",
	},
	["Helheim"] = {
		physical = "Fimbulvetr",
	},
	["Ragnarok"] = {
		physical = "Scourge",
	},
}

weapon_aliases = {
	["Hand-to-Hand"] = {
		physical = "Asuran Fists",
		magical  = "Asuran Fists"
	},
	["Dagger"] = {
		physical = "Evisceration",
		magical  = "Aeolian Edge"
	},
	["Sword"] = {
		physical = "Savage Blade",
		magical  = "Sanguine Blade"
	},
	["Great Sword"] = {
		physical = "Resolution",
		magical  = "Shockwave"
	},
	["Axe"] = {
		physical = "Rampage",
		magical  = "Decimation"
	},
	["Great Axe"] = {
		physical = "Steel Cyclone",
		magical  = "Fell Cleave"
	},
	["Scythe"] = {
		physical = "Cross Reaper",
		magical  = "Spinning Scythe"
	},
	["Club"] = {
		physical = "Judgment",
		magical  = "Flash Nova"
	},
}

function get_main_hand_weapon_type()
	local main_weapon = player.equipment.main
	if not main_weapon then return nil end
	
	local item = res.items:with('name', main_weapon)
	if item and item.skill then
		local skill_to_type = {
			[1]  = "Hand-to-Hand",
			[2]  = "Dagger",
			[3]  = "Sword",
			[4]  = "Great Sword",
			[5]  = "Axe",
			[6]  = "Great Axe",
			[7]  = "Scythe",
			[8]  = "Polearm",
			[9]  = "Katana",
			[10] = "Great Katana",
			[11] = "Club",
			[12] = "Staff",
			[13] = "Archery",
			[14] = "Marksmanship",
		}
		return skill_to_type[item.skill]
	end
	return nil
end

function set_weapon_skill_aliases()
	local weapon_type = get_main_hand_weapon_type()
	local main_weapon = player.equipment.main
	
	local ws_set = {}
	local used_override = false
	
	-- Start with type defaults
	if weapon_type and weapon_aliases[weapon_type] then
		ws_set = table.copy(weapon_aliases[weapon_type]) -- make a copy
	end
	
	-- Apply weapon-specific overrides on top
	if main_weapon and weapon_overrides[main_weapon] then
		for k,v in pairs(weapon_overrides[main_weapon]) do
			ws_set[k] = v
		end
		used_override = true
	end
	
	if ws_set.physical or ws_set.magical then
		physical_ws = ws_set.physical
		magical_ws  = ws_set.magical
		if physical_ws then send_command('alias physical input /ws "'..physical_ws..'" <t>') end
		if magical_ws then send_command('alias magical input /ws "'..magical_ws..'" <t>') end
	
		--if used_override then
		--	windower.add_to_chat(8, "WS aliases set by weapon: "..main_weapon.." (with type fallback)")
		--else
		--	windower.add_to_chat(8, "WS aliases set by type: "..(weapon_type or "Unknown"))
		--end
	else
		physical_ws = nil
		magical_ws = nil
		windower.add_to_chat(123, "Unknown or unsupported weapon/weapon type.")
	end
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind % #sets.TP.index + 1
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle weapon set' then
		weapon_ind = weapon_ind % #sets.weapon.index + 1
		equip(sets.weapon[sets.weapon.index[weapon_ind]])
	elseif command == 'toggle ws set' then
		ws_mode_ind = ws_mode_ind % #sets.ws_modes + 1
		windower.add_to_chat(8, 'WS Mode: '..sets.ws_modes[ws_mode_ind])
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
	
	send_command('lua u Skillchains')
end

last_main_weapon = nil

windower.register_event('prerender', function()
    local current_weapon = player.equipment.main
    if current_weapon ~= last_main_weapon then
        last_main_weapon = current_weapon
        set_weapon_skill_aliases()
    end
	if player.status == "Idle" then
		updateRunspeedGear()
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
 
function set_style(Lockstyle)
	send_command('@input ;wait 5.0;input /lockstyleset '..Lockstyle)
	add_to_chat (55, 'You are on '..tostring(player.main_job_full):color(5)..''..('. '):color(55)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(Macro.sheet, Macro.book)
--Use the Lockstyle Number--
set_style(Lockstyle)