local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_ScriptAnalysis_0 = l_script_FirstAncestor_0.Src.Util.ScriptAnalysis;
local v5 = require(l_ScriptAnalysis_0.StringUtil);
local v6 = require(l_ScriptAnalysis_0.findAssetId);
local v7 = require(l_ScriptAnalysis_0.buildRange);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v9 = require(l_Util_0.findAllInServices);
local v10 = require(l_Util_0.SaveInterface);
local v11 = require(l_Util_0.AnimationConversion.AnimationConversionManager);
local v12 = require(l_Util_0.ScriptHistory.ChunkUtil);
local l_AnimationTagging_0 = require(l_Util_0.PublishTagging).AnimationTagging;
local l_AnimationConversion_0 = l_Util_0.AnimationConversion;
local v15 = require(l_AnimationConversion_0.DiagRef);
local v16 = require(l_AnimationConversion_0.AnimationState);
local v17 = require(l_AnimationConversion_0.constants);
local l_AssetType_0 = v17.AssetType;
local l_AnimationStatus_0 = v17.AnimationStatus;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v21 = require(l_Actions_0.SetStatus);
local v22 = require(l_Actions_0.SetAnimations);
local l_OriginalId_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).Attributes.OriginalId;
local function v25(v24) --[[ Line: 32 ]] --[[ Name: isScript ]]
    return v24:IsA("Script");
end;
local function v64(v26) --[[ Line: 36 ]] --[[ Name: findAllAnimationsInScripts ]]
    -- upvalues: v21 (copy), v17 (copy), v9 (copy), v25 (copy), l_ScriptEditorService_0 (copy), v11 (copy), v15 (copy), v7 (copy), v5 (copy), v6 (copy), v12 (copy)
    v26:dispatch(v21(v17.Status.ScanningScripts));
    local v27 = v9(v25);
    local v28 = {};
    local v29 = {};
    for _, v31 in v27 do
        local l_l_ScriptEditorService_0_EditorSource_0 = l_ScriptEditorService_0:GetEditorSource(v31);
        local _ = function(v33, v34, v35, _, v37) --[[ Line: 46 ]] --[[ Name: getDiagRef ]]
            -- upvalues: v11 (ref), v15 (ref), v7 (ref), v31 (copy)
            if not v11.isR6Animation(v35) then
                return;
            else
                return v15.new(v35, v7(v37, v33, v34), v31);
            end;
        end;
        v5.ForEachLine(l_l_ScriptEditorService_0_EditorSource_0, function(v39, v40) --[[ Line: 53 ]]
            -- upvalues: v6 (ref), v11 (ref), v15 (ref), v7 (ref), v31 (copy), v28 (copy)
            v6(v39, v40, function(...) --[[ Line: 54 ]]
                -- upvalues: v11 (ref), v15 (ref), v7 (ref), v31 (ref), v28 (ref)
                local v41, v42, v43, _, v45 = ...;
                local v46 = if not v11.isR6Animation(v43) then nil else v15.new(v43, v7(v45, v41, v42), v31);
                if not v46 then
                    return;
                else
                    v41 = v46:id();
                    if not v28[v41] then
                        v28[v41] = {};
                    end;
                    table.insert(v28[v41], v46);
                    return;
                end;
            end);
        end);
        local l_v12_ScriptBackupChunks_0 = v12:GetScriptBackupChunks(v31);
        if l_v12_ScriptBackupChunks_0 and v12:DidSourceChange(v31, l_v12_ScriptBackupChunks_0) then
            local v48 = 0;
            do
                local l_v48_0 = v48;
                for _, v51 in l_v12_ScriptBackupChunks_0 do
                    v5.ForEachLine(v51, function(v52, v53) --[[ Line: 78 ]]
                        -- upvalues: v6 (ref), l_v48_0 (ref), v11 (ref), v15 (ref), v7 (ref), v31 (copy), v28 (copy), v29 (copy)
                        v6(v52, v53 + l_v48_0, function(...) --[[ Line: 79 ]]
                            -- upvalues: v11 (ref), v15 (ref), v7 (ref), v31 (ref), v28 (ref), v29 (ref)
                            local v54, v55, v56, _, v58 = ...;
                            local v59 = if not v11.isR6Animation(v56) then nil else v15.new(v56, v7(v58, v54, v55), v31);
                            if not v59 then
                                return;
                            else
                                v54 = v59:id();
                                if v28[v54] then
                                    for _, v61 in v28[v54] do
                                        if v61 == v59 then
                                            return;
                                        end;
                                    end;
                                end;
                                if not v29[v54] then
                                    v29[v54] = {};
                                end;
                                table.insert(v29[v54], v59);
                                return;
                            end;
                        end);
                    end);
                    local _, v63 = v51:gsub("\n", "\n");
                    l_v48_0 = l_v48_0 + v63;
                end;
            end;
        end;
    end;
    return v28, v29;
