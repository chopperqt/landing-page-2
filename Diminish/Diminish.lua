-- <Options> ------------------------------------------------------
local timerTextSize = 10    -- Font size of the cooldown countdown text.
local timerSpiral = true    -- Toggles the cooldown swipe.
local timerText = true      -- Toggles the cooldown countdown text.
local iconSize = 24         -- Size of the icons.
local MAX_UNITS = 3         -- Number of arena frames to attach to(max). Set to 5 if you play 5v5 arenas.

-- Advanced options
-- Enabled categories (Case sensitive)
local categories = {
	["MAGE"] = { -- Enabled categories for mage only
		"Stun", "Root", "Silence", "Incapacitate", "Disorient"
	},
	["ROGUE"] = { -- Rogue, etc etc
		"Stun", "Root", "Silence", "Incapacitate", "Disorient"
	},
}

-- Set texture for category. (Uses the same everytime)
local textures = {
	["MAGE"] = {
		-- ["Stun"] = GetSpellTexture(44572), -- Deep Freeze spellID
		-- ["Incapacitate"] = GetSpellTexture(118), -- Polymorph
		-- Comment tags "-- " before category needs to be removed.
	},
	["ROGUE"] = {
		-- Just follow the pattern to add more. Case sensitive.
	},
}
-------------------------------------------------------------------
-------------------------------------------------------------------
local spellIDs = select(2, ...).spellList
local icons = {}
local ArenaGUID = {}

local UnitGUID, GetTime, GetSpellTexture, GetSpecializationInfoByID, GetArenaOpponentSpec, band, CLOR_FRIENDLY, _ =
	  UnitGUID, GetTime, GetSpellTexture, GetSpecializationInfoByID, GetArenaOpponentSpec, bit.band, COMBATLOG_OBJECT_REACTION_FRIENDLY, _

if not IsAddOnLoaded("Blizzard_ArenaUI") then
	LoadAddOn("Blizzard_ArenaUI")
end

do
	local function PlayerIsHunterBM(i) -- Beast Mastery hunters shares DR with pet
		return GetSpecializationInfoByID(GetArenaOpponentSpec(i) or 0) == 253
	end

	local function GetIdByGuid(self, destGUID)
		if not destGUID then return end
		local unitID = 0

		for i = 1, MAX_UNITS do
			if UnitGUID("arena"..i) == destGUID then
				unitID = i
				break
			elseif UnitGUID("arenapet"..i) == destGUID then
				if PlayerIsHunterBM(i) then
					unitID = i
					break
				end
			end
		end

		self[destGUID] = unitID -- note: 0 will be added to blacklist
		return unitID
	end

	setmetatable(ArenaGUID, {__index = GetIdByGuid})
end

local function ActivateDR(spellID, category, unit)
	local f = icons[category..unit]
	if not f then -- Category is disabled
		spellIDs[spellID] = nil
		return
	elseif not f.hasTexture then
		f.icon:SetTexture(GetSpellTexture(spellID))
	end

	local time = GetTime()
	local applied = f.applied + 1
	f.applied = applied
	f.time = time
	f.border:SetVertexColor(1, applied == 2 and 1 or 0, 0, applied > 1 and 1 or 0) -- Yellow when 2, red when greater than 2, otherwise invisible
	f:SetCooldown(time, 18)
end

