local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_createStyleSheet_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet;
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageStudioTestTemplates)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local l_StudioService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioService;
local l_StudioUserService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioUserService;
local v5 = {
    Background = Color3.fromHex("#1F2024"), 
    PageBackground = Color3.fromHex("#1F2024"), 
    MenuBackground = Color3.fromHex("#1F2024"), 
    PillBackground = Color3.fromHex("#111216"), 
    TileBackground = Color3.fromHex("#2B2D33"), 
    ContextMenuBackground = Color3.fromHex("#25262C"), 
    HoverBorder = Color3.fromHex("#FFFFFF"), 
    Selected = Color3.fromHex("#000000"), 
    TextColor = Color3.fromHex("#E1E1E1"), 
    ContrastTextColor = Color3.fromHex("#000000"), 
    Contrast = Color3.fromHex("#111216"), 
    Standard = Color3.fromHex("#FFFFFF"), 
    StandardDark = Color3.fromHex("#111216"), 
    Border = Color3.fromHex("#FFFFFF"), 
    SemanticColorContentAction = Color3.fromHex("#5582FC"), 
    SemanticColorContentMuted = Color3.fromHex("#BBBCBE"), 
    Disabled = Color3.fromHex("#BBBCBE"), 
    ShimmerBackground = Color3.fromHex("#2B2D33"), 
    ShimmerBackgroundTransparency = 0.8, 
    ShimmerForeground = Color3.fromHex("#EEEEEE"), 
    ShimmerGradientTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.05, 1), 
        NumberSequenceKeypoint.new(0.5, 0.85), 
        NumberSequenceKeypoint.new(0.95, 1), 
        NumberSequenceKeypoint.new(1, 1)
    }), 
    NoExperiences = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/SI-Standard/NoExperiences.png", 
    RightChevron = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/RightChevron.png", 
    Home = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Home.png", 
    Experiences = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Experiences.png", 
    Archive = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Archive.png", 
    Templates = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Template.png", 
    Recents = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Recents.png", 
    Grid = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Grid.png", 
    List = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/List.png", 
    Plus = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Standard/Plus.png", 
    Cancel = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Standard/CancelStandard.png", 
    CancelWhite = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Standard/CancelStandard.png", 
    Kebab = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Large/Kebab.png", 
    Search = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Medium/Search.png", 
    Alert = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Alert.png"
};
if v2 and l_StudioUserService_0.IsLoggedIn and l_StudioService_0:HasInternalPermission() then
    v5.CodeSnippet = "rbxasset://studio_svg_textures/Shared/Ribbon/Dark/Medium/RibbonCodeSnippet.png";
end;
return l_createStyleSheet_0("StartPageDarkTheme", {}, v5);