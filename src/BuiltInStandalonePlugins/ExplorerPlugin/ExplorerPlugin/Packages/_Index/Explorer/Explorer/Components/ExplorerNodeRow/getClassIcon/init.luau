local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Components.Contexts.ClassIconContext);
local v2 = require(l_script_FirstAncestor_0.Fields.AllFields.RunContext);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local function _(v4, v5) --[[ Line: 7 ]] --[[ Name: getField ]]
    return v4.datum.fieldValues and v4.datum.fieldValues[v5];
end;
return function(v7, v8) --[[ Line: 11 ]] --[[ Name: getClassIcon ]]
    -- upvalues: v2 (copy)
    local l_key_0 = v2.key;
    if (v8.datum.fieldValues and v8.datum.fieldValues[l_key_0]) == Enum.RunContext.Client then
        return v7.getClassIcon("LocalScript");
    else
        return v7.getClassIcon(v8.datum.className);
    end;
end;