do
	local _, class = UnitClass("player")
	local tmpRef = categories[class]
	categories = tmpRef and next(tmpRef) ~= nil and tmpRef or {"Stun", "Root", "Silence", "Incapacitate", "Disorient"}

	local function FrameOnShow(self)
		local posX = -24
		local unit = self.unit

		for i = 1, #categories do
			if icons[categories[i]..unit].shown then
				posX = posX - iconSize -- Set to + for reverse grow, do same with FrameOnHide()
			end
		end

		self:SetPoint("LEFT", posX, 22) -- Set to "RIGHT" for reverse grow, do same with FrameOnHide()
		self.shown = true
	end

	local function FrameOnHide(self)
		local posX = -24
		local unit = self.unit -- Avoid extra lookups
		local time = self.time
		self.shown = false
		self.applied = 0

		for i = 1, #categories do
			local f = icons[categories[i]..unit]
			local ftime = f.time

			if f.shown and ftime == time and ftime > (time - .001) or ftime > time then -- ftime and time cant be equal
				f:SetPoint("LEFT", posX, 22)
				posX = posX - iconSize
			end
		end

		if self:GetCooldownDuration() > 0 then
			self:SetCooldown(0, 0) -- Stop timers when hidden by parent frame (leaving arena etc)
		end
	end

	for i = 1, MAX_UNITS do
		local arenaFrame = _G["ArenaEnemyFrame"..i]

		for j = 1, #categories do
			local f = CreateFrame("Cooldown", nil, arenaFrame, "CooldownFrameTemplate")
			f:ClearAllPoints()
			f.time, f.applied, f.unit, f.shown = 0, 0, i, false
			f:SetHideCountdownNumbers(not timerText)
			f:SetSize(iconSize, iconSize)
			f:SetDrawSwipe(timerSpiral)
			f:SetSwipeColor(0, 0, 0, 0.60)
			f:SetDrawEdge(false)
			f:EnableMouse(false)
			f:SetFrameLevel(2)
			f:Hide()

			-- Spell Texture
			f.icon = f:CreateTexture(nil, "BACKGROUND")
			f.icon:SetAllPoints(f)
			f.icon:SetTexture(textures[class] and textures[class][categories[j]])
			f.hasTexture = f.icon:GetTexture() and true or false

			-- Border
			f.border = f:CreateTexture(nil, "BORDER")
			f.border:SetAllPoints(f)
			f.border:SetTexture("Interface\\BUTTONS\\UI-Quickslot-Depress.png")

			-- Countdown
			for _, region in next, {f:GetRegions()} do
				if region:GetObjectType() == "FontString" then
					region:SetFont("Fonts\\FRIZQT__.TTF", timerTextSize, "OUTLINE")
					region:SetPoint("CENTER", f, 0, 0)
					break
				end
			end

			f:SetScript("OnShow", FrameOnShow)
			f:SetScript("OnHide", FrameOnHide)
			icons[categories[j]..i] = f
		end
	end
end

do
	local events = CreateFrame("Frame")

	local function EventHandler(self, event, ...)
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			local _, eventType, _, _, _, srcFlags, _, destGUID, _, _, _, spellID, _, _, auraType = ...

			if ((eventType == "SPELL_AURA_REMOVED" or eventType == "SPELL_AURA_REFRESH") and auraType == "DEBUFF") then
				if band(srcFlags, CLOR_FRIENDLY) > 0 then
					local category = spellIDs[spellID]
					local unitID = ArenaGUID[destGUID]

					if category and unitID and unitID > 0 then
						ActivateDR(spellID, category, unitID)
						return
					end
				end
			end
		else
			if select(2, IsInInstance()) == "arena" then
				wipe(ArenaGUID)
				self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			else
				self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			end
		end
	end

	events:RegisterEvent("PLAYER_ENTERING_WORLD")
	events:SetScript("OnEvent", EventHandler)
	events:Hide()
end

SLASH_DIMINISH1 = "/diminish"
SlashCmdList["DIMINISH"] = function()
	if InCombatLockdown() then return end
	local showFlag = not ArenaEnemyFrames:IsShown()
	ArenaEnemyFrames:SetShown(showFlag)

	for i = 1, MAX_UNITS do
		_G["ArenaEnemyFrame"..i]:SetShown(showFlag)
		_G["ArenaEnemyFrame"..i.."PetFrame"]:SetShown(showFlag)

		if showFlag then
			for j = 1, #categories do
				local f = icons[categories[j]..i]
				if not f.hasTexture then
					f.icon:SetTexture(GetSpellTexture(118))
				end

				f.time = GetTime()
				f.applied = random(1, 3)
				f.border:SetVertexColor(1, f.applied == 2 and 1 or 0, 0, f.applied > 1 and 1 or 0)
				f:SetCooldown(f.time, random(5, 18))
			end
		end
	end
end
