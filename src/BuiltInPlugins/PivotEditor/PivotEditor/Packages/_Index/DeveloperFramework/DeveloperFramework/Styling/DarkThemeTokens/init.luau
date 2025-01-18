local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkModernTreeTable)();
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkModernStartPageStyle)();
local v3 = require(l_Parent_0.Parent.Dash);
local v4 = {
    BackgroundDefault = "$Gray120", 
    BackgroundPaper = "$Gray100", 
    ForegroundMain = "$Gray90", 
    ForegroundMuted = "$Gray110", 
    ForegroundContrast = "$Gray80", 
    TextPrimary = "$Gray40", 
    TextSecondary = "$Gray60", 
    TextContrast = "$White", 
    TextLink = "$Blue50", 
    TextLinkHover = "$Blue30", 
    TextDisabled = "$Gray70", 
    TextError = "$Red40", 
    TextSuccess = "$Green50", 
    TextWarning = "$Yellow70", 
    ErrorMain = "$Red50", 
    SuccessMain = "$Green60", 
    WarningMain = "$Yellow65", 
    ActionHover = "$Gray70", 
    ActionEnabled = "$Gray40", 
    ActionSelected = "$Blue90", 
    ActionActivated = "$Gray110", 
    ActionFocusBorder = "$Blue70", 
    PrimaryMain = "$Blue70", 
    PrimaryHoverBackground = "$Blue50", 
    SecondaryMain = "$Gray80", 
    SecondaryMuted = "$Gray110", 
    SecondaryContrast = "$Gray60", 
    SecondaryHoverBackground = "$Gray70", 
    SecondaryHoverOutlineBorder = "$Gray70", 
    SecondaryRestingOutlineBorder = "$Gray120", 
    FilledInputBackground = "$Gray100", 
    Divider = "$Gray120", 
    ArrowDownImage = "rbxasset://studio_svg_textures/Shared/Navigation/Dark/Standard/ArrowDown.png", 
    ArrowRightImage = "rbxasset://studio_svg_textures/Shared/Navigation/Dark/Standard/ArrowRight.png", 
    CheckboxUncheckedImage = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_dark.png", 
    CheckboxCheckedImage = "rbxasset://textures/DeveloperFramework/checkbox_checked_dark.png", 
    CheckboxIndeterminateImage = "rbxasset://textures/DeveloperFramework/checkbox_indeterminate_dark.png", 
    CheckboxDisabledImage = "rbxasset://textures/DeveloperFramework/checkbox_unchecked_disabled_dark.png", 
    SearchIcon = "rbxasset://studio_svg_textures/Lua/DeveloperFramework/Dark/Standard/Search.png", 
    ErrorLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Error.png", 
    InformationLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Information.png", 
    QuestionLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Question.png", 
    SuccessLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Success.png", 
    WarningLargeImage = "rbxasset://studio_svg_textures/Shared/Alerts/Dark/Large/Warning.png", 
    ListImage = "rbxasset://studio_svg_textures/Lua/MaterialPicker/Dark/Standard/List.png", 
    GridImage = "rbxasset://studio_svg_textures/Lua/MaterialPicker/Dark/Standard/Grid.png"
};
if v1 then
    v4 = v3.join(v4, {
        TableRowEmphasisBackgroundTransparency = 0.84, 
        TableRowEmphasisBackground = Color3.fromHex("#000000"), 
        TableRowHoverBackgroundTransparency = 0.84, 
        TableRowHoverBackground = Color3.fromHex("#BBC2D1"), 
        TableHeaderBorderTransparency = 0.88, 
        TableHeaderBorder = Color3.fromHex("#ffffff")
    });
end;
if v2 then
    v4 = v3.join(v4, {
        Surface100 = Color3.fromHex("#1F2024"), 
        ContentMuted = Color3.fromHex("#BBBCBE"), 
        SelectInputHoverBorderColor = Color3.fromHex("#505257"), 
        SelectInputHoverBackground = Color3.fromHex("#38393B"), 
        ScrollBarColor = Color3.fromHex("#1F2024")
    });
end;
return v4;