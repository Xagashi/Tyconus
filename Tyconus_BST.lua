res = require 'resources'
require('vectors')
send_command('lua l BST-HUD')
send_command('lua l Skillchains')

pet_ready_map = {
    ['fatsofargann'] = 'TP Drainkiss',
    ['generousarthur'] = 'Purulent Ooze',
}

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
	sets.mode = {}
	sets.midcast.Pet = {}
	
	sets.fc.base = {
	ammo="Sapience Orb",
	head="Carmine Mask +1",
	neck="Baetyl Pendant",
	left_ear="Etiolation Earring",
	right_ear="Loquacious Earring",
	hands="Leyline Gloves",
	legs="Enif Cosciales",
	}
	
	sets.TP.index = {'Standard'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	ammo="Coiste Bodhar",
	head="Malignance Chapeau",
	neck="Anu Torque",
	left_ear="Sherida Earring",
	right_ear="Dedition Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Gere Ring",
	right_ring="Epona's Ring",
	back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	waist="Sailfi Belt +1",
	legs="Malignance Tights",
	feet="Malignance Boots"
	}
	
	sets.TP['Acc'] = set_combine(sets.TP['Standard'], {})
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], {
	right_ring="Moonlight Ring",
	})
	
	sets.idle = {
	ammo="Staunch Tathlum +1",
	--head="Gleti's Mask",
	--neck="Republican Platinum Medal",
	left_ear="Enmerkar Earring",
	--right_ear="Infused Earring",
	--body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	--left_ring="Warp Ring",
	--right_ring="Moonlight Ring",
	back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	waist="Platinum Moogle Belt",
	--legs="Gleti's Breeches",
	feet="Gleti's Boots",
	
	head="Null Masque",
	neck="Loricate Torque +1",
	right_ear="Nukumi Earring +1",
	body="Totemic Jackcoat +3",
	left_ring="Murky Ring",
	right_ring="Shadow Ring",
	legs="Nukumi Quijotes +3",
	}
	
	sets.WEAPON.index = {'Axe','Sword'}
	WEAPON_ind = 1 --Axe set is the Default
	
	sets.WEAPON['Axe'] = {
	main="Dolichenus",
	}
	
	sets.WEAPON['Sword'] = {
	main="Naegling",
	}
	
	sets.ja['Call Beast'] = {hands="Ankusa Gloves +4"}
	sets.ja['Bestial Loyalty'] = sets.ja['Call Beast']
	sets.ja['Killer Instinct'] = {head="Ankusa Helm +4"}
	sets.ja['Ready'] = {legs="Gleti's Breeches"}
	sets.ja['TP Drainkiss'] = sets.ja['Ready']
	
	sets.ja['Reward'] = {
	ammo="Pet Food Theta",
	left_ear="Pratik Earring",
	body="Totemic Jackcoat +3",
	legs="Ankusa Trousers +4",
	feet="Ankusa Gaiters +4"
	}
	
	sets.ja['Charm'] = {
	head="Totemic Helm +1",
	neck="Unmoving Collar +1",
	body="Ankusa Jackcoat +4",
	hands="Ankusa Gloves +4",
	left_ring="Metamorph Ring +1",
	waist="Chaac Belt",
	legs="Ankusa Trousers +4",
	feet="Ankusa Gaiters +4"
	}
	
	sets.mode.index = {'Mid','High'}
	mode_ind = 1 --Uncapped set is the Default
	
	sets.ws.common = {
	ammo="Coiste Bodhar",
	head="Ankusa Helm +4",
	neck="Fotia Gorget",
	right_ear="Thrud Earring",
	body="Nukumi Gausape +3",
	hands="Nyame Gauntlets",
	left_ring="Gere Ring",
	right_ring="Sroda Ring",
	back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	waist="Fotia Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws['Savage Blade'] = set_combine(sets.ws.common, {
	right_ring="Regal Ring",
	--back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	})
	
	sets.ws['Calamity'] = set_combine(sets.ws['Savage Blade'], { -- Tri-edge/Ikenga's Axe
	neck="Republican Platinum Medal",
	})
	
	sets.ws['Calamity'].high = set_combine(sets.ws['Calamity'], {
	ammo="Crepuscular Pebble",
	neck="Beastmaster Collar +2",
	right_ear="Nukumi Earring +1",
	left_ring="Sroda Ring",
	right_ring="Epaminondas's Ring",
	feet="Nukumi Ocreae +3"
	})
	
	sets.ws['Decimation'] = set_combine(sets.ws.common, { -- Dolichenus/Ikenga's Axe
	left_ear="Sherida Earring",
	right_ear="Lugra Earring +1",
	waist="Sailfi Belt +1",
	feet="Nukumi Ocreae +3"
	})
	
	sets.ws['Decimation'].high = set_combine(sets.ws['Decimation'], {
	neck="Beastmaster Collar +2",
	right_ear="Nukumi Earring +1",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs="Gleti's Breeches",
	})
	
	sets.ws['Mistral Axe'] = set_combine(sets.ws.common, { -- Tri-edge/Ikenga's Axe
	neck="Republican Platinum Medal",
	--back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	})
	
	sets.ws['Mistral Axe'].high = set_combine(sets.ws['Mistral Axe'], {
	ammo="Crepuscular Pebble",
	neck="Beastmaster Collar +2",
	right_ear="Nukumi Earring +1",
	hands="Totemic Gloves +4",
	left_ring="Epaminondas's Ring",
	feet="Nukumi Ocreae +3"
	})
	
	sets.ws['Onslaught'] = set_combine(sets.ws.common, { -- Guttler/Ikenga's Axe
	neck="Beastmaster Collar +2",
	left_ear="Sherida Earring",
	right_ear="Lugra Earring +1",
	right_ring="Regal Ring",
	--back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
	waist="Sailfi Belt +1",
	})
	
	sets.ws['Onslaught'].high = set_combine(sets.ws['Onslaught'], {
	ammo="Crepuscular Pebble",
	left_ear="Lugra Earring +1",
	right_ear="Nukumi Earring +1",
	body="Gleti's Cuirass",
	hands="Totemic Gloves +4",
	right_ring="Epona's Ring",
	legs="Gleti's Breeches",
	})
	
	sets.ws['Cloudsplitter'] = set_combine(sets.ws.common, { -- Farsha/Malevolence
	ammo="Oshasha's Treatise",
	head="Nyame Helm",
	neck="Baetyl Pendant",
	right_ear="Friomisi Earring",
	body="Nyame Mail",
	--left_ring="Beithir Ring",
	right_ring="Epaminondas's Ring",
	--back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	waist="Orpheus's Sash",
	})
	
	sets.ws['Rampage'] = set_combine(sets.ws.common, { -- Aymur/Ikenga's Axe
	head="Blistering Sallet +1",
	body="Gleti's Cuirass",
	hands="Nukumi Manoplas +3",
	--back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Critical Damage +10%',}},
	legs="Gleti's Breeches",
	feet="Gleti's Boots"
	})
	
	sets.ws['Rampage'].high = set_combine(sets.ws['Rampage'], {
	ammo="Crepuscular Pebble",
	head="Gleti's Mask",
	left_ear="Thrud Earring",
	right_ear="Nukumi Earring +1",
	feet="Nukumi Ocreae +3"
	})
	
	sets.ws['Ruinator'] = set_combine(sets.ws.common, { -- Tri-edge/Ikenga's Axe
	left_ear="Lugra Earring +1",
	feet="Nukumi Ocreae +3"
	})
	
	sets.ws['Ruinator'].high = set_combine(sets.ws['Ruinator'], {
	ammo="Crepuscular Pebble",
	neck="Beastmaster Collar +2",
	left_ear="Thrud Earring",
	right_ear="Nukumi Earring +1",
	body="Gleti's Cuirass",
	hands="Gleti's Gauntlets",
	legs="Gleti's Breeches",
	})
	
	sets.ws["Aeolian Edge"] = sets.ws['Cloudsplitter']
	
	sets.low_hp = {
	head="Pixie Hairpin +1",
	neck=empty,
	left_ear=empty,
	right_ear=empty,
	body=empty,
	hands=empty,
	left_ring="Mephitas's Ring +1",
	right_ring="Metamorph Ring +1",
	legs=empty,
	feet=empty
	}
	
	sets.high_hp = {
	head="Null Masque",
	neck="Unmoving Collar +1",
	left_ear="Tuisto Earring",
	right_ear="Odnowa Earring +1",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Gelatinous Ring +1",
	right_ring="Ilabrat Ring",
	waist="Platinum Moogle Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.reraise = {
	head="Crepuscular Helm",
	body="Crepuscular Mail",
	}
	
	sets.regen = {
	head="Null Masque",
	neck="Sanctity Necklace",
	--neck="Bathy Choker +1",
	right_ear="Infused Earring",
	left_ring={name="Chirich Ring +1", bag="wardrobe2"},
    right_ring={name="Chirich Ring +1", bag="wardrobe3"},
	}
	
	sets.refresh = {
	head="Null Masque",
	body="Crepuscular Mail",
	left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
	}
	
	sets.phalanx = {
	head="Valorous Mask",
	body="Valorous Mail",
	legs={name="Valorous Hose", bag="wardrobe2"},
	}
	
	sets.enmity = {
	neck="Unmoving Collar +1",
	left_ear="Cryptic Earring",
	right_ear="Friomisi Earring",
	body="Emet Harness +1",
	left_ring="Petrov Ring",
	right_ring="Begrudging Ring",
	waist="Chaac Belt",
	}
	
	-- Pet Magic Attack Ready Moves
	sets.midcast.Pet.MagicAtkReady = {
	ammo="Hesperiidae",
	head="Nuk. Cabasset +3",
	--neck="Adad Amulet",  --Use for non-Ody
	neck="Beastmaster Collar +2",
	left_ear="Enmerkar Earring",
	right_ear="Nukumi Earring +1",
	--body="Udug Jacket",  --Use for non-Ody
	body="Nukumi Gausape +3",
	hands="Nukumi Manoplas +3",
	left_ring="Murky Ring",
	right_ring="Cath Palug Ring",
	back={ name="Artio's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: Mag. Acc.+10','Pet: "Regen"+10','Pet: Damage taken -5%',}},
	waist="Incarnation Sash",
	legs="Nukumi Quijotes +3",
	feet="Gleti's Boots"
	}
	
	-- Pet Magic Accuracy Ready Moves
	sets.midcast.Pet.MagicAccReady = set_combine(sets.midcast.Pet.MagicAtkReady, {
	neck="Beastmaster Collar +2",
	body="Nukumi Gausape +3",
	})
end

function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'ready' then
        if pet.isvalid then
            local petname = pet.name
            local move = pet_ready_map[petname]
            send_command('input /pet ready "' .. move .. '" <t>')
        else
            add_to_chat(123, 'No valid pet. Cannot Ready Move.')
        end
        eventArgs.handled = true
    end
end

function precast(spell)
	if buffactive['Stun'] or buffactive['Petrify'] or buffactive['Terror'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) then
		cancel_spell()
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
		elseif player.tp >= 1000 then
			if sets.ws[spell.name] then
				if sets.mode.index[mode_ind] == 'High' and sets.ws[spell.name].high ~= nil then
					equip(sets.ws[spell.name].high)
				else
					equip(sets.ws[spell.name])
				end
			else
				equip(sets.ws.common)
			end
			if spell.name ~= "Decimation" and spell.name ~= "Onslaught" and spell.name ~= "Ruinator" then
				if player.equipment.main == "Tri-edge" then
					if player.tp < 2500 then
						equip({left_ear="Moonshade Earring"})
					end
				else
					if player.tp < 3000 then
						equip({left_ear="Moonshade Earring"})
					end
				end
			end
		end
	elseif spell.action_type == 'Magic' then
		equip(sets.fc.base)
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

function pet_midcast(spell, action)
    if Magic_atk_ready_moves:contains(spell.name) then
        equip(sets.midcast.Pet.MagicAtkReady)
    elseif Magic_acc_ready_moves:contains(spell.name) then
        equip(sets.midcast.Pet.MagicAccReady)
	elseif TP_based_ready_moves:contains(spell.name) then
		equip(sets.midcast.Pet.MagicAccReady)
    end
end

function aftercast(spell)
	if player.status == "Engaged" then
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif player.status == "Idle" then
		equip(sets.idle)
		if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
			equip(sets.TP['DT'])
		elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['MDT'] then
			equip(sets.TP['MDT'])
		end
	end
end

function status_change(new,old)
	if new == 'Idle' then
		equip(sets.idle)
		if sets.TP[sets.TP.index[TP_ind]] == sets.TP['DT'] then
			equip(sets.TP['DT'])
		elseif sets.TP[sets.TP.index[TP_ind]] == sets.TP['MDT'] then
			equip(sets.TP['MDT'])
		end
	elseif new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
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
	end
end

function job_filtered_action(act)
    add_to_chat(200, 'Filtered Action fired: cat='..act.category)

    local pet = windower.ffxi.get_mob_by_target('pet')
    if not pet or act.actor_id ~= pet.id then return end

    if act.category ~= 4 then return end

    for _, target in ipairs(act.targets) do
        for _, action in ipairs(target.actions) do
            if action.message == 317 then
                local drained_tp = action.param or 0
                windower.send_command('input /echo [Debug] Drained '..drained_tp..' TP')
            end
        end
    end
end

send_command('bind !` gs c toggle mode set') -- Hit alt+`, toggles the sets
send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !w gs equip sets.movement')
send_command('bind !s gs c toggle WEAPON set') -- Hit alt+s, toggles the sets
send_command('bind !r gs equip sets.regen') -- Hit alt+r
send_command('bind !a gs c reequip;wait 1; input /lockstyle on') -- Hit alt+a
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp')
send_command('bind !p gs equip sets.reraise')
send_command('bind ^p gs equip sets.refresh')
send_command('alias food input /item "Grape Daifuku" <me>')
send_command('alias savage @input /ws "Decimation" <t>')
send_command('alias magical @input /ws "Cloudsplitter" <t>')
send_command('bind !x gs c petws')

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.status == 'Idle' then
			equip(sets.movement)
		end
	elseif command == 'toggle mode set' then
		mode_ind = mode_ind +1
		if mode_ind > #sets.mode.index then mode_ind = 1 end
		windower.add_to_chat(1,'<----- mode Set changed to '..sets.mode.index[mode_ind]..' ----->')
	elseif command == 'reequip' then
		equip(sets.WEAPON[sets.WEAPON.index[WEAPON_ind]],sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle WEAPON set' then
		WEAPON_ind = WEAPON_ind +1
		if WEAPON_ind > #sets.WEAPON.index then WEAPON_ind = 1 end
		equip(sets.WEAPON[sets.WEAPON.index[WEAPON_ind]])
		if WEAPON_ind == 1 then
			send_command('alias savage @input /ws "Decimation" <t>')
			send_command('alias magical @input /ws "Cloudsplitter" <t>')
		elseif WEAPON_ind == 2 then
			send_command('alias savage @input /ws "Savage Blade" <t>')
		end
	elseif command == 'petws' then
		local pet = windower.ffxi.get_mob_by_target('pet')
		if pet and pet.name then
			local pet_name = pet.name:lower()
			local ready_move = pet_ready_map[pet_name]
			if ready_move then
				windower.send_command('input /pet "Fight" <t>; wait 1.5; input /pet "'..ready_move..'" <me>; wait 3; input /pet "Heel"')
			else
				add_to_chat(123, 'No Ready move defined for pet: '..pet.name)
			end
		else
			add_to_chat(123, 'No pet is currently summoned.')
		end
    end
end

function file_unload()
    send_command('unbind !`')
	send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !e')
	send_command('unbind !r')
	send_command('unbind !a')
	send_command('unbind !s')
	send_command('unbind !p')
	send_command('unbind ^p')
	send_command('unbind !x')
	
	send_command('lua u BST-HUD')
	send_command('lua u Skillchains')
end

function set_macros(sheet,book)
    if book then
        send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(sheet))
        return
    end
    send_command('@input /macro set '..tostring(sheet))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
	add_to_chat (55, 'You are on '..tostring(player.main_job_full):color(5)..''..('. '):color(55)..''..('Macros set!'):color(121))
