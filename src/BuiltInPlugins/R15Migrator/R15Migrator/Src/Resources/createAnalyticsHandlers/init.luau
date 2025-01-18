local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsGlobals);
local v3 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptStatusUtil);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_AnimationStatus_0 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants).AnimationStatus;
local v7 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local l_HttpService_0 = game:GetService("HttpService");
return function(v9) --[[ Line: 19 ]]
    -- upvalues: v1 (copy), v3 (copy), l_HttpService_0 (copy), v7 (copy), l_AnimationStatus_0 (copy), v4 (copy), v5 (copy), v2 (copy)
    local function v13(v10, v11) --[[ Line: 20 ]] --[[ Name: _sendEvent ]]
        -- upvalues: v1 (ref), v9 (copy), v3 (ref), l_HttpService_0 (ref)
        local v12 = v11 or {};
        v12 = v1.Dictionary.join({
            studioSid = v9:GetSessionId(), 
            clientId = v9:GetClientId(), 
            placeId = game.PlaceId
        }, v12);
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("R15Migrator", tostring(v10), l_HttpService_0:JSONEncode(v12)));
        end;
        v9:SendEventDeferred("studio", "R15Migrator", v10, v12);
    end;
    return {
        onCharactersLoaded = function(v14, v15) --[[ Line: 43 ]] --[[ Name: onCharactersLoaded ]]
            -- upvalues: v13 (copy), v7 (ref)
            local _ = function(v16) --[[ Line: 44 ]] --[[ Name: countChars ]]
                local v17 = 0;
                local v18 = {};
                for v19, _ in v16 do
                    v17 = v17 + 1;
                    table.insert(v18, v19);
                end;
                return v17, v18;
            end;
            local v22 = 0;
            local v23 = {};
            for v24, _ in v14 do
                v22 = v22 + 1;
                table.insert(v23, v24);
            end;
            local l_v22_0 = v22;
            local l_v23_0 = v23;
            local v28 = 0;
            local v29 = {};
            for v30, _ in v15 do
                v28 = v28 + 1;
                table.insert(v29, v30);
            end;
            v22 = v28;
            v13("CharactersLoaded", {
                numUnconverted = l_v22_0, 
                unconvertedIds = l_v23_0, 
                numConverted = v22, 
                convertedIds = v29, 
                percentConverted = l_v22_0 == 0 and 0 or math.clamp(v22 / (v22 + l_v22_0) * 100, 0, 100), 
                numWarnings = v7.GetNumCharactersHaveWarnings(v14), 
                numCustom = v7.GetNumCharactersHaveCustomMesh(v14)
            });
        end, 
        onCharactersConverted = function(v32, v33) --[[ Line: 68 ]] --[[ Name: onCharactersConverted ]]
            -- upvalues: v1 (ref), v13 (copy), v7 (ref)
            local v34 = #v1.Dictionary.keys(v32);
            local v35 = 0;
            local v36 = {};
            local v37 = {};
            for _, v39 in v33 do
                if v32[v39] then
                    v35 = v35 + 1;
                    table.insert(v36, v32[v39]);
                    table.insert(v37, v39);
                end;
            end;
            v13("CharactersConverted", {
                numConverted = v35, 
                convertedIds = v37, 
                percentConverted = v34 == 0 and 0 or math.clamp(v35 / v34 * 100, 0, 100), 
                numWarnings = v7.GetNumCharactersHaveWarnings(v36), 
                numCustom = v7.GetNumCharactersHaveCustomMesh(v36)
            });
        end, 
        onCharactersReverted = function(v40, v41) --[[ Line: 91 ]] --[[ Name: onCharactersReverted ]]
            -- upvalues: v1 (ref), v13 (copy), v7 (ref)
            local v42 = #v1.Dictionary.keys(v40);
            local v43 = 0;
            local v44 = {};
            local v45 = {};
            for _, v47 in v41 do
                if v40[v47] then
                    v43 = v43 + 1;
                    table.insert(v44, v40[v47]);
                    table.insert(v45, v47);
                end;
            end;
            v13("CharactersReverted", {
                numReverted = v43, 
                revertedIds = v45, 
                percentReverted = v42 == 0 and 0 or math.clamp(v43 / v42 * 100, 0, 100), 
                numWarnings = v7.GetNumCharactersHaveWarnings(v44), 
                numCustom = v7.GetNumCharactersHaveCustomMesh(v44)
            });
        end, 
        onAnimationsConverted = function(v48, v49) --[[ Line: 114 ]] --[[ Name: onAnimationsConverted ]]
            -- upvalues: v1 (ref), v13 (copy)
            local v50 = #v1.Dictionary.keys(v48);
            local v51 = 0;
            for v52, _ in v49 do
                if v48[v52] then
                    v51 = v51 + 1;
                end;
            end;
            local v54 = {
                numConverted = v51, 
                percentConverted = v50 == 0 and 0 or math.clamp(v51 / v50 * 100, 0, 100)
            };
            v13("AnimationsConverted", v54);
        end, 
        onInitialAnimationsAnalysisScan = function(v55, v56) --[[ Line: 132 ]] --[[ Name: onInitialAnimationsAnalysisScan ]]
            -- upvalues: l_AnimationStatus_0 (ref), v13 (copy)
            local v57 = {
                numAnimations = 0, 
                numConverted = 0, 
                percentConverted = 0
            };
            for v58, _ in v55 do
                v57.numAnimations = v57.numAnimations + 1;
                if (v56[v58] or {}).status == l_AnimationStatus_0.Done then
                    v57.numConverted = v57.numConverted + 1;
                end;
            end;
            v57.percentConverted = v57.numAnimations == 0 and 0 or math.clamp(v57.numConverted / v57.numAnimations * 100, 0, 100);
            v13("InitialAnimationAnalysisScan", v57);
        end, 
        onScriptRulesUpdate = function(v60, v61, v62) --[[ Line: 151 ]] --[[ Name: onScriptRulesUpdate ]]
            -- upvalues: v13 (copy)
            local v63 = {
                fromPart = v60 or "", 
                toPart = v61 or "", 
                isEnabled = v62
            };
            v13("onScriptRulesUpdate", v63);
        end, 
        onInitialScriptAnalysisScan = function(v64, v65, v66) --[[ Line: 160 ]] --[[ Name: onInitialScriptAnalysisScan ]]
            -- upvalues: v13 (copy)
            local v67 = {
                numScripts = 0, 
                averageLines = 0, 
                numCompleted = 0, 
                totalScripts = v65
            };
            local v68 = 0;
            for _, v70 in v64 do
                v67.numScripts = v67.numScripts + 1;
                v68 = v68 + v70:GetSize();
            end;
            if v67.numScripts ~= 0 then
                v67.averageLines = v67.numScripts == 0 and 0 or v68 / v67.numScripts;
                for _, _ in v66 do
                    v67.numCompleted = v67.numCompleted + 1;
                end;
                v13("InitialScriptAnalysisScan", v67);
            end;
        end, 
        onScriptSuggestionApplied = function() --[[ Line: 187 ]] --[[ Name: onScriptSuggestionApplied ]]
            -- upvalues: v13 (copy)
            v13("ScriptSuggestionApplied", {});
        end, 
        onScriptSelectionReverted = function(v73) --[[ Line: 191 ]] --[[ Name: onScriptSelectionReverted ]]
            -- upvalues: v4 (ref), v13 (copy), v5 (ref)
            local l_v4_StatusCounts_0 = v4:GetStatusCounts(v73);
            v13("ScriptSelectionReverted", {
                numScripts = l_v4_StatusCounts_0[v5.ScriptStatus.Reverted]
            });
        end, 
        onScriptAutoReplacement = function(v75) --[[ Line: 198 ]] --[[ Name: onScriptAutoReplacement ]]
            -- upvalues: v13 (copy)
            v13("onScriptAutoReplacement", {
                issueType = v75
            });
        end, 
        onScriptSelectionRevertUndo = function(v76) --[[ Line: 204 ]] --[[ Name: onScriptSelectionRevertUndo ]]
            -- upvalues: v4 (ref), v13 (copy), v5 (ref)
            local l_v4_StatusCounts_1 = v4:GetStatusCounts(v76);
            v13("ScriptSelectionUndoRevert", {
                numScripts = l_v4_StatusCounts_1[v5.ScriptStatus.Reverted]
            });
        end, 
        onAdapterToggle = function(v78, v79, v80, v81) --[[ Line: 211 ]] --[[ Name: onAdapterToggle ]]
            -- upvalues: v13 (copy)
            if v79 == nil then
                v79 = 0;
            end;
            if v80 == nil then
                v80 = 0;
            end;
            if v81 == nil then
                v81 = 0;
            end;
            local v82 = {
                adapterAdded = v78, 
                numScriptIssuesLeft = v79, 
                numAnimationsNotConverted = v80, 
                numCharactersNotConverted = v81
            };
            v13("AdapterToggled", v82);
        end, 
        onScriptConvertSelection = function(v83, v84) --[[ Line: 235 ]] --[[ Name: onScriptConvertSelection ]]
            -- upvalues: v4 (ref), v5 (ref), v13 (copy)
            local l_v4_StatusCounts_2 = v4:GetStatusCounts(v83);
            local v86 = if l_v4_StatusCounts_2[v5.ScriptStatus.AutoConverted] then l_v4_StatusCounts_2[v5.ScriptStatus.AutoConverted] else 0;
            local v87 = if l_v4_StatusCounts_2[v5.ScriptStatus.Complete] then l_v4_StatusCounts_2[v5.ScriptStatus.Complete] else 0;
            local v88 = if l_v4_StatusCounts_2[v5.ScriptStatus.Error] then l_v4_StatusCounts_2[v5.ScriptStatus.Error] else 0;
            local v89 = {
                autoConvertCount = v86, 
                replacedCount = math.min(0, v87 - v86), 
                failedCount = v88, 
                numRules = 0
            };
            for _, v91 in v84 do
                if v91.Enabled and v91.ToText ~= "" then
                    v89.numRules = v89.numRules + 1;
                end;
            end;
            v13("ScriptSelectionConvert", v89);
        end, 
        onPluginClosed = function() --[[ Line: 260 ]] --[[ Name: onPluginClosed ]]
            -- upvalues: v13 (copy), v2 (ref)
            v13("PluginClosed", {
                timeSpent = os.time() - v2.StartTime
            });
        end, 
        onPublish = function(v92) --[[ Line: 266 ]] --[[ Name: onPublish ]]
            -- upvalues: v13 (copy)
            v13("Publish", {
                checks = v92
            });
        end
    };
end;