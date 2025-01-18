local l_Parent_0 = script.Parent.Parent.Parent;
local l_Style_0 = require(l_Parent_0.Packages.Framework).Style;
local l_StudioTheme_0 = l_Style_0.Themes.StudioTheme;
local l_ComponentSymbols_0 = l_Style_0.ComponentSymbols;
l_ComponentSymbols_0:add("AlertDialog");
local v4 = {
    [l_ComponentSymbols_0.AlertDialog] = {
        PopupMessageSize = Vector2.new(400, 60), 
        TextSize = 18
    }
};
return function(v5) --[[ Line: 27 ]]
    -- upvalues: l_StudioTheme_0 (copy), v4 (copy)
    local _ = nil;
    return (if v5 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v4);
end;