end
 
--Page, Book--
set_macros(1,9)
--Use the Lockstyle Number--
set_style(011)

Physical_ready_moves = S{
	'Foot Kick','Whirl Claws','Sheep Charge','Lamb Chop','Head Butt','Wild Oats',
	'Leaf Dagger','Claw Cyclone','Razor Fang','Crossthrash','Nimble Snap','Cyclotail','Rhino Attack',
	'Power Attack','Mandibular Bite','Big Scissors','Grapple','Spinning Top','Double Claw','Frogkick',
	'Blockhead','Brain Crush','Tail Blow','Scythe Tail','Ripper Fang','Chomp Rush','Needleshot',
	'Recoil Dive','Sudden Lunge','Spiral Spin','Wing Slap','Beak Lunge','Suction','Back Heel',
	'Fantod','Tortoise Stomp','Sensilla Blades','Tegmina Buffet','Pentapeck','Sweeping Gouge',
	'Somersault','Tickling Tendrils','Pecking Flurry','Sickle Slash','Disembowel','Extirpating Salvo',
	'Mega Scissors','Rhinowrecker','Hoof Volley','Fluid Toss','Fluid Spread'}

Magic_atk_ready_moves = S{
	'Dust Cloud','Cursed Sphere','Venom','Toxic Spit','Bubble Shower','Drainkiss',
	'Silence Gas','Dark Spore','Fireball','Plague Breath','Snow Cloud','Charged Whisker','Corrosive Ooze',
	'Aqua Breath','Stink Bomb','Nectarous Deluge','Nepenthic Plunge','Pestilent Plume','Foul Waters',
	'Acid Spray','Infected Leech','Gloom Spray','Venom Shower'}

