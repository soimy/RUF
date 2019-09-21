local RUF = LibStub('AceAddon-3.0'):GetAddon('RUF')
local L = LibStub('AceLocale-3.0'):GetLocale('RUF')
local RUF_Options = RUF:GetModule('Options')
local LSM = LibStub('LibSharedMedia-3.0')
local _,ns = ...
local oUF = ns.oUF
local _,PlayerClass = UnitClass('player')
local TestModeToggle,UnitsSpawned
local anchorSwaps = {
	["BOTTOM"] = "TOP",
	["BOTTOMLEFT"] = "TOPRIGHT",
	["BOTTOMRIGHT"] = "TOPLEFT",
	["CENTER"] = "CENTER",
	["LEFT"] = "RIGHT",
	["RIGHT"] = "LEFT",
	["TOP"] = "BOTTOM",
	["TOPLEFT"] = "BOTTOMRIGHT",
	["TOPRIGHT"] = "BOTTOMLEFT",
}

function RUF:NickValidator(string)
	if (string.len(string) > 12) then
		return 'Length'
	end
	if string.find(string,'%p') then
		return 'Letters'
	end
	if string.find(string,'%d') then
		return 'Letters'
	end
	if string.find(string,'%s%s+') then
		return 'Spaces'
	end
	local numSpaces = select(2,string.gsub(string,'%s',''))
	if numSpaces then
		if numSpaces > 2 then
			return 'Spaces'
		end
	end
		return true
end

function RUF:UpdateFramePosition(unitFrame,singleFrame,groupFrame,header,i,anchorFrom,anchorFrame,anchorTo,offsetX,offsetY)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end
	local profileReference
	if header ~= 'none' then
		profileReference = RUF.db.profile.unit[string.lower(header)].Frame.Position
	else
		if i == -1 then
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)].Frame.Position
		else
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)].Frame.Position
		end
	end


	anchorFrom = anchorFrom or profileReference.AnchorFrom
	anchorFrame = anchorFrame or profileReference.AnchorFrame
	anchorTo = anchorTo or profileReference.AnchorTo
	offsetX = offsetX or profileReference.x
	offsetY = offsetY or profileReference.y
	if not i then
		unitFrame:ClearAllPoints()
		unitFrame:SetPoint(anchorFrom,anchorFrame,anchorTo,offsetX,offsetY)
	else
		if i == 1 then
			unitFrame:ClearAllPoints()
			unitFrame:SetPoint(anchorFrom,anchorFrame,anchorTo,offsetX,offsetY)
		else
			local groupAnchorFrom
			if profileReference.growth == "BOTTOM" then
				groupAnchorFrom = "TOP"
			elseif profileReference.growth == "TOP" then
				groupAnchorFrom = "BOTTOM"
			end
			local spacingX = profileReference.offsetx
			local spacingY = profileReference.offsety
			local _,originalAnchorFrame,originalAnchorTo = unitFrame:GetPoint()
			unitFrame:ClearAllPoints()
			unitFrame:SetPoint(groupAnchorFrom,originalAnchorFrame,profileReference.growth,spacingX,spacingY)
		end
	end

end

