local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local l_StudioTheme_0 = require(l_script_FirstAncestor_0.Packages.Framework).Style.Themes.StudioTheme;
local v2 = {};
return function(v3) --[[ Line: 23 ]]
    -- upvalues: l_StudioTheme_0 (copy), v2 (copy)
    local _ = nil;
    return (if v3 then l_StudioTheme_0.mock() else l_StudioTheme_0.new()):extend(v2);
end;