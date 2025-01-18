local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v3 = require(l_Util_0.ScriptReplacement);
return function(v4, v5, v6, v7, _, _, v10, v11) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy)
    return function(v12) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), v3 (ref), v5 (copy), v6 (copy), v7 (copy), v11 (copy), v10 (copy), v1 (ref)
        local v13 = v12:getState().ScriptConversion.diagnostics[v4];
        v3.replaceWithSuggestion(v4, v5, v6, v7, v13, v11);
        local v14 = v6:getScriptInstanceFromGUID(v4);
        if v10 then
            v12:dispatch(v1({
                scriptInstance = v14:GetFullName()
            }));
        end;
    end;
end;