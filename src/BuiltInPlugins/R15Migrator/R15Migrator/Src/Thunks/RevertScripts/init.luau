local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.OnScriptsReverted);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.revertScripts);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptIssueSorting);
local v6 = require(l_script_FirstAncestor_0.Src.Util.ScriptConversionProgressTracker);
return function(v7, _, v9) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v4 (copy), v2 (copy), v3 (copy)
    return function(v10) --[[ Line: 12 ]]
        -- upvalues: v1 (ref), v5 (ref), v6 (ref), v4 (ref), v7 (copy), v2 (ref), v3 (ref), v9 (copy)
        local v11 = v10:getState();
        local l_selection_0 = v11.ScriptConversion.selection;
        local l_diagnostics_0 = v11.ScriptConversion.diagnostics;
        local v14 = v1.Dictionary.keys(v5:sortSelectionForConversion(l_selection_0, l_diagnostics_0));
        local v15 = v6.new("Revert", #v14, v10);
        local v16 = v4(v14, v7, function() --[[ Line: 21 ]]
            -- upvalues: v15 (copy)
            v15:updateProgress();
        end);
        v15:clearProgressBar();
        v10:dispatch(v2(v16));
        local v17 = {
            revertResult = #v1.Dictionary.keys(v16)
        };
        v10:dispatch(v3(v17));
        v9:getHandler("onScriptSelectionReverted")(v17);
    end;
end;