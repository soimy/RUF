local RUF = LibStub('AceAddon-3.0'):GetAddon('RUF')
local L = LibStub('AceLocale-3.0'):GetLocale('RUF')
local RUF_Options = RUF:GetModule('Options')
local LSM = LibStub('LibSharedMedia-3.0')
local _, ns = ...
local oUF = ns.oUF
local _, PlayerClass = UnitClass('player')

function RUF_Options.MainOptions()
	local Options = {
		type = 'group',
		name = function(info)
			return "RUF [|c5500DBBDRaeli's Unit Frames|r] r|c5500DBBD" .. RUF.db.global.Version ..'|r'
		end,
		order = 0,
		childGroups = 'tab',
		args = {
			showAlways = {
				name = '',
				type = 'group',
				order = 0,
				inline = true,
				args = {
					FrameLock = {
						name = '|cff00B2FA'..L["Frame Lock"]..'|r',
						desc = L["Allow unit frames to be repositioned by dragging."],
						order = 0,
						type = 'toggle',
						get = function(info)
							return RUF.db.global.frameLock
						end,
						set = function(info, value)
							RUF.db.global.frameLock = value
							RUF.ToggleFrameLock(value == true)
						end,
					},
					TestMode = {
						name = '|cff00B2FA'..L["Test Mode"]..'|r',
						desc = L["Shows all unitframes so you can easily configure them."],
						order = 1,
						type = 'toggle',
						get = function(info)
							return RUF.db.global.TestMode
						end,
						set = function(info, value)
							RUF.db.global.TestMode = value
							RUF:TestMode()
							--RUF:UpdateFrames()
						end,
					},
					TestModeShowUnits = {
						name = '|cff00B2FA'..L["Show Unit in Test Mode."]..'|r',
						desc = L["Displays the name of the unit frame in test mode."],
						order = 2,
						type = 'toggle',
						get = function(info)
							return RUF.db.global.TestModeShowUnits
						end,
						set = function(info, value)
							RUF.db.global.TestModeShowUnits = value
							--RUF:UpdateFrames()
							RUF:TestMode()
						end,
					},
				},
			},
			Appearance = {
				name = L["Global Appearance Options"],
				desc = L["These settings affect all frames."],
				type = 'group',
				childGroups = 'tab',
				order = 1,
				args = {
					others = {
						name = L["Other Global Settings"],
						type = 'group',
						order = 5,
						args = {
							frameBorder = {
								name = L["Frame Border"],
								type = 'group',
								order = 0,
								inline = true,
								args = {
									texture = {
										name = L["Texture"],
										type = 'select',
										order = 0.02,
										values = LSM:HashTable('border'),
										dialogControl = 'LSM30_Border',
										get = function(info)
											return RUF.db.profile.Appearance.Border.Style.edgeFile
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Style.edgeFile = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									size = {
										name = L["Size"],
										type = 'range',
										order = 0.03,
										min = -100,
										max = 100,
										softMin = -20,
										softMax = 20,
										step = 0.01,
										bigStep = 0.05,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Style.edgeSize
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Style.edgeSize = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									offset = {
										name = L["Inset from frame edge"],
										type = 'range',
										order = 0.04,
										min = -100,
										max = 100,
										softMin = -30,
										softMax = 30,
										step = 1,
										bigStep = 1,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Offset
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Offset = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									alpha = {
										name = L["Alpha"],
										type = 'range',
										order = 0.05,
										min = 0,
										max = 1,
										softMin = 0,
										softMax = 1,
										step = 0.01,
										bigStep = 0.05,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Alpha
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Alpha = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									color = {
										name = L["Color"],
										type = 'color',
										order = 0.06,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Border.Color)
										end,
										set = function(info,r,g,b)
											RUF.db.profile.Appearance.Border.Color = {r,g,b}
											RUF:OptionsUpdateFrameBorders()
										end,
									},
								},
							},
							combatFading = {
								name = L["Combat Fading"],
								type = 'group',
								order = 1,
								inline = true,
								args = {
									enabled = {
										name = function()
											if RUF.db.profile.Appearance.CombatFader.Enabled == true then
												return '|cFF00FF00'..L["Enabled"]..'|r'
											else
												return '|cFFFF0000'..L["Enabled"]..'|r'
											end
										end,
										type = 'toggle',
										order = 0.1,
										get = function(info)
											return RUF.db.profile.Appearance.CombatFader.Enabled
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.CombatFader.Enabled = value
											RUF.CombatFader(nil,'updateOptions')
										end,
									},
									enabledSpacer = {
										name = " ",
										type = 'description',
										order = 0.11,
										width = 'full',
									},
									combatAlpha = {
										name = L["In combat alpha"],
										type = 'range',
										order = 0.25,
										min = 0,
										max = 1,
										softMin = 0,
										softMax = 1,
										step = 0.01,
										bigStep = 0.01,
										get = function(info)
											return RUF.db.profile.Appearance.CombatFader.combatAlpha
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.CombatFader.combatAlpha = value
											RUF.CombatFader(nil,'updateOptions')
										end,
									},
									restAlpha = {
										name = L["Out of combat alpha"],
										type = 'range',
										order = 0.26,
										min = 0,
										max = 1,
										softMin = 0,
										softMax = 1,
										step = 0.01,
										bigStep = 0.01,
										get = function(info)
											return RUF.db.profile.Appearance.CombatFader.restAlpha
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.CombatFader.restAlpha = value
											RUF.CombatFader(nil,'updateOptions')
										end,
									},
									disableWithTarget = {
										name = L["Enable targeting alpha"],
										desc = L["Use a different alpha value when you have a target."],
										type = 'toggle',
										order = 0.35,
										get = function(info)
											return RUF.db.profile.Appearance.CombatFader.targetOverride
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.CombatFader.targetOverride = value
											RUF.CombatFader(nil,'updateOptions')
										end,
									},
									targetAlpha = {
										name = L["Targeting alpha"],
										desc = L["Alpha of all frames when you are targeting something."],
										type = 'range',
										order = 0.36,
										min = 0,
										max = 1,
										softMin = 0,
										softMax = 1,
										step = 0.01,
										bigStep = 0.01,
										hidden = function() return not RUF.db.profile.Appearance.CombatFader.targetOverride end,
										get = function(info)
											return RUF.db.profile.Appearance.CombatFader.targetAlpha
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.CombatFader.targetAlpha = value
											RUF.CombatFader(nil,'updateOptions')
										end,
									},
								},
							},
						},
					},

					Bars = {
						name = L["Bars"],
						type = 'group',
						order = 2,
						args = {},
					},
					Colors = {
						name = L["Colors"],
						type = 'group',
						order = 1,
						args = {},
					},
					auras = {
						name = L["Auras"],
						type = 'group',
						order = 4,
						childGroups = 'tab',
						args = {
							colors = {
								name = L["Aura Colors"],
								type = 'group',
								order = 0,
								inline = true,
								args = {
									buffColorType = {
										name = L["Color Buffs by Type"],
										type = 'toggle',
										order = 0.01,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Buff
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Buff = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									debuffColorType = {
										name = L["Color Debuffs by Type"],
										type = 'toggle',
										order = 0.01,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Debuff
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Debuff = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									onlyDispellableColoring = {
										name = L["Color only removable"],
										desc = L["Color auras by type only if you can dispel / purge them."],
										type = 'toggle',
										order = 0.01,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.OnlyDispellable
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.OnlyDispellable = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									buffColor = {
										name = L["Default Buff Glow"],
										type = 'color',
										hasAlpha = true,
										order = 0.1,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.DefaultBuff)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.DefaultBuff = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
									debuffColor = {
										name = L["Default Debuff Glow"],
										type = 'color',
										hasAlpha = true,
										order = 0.1,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.DefaultDebuff)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.DefaultDebuff = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
									colorMagic = {
										name = L["Magic"],
										type = 'color',
										hasAlpha = true,
										order = 0.3,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.Magic)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.Magic = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
									colorDisease = {
										name = L["Disease"],
										type = 'color',
										hasAlpha = true,
										order = 0.3,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.Disease)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.Disease = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
									colorCurse = {
										name = L["Curse"],
										type = 'color',
										hasAlpha = true,
										order = 0.3,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.Curse)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.Curse = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
									colorPoison = {
										name = L["Poison"],
										type = 'color',
										hasAlpha = true,
										order = 0.3,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.Poison)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.Poison = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
									colorEnrage = {
										name = L["Enrage"],
										type = 'color',
										hasAlpha = true,
										order = 0.3,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.Enrage)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.Enrage = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
								},
							},
							highlightBorder = {
								name = L["Aura Highlight Glow"],
								type = 'group',
								order = 1,
								inline = true,
								args = {
									desc = {
										name = L["The border on buff or debuff icons that is colored using the colors above."],
										type = 'description',
										order = 0,
										width = 'full',
									},
									highlightTexture = {
										name = L["Texture"],
										type = 'select',
										order = 1,
										values = LSM:HashTable('border'),
										dialogControl = 'LSM30_Border',
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Border.Style.edgeFile
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Border.Style.edgeFile = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									highlightSize = {
										name = L["Size"],
										desc = L["Thickness of the highlight."],
										type = 'range',
										order = 1.1,
										min = -100,
										max = 100,
										softMin = -20,
										softMax = 20,
										step = 0.01,
										bigStep = 0.05,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Border.Style.edgeSize
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Border.Style.edgeSize = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									highlightOffset = {
										name = L["Size relative to the aura icon"],
										type = 'range',
										order = 1.2,
										min = -100,
										max = 100,
										softMin = -30,
										softMax = 30,
										step = 1,
										bigStep = 1,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Border.Offset
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Border.Offset = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
								},
							},
							pixelBorder = {
								name = L["Simple Border"],
								type = 'group',
								order = 2,
								inline = true,
								args = {
									desc = {
										name = L["A simple border around the edge of each buff or debuff icon."],
										type = 'description',
										order = 0,
										width = 'full',
									},
									pixelEnabled = {
										name = function()
											if RUF.db.profile.Appearance.Aura.Pixel.Enabled == true then
												return '|cFF00FF00'..L["Enabled"]..'|r'
											else
												return '|cFFFF0000'..L["Enabled"]..'|r'
											end
										end,
										type = 'toggle',
										order = 15.01,
										width = 'full',
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Pixel.Enabled
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Pixel.Enabled = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									pixelTexture = {
										name = L["Texture"],
										type = 'select',
										order = 15.1,
										values = LSM:HashTable('border'),
										dialogControl = 'LSM30_Border',
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Pixel.Style.edgeFile
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Pixel.Style.edgeFile = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									pixelSize = {
										name = L["Size"],
										type = 'range',
										order = 15.2,
										min = -100,
										max = 100,
										softMin = -20,
										softMax = 20,
										step = 0.01,
										bigStep = 0.05,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Pixel.Style.edgeSize
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Pixel.Style.edgeSize = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									pixelOffset = {
										name = L["Inset from icon edge"],
										type = 'range',
										order = 15.3,
										min = -100,
										max = 100,
										softMin = -30,
										softMax = 30,
										step = 1,
										bigStep = 1,
										get = function(info)
											return RUF.db.profile.Appearance.Aura.Pixel.Offset
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Aura.Pixel.Offset = value
											RUF:OptionsUpdateAllAuras()
										end,
									},
									pixelColor = {
										name = L["Color"],
										type = 'color',
										hasAlpha = true,
										order = 15.4,
										get = function(info)
											return unpack(RUF.db.profile.Appearance.Colors.Aura.Pixel)
										end,
										set = function(info, r,g,b,a)
											RUF.db.profile.Appearance.Colors.Aura.Pixel = {r,g,b,a}
											RUF:OptionsUpdateAllAuras()
										end,
									},
								},
							},
							frameGlow = {
								name = L["Frame Highlighting"],
								type = 'group',
								order = 3,
								inline = true,
								args = {
									desc = {
										name = L["The unit frame border that glows when the unit has a dispellable buff or debuff."],
										type = 'description',
										order = 0,
										width = 'full',
									},
									frameGlowEnabled = {
										name = function()
											if RUF.db.profile.Appearance.Border.Glow.Enabled == true then
												return '|cFF00FF00'..L["Enabled"]..'|r'
											else
												return '|cFFFF0000'..L["Enabled"]..'|r'
											end
										end,
										type = 'toggle',
										order = 0.01,
										width = 'full',
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.Enabled
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.Enabled = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									frameGlowTexture = {
										name = L["Texture"],
										type = 'select',
										order = 0.02,
										values = LSM:HashTable('border'),
										dialogControl = 'LSM30_Border',
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.Style.edgeFile
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.Style.edgeFile = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									frameGlowSize = {
										name = L["Size"],
										type = 'range',
										order = 0.03,
										min = -100,
										max = 100,
										softMin = -20,
										softMax = 20,
										step = 0.01,
										bigStep = 0.05,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.Style.edgeSize
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.Style.edgeSize = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									frameGlowOffset = {
										name = L["Inset from frame edge"],
										type = 'range',
										order = 0.04,
										min = -100,
										max = 100,
										softMin = -30,
										softMax = 30,
										step = 1,
										bigStep = 1,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.Offset
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.Offset = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									frameGlowAlpha = {
										name = L["Alpha"],
										type = 'range',
										order = 0.05,
										min = 0,
										max = 1,
										softMin = 0,
										softMax = 1,
										step = 0.1,
										bigStep = 0.1,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.Alpha
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.Alpha = value
											RUF:OptionsUpdateFrameBorders()
										end,
									},
									frameGlowSoundToggle = {
										name = L["Play sound on highlight"],
										desc = L["Plays a sound when a removable aura is found on a unit. Does not affect target units."],
										type = 'toggle',
										order = 0.08,
										width = 'full',
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.SoundEnabled
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.SoundEnabled = value
										end,
									},
									frameGlowSound = {
										name = L["Sound"],
										type = 'select',
										order = 0.09,
										values = LSM:HashTable('sound'),
										dialogControl = 'LSM30_Sound',
										--hidden = true,
										hidden = function() return not RUF.db.profile.Appearance.Border.Glow.SoundEnabled end,
										get = function(info)
											return RUF.db.profile.Appearance.Border.Glow.Sound
										end,
										set = function(info, value)
											RUF.db.profile.Appearance.Border.Glow.Sound = value
										end,
									},
								},
							},
						},
					},
				},
			},
			Unit = {
				name = L["Unit Options"],
				type = 'group',
				order = 2,
				args = {

				},
			},
			Filtering = {
				name = L["Filtering"],
				type = 'group',
				order = 3,
				hidden = true,
				args = {

				},
			},
			Feedback = {
				name = L["Feedback"],
				type = 'group',
				order = 1000,
				args = {
					Head = {
						name = L["Feedback"],
						type = 'header',
						order = 0,
					},
					Revision = {
						name = "|cffFFCC00" .. L["Current Version: %s"]:format("r|r|c5500DBBD" .. RUF.db.global.Version) .. "|r",
						type = 'description',
						order = 0.5,
						fontSize = 'large',
					},
					RevisionDescription = {
						name = L["When reporting an issue, please also post the revision number above. Thanks!"],
						type = 'description',
						order = 0.6,
					},
					Spacer_FeedbackOnline = {
						name = '\n',
						type = 'description',
						order = 1,
					},
					Curseforge_Header = {
						name = '|cff91BE0F'..L["Curseforge"]..'|r',
						type = 'description',
						order = 50,
						fontSize = 'large',
					},
					Curseforge_URL = {
						name = L["URL"],
						type = 'input',
						order = 50.2,
						width = 'full',
						get = function() return 'https://wow.curseforge.com/projects/ruf/issues' end,
						set = function() return 'https://wow.curseforge.com/projects/ruf/issues' end,
					},
					Spacer_OnlineCommunity = {
						name = '\n\n',
						type = 'description',
						order = 75,
					},
					Community_Header = {
						name = '|cff00B2FA'..L["Discord"]..'|r',
						type = 'description',
						order = 100,
						fontSize = 'large',
					},
					Community_URL = {
						name = L["Invite Link"],
						type = 'input',
						order = 100.2,
						width = 'full',
						get = function() return 'https://discord.gg/99QZ6sd' end,
						set = function() return 'https://discord.gg/99QZ6sd' end,
					},
				},
			},
		},
	}
	return Options
end