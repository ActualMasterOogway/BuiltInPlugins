local Framework = script:FindFirstAncestor("UI").Parent
local rule = require(Framework.Styling.createStyleRule)

local getFFlagDevFrameworkViewTypeSelectorUpdate =
	require(Framework.SharedFlags.getFFlagDevFrameworkViewTypeSelectorUpdate)
local getFFlagDevFrameworkViewTypeSelectorIcons =
	require(Framework.SharedFlags.getFFlagDevFrameworkViewTypeSelectorIcons)

local ICON_BASE = "rbxasset://textures/MaterialFramework/" -- remove with FFlagDevFrameworkViewTypeSelectorIcons

local sizeDefault = UDim2.fromOffset(50, 32)
local sizeIconOnly = UDim2.fromOffset(16, 16)

return rule(".Component-ViewTypeSelector", {
	BackgroundTransparency = 1,
	BorderSizePixel = 0,
	Size = sizeDefault,
	Width = 120,
}, {
	if getFFlagDevFrameworkViewTypeSelectorUpdate()
		then rule(".IconOnly", {
			Size = sizeIconOnly,
		})
		else nil,
	if getFFlagDevFrameworkViewTypeSelectorIcons()
		then rule(".List > .Component-SelectInput", {}, {
			rule("> ImageButton", {
				Image = "$ListImage",
			}, {}),
			rule("> TextButton > #SelectedItemIcon", {
				Image = "$ListImage",
			}, {}),
		})
		else nil,
	if getFFlagDevFrameworkViewTypeSelectorIcons()
		then rule(".Grid > .Component-SelectInput", {}, {
			rule("> ImageButton", {
				Image = "$GridImage",
			}, {}),
			rule("> TextButton > #SelectedItemIcon", {
				Image = "$GridImage",
			}, {}),
		})
		else nil,
}, {
	ListIcon = `{ICON_BASE}List.png`, -- remove with FFlagDevFrameworkViewTypeSelectorIcons
	GridIcon = `{ICON_BASE}Grid.png`, -- remove with FFlagDevFrameworkViewTypeSelectorIcons
	MenuHeight = 64,
	MenuHeightSlider = 96,
	SizeDefault = sizeDefault,
	SizeIconOnly = sizeIconOnly,
})
