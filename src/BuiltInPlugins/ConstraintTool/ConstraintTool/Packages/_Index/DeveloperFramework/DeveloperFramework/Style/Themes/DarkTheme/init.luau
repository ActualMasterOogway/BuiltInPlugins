local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkShimmerImprovements);
local v3 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkModernStartPageStyle)();
local v4 = require(l_Parent_0.Style.Colors);
local v5 = require(l_Parent_0.Style.StyleKey);
return l_join_0(require(l_Parent_0.Style.ColorSystem.getStudioColorClassTheme)("Dark"), {
    [v5.Border] = v4.Carbon, 
    [v5.BrightText] = v4.White, 
    [v5.Button] = v4.Gray, 
    [v5.ButtonText] = v4.Gray_Light, 
    [v5.ButtonHover] = v4.lighter(v4.Gray, 0.26), 
    [v5.ButtonDisabled] = v4.lighter(v4.Black, 0.26), 
    [v5.ButtonTextDisabled] = Color3.fromRGB(102, 102, 102), 
    [v5.ButtonPressed] = v4.lighter(v4.Black, 0.16), 
    [v5.ButtonSelected] = v4.Blue, 
    [v5.ImageButtonBackground] = v4.Gray_Mid, 
    [v5.ImageButtonHover] = v4.lighter(v4.Gray_Mid, 0.26), 
    [v5.Icon] = Color3.fromRGB(128, 128, 128), 
    [v5.IconBackgroundColor] = Color3.fromRGB(37, 37, 37), 
    [v5.IconImageColor] = Color3.fromRGB(102, 102, 102), 
    [v5.ToolbarBackgroundColor] = Color3.fromRGB(0, 0, 0), 
    [v5.ToolbarButtonBackgroundColor] = Color3.fromRGB(39, 39, 39), 
    [v5.CategoryItem] = Color3.fromRGB(53, 53, 53), 
    [v5.CurrentMarker] = v4.Gray, 
    [v5.CurrentMarkerSelected] = Color3.fromRGB(10, 90, 175), 
    [v5.DialogButton] = v4.Gray, 
    [v5.DialogButtonBorder] = v4.Gray, 
    [v5.DialogButtonHover] = v4.Gray, 
    [v5.DialogButtonPressed] = Color3.fromRGB(53, 53, 53), 
    [v5.DialogButtonText] = v4.Gray_Light, 
    [v5.DialogMainButton] = v4.Blue, 
    [v5.DialogMainButtonDisabled] = v4.Gray, 
    [v5.DialogMainButtonHover] = v4.Blue_Light, 
    [v5.DialogMainButtonPressed] = v4.Blue_Dark, 
    [v5.DialogMainButtonSelected] = v4.Blue_Dark, 
    [v5.DialogMainButtonText] = v4.White, 
    [v5.DialogMainButtonTextDisabled] = Color3.fromRGB(102, 102, 102), 
    [v5.DimmedText] = v4.lighter(v4.Black, 0.6), 
    [v5.Dropdown] = v4.Slate, 
    [v5.InputFieldBackground] = Color3.fromRGB(37, 37, 37), 
    [v5.InputFieldBackgroundDisabled] = Color3.fromRGB(37, 37, 37), 
    [v5.InputFieldBorder] = Color3.fromRGB(26, 26, 26), 
    [v5.InputFieldBorderDisabled] = Color3.fromRGB(41, 41, 41), 
    [v5.InputFieldBorderHover] = Color3.fromRGB(58, 58, 58), 
    [v5.InputFieldBorderSelected] = v4.Blue_Light, 
    [v5.Item] = v4.Slate, 
    [v5.ItemHovered] = v4.Gray, 
    [v5.ItemSelected] = v4.Blue_Dark, 
    [v5.Light] = Color3.fromRGB(243, 243, 243), 
    [v5.MainBackground] = v4.Slate, 
    [v5.MainButton] = v4.Blue, 
    [v5.MainTextDisabled] = Color3.fromRGB(85, 85, 85), 
    [v5.MainTextHover] = Color3.fromRGB(66, 66, 66), 
    [v5.MainTextSelected] = v4.White, 
    [v5.MenuBarBackground] = Color3.fromRGB(41, 41, 41), 
    [v5.MenuEntryHighlight] = Color3.fromRGB(11, 90, 175), 
    [v5.MenuEntryHover] = v4.Gray, 
    [v5.Mid] = Color3.fromRGB(34, 34, 34), 
    [v5.SubBackground] = v4.Gray, 
    [v5.SubBackground2] = v4.Carbon, 
    [v5.RadioButtonDisabledImage] = "rbxasset://textures/StudioSharedUI/radio_selected_disabled_dot_dark.png", 
    [v5.RibbonTab] = Color3.fromRGB(37, 37, 37), 
    [v5.ScrollBarBackground] = Color3.fromRGB(41, 41, 41), 
    [v5.ScrollBar] = Color3.fromRGB(56, 56, 56), 
    [v5.SliderKnobColor] = Color3.fromRGB(85, 85, 85), 
    [v5.SliderKnobImage] = "rbxasset://textures/DeveloperFramework/slider_knob.png", 
    [v5.SliderBackground] = Color3.fromRGB(37, 37, 37), 
    [v5.SubText] = Color3.fromRGB(170, 170, 170), 
    [v5.Tab] = Color3.fromRGB(53, 53, 53), 
    [v5.TabHovered] = Color3.fromRGB(37, 37, 37), 
    [v5.TabSelected] = Color3.fromRGB(42, 42, 42), 
    [v5.TableItem] = v4.Slate, 
    [v5.TableItemSelected] = Color3.fromRGB(11, 90, 175), 
    [v5.Titlebar] = Color3.fromRGB(53, 53, 53), 
    [v5.TitlebarText] = Color3.fromRGB(204, 204, 204), 
    [v5.ToggleOnImage] = "rbxasset://textures/RoactStudioWidgets/toggle_on_dark.png", 
    [v5.ToggleOffImage] = "rbxasset://textures/RoactStudioWidgets/toggle_off_dark.png", 
    [v5.ToggleDisabledImage] = "rbxasset://textures/RoactStudioWidgets/toggle_disable_dark.png", 
    [v5.ToggleDisabledAndSelectedImage] = "rbxasset://textures/RoactStudioWidgets/toggle_on_disable_dark.png", 
    [v5.CheckboxUncheckedImage] = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_dark.png", 
    [v5.CheckboxCheckedImage] = "rbxasset://textures/DeveloperFramework/checkbox_checked_dark.png", 
    [v5.CheckboxIndeterminateImage] = "rbxasset://textures/DeveloperFramework/checkbox_indeterminate_dark.png", 
    [v5.CheckboxDisabledImage] = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_disabled_dark.png", 
    [v5.EyeIconOnImage] = "rbxasset://textures/DeveloperFramework/UIOn_dark.png", 
    [v5.EyeIconOffImage] = "rbxasset://textures/DeveloperFramework/UIOff_dark.png", 
    [v5.CheckedFieldBackgroundHover] = Color3.fromRGB(15, 15, 15), 
    [v5.ShimmerStart] = if v2() then v4.Gray else v4.Gray_Light, 
    [v5.ShimmerMiddle] = if v2() then v4.Gray_Lighter else nil, 
    [v5.ShimmerEnd] = if v2() then v4.Gray else v4.Gray_Lighter, 
    [v5.ResetCameraImage] = "rbxasset://studio_svg_textures/Lua/ImportPreview/Dark/Large/CameraReset.png", 
    Font = Enum.Font.SourceSans, 
    TextSize = 18
}, if v3 then {
    [v5.ActionSecondaryHoverTransparency] = 0.84, 
    [v5.ActionSecondaryHover] = Color3.fromHex("#BBC2D1"), 
    [v5.DropdownMenuStateLayerBackground] = Color3.fromHex("#38393B"), 
    [v5.DropdownMenuStateLayerBorderColor] = Color3.fromHex("#505257")
} else nil);