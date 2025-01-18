type Keys = {
	Dark: Color3,
	Light: Color3,
}

local Framework = script:FindFirstAncestor("Style").Parent

local Dash = require(Framework.Parent.Dash)
local join = Dash.join

local getFFlagDevFrameworkShimmerImprovements = require(Framework.SharedFlags.getFFlagDevFrameworkShimmerImprovements)
local FFlagDevFrameworkModernStartPageStyle = require(Framework.SharedFlags.getFFlagDevFrameworkModernStartPageStyle)()

local Colors = require(Framework.Style.Colors)
local StyleKey = require(Framework.Style.StyleKey)

local getStudioColorClassTheme = require(Framework.Style.ColorSystem.getStudioColorClassTheme)

-- When getting colors for light theme, using Studio Color Classes is preferred
local studioColorClassTheme = getStudioColorClassTheme("Light")

return join(
	studioColorClassTheme,
	{
		-- WARNING: StyleKeys below this line have not been updated to new system
		[StyleKey.Border] = Color3.fromRGB(182, 182, 182),
		[StyleKey.BrightText] = Colors.Black,
		[StyleKey.Button] = Colors.White,
		[StyleKey.ButtonText] = Colors.Black,
		[StyleKey.ButtonHover] = Color3.fromRGB(228, 238, 254),
		[StyleKey.ButtonDisabled] = Colors.White,
		[StyleKey.ButtonTextDisabled] = Color3.fromRGB(102, 102, 102),
		[StyleKey.ButtonPressed] = Color3.fromRGB(219, 219, 219),
		[StyleKey.ButtonSelected] = Color3.fromRGB(228, 238, 254),
		[StyleKey.ImageButtonBackground] = Color3.fromRGB(182, 182, 182),
		[StyleKey.ImageButtonHover] = Colors.lighter(Color3.fromRGB(182, 182, 182), 0.26),

		[StyleKey.Icon] = Color3.fromRGB(128, 128, 128),
		[StyleKey.IconBackgroundColor] = Colors.Gray_Lightest,
		[StyleKey.IconImageColor] = Color3.fromRGB(151, 151, 151),

		[StyleKey.ToolbarBackgroundColor] = Color3.fromRGB(0, 0, 0),
		[StyleKey.ToolbarButtonBackgroundColor] = Color3.fromRGB(39, 39, 39),

		[StyleKey.CategoryItem] = Color3.fromRGB(233, 233, 233),
		[StyleKey.CurrentMarker] = Colors.Blue,
		[StyleKey.CurrentMarkerSelected] = Colors.Blue,

		[StyleKey.DialogButton] = Colors.White,
		[StyleKey.DialogButtonBorder] = Colors.Gray_Light,
		[StyleKey.DialogButtonHover] = Colors.Blue_Light,
		[StyleKey.DialogButtonPressed] = Color3.fromRGB(219, 219, 219),
		[StyleKey.DialogButtonText] = Colors.Black,
		[StyleKey.DialogMainButton] = Colors.Blue,
		[StyleKey.DialogMainButtonDisabled] = Color3.fromRGB(153, 218, 255),
		[StyleKey.DialogMainButtonHover] = Colors.Blue_Light,
		[StyleKey.DialogMainButtonPressed] = Colors.Blue_Dark,
		[StyleKey.DialogMainButtonSelected] = Colors.Blue_Dark,
		[StyleKey.DialogMainButtonText] = Colors.White,
		[StyleKey.DialogMainButtonTextDisabled] = Colors.White,
		[StyleKey.DimmedText] = Color3.fromRGB(117, 117, 117),
		[StyleKey.Dropdown] = Colors.White,

		[StyleKey.InputFieldBackground] = Colors.White,
		[StyleKey.InputFieldBackgroundDisabled] = Color3.fromRGB(231, 231, 231),
		[StyleKey.InputFieldBorder] = Color3.fromRGB(200, 200, 200),
		[StyleKey.InputFieldBorderDisabled] = Color3.fromRGB(182, 182, 182),
		[StyleKey.InputFieldBorderHover] = Colors.Blue,
		[StyleKey.InputFieldBorderSelected] = Colors.Blue,
		[StyleKey.Item] = Colors.White,
		[StyleKey.ItemHovered] = Colors.Gray,
		[StyleKey.ItemSelected] = Colors.Blue_Dark,

		[StyleKey.Light] = Color3.fromRGB(243, 243, 243),
		[StyleKey.MainBackground] = Colors.White,
		[StyleKey.MainButton] = Color3.fromRGB(228, 238, 254),
		[StyleKey.MainTextDisabled] = Color3.fromRGB(120, 120, 120),
		[StyleKey.MainTextHover] = Colors.Black,
		[StyleKey.MainTextSelected] = Colors.White,
		[StyleKey.MenuBarBackground] = Colors.Gray_Lightest,
		[StyleKey.MenuEntryHighlight] = Colors.Blue,
		[StyleKey.MenuEntryHover] = Colors.Gray_Light,
		[StyleKey.Mid] = Color3.fromRGB(238, 238, 238),
		[StyleKey.SubBackground] = Colors.Gray_Lighter,
		[StyleKey.SubBackground2] = Colors.Gray_Lightest,

		[StyleKey.RadioButtonDisabledImage] = "rbxasset://textures/StudioSharedUI/radio_selected_disabled_dot.png",
		[StyleKey.RibbonTab] = Color3.fromRGB(243, 243, 243),

		[StyleKey.ScrollBarBackground] = Color3.fromRGB(238, 238, 238),
		[StyleKey.ScrollBar] = Colors.Gray_Light,
		[StyleKey.SliderKnobColor] = Colors.White,
		[StyleKey.SliderKnobImage] = "rbxasset://textures/DeveloperFramework/slider_knob.png",
		[StyleKey.SliderBackground] = Color3.fromRGB(204, 204, 204),
		[StyleKey.SubText] = Colors.Gray_Mid,

		[StyleKey.Tab] = Color3.fromRGB(242, 242, 242),
		[StyleKey.TabHovered] = Colors.White,
		[StyleKey.TabSelected] = Color3.fromRGB(228, 238, 254),

		[StyleKey.TableItem] = Colors.Gray_Lightest,
		[StyleKey.TableItemSelected] = Color3.fromRGB(104, 148, 217),
		[StyleKey.Titlebar] = Color3.fromRGB(227, 227, 227),
		[StyleKey.TitlebarText] = Colors.Black,
		[StyleKey.ToggleOnImage] = "rbxasset://textures/RoactStudioWidgets/toggle_on_light.png",
		[StyleKey.ToggleOffImage] = "rbxasset://textures/RoactStudioWidgets/toggle_off_light.png",
		[StyleKey.ToggleDisabledImage] = "rbxasset://textures/RoactStudioWidgets/toggle_disable_light.png",
		[StyleKey.ToggleDisabledAndSelectedImage] = "rbxasset://textures/RoactStudioWidgets/toggle_on_disable_light.png",

		[StyleKey.CheckboxUncheckedImage] = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_light.png",
		[StyleKey.CheckboxCheckedImage] = "rbxasset://textures/DeveloperFramework/checkbox_checked_light.png",
		[StyleKey.CheckboxIndeterminateImage] = "rbxasset://textures/DeveloperFramework/checkbox_indeterminate_light.png",
		[StyleKey.CheckboxDisabledImage] = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_disabled_light.png",

		[StyleKey.EyeIconOnImage] = "rbxasset://textures/DeveloperFramework/UIOn_light.png",
		[StyleKey.EyeIconOffImage] = "rbxasset://textures/DeveloperFramework/UIOff_light.png",

		[StyleKey.CheckedFieldBackgroundHover] = Color3.fromRGB(89, 93, 100),

		[StyleKey.ShimmerStart] = if getFFlagDevFrameworkShimmerImprovements()
			then Colors.Gray_Lighter
			else Colors.Gray_Light,
		[StyleKey.ShimmerMiddle] = if getFFlagDevFrameworkShimmerImprovements() then Colors.White else nil,
		[StyleKey.ShimmerEnd] = Colors.Gray_Lighter,

		[StyleKey.ResetCameraImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Light/Large/CameraReset.png",

		Font = Enum.Font.SourceSans,
		TextSize = 18,
	},
	if FFlagDevFrameworkModernStartPageStyle
		then {
			[StyleKey.ActionSecondaryHoverTransparency] = 0.84,
			[StyleKey.ActionSecondaryHover] = Color3.fromHex("#333B4C"),

			[StyleKey.DropdownMenuStateLayerBackground] = Color3.fromHex("#FFFFFF"),
			[StyleKey.DropdownMenuStateLayerBorderColor] = Color3.fromHex("#E0E0E0"),
		}
		else nil
)
