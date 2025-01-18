local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.getGeneratedRules);
local _ = require(l_script_FirstAncestor_0.Enums.Theme);
local _ = require(l_script_FirstAncestor_0.Enums.Device);
return function(v6, v7, v8) --[[ Line: 11 ]] --[[ Name: useGeneratedRules ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v3 (ref), v6 (copy), v7 (copy), v8 (copy)
        return v3(v6, v7, v8);
    end, {
        v6, 
        v7, 
        v8
    });
end;