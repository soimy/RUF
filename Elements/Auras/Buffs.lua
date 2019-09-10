local RUF = RUF or LibStub('AceAddon-3.0'):GetAddon('RUF')
local LSM = LibStub('LibSharedMedia-3.0')
local _, ns = ...
local oUF = ns.oUF
local _, PlayerClass

local BuffDispel = {-- PURGES
	['DEATHKNIGHT'] = {
		[1] = {'None'},
		[2] = {'None'},
		[3] = {'None'},
		[10] = {'None'},
	},
	['DEMONHUNTER'] = {
		[1] = {'Magic'},
		[2] = {'Magic'},
		[10] = {'None'},
	},
	['DRUID'] = {
		[1] = {'Enrage'},
		[2] = {'Enrage'},
		[3] = {'Enrage'},
		[4] = {'Enrage'},
		[10] = {'None'},
	},
	['HUNTER'] = {
		[1] = {'Enrage'},
		[2] = {'Enrage'},
		[3] = {'Enrage'},
		[10] = {'Enrage'},
	},
	['MAGE'] = {
		[1] = {'Magic'},
		[2] = {'Magic'},
		[3] = {'Magic'},
		[10] = {'None'},
	},
	['MONK'] = {
		[1] = {'None'},
		[2] = {'None'},
		[3] = {'None'},
		[10] = {'None'},
	},
	['PALADIN'] = {
		[1] = {'None'},
		[2] = {'None'},
		[3] = {'None'},
		[10] = {'None'},
	},
	['PRIEST'] = {
		[1] = {'Magic'},
		[2] = {'Magic'},
		[3] = {'Magic'},
		[10] = {'Magic'},
	},
	['ROGUE'] = {
		[1] = {'None'},
		[2] = {'None'},
		[3] = {'None'},
		[10] = {'None'},
	},
	['SHAMAN'] = {
		[1] = {'Magic'},
		[2] = {'Magic'},
		[3] = {'Magic'},
		[10] = {'Magic'},
	},
	['WARLOCK'] = {
		[1] = {'Magic'},
		[2] = {'Magic'},
		[3] = {'Magic'},
		[10] = {'Magic'},
	},
	['WARRIOR'] = {
		[1] = {'None'},
		[2] = {'None'},
		[3] = {'None'},
		[10] = {'None'},
	},
}

