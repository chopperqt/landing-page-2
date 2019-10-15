local spellList = {
	-- Disorients (Mesmerize)
	[33786]   = "Disorient",       -- Cyclone
	[31661]   = "Disorient",       -- Dragon's Breath
	[105421]  = "Disorient",       -- Blinding Light
	[10326]   = "Disorient",       -- Turn Evil
	[8122]    = "Disorient",       -- Psychic Scream
	[2094]    = "Disorient",       -- Blind
	[5782]    = "Disorient",       -- Fear
	[118699]  = "Disorient",       -- Fear 2
	[130616]  = "Disorient",       -- Fear (glyphed)
	[5484]    = "Disorient",       -- Howl of Terror
	[115268]  = "Disorient",       -- Mesmerize (Shivarra)
	[6358]    = "Disorient",       -- Seduction (Succubus)
	[5246]    = "Disorient",       -- Intimidating Shout

	-- Incapacitates
	[99]      = "Incapacitate",    -- Incapacitating Roar
	[3355]    = "Incapacitate",    -- Freezing Trap
	[19386]   = "Incapacitate",    -- Wyvern Sting
	[118]     = "Incapacitate",    -- Polymorph
	[126819]  = "Incapacitate",    -- Polymorph (Porcupine)
	[61721]   = "Incapacitate",    -- Polymorph (Rabbit)
	[28271]   = "Incapacitate",    -- Polymorph (Turtle)
	[28272]   = "Incapacitate",    -- Polymorph (Pig)
	[161353]  = "Incapacitate",    -- Polymorph (Bear cub)
	[161372]  = "Incapacitate",    -- Polymorph (Peacock)
	[61305]   = "Incapacitate",    -- Polymorph (Black Cat)
	[61780]   = "Incapacitate",    -- Polymorph (Turkey)
	[161355]  = "Incapacitate",    -- Polymorph (Penguin)
	[161354]  = "Incapacitate",    -- Polymorph (Monkey)
	[82691]   = "Incapacitate",    -- Ring of Frost
	[123393]  = "Incapacitate",    -- Breath of Fire (glyphed)
	[115078]  = "Incapacitate",    -- Paralysis
	[137460]  = "Incapacitate",    -- Ring of Peace
	[142895]  = "Incapacitate",    -- Ring of Peace (glyphed?)
	[20066]   = "Incapacitate",    -- Repentance
	[9484]    = "Incapacitate",    -- Shackle Undead
	[88625]   = "Incapacitate",    -- Holy Word: Chastise
	[64044]   = "Incapacitate",    -- Psychic Horror
	[605]     = "Incapacitate",    -- Dominate Mind
	[1776]    = "Incapacitate",    -- Gouge
	[6770]    = "Incapacitate",    -- Sap
	[51514]   = "Incapacitate",    -- Hex
	[710]     = "Incapacitate",    -- Banish
	[137143]  = "Incapacitate",    -- Blood Horror
	[6789]    = "Incapacitate",    -- Mortal Coil
	[107079]  = "Incapacitate",    -- Quaking Palm

	-- Silences
	[47476]   = "Silence",         -- Strangulate
	[78675]   = "Silence",         -- Solar Beam
	[102051]  = "Silence",         -- Frostjaw
	[31935]   = "Silence",         -- Avenger's Shield
	[15487]   = "Silence",         -- Silence
	[1330]    = "Silence",         -- Garrote
	[114238]  = "Silence",         -- Fae Silence

	-- Stuns
	[91800]   = "Stun",            -- Gnaw
	[91797]   = "Stun",            -- Monstrous Blow
	[108194]  = "Stun",            -- Asphyxiate
	[115001]  = "Stun",            -- Remorseless Winter
	[22570]   = "Stun",            -- Maim
	[163505]  = "Stun",            -- Rake (Prowl)
	[5211]    = "Stun",            -- Mighty Bash
	[117526]  = "Stun",            -- Binding Shot
	[24394]   = "Stun",            -- Intimidation
	[44572]   = "Stun",            -- Deep Freeze
	[147386]  = "Stun",            -- Charging Ox Wave
	[120086]  = "Stun",            -- Fists of Fury
	[119381]  = "Stun",            -- Leg Sweep
	[105593]  = "Stun",            -- Fist of Justice
	[853]     = "Stun",            -- Hammer of Justice
	[119072]  = "Stun",            -- Holy Wrath
	[1833]    = "Stun",            -- Cheap Shot
	[408]     = "Stun",            -- Kidney Shot
	[118905]  = "Stun",            -- Capacitor Totem
	[118345]  = "Stun",            -- Pulverize
	[89766]   = "Stun",            -- Axe Toss
	[171017]  = "Stun",            -- Meteor Strike (Infernal)
	[171018]  = "Stun",            -- Meteor Strike (Abysall)
	[30283]   = "Stun",            -- Shadowfury
	[46968]   = "Stun",            -- Shockwave
	[132168]  = "Stun",            -- Shockwave 2
	[132169]  = "Stun",            -- Storm Bolt
	[107570]  = "Stun",            -- Storm Bolt 2

	-- Roots
	[53534]   = "Root",            -- Chains of Ice Freeze
	[96294]   = "Root",            -- Chains of Ice Root
	[339]     = "Root",            -- Entangling Roots
	[113770]  = "Root",            -- Entangling Roots (Force of Nature)
	[170855]  = "Root",            -- Entangling Roots (Barkskin -> Nature's Grasp)
	[102359]  = "Root",            -- Mass Entanglement
	[53148]   = "Root",            -- Charge (Tenacity pet)
	[135373]  = "Root",            -- Entrapment
	[64803]   = "Root",            -- Entrapment (deprecated?)
	[136634]  = "Root",            -- Narrow Escape
	[102051]  = "Root",            -- Frostjaw
	[122]     = "Root",            -- Frost Nova
	[33395]   = "Root",            -- Freeze
	[111340]  = "Root",            -- Ice Ward
	[116706]  = "Root",            -- Disable
	[114404]  = "Root",            -- Void Tendrils
	[87194]   = "Root",            -- Mind Blast (glyph)
	[64695]   = "Root",            -- Earthgrab Totem
	[63685]   = "Root",            -- Frozen Power
	[170996]  = "Root",            -- Debilitate
}

--[[for k, v in next, spellList do
	if not GetSpellLink(k) then
		print(format("Diminish: Unknown spell %s for category %s", k, v))
		spellList[k] = nil
	end
end]]

select(2, ...).spellList = spellList