end;
local function v73(v65) --[[ Line: 107 ]] --[[ Name: findAllWorkspaceAnims ]]
    -- upvalues: v21 (copy), v17 (copy), v9 (copy), v10 (copy), v11 (copy), l_AnimationTagging_0 (copy), l_OriginalId_0 (copy)
    v65:dispatch(v21(v17.Status.ScanningWorkspace));
    local v67 = v9(function(v66) --[[ Line: 110 ]]
        return v66:IsA("Animation") or v66:IsA("KeyframeSequence");
    end);
    local v68 = {};
    local v69 = {};
    local v70 = {};
    for _, v72 in v67 do
        if v10.isConvertibleKeyframeSequence(v72) and not v11.isR6KeyframeSequence(v72) then
            table.insert(v69, v72);
        elseif v11.isR6Animation(v72) then
            table.insert(v68, v72);
            l_AnimationTagging_0:addTag(v72);
        elseif v72:GetAttribute(l_OriginalId_0) then
            if v72:IsA("Animation") then
                table.insert(v70, v72);
            else
                warn("OriginalId Attribute should only be found on Animation Instances. Were Attributes manually edited?");
            end;
        end;
    end;
    return v68, v69, v70;
end;
local function v83(v74) --[[ Line: 147 ]] --[[ Name: parseAnimationInstances ]]
    -- upvalues: v11 (copy), l_AssetType_0 (copy), l_MarketplaceService_0 (copy), l_OriginalId_0 (copy), v16 (copy)
    local v75 = {};
    local v76 = 1;
    for _, v78 in v74 do
        local v79 = v11.getAnimationAssetInfo(v78);
        local l_Name_0 = v78.Name;
        if v79:IsA(l_AssetType_0.RobloxAsset) and not v75[v79.id] then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 154 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v79 (copy)
                return l_MarketplaceService_0:GetProductInfo(v79.id);
            end);
            if l_status_0 then
                l_Name_0 = l_result_0.Name;
            end;
        end;
        if v79:IsA(l_AssetType_0.RobloxAsset) and not v78:GetAttribute(l_OriginalId_0) then
            v78:SetAttribute(l_OriginalId_0, v79.id);
        end;
        if not v75[v79.id] then
            v75[v79.id] = v16.new(v79, l_Name_0, v76, nil, nil);
            v76 = v76 + 1;
        end;
        v75[v79.id].refs[v78] = v79;
    end;
    return v75;
end;
local function v94(v84, v85, v86) --[[ Line: 175 ]] --[[ Name: getAssetIds ]]
    -- upvalues: l_AssetType_0 (copy)
    local v87 = {};
    for v88, _ in v84 do
        v87[v88] = true;
    end;
    for v90, _ in v85 do
        v87[v90] = true;
    end;
    for v92, v93 in v86 do
        if v93.animationAssetInfo:IsA(l_AssetType_0.RobloxAsset) then
            v87[v92] = true;
        end;
    end;
    return v87;
end;
local function v104(v95, v96, v97, v98) --[[ Line: 191 ]] --[[ Name: checkIfAnimationsExistElseConvert ]]
    -- upvalues: v21 (copy), v17 (copy), l_AssetType_0 (copy), v11 (copy)
    v95:dispatch(v21(v17.Status.ConvertingAnimations));
    for _, v100 in v98 do
        if not v100.animationAssetInfo:IsA(l_AssetType_0.RobloxAsset) and v100.animationAssetInfo:IsA(l_AssetType_0.LocalAsset) then
            for v101 in v100.refs do
                v11.convertAnimation(v101);
                break;
            end;
        end;
    end;
    for v102, v103 in (v11.checkIfAssetsAlreadyConverted(v96, v97)) do
        if v98[v102] then
            v98[v102].converted = v103;
        end;
    end;
