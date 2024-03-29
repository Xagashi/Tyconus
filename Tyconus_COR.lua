--Snake Eye 3 - Fold 1 - Winning Streak 5 - Loaded Deck 1
--Ongo: Snake Eye 1 - Fold 0 - Winning Streak 4 - Loaded Deck 5

send_command('bind !q gs c toggle TP set') -- Hit alt+q, toggles the sets
send_command('bind !w gs equip movement') -- Hit alt+w, toggles the sets
send_command('bind !` gs c toggle QD set') -- Hit alt+`, toggles the sets
send_command('bind !u gs equip low_hp;wait 1; gs equip high_hp') -- Hit alt+u, Used specifically for the HP objectives for Omen

-------- Aliases --------
--Type //bolt to use Bolter's Roll.
send_command('alias food input /item "Grape Daifuku" <me>')
send_command('alias bolt input /ja "Bolter\'s roll" <me>')
send_command('alias roll gs equip sets.roll')
send_command('alias sdp gs equip sets.sdp')
send_command('alias sf gs equip sets.sf')
send_command('alias stp gs equip sets.stp')
send_command('alias sortie gs equip sets.sortie')
send_command('alias hs gs equip sets.hotshot')

res = require 'resources'
send_command('lua l Skillchains')

elemental_ws = S{"Aeolian Edge","Leaden Salute","Wildfire"}
no_shoot_ammo = S{"Hauksbok Bullet"}

function get_sets()
	sets.precast = {}
	sets.midcast = {}
	sets.ja = {}
	sets.ws = {}
	bullet = {}
	sets.TP = {}
	sets.fc = {}
	sets.QD = {}
	
	sets.fc.base = {
	head="Carmine Mask +1",
	neck="Baetyl Pendant",
	left_ear="Etiolation Earring",
	right_ear="Loquacious Earring",
	body="Taeon Tabard",
	hands="Leyline Gloves",
	left_ring="Medada's Ring",
	right_ring="Lebeche Ring",
	feet="Carmine Greaves +1"
	}
	
	sets.fc.utsusemi = set_combine(sets.fc.base, {
	neck="Magoraga Beads",
	})
	
	sets.movement = {legs="Carmine Cuisses +1"}
	
	bullet.shooty = {ammo="Chrono Bullet"}
	bullet.MA = {ammo="Living Bullet"}
	bullet.PA = {ammo="Chrono Bullet"}
	
	sets.roll = {
	main={ name="Rostam", augments={'Path: C',}, priority=2,},
    range={ name="Compensator", augments={'DMG:+15','Rng.Atk.+15','"Mag.Atk.Bns."+15',}, priority=1,},
	}

    sets.sdp = {
	main={ name="Naegling", priority=2,},
    range={ name="Death Penalty", priority=1,},
	}
	
	sets.sf = {
	main={ name="Naegling", priority=2,},
    range={ name="Fomalhaut", priority=1,},
	}
	
	sets.stp = {
	main={ name="Naegling", priority=2,},
    range={ name="Anarchy +3", priority=1,},
	}
	
	sets.sortie = {
	main={ name="Rostam", augments={'Path: B',}, priority=2},
    sub={ name="Tauret", priority=1},
	range="Death Penalty",
	}
	
	sets.hotshot = {
	main={ name="Naegling", priority=2},
    sub={ name="Tauret", priority=1},
	range="Fomalhaut",
	}
	
	sets.TP.index = {'Standard','HighAcc','DT'}
	TP_ind = 1 --Standard set is the Default
	
	sets.TP['Standard'] = {
	head="Malignance Chapeau",
	neck="Iskur gorget",
	left_ear="Telos Earring",
	right_ear="Dedition Earring",
	body="Malignance Tabard",
	hands="Adhemar Wristbands +1",
	left_ring="Epona's Ring",
	right_ring="Petrov Ring",
	back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	--legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
	legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
	feet="Malignance Boots"
	}
	
	sets.TP['HighAcc'] = set_combine(sets.TP['Standard'], {
	head="Chasseur's Tricorne +3",
	neck="Combatant's Torque",
	right_ear="Crepuscular Earring",
	hands="Malignance Gloves",
	left_ring={name="Chirich Ring +1", bag="wardrobe2"},
	right_ring={name="Chirich Ring +1", bag="wardrobe6"},
	legs="Chasseur's Culottes +3",
	feet="Chasseur's Bottes +3"
	})
	
	sets.TP['DT'] = set_combine(sets.TP['Standard'], {
	head="Nyame Helm",
	hands="Malignance Gloves",
	legs="Chasseur's Culottes +3",
	feet="Nyame Sollerets"
	})
	
	sets.TP['Nyame'] = set_combine(sets.TP['Standard'], {
	head="Nyame Helm",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	})
	
	--Snapshot > Rapid Shot
	sets.precast.RA = { --60+10JP Snapshot | 30+42 Rapid Shot
	head="Chasseur's Tricorne +3", --18R
	neck="Commodore Charm +2", --4S
	body="Oshosi Vest", --12S
	hands={ name="Carmine Finger Gauntlets +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}}, --8S 11R
	right_ring="Crepuscular Ring", --3S
	back={ name="Camulus's Mantle", augments={'"Snapshot"+10',}}, --10S
	waist="Impulse Belt", --3S
	legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}}, --10S 13R
	feet="Meghanada Jambeaux +2" --10S
	}
	
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, { --45+10JP+15% Snapshot | 30+77 Rapid Shot
	body="Laksamana's Frac +3", --20R
	waist="Yemaya Belt", --5R
	feet="Pursuer's Gaiters" --10R
	})
	
	--r.acc/stp/crit/agi/recycle
	sets.midcast.RA = {
	head="Ikenga's Hat",
	neck="Iskur gorget",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Ilabrat Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	waist="Kwahu Kachina Belt +1",
	legs="Ikenga's Trousers",
	feet="Ikenga's Clogs"
	}
	
	sets.midcast.RAcc = {
	head="Chasseur's Tricorne +3",
	neck="Iskur Gorget",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	body="Chasseur's Frac +3",
	hands="Chasseur's Gants +3",
	left_ring="Ilabrat Ring",
	right_ring="Crepuscular Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	waist="Kwahu Kachina Belt +1",
	legs="Chasseur's Culottes +3",
	feet="Chasseur's Bottes +3"
	}
	
	sets.midcast['Triple Shot'] = {
	--head="Oshosi Mask",
	body="Chasseur's Frac +3",
	hands="Lanun Gants +3",
	--legs="Oshosi Trousers",
	--feet="Oshosi Leggings"
	}
	
	sets.ja.CorsairRoll = {
	main={ name="Rostam", augments={'Path: C',}},
	range="Compensator",
	head="Lanun Tricorne +1",
	neck="Regal necklace",
	hands="Chasseur's Gants +3",
	left_ring="Luzaf's Ring",
	back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	
	sets.ja["Caster's Roll"] = set_combine(sets.ja.CorsairRoll, {legs="Chasseur's Culottes +3"})
	sets.ja["Courser's Roll"] = set_combine(sets.ja.CorsairRoll, {feet="Chasseur's Bottes +3"})
	sets.ja["Blitzer's Roll"] = set_combine(sets.ja.CorsairRoll, {head="Chasseur's Tricorne +3"})
	sets.ja["Tactician's Roll"] = set_combine(sets.ja.CorsairRoll, {body="Chasseur's Frac +3"})
	sets.ja["Allies' Roll"] = set_combine(sets.ja.CorsairRoll, {hands="Chasseur's Gants +3"})
	
	sets.ja["Wild Card"] = {feet="Lanun Bottes +3"}
	sets.ja["Double-Up"] = sets.ja.CorsairRoll
	sets.ja["Random Deal"] = {body="Lanun Frac +3"}
	sets.ja["Snake Eye"] = {legs="Lanun Trews +3"}
	sets.ja.waltz = {body="Passion Jacket",}
	
	--sets.QD.index = {'Empy','MAB','STP'}
	sets.QD.index = {'OneSet'}
	QD_ind = 1 --Standard set is the Default
	
	sets.QD['STP'] = {
	head="Ikenga's Hat",
	neck="Iskur Gorget",
	left_ear="Crepuscular Earring",
	right_ear="Dedition Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Chirich ring +1",
	right_ring="Crepuscular Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	--waist="Tellen belt",
	waist="Yemaya Belt",
	legs="Malignance Tights",
	feet="Malignance Boots"
	}
	
	sets.QD['MAB'] = {
	ammo="Hauksbok Bullet",
	head="Nyame Helm",
	neck="Commodore Charm +2",
	left_ear="Hecate's Earring",
	right_ear="Friomisi Earring",
	body="Lanun Frac +3",
	hands="Nyame Gauntlets",
	left_ring="Regal Ring",
	right_ring="Dingir Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	--back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	waist="Orpheus's Sash",
	legs="Nyame Flanchard",
	feet="Lanun Bottes +3"
	}
	
	sets.QD['Empy'] = set_combine(sets.QD['MAB'], {
	feet="Chasseur's Bottes +3"
	})
	
	sets.QD['OneSet'] = {
	ammo="Hauksbok Bullet",
	head="Ikenga's Hat",
	neck="Commodore Charm +2",
	left_ear="Hecate's Earring",
	right_ear="Friomisi Earring",
	body="Lanun Frac +3",
	hands="Carmine Finger Gauntlets +1",
	right_ring="Dingir Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	waist="Orpheus's Sash",
	legs="Nyame Flanchard",
	feet="Chasseur's Bottes +3"
	}
	
	sets.midcast.quickmacc = {
	head="Lanun Tricorne +1",
	neck="Commodore Charm +2",
	left_ear="Telos Earring",
	right_ear="Crepuscular Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Regal Ring",
	right_ring="Stikini Ring +1",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	waist="Eschan Stone",
	legs="Malignance Tights",
	feet="Nyame Sollerets",
	}
	
	sets.ws.common = {
	head="Nyame Helm",
	neck="Fotia Gorget",
	right_ear="Ishvara Earring",
	body="Nyame Mail",
	hands="Nyame Gauntlets",
	left_ring="Regal Ring",
	right_ring="Epaminondas's ring",
	back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
	waist="Fotia Belt",
	legs="Nyame Flanchard",
	feet="Nyame Sollerets"
	}
	
	sets.ws["Last Stand"] = set_combine(sets.ws.common, {
	body="Ikenga's Vest",
	hands="Chasseur's Gants +3",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	legs="Ikenga's Trousers",
	})
	
	sets.ws["Leaden Salute"] = set_combine(sets.ws.common, {
	head="Pixie Hairpin +1",
	neck="Commodore Charm +2",
	right_ear="Friomisi Earring",
	body="Lanun Frac +3",
	--left_ring="Dingir Ring",
	left_ring="Medada's Ring",
	right_ring="Archon ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	waist="Orpheus's Sash",
	feet="Lanun Bottes +3"
	})
	
	sets.ws["Wildfire"] = set_combine(sets.ws["Leaden Salute"], {
	head="Nyame Helm",
	left_ear="Hecate's Earring",
	right_ring="Epaminondas's ring",
	})
	
	sets.ws["Hot Shot"] = set_combine(sets.ws["Wildfire"], {
	neck="Fotia Gorget",
	body="Nyame Mail",
	hands="Chasseur's Gants +3",
	})
	
	sets.ws["Sniper Shot"] = {
	head="Meghanada Visor +2",
	neck="Iskur Gorget",
	left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
	right_ear="Telos Earring",
	body="Malignance Tabard",
	hands="Malignance Gloves",
	left_ring="Regal Ring",
	right_ring="Petrov Ring",
	back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	waist="Yemaya Belt",
	legs="Malignance Tights",
	feet="Meg. Jam. +2"
	}
	
	sets.ws["Savage Blade"] = set_combine(sets.ws.common, {
	neck="Commodore Charm +2",
	--right_ear="Chasseur's Earring +2",
	hands="Chasseur's Gants +3",
	waist="Sailfi Belt +1",
	})
	
	sets.ws["Evisceration"] = {
	head="Adhemar Bonnet +1",
	neck="Fotia Gorget",
	right_ear="Odr Earring",
	body="Adhemar Jacket +1",
	hands="Chasseur's Gants +3",
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
	waist="Platinum Moogle Belt",
	legs="Carmine Cuisses +1",
	feet="Carmine Greaves +1"
	}
	
	sets.subjobnin = {left_ear="Eabani Earring",waist="Reiki Yotai"}
	sets.subjobdnc = set_combine(sets.subjobnin, {back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+18 Attack+18','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},})
end

function check_height() 
	selfz = math.floor(windower.ffxi.get_mob_by_index(player.index).z * 10)/10
	targetz = math.floor(windower.ffxi.get_mob_by_index(player.target.index).z * 10)/10
	heightdiff = selfz - targetz
	targdistance = math.floor(windower.ffxi.get_mob_by_index(player.target.index).distance:sqrt() * 10+0.5)/10
end

function precast(spell)
	if buffactive['Stun'] or buffactive['Petrify'] or ((spell.action_type == "WeaponSkill" or spell.action_type == "JobAbility") and buffactive['Amnesia']) or (spell.action_type == 'Magic' and buffactive['Silence']) or (buffactive[spell.name] and not spell.action_type == 'Magic') or (spell.name == "Snake Eye" and not buffactive['Double-Up Chance']) or (spell.name == "Fold" and not buffactive['Bust']) then
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
			if elemental_ws:contains(spell.name) then
				weathercheck(spell.element,sets.ws[spell.name])
			elseif sets.ws[spell.name] then
				equip(sets.ws[spell.name])
			else
				equip(sets.ws.common)
			end
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
							if spell.name == "Leaden Salute" then
								equip({left_ear="Hecate's Earring",})
							else
								equip({left_ear="",})
							end
						end
					elseif (player.equipment.range == "Anarchy +2" or player.equipment.range == "Anarchy +3" or player.equipment.range == "Ataktos") then
						if player.tp >= 1000 and player.tp < 2000 then
							equip({left_ear="Moonshade Earring",})
						else
							if spell.name == "Leaden Salute" then
								equip({left_ear="Hecate's Earring",})
							else
								equip({left_ear="",})
							end
						end
					else
						if player.tp >= 1000 and player.tp < 3000 then
							equip({left_ear="Moonshade Earring",})
						else
							if spell.name == "Leaden Salute" then
								equip({left_ear="Hecate's Earring",})
							else
								equip({left_ear="",})
							end
						end
					end
				end
			else
				if (player.equipment.range == "Anarchy +2" or player.equipment.range == "Anarchy +3" or player.equipment.range == "Ataktos") then
					if player.tp >= 1000 and player.tp < 2000 then
						equip({left_ear="Moonshade Earring",})
					else
						if spell.name == "Leaden Salute" then
							equip({left_ear="Hecate's Earring",})
						else
							equip({left_ear="Telos Earring",})
						end
					end
				else
					if player.tp >= 1000 and player.tp < 3000 then
						equip({left_ear="Moonshade Earring",})
					else
						if spell.name == "Leaden Salute" then
							equip({left_ear="Hecate's Earring",})
						else
							equip({left_ear="Telos Earring",})
						end
					end
				end
			end
		end
	elseif spell.action_type == 'Ranged Attack' then
		equip(bullet.shooty)
		if player.equipment.ammo == 'empty' then
			add_to_chat(123, 'No '..(bullet.shooty))
		end
		if no_shoot_ammo:contains(player.equipment.ammo) then
			cancel_spell()
		end
		if buffactive['Flurry'] then
			equip(sets.precast.RA.Flurry)
		else
			equip(sets.precast.RA)
		end
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
			weathercheck(spell.element,sets.QD[sets.QD.index[QD_ind]])
		end
	elseif spell.action_type == 'Ranged Attack' then
		if buffactive['Triple Shot'] then
			equip(sets.midcast.RAacc,sets.midcast['Triple Shot'])
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
		if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' or player.equipment.sub:contains('Forfend') then
			equip({left_ear="Telos Earring",waist="Sailfi Belt +1"})
		else
			if S{player.sub_job}:contains('DNC') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) and buffactive["Haste Samba"] then
					equip({waist="Reiki Yotai"})
				elseif (buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580]) then
					equip(sets.subjobdnc)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then 
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			elseif S{player.sub_job}:contains('NIN') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) then
					equip(sets.subjobnin)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			end
		end
	elseif player.status == 'Idle' then
		equip(sets.TP[sets.TP.index[TP_ind]],sets.movement)
		equip({neck="Republican Platinum Medal",waist="Flume Belt +1",})
	end
	if no_shoot_ammo:contains(player.equipment.ammo) then
		equip(bullet.shooty)
	end
end

function status_change(new,old)
	if new == 'Idle' then
		equip(sets.TP[sets.TP.index[TP_ind]],sets.movement)
		equip({neck="Republican Platinum Medal",waist="Flume Belt +1",})
	elseif new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' or player.equipment.sub:contains('Forfend') then
			equip({left_ear="Telos Earring",waist="Sailfi Belt +1"})
		else
			if S{player.sub_job}:contains('DNC') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) and buffactive["Haste Samba"] then
					equip({waist="Reiki Yotai"})
				elseif (buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580]) then
					equip(sets.subjobdnc)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			elseif S{player.sub_job}:contains('NIN') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) then
					equip(sets.subjobnin)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			end
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
	elseif S{"Haste Samba"}:contains(name) then
		if gain then
			if S{player.sub_job}:contains('DNC') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) and buffactive["Haste Samba"] then
					equip({waist="Reiki Yotai"})
				elseif (buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580]) then
					equip(sets.subjobdnc)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then 
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			elseif S{player.sub_job}:contains('NIN') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) then
					equip(sets.subjobnin)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			end
		else
			if S{player.sub_job}:contains('DNC') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) and buffactive["Haste Samba"] then
					equip({waist="Reiki Yotai"})
				elseif (buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580]) then
					equip(sets.subjobdnc)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then 
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			elseif S{player.sub_job}:contains('NIN') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) then
					equip(sets.subjobnin)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			end
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

function file_unload()
	send_command('unbind !q')
	send_command('unbind !w')
	send_command('unbind !u')
	send_command('unbind !`')
	send_command('lua u Skillchains')
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		windower.add_to_chat(1,'<----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
		if player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Bulwark') or player.equipment.sub:contains('Buckler') or player.equipment.sub:contains('Grip') or player.equipment.sub == 'empty' or player.equipment.sub:contains('Forfend') then
			equip({left_ear="Telos Earring",waist="Grunfeld Rope"})
		else
			if S{player.sub_job}:contains('DNC') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) and buffactive["Haste Samba"] then
					equip({waist="Reiki Yotai"})
				elseif (buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580]) then
					equip(sets.subjobdnc)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then 
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			elseif S{player.sub_job}:contains('NIN') then
				if ((buffactive["Haste"] and buffactive["Embrava"]) or buffactive["March"] or (buffactive["Haste"] and buffactive[580])) then
					equip(sets.subjobnin)
				else
					if sets.TP[sets.TP.index[TP_ind]] ~= sets.TP['DT'] then
						equip(sets.subjobdnc,{right_ear="Suppanomimi",body="Adhemar Jacket +1",legs="Carmine Cuisses +1"})
					else
						equip(sets.subjobdnc)
					end
				end
			end
		end
	end
	if command == 'toggle QD set' then
		QD_ind = QD_ind +1
		if QD_ind > #sets.QD.index then QD_ind = 1 end
		windower.add_to_chat(1,'<----- Quick Draw mode changed to '..sets.QD.index[QD_ind]..' ----->')
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
	add_to_chat (55, 'You are on '..('Corsair'):color(5)..('. '):color(55)..''..('Macros set!'):color(121))
end
 
function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end
 
--Page, Book--
set_macros(6,3)
--Use the Lockstyle Number--
set_style(007)