res = require 'resources'

--Shinjin Spiral > Asuran Fists > Victory Smite > Shinjin Spiral

function get_sets()
	sets.fc = {}
	sets.ja = {}
	sets.ws = {}
	sets.TP = {}
	sets.misc = {}
	
---------------------------------------------------------------------------------------------------------------
------------------------------------------------ Gear Sets ----------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.fc.base = {
	ammo="Sapience Orb",
	left_ear="Loquac. Earring",
	right_ear="Etiolation Earring",
	hands="Leyline Gloves",
	}
	
	sets.fc.utsusemi = set_combine(sets.fc.base, {
	neck="Magoraga Beads",
	body="Passion Jacket",
	})
	
	sets.TP.index = {'Standard','DT','MDT'--[['High Acc','DT']]}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	ammo="Coiste Bodhar",
	head="Adhemar Bonnet +1",
	neck="Combatant's Torque",
	left_ear="Sherida Earring",
	--right_ear="Schere Earring",
	right_ear="Mache Earring +1",
	body="Tatenashi Haramaki +1",
	hands="Adhemar Wristbands +1",
	left_ring="Gere Ring",
	right_ring="Niqmaddu Ring",
	back="Relucent Cape",
	waist="Moonbow Belt +1",
	legs="Tatenashi Haidate +1",
	feet="Tatenashi Sune-Ate +1"
	}
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], {
	head="Mpaca's Cap",
	body="Mpaca's Doublet",
	hands="Mpaca's Gloves",
	left_ring="Gere Ring",
	right_ring="Niqmaddu Ring",
	waist="Moonbow Belt +1",
	legs="Mpaca's Hose",
	feet="Mpaca's Boots"
	})
	
	sets.TP['MDT'] = set_combine(sets.TP['Standard'], {
	ammo="Aurgelmir Orb +1",
	head="Kendatsuba Jinpachi +1",
	body="Kendatsuba Samue +1",
	back="Agema Cape",
	legs="Kendatsuba Hakama +1",
	feet="Kendatsuba Sune-Ate +1",
	})
	
	sets.enmity = {
	ammo="Sapience Orb",
	neck="Unmoving Collar +1",
	left_ear="Cryptic Earring",
	right_ear="Friomisi Earring",
	right_ring="Begrudging Ring",
	back="Reiki cloak",
	}
	
