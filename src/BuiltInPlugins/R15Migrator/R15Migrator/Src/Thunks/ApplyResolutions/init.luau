local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetDiagnostics);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.ScriptReplacement);
return function(v6, v7, v8, v9) --[[ Line: 22 ]]
    -- upvalues: l_deepCopy_0 (copy), v5 (copy), v3 (copy)
    return function(v10) --[[ Line: 23 ]]
        -- upvalues: l_deepCopy_0 (ref), v6 (copy), v7 (copy), v8 (copy), v5 (ref), v9 (copy), v3 (ref)
        local l_diagnostics_0 = v10:getState().ScriptConversion.diagnostics;
        local v12 = l_deepCopy_0(l_diagnostics_0);
        local v13 = v12[v6];
        for v14 = #v13._list, 1, -1 do
            local v15 = v13._list[v14];
            local l_range_0 = v15.range;
            for _, v18 in v7 do
                if v15.diagnosticId == v18 then
                    local v19 = if v8 == v5.UNASSIGNED then v15.instanceName else v8;
                    v5.goToScript(v6, l_range_0, v9):EditTextAsync(v19, l_range_0.startLine, l_range_0.startCharacter, l_range_0.endLine, l_range_0.endCharacter);
                    local v20 = #(v15.resolution or v15.instanceName);
                    v15.range.endCharacter = v15.range.endCharacter - v20 + #v19;
                    v15.resolution = if v8 == v5.UNASSIGNED then nil else v8;
                    break;
                end;
            end;
        end;
        v10:dispatch(v3(v12));
    end;
end;