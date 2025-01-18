local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEventConnection_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).useEventConnection;
local l_StudioServices_0 = v2.Context.StudioServices;
return function() --[[ Line: 13 ]] --[[ Name: useSelectedParts ]]
    -- upvalues: l_StudioServices_0 (copy), v1 (copy), v3 (copy), l_useEventConnection_0 (copy)
    local v6 = l_StudioServices_0.use():getService("Selection");
    local function v9() --[[ Line: 17 ]] --[[ Name: getSelectedParts ]]
        -- upvalues: v6 (copy), v1 (ref)
        local v7 = v6:Get();
        return v1.filter(v7, function(v8) --[[ Line: 19 ]]
            return v8:IsA("BasePart");
        end);
    end;
    local v10, v11 = v3.useState(v9);
    l_useEventConnection_0(v6.SelectionChanged, function() --[[ Line: 26 ]]
        -- upvalues: v11 (copy), v9 (copy)
        v11(v9);
    end, {});
    return v10;
end;