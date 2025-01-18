local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v4 = require(l_Util_0.SaveInterface);
local function v5() --[[ Line: 8 ]] --[[ Name: getInitialState ]]
    -- upvalues: v4 (copy)
    return {
        diagnostics = {}, 
        completedScripts = {}, 
        selection = {}, 
        expansion = {}, 
        initialIssueCounts = {}, 
        revertedScripts = {}, 
        filter = nil, 
        replaceRules = v4.getScriptConversionRules() or {
            {
                FromText = "Left Arm", 
                ToText = "LeftUpperArm", 
                Enabled = true
            }, 
            {
                FromText = "Right Arm", 
                ToText = "RightUpperArm", 
                Enabled = true
            }, 
            {
                FromText = "Left Leg", 
                ToText = "LeftUpperLeg", 
                Enabled = true
            }, 
            {
                FromText = "Right Leg", 
                ToText = "RightUpperLeg", 
                Enabled = true
            }, 
            {
                FromText = "Torso", 
                ToText = "LowerTorso", 
                Enabled = true
            }
        }, 
        replaceProgress = nil, 
        messageKey = "", 
        processResult = {}, 
        analyticsSent = false
    };
end;
return (v1.createReducer(v5(), {
    SetDiagnostics = function(v6, v7) --[[ Line: 33 ]] --[[ Name: SetDiagnostics ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            diagnostics = v7.diagnostics
        });
    end, 
    SetFilter = function(v8, v9) --[[ Line: 38 ]] --[[ Name: SetFilter ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            filter = v9.filter
        });
    end, 
    SetScriptSelection = function(v10, v11) --[[ Line: 43 ]] --[[ Name: SetScriptSelection ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v10, {
            selection = v11.selection
        });
    end, 
    SetScriptExpansion = function(v12, v13) --[[ Line: 48 ]] --[[ Name: SetScriptExpansion ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v12, {
            expansion = v13.expansion
        });
    end, 
    SetCompletedScripts = function(v14, v15) --[[ Line: 53 ]] --[[ Name: SetCompletedScripts ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v14, {
            completedScripts = v15.completedScripts
        });
    end, 
    SetInitialIssueCounts = function(v16, v17) --[[ Line: 58 ]] --[[ Name: SetInitialIssueCounts ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v16, {
            initialIssueCounts = v17.initialIssueCounts
        });
    end, 
    SetRevertedScripts = function(v18, v19) --[[ Line: 63 ]] --[[ Name: SetRevertedScripts ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v18, {
            revertedScripts = v19.revertedScripts
        });
    end, 
    SetReplaceRules = function(v20, v21) --[[ Line: 68 ]] --[[ Name: SetReplaceRules ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v20, {
            replaceRules = v21.replaceRules
        });
    end, 
    SetReplaceProgress = function(v22, v23) --[[ Line: 73 ]] --[[ Name: SetReplaceProgress ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v22, {
            replaceProgress = v23.progress
        });
    end, 
    SetProgressBarMessageKey = function(v24, v25) --[[ Line: 78 ]] --[[ Name: SetProgressBarMessageKey ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v24, {
            messageKey = v25.messageKey
        });
    end, 
    SetProcessResult = function(v26, v27) --[[ Line: 83 ]] --[[ Name: SetProcessResult ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v26, {
            processResult = v27.processResult
        });
    end, 
    ResetAllScriptConversion = function(v28) --[[ Line: 88 ]] --[[ Name: ResetAllScriptConversion ]]
        -- upvalues: v2 (copy), v5 (copy)
        return v2.Dictionary.join(v28, (v5()));
    end, 
    SetScriptAnalyticsSent = function(v29, v30) --[[ Line: 91 ]] --[[ Name: SetScriptAnalyticsSent ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v29, {
            analyticsSent = v30.analyticsSent
        });
    end
}));