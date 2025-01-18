local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DocumentationUrls);
local l_ScriptAnalysis_0 = l_script_FirstAncestor_0.Src.Util.ScriptAnalysis;
local v3 = require(l_ScriptAnalysis_0.Constants);
local v4 = require(l_ScriptAnalysis_0.Diagnostic);
local v5 = require(l_ScriptAnalysis_0.R6Info);
local v6 = require(l_ScriptAnalysis_0.buildRange);
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10, v11, v12, v13, v14) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v7 (copy)
    return (setmetatable({
        InstanceName = v8, 
        VariableName = v9, 
        Type = v10, 
        Range = v6(v11, v12, v13), 
        Suggestions = v14
    }, v7));
end;
local function v19(v15, v16, v17, v18) --[[ Line: 24 ]] --[[ Name: buildWarningString ]]
    -- upvalues: v5 (copy), v3 (copy)
    if v17 == v5.HumanoidKey then
        return v18:getText("ScriptAnalysis", "HumanoidWarning", {
            name = v15, 
            suggestion = v16[1]
        });
    elseif v17 == v5.RigTypeKey then
        return v18:getText("ScriptAnalysis", "RigTypeWarning", {
            name = v15, 
            suggestion = v16[1]
        });
    elseif v17 == v3.ReferenceKey then
        return v18:getText("ScriptAnalysis", "VariableReferenceWarning", {
            suggestion = v16[1]
        });
    else
        return (v18:getText("ScriptAnalysis", "R6ReferenceError", {
            name = v15
        }));
    end;
end;
v7.IsWarning = function(v20) --[[ Line: 46 ]] --[[ Name: IsWarning ]]
    -- upvalues: v5 (copy), v3 (copy)
    local v21 = true;
    if v20.Type ~= v5.HumanoidKey then
        v21 = true;
        if v20.Type ~= v5.RigTypeKey then
            v21 = v20.Type == v3.ReferenceKey;
        end;
    end;
    return v21;
end;
v7.ConvertToDiagnostic = function(v22, v23) --[[ Line: 50 ]] --[[ Name: ConvertToDiagnostic ]]
    -- upvalues: v5 (copy), v4 (copy), v1 (copy), v19 (copy)
    if v22.Type == v5.AnimationKey then
        return v4.new(v22.Range, v23:getText("ScriptAnalysis", "AnimationWarningCode"), v22.InstanceName, v23:getText("ScriptAnalysis", "AnimationWarning"), Enum.Severity.Error, v22.Suggestions, {
            href = v1.R6Error
        }, v22.Type);
    else
        return v4.new(v22.Range, v23:getText("ScriptAnalysis", "R6ScriptErrorCode"), v22.InstanceName, v19(v22.InstanceName, v22.Suggestions, v22.Type, v23), Enum.Severity.Error, if v22:IsWarning() then {} else v22.Suggestions, {
            href = v1.R6Error
        }, v22.Type);
    end;
end;
return v7;