function RUF:OptionsUpdateCastbars()
	-- TODO Castbar Text
	for k,v in next,oUF.objects do
		if v.Castbar then
			local Bar = v.Castbar
			local Border = Bar.Border
			local Background = Bar.Background
			local Time = Bar.Time
			local Text = Bar.Text
			local profileReference = RUF.db.profile.Appearance.Bars.Cast
			local unitProfile = RUF.db.profile.unit[v.frame].Frame.Bars.Cast
			local texture = LSM:Fetch("statusbar",profileReference.Texture)

			Bar:SetStatusBarTexture(texture)
			Bar:SetFillStyle(unitProfile.Fill)
			Bar:SetWidth(unitProfile.Width)
			Bar:SetHeight(unitProfile.Height)
			local anchorFrame
			if unitProfile.Position.AnchorFrame == true then
				anchorFrame = v
			else
				anchorFrame = 'UIParent'
			end
			Bar:ClearAllPoints()
			Bar:SetPoint(
				unitProfile.Position.AnchorFrom,
				anchorFrame,
				unitProfile.Position.AnchorTo,
				unitProfile.Position.x,
				unitProfile.Position.y
			)

			Border:SetBackdrop({edgeFile = LSM:Fetch("border",profileReference.Border.Style.edgeFile),edgeSize = profileReference.Border.Style.edgeSize})
			local borderr,borderg,borderb = unpack(profileReference.Border.Color)
			Border:SetBackdropBorderColor(borderr,borderg,borderb,profileReference.Border.Alpha)

			local r,g,b = RUF:GetBarColor(Bar,v.frame,"Cast")
			Bar:SetStatusBarColor(r,g,b)
			if profileReference.Background.UseBarColor == false then
				r,g,b = unpack(profileReference.Background.CustomColor)
			end
			local Multiplier = profileReference.Background.Multiplier
			Background:SetTexture(LSM:Fetch("background","Solid"))
			Background:SetVertexColor(r*Multiplier,g*Multiplier,b*Multiplier,profileReference.Background.Alpha)
			Background:SetAllPoints(Bar)
			Background.colorSmooth = false

			Time:ClearAllPoints()
			Text:ClearAllPoints()
			if unitProfile.Fill == "REVERSE" then
				Time:SetPoint('LEFT',Bar,4,0)
				Text:SetPoint('RIGHT',Bar,-4,0)
			else
				Time:SetPoint('RIGHT',Bar,-4,0)
				Text:SetPoint('LEFT',Bar,4,0)
			end
			if unitProfile.Enabled == false then
				v:DisableElement('Castbar')
				v.Castbar:Hide()
			else
				v:EnableElement('Castbar')
				v.Castbar:Show()
			end
		end
	end
end

function RUF:OptionsUpdateFrameBorders()
	for k,v in next,oUF.objects do
		local Border = v.Border
		local offset = RUF.db.profile.Appearance.Border.Offset
		Border:SetPoint('TOPLEFT',v,'TOPLEFT',-offset,offset)
		Border:SetPoint('BOTTOMRIGHT',v,'BOTTOMRIGHT',offset,-offset)
		Border:SetBackdrop({edgeFile = LSM:Fetch('border',RUF.db.profile.Appearance.Border.Style.edgeFile),edgeSize = RUF.db.profile.Appearance.Border.Style.edgeSize})
		local r,g,b = unpack(RUF.db.profile.Appearance.Border.Color)
		Border:SetBackdropBorderColor(r,g,b,RUF.db.profile.Appearance.Border.Alpha)

		if v.GlowBorder then
			local GlowBorder = v.GlowBorder
			local glowProfile = RUF.db.profile.Appearance.Border.Glow
			if glowProfile.Enabled ~= true then
				v:UnregisterEvent('UNIT_AURA',RUF.UpdateAuraNotifications)
				v:UnregisterEvent('UNIT_TARGET',RUF.UpdateAuraNotifications)
			else
				v:RegisterEvent('UNIT_AURA',RUF.UpdateAuraNotifications,true)
				v:RegisterEvent('UNIT_TARGET',RUF.UpdateAuraNotifications,true)
				GlowBorder:SetPoint('TOPLEFT',v,'TOPLEFT',-glowProfile.Offset,glowProfile.Offset)
				GlowBorder:SetPoint('BOTTOMRIGHT',v,'BOTTOMRIGHT',glowProfile.Offset,-glowProfile.Offset)
				GlowBorder:SetBackdrop({edgeFile = LSM:Fetch('border',glowProfile.Style.edgeFile),edgeSize = glowProfile.Style.edgeSize})
				GlowBorder:SetBackdropBorderColor(0,0,0,glowProfile.Alpha)
			end
		end
	end
end

