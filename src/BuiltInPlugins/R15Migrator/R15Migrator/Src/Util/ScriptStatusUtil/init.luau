local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v2 = {};
local _ = function(v3) --[[ Line: 7 ]] --[[ Name: getFailedCount ]]
    local v4 = 0;
    for _, v6 in v3 do
        for _ in v6 do
            v4 = v4 + 1;
        end;
    end;
    return v4;
end;
v2.GetStatusCounts = function(_, v10) --[[ Line: 18 ]] --[[ Name: GetStatusCounts ]]
    -- upvalues: v1 (copy)
    local l_revertResult_0 = v10.revertResult;
    local l_scriptInstance_0 = v10.scriptInstance;
    local l_replaceResult_0 = v10.replaceResult;
    local l_undoRevertResult_0 = v10.undoRevertResult;
    local v15 = 0;
    local v16 = 0;
    local v17 = 0;
    local v18 = 0;
    if l_replaceResult_0 then
        v15 = l_replaceResult_0.autoConverted;
        v16 = v16 + l_replaceResult_0.succeeded;
        local l_failed_0 = l_replaceResult_0.failed;
        local v20 = 0;
        for _, v22 in l_failed_0 do
            for _ in v22 do
                v20 = v20 + 1;
            end;
        end;
        v17 = v20;
        l_failed_0 = l_replaceResult_0.failedVar;
        v20 = 0;
        for _, v25 in l_failed_0 do
            for _ in v25 do
                v20 = v20 + 1;
            end;
        end;
        v18 = v20;
    end;
    if l_scriptInstance_0 then
        v16 = 1;
    end;
    local v27 = {};
    if l_revertResult_0 then
        v27[v1.ScriptStatus.Reverted] = l_revertResult_0;
    elseif l_undoRevertResult_0 then
        v27[v1.ScriptStatus.Reverted] = l_undoRevertResult_0;
    end;
    if v15 > 0 then
        v27[v1.ScriptStatus.AutoConverted] = v15;
    end;
    if v16 > 0 then
        v27[v1.ScriptStatus.Complete] = v16;
    end;
    if v17 > 0 then
        v27[v1.ScriptStatus.Error] = v17;
    end;
    if v18 > 0 then
        v27[v1.ScriptStatus.VariableError] = v18;
    end;
    return v27;
end;
v2.GetStatusMessages = function(v28, v29, v30) --[[ Line: 64 ]] --[[ Name: GetStatusMessages ]]
    -- upvalues: v1 (copy)
    if v29.scriptInstance then
        return {
            [v1.ScriptStatus.Complete] = v30:getText("ConversionResult", "Script", {
                name = v29.scriptInstance
            })
        };
    else
        local l_v28_StatusCounts_0 = v28:GetStatusCounts(v29);
        local v32 = {};
        for v33, v34 in l_v28_StatusCounts_0 do
            if v33 ~= v1.ScriptStatus.AutoConverted then
                local v35 = {
                    count = string.format("%d", v34)
                };
                if v29.undoRevertResult then
                    v32[v33] = v30:getText("ConversionResult", "Undo" .. v33, v35);
                else
                    v32[v33] = v30:getText("ConversionResult", v33, v35);
                end;
            end;
        end;
        return v32;
    end;
end;
return v2;