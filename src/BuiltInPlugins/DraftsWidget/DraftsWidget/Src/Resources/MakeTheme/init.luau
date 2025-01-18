local l_Parent_0 = script.Parent.Parent.Parent;
local l_Style_0 = require(l_Parent_0.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_StyleKey_0 = l_Style_0.StyleKey;
local v4 = {
    backgroundColor = l_StyleKey_0.MainBackground, 
    icons = {
        DraftState = {
            Committed = "rbxasset://textures/StudioSharedUI/statusSuccess.png", 
            Outdated = "rbxasset://textures/DraftsWidget/newSource.png", 
            Deleted = "rbxasset://textures/DraftsWidget/deletedSource.png"
        }
    }, 
    labels = {
        MainFont = Enum.Font.SourceSans, 
        MainText = l_StyleKey_0.TextPrimary
    }, 
    dialogUILibrary = {
        HeaderFont = Enum.Font.SourceSans, 
        HeaderTextColor = l_StyleKey_0.TextPrimary
    }
};
return function(v5) --[[ Line: 41 ]]
    -- upvalues: l_StudioTheme_0 (copy), v4 (copy)
    local _ = nil;
    return ((if v5 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v4));
end;