function RUF:OptionsUpdateAllAuras()
	for k,v in next,oUF.objects do
		v.Buff:ForceUpdate()
		v.Debuff:ForceUpdate()
	end
end

function RUF:OptionsUpdateAuras(singleFrame,groupFrame,header,auraType)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end
	if not auraType then return end

	local function UpdateAura(singleFrame,groupFrame,header,auraType,i)
		local currentUnit,unitFrame,profileReference

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
			profileReference = RUF.db.profile.unit[string.lower(header)][auraType].Icons
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)][auraType].Icons
		else
			currentUnit = singleFrame
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)][auraType].Icons
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]
		local currentElement = unitFrame[auraType:sub(1,-2)]
		if not currentElement then return end
		currentElement:ClearAllPoints()
		currentElement:SetPoint(
			profileReference.Position.AnchorFrom,
			unitFrame,
			profileReference.Position.AnchorTo,
			profileReference.Position.x,
			profileReference.Position.y
		)
		currentElement.size = profileReference.Width
		currentElement.width = profileReference.Width
		currentElement.height = profileReference.Height
		currentElement['spacing-x'] = profileReference.Spacing.x
		currentElement['spacing-y'] = profileReference.Spacing.y
		currentElement.num = profileReference.Max
		currentElement['growth-x'] = profileReference.Growth.x
		currentElement['growth-y'] = profileReference.Growth.y
		currentElement.initialAnchor = profileReference.Position.AnchorFrom
		currentElement.disableMouse = profileReference.ClickThrough
		currentElement:SetSize((profileReference.Width * profileReference.Columns),(profileReference.Height * profileReference.Rows) + 2)

		currentElement.Enabled = profileReference.Enabled
		currentElement:ForceUpdate()
		if profileReference.Enabled == true then
			unitFrame:EnableElement('Aura_Plugin')
			currentElement:Show()
		else
			unitFrame:DisableElement('Aura_Plugin')
			currentElement:Hide()
		end
		currentElement:ForceUpdate()

	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			UpdateAura(singleFrame,groupFrame,header,auraType,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			UpdateAura(singleFrame,groupFrame,header,auraType,i)
		end
	elseif singleFrame ~= 'none' then
		UpdateAura(singleFrame,groupFrame,header,auraType,-1)
	end

end

function RUF:OptionsUpdateAllIndicators()
	local frames = RUF.frameList.frames
	local groupFrames = RUF.frameList.groupFrames
	local headers = RUF.frameList.headers

	for i = 1,#frames do
		if _G['oUF_RUF_' .. frames[i]] then
			RUF.RefreshTextElements(frames[i],nil,nil,-1)
			for k,v in pairs(RUF.db.profile.unit[string.lower(frames[i])].Frame.Indicators) do
				if v ~= '' then
					RUF:OptionsUpdateIndicators(frames[i],nil,nil,k)
				end
			end
		end
	end
	for i = 1,#groupFrames do
		if _G['oUF_RUF_' .. groupFrames[i]] then
			for groupNum = 1,5 do
				RUF.RefreshTextElements(nil,groupFrames[i],nil,groupNum)
			end
			for k,v in pairs(RUF.db.profile.unit[string.lower(groupFrames[i])].Frame.Indicators) do
				if v ~= '' then
					RUF:OptionsUpdateIndicators(nil,groupFrames[i],nil,k)
				end
			end
		end
	end
	for i = 1,#headers do
		if _G['oUF_RUF_' .. headers[i]] then
			local headerUnits = { _G['oUF_RUF_' .. headers[i]]:GetChildren() }
			headerUnits[#headerUnits] = nil -- Remove MoveBG from list
			for groupNum = 1,#headerUnits do
				RUF.RefreshTextElements(nil,headers[i],nil,groupNum)
			end
			for k,v in pairs(RUF.db.profile.unit[string.lower(groupFrames[i])].Frame.Indicators) do
				if v ~= '' then
					RUF:OptionsUpdateIndicators(nil,groupFrames[i],nil,k)
				end
			end
		end
	end

end

function RUF:OptionsUpdateIndicators(singleFrame,groupFrame,header,indicator)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end
	if not indicator then return end

	local function UpdateIndicator(singleFrame,groupFrame,header,indicator,i)
		local currentUnit,unitFrame,profileReference

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
			profileReference = RUF.db.profile.unit[string.lower(header)].Frame.Indicators[indicator]
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)].Frame.Indicators[indicator]
		else
			currentUnit = singleFrame
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)].Frame.Indicators[indicator]
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]

		local currentIndicator = unitFrame[indicator .. 'Indicator']
		if not currentIndicator then return end -- When refresh profile,ensure we don't try to update indicators that don't exist.
		currentIndicator:SetFont([[Interface\Addons\RUF\Media\RUF.ttf]],profileReference.Size,"OUTLINE")
		currentIndicator:ClearAllPoints()
		currentIndicator:SetPoint(
			profileReference.Position.AnchorFrom,
			RUF.GetIndicatorAnchorFrame(unitFrame,unitFrame.frame,indicator), -- Args: Frame, Unit, Element
			profileReference.Position.AnchorTo,
			profileReference.Position.x,
			profileReference.Position.y
		)
		currentIndicator.Enabled = profileReference.Enabled
		currentIndicator:ForceUpdate()

	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			UpdateIndicator(singleFrame,groupFrame,header,indicator,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			UpdateIndicator(singleFrame,groupFrame,header,indicator,i)
		end
	elseif singleFrame ~= 'none' then
		UpdateIndicator(singleFrame,groupFrame,header,indicator,-1)
	end

end

function RUF:OptionsAddTexts(singleFrame,groupFrame,header,textName)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end
	if not textName then return end

	local function AddText(singleFrame,groupFrame,header,textName,i)
		local currentUnit,unitFrame

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
		else
			currentUnit = singleFrame
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]

		RUF.CreateTextArea(unitFrame,unitFrame.frame,textName) -- Args: self,unit,textName
		RUF.SetTextPoints(unitFrame,unitFrame.frame,textName)
	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			AddText(singleFrame,groupFrame,header,textName,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			AddText(singleFrame,groupFrame,header,textName,i)
		end
	elseif singleFrame ~= 'none' then
		AddText(singleFrame,groupFrame,header,textName,-1)
	end

end

function RUF:OptionsDisableTexts(singleFrame,groupFrame,header,textName)

	local function RemoveText(singleFrame,groupFrame,header,textName,i)
		local currentUnit,unitFrame,profileReference

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
			profileReference = RUF.db.profile.unit[string.lower(header)].Frame.Text[textName]
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)].Frame.Text[textName]
		else
			currentUnit = singleFrame
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)].Frame.Text[textName]
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]

		if profileReference == 'DISABLED' then
			unitFrame.Text[textName]:Hide()
			unitFrame:Untag(unitFrame.Text[textName])
		end

	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			RemoveText(singleFrame,groupFrame,header,textName,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			RemoveText(singleFrame,groupFrame,header,textName,i)
		end
	elseif singleFrame ~= 'none' then
		RemoveText(singleFrame,groupFrame,header,textName,-1)
	end

end

function RUF:OptionsUpdateAllTexts()
	local frames = RUF.frameList.frames
	local groupFrames = RUF.frameList.groupFrames
	local headers = RUF.frameList.headers

	for i = 1,#frames do
		if _G['oUF_RUF_' .. frames[i]] then
			RUF.RefreshTextElements(frames[i],nil,nil,-1)
			for k,v in pairs(RUF.db.profile.unit[string.lower(frames[i])].Frame.Text) do
				if v ~= '' then
					RUF:OptionsUpdateTexts(frames[i],nil,nil,k)
				end
			end
		end
	end
	for i = 1,#groupFrames do
		if _G['oUF_RUF_' .. groupFrames[i]] then
			for groupNum = 1,5 do
				RUF.RefreshTextElements(nil,groupFrames[i],nil,groupNum)
			end
			for k,v in pairs(RUF.db.profile.unit[string.lower(groupFrames[i])].Frame.Text) do
				if v ~= '' then
					RUF:OptionsUpdateTexts(nil,groupFrames[i],nil,k)
				end
			end
		end
	end
	for i = 1,#headers do
		if _G['oUF_RUF_' .. headers[i]] then
			local headerUnits = { _G['oUF_RUF_' .. headers[i]]:GetChildren() }
			headerUnits[#headerUnits] = nil -- Remove MoveBG from list
			for groupNum = 1,#headerUnits do
				RUF.RefreshTextElements(nil,headers[i],nil,groupNum)
			end
			for k,v in pairs(RUF.db.profile.unit[string.lower(groupFrames[i])].Frame.Text) do
				if v ~= '' then
					RUF:OptionsUpdateTexts(nil,groupFrames[i],nil,k)
				end
			end
		end
	end

end

function RUF:OptionsUpdateTexts(singleFrame,groupFrame,header,text)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end
	if not text then return end

	local function UpdateText(singleFrame,groupFrame,header,text,i)
		local currentUnit,unitFrame,profileReference

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
			profileReference = RUF.db.profile.unit[string.lower(header)].Frame.Text[text]
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)].Frame.Text[text]
		else
			currentUnit = singleFrame
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)].Frame.Text[text]
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]

		local currentText = unitFrame.Text[text].String
		if not currentText then return end -- When refresh profile,ensure we don't try to update indicators that don't exist.
		currentText:SetFont(LSM:Fetch('font',profileReference.Font),profileReference.Size,profileReference.Outline)
		currentText:SetShadowColor(0,0,0,profileReference.Shadow)
		currentText:ClearAllPoints()
		local anchorFrame
		if profileReference.Position.AnchorFrame == "Frame" then
			anchorFrame = unitFrame
		else
			anchorFrame = unitFrame.Text[profileReference.Position.AnchorFrame].String
		end
		if not profileReference.Position.AnchorTo then -- Update all existing text elements from before this change so they have the correct anchor points.
			local reverseAnchor = profileReference.Position.Anchor
			profileReference.Position.AnchorTo = reverseAnchor
			if profileReference.Position.AnchorFrame ~= 'Frame' then
				reverseAnchor = anchorSwaps[reverseAnchor]
			end
			profileReference.Position.Anchor = reverseAnchor
		end
		if profileReference.CustomWidth then
			currentText:SetWidth(profileReference.Width)
			currentText:SetJustifyH(profileReference.Justify)
		else
			currentText:SetWidth(0)
		end
		currentText:SetPoint(
			profileReference.Position.Anchor,
			anchorFrame,
			profileReference.Position.AnchorTo,
			profileReference.Position.x,
			profileReference.Position.y
		)
		if profileReference.Enabled then
			unitFrame:Tag(currentText,profileReference.Tag)
			currentText:UpdateTag()
			currentText:Show()
		else
			unitFrame:Untag(currentText)
			currentText:SetText('')
			currentText:Hide()
		end
	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			UpdateText(singleFrame,groupFrame,header,text,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			UpdateText(singleFrame,groupFrame,header,text,i)
		end
	elseif singleFrame ~= 'none' then
		UpdateText(singleFrame,groupFrame,header,text,-1)
	end

end

function RUF:OptionsUpdateFrame(singleFrame,groupFrame,header)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end

	local function UpdateFrame(singleFrame,groupFrame,header,i)
		local currentUnit,unitFrame,profileReference

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
			profileReference = RUF.db.profile.unit[string.lower(header)]
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)]
		else
			currentUnit = singleFrame
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)]
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]

		if header == 'none' then
			if profileReference.Enabled == false then
				unitFrame:Disable()
			else
				unitFrame:Enable()
			end
		else
			local headerFrame = _G['oUF_RUF_' .. header]
			headerFrame.Enabled = profileReference.Enabled
			if RUF.db.global.TestMode == true then
				if profileReference.Enabled == false then
					RegisterAttributeDriver(headerFrame,'state-visibility',"hide")
					unitFrame:Hide()
				else
					RegisterAttributeDriver(headerFrame,'state-visibility',"show")
					unitFrame:Show()
				end
			else
				if profileReference.Enabled == false then
					unitFrame:Disable()
					RegisterAttributeDriver(headerFrame,'state-visibility',"hide")
				else
					unitFrame:Enable()
					RegisterAttributeDriver(headerFrame,'state-visibility',headerFrame.visibility)
				end
			end
		end

		if profileReference.Frame.RangeFading.Enabled == true then
			unitFrame:EnableElement('RangeCheck')
			unitFrame.RangeCheck = {
				enabled = profileReference.Frame.RangeFading.Enabled,
				insideAlpha = 1,
				outsideAlpha = profileReference.Frame.RangeFading.Alpha or 1,
			}
		else
			unitFrame:DisableElement('RangeCheck')
		end

		unitFrame:SetWidth(profileReference.Frame.Size.Width)
		unitFrame:SetHeight(profileReference.Frame.Size.Height)

		if i == -1 then
			RUF:UpdateFramePosition(unitFrame,singleFrame)
		end

		if groupFrame ~= 'none' then
			local anchorFrom
			if profileReference.Frame.Position.growth == "BOTTOM" then
				anchorFrom = "TOP"
			elseif profileReference.Frame.Position.growth == "TOP" then
				anchorFrom = "BOTTOM"
			end
			if i == 1 then
				RUF:UpdateFramePosition(unitFrame,singleFrame,groupFrame,header,i)
			else
				RUF:UpdateFramePosition(unitFrame,singleFrame,groupFrame,header,i,anchorFrom,_G['oUF_RUF_' .. groupFrame .. i-1])
			end
		end

		if header ~= 'none' then
			local headerFrame = _G['oUF_RUF_' .. header]
			local anchorFrom
			if profileReference.Frame.Position.growth == "BOTTOM" then
				anchorFrom = "TOP"
			elseif profileReference.Frame.Position.growth == "TOP" then
				anchorFrom = "BOTTOM"
			end
			headerFrame:SetAttribute("Point",anchorFrom)
			headerFrame:SetAttribute('yOffset',profileReference.Frame.Position.offsety)
			RUF:UpdateFramePosition(headerFrame,singleFrame,groupFrame,header)
		end

	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			UpdateFrame(singleFrame,groupFrame,header,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			UpdateFrame(singleFrame,groupFrame,header,i)
		end
	elseif singleFrame ~= 'none' then
		UpdateFrame(singleFrame,groupFrame,header,-1)
	end

end

function RUF:OptionsUpdateAllBars()
	local frames = RUF.frameList.frames
	local groupFrames = RUF.frameList.groupFrames
	local headers = RUF.frameList.headers

	for i = 1,#frames do
		if _G['oUF_RUF_' .. frames[i]] then
			RUF:OptionsUpdateBars(frames[i],nil,nil,'Health')
			RUF:OptionsUpdateBars(frames[i],nil,nil,'Power')
			if _G['oUF_RUF_' .. frames[i]].Castbar then
				_G['oUF_RUF_' .. frames[i]].Castbar:UpdateOptions()
			end
			if RUF.Client == 1 then
				RUF:OptionsUpdateBars(frames[i],nil,nil,'Absorb')
				if i == 1 then
					RUF:OptionsUpdateBars(frames[i],nil,nil,'Class')
				end
			end
		end
	end
	for i = 1,#groupFrames do
		RUF:OptionsUpdateBars(nil,groupFrames[i],nil,'Health')
		RUF:OptionsUpdateBars(nil,groupFrames[i],nil,'Power')
		if RUF.Client == 1 then
			RUF:OptionsUpdateBars(nil,groupFrames[i],nil,'Absorb')
		end
	end
	for i = 1,#headers do
		RUF:OptionsUpdateBars(nil,nil,headers[i],'Health')
		RUF:OptionsUpdateBars(nil,nil,headers[i],'Power')
		if RUF.Client == 1 then
			RUF:OptionsUpdateBars(nil,nil,headers[i],'Absorb')
		end
	end
end

function RUF:OptionsUpdateBars(singleFrame,groupFrame,header,bar)
	if not singleFrame then singleFrame = 'none' end
	if not groupFrame then groupFrame = 'none' end
	if not header then header = 'none' end
	if not bar then return end

	local function UpdateBar(singleFrame,groupFrame,header,bar,i)
		local currentUnit,unitFrame,profileReference

		if header ~= 'none' then
			currentUnit = header .. 'UnitButton' .. i
			profileReference = RUF.db.profile.unit[string.lower(header)].Frame.Bars[bar]
		elseif groupFrame ~= 'none' then
			currentUnit = groupFrame .. i
			profileReference = RUF.db.profile.unit[string.lower(groupFrame)].Frame.Bars[bar]
		else
			currentUnit = singleFrame
			profileReference = RUF.db.profile.unit[string.lower(singleFrame)].Frame.Bars[bar]
		end
		unitFrame = _G['oUF_RUF_' .. currentUnit]
		local originalBar = bar
		if bar == 'Class' then
			if PlayerClass == 'DEATHKNIGHT' then
				bar = 'Runes'
			elseif PlayerClass == 'PRIEST' or PlayerClass == 'SHAMAN' then
				bar = 'FakeClassPower'
			else
				bar = 'ClassPower'
			end
		end
		unitFrame[bar].UpdateOptions(unitFrame[bar])
		unitFrame[bar]:ForceUpdate()
		if bar then
			unitFrame[bar].UpdateOptions(unitFrame[bar])
			if PlayerClass == 'MONK' then
				if unitFrame['Stagger'] then
					unitFrame['Stagger'].UpdateOptions(unitFrame['Stagger'])
				end
			end
			if PlayerClass == 'DRUID' then
				if unitFrame['FakeClassPower'] then
					unitFrame['FakeClassPower'].UpdateOptions(unitFrame['FakeClassPower'])
				end
			end
		end
		if bar == 'Power' or bar == 'Absorb' then
				if profileReference.Enabled == 0 then
					unitFrame:DisableElement(bar)
				elseif profileReference.Enabled == 1 then
					unitFrame[bar].hideAtZero = true
					unitFrame:DisableElement(bar)
					unitFrame:EnableElement(bar)
					unitFrame[bar]:ForceUpdate()
				else
					unitFrame[bar].hideAtZero = false
					unitFrame:DisableElement(bar)
					unitFrame:EnableElement(bar)
					unitFrame[bar]:ForceUpdate()
				end
		elseif originalBar == 'Class' then
			if profileReference.Enabled == true then
				unitFrame:EnableElement(bar)
				if unitFrame[bar] then
					unitFrame[bar]:ForceUpdate()
				end
				if PlayerClass == 'MONK' then
					unitFrame:EnableElement('Stagger')
					unitFrame['Stagger']:ForceUpdate()
				end
				if PlayerClass == 'DRUID' then
					unitFrame:EnableElement('FakeClassPower')
					unitFrame['FakeClassPower']:ForceUpdate()
				end
			else
				unitFrame:DisableElement(bar)
				if PlayerClass == 'MONK' then
					unitFrame:DisableElement('Stagger')
				end
				if PlayerClass == 'DRUID' then
					unitFrame:DisableElement('FakeClassPower')
				end
			end
		end
	end

	if header ~= 'none' then
		local headerUnits = { _G['oUF_RUF_' .. header]:GetChildren() }
		headerUnits[#headerUnits] = nil -- Remove moveBG entry
		for i = 1,#headerUnits do
			UpdateBar(singleFrame,groupFrame,header,bar,i)
		end
	elseif groupFrame ~= 'none' then
		for i = 1,5 do
			UpdateBar(singleFrame,groupFrame,header,bar,i)
		end
	elseif singleFrame ~= 'none' then
		UpdateBar(singleFrame,groupFrame,header,bar,-1)
	end

end

function RUF:SpawnUnits()
	if UnitsSpawned == true then return end
	TestModeToggle = true

	local headers = RUF.frameList.headers
	local partyNum,petNum = 0,0
	if IsInGroup() then
		partyNum = GetNumSubgroupMembers()
		for i = 1,partyNum do
			if UnitExists('partypet' .. i) then
				petNum = petNum + 1
			end
		end
	end
	for i = 1,#headers do
		if headers[i] == 'PartyPet' then partyNum = petNum end
		local currentHeader = _G['oUF_RUF_' .. headers[i]]
		currentHeader:SetAttribute('startingIndex',-3 + partyNum)
		if currentHeader.Enabled then
			RegisterAttributeDriver(currentHeader,'state-visibility','show')
		end
	end

	for k,v in next,oUF.objects do
		v.oldUnit = v.unit
		if v.realUnit then v.oldUnit = v.realUnit end
		v:SetAttribute('unit','player')
		v:Disable()
		if RUF.db.profile.unit[v.frame].Enabled then
			if RUF.db.global.TestModeShowUnits then
				v.Text.DisplayName:Show()
			else
				v.Text.DisplayName:Hide()
			end
			v:Show()
		else
			v:Hide()
		end
		if v.Castbar then
			v.Castbar:Show()
			v.Castbar:OnUpdate()
		end
	end
	UnitsSpawned = true
end

function RUF:RestoreUnits()
	if UnitsSpawned ~= true then return end
	TestModeToggle = false

	local headers = RUF.frameList.headers
	local partyNum = GetNumSubgroupMembers()
	for i = 1,#headers do
		local currentHeader = _G['oUF_RUF_' .. headers[i]]
		currentHeader:SetAttribute('startingIndex',1)
		if currentHeader.Enabled then
			RegisterAttributeDriver(currentHeader,'state-visibility',currentHeader.visibility)
		else
			RegisterAttributeDriver(currentHeader,'state-visibility',"hide")
		end
	end

	for k,v in next,oUF.objects do
		if v.Castbar then
			v.Castbar:Show()
			v.Castbar:OnUpdate()
		end
		v.realUnit = v.oldUnit
		v.unit = v.oldUnit
		v:SetAttribute('unit',v.unit)
		v.Text.DisplayName:Hide()
		v:Hide()
		if RUF.db.profile.unit[v.frame].Enabled then
			v:Enable()
		else
			v:Disable()
		end
	end
	UnitsSpawned = false
end

function RUF:TestMode()
	if RUF.db.global.TestMode == true then
		if TestModeToggle ~= true and not InCombatLockdown() then
			RUF:SpawnUnits()
		elseif TestModeToggle == true and not InCombatLockdown() then
			RUF:RestoreUnits()
			RUF:SpawnUnits()
		end
	else
		if TestModeToggle == true and not InCombatLockdown() then
			RUF:RestoreUnits()
		end
	end
end

function RUF:UpdateAllUnitSettings()
	local frames = RUF.frameList.frames
	local groupFrames = RUF.frameList.groupFrames
	local headers = RUF.frameList.headers

	for i = 1,#frames do
		RUF:OptionsUpdateFrame(frames[i])
	end
	for i = 1,#groupFrames do
		RUF:OptionsUpdateFrame(nil,groupFrames[i])
	end
	for i = 1,#headers do
		RUF:OptionsUpdateFrame(nil,nil,headers[i])
	end

	RUF:OptionsUpdateAllBars()
	RUF:OptionsUpdateAllTexts()
	RUF:OptionsUpdateAllIndicators()
end