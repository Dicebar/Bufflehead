-- Profile.lua contains the tables used to initialize the profile and presets

local MOD = Bufflehead
local _

local FILTER_BUFFS = "HELPFUL"
local FILTER_DEBUFFS = "HARMFUL"
local HEADER_NAME = "BuffleheadSecureHeader"
local PLAYER_BUFFS = "Player Buffs"
local PLAYER_DEBUFFS = "Player Debuffs"
local HEADER_PLAYER_BUFFS = HEADER_NAME .. "PlayerBuffs"
local HEADER_PLAYER_DEBUFFS = HEADER_NAME .. "PlayerDebuffs"

-- Default profile description used to initialize the SavedVariables persistent database
MOD.DefaultProfile = {
	global = { -- shared settings for all characters
		enabled = true, -- enable addon
		hideBlizz = true, -- hide Blizzard buffs and debuffs
		Minimap = { hide = false, minimapPos = 200, radius = 80, }, -- saved DBIcon minimap settings
		hideOmniCC = true, -- only valid if OmniCC addon is available
	},
	profile = { -- settings specific to a profile
		showAnchors = false, -- show or hide the anchor rectangles
		iconSize = 40,
		iconBorder = "raven", -- "default", "none", "one", "two", "raven", "masque"
		iconBuffColor = { r = 0.3, g = 0.6, b = 0.3, a = 1 },
    iconDebuffColor = { r = 0.6, g = 0.3, b = 0.3, a = 1 },
		debuffColoring = true, -- use debuff color for border if applicable
		growDirection = 1, -- horizontal = 1, otherwise vertical
		directionX = -1, -- 1 = right, -1 = left
		directionY = -1, -- 1 = up, -1 = down
		wrapAfter = 20,
		maxWraps = 2,
		spaceX = 6, -- horizontal distance between icons (allow space for elements positioned between icons)
		spaceY = 24, -- vertical distance between icons (allow space for elements positioned between icons)
		sortMethod = "TIME", -- "INDEX", "NAME", "TIME"
		sortDirection = "-", -- ASCENDING = "+", DESCENDING = "-"
		separateOwn = 0, -- 0 = don't separate, 1 = sort before others, -1 = sort after others
		weaponEnchants = true, -- include weapon enchants in the buffs group
		showTime = true,
		timePosition = { point = "TOP", relativePoint = "BOTTOM", anchor = "icon", offsetX = 0, offsetY = 0 },
		timeFormat = 24, -- use simple time format
		timeSpaces = false, -- if true include spaces in time text
		timeCase = false, -- if true use upper case in time text
		timeFont = "Arial Narrow", -- default font
		timeFontPath = 0, -- actual font path
		timeFontSize = 14,
		timeFontFlags = { outline = true, thick = false, mono = false },
		timeShadow = true,
		timeColor = { r = 1, g = 1, b = 1, a = 1 },
		expireColor = { r = 1, g = 0, b = 0, a = 1 },
		showCount = true,
		countPosition = { point = "CENTER", relativePoint = "CENTER", anchor = "icon", offsetX = 0, offsetY = 0 },
		countFont = "Arial Narrow", -- default font
		countFontPath = 0, -- actual font path
		countFontSize = 14,
		countFontFlags = { outline = true, thick = false, mono = false },
		countShadow = true,
		countColor = { r = 1, g = 1, b = 1, a = 1 },
		showLabel = false,
		labelPosition = { point = "BOTTOM", relativePoint = "TOP", anchor = "icon", offsetX = 0, offsetY = 0 },
		labelMaxWidth = 40, -- set if want to truncate or wrap
		labelWrap = false,
		labelWordWrap = false,
		labelFont = "Arial Narrow", -- default font
		labelFontPath = 0, -- actual font path
		labelFontSize = 14,
		labelFontFlags = { outline = true, thick = false, mono = false },
		labelShadow = true,
		labelColor = { r = 1, g = 1, b = 1, a = 1 },
		showClock = false, -- show clock overlay to indicate remaining time
		clockEdge = true,
		clockReverse = false,
		clockColor = { r = 0, g = 0, b = 0, a = 0.75 },
		showBar = false,
		barPosition = { point = "TOP", relativePoint = "BOTTOM", anchor = "icon", offsetX = 0, offsetY = 0 },
		barWidth = 0, --  0 = same as icon width
		barHeight = 10, --  0 = same as icon height
		barOrientation = true, -- true = "HORIZONTAL", false = "VERTICAL"
		barDirection = true, -- true = "STANDARD", false = "REVERSE"
    barUnlimited = "none", -- for unlimited duration, "none" = no bar, "empty" = empty bar, "full" = full bar
    barTexture = "None", -- shared media statusbar name
    barForegroundOpacity = 1,
    barBackgroundOpacity = 0.5,
    barBuffColor = { r = 0.3, g = 0.6, b = 0.3, a = 1 },
		barDebuffColor = { r = 0.6, g = 0.3, b = 0.3, a = 1 },
		barBorder = "one", -- "none", "one", "two", "media"
		barBorderBuffColor = { r = 0.3, g = 0.6, b = 0.3, a = 1 },
    barBorderDebuffColor = { r = 0.6, g = 0.3, b = 0.3, a = 1 },
    barBorderMedia = "None", -- shared media border name
    barBorderWidth = 1, -- depends on selected media file
    barBorderOffset = 0, -- depends on selected media file
		groups = {
			[HEADER_PLAYER_BUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_BUFFS,
				caption = PLAYER_BUFFS,
				anchorX = 0.8, -- fraction of screen from left edge, puts it near the mini-map
				anchorY = 0.98, -- fraction of the screen from bottom edge
			},
			[HEADER_PLAYER_DEBUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_DEBUFFS,
				caption = PLAYER_DEBUFFS,
				anchorX = 0.8,
				anchorY = 0.84, -- default places it below the buffs group
			},
		},
	},
}

