local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.undoRevert);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptConversionProgressTracker);
return function(v4, _, v6) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), v2 (ref), v4 (copy), v1 (ref), v6 (copy)
        local v8 = v7:getState();
        local l_selection_0 = v8.ScriptConversion.selection;
        local l_revertedScripts_0 = v8.ScriptConversion.revertedScripts;
        local v11 = {};
        for _, v13 in l_selection_0 do
            if v13.scriptId and not v13.range and l_revertedScripts_0[v13.scriptId] then
                table.insert(v11, v13.scriptId);
            end;
        end;
        local v14 = v3.new("UndoRevert", #v11, v7);
        v2(v11, v4, function() --[[ Line: 23 ]]
            -- upvalues: v14 (copy)
            v14:updateProgress();
        end);
        v14:clearProgressBar();
        local v15 = {
            undoRevertResult = #v11
        };
        v7:dispatch(v1(v15));
        v6:getHandler("onScriptSelectionRevertUndo")(v15);
    end;
end;