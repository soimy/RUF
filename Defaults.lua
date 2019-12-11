local RUF = RUF or LibStub("AceAddon-3.0"):GetAddon("RUF")
RUF.Layout = {}
local cfg = {
	global = {
		TestModeShowUnits = true,
		Filters = {
			Lists = {
				["Blacklist"] = {},
				["WhiteList"] = {},
			},
		},
	},
	char = {
		Nickname = "",
		NickCache = {},
	},
	profile = {
		Appearance = {
			Border = {
				Glow = {
					Enabled = true,
					SoundEnabled = false,
					Offset = -1,
					Alpha = 0.75,
					Style = {
						edgeFile = "RUF Glow", -- Pixel Border settings.
						edgeSize = 14,
					},
				},
				Style = {
					edgeFile = "RUF Pixel", -- Pixel Border settings.
					edgeSize = 1,
				},
				Offset = 0,
				Color = {0,0,0},
				Alpha = 1,
			},
			CombatFader = {
				Enabled = false,
				targetOverride = true,
				targetAlpha = 1,
				combatAlpha = 1,
				restAlpha = 0.5,
			},
			Bars = {
				Health = {
					Texture = "RUF 5",
					Color = {
						BaseColor = {25/255, 25/255, 25/255},
						--colorHealth -- Set in Core to true automatically
						Class = false,
						Disconnected = true,
						Percentage = true,
						percentageMaxClass = false,
						percentage50Class = false,
						percentage0Class = true,
						PercentageGradient = {
							1,0,55/255, -- 0% HP: Magenta
							35/255,35/255,35/255, -- 50% HP: Grey
							35/255,35/255,35/255 -- 100% HP: Grey
						},
						Reaction = false,
						Tapped = true,
						Multiplier = 1,
					},
					Background = {
						UseBarColor = false, -- Use Bar Color or Custom Color
						CustomColor = {0,0,0}, -- Custom Color Value
						Multiplier = 0.25, -- Reduce Bar Background Color brightness by this multiplier
						Alpha = 0.5,
					},
				},
				Absorb = {
					Type = 1, -- 1 Health Overlay = 0, 2 Bar If 1 then use Frame.Bars.Absorb.Alpha If 2 then use Unit.Player.Bars.Absorb.Position and Order and Alpha
					Texture = "RUF 5",
					Color = {
						BaseColor = {1, 1, 1},
						Class = false,
						Reaction = false,
						Alpha = 0.25,
						Multiplier = 1,
					},
					Border = {
						Style = {
							edgeFile = "RUF Pixel", -- Pixel Border settings.
							edgeSize = 1,
						},
						Color = {0,0,0},
						Alpha = 1,
					},
					Background = {
						UseBarColor = false,
						CustomColor = {0,0,0},
						Multiplier = 0.25,
						Alpha = 0.5,
					},
				},
				Class = {
					Texture = "RUF 1",
					Color = {
						BaseColor = {100/255, 100/255, 100/255},
						Class = false,
						PowerType = true, -- Use Resource's Color
						Multiplier = 1,
						SegmentMultiplier = 10, -- Make the bars increase in brightness by this multiplier
					},
					Border = {
						Style = {
							edgeFile = "RUF Pixel", -- Pixel Border settings.
							edgeSize = 1,
						},
						Color = {0,0,0},
						Alpha = 1,
					},
					Background = {
						UseBarColor = true,
						CustomColor = {0,0,0},
						Multiplier = 0.25,
						Alpha = 0.5,
					},
				},
				Power = {
					Texture = "RUF 1",
					Color = {
						BaseColor = {50/255, 50/255, 50/255},
						Class = false,
						Disconnected = false,
						Percentage = false,
						percentageMaxClass = false,
						percentage50Class = false,
						percentage0Class = false,
						percentageMaxPower = true,
						percentage50Power = true,
						percentage0Power = false,
						PercentageGradient = {
							1,1,1,
							25/255,25/255,25/255,
							25/255,25/255,25/255
						},
						Reaction = false,
						Tapped = false,
						PowerType = true,
						Multiplier = 1,
					},
					Border = {
						Style = {
							edgeFile = "RUF Pixel", -- Pixel Border settings.
							edgeSize = 1,
						},
						Color = {0,0,0},
						Alpha = 1,
					},
					Background = {
						UseBarColor = true,
						CustomColor = {0,0,0},
						Multiplier = 0.25,
						Alpha = 0.5,
					},
				},
				Cast = {
					Texture = "RUF 1",
					ColorInterrupt = {
						Enabled = true,
						Color = {200/255, 64/255, 64/255},
					},
					Color = {
						BaseColor = {1, 204/255, 0},
						Class = false,
						Reaction = false,
						PowerType = false,
						Multiplier = 1,
					},
					Border = {
						Style = {
							edgeFile = "RUF Pixel", -- Pixel Border settings.
							edgeSize = 1,
						},
						Color = {0,0,0},
						Alpha = 1,
					},
					Background = {
						UseBarColor = true,
						CustomColor = {0,0,0},
						Multiplier = 0.25,
						Alpha = 0.5,
					},
					SafeZone = {
						Enabled = true,
						Color = {0, 194/255, 1},
						Alpha = 1,
					},
				},
				HealPrediction = {
					Overflow = 0,
					Player = {
						Texture = "RUF 5",
						Enabled = true,
						Color = {
							Alpha = 0.75,
							BaseColor = {50/255, 169/255, 64/255},
							--colorHealth -- Set in Core to true automatically
							Class = false,
							Percentage = false,
							percentageMaxClass = false,
							percentage50Class = false,
							percentage0Class = false,
							PercentageGradient = {
								1,0,55/255, -- 0% HP: Magenta
								35/255,35/255,35/255, -- 50% HP: Grey
								35/255,35/255,35/255 -- 100% HP: Grey
							},
							Reaction = false,
							Multiplier = 1,
						},
					},
					Others = {
						Texture = "RUF 5",
						Enabled = true,
						Color = {
							Alpha = 0.75,
							BaseColor = {218/255, 197/255, 92/255},
							--colorHealth -- Set in Core to true automatically
							Class = false,
							Percentage = false,
							percentageMaxClass = false,
							percentage50Class = false,
							percentage0Class = false,
							PercentageGradient = {
								1,0,55/255, -- 0% HP: Magenta
								35/255,35/255,35/255, -- 50% HP: Grey
								35/255,35/255,35/255 -- 100% HP: Grey
							},
							Reaction = false,
							Multiplier = 1,
						},
					},
				}

			},
			Aura = {
				Buff = true,
				Debuff = true,
				OnlyDispellable = true,
				Border = {
					Style = {
						edgeFile = "RUF Glow", -- Pixel Border settings.
						edgeSize = 6,
					},
					Offset = -1, -- Inset from edge.
				},
				Pixel = {
					Enabled = true,
					Style = {
						edgeFile = "RUF Pixel", -- Pixel Border settings.
						edgeSize = 1,
					},
					Offset = 0,
				},
			},
			Colors = {
				UseClassColors = true, -- Use ClassColors Addon
				ClassColors = { -- !ClassColors Addon Overrides these values.
					DEATHKNIGHT = {196/255,31/255,59/255},
					DEMONHUNTER = {163/255,48/255,201/255},
					DRUID = {1,125/255,10/255},
					HUNTER = {171/255,212/255,115/255},
					MAGE = {64/255,199/255,235/255},
					MONK = {0,1,150/255},
					PALADIN = {245/255,140/255,186/255},
					PRIEST = {1,1,1},
					ROGUE = {1,245/255,105/255},
					SHAMAN = {0,112/255,222/255},
					WARLOCK = {135/255,135/255,237/255},
					WARRIOR = {199/255,156/255,110/255},
				},
				MiscColors = {
					Tapped = {100/255,100/255,100/255},
					Disconnected = {150/255,150/255,150/255},
				},
				Aura = {
					DefaultBuff = {0,0,0,0},
					DefaultDebuff = {180/255,0,20/255,1},
					Pixel = {0,0,0,1},
					Magic = {0,158/255,1,1},
					Disease = {1,156/255,0,1},
					Curse = {84/255,43/255,189/255,1},
					Poison = {145/255,190/255,15/255,1},
					Enrage = {1,0,143/255,1},
				},
				DifficultyColors = {
					[0] = {1,0.1,0.1}, -- Impossible
					[1] = {1,0.5,0.25}, -- Hard
					[2] = {1,0.82,0}, -- Normal
					[3] = {0.25,0.75,0.25}, -- Easy
					[4] = {0.5,0.5,0.5}, -- Trivial
				},
				PowerColors = {
					[0] = {0,158/255,1}, -- Mana
					[1] = {1,0,55/255}, -- Rage
					[2] = {1,128/255,64/255}, -- Focus
					[3] = {1,1,0}, -- Energy
					[4] = {1,245/255,105/255}, -- Combo Points
					[5] = {128/255,128/255,128/255}, -- Runes
					[6] = {0,211/255,1}, -- Runic Power
					[7] = {150/255,119/255,229/255}, -- Soul Shards
					[8] = {77/255,133/255,230/255}, -- Astral Power
					[9] = {242/255,230/255,153/255}, -- Holy Power
					[10] = {0,158/255,1}, -- Alternate Power
					[11] = {0,128/255,1}, -- Maelstrom
					[12] = {0,247/255,202/255}, -- Chi
					[13] = {102/255,0,204/255}, -- Insanity
					[14] = {1,245/255,105/255}, -- Classic Combo Points
					[15] = {0,158/255,1}, -- Unused
					[16] = {0,178/255,250/255}, -- Arcane Charges
					[17] = {200/255,66/255,252/255}, -- Fury
					[18] = {1,156/255,0}, -- Pain
					[50] = {180/255,0,20/255}, -- Blood Runes
					[51] = {60/255,205/255,1}, -- Frost Runes
					[52] = {145/255,190/255,15/255}, -- Unholy Runes
					[75] = {132/255,1,132/255}, -- Stagger Low (Green)
					[76] = {1, 250/255, 184/255}, -- Stagger Medium (Yellow)
					[77] = {1, 107/255, 107/255}, -- Stagger High (Red)
				},
				ReactionColors = {
					[1] = {230/255,77/255,56/255}, -- Hated
					[2] = {230/255,77/255,56/255}, -- Hostile Also Enemy Players and NPCs
					[3] = {191/255,69/255,0}, -- Unfriendly
					[4] = {230/255,179/255,0}, -- Neutral
					[5] = {0,153/255,26/255}, -- Friendly Also Allied Players
					[6] = {0,153/255,26/255}, -- Honored
					[7] = {0,153/255,26/255}, -- Revered
					[8] = {0,153/255,26/255}, -- Exalted
					[9] = {56/255,77/255,230/255}, -- Paragon
					[10] = {56/255,77/255,230/255}, -- Friendly Pet
				},
			},
			Text = {
				CurHPPerc = {
					Font = "RUF",
					Outline = "OUTLINE",
					Shadow = 0,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					ShowPercAtMax = true,
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = true, -- Below 100%
						PercentageAtMax = true,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
				CurMaxHPPerc = {
					Font = "RUF",
					Outline = "OUTLINE",
					Shadow = 0,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					ShowMaxAtMax = true,
					ShowPercAtMax = true,
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = true, -- Below 100%
						PercentageAtMax = true,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
				CurHP = {
					Font = "RUF",
					Outline = "OUTLINE",
					Shadow = 0,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = true, -- Below 100%
						PercentageAtMax = true,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
				MaxHP = {
					Font = "RUF",
					Outline = "OUTLINE",
					Shadow = 0,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = true, -- Below 100%
						PercentageAtMax = true,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
				HPPerc = {
					Font = "RUF",
					Outline = "OUTLINE",
					Shadow = 0,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = true, -- Below 100%
						PercentageAtMax = true,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
				CurManaPerc = {
					Enabled = 1,
					HideWhenPrimaryIsMana = true,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = true,
						Reaction = false,
					},
				},
				CurMana = {
					Enabled = 1,
					HideWhenPrimaryIsMana = true,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = true,
						Reaction = false,
					},
				},
				ManaPerc = {
					Enabled = 1,
					HideWhenPrimaryIsMana = true,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = true,
						Reaction = false,
					},
				},
				Name = {
					CharLimit = 18,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = true,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = true,
					},
				},
				CurPowerPerc = {
					Enabled = 1,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = true,
						Reaction = false,
					},
				},
				CurPower = {
					Enabled = 1,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = true,
						Reaction = false,
					},
				},
				PowerPerc = {
					Enabled = 1,
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = true, -- Always Mana if tag is Raeli:Mana
						Reaction = false,
					},
				},
				Level = {
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					HideSameLevel = true,
					ShowLevel = true,
					ShowClassification = true,
					ClassificationBeforeLevel = true,
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = true,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
				AFKDND = {
					Case = 1, -- 0,1,2 0 == Default, 1 == Uppercase, 2 == Lowercase
					Color = {
						BaseColor = {1,1,1},
						Class = false,
						Level = false,
						Percentage = false, -- Below 100%
						PercentageAtMax = false,
						PercentageGradient = {
							1,0,0,
							1,1,0,
							0,1,0,
						},
						PowerType = false,
						Reaction = false,
					},
				},
			},
		},
		unit = {
			["player"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 100,
						["Height"] = 60,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 40,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = 0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = false,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPRIGHT',
							["AnchorTo"] = 'TOPLEFT',
							["x"] = 1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "InCombat",
							},
						},
						["InCombat"] = {
							["Enabled"] = true,
							["Size"] = 20,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["LootMaster"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Enabled"] = true,
							["Badge"] = true,
							["Size"] = 32,
						},
						["Lead"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "InCombat",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = true,
							["Size"] = 12,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = true,
							["Size"] = 28,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Rest"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = true,
							["Size"] = 36,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 10,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -200,
						["x"] = -390,
						["AnchorTo"] = "CENTER",
						["AnchorFrom"] = "CENTER",
						["AnchorFrame"] = "UIParent",
					},
					["Text"] = {
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 4,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 28,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = -4,
								["AnchorTo"] = "BOTTOMRIGHT",
								["Anchor"] = "BOTTOMRIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
						["Mana"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 1,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Power",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurMana]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = 4,
								["AnchorTo"] = "BOTTOMLEFT",
								["Anchor"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 4,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["AFKDND"] = {
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Tag"] = "[RUF:AFKDND]",
							["Position"] = {
								["y"] = 1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Name",
							},
							["Enabled"] = true,
							["Size"] = 21,
							["Font"] = "RUF",
							["Width"] = 100,
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = true,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = true,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 60,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 15,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = true,
							},
							["Caster"] = {
								["Group"] = true,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 15,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["target"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 100,
						["Height"] = 60,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 315,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 4,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
						["LootMaster"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 32,
						},
						["Lead"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Phased",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = true,
							["Size"] = 12,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = true,
							["Size"] = 28,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Rest"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = true,
							["Size"] = 36,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -10,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -200,
						["x"] = 390,
						["AnchorTo"] = "CENTER",
						["AnchorFrom"] = "CENTER",
						["AnchorFrame"] = "UIParent",
					},
					["Text"] = {
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 4,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 28,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = 4,
								["AnchorTo"] = "BOTTOMLEFT",
								["Anchor"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = -4,
								["AnchorTo"] = "BOTTOMRIGHT",
								["Anchor"] = "BOTTOMRIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 4,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["AFKDND"] = {
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Tag"] = "[RUF:AFKDND]",
							["Position"] = {
								["y"] = 1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Name",
							},
							["Enabled"] = true,
							["Size"] = 21,
							["Font"] = "RUF",
							["Width"] = 100,
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = true,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "REVERSE",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "REVERSE",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = true,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 60,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 15,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = true,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 15,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["focus"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 100,
						["Height"] = 60,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 315,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Phased",
							},
						},
						["InCombat"] = {
							["Enabled"] = true,
							["Size"] = 20,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["LootMaster"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 32,
						},
						["Lead"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = true,
							["Size"] = 12,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = true,
							["Size"] = 28,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Rest"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = true,
							["Size"] = 36,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 10,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = 160,
						["x"] = 4,
						["AnchorTo"] = "LEFT",
						["AnchorFrom"] = "LEFT",
						["AnchorFrame"] = "UIParent",
					},
					["Text"] = {
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 4,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 28,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = -4,
								["AnchorTo"] = "BOTTOMRIGHT",
								["Anchor"] = "BOTTOMRIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = 4,
								["AnchorTo"] = "BOTTOMLEFT",
								["Anchor"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 4,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["AFKDND"] = {
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Tag"] = "[RUF:AFKDND]",
							["Position"] = {
								["y"] = 1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Name",
							},
							["Enabled"] = true,
							["Size"] = 21,
							["Font"] = "RUF",
							["Width"] = 100,
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = true,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = true,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 60,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["pet"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 40,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = 0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPRIGHT',
							["AnchorTo"] = 'TOPLEFT',
							["x"] = 1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "BOTTOMRIGHT",
								["AnchorFrom"] = "BOTTOM",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 26,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 50,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "BOTTOMRIGHT",
								["AnchorFrom"] = "BOTTOM",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = -50,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -4,
						["x"] = 0,
						["AnchorTo"] = "BOTTOM",
						["AnchorFrom"] = "TOP",
						["AnchorFrame"] = "oUF_RUF_Player",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 1,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = false,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = false,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["targettarget"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 315,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "BOTTOMLEFT",
								["AnchorFrom"] = "BOTTOM",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 26,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = -50,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "BOTTOMLEFT",
								["AnchorFrom"] = "BOTTOM",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 50,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -4,
						["x"] = 0,
						["AnchorTo"] = "BOTTOM",
						["AnchorFrom"] = "TOP",
						["AnchorFrame"] = "oUF_RUF_Target",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 1,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "REVERSE",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "REVERSE",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "REVERSE",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = false,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = -1,
							["AnchorTo"] = "BOTTOMLEFT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = false,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = -1,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "TOPRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["focustarget"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 315,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "BOTTOMRIGHT",
								["AnchorFrom"] = "BOTTOM",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 26,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 50,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "BOTTOMRIGHT",
								["AnchorFrom"] = "BOTTOM",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = -50,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -4,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "oUF_RUF_Focus",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 1,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = false,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = false,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["pettarget"] = {
				["Enabled"] = false,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "TargetMark",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 18,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 4,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "oUF_RUF_Pet",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 125,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
			},
			["party"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 60,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 40,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = 00.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Phased",
							},
						},
						["InCombat"] = {
							["Enabled"] = true,
							["Size"] = 20,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["LootMaster"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 32,
						},
						["Lead"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = true,
							["Size"] = 12,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = true,
							["Size"] = 28,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Rest"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = true,
							["Size"] = 36,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 10,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -40,
						["x"] = 4,
						["offsety"] = -4,
						["AnchorTo"] = "LEFT",
						["growth"] = "BOTTOM",
						["offsetx"] = 0,
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "UIParent",
					},
					["Text"] = {
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 4,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 28,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = -4,
								["AnchorTo"] = "BOTTOMRIGHT",
								["Anchor"] = "BOTTOMRIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = 4,
								["AnchorTo"] = "BOTTOMLEFT",
								["Anchor"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 4,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["AFKDND"] = {
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Tag"] = "[RUF:AFKDND]",
							["Position"] = {
								["y"] = 1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Name",
							},
							["Enabled"] = true,
							["Size"] = 21,
							["Font"] = "RUF",
							["Width"] = 100,
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = true,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = true,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 60,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["showRaid"] = false,
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["partypet"] = {
				["Enabled"] = false,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "TargetMark",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 18,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 4,
						["offsety"] = -34,
						["AnchorTo"] = "TOPRIGHT",
						["growth"] = "BOTTOM",
						["offsetx"] = 0,
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "oUF_RUF_Party",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 125,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
				["showRaid"] = false,
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
			},
			["partytarget"] = {
				["Enabled"] = false,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "TargetMark",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 18,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
					},
					["Position"] = {
						["y"] = -30,
						["x"] = 4,
						["offsety"] = -34,
						["AnchorTo"] = "TOPRIGHT",
						["growth"] = "BOTTOM",
						["offsetx"] = 0,
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "oUF_RUF_Party",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 125,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
				["showRaid"] = false,
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
			},
			["arena"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 60,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPRIGHT',
							["AnchorTo"] = 'TOPLEFT',
							["x"] = 1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
						["LootMaster"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 32,
						},
						["Lead"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Phased",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = true,
							["Size"] = 12,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = true,
							["Size"] = 28,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Rest"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = true,
							["Size"] = 36,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -10,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = 40,
						["x"] = -4,
						["offsety"] = 4,
						["AnchorTo"] = "RIGHT",
						["growth"] = "TOP",
						["offsetx"] = 0,
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "UIParent",
					},
					["Text"] = {
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 4,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 28,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = 4,
								["AnchorTo"] = "BOTTOMLEFT",
								["Anchor"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = -4,
								["AnchorTo"] = "BOTTOMRIGHT",
								["Anchor"] = "BOTTOMRIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 4,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["AFKDND"] = {
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Tag"] = "[RUF:AFKDND]",
							["Position"] = {
								["y"] = 1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Name",
							},
							["Enabled"] = true,
							["Size"] = 21,
							["Font"] = "RUF",
							["Width"] = 100,
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = true,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "REVERSE",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "REVERSE",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = true,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 60,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = -1,
							["AnchorTo"] = "BOTTOMLEFT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = -1,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "TOPRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["arenatarget"] = {
				["Enabled"] = false,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "TargetMark",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 18,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -4,
						["offsety"] = 34,
						["AnchorTo"] = "BOTTOMLEFT",
						["growth"] = "TOP",
						["offsetx"] = 0,
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "oUF_RUF_Arena1",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 125,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
				["showRaid"] = false,
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
			},
			["boss"] = {
				["Enabled"] = true,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 60,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPRIGHT',
							["AnchorTo"] = 'TOPLEFT',
							["x"] = 1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 4,
								["x"] = -2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
						["LootMaster"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 32,
						},
						["Lead"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Phased",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = true,
							["Size"] = 12,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = true,
							["Size"] = 28,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = true,
							["Size"] = 14,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Rest"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = true,
							["Size"] = 36,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = -10,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
					},
					["Position"] = {
						["y"] = -40,
						["x"] = -4,
						["offsety"] = -4,
						["AnchorTo"] = "RIGHT",
						["growth"] = "BOTTOM",
						["offsetx"] = 0,
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "UIParent",
					},
					["Text"] = {
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 150,
							["Position"] = {
								["y"] = 4,
								["x"] = 4,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 28,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = 4,
								["AnchorTo"] = "BOTTOMLEFT",
								["Anchor"] = "BOTTOMLEFT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 3,
								["x"] = -4,
								["AnchorTo"] = "BOTTOMRIGHT",
								["Anchor"] = "BOTTOMRIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 4,
								["x"] = -4,
								["AnchorTo"] = "RIGHT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["AFKDND"] = {
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Tag"] = "[RUF:AFKDND]",
							["Position"] = {
								["y"] = 1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["Anchor"] = "RIGHT",
								["AnchorFrame"] = "Name",
							},
							["Enabled"] = true,
							["Size"] = 21,
							["Font"] = "RUF",
							["Width"] = 100,
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = true,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "REVERSE",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "REVERSE",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = true,
							["Fill"] = "REVERSE",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 60,
						["Width"] = 300,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "DOWN",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = -1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = -1,
							["AnchorTo"] = "BOTTOMLEFT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 5,
						["Rows"] = 1,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "LEFT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 1,
							["x"] = 1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = false,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = -1,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "TOPRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = false,
					},
					["Bars"] = {
					},
				},
			},
			["bosstarget"] = {
				["Enabled"] = false,
				["Frame"] = {
					["Portrait"] = {
						["Enabled"] = false,
						["Style"] = 1,
						["Cutaway"] = true,
						["Width"] = 60,
						["Height"] = 30,
						["Alpha"] = 0.75,
						["Model"] = {
							["Desaturate"] = false,
							["Rotation"] = 0,
							["CameraDistance"] = 2.5,
							["PortraitZoom"] = 1.08,
							["x"] = -0.35,
							["y"] = -0.35,
							["z"] = -0.25,
							["Animation"] = {
								["Paused"] = true,
							},
						},
						["Position"] = {
							["AnchorFrom"] = 'TOPLEFT',
							["AnchorTo"] = 'TOPRIGHT',
							["x"] = -1,
							["y"] = 0,
						},
						["Border"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 1,
							["Offset"] = 0,
							["Style"] = {
								["edgeFile"] = "RUF Pixel",
								["edgeSize"] = 1,
							},
						},
						["Background"] = {
							["Color"] = {0,0,0},
							["Alpha"] = 0.5,
						},
					},
					["Indicators"] = {
						["Objective"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "TargetMark",
							},
						},
						["Honor"] = {
							["AlwaysShow"] = false,
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "PvPCombat",
							},
							["Enabled"] = false,
							["Badge"] = false,
							["Size"] = 18,
						},
						["LootMaster"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPLEFT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Lead"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "TOPRIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Phased"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = -2,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Role"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["MainTankAssist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Lead",
							},
						},
						["PvPCombat"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -2,
								["x"] = 0,
								["AnchorTo"] = "RIGHT",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["Assist"] = {
							["Enabled"] = false,
							["Size"] = 18,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Lead",
							},
						},
						["PetHappiness"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["AnchorFrom"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
						},
						["TargetMark"] = {
							["Enabled"] = true,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = -1,
								["x"] = 2,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "LEFT",
								["AnchorFrame"] = "Frame",
							},
						},
						["Ready"] = {
							["Enabled"] = false,
							["Size"] = 26,
							["Style"] = "RUF",
							["Position"] = {
								["y"] = 0,
								["x"] = 0,
								["AnchorTo"] = "LEFT",
								["AnchorFrom"] = "RIGHT",
								["AnchorFrame"] = "Phased",
							},
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -4,
						["offsety"] = -34,
						["AnchorTo"] = "BOTTOMLEFT",
						["growth"] = "BOTTOM",
						["offsetx"] = 0,
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "oUF_RUF_Boss1",
					},
					["Text"] = {
						["Name"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = true,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Name]",
						},
						["Level"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:Level]",
						},
						["Health"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 21,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurHPPerc]",
						},
						["Power"] = {
							["Outline"] = "OUTLINE",
							["Font"] = "RUF",
							["Width"] = 100,
							["Position"] = {
								["y"] = 1,
								["x"] = 0,
								["AnchorTo"] = "CENTER",
								["Anchor"] = "CENTER",
								["AnchorFrame"] = "Frame",
							},
							["Size"] = 18,
							["Enabled"] = false,
							["Shadow"] = 0,
							["Tag"] = "[RUF:CurPowerPerc]",
						},
					},
					["RangeFading"] = {
						["Enabled"] = true,
						["Alpha"] = 0.5,
					},
					["Bars"] = {
						["Cast"] = {
							["Enabled"] = false,
							["Position"] = {
								["y"] = -38,
								["x"] = 0,
								["AnchorTo"] = "BOTTOM",
								["AnchorFrom"] = "TOP",
								["AnchorFrame"] = true,
							},
							["Height"] = 26,
							["Fill"] = "STANDARD",
							["Width"] = 300,
							["Time"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
								["Style"] = 3,
							},
							["Text"] = {
								["Enabled"] = true,
								["Font"] = "RUF",
								["Size"] = 18,
								["Outline"] = "OUTLINE",
								["Shadow"] = 0,
							},
						},
						["Absorb"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 1,
							},
						},
						["Health"] = {
							["Animate"] = true,
							["Fill"] = "STANDARD",
						},
						["Power"] = {
							["Animate"] = true,
							["Enabled"] = 1,
							["Fill"] = "STANDARD",
							["Height"] = 4,
							["Position"] = {
								["Anchor"] = "BOTTOM",
								["Order"] = 0,
							},
						},
						["Class"] = {
							["Animate"] = true,
							["Enabled"] = false,
							["Fill"] = "STANDARD",
							["Height"] = 8,
							["Position"] = {
								["Anchor"] = "TOP",
							},
						},
					},
					["Size"] = {
						["Height"] = 30,
						["Width"] = 125,
					},
				},
				["Debuffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
				["showRaid"] = false,
				["Buffs"] = {
					["Icons"] = {
						["Enabled"] = true,
						["Columns"] = 5,
						["Max"] = 12,
						["Rows"] = 2,
						["Growth"] = {
							["y"] = "UP",
							["x"] = "RIGHT",
						},
						["Width"] = 28,
						["CooldownSpiral"] = true,
						["Sort"] = {
							["SortBy"] = "Remaining",
							["Direction"] = "Descending",
						},
						["Spacing"] = {
							["y"] = 2,
							["x"] = -1,
						},
						["Height"] = 28,
						["Filter"] = {
							["BlackOrWhite"] = "Black",
							["Dispellable"] = false,
							["Time"] = {
								["Max"] = 0,
								["Min"] = 0,
								["Unlimited"] = false,
							},
							["Caster"] = {
								["Group"] = false,
								["Player"] = true,
								["Other"] = true,
								["Unit"] = true,
							},
							["Lists"] = {
							},
						},
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["ClickThrough"] = true,
					},
					["Bars"] = {
					},
				},
			},
		},
	},
}

RUF.Layout.cfg = cfg

local Alidie = {
	["Appearance"] = {
		["Colors"] = {
			["UseClassColors"] = false,
			["ReactionColors"] = {
				nil, -- [1]
				nil, -- [2]
				{
					0.815686274509804, -- [1]
					0.509803921568627, -- [2]
					0.305882352941177, -- [3]
				}, -- [3]
				{
					0.854901960784314, -- [1]
					0.772549019607843, -- [2]
					0.36078431372549, -- [3]
				}, -- [4]
				{
					0.196078431372549, -- [1]
					0.662745098039216, -- [2]
					0.250980392156863, -- [3]
				}, -- [5]
				{
					0.196078431372549, -- [1]
					0.662745098039216, -- [2]
					0.250980392156863, -- [3]
				}, -- [6]
				{
					0.196078431372549, -- [1]
					0.662745098039216, -- [2]
					0.250980392156863, -- [3]
				}, -- [7]
				{
					0.196078431372549, -- [1]
					0.662745098039216, -- [2]
					0.250980392156863, -- [3]
				}, -- [8]
				nil, -- [9]
				{
					0.188235294117647, -- [1]
					0.443137254901961, -- [2]
					0.749019607843137, -- [3]
				}, -- [10]
			},
			["ClassColors"] = {
				["DEATHKNIGHT"] = {
					0.7686257362365723, -- [1]
					0.117646798491478, -- [2]
					0.2274504750967026, -- [3]
				},
				["WARRIOR"] = {
					0.7764688730239868, -- [1]
					0.6078417897224426, -- [2]
					0.427450031042099, -- [3]
				},
				["SHAMAN"] = {
					nil, -- [1]
					0.4392147064208984, -- [2]
					0.8666647672653198, -- [3]
				},
				["MAGE"] = {
					0.2470582872629166, -- [1]
					0.7764688730239868, -- [2]
					0.9176450371742249, -- [3]
				},
				["PRIEST"] = {
					0.9999977946281433, -- [1]
					0.9999977946281433, -- [2]
					0.9999977946281433, -- [3]
				},
				["HUNTER"] = {
					0.6666651964187622, -- [1]
					0.8274491429328918, -- [2]
					0.447057843208313, -- [3]
				},
				["WARLOCK"] = {
					0.5294106006622314, -- [1]
					0.5294106006622314, -- [2]
					0.9294097423553467, -- [3]
				},
				["DEMONHUNTER"] = {
					0.639214277267456, -- [1]
					0.188234880566597, -- [2]
					0.7882335782051086, -- [3]
				},
				["ROGUE"] = {
					0.9999977946281433, -- [1]
					0.9568606615066528, -- [2]
					0.4078422486782074, -- [3]
				},
				["DRUID"] = {
					0.9999977946281433, -- [1]
					0.4862734377384186, -- [2]
					0.03921560198068619, -- [3]
				},
				["MONK"] = {
					nil, -- [1]
					0.9999977946281433, -- [2]
					0.588234007358551, -- [3]
				},
				["PALADIN"] = {
					0.9568606615066528, -- [1]
					0.549018383026123, -- [2]
					0.7294101715087891, -- [3]
				},
			},
			["PowerColors"] = {
				[13] = {
					0.462745098039216, -- [1]
					0.105882352941176, -- [2]
					0.823529411764706, -- [3]
				},
			},
		},
		["Bars"] = {
			["Cast"] = {
				["SafeZone"] = {
					["Alpha"] = 0.75,
				},
				["ColorInterrupt"] = {
					["Color"] = {
						0.5019607843137255, -- [1]
						0.5019607843137255, -- [2]
						0.5019607843137255, -- [3]
					},
				},
				["Color"] = {
					["Reaction"] = true,
					["Class"] = true,
				},
				["Texture"] = "RUF 2",
			},
			["Absorb"] = {
				["Color"] = {
					["Reaction"] = false,
					["Alpha"] = 0.5,
					["Class"] = false,
					["Multiplier"] = 0.5,
					["BaseColor"] = {
						[3] = 1,
					},
				},
			},
			["Health"] = {
				["Color"] = {
					["Class"] = true,
					["Reaction"] = true,
					["Percentage"] = false,
				},
				["Background"] = {
					["Alpha"] = 0.75,
					["UseBarColor"] = true,
				},
			},
			["Power"] = {
				["Background"] = {
					["Alpha"] = 0.75,
				},
				["Texture"] = "RUF 5",
			},
			["Class"] = {
				["Color"] = {
					["Multiplier"] = 0,
				},
				["Background"] = {
					["Alpha"] = 0.75,
				},
				["Texture"] = "RUF 5",
			},
		},
		["Text"] = {
			["HPPerc"] = {
				["Color"] = {
					["PercentageAtMax"] = false,
					["PercentageGradient"] = {
						[3] = 0.215686274509804,
						[6] = 1,
						[7] = 1,
						[9] = 1,
					},
				},
			},
			["Name"] = {
				["Color"] = {
					["Level"] = true,
				},
				["CharLimit"] = 12,
				["Case"] = 0,
			},
			["CurHPPerc"] = {
				["Color"] = {
					["PercentageAtMax"] = false,
					["PercentageGradient"] = {
						[3] = 0.215686274509804,
						[6] = 1,
						[7] = 1,
						[9] = 1,
					},
				},
			},
			["CurHP"] = {
				["Color"] = {
					["PercentageAtMax"] = false,
					["PercentageGradient"] = {
						[3] = 0.215686274509804,
						[6] = 1,
						[7] = 1,
						[9] = 1,
					},
				},
			},
		},
	},
	["unit"] = {
		["focustarget"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 26,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = -50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = 4,
					["x"] = 0,
					["AnchorTo"] = "TOPLEFT",
					["AnchorFrom"] = "BOTTOMLEFT",
					["AnchorFrame"] = "oUF_RUF_Focus",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 200,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 1,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
		},
		["pet"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 26,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = -50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -4,
					["x"] = 0,
					["AnchorTo"] = "BOTTOMRIGHT",
					["AnchorFrom"] = "TOPRIGHT",
					["AnchorFrame"] = "oUF_RUF_Player",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 200,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 1,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
		},
		["pettarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = 4,
					["AnchorTo"] = "BOTTOMRIGHT",
					["AnchorFrom"] = "BOTTOMLEFT",
					["AnchorFrame"] = "oUF_RUF_Pet",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["party"] = {
			["Enabled"] = true,
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 32,
					},
					["InCombat"] = {
						["Enabled"] = true,
						["Size"] = 20,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = 88,
					["x"] = 135,
					["offsety"] = 4,
					["AnchorTo"] = "BOTTOM",
					["growth"] = "TOP",
					["offsetx"] = 0,
					["AnchorFrom"] = "BOTTOMLEFT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHP]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["Anchor"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
						["Size"] = 16,
					},
					["Health Percent"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["Anchor"] = "TOP",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 14,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 6,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Size"] = 21,
						["Font"] = "RUF",
						["Outline"] = "OUTLINE",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 250,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 22,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
		["partypet"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = 4,
					["offsety"] = 19,
					["AnchorTo"] = "TOPRIGHT",
					["growth"] = "TOP",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_Party",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["partytarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = 4,
					["offsety"] = 19,
					["AnchorTo"] = "BOTTOMRIGHT",
					["growth"] = "TOP",
					["offsetx"] = 0,
					["AnchorFrom"] = "BOTTOMLEFT",
					["AnchorFrame"] = "oUF_RUF_Party",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["targettarget"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMLEFT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 26,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = -50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMLEFT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -4,
					["x"] = 0,
					["AnchorTo"] = "BOTTOMLEFT",
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_Target",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "REVERSE",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 200,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
		},
		["focus"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 32,
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 30,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = 160,
					["x"] = 4,
					["AnchorTo"] = "LEFT",
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 4,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHP]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["Anchor"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
						["Size"] = 16,
					},
					["Health Percent"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "AFKDND",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 16,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 6,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Size"] = 21,
						["Font"] = "RUF",
						["Outline"] = "OUTLINE",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -4,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 200,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 200,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 22,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 22,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
		["target"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 32,
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Size"] = 16,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -30,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -100,
					["x"] = 300,
					["AnchorTo"] = "CENTER",
					["AnchorFrom"] = "LEFT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHP]",
					},
					["Health Percent"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "AFKDND",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 6,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 14,
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOM",
							["Anchor"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
					["AFKDND"] = {
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Name",
						},
						["Size"] = 21,
						["Font"] = "RUF",
						["Outline"] = "OUTLINE",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 200,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 200,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
		},
		["arena"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 32,
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 4,
							["x"] = -30,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = 40,
					["x"] = -4,
					["offsety"] = 4,
					["AnchorTo"] = "RIGHT",
					["growth"] = "TOP",
					["offsetx"] = 0,
					["AnchorFrom"] = "BOTTOMRIGHT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 2,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Size"] = 36,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["Anchor"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Size"] = 16,
						["Tag"] = "[RUF:PowerPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 14,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 6,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Outline"] = "OUTLINE",
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = true,
						["Size"] = 21,
						["Font"] = "RUF",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 200,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 16,
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["Height"] = 28,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["CooldownSpiral"] = true,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
		["arenatarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = -4,
					["offsety"] = 19,
					["AnchorTo"] = "BOTTOMLEFT",
					["growth"] = "TOP",
					["offsetx"] = 0,
					["AnchorFrom"] = "BOTTOMRIGHT",
					["AnchorFrame"] = "oUF_RUF_Arena1",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["player"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Badge"] = true,
						["AlwaysShow"] = false,
						["Size"] = 32,
					},
					["InCombat"] = {
						["Enabled"] = true,
						["Size"] = 20,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 35,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 16,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -4,
							["x"] = 2,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -100,
					["x"] = -300,
					["AnchorTo"] = "CENTER",
					["AnchorFrom"] = "RIGHT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health Percent"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 36,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 0,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHP]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["Anchor"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Shadow"] = 0,
						["Enabled"] = false,
						["Tag"] = "[RUF:PowerPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 16,
					},
					["Mana"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 16,
						["Shadow"] = 0,
						["Enabled"] = false,
						["Tag"] = "[RUF:CurManaPerc]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Shadow"] = 0,
						["Enabled"] = false,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Size"] = 21,
						["Font"] = "RUF",
						["Outline"] = "OUTLINE",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 200,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "STANDARD",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 200,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Group"] = true,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
		},
		["boss"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 4,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Style"] = "RUF",
						["Size"] = 16,
						["Position"] = {
							["y"] = 2,
							["x"] = 1,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -40,
					["x"] = -4,
					["offsety"] = -4,
					["AnchorTo"] = "RIGHT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPRIGHT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 2,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Size"] = 36,
						["Tag"] = "[RUF:HPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOM",
							["Anchor"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Size"] = 16,
						["Tag"] = "[RUF:PowerPerc]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 6,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 14,
					},
					["Health Current"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Tag"] = "[RUF:CurHP]",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = false,
						["Size"] = 21,
						["Shadow"] = 0,
						["Width"] = 100,
					},
					["AFKDND"] = {
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Name",
						},
						["Size"] = 21,
						["Font"] = "RUF",
						["Outline"] = "OUTLINE",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 200,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 16,
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["Height"] = 28,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["CooldownSpiral"] = true,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
		["bosstarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = -4,
					["offsety"] = -19,
					["AnchorTo"] = "BOTTOMLEFT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "BOTTOMRIGHT",
					["AnchorFrame"] = "oUF_RUF_Boss1",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
	},
}
RUF.Layout["Alidie's Layout"] = Alidie

local Raeli = {
	["Appearance"] = {
		["Colors"] = {
			["UseClassColors"] = false,
			["ReactionColors"] = {
				{
					0.780392156862745, -- [1]
					0.250980392156863, -- [2]
					0.250980392156863, -- [3]
				}, -- [1]
				{
					0.8, -- [1]
					0.380392156862745, -- [2]
					0.27843137254902, -- [3]
				}, -- [2]
				{
					0.815686274509804, -- [1]
					0.509803921568627, -- [2]
					0.305882352941177, -- [3]
				}, -- [3]
				{
					0.854901960784314, -- [1]
					0.772549019607843, -- [2]
					0.36078431372549, -- [3]
				}, -- [4]
				{
					0.196078431372549, -- [1]
					0.662745098039216, -- [2]
					0.250980392156863, -- [3]
				}, -- [5]
				{
					0.294117647058824, -- [1]
					0.686274509803922, -- [2]
					0.294117647058824, -- [3]
				}, -- [6]
				{
					0.235294117647059, -- [1]
					0.686274509803922, -- [2]
					0.333333333333333, -- [3]
				}, -- [7]
				{
					0.196078431372549, -- [1]
					0.666666666666667, -- [2]
					0.372549019607843, -- [3]
				}, -- [8]
				nil, -- [9]
				{
					0.188235294117647, -- [1]
					0.443137254901961, -- [2]
					0.749019607843137, -- [3]
				}, -- [10]
			},
			["ClassColors"] = {
				["DEATHKNIGHT"] = {
					0.811764705882353, -- [1]
					0.215686274509804, -- [2]
					0.301960784313726, -- [3]
				},
				["WARRIOR"] = {
					0.733333333333333, -- [1]
					0.498039215686275, -- [2]
					0.294117647058824, -- [3]
				},
				["SHAMAN"] = {
					nil, -- [1]
					0.419607843137255, -- [2]
					0.764705882352941, -- [3]
				},
				["MAGE"] = {
					0.215686274509804, -- [1]
					0.772549019607843, -- [2]
					1, -- [3]
				},
				["PRIEST"] = {
					nil, -- [1]
					0.925490196078432, -- [2]
					0.827450980392157, -- [3]
				},
				["PALADIN"] = {
					1, -- [1]
					0.388235294117647, -- [2]
					0.71764705882353, -- [3]
				},
				["WARLOCK"] = {
					0.588235294117647, -- [1]
					0.466666666666667, -- [2]
					0.898039215686275, -- [3]
				},
				["DEMONHUNTER"] = {
					0.6, -- [1]
					1, -- [2]
					0, -- [3]
				},
				["ROGUE"] = {
					nil, -- [1]
					0.847058823529412, -- [2]
					0, -- [3]
				},
				["DRUID"] = {
					nil, -- [1]
					0.513725490196078, -- [2]
					0.196078431372549, -- [3]
				},
				["MONK"] = {
					nil, -- [1]
					0.662745098039216, -- [2]
					0.541176470588235, -- [3]
				},
				["HUNTER"] = {
					0.631372549019608, -- [1]
					0.729411764705882, -- [2]
					0.286274509803922, -- [3]
				},
			},
			["PowerColors"] = {
				[13] = {
					0.588235294117647, -- [1]
					0.466666666666667, -- [2]
					0.898039215686275, -- [3]
				},
				[18] = {
					[3] = 0.00392156862745098,
				},
				[17] = {
					[3] = 0.00392156862745098,
				},
			},
			["DifficultyColors"] = {
				{
					nil, -- [1]
					0.501960784313726, -- [2]
					0.0980392156862745, -- [3]
				}, -- [1]
				{
					nil, -- [1]
					0.745098039215686, -- [2]
					0.0980392156862745, -- [3]
				}, -- [2]
				{
					0.250980392156863, -- [1]
					0.784313725490196, -- [2]
					0.250980392156863, -- [3]
				}, -- [3]
				{
					0.305882352941177, -- [1]
					0.501960784313726, -- [2]
					0.643137254901961, -- [3]
				}, -- [4]
				[0] = {
					nil, -- [1]
					0.196078431372549, -- [2]
					0.0980392156862745, -- [3]
				},
			},
		},
		["Text"] = {
			["AFKDND"] = {
				["Color"] = {
					["BaseColor"] = {
						0.749019607843137, -- [1]
						0.749019607843137, -- [2]
						0.749019607843137, -- [3]
					},
				},
			},
			["Name"] = {
				["CharLimit"] = 20,
			},
			["CurHPPerc"] = {
				["ShowPercAtMax"] = false,
				["Color"] = {
					["Reaction"] = true,
					["Class"] = true,
					["PercentageAtMax"] = false,
				},
			},
			["Level"] = {
				["HideSameLevel"] = true,
			},
		},
		["Bars"] = {
			["Cast"] = {
				["SafeZone"] = {
					["Color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
					},
					["Alpha"] = 0.5,
				},
				["Color"] = {
					["BaseColor"] = {
						0, -- [1]
						0.7607843137254902, -- [2]
						1, -- [3]
					},
				},
				["Texture"] = "RUF 2",
			},
			["Absorb"] = {
				["Color"] = {
					["Alpha"] = 0.4,
					["Class"] = true,
					["Multiplier"] = 0.8,
				},
				["Texture"] = "Solid",
			},
			["Health"] = {
				["Color"] = {
					["Multiplier"] = 0.8,
					["PercentageGradient"] = {
						nil, -- [1]
						nil, -- [2]
						0.12156862745098, -- [3]
						0.117647058823529, -- [4]
						0.117647058823529, -- [5]
						0.117647058823529, -- [6]
						0.117647058823529, -- [7]
						0.117647058823529, -- [8]
						0.117647058823529, -- [9]
					},
				},
				["Background"] = {
					["Alpha"] = 0.75,
				},
				["Texture"] = "Solid",
			},
			["Power"] = {
				["Background"] = {
					["Multiplier"] = 0.2,
					["Alpha"] = 0.75,
				},
				["Texture"] = "Armory",
			},
			["Class"] = {
				["Background"] = {
					["Multiplier"] = 0.2,
					["Alpha"] = 0.75,
				},
				["Texture"] = "Cabaret 2",
			},
		},
	},
	["unit"] = {
		["boss"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 4,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Badge"] = false,
						["AlwaysShow"] = false,
						["Size"] = 32,
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = -40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -50,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 75,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -34,
					["x"] = 0,
					["offsety"] = -4,
					["AnchorTo"] = "BOTTOMLEFT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_FocusTarget",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 4,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
						["Size"] = 16,
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 19,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -4,
							["x"] = 4,
							["AnchorTo"] = "TOPLEFT",
							["Anchor"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = "",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
						["Fill"] = "STANDARD",
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["Height"] = 28,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Size"] = 45,
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["Height"] = 28,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Size"] = 45,
				},
				["Bars"] = {
				},
			},
		},
		["bosstarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = -15,
					["x"] = -4,
					["offsety"] = -19,
					["AnchorTo"] = "TOPRIGHT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_Boss1",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["target"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 40,
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 10,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "MainTankAssist",
						},
					},
					["Honor"] = {
						["Badge"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = true,
						["Size"] = 32,
					},
					["Lead"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "MainTankAssist",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Role"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -10,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -266,
					["x"] = 400,
					["AnchorTo"] = "CENTER",
					["AnchorFrom"] = "LEFT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 4,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 2,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 2,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 4,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Outline"] = "OUTLINE",
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = true,
						["Size"] = 21,
						["Font"] = "RUF",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 60,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 26,
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 26,
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
		["pet"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "BOTTOMRIGHT",
							["AnchorFrom"] = "BOTTOM",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 26,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = -50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -4,
					["x"] = 0,
					["AnchorTo"] = "BOTTOMLEFT",
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_Player",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = -1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 17,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 30,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = -1,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 30,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = -1,
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = -1,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
				},
				["Bars"] = {
				},
			},
		},
		["player"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 40,
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 10,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 10,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "MainTankAssist",
						},
					},
					["Honor"] = {
						["Badge"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = true,
						["Size"] = 32,
					},
					["Lead"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "TOPRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -4,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 15,
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 30,
					},
					["InCombat"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 21,
					},
				},
				["Position"] = {
					["y"] = -266,
					["x"] = -400,
					["AnchorTo"] = "CENTER",
					["AnchorFrom"] = "RIGHT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 4,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 4,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Test2"] = "",
					["Test"] = "",
					["Mana"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 1,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Power",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurManaPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 3,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["AFKDND"] = {
						["Outline"] = "OUTLINE",
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = true,
						["Size"] = 21,
						["Font"] = "RUF",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 60,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 26,
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 15,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Group"] = true,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["Height"] = 26,
					["Position"] = {
						["y"] = 1,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
		["arena"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Badge"] = false,
						["AlwaysShow"] = false,
						["Size"] = 32,
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Role"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = -40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Size"] = 12,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 75,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -34,
					["x"] = 0,
					["offsety"] = -4,
					["AnchorTo"] = "BOTTOMLEFT",
					["AnchorFrom"] = "TOPLEFT",
					["offsetx"] = 0,
					["growth"] = "BOTTOM",
					["AnchorFrame"] = "oUF_RUF_FocusTarget",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 4,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
						["Size"] = 16,
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Enabled"] = true,
						["Size"] = 19,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -4,
							["x"] = 4,
							["AnchorTo"] = "TOPLEFT",
							["Anchor"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = "",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
						["Fill"] = "STANDARD",
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Height"] = 6,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["Height"] = 28,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Min"] = 0,
							["Max"] = 30,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Size"] = 20,
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 10,
					["Max"] = 10,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["Height"] = 28,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Size"] = 26,
				},
				["Bars"] = {
				},
			},
		},
		["arenatarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = -15,
					["x"] = -4,
					["offsety"] = -19,
					["AnchorTo"] = "TOPRIGHT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_Arena1",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["targettarget"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -2,
							["x"] = -3,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Role"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = -40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 14,
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["Assist"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 26,
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -10,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -4,
					["x"] = 0,
					["AnchorTo"] = "BOTTOM",
					["AnchorFrom"] = "TOP",
					["AnchorFrame"] = "oUF_RUF_Target",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "REVERSE",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "REVERSE",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "REVERSE",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = -1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 30,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = -1,
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = -1,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 30,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Position"] = {
						["y"] = -1,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["ClickThrough"] = false,
				},
				["Bars"] = {
				},
			},
		},
		["party"] = {
			["Enabled"] = true,
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["Height"] = 22,
					["ClickThrough"] = false,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Other"] = true,
							["Player"] = true,
							["Group"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Size"] = 45,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "LEFT",
					},
					["Width"] = 32,
					["CooldownSpiral"] = true,
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Position"] = {
						["y"] = 0,
						["x"] = -1,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["Height"] = 22,
					["ClickThrough"] = false,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Size"] = 45,
				},
				["Bars"] = {
				},
			},
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = true,
						["Size"] = 32,
					},
					["InCombat"] = {
						["Enabled"] = true,
						["Size"] = 20,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 10,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "MainTankAssist",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "TOP",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["Lead"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -2,
							["x"] = -3,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "MainTankAssist",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Role"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 50,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 16,
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -10,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -38,
					["x"] = -4,
					["offsety"] = -4,
					["AnchorTo"] = "RIGHT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPRIGHT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 4,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
						["Size"] = 16,
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "AFKDND",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Size"] = 19,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -4,
							["x"] = -4,
							["AnchorTo"] = "TOPRIGHT",
							["Anchor"] = "TOPRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Outline"] = "OUTLINE",
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = true,
						["Size"] = 21,
						["Font"] = "RUF",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
						["Fill"] = "REVERSE",
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 2,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
						["Height"] = 6,
						["Fill"] = "REVERSE",
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 45,
					["Width"] = 300,
				},
			},
		},
		["partypet"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = -4,
					["offsety"] = -19,
					["AnchorTo"] = "TOPLEFT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPRIGHT",
					["AnchorFrame"] = "oUF_RUF_Party",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["partytarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Portrait"] = {
					["Enabled"] = false,
					["Style"] = 1,
					["Cutaway"] = true,
					["Width"] = 60,
					["Height"] = 30,
					["Alpha"] = 0.75,
					["Model"] = {
						["Desaturate"] = false,
						["Rotation"] = 0,
						["CameraDistance"] = 2.5,
						["PortraitZoom"] = 1.08,
						["x"] = -0.35,
						["y"] = -0.35,
						["z"] = -0.25,
						["Animation"] = {
							["Paused"] = true,
						},
					},
					["Position"] = {
						["AnchorFrom"] = 'TOPLEFT',
						["AnchorTo"] = 'TOPRIGHT',
						["x"] = -1,
						["y"] = 0,
					},
					["Border"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 1,
						["Offset"] = 0,
						["Style"] = {
							["edgeFile"] = "RUF Pixel",
							["edgeSize"] = 1,
						},
					},
					["Background"] = {
						["Color"] = {0,0,0},
						["Alpha"] = 0.5,
					},
				},
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
					},
					["Honor"] = {
						["AlwaysShow"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["Enabled"] = false,
						["Badge"] = false,
						["Size"] = 18,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Phased"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Role"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -2,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Phased",
						},
					},
				},
				["Position"] = {
					["y"] = -15,
					["x"] = -4,
					["offsety"] = -19,
					["AnchorTo"] = "TOPLEFT",
					["growth"] = "BOTTOM",
					["offsetx"] = 0,
					["AnchorFrom"] = "TOPRIGHT",
					["AnchorFrame"] = "oUF_RUF_Party",
				},
				["Text"] = {
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
						["Time"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
							["Style"] = 3,
						},
						["Text"] = {
							["Enabled"] = true,
							["Font"] = "RUF",
							["Size"] = 18,
							["Outline"] = "OUTLINE",
							["Shadow"] = 0,
						},
					},
					["Absorb"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Animate"] = true,
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Animate"] = true,
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Animate"] = true,
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 125,
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "BOTTOMRIGHT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
			["showRaid"] = false,
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 12,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 28,
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = 2,
						["x"] = -1,
					},
					["Height"] = 28,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 0,
						["AnchorTo"] = "TOPLEFT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["ClickThrough"] = true,
				},
				["Bars"] = {
				},
			},
		},
		["focus"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 36,
					},
					["InCombat"] = {
						["Enabled"] = true,
						["Size"] = 20,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["LootMaster"] = {
						["Enabled"] = true,
						["Size"] = 14,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 32,
					},
					["Lead"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "TOPRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -2,
							["x"] = 2,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "TOPLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Role"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "InCombat",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["MainTankAssist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = true,
						["Size"] = 28,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Assist"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Rest"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Ready"] = {
						["Enabled"] = true,
						["Size"] = 36,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 10,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = 200,
					["x"] = 4,
					["AnchorTo"] = "LEFT",
					["AnchorFrom"] = "LEFT",
					["AnchorFrame"] = "UIParent",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = 4,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 28,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 2,
							["x"] = -4,
							["AnchorTo"] = "BOTTOMRIGHT",
							["Anchor"] = "BOTTOMRIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 2,
							["x"] = 4,
							["AnchorTo"] = "BOTTOMLEFT",
							["Anchor"] = "BOTTOMLEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 4,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["AFKDND"] = {
						["Outline"] = "OUTLINE",
						["Shadow"] = 0,
						["Tag"] = "[RUF:AFKDND]",
						["Position"] = {
							["y"] = 1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Enabled"] = true,
						["Size"] = 21,
						["Font"] = "RUF",
						["Width"] = 100,
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = true,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 60,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Height"] = 28,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["ClickThrough"] = false,
					["CooldownSpiral"] = true,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "TOPRIGHT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
					["Spacing"] = {
						["y"] = 1,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 10,
					["Max"] = 10,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 40,
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "BOTTOMLEFT",
						["AnchorFrame"] = "Frame",
					},
					["CooldownSpiral"] = true,
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = true,
						},
						["Caster"] = {
							["Other"] = true,
							["Player"] = true,
							["Group"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Height"] = 60,
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["ClickThrough"] = false,
					["Size"] = 60,
				},
				["Bars"] = {
				},
			},
		},
		["focustarget"] = {
			["Enabled"] = true,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -2,
							["x"] = 5,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = -40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Role"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 40,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 14,
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["Assist"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = true,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 26,
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 10,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = -4,
					["x"] = 0,
					["AnchorTo"] = "BOTTOMLEFT",
					["AnchorFrom"] = "TOPLEFT",
					["AnchorFrame"] = "oUF_RUF_Focus",
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
					},
					["Health"] = {
						["Fill"] = "STANDARD",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
							["Order"] = 0,
						},
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 150,
						["Position"] = {
							["y"] = -1,
							["x"] = -4,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Name",
						},
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
						["Enabled"] = true,
						["Size"] = 17,
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 4,
							["AnchorTo"] = "LEFT",
							["Anchor"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 300,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "RIGHT",
					},
					["Width"] = 30,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = 1,
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = -1,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMLEFT",
						["AnchorFrom"] = "TOPLEFT",
						["AnchorFrame"] = "Frame",
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = false,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 1,
					["Growth"] = {
						["y"] = "DOWN",
						["x"] = "LEFT",
					},
					["Width"] = 30,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = false,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Spacing"] = {
						["y"] = -1,
						["x"] = -1,
					},
					["Height"] = 22,
					["CooldownSpiral"] = true,
					["ClickThrough"] = false,
					["Position"] = {
						["y"] = -1,
						["x"] = 0,
						["AnchorTo"] = "BOTTOMRIGHT",
						["AnchorFrom"] = "TOPRIGHT",
						["AnchorFrame"] = "Frame",
					},
				},
				["Bars"] = {
				},
			},
		},
		["pettarget"] = {
			["Enabled"] = false,
			["Frame"] = {
				["Indicators"] = {
					["Objective"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["TargetMark"] = {
						["Enabled"] = true,
						["Position"] = {
							["y"] = -1,
							["x"] = 2,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["LootMaster"] = {
						["Enabled"] = false,
						["Size"] = 18,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPLEFT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Lead"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["Phased"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "TargetMark",
						},
						["Style"] = "RUF",
						["Size"] = 14,
					},
					["Role"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "MainTankAssist",
						},
						["Style"] = "RUF",
						["Size"] = 14,
					},
					["MainTankAssist"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "LEFT",
							["AnchorFrom"] = "RIGHT",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 10,
					},
					["PvPCombat"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Style"] = "RUF",
						["Size"] = 20,
					},
					["Assist"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Lead",
						},
						["Style"] = "RUF",
						["Size"] = 12,
					},
					["PetHappiness"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
					},
					["Honor"] = {
						["Badge"] = false,
						["Position"] = {
							["y"] = 0,
							["x"] = 0,
							["AnchorTo"] = "TOPRIGHT",
							["AnchorFrom"] = "CENTER",
							["AnchorFrame"] = "PvPCombat",
						},
						["AlwaysShow"] = false,
						["Enabled"] = false,
						["Size"] = 18,
					},
					["Ready"] = {
						["Enabled"] = false,
						["Size"] = 26,
						["Style"] = "RUF",
						["Position"] = {
							["y"] = 0,
							["x"] = 10,
							["AnchorTo"] = "RIGHT",
							["AnchorFrom"] = "LEFT",
							["AnchorFrame"] = "Frame",
						},
					},
				},
				["Position"] = {
					["y"] = 0,
					["x"] = 4,
					["AnchorTo"] = "BOTTOMRIGHT",
					["AnchorFrom"] = "BOTTOMLEFT",
					["AnchorFrame"] = "oUF_RUF_Pet",
				},
				["RangeFading"] = {
					["Enabled"] = true,
					["Alpha"] = 0.5,
				},
				["Text"] = {
					["Health"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 21,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurHPPerc]",
					},
					["Level"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = -2,
							["AnchorTo"] = "RIGHT",
							["Anchor"] = "RIGHT",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Level]",
					},
					["Name"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Enabled"] = true,
						["Shadow"] = 0,
						["Tag"] = "[RUF:Name]",
						["Size"] = 18,
					},
					["Power"] = {
						["Outline"] = "OUTLINE",
						["Font"] = "RUF",
						["Width"] = 100,
						["Position"] = {
							["y"] = -1,
							["x"] = 0,
							["AnchorTo"] = "CENTER",
							["Anchor"] = "CENTER",
							["AnchorFrame"] = "Frame",
						},
						["Size"] = 18,
						["Enabled"] = false,
						["Shadow"] = 0,
						["Tag"] = "[RUF:CurPowerPerc]",
					},
				},
				["Bars"] = {
					["Cast"] = {
						["Enabled"] = false,
						["Position"] = {
							["y"] = -38,
							["x"] = 0,
							["AnchorTo"] = "BOTTOM",
							["AnchorFrom"] = "TOP",
							["AnchorFrame"] = true,
						},
						["Height"] = 26,
						["Fill"] = "STANDARD",
						["Width"] = 300,
					},
					["Absorb"] = {
						["Enabled"] = 1,
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "BOTTOM",
							["Order"] = 1,
						},
						["Fill"] = "REVERSE",
					},
					["Health"] = {
						["Fill"] = "REVERSE",
					},
					["Power"] = {
						["Enabled"] = 1,
						["Height"] = 4,
						["Position"] = {
							["Anchor"] = "TOP",
							["Order"] = 0,
						},
						["Fill"] = "REVERSE",
					},
					["Class"] = {
						["Enabled"] = false,
						["Fill"] = "STANDARD",
						["Height"] = 8,
						["Position"] = {
							["Anchor"] = "TOP",
						},
					},
				},
				["Size"] = {
					["Height"] = 30,
					["Width"] = 148,
				},
			},
			["Buffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "RIGHT",
						["AnchorFrom"] = "LEFT",
						["AnchorFrame"] = "Frame",
					},
					["Height"] = 30,
					["CooldownSpiral"] = true,
					["ClickThrough"] = true,
					["Spacing"] = {
						["y"] = 2,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
			["Debuffs"] = {
				["Icons"] = {
					["Enabled"] = true,
					["Columns"] = 5,
					["Max"] = 5,
					["Rows"] = 2,
					["Growth"] = {
						["y"] = "UP",
						["x"] = "RIGHT",
					},
					["Width"] = 32,
					["Filter"] = {
						["BlackOrWhite"] = "Black",
						["Dispellable"] = false,
						["Time"] = {
							["Max"] = 0,
							["Min"] = 0,
							["Unlimited"] = false,
						},
						["Caster"] = {
							["Group"] = false,
							["Player"] = true,
							["Other"] = true,
							["Unit"] = true,
						},
						["Lists"] = {
						},
					},
					["Sort"] = {
						["SortBy"] = "Remaining",
						["Direction"] = "Descending",
					},
					["Position"] = {
						["y"] = 0,
						["x"] = 1,
						["AnchorTo"] = "RIGHT",
						["AnchorFrom"] = "LEFT",
						["AnchorFrame"] = "Frame",
					},
					["Height"] = 30,
					["CooldownSpiral"] = true,
					["ClickThrough"] = true,
					["Spacing"] = {
						["y"] = 2,
						["x"] = 1,
					},
				},
				["Bars"] = {
				},
			},
		},
	},
}
RUF.Layout["Raeli's Layout"] = Raeli