MOD.Presets = {
  [1] = { -- horizontal icons with time, basically same as starting profile except don't reset appearance settings
    iconSize = 40,
    iconBorder = "raven", -- "default", "none", "one", "two", "raven", "masque"
    iconBuffColor = { r = 0.3, g = 0.6, b = 0.3, a = 1 },
    iconDebuffColor = { r = 0.6, g = 0.3, b = 0.3, a = 1 },
    debuffColoring = true, -- use debuff color for border if applicable
		growDirection = 1, -- horizontal = 1, otherwise vertical
		directionX = -1, -- 1 = right, -1 = left
		directionY = -1, -- 1 = up, -1 = down
		wrapAfter = 20,
		maxWraps = 2,
		spaceX = 6, -- horizontal distance between icons (allow space for elements positioned between icons)
		spaceY = 24, -- vertical distance between icons (allow space for elements positioned between icons)
		showTime = true,
		timePosition = { point = "TOP", relativePoint = "BOTTOM", anchor = "icon", offsetX = 0, offsetY = 0 },
    timeFormat = 24, -- use simple time format
		timeSpaces = false, -- if true include spaces in time text
		timeCase = false, -- if true use upper case in time text
		timeFont = "Arial Narrow", -- default font
		timeFontPath = 0, -- actual font path
		timeFontSize = 14,
		timeFontFlags = { outline = true, thick = false, mono = false },
		timeShadow = true,
		timeColor = { r = 1, g = 1, b = 1, a = 1 },
		expireColor = { r = 1, g = 0, b = 0, a = 1 },
		showCount = true,
		countPosition = { point = "CENTER", relativePoint = "CENTER", anchor = "icon", offsetX = 0, offsetY = 0 },
    countFont = "Arial Narrow", -- default font
		countFontPath = 0, -- actual font path
		countFontSize = 14,
		countFontFlags = { outline = true, thick = false, mono = false },
		countShadow = true,
		countColor = { r = 1, g = 1, b = 1, a = 1 },
		showLabel = false,
		showClock = false, -- show clock overlay to indicate remaining time
		showBar = false,
		groups = {
			[HEADER_PLAYER_BUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_BUFFS,
				caption = PLAYER_BUFFS,
				anchorX = 0.85, -- fraction of screen from left edge, puts it near the mini-map
				anchorY = 0.98, -- fraction of the screen from bottom edge
			},
			[HEADER_PLAYER_DEBUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_DEBUFFS,
				caption = PLAYER_DEBUFFS,
				anchorX = 0.85,
				anchorY = 0.85, -- default places it below the buffs group
			},
		},
  },
  [2] = { -- vertical icons with clock overlay
    iconSize = 40,
    iconBorder = "one", -- "default", "none", "one", "two", "raven", "masque"
    iconBuffColor = { r = 1, g = 1, b = 1, a = 1 },
    iconDebuffColor = { r = 1, g = 1, b = 1, a = 1 },
    debuffColoring = true, -- use debuff color for border if applicable
		growDirection = 0, -- horizontal = 1, otherwise vertical
		directionX = -1, -- 1 = right, -1 = left
		directionY = -1, -- 1 = up, -1 = down
		wrapAfter = 12,
		maxWraps = 3,
		spaceX = 12, -- horizontal distance between icons (allow space for elements positioned between icons)
		spaceY = 8, -- vertical distance between icons (allow space for elements positioned between icons)
		showTime = false,
		showCount = true,
    countPosition = { point = "CENTER", relativePoint = "CENTER", anchor = "icon", offsetX = 0, offsetY = 0 },
		countFont = "Arial Narrow", -- default font
		countFontPath = 0, -- actual font path
		countFontSize = 14,
		countFontFlags = { outline = true, thick = false, mono = false },
		countShadow = true,
		countColor = { r = 1, g = 1, b = 1, a = 1 },
		showLabel = false,
		showClock = true, -- show clock overlay to indicate remaining time
    clockEdge = true,
		clockReverse = false,
		clockColor = { r = 0, g = 0, b = 0, a = 0.75 },
		showBar = false,
		groups = {
			[HEADER_PLAYER_BUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_BUFFS,
				caption = PLAYER_BUFFS,
				anchorX = 0.85, -- fraction of screen from left edge, puts it near the mini-map
				anchorY = 0.98, -- fraction of the screen from bottom edge
			},
			[HEADER_PLAYER_DEBUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_DEBUFFS,
				caption = PLAYER_DEBUFFS,
				anchorX = 0.72,
				anchorY = 0.98, -- default places it left of the buffs group
			},
		},
  },
  [3] = { -- horizontal icons with timer bars
    iconSize = 40,
    iconBorder = "one", -- "default", "none", "one", "two", "raven", "masque"
    iconBuffColor = { r = 1, g = 1, b = 1, a = 1 },
    iconDebuffColor = { r = 1, g = 1, b = 1, a = 1 },
    debuffColoring = true, -- use debuff color for border if applicable
		growDirection = 1, -- horizontal = 1, otherwise vertical
		directionX = -1, -- 1 = right, -1 = left
		directionY = -1, -- 1 = up, -1 = down
		wrapAfter = 20,
		maxWraps = 2,
		spaceX = 8, -- horizontal distance between icons (allow space for elements positioned between icons)
		spaceY = 26, -- vertical distance between icons (allow space for elements positioned between icons)
		showTime = false,
		showCount = true,
    countPosition = { point = "CENTER", relativePoint = "CENTER", anchor = "icon", offsetX = 0, offsetY = 0 },
		countFont = "Arial Narrow", -- default font
		countFontPath = 0, -- actual font path
		countFontSize = 14,
		countFontFlags = { outline = true, thick = false, mono = false },
		countShadow = true,
		countColor = { r = 1, g = 1, b = 1, a = 1 },
		showLabel = false,
		showClock = false, -- show clock overlay to indicate remaining time
		showBar = true,
    barPosition = { point = "TOP", relativePoint = "BOTTOM", anchor = "icon", offsetX = 0, offsetY = -4 },
		barWidth = 0, --  0 = same as icon width
		barHeight = 10, --  0 = same as icon height
    barBorder = "one", -- "none", "one", "two", "media"
		barOrientation = true, -- true = "HORIZONTAL", false = "VERTICAL"
		barDirection = true, -- true = "STANDARD", false = "REVERSE"
    barUnlimited = "none", -- for unlimited duration, "none" = no bar, "empty" = empty bar, "full" = full bar
    barTexture = "None", -- shared media statusbar name
    barForegroundOpacity = 1,
    barBackgroundOpacity = 0.5,
    barBuffColor = { r = 0.3, g = 0.6, b = 0.3, a = 1 },
		barDebuffColor = { r = 0.6, g = 0.3, b = 0.3, a = 1 },
    barDebuffColoring = true, -- use debuff color for bar if applicable
		barBorder = "one", -- "none", "one", "two", "media"
    barBorderBuffColor = { r = 1, g = 1, b = 1, a = 1 },
    barBorderDebuffColor = { r = 1, g = 1, b = 1, a = 1 },
    barBorderMedia = "None", -- shared media border name
    barBorderWidth = 1, -- depends on selected media file
    barBorderOffset = 0, -- depends on selected media file
    groups = {
			[HEADER_PLAYER_BUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_BUFFS,
				caption = PLAYER_BUFFS,
				anchorX = 0.85, -- fraction of screen from left edge, puts it near the mini-map
				anchorY = 0.98, -- fraction of the screen from bottom edge
			},
			[HEADER_PLAYER_DEBUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_DEBUFFS,
				caption = PLAYER_DEBUFFS,
				anchorX = 0.85,
				anchorY = 0.85, -- default places it below the buffs group
			},
		},
  },
  [4] = { -- vertical stack of full-size bars with labels and time texts
    iconSize = 24,
    iconBorder = "one", -- "default", "none", "one", "two", "raven", "masque"
    iconBuffColor = { r = 1, g = 1, b = 1, a = 1 },
    iconDebuffColor = { r = 1, g = 1, b = 1, a = 1 },
    debuffColoring = true, -- use debuff color for border if applicable
		growDirection = 0, -- horizontal = 1, otherwise vertical
		directionX = -1, -- 1 = right, -1 = left
		directionY = -1, -- 1 = up, -1 = down
		wrapAfter = 16,
		maxWraps = 1,
		spaceX = 270, -- horizontal distance between icons (allow space for elements positioned between icons)
		spaceY = 8, -- vertical distance between icons (allow space for elements positioned between icons)
    showTime = true,
		timePosition = { point = "RIGHT", relativePoint = "RIGHT", anchor = "bar", offsetX = -3, offsetY = 0 },
    timeFormat = 24, -- use simple time format
		timeSpaces = false, -- if true include spaces in time text
		timeCase = false, -- if true use upper case in time text
		timeFont = "Arial Narrow", -- default font
		timeFontPath = 0, -- actual font path
		timeFontSize = 14,
		timeFontFlags = { outline = false, thick = false, mono = false },
		timeShadow = true,
		timeColor = { r = 1, g = 1, b = 1, a = 1 },
		expireColor = { r = 1, g = 0, b = 0, a = 1 },
		showCount = true,
    countPosition = { point = "CENTER", relativePoint = "CENTER", anchor = "icon", offsetX = 0, offsetY = 0 },
		countFont = "Arial Narrow", -- default font
		countFontPath = 0, -- actual font path
		countFontSize = 14,
		countFontFlags = { outline = true, thick = false, mono = false },
		countShadow = true,
		countColor = { r = 1, g = 1, b = 1, a = 1 },
    showLabel = true,
		labelPosition = { point = "LEFT", relativePoint = "LEFT", anchor = "bar", offsetX = 3, offsetY = 0 },
		labelMaxWidth = 160, -- set if want to truncate or wrap
		labelWrap = false,
		labelWordWrap = false,
		labelFont = "Arial Narrow", -- default font
		labelFontPath = 0, -- actual font path
		labelFontSize = 14,
		labelFontFlags = { outline = false, thick = false, mono = false },
		labelShadow = true,
		labelColor = { r = 1, g = 1, b = 1, a = 1 },
		showClock = false, -- show clock overlay to indicate remaining time
    showBar = true,
    barPosition = { point = "LEFT", relativePoint = "RIGHT", anchor = "icon", offsetX = 4, offsetY = 0 },
		barWidth = 200, --  0 = same as icon width
		barHeight = 24, --  0 = same as icon height
    barBorder = "one", -- "none", "one", "two", "media"
		barOrientation = true, -- true = "HORIZONTAL", false = "VERTICAL"
		barDirection = true, -- true = "STANDARD", false = "REVERSE"
    barUnlimited = "empty", -- for unlimited duration, "none" = no bar, "empty" = empty bar, "full" = full bar
    barTexture = "None", -- shared media statusbar name
    barForegroundOpacity = 1,
    barBackgroundOpacity = 0.5,
    barBuffColor = { r = 0.3, g = 0.6, b = 0.3, a = 1 },
		barDebuffColor = { r = 0.6, g = 0.3, b = 0.3, a = 1 },
    barDebuffColoring = true, -- use debuff color for bar if applicable
		barBorder = "one", -- "none", "one", "two", "media"
		barBorderBuffColor = { r = 1, g = 1, b = 1, a = 1 },
    barBorderDebuffColor = { r = 1, g = 1, b = 1, a = 1 },
    barBorderDebuffColoring = true, -- use debuff color for bar border if applicable
    barBorderMedia = "None", -- shared media border name
    barBorderWidth = 1, -- depends on selected media file
    barBorderOffset = 0, -- depends on selected media file
		groups = {
			[HEADER_PLAYER_BUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_BUFFS,
				caption = PLAYER_BUFFS,
				anchorX = 0.75, -- fraction of screen from left edge, puts it near the mini-map
				anchorY = 0.98, -- fraction of the screen from bottom edge
			},
			[HEADER_PLAYER_DEBUFFS] = {
				enabled = true,
				unit = "player",
				filter = FILTER_DEBUFFS,
				caption = PLAYER_DEBUFFS,
				anchorX = 0.5,
				anchorY = 0.98, -- default places it in near center and top of display, growing down
			},
		},
  },
}
