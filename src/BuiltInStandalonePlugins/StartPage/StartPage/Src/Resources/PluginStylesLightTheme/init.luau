local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_createStyleSheet_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleSheet;
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageStudioTestTemplates)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local l_StudioService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioService;
local l_StudioUserService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).StudioUserService;
local v5 = {
    Background = Color3.fromHex("#F2F2F3"), 
    PageBackground = Color3.fromHex("#F2F2F3"), 
    MenuBackground = Color3.fromHex("#F2F2F3"), 
    PillBackground = Color3.fromHex("#696A6D"), 
    TileBackground = Color3.fromHex("#FFFFFF"), 
    ContextMenuBackground = Color3.fromHex("#F3F3F4"), 
    HoverBorder = Color3.fromHex("#25262C"), 
    Selected = Color3.fromHex("#D3D4D8"), 
    TextColor = Color3.fromHex("#111216"), 
    ContrastTextColor = Color3.fromHex("#000000"), 
    Contrast = Color3.fromHex("#FFFFFF"), 
    Standard = Color3.fromHex("#FFFFFF"), 
    StandardDark = Color3.fromHex("#000000"), 
    Border = Color3.fromHex("#000000"), 
    SemanticColorContentAction = Color3.fromHex("#5582FC"), 
    SemanticColorContentMuted = Color3.fromHex("#696A6D"), 
    Disabled = Color3.fromHex("#989898"), 
    ShimmerBackground = Color3.fromHex("#000000"), 
    ShimmerBackgroundTransparency = 0.95, 
    ShimmerForeground = Color3.fromHex("#2B2B2B"), 
    ShimmerGradientTransparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), 
        NumberSequenceKeypoint.new(0.05, 1), 
        NumberSequenceKeypoint.new(0.5, 0.7), 
        NumberSequenceKeypoint.new(0.95, 1), 
        NumberSequenceKeypoint.new(1, 1)
    }), 
    NoExperiences = "rbxasset://studio_svg_textures/Lua/StartPage/Light/SI-Standard/NoExperiences.png", 
    RightChevron = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/RightChevron.png", 
    Home = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Home.png", 
    Experiences = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Experiences.png", 
    Grid = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Grid.png", 
    List = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/List.png", 
    Plus = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Standard/Plus.png", 
    Archive = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Archive.png", 
    Templates = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Template.png", 
    Cancel = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Standard/CancelStandard.png", 
    CancelWhite = "rbxasset://studio_svg_textures/Lua/StartPage/Dark/Standard/CancelStandard.png", 
    Recents = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Recents.png", 
    Kebab = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Large/Kebab.png", 
    Search = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Search.png", 
    Alert = "rbxasset://studio_svg_textures/Lua/StartPage/Light/Medium/Alert.png"
};
if v2 and l_StudioUserService_0.IsLoggedIn and l_StudioService_0:HasInternalPermission() then
    v5.CodeSnippet = "rbxasset://studio_svg_textures/Shared/Ribbon/Light/Medium/RibbonCodeSnippet.png";
end;
return l_createStyleSheet_0("StartPageLightTheme", {}, v5);