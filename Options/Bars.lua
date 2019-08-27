local RUF = LibStub('AceAddon-3.0'):GetAddon('RUF')
local L = LibStub('AceLocale-3.0'):GetLocale('RUF')
local RUF_Options = RUF:GetModule('Options')
local LSM = LibStub('LibSharedMedia-3.0')
local _, ns = ...
local oUF = ns.oUF
local _, PlayerClass = UnitClass('player')

function RUF_Options.Bars()
	local LocalisedBar = {
		[1] = L['Health'],
		[2] = L['Power'],
		[3] = L['Class'],
		[4] = L['Absorb'],
	}
	local Bar = {
		[1] = 'Health',
		[2] = 'Power',
		[3] = 'Class',
		[4] = 'Absorb',
	}
	local Bars = {
		name = L['Bars'],
		type = 'group',
		childGroups = 'tab',
		order = 1,
		args = {
		},
	}
	for i=1,4 do
		Bars.args[Bar[i]] = {
			name = LocalisedBar[i],
			type = 'group',
			order = i,
			args = {
				Texture = {
					name = L['Texture'],
					type = 'select',
					order = 0,
					values = LSM:HashTable('statusbar'),
					dialogControl = 'LSM30_Statusbar',
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Texture
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Texture = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Type = {
					name = L['Type'],
					desc = L['Not Yet Implemented.'],
					type = 'select',
					order = 0.01,
					hidden = function() return i ~= 4 end,
					disabled = true,
					values = {
						[1] = L['Health Bar Overlay'],
						[2] = L['Separate Bar'],
					},
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Type
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Type = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Animate = {
					name = L['Animate'],
					desc = L['Animate bar changes.'],
					type = 'toggle',
					order = 0.01,
					desc = '',
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Animate
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Animate = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Disconnected = {
					name = L['Color Disconnected'],
					desc = L['Colors the bar using the disconnected color if the unit is disconnected.'],
					type = 'toggle',
					order = 0.02,
					hidden = function() return (i == 4 or i == 3) end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Disconnected
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Disconnected = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Tapped = {
					name = L['Color Tapped'],
					desc = L['Colors the bar using the tapped color if the unit is tapped.'],
					type = 'toggle',
					order = 0.03,
					hidden = function() return (i == 4 or i == 3) end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Tapped
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Tapped = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Class = {
					name = L['Color Class'],
					desc = L['Color player units by class color.'],
					type = 'toggle',
					order = 0.04,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Class
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Class = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Power = {
					name = L['Color Power Type'],
					desc = L['Colors the bar using the power color.'],
					type = 'toggle',
					hidden = function() return (i == 1 or i == 4) end,
					order = 0.05,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.PowerType
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PowerType = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Reaction = {
					name = L['Color Reaction'],
					desc = L['Color unit by reaction toward the player.'],
					type = 'toggle',
					hidden = function() return i == 3 end,
					order = 0.06,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Reaction
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Reaction = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Absorb_Alpha = {
					name = L['Alpha'],
					desc = L['Overlay Alpha'],
					type = 'range',
					order = 0.07,
					hidden = i ~= 4,
					min = 0,
					max = 1,
					softMin = 0,
					softMax = 1,
					step = 0.01,
					bigStep = 0.05,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Alpha
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Alpha = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Absorb_Multiplier = {
					name = L['Brightness Multiplier'],
					desc = L["Reduce Bar color's brightness by this percentage."],
					type = 'range',
					order = 0.08,
					hidden = function() return (i ~= 4) end,
					min = 0,
					max = 1,
					softMin = 0,
					softMax = 1,
					step = 0.01,
					bigStep = 0.05,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Multiplier
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Multiplier = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Class_Multiplier = {
					name = L['Segment Multiplier'],
					desc = L["Reduce each segment's brightness by this percentage."],
					type = 'range',
					order = 0.08,
					hidden = function() return (i ~= 3) end,
					min = 0.0,
					max = 33,
					softMin = 0,
					softMax = 20,
					step = 0.01,
					bigStep = 0.05,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Multiplier
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Multiplier = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Percentage = {
					name = L['Color Percentage'],
					desc = L['Color Bar by percentage colors.'],
					type = 'toggle',
					order = 0.09,
					hidden = function() return (i == 4 or i == 3) end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.Percentage
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.Percentage = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Percent_100 = {
					name = L['100%'],
					desc = L['Color at 100%.'],
					type = 'color',
					order = 0.1,
					hidden =  function() return not RUF.db.profile.Appearance.Bars[Bar[i]].Color.Percentage end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[7],RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[8],RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[9]
					end,
					set = function(info,r,g,b)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[7] = r
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[8] = g
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[9] = b
						RUF:OptionsUpdateAllBars()
					end,
				},
				Percent_50 = {
					name = L['50%'],
					desc = L['Color at 50%'],
					type = 'color',
					order = 0.11,
					hidden =  function() return not RUF.db.profile.Appearance.Bars[Bar[i]].Color.Percentage end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[4],RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[5],RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[6]
					end,
					set = function(info,r,g,b)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[4] = r
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[5] = g
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[6] = b
						RUF:OptionsUpdateAllBars()
					end,
				},
				Percent_0 = {
					name = L['0%'],
					desc = L['Color at 0%'],
					type = 'color',
					order = 0.12,
					hidden =  function() return not RUF.db.profile.Appearance.Bars[Bar[i]].Color.Percentage end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[1],RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[2],RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[3]
					end,
					set = function(info,r,g,b)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[1] = r
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[2] = g
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.PercentageGradient[3] = b
						RUF:OptionsUpdateAllBars()
					end,
				},
				Base_Color = {
					name = L['Base Color'],
					desc = L['Color used if none of the other options are checked.'],
					type = 'color',
					order = 0.13,
					get = function(info)
						return unpack(RUF.db.profile.Appearance.Bars[Bar[i]].Color.BaseColor)
					end,
					set = function(info,r,g,b)
						RUF.db.profile.Appearance.Bars[Bar[i]].Color.BaseColor = {r,g,b}
						RUF:OptionsUpdateAllBars()
					end,
				},
				Background = {
					name = L['Background'],
					type = 'header',
					order = 10,
					disabled = function() return (i == 4 and RUF.db.profile.Appearance.Bars[Bar[i]].Type == 1) end,
				},
				CustomColor = {
					name = L['Background Color'],
					desc = L["Background Color to use if not using the bar's color."],
					type = 'color',
					order = 10.01,
					disabled = function() return (i == 4 and RUF.db.profile.Appearance.Bars[Bar[i]].Type == 1) or (RUF.db.profile.Appearance.Bars[Bar[i]].Background.UseBarColor) end,
					get = function(info)
						return unpack(RUF.db.profile.Appearance.Bars[Bar[i]].Background.CustomColor)
					end,
					set = function(info,r,g,b)
						RUF.db.profile.Appearance.Bars[Bar[i]].Background.CustomColor = {r,g,b}
						RUF:OptionsUpdateAllBars()
					end,
				},
				UseBarColor = {
					name = L['Use Bar Color'],
					desc = L["Color the background the same as the bar's color. Brightness reduced by the Multiplier setting."],
					type = 'toggle',
					order = 10.02,
					disabled = function() return (i == 4 and RUF.db.profile.Appearance.Bars[Bar[i]].Type == 1) end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Background.UseBarColor
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Background.UseBarColor = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Multiplier = {
					name = L['Brightness Multiplier'],
					desc = L["Reduce background color's brightness by this percentage."],
					type = 'range',
					order = 10.03,
					min = 0,
					max = 1,
					softMin = 0,
					softMax = 1,
					step = 0.01,
					bigStep = 0.05,
					disabled = function() return (i == 4 and RUF.db.profile.Appearance.Bars[Bar[i]].Type == 1) end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Background.Multiplier
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Background.Multiplier = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Alpha = {
					name = L['Alpha'],
					desc = L['Background Alpha'],
					type = 'range',
					order = 10.04,
					min = 0,
					max = 1,
					softMin = 0,
					softMax = 1,
					step = 0.01,
					bigStep = 0.05,
					disabled = function() return (i == 4 and RUF.db.profile.Appearance.Bars[Bar[i]].Type == 1) end,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Background.Alpha
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Background.Alpha = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Border = {
					name = L['Border'],
					type = 'header',
					order = 20,
					hidden = i==1 or i==4,
				},
				Border_Texture = {
					name = L['Border Texture'],
					type = 'select',
					order = 20.02,
					hidden = i==1 or i==4,
					values = LSM:HashTable('border'),
					dialogControl = 'LSM30_Border',
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Border.Style.edgeFile
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Border.Style.edgeFile = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Border_Size = {
					name = L['Border Size'],
					type = 'range',
					order = 20.03,
					hidden = i==1 or i==4,
					min = -20,
					max = 20,
					softMin = -20,
					softMax = 20,
					step = 0.01,
					bigStep = 0.05,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Border.Style.edgeSize
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Border.Style.edgeSize = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Border_Alpha = {
					name = L['Alpha'],
					desc = L['Overlay Alpha'],
					type = 'range',
					order = 20.03,
					hidden = i==1 or i==4,
					min = 0,
					max = 1,
					softMin = 0,
					softMax = 1,
					step = 0.01,
					bigStep = 0.05,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Border.Alpha
					end,
					set = function(info, value)
						RUF.db.profile.Appearance.Bars[Bar[i]].Border.Alpha = value
						RUF:OptionsUpdateAllBars()
					end,
				},
				Border_Color = {
					name = L['Base Color'],
					type = 'color',
					order = 20.04,
					hidden = i==1 or i==4,
					get = function(info)
						return RUF.db.profile.Appearance.Bars[Bar[i]].Border.Color[1], RUF.db.profile.Appearance.Bars[Bar[i]].Border.Color[2],RUF.db.profile.Appearance.Bars[Bar[i]].Border.Color[3]
					end,
					set = function(info,r,g,b)
						RUF.db.profile.Appearance.Bars[Bar[i]].Border.Color[1] = r
						RUF.db.profile.Appearance.Bars[Bar[i]].Border.Color[2] = g
						RUF.db.profile.Appearance.Bars[Bar[i]].Border.Color[3] = b
						RUF:OptionsUpdateAllBars()
					end,
				},
			},
		}
	end
	return Bars
end