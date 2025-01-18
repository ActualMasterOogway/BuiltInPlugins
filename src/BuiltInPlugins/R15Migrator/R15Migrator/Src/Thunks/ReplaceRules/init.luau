local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v2 = require(l_Util_0.SaveInterface);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetReplaceRules);
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v4 (copy)
    return function(v6) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v5 (copy), v4 (ref)
        v2.addScriptConversionRules(v5);
        v6:dispatch(v4(v5));
    end;
end;