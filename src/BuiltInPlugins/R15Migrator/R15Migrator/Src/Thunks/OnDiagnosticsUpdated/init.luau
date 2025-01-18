local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.backupScript);
local l_deepCopy_0 = v1.Util.deepCopy;
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetDiagnostics);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetCompletedScripts);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetInitialIssueCounts);
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetRevertedScripts);
local v8 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.findAssetId);
local v10 = require(l_script_FirstAncestor_0.Src.Util.ScriptHistory.ChunkUtil);
local l_ScriptTagging_0 = require(l_script_FirstAncestor_0.Src.Util.PublishTagging).ScriptTagging;
local v12 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.DiagRef);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationIssues);
local function v20(v14, v15) --[[ Line: 21 ]] --[[ Name: findAnimationIssuesInList ]]
    -- upvalues: v9 (copy), v12 (copy)
    local v16 = {};
    if not v14 then
        return v16;
    else
        for _, v18 in v14._list do
            local v19 = v9("'" .. v18.instanceName .. "'");
            if v19 then
                if not v16[v19] then
                    v16[v19] = {};
                end;
                table.insert(v16[v19], v12.new(v19, v18.range, v15));
            end;
        end;
        return v16;
    end;
end;
local function v29(v21, v22, v23, v24) --[[ Line: 38 ]] --[[ Name: updateAnimationIssues ]]
    -- upvalues: l_deepCopy_0 (copy), v20 (copy), v13 (copy)
    local l_diagnostics_0 = v21:getState().ScriptConversion.diagnostics;
    local v26 = l_deepCopy_0(l_diagnostics_0);
    local v27 = v20(v26[v22], v24);
    local v28 = v20(v23, v24);
    v21:dispatch(v13(v27, v28));
end;
local function _(v30, v31, v32) --[[ Line: 49 ]] --[[ Name: updateDiagnosticsTable ]]
    -- upvalues: l_deepCopy_0 (copy), v4 (copy)
    local l_diagnostics_1 = v30:getState().ScriptConversion.diagnostics;
    local v34 = l_deepCopy_0(l_diagnostics_1);
    v34[v31] = v32;
    v30:dispatch(v4(v34));
end;
local function v42(v36, v37, v38, v39) --[[ Line: 58 ]] --[[ Name: updateCompletedScriptsTable ]]
    -- upvalues: l_deepCopy_0 (copy), l_ScriptTagging_0 (copy), v5 (copy)
    local v40 = v36:getState();
    local v41 = l_deepCopy_0(v40.ScriptConversion.completedScripts);
    if not v39 then
        return;
    else
        if v39:HasErrors() then
            l_ScriptTagging_0:addTag(v38);
            v41[v37] = nil;
        else
            l_ScriptTagging_0:removeTag(v38);
            v41[v37] = true;
        end;
        v36:dispatch(v5(v41));
        return;
    end;
end;
local function _(v43, v44, v45) --[[ Line: 77 ]] --[[ Name: updateRevertedScriptsTable ]]
    -- upvalues: l_deepCopy_0 (copy), v7 (copy)
    if not v45 then
        return;
    else
        local v46 = v43:getState();
        local v47 = l_deepCopy_0(v46.ScriptConversion.revertedScripts);
        v47[v44] = nil;
        v43:dispatch(v7(v47));
        return;
    end;
end;
local function v56(v49, v50, v51, v52) --[[ Line: 88 ]] --[[ Name: updateInitialIssueCounts ]]
    -- upvalues: l_deepCopy_0 (copy), v6 (copy)
    local l_initialIssueCounts_0 = v49:getState().ScriptConversion.initialIssueCounts;
    if v52 then
        local v54 = l_deepCopy_0(l_initialIssueCounts_0);
        v54[v50] = nil;
        v49:dispatch(v6(v54));
        return;
    elseif l_initialIssueCounts_0[v50] or v51 == 0 then
        return;
    else
        local v55 = l_deepCopy_0(l_initialIssueCounts_0);
        v55[v50] = v51;
        v49:dispatch(v6(v55));
        return;
    end;
end;
return function(v57, v58, v59) --[[ Line: 108 ]]
    -- upvalues: v8 (copy), v2 (copy), v56 (copy), v10 (copy), v29 (copy), l_deepCopy_0 (copy), v4 (copy), v7 (copy), v42 (copy)
    return function(v60) --[[ Line: 109 ]]
        -- upvalues: v57 (copy), v58 (copy), v8 (ref), v59 (ref), v2 (ref), v56 (ref), v10 (ref), v29 (ref), l_deepCopy_0 (ref), v4 (ref), v7 (ref), v42 (ref)
        local l_diagnostics_2 = v60:getState().ScriptConversion.diagnostics;
        local v62 = v57:addOrFindScript(v58);
        local l_v58_Attribute_0 = v58:GetAttribute(v8.AttributeChunkCountName);
        local l_v58_Attribute_1 = v58:GetAttribute(v8.AttributeInitialIssueCountName);
        local v65 = l_diagnostics_2[v62] ~= nil;
        if v59 and v59:GetSize() == 0 and not v65 and not l_v58_Attribute_0 then
            return;
        elseif l_diagnostics_2[v62] == v59 then
            return;
        else
            if not l_v58_Attribute_0 then
                v2(v58);
            end;
            if not l_v58_Attribute_1 then
                v58:SetAttribute(v8.AttributeInitialIssueCountName, v59:GetSize());
            end;
            v56(v60, v62, v58:GetAttribute(v8.AttributeInitialIssueCountName), v59 == nil);
            local l_diagnostics_3 = v60:getState().ScriptConversion.diagnostics;
            local v67 = l_diagnostics_3 and l_diagnostics_3[v62];
            if v67 and v59 then
                v59 = v67:Merge(v59);
            end;
            local v68 = v10:DidSourceChange(v58);
            v29(v60, v62, v59, v58);
            local l_v59_0 = v59;
            local l_diagnostics_4 = v60:getState().ScriptConversion.diagnostics;
            local v71 = l_deepCopy_0(l_diagnostics_4);
            v71[v62] = l_v59_0;
            v60:dispatch(v4(v71));
            if v68 then
                l_v59_0 = v60:getState();
                local v72 = l_deepCopy_0(l_v59_0.ScriptConversion.revertedScripts);
                v72[v62] = nil;
                v60:dispatch(v7(v72));
            end;
            v42(v60, v62, v58, v59);
            return;
        end;
    end;
end;