local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioTheme_0 = require(l_Parent_0.Packages.Framework).Style.Themes.StudioTheme;
local v2 = {};
return function(v3) --[[ Line: 24 ]]
    -- upvalues: l_StudioTheme_0 (copy), v2 (copy)
    local _ = nil;
    return (if v3 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v2);
end;