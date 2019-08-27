local RUF = RUF or LibStub("AceAddon-3.0"):GetAddon("RUF")
local LSM = LibStub("LibSharedMedia-3.0")
local _, ns = ...
local oUF = ns.oUF

if RUF.Client == 1 then
	local function GetCurrentSpec()
		RUF.Specialization = GetSpecialization()
	end

	local TalenMonitor = CreateFrame("Frame")
	TalenMonitor:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	TalenMonitor:SetScript("OnEvent",GetCurrentSpec)
end

function RUF.GetAuraAnchorFrame(self,unit,aura)
	local AnchorFrame = "Frame"
	if RUF.db.profile.unit[unit][aura].Icons.Position.AnchorFrame == "Frame" then
		AnchorFrame = self:GetName()
	else
		--AnchorFrame = self:GetName().."."..RUF.db.profile.unit[unit].Frame.Indicators[indicator].Position.AnchorFrame.."Indicator"
		AnchorFrame = self:GetName()
		if not _G[AnchorFrame] then
			AnchorFrame = self:GetName()
		end
	end
	return AnchorFrame
end

function UpdateTooltip(self)
	GameTooltip:SetUnitAura(self:GetParent().__owner.unit, self:GetID(), self.filter)
end

local function onEnter(self)
	if(not self:IsVisible()) then return end

	GameTooltip:SetOwner(self, 'ANCHOR_BOTTOMRIGHT')
	self:UpdateTooltip()
end

local function onLeave()
	GameTooltip:Hide()
end

function RUF.CreateAuraIcon(element, index)
	local button = CreateFrame('Button', element:GetDebugName() .. 'Button' .. index, element)
	button:RegisterForClicks('RightButtonUp')

	local cd = CreateFrame('Cooldown', '$parentCooldown', button, 'CooldownFrameTemplate')
	cd:SetAllPoints()

	local icon = button:CreateTexture(nil, 'BORDER')
	icon:SetTexCoord(0.05,0.95,0.05,0.95)
	icon:SetAllPoints()

	local pixel = CreateFrame("Frame",nil,button)
	pixel:SetAllPoints()
	pixel:SetFrameLevel(7)
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
	elseif PixelOffset > 0 then
		pixel:SetPoint("TOPLEFT",button,"TOPLEFT",-PixelOffset,PixelOffset)
		pixel:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",PixelOffset,-PixelOffset)
	elseif PixelOffset < 0 then
		pixel:SetPoint("TOPLEFT",button,"TOPLEFT",-PixelOffset,PixelOffset)
		pixel:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",PixelOffset,-PixelOffset)
	end
	button.pixel = pixel

	local border = CreateFrame("Frame",nil,button)
	border:SetAllPoints()
	border:SetFrameLevel(8)
	border:SetBackdrop({edgeFile = LSM:Fetch("border", RUF.db.profile.Appearance.Aura.Border.Style.edgeFile), edgeSize = RUF.db.profile.Appearance.Aura.Border.Style.edgeSize})
	local borderr,borderg,borderb,bordera = unpack(RUF.db.profile.Appearance.Colors.Aura.DefaultBuff)
	border:SetBackdropBorderColor(borderr,borderg,borderb,bordera)

	local BorderOffset = RUF.db.profile.Appearance.Aura.Border.Offset
	if BorderOffset == 0 then
		border:SetPoint("TOPLEFT",button,"TOPLEFT",0,0)
		border:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",0,0)
	elseif BorderOffset > 0 then
		border:SetPoint("TOPLEFT",button,"TOPLEFT",-BorderOffset,BorderOffset)
		border:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",BorderOffset,-BorderOffset)
	elseif BorderOffset < 0 then
		border:SetPoint("TOPLEFT",button,"TOPLEFT",-BorderOffset,BorderOffset)
		border:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT",BorderOffset,-BorderOffset)
	end
	button.border = border

	local count = button:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal')
	count:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', -1, 0)

	local stealable = button:CreateTexture(nil, 'OVERLAY')
	stealable:SetTexture([[Interface\TargetingFrame\UI-TargetingFrame-Stealable]])
	stealable:SetPoint('TOPLEFT', -3, 3)
	stealable:SetPoint('BOTTOMRIGHT', 3, -3)
	stealable:SetBlendMode('ADD')
	button.stealable = stealable

	button.UpdateTooltip = UpdateTooltip
	button:SetScript('OnEnter', onEnter)
	button:SetScript('OnLeave', onLeave)

	button.icon = icon
	button.count = count
	button.cd = cd

	--[[ Callback: Auras:PostCreateIcon(button)
	Called after a new aura button has been created.

	* self   - the widget holding the aura buttons
	* button - the newly created aura button (Button)
	--]]
	if(element.PostCreateIcon) then element:PostCreateIcon(button) end

	return button
end