---------------------------------------------------------------------------------------------------------------
---------------------------------------------- Job Abilities --------------------------------------------------
---------------------------------------------------------------------------------------------------------------
	
	--sets.ja['Focus'] = {head="Temple Crown"}
	--sets.ja['Dodge'] = {feet="Anchorite's Gaiters +3"}
	--sets.ja['Footwork'] = {feet="Shukuyu Sune-Ate"}
	--sets.ja['Hundred Fists'] = {legs="Hesychast's Hose +3"}
	--sets.ja['Invigorate'] = {hands="Hesychast's Gloves +2"}
	--sets.ja['Formless Strikes'] = {body="Hesychast's Cyclas +3"}
	--sets.ja['Mantra'] = {feet="Hesychast's Gaiters"}
	--sets.ja['Boost'] = {hands="Anchorite's gloves"}
	--sets.ja['Counterstance'] = {feet="Hesychast's Gaiters"}
	--sets.ja['Provoke'] = sets.enmity
	--sets.ja['Warcry'] = sets.enmity
	--sets.ja.waltz = {waist="Gishdubar Sash",}
	--
	--sets.ja['Chakra'] = {
	--ammo="Aurgelmir Orb",
	--head="Ken. Jinpachi +1",
	--body="Anch. Cyclas +2",
	--hands={ name="Hes. Gloves +1", augments={'Enhances "Invigorate" effect',}},
	--legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
	--feet={ name="Tatena. Sune. +1", augments={'Path: A',}},
	--neck={ name="Unmoving Collar +1", augments={'Path: A',}},
	--waist="Moonbow Belt +1",
	--left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
	--right_ear="Tuisto Earring",
	--left_ring="Regal Ring",
	--right_ring="Niqmaddu Ring",
	--back={ name="Segomo's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%',}},
	--}
	--
	--sets.ja['Chi Blast'] = {
	--ammo="Coiste Bodhar",
	--head={ name="Hes. Crown", augments={'Enhances "Penance" effect',}},
	--neck="Asperity Necklace",
	--left_ear="Sherida earring",
	--right_ear="Telos Earring",
	--body="Malignance Tabard",
	--hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
	--left_ring="Rajas Ring",
	--right_ring="Niqmaddu ring",
	--back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	--waist="Moonbow Belt +1",
	--legs={ name="Rawhide Trousers", augments={'MP+50','"Fast Cast"+5','"Refresh"+1',}},
	--feet="Shukuyu Sune-Ate"
	--}
	
---------------------------------------------------------------------------------------------------------------
----------------------------------------------- Weaponskills --------------------------------------------------
---------------------------------------------------------------------------------------------------------------

	sets.ws["Shijin Spiral"] = { --Fotia Neck + % Hit
	ammo="Knobkierrie",
	head="Ken. Jinpachi +1",
	neck="Fotia Gorget",
	right_ear="Mache Earring +1",
	left_ear="Sherida earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Gere Ring",
	right_ring="Niqmaddu Ring",
	--back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	waist="Moonbow Belt +1",
	legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
	feet="Tatenashi Sune-Ate +1"
	}
	
	sets.ws["Victory Smite"] = { --Fotia Neck + Crit
	ammo="Knobkierrie",
	head="Ken. Jinpachi +1",
	neck="Fotia Gorget",
	right_ear="Odr Earring",
	left_ear="Sherida earring",
	body="Ken. Samue +1",
	hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	left_ring="Gere Ring",
	right_ring="Niqmaddu Ring",
	waist="Moonbow Belt +1",
	legs="Ken. Hakama +1",
	feet="Nyame Sollerets"
	}
	
	--sets.ws["Tornado Kick"] = { --WSD + Kick DMG
	--ammo="Knobkierrie",
	--head="Mpaca's Cap",
	--neck="Mnk. Nodowa +2",
	--left_ear="Sherida earring",
	--body={ name="Tatena. Harama. +1", augments={'Path: A',}},
	--hands={ name="Herculean Gloves", augments={'Accuracy+20','"Triple Atk."+3','STR+10',}},
	--left_ring="Regal Ring",
	--right_ring="Niqmaddu ring",
	--back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	--waist="Moonbow Belt +1",
	--legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
	--feet="Anch. Gaiters +3"
	--}
	
	sets.ws["Asuran Fists"] = {
	ammo="Knobkierrie",
	head="Adhemar Bonnet +1",
	neck="Fotia Gorget",
	left_ear="Sherida earring",
	right_ear="Telos Earring",
	body="Malignance Tabard",
	hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
	left_ring="Regal Ring",
	right_ring="Niqmaddu ring",
	--back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
	waist="Moonbow Belt +1",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws["Howling Fist"] = {
	ammo="Knobkierrie",
	head="Mpaca's Cap",
	neck="Fotia Gorget",
	left_ear="Sherida earring",
	body="Tatena. Harama. +1",
	left_ring="Gere Ring",
	right_ring="Niqmaddu Ring",
	waist="Fotia Belt",
	legs="Tatena. Haidate +1",
	feet="Tatenashi Sune-ate +1"
	}
	
	--sets.ws["Raging Fists"] = { --30% STR / 30% DEX
	--ammo="Knobkierrie",
	--head="Ken. Jinpachi +1",
	--neck="Mnk. Nodowa +2",
	--left_ear="Sherida earring",
	--body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
	--hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
	--left_ring="Gere Ring",
	--right_ring="Niqmaddu Ring",
	--back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	--waist="Moonbow Belt +1",
	--legs={ name="Tatena. Haidate +1", augments={'Path: A',}},
	--feet={ name="Herculean Boots", augments={'Accuracy+26','"Triple Atk."+4','STR+2',}}
	--}
	--
	--sets.ws["Ascetic's Fury"] = sets.ws["Victory Smite"]  --STR 50% VIT 50%  Fotia Neck + Crit
	--sets.ws["Shoulder Tackle"] = sets.ws["Howling Fist"]  --VIT 100%
	--sets.ws["One Inch Punch"] = sets.ws["Howling Fist"]  --VIT 100%
	--sets.ws["Spinning Attack"] = sets.ws["Asuran Fists"]  --STR 100%
	--sets.ws["Dragon Kick"] = sets.ws["Tornado Kick"]
	--
	sets.ws["Cataclysm"] = {
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	neck="Sibyl Scarf",
	right_ear="Friomisi Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Regal Ring",
	right_ring="Archon ring",
	waist="Orpheus's Sash",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
---------------------------------------------------------------------------------------------------------------
--------------------------------------------------- Misc ------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
	
	sets.movement = {feet="Herald's Gaiters"}
	
	sets.low_hp = {
	head=empty,
	neck=empty,
	left_ear=empty,
	right_ear=empty,
	body=empty,
	hands=empty,
	left_ring=empty,
	right_ring=empty,
	back=empty,
	waist=empty,
	legs=empty,
	feet=empty,
	}
	
	sets.high_hp = {
	head="Nyame Helm",
	neck="Unmoving Collar",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gelatinous Ring +1",
	right_ring="Ilabrat Ring",
	back="Reiki Cloak",
	waist="Platinum Moogle Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	--sets.Phalanx = {
	--ammo="Staunch Tathlum +1",
	--body={ name="Taeon Tabard", augments={'"Fast Cast"+5','Phalanx +3',}},
	--hands={ name="Taeon Gloves", augments={'Spell interruption rate down -9%','Phalanx +3',}},
	--legs={ name="Taeon Tights", augments={'Spell interruption rate down -8%','Phalanx +3',}},
	--feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','Phalanx +3',}},
	--neck="Incanter's Torque",
	--waist="Olympus Sash",
	--left_ear="Mimir Earring",
	--right_ear="Andoaa Earring",
	--left_ring="Stikini Ring",
	--right_ring="Stikini Ring",
	--back="Merciful Cape",
	--}
	--
	--sets.misc.rest = {}
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
			if player.equipment.main == "Godhands" and (spell.name == "Tornado Kick" or spell.name == "Howling Fist" or spell.name == "Raging Fists") then
                if player.tp >= 1000 and player.tp < 2050 then
                    equip({head="Mpaca's Cap",right_ear="Moonshade Earring"})
                elseif player.tp >= 1250 and player.tp < 2500 then
                    equip({right_ear="Moonshade Earring",})
                else
                    equip({right_ear="Schere Earring"})
                end
            else
                if player.tp >= 1000 and player.tp < 2550 then
                    equip({head="Mpaca's Cap",right_ear="Moonshade Earring"})
                elseif player.tp >= 2550 and player.tp < 3000 then
                    equip({right_ear="Moonshade Earring",})
                else
                    equip({right_ear="Schere Earring"})
                end
            end
			
			if sets.ws[spell.name] then
				equip(sets.ws[spell.name])
				if spell.name == "Victory Smite" and buffactive['Impetus'] then
                    equip({body="Bhikku Cyclas +1",})
				end
			else
				equip(sets.ws.common)
			end
		end
	elseif spell.action_type == 'Magic' then
		if spell.english:contains('Utsusemi') then
			equip(sets.fc.utsusemi)
		else
			equip(sets.fc.base)
		end
	end
end

function midcast(spell)
	if (spell.name == 'Sneak' or spell.english == 'Spectral Jig' or spell.english:contains('Monomi')) and spell.target.name == player.name and buffactive["Sneak"] then
		send_command('cancel Sneak')
	elseif spell.english:contains('Utsusemi') and buffactive["Copy Image"] then
		windower.send_command('wait 1;cancel 66;')
	end
end

function aftercast(spell)
	if player.status == "Engaged" then
		--if buffactive['Impetus'] and buffactive['Footwork'] then
		--	equip(sets.impetus,sets.footwork)
		--elseif buffactive['Impetus'] then
		--	equip(sets.TP[sets.TP.index[TP_ind]],sets.impetus)
		--elseif buffactive['Footwork'] then
		--	equip(sets.TP[sets.TP.index[TP_ind]],sets.footwork)
		--else
			equip(sets.TP[sets.TP.index[TP_ind]])
		--end
	elseif player.status == "Idle" then
		equip(sets.idle)
	end
end

function status_change(new,old)
	if new == "Idle" then
		equip(sets.idle)
	elseif new == 'Engaged' then
		--if buffactive['Impetus'] and buffactive['Footwork'] then
		--	equip(sets.impetus,sets.footwork)
		--elseif buffactive['Impetus'] then
		--	equip(sets.impetus)
		--elseif buffactive['Footwork'] then
		--	equip(sets.footwork)
		--else
			equip(sets.TP[sets.TP.index[TP_ind]])
		--end
	elseif new == 'Rest' then
		equip(sets.misc.rest)
	end
end

--function buff_change(n, gain, buff_table)
--	local name
--	name = string.lower(n)
--	if S{"impetus"}:contains(name) then
--		if gain then
--			if player.status == "Idle" then
--				equip(sets.idle)
--			elseif player.status == "Engaged" then
--				equip(sets.impetus)
--				if buffactive['Footwork'] then
--					equip(sets.footwork)
--				end
--			end
--		else
--			if player.status == "Idle" then
--				equip(sets.idle)
--			elseif player.status == "Engaged" then
--				equip(sets.TP[sets.TP.index[TP_ind]])
--				if buffactive['Footwork'] then
--					equip(sets.footwork)
--				end
--			end
--		end
--	elseif S{"footwork"}:contains(name) then
--		if gain then
--			if player.status == "Idle" then
--				equip(sets.idle)
--			elseif player.status == "Engaged" then
--				if buffactive['Impetus'] then
--					equip(sets.impetus)
--				end
--				equip(sets.footwork)
--			end
--		else
--			if player.status == "Idle" then
--				equip(sets.idle)
--			elseif player.status == "Engaged" then
--				if buffactive['Impetus'] then
--					equip(sets.impetus)
--				else
--					equip(sets.TP[sets.TP.index[TP_ind]])
--				end
--			end
--		end
--	end
--end

function self_command(command)
    if command == 'toggle TP set' then
        TP_ind = TP_ind +1
        if TP_ind > #sets.TP.index then TP_ind = 1 end
        windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
        equip(sets.TP[sets.TP.index[TP_ind]])
        if player.status == "Engaged" then
            if buffactive['Impetus'] then
                equip(sets.impetus)
            end
            if buffactive['Footwork'] then
                equip(sets.footwork)
            end
        end
    elseif command == 'reverse TP set' then
        TP_ind = TP_ind -1
        if TP_ind == 0 then TP_ind = #sets.TP.index end
        windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
        equip(sets.TP[sets.TP.index[TP_ind]])
        if player.status == "Engaged" then
            if buffactive['Impetus'] then
                equip(sets.impetus)
            end
            if buffactive['Footwork'] then
                equip(sets.footwork)
            end
        end
    end
    if command == 'toggle DEF set' then
        DEF_ind = DEF_ind +1
        if DEF_ind > #sets.DEF.index then DEF_ind = 1 end
        windower.add_to_chat(1,'<----- DEF Set changed to '..sets.DEF.index[DEF_ind]..' ----->')
        equip(sets.DEF[sets.DEF.index[DEF_ind]])
    elseif command == 'reverse DEF set' then
        DEF_ind = DEF_ind -1
        if DEF_ind == 0 then DEF_ind = #sets.DEF.index end
        windower.add_to_chat(1,'<----- DEF Set changed to '..sets.DEF.index[DEF_ind]..' ----->')
        equip(sets.DEF[sets.DEF.index[DEF_ind]])
    end
end

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !e gs c toggle DEF set') -- Hit alt+e, toggles the sets
send_command('alias 500hp gs equip low_hp;wait 1; gs equip high_hp')
send_command('bind !w gs equip movement') -- Hit alt+w, equips movement equipment

function file_unload()
    send_command('unbind !q')
	send_command('unbind !e')
	send_command('unbind !u')
end

windower.register_event('zone change',function()
	if world.area:contains("Dynamis") and player.name == "Drakelth" then
		send_command('lua l treasury')
	elseif world.area:contains("Reisenjima Henge") and player.name == "Drakelth" then
		send_command('lua u treasury')
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
    add_to_chat (55, 'You are on '..('Monk '):color(5)..''..('btw. '):color(55)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(2,1)
--Use the Lockstyle Number--
set_style(002)