local Framework = script.Parent.Parent
local FFlagDevFrameworkModernTreeTable = require(Framework.SharedFlags.getFFlagDevFrameworkModernTreeTable)()
local FFlagDevFrameworkModernStartPageStyle = require(Framework.SharedFlags.getFFlagDevFrameworkModernStartPageStyle)()

local Dash = require(Framework.Parent.Dash)

local tokens = {
	BackgroundDefault = "$Gray40",
	BackgroundPaper = "$Gray30",
	ForegroundMain = "$Gray20",
	ForegroundMuted = "$Gray10",
	ForegroundContrast = "$Gray40",
	TextPrimary = "$Gray110",
	TextSecondary = "$Gray80",
	TextContrast = "$White",
	TextLink = "$Blue80",
	TextLinkHover = "$Blue100",
	TextDisabled = "$Gray60",
	TextError = "$Red90",
	TextSuccess = "$Green100",
	TextWarning = "$Yellow100",
	ErrorMain = "$Red90",
	SuccessMain = "$Green80",
	WarningMain = "$Yellow90",
	ActionHover = "$Gray40",
	ActionEnabled = "$Gray80",
	ActionSelected = "$Blue10",
	ActionActivated = "$Gray50",
	ActionFocusBorder = "$Blue70",
	PrimaryMain = "$Blue70",
	PrimaryHoverBackground = "$Blue50",
	SecondaryMain = "$Gray20",
	SecondaryMuted = "$White",
	SecondaryContrast = "$Gray70",
	SecondaryHoverBackground = "$Gray30",
	SecondaryHoverOutlineBorder = "$Gray60",
	SecondaryRestingOutlineBorder = "$Gray60",
	FilledInputBackground = "$White",
	Divider = "$Gray50",

	-- TODO (STUDIOPLAT-34128): Move these tokens to a component-specific layer;
	-- right now we can only add them here since we can't add themed tokens to
	-- DF components' styles.lua files. Avoid bloating this file with more
	-- component-specific image tokens!!!
	ArrowDownImage = "rbxasset://studio_svg_textures/Shared/Navigation/Light/Standard/ArrowDown.png",
	ArrowRightImage = "rbxasset://studio_svg_textures/Shared/Navigation/Light/Standard/ArrowRight.png",
	CheckboxUncheckedImage = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_light.png",
	CheckboxCheckedImage = "rbxasset://textures/DeveloperFramework/checkbox_checked_light.png",
	CheckboxIndeterminateImage = "rbxasset://textures/DeveloperFramework/checkbox_indeterminate_light.png",
	CheckboxDisabledImage = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_disabled_light.png",
	SearchIcon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Light/Standard/Search.png",
	ErrorLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Error.png",
	InformationLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Information.png",
	QuestionLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Question.png",
	SuccessLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Success.png",
	WarningLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Light/Large/Warning.png",
	ListImage = "rbxasset://studio_svg_textures/Lua/MaterialPicker/Light/Standard/List.png",
	GridImage = "rbxasset://studio_svg_textures/Lua/MaterialPicker/Light/Standard/Grid.png",
}

if FFlagDevFrameworkModernTreeTable then
	tokens = Dash.join(tokens, {
		TableRowEmphasisBackgroundTransparency = 0.92,
		TableRowEmphasisBackground = Color3.fromHex("#333B4C"),

		TableRowHoverBackgroundTransparency = 0.84,
		TableRowHoverBackground = Color3.fromHex("#000000"),

		TableHeaderBorderTransparency = 0.9,
		TableHeaderBorder = Color3.fromHex("#000000"),
	})
end

if FFlagDevFrameworkModernStartPageStyle then
	tokens = Dash.join(tokens, {
		Surface100 = Color3.fromHex("#FFFFFF"),
		ContentMuted = Color3.fromHex("#696A6D"),
		SelectInputHoverBorderColor = Color3.fromHex("#E0E0E0"),
		SelectInputHoverBackground = Color3.fromHex("#EBEBEB"),
		ScrollBarColor = Color3.fromHex("#BBBCBE"),
	})
end

return tokens