end;
local function v113(v105, v106) --[[ Line: 211 ]] --[[ Name: addPreviouslyConvertedKeyframeSequences ]]
    -- upvalues: v10 (copy), v1 (copy), v11 (copy), v16 (copy), l_AnimationStatus_0 (copy)
    local v107 = v10.getOriginalR6KeyframeSequences(v106);
    local v108 = 1 + #v1.Dictionary.keys(v105);
    for v109, v110 in v107 do
        v11.registerConvertedKeyframeSequence(v110, v109);
        local v111 = v11.getAnimationAssetInfo(v110);
        local l_id_0 = v111.id;
        if not v105[l_id_0] then
            v105[l_id_0] = v16.new(v111, v109.Name, v108, l_AnimationStatus_0.Done, nil);
            v108 = v108 + 1;
        end;
        v105[l_id_0].oldRefs[v109] = v111;
    end;
end;
local function v122(v114, v115) --[[ Line: 233 ]] --[[ Name: addPreviouslyConvertertedAnimInstances ]]
    -- upvalues: v1 (copy), v11 (copy), l_OriginalId_0 (copy), v16 (copy), l_AnimationStatus_0 (copy), l_AnimationTagging_0 (copy)
    local v116 = 1 + #v1.Dictionary.keys(v114);
    for _, v118 in v115 do
        local v119 = v118:Clone();
        v119.AnimationId = v11.getAnimationId(v118:GetAttribute(l_OriginalId_0));
        local v120 = v11.getAnimationAssetInfo(v119);
        local l_id_1 = v120.id;
        if not v114[l_id_1] then
            v114[l_id_1] = v16.new(v120, v118.Name, v116, l_AnimationStatus_0.Done, v11.getConvertedAssetId(l_id_1));
            l_AnimationTagging_0:removeTag(v118);
            v116 = v116 + 1;
        end;
        v114[l_id_1].oldRefs[v118] = v120;
    end;
end;
local function v132(v123, v124) --[[ Line: 256 ]] --[[ Name: addPreviouslyConvertedScriptIssues ]]
    -- upvalues: v1 (copy), v11 (copy), v16 (copy), l_AnimationStatus_0 (copy)
    local v125 = 1 + #v1.Dictionary.keys(v123);
    for v126, v127 in v124 do
        for _, v129 in v127 do
            local v130 = v11.getAnimationAssetInfo(v129.str);
            if not v123[v126] then
                local v131 = v11.getCachedName(v126);
                v123[v126] = v16.new(v130, v131 or v129.str, v125, l_AnimationStatus_0.Done, v11.getConvertedAssetId(v126));
                v125 = v125 + 1;
            end;
            v123[v126].oldRefs[v129] = v130;
        end;
    end;
end;
local function v135() --[[ Line: 279 ]] --[[ Name: loadSavedAssetIds ]]
    -- upvalues: v10 (copy), v11 (copy)
    for v133, v134 in (v10.getAllSavedAnimationAssetIds()) do
        v11.registerConvertedAssetId(v133, v134.converted, v134.kfs, v134.name);
        v11.overrideIsR6Cache(v134.converted, false);
    end;
end;
return function(v136, v137, v138) --[[ Line: 293 ]] --[[ Name: scanAllAnimations ]]
    -- upvalues: v135 (copy), v64 (copy), v73 (copy), v83 (copy), v113 (copy), v122 (copy), v132 (copy), v10 (copy), v1 (copy), v94 (copy), v104 (copy), v22 (copy), v21 (copy), v17 (copy)
    return function(v139) --[[ Line: 294 ]]
        -- upvalues: v135 (ref), v64 (ref), v73 (ref), v83 (ref), v113 (ref), v122 (ref), v132 (ref), v10 (ref), v1 (ref), v94 (ref), v136 (copy), v104 (ref), v137 (copy), v22 (ref), v138 (copy), v21 (ref), v17 (ref)
        task.spawn(function() --[[ Line: 295 ]]
            -- upvalues: v135 (ref), v64 (ref), v139 (copy), v73 (ref), v83 (ref), v113 (ref), v122 (ref), v132 (ref), v10 (ref), v1 (ref), v94 (ref), v136 (ref), v104 (ref), v137 (ref), v22 (ref), v138 (ref), v21 (ref), v17 (ref)
            v135();
            local v140, v141 = v64(v139);
            local v142, v143, v144 = v73(v139);
            local v145 = v83(v142);
            v113(v145, v143);
            v122(v145, v144);
            v132(v145, v141);
            v10.addConvertibleKeyframeSequences(v142);
            v10.addConvertibleAnimations(v142);
            v10.addConvertibleAssetIds(v1.Dictionary.keys(v140));
            local v146 = v94(v140, v141, v145);
            v136:getHandler("onInitialAnimationsAnalysisScan")(v146, v145);
            v104(v139, v137, v146, v145);
            v139:dispatch(v22(v145));
            v138();
            v139:dispatch(v21(v17.Status.Done));
        end);
    end;
end;