Magic_acc_ready_moves = S{
	'Sheep Song','Scream','Dream Flower','Roar','Predatory Glare','Gloeosuccus',
	'Palsy Pollen','Soporific','Geist Wall','Toxic Spit','Numbing Noise','Spoil','Hi-Freq Field',
	'Sandpit','Sandblast','Venom Spray','Filamented Hold','Queasyshroom','Numbshroom','Spore','Shakeshroom',
	'Infrasonics','Chaotic Eye','Blaster','Purulent Ooze','Intimidate','Noisome Powder','Acid Mist',
	'Choke Breath','Jettatura','Nihility Song','Molting Plumage','Swooping Frenzy','Spider Web'}

Multi_hit_ready_moves = S{
	'Pentapeck','Tickling Tendrils','Sweeping Gouge','Chomp Rush','Wing Slap', 'Pecking Flurry'}

TP_based_ready_moves = S{
	'Foot Kick','Dust Cloud','Snow Cloud','Sheep Song','Sheep Charge','Lamb Chop',
	'Head Butt','Scream','Dream Flower','Wild Oats','Leaf Dagger','Claw Cyclone','Razor Fang','Roar',
	'Gloeosuccus','Palsy Pollen','Soporific','Cursed Sphere','Somersault','Geist Wall','Numbing Noise',
	'Frogkick','Nimble Snap','Cyclotail','Spoil','Rhino Attack','Hi-Freq Field','Sandpit','Sandblast',
	'Mandibular Bite','Metallic Body','Bubble Shower','Grapple','Spinning Top','Double Claw','Spore',
	'Filamented Hold','Blockhead','Fireball','Tail Blow','Plague Breath','Brain Crush','Infrasonics',
	'Needleshot','Chaotic Eye','Blaster','Ripper Fang','Intimidate','Recoil Dive','Water Wall',
	'Sudden Lunge','Noisome Powder','Wing Slap','Beak Lunge','Suction','Drainkiss','Acid Mist',
	'TP Drainkiss','Back Heel','Jettatura','Choke Breath','Fantod','Charged Whisker','Purulent Ooze',
	'Corrosive Ooze','Tortoise Stomp','Aqua Breath','Sensilla Blades','Tegmina Buffet','Sweeping Gouge',
	'Tickling Tendrils','Pecking Flurry','Pestilent Plume','Foul Waters','Spider Web','Gloom Spray',
	'Disembowel','Extirpating Salvo','Rhinowrecker','Venom Shower','Fluid Toss','Fluid Spread','Digest'}
	
-- List of Pet Buffs and Ready moves exclusively modified by Pet TP Bonus gear.
Pet_buff_moves = S{'Wild Carrot','Bubble Curtain','Scissor Guard','Secretion','Rage','Harden Shell',
	'TP Drainkiss','Fantod','Rhino Guard','Zealous Snort','Frenzied Rage','Digest'}