local function CustomBuffFilter(element, unit, button, ...)
	--[[ Override: Auras:CustomFilter(unit, button, ...)
	Defines a custom filter that controls if the aura button should be shown.

	* self   - the widget holding the aura buttons
	* unit   - the unit on which the aura is cast (string)
	* button - the button displaying the aura (Button)
	* ...	- the return values from [UnitAura](http://wowprogramming.com/docs/api/UnitAura.html)

	## Returns

	* show - indicates whether the aura button should be shown (boolean)
	--]]


	-- If the unit is in a vehicle etc.
	local frame = element:GetParent()
	if frame.realUnit then
		unit = frame.realUnit
	end

	-- If unit is party1, boss2, arena3 etc. we the group's profile.
	local profileUnit = string.gsub(frame.frame,'%d+','')


	if RUF.db.profile.unit[profileUnit].Buffs.Icons.Enabled == false then
		button.shoudShow = false
		frame:DisableElement('Auras')
		return false
	end

	local name, icon, count, debuffType, duration, expirationTime, source, isStealable,
	nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, nameplateShowAll, timeMod, value1, value2, value3 = ...

	local BuffTypes
	if UnitIsFriend('player',unit) then
		BuffTypes = 'None' -- Cannot dispel friendly buffs
	else
		BuffTypes = BuffDispel[PlayerClass][RUF.Specialization]
	end
	local removable = false
	if BuffTypes == 'None' then
		removable = false
	else
		for k,v in pairs(BuffTypes) do
			if v == debuffType then
				removable = true
			end
		end
	end
	if not source or source == nil then source = unit end
	local affiliation
	if source == 'player' then affiliation = 'player'
	elseif source == unit then affiliation = 'unit'
	elseif IsInGroup() and UnitPlayerOrPetInParty(source) then affiliation = 'group'
	elseif IsInRaid() and UnitInRaid(source) then affiliation = 'group'
	else affiliation = 'other'
	end


	if duration == 0 and RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Time.Unlimited == false then
		-- Unlimited
		button.shoudShow = false
		return false
	elseif duration ~= 0 and duration < RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Time.Min and RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Time.Min > 0 then
		-- Shorter than Minimum duration.
		button.shoudShow = false
		return false
	elseif duration > RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Time.Max and RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Time.Max > 0 then
		-- Longer than Max duration.
		button.shoudShow = false
		return false
	end

	if (RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Dispellable == true and removable == true) or RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Dispellable == false then
		if RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Caster.Player == true then
			if affiliation == 'player' then
				button.shoudShow = true
				return true
			end
		end
		if RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Caster.Unit == true then
			if affiliation == 'unit' then
				button.shoudShow = true
				return true
			end
		end
		if RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Caster.Group == true then
			if affiliation == 'group' then
				button.shoudShow = true
				return true
			end
		end
		if RUF.db.profile.unit[profileUnit].Buffs.Icons.Filter.Caster.Other == true then
			if affiliation == 'other' then
				button.shoudShow = true
				return true
			end
		end
	else
		button.shoudShow = false
		return false
	end

	button.shoudShow = false
	return false
end

local function PostUpdateBuffIcon(self,unit,button,index,position,duration,expiration,debuffType,isStealable)
	--[[ Callback: Auras:PostUpdateIcon(unit, button, index, position)
	Called after the aura button has been updated.

	* self		- the widget holding the aura buttons
	* unit		- the unit on which the aura is cast (string)
	* button	  - the updated aura button (Button)
	* index	   - the index of the aura (number)
	* position	- the actual position of the aura button (number)
	* duration	- the aura duration in seconds (number?)
	* expiration  - the point in time when the aura will expire. Comparable to GetTime() (number)
	* debuffType  - the debuff type of the aura (string?)['Curse', 'Disease', 'Magic', 'Poison']
	* isStealable - whether the aura can be stolen or purged (boolean)
	--]]
	if button.shoudShow and button.shoudShow == false then return end

	local BuffTypes
	if UnitIsFriend('player',unit) then
		BuffTypes = 'None' -- Cannot dispel friendly buffs
	else
		BuffTypes = BuffDispel[PlayerClass][RUF.Specialization]
	end
	local removable = false
	if BuffTypes == 'None' then
		removable = false
	else
		for k,v in pairs(BuffTypes) do
			if v == debuffType then
				removable = true
			end
		end
	end

	local r,g,b,a = unpack(RUF.db.profile.Appearance.Colors.Aura.DefaultBuff)
	if ((RUF.db.profile.Appearance.Aura.OnlyDispellable == true and removable == true) or RUF.db.profile.Appearance.Aura.OnlyDispellable == false) and debuffType then
		if RUF.db.profile.Appearance.Aura.Buff == true then
			r,g,b,a = unpack(RUF.db.profile.Appearance.Colors.Aura[debuffType])
		end
	end

	if self[position] then
		local icon = self[position].icon
		local profileReference = RUF.db.profile.unit[self.__owner.frame].Buffs.Icons
		local left,right,top,bottom = RUF:IconTextureTrim(true,profileReference.Width,profileReference.Height)
		icon:SetTexCoord(left,right,top,bottom)
		local border = self[position].border
		border:SetBackdrop({edgeFile = LSM:Fetch("border", RUF.db.profile.Appearance.Aura.Border.Style.edgeFile), edgeSize = RUF.db.profile.Appearance.Aura.Border.Style.edgeSize})
		border:SetBackdropBorderColor(r,g,b,a)
		local borderOffset = RUF.db.profile.Appearance.Aura.Border.Offset
		if borderOffset == 0 then
			border:SetPoint("TOPLEFT",button,"TOPLEFT",0,0)
			border:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",0,0)
		else
			border:SetPoint("TOPLEFT",button,"TOPLEFT",-borderOffset,borderOffset)
			border:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",borderOffset,-borderOffset)
		end
		local pixel = self[position].pixel
		pixel:SetBackdrop({edgeFile = LSM:Fetch("border", RUF.db.profile.Appearance.Aura.Pixel.Style.edgeFile), edgeSize = RUF.db.profile.Appearance.Aura.Pixel.Style.edgeSize})
		local pixelr,pixelg,pixelb,pixela = unpack(RUF.db.profile.Appearance.Colors.Aura.Pixel)
		pixel:SetBackdropBorderColor(pixelr,pixelg,pixelb,pixela)
		if RUF.db.profile.Appearance.Aura.Pixel.Enabled == true then
			pixel:Show()
		else
			pixel:Hide()
		end
		local PixelOffset = RUF.db.profile.Appearance.Aura.Pixel.Offset
		if PixelOffset == 0 then
			pixel:SetPoint("TOPLEFT",button,"TOPLEFT",0,0)
			pixel:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",0,0)
		else
			pixel:SetPoint("TOPLEFT",button,"TOPLEFT",-PixelOffset,PixelOffset)
			pixel:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",PixelOffset,-PixelOffset)
		end
	end

end

function RUF.SetBuffs(self, unit)
	_, PlayerClass = UnitClass('player')
	if RUF.Client == 1 then
		-- GetSpecialization doesn't exist for Classic. All 'specs' can dispel the same types, so set to 10 to follow those values where appropriate.
		RUF.Specialization = GetSpecialization()
	else
		RUF.Specialization = 10
	end
	local Buffs = CreateFrame('Frame', self:GetName()..'.Buffs', self)
	Buffs:SetPoint(
		RUF.db.profile.unit[unit].Buffs.Icons.Position.AnchorFrom,
		RUF.GetAuraAnchorFrame(self,unit,'Buffs'),
		RUF.db.profile.unit[unit].Buffs.Icons.Position.AnchorTo,
		RUF.db.profile.unit[unit].Buffs.Icons.Position.x,
		RUF.db.profile.unit[unit].Buffs.Icons.Position.y)

	Buffs:SetSize((RUF.db.profile.unit[unit].Buffs.Icons.Width * RUF.db.profile.unit[unit].Buffs.Icons.Columns), (RUF.db.profile.unit[unit].Buffs.Icons.Height * RUF.db.profile.unit[unit].Buffs.Icons.Rows) + 2) -- x,y size of buff holder frame
	Buffs.size = RUF.db.profile.unit[unit].Buffs.Icons.Width
	Buffs.width = RUF.db.profile.unit[unit].Buffs.Icons.Width
	Buffs.height = RUF.db.profile.unit[unit].Buffs.Icons.Height
	Buffs['growth-x'] = RUF.db.profile.unit[unit].Buffs.Icons.Growth.x
	Buffs['growth-y'] = RUF.db.profile.unit[unit].Buffs.Icons.Growth.y
	Buffs.initialAnchor = RUF.db.profile.unit[unit].Buffs.Icons.Position.AnchorFrom -- Where icons spawn from in the buff frame
	Buffs['spacing-x'] = RUF.db.profile.unit[unit].Buffs.Icons.Spacing.x
	Buffs['spacing-y'] = RUF.db.profile.unit[unit].Buffs.Icons.Spacing.y

	if RUF.db.profile.unit[unit].Buffs.Icons.ClickThrough == true then
		Buffs.disableMouse = true
	else
		Buffs.disableMouse = false
	end

	if RUF.db.profile.unit[unit].Buffs.Icons.CooldownSpiral == true then
		Buffs.disableCooldown = false
	else
		Buffs.disableCooldown = true
	end

	Buffs.num = RUF.db.profile.unit[unit].Buffs.Icons.Max

	Buffs.CustomFilter = CustomBuffFilter
	Buffs.CreateIcon = RUF.CreateAuraIcon
	Buffs.PostUpdateIcon = PostUpdateBuffIcon
	Buffs.Enabled = true


	self.Buffs = Buffs
end