local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_DraggerSchemaTemplate_0 = l_script_FirstAncestor_0.Packages.DraggerSchemaTemplate;
local v2 = require(l_DraggerSchemaTemplate_0.DraggerSchema);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.getHoveringPair);
return function(v5, v6, v7) --[[ Line: 10 ]] --[[ Name: dispatchWorldClick ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v8 = v4(v5);
    if v8 ~= nil then
        v5.selection:Set(v8);
    end;
    return v2.dispatchWorldClick(v5, v6, v7);
end;