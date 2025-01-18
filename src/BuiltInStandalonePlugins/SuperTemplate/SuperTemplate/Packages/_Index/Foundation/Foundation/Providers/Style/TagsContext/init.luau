local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Utility.Logger);
return (v2.createContext(function() --[[ Line: 7 ]]
    -- upvalues: v3 (copy)
    v3:warning("No Style Provider found");
    return "";
end));