local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local l_StudioTheme_0 = v1.Style.Themes.StudioTheme;
local v4 = {};
return function(v5) --[[ Line: 25 ]]
    -- upvalues: l_StudioTheme_0 (copy), v4 (copy)
    local _ = nil;
    return (if v5 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v4);
end;