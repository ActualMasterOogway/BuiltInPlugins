local l_HttpService_0 = game:GetService("HttpService");
local l_MaterialService_0 = game:GetService("MaterialService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v6 = require(l_script_FirstAncestor_0.Packages.Promise);
local v7 = require(l_script_FirstAncestor_0.Packages.React);
local v8 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_ContextServices_0 = v4.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_useStackState_0 = v8.useStackState;
local l_useToggleState_0 = v8.useToggleState;
local l_StudioServices_0 = v5.Context.StudioServices;
local v15 = require(l_script_FirstAncestor_0.Src.Enum.GenerationErrorType);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewServiceAsyncApi);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagComponentizeMaterialGenerator);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorFixAnalytics);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorFixSaveIconDisappear);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v21 = require(l_Util_0.GeneratedMaterialsContext);
local v22 = require(l_Util_0.GenerationContext);
local v23 = require(l_Util_0.generateMaterialVariants);
local v24 = require(l_Util_0.getNewMaterialName);
local v25 = require(l_Util_0.getSampleCount);
local v26 = require(l_Util_0.parseGenerationError);
local v27 = require(l_Util_0.uploadMaterialVariant);
local v28 = require(l_Util_0.useRefToState);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v30 = nil;
if not v16() then
    v30 = function() --[[ Line: 50 ]] --[[ Name: getGenerationId ]]
        -- upvalues: l_HttpService_0 (copy)
        return l_HttpService_0:GenerateGUID(false);
    end;
end;
local _ = function() --[[ Line: 56 ]] --[[ Name: getUsedMaterialNames ]]
    -- upvalues: v3 (copy), l_MaterialService_0 (copy)
    return v3.collectArray(l_MaterialService_0:GetDescendants(), function(_, v32) --[[ Line: 57 ]]
        if v32:IsA("MaterialVariant") then
            return v32.Name;
        else
            return nil;
        end;
    end);
end;
local function v37(v34, v35, v36) --[[ Line: 62 ]] --[[ Name: getErrorMessage ]]
    -- upvalues: v15 (copy)
    if v35 == v15.CustomMessage then
        return v36 or v34:getText("Errors", "UnknownGenerationError");
    elseif v35 == v15.NoSession then
        return v34:getText("Errors", "NoSession");
    elseif v35 == v15.ServerError500 then
        return v34:getText("Errors", "ServerError500");
    elseif v35 == v15.ServerError504 then
        return v34:getText("Errors", "ServerError504");
    elseif v35 == v15.TextFullyFiltered then
        return v34:getText("Errors", "TextFullyFiltered");
    elseif v35 == v15.NoSelectedMaterial then
        return v34:getText("Errors", "NoSelectedMaterial");
    elseif v35 == v15.FailedToGenerateMaps then
        return v34:getText("Errors", "FailedToGenerateMaps");
    elseif v35 == v15.TooManyRequests then
        return v34:getText("Errors", "TooManyRequests");
    elseif v35 == v15.AccountingFailedDecrement then
        return v34:getText("Errors", "AccountingFailedDecrement");
    elseif v35 == v15.FailedToSetImage then
        return v34:getText("Errors", "FailedToSetImage");
    elseif v35 == v15.Unknown then
        return v34:getText("Errors", "UnknownGenerationError");
    else
        error("Unknown errorType");
        return v34:getText("Errors", "UnknownGenerationError");
    end;
end;
local function v69(v38) --[[ Line: 91 ]] --[[ Name: DEPRECATED_GenerationProvider ]]
    -- upvalues: v7 (copy), v21 (copy), l_useToggleState_0 (copy), l_useStackState_0 (copy), l_Localization_0 (copy), l_StudioServices_0 (copy), v23 (copy), v3 (copy), l_MaterialService_0 (copy), v24 (copy), v30 (ref), v37 (copy), v27 (copy), v22 (copy)
    local v39 = v7.useContext(v21);
    local l_addMaterials_0 = v39.addMaterials;
    local l_setMaterialStatus_0 = v39.setMaterialStatus;
    local v42 = l_useToggleState_0(false);
    local v43, v44 = v7.useState("");
    local v45, v46 = v7.useState("");
    local v47 = l_useStackState_0({});
    local v48 = l_Localization_0:use();
    local v49 = l_StudioServices_0.use():getService("MaterialGenerationService");
    local v50 = v7.useState(function() --[[ Line: 106 ]]
        -- upvalues: v49 (copy)
        return v49:StartSession();
    end);
    local v63 = v7.useCallback(function(_) --[[ Line: 110 ]]
        -- upvalues: v50 (copy), v42 (copy), v44 (copy), v45 (copy), v23 (ref), v3 (ref), l_MaterialService_0 (ref), v24 (ref), l_addMaterials_0 (copy), v30 (ref), v37 (ref), v48 (copy), v47 (copy)
        assert(v50, "No active session");
        if not v50 then
            return;
        elseif v42.enabled then
            warn("Generation already in progress");
            return;
        else
            v44(v45);
            v42.enable();
            v23(v45, v50):andThen(function(v52) --[[ Line: 125 ]]
                -- upvalues: v3 (ref), l_MaterialService_0 (ref), v24 (ref), v45 (ref), l_addMaterials_0 (ref), v30 (ref)
                local l_materialVariants_0 = v52.materialVariants;
                if #l_materialVariants_0 > 0 then
                    local v56 = v3.collectArray(l_MaterialService_0:GetDescendants(), function(_, v55) --[[ Line: 57 ]]
                        if v55:IsA("MaterialVariant") then
                            return v55.Name;
                        else
                            return nil;
                        end;
                    end);
                    for _, v58 in pairs(l_materialVariants_0) do
                        local v59 = v24(v45, v56);
                        v58.Name = v59;
                        table.insert(v56, v59);
                    end;
                    local l_filteredPromptText_0 = v52.filteredPromptText;
                    l_addMaterials_0(l_materialVariants_0, v45, l_filteredPromptText_0, v30());
                end;
            end):catch(function(v61) --[[ Line: 141 ]]
                -- upvalues: v37 (ref), v48 (ref), v47 (ref)
                local v62 = v37(v48, v61.errorType, v61.message);
                v47.push(v62);
            end):finally(function() --[[ Line: 145 ]]
                -- upvalues: v42 (ref)
                v42.disable();
            end);
            return;
        end;
    end, {
        v42.enabled, 
        v45, 
        l_addMaterials_0, 
        v47, 
        v50
    });
    local v67 = v7.useCallback(function(v64) --[[ Line: 150 ]]
        -- upvalues: v50 (copy), l_setMaterialStatus_0 (copy), v27 (ref)
        assert(v50, "No active session");
        if not v50 then
            return;
        else
            l_setMaterialStatus_0(v64, "Uploading");
            v27(v64, v50):andThen(function(v65) --[[ Line: 159 ]]
                -- upvalues: v64 (copy), l_setMaterialStatus_0 (ref)
                v64.ColorMap = v65.colorMap;
                v64.MetalnessMap = v65.metalnessMap;
                v64.NormalMap = v65.normalMap;
                v64.RoughnessMap = v65.roughnessMap;
                l_setMaterialStatus_0(v64, "Uploaded");
            end):catch(function(_) --[[ Line: 166 ]]
                -- upvalues: l_setMaterialStatus_0 (ref), v64 (copy)
                l_setMaterialStatus_0(v64, "None");
            end);
            return;
        end;
    end, {
        l_setMaterialStatus_0, 
        v50
    });
    local v68 = {
        session = v50, 
        isGenerating = v42.enabled, 
        lastGeneratedPromptText = v43, 
        promptText = v45, 
        setPromptText = v46, 
        errorMessage = v47.getTop(), 
        popError = v47.pop, 
        generateMaterialVariants = v63, 
        uploadMaterialVariant = v67
    };
    return v7.createElement(v22.Provider, {
        value = v68
    }, v38.children);
end;
local function v109(v70) --[[ Line: 190 ]] --[[ Name: GenerationProvider ]]
    -- upvalues: v16 (copy), v17 (copy), v7 (copy), v21 (copy), l_useToggleState_0 (copy), l_useStackState_0 (copy), l_Localization_0 (copy), v18 (copy), l_Analytics_0 (copy), l_StudioServices_0 (copy), l_ContextServices_0 (copy), v19 (copy), v28 (copy), v6 (copy), v25 (copy), v3 (copy), l_MaterialService_0 (copy), v24 (copy), v26 (copy), v37 (copy), v22 (copy)
    assert(v16(), "Expected FFlagMaterialGeneratorNewServiceAsyncApi to be true");
    assert(v17(), "Expected FFlagComponentizeMaterialGenerator to be true");
    local v71 = v7.useContext(v21);
    local l_addMaterials_1 = v71.addMaterials;
    local l_setMaterialStatus_1 = v71.setMaterialStatus;
    local l_getMaterialIdentifiers_0 = v71.getMaterialIdentifiers;
    local v75 = l_useToggleState_0(false);
    local v76, v77 = v7.useState("");
    local v78, v79 = v7.useState("");
    local v80 = l_useStackState_0({});
    local v81 = l_Localization_0:use();
    local v82 = nil;
    if v18() then
        v82 = l_Analytics_0:use();
    end;
    local v83 = l_StudioServices_0.use():getService("MaterialGenerationService");
    local l_PluginComponent_0 = l_ContextServices_0.Plugin.use():get():GetPluginComponent("MaterialGenerator");
    local v85 = nil;
    if v19() then
        v85 = v28(l_addMaterials_1);
    end;
    local v100 = v7.useCallback(function(v86) --[[ Line: 223 ]]
        -- upvalues: v75 (copy), v77 (copy), v78 (copy), v6 (ref), v25 (ref), v83 (copy), v3 (ref), l_MaterialService_0 (ref), v24 (ref), v18 (ref), v82 (ref), v19 (ref), v85 (ref), l_addMaterials_1 (copy), v26 (ref), v37 (ref), v81 (copy), v80 (copy)
        if v75.enabled then
            error("Generation already in progress");
            return;
        else
            v77(v78);
            v75.enable();
            v6.try(function() --[[ Line: 232 ]]
                -- upvalues: v25 (ref), v83 (ref), v78 (ref), v3 (ref), l_MaterialService_0 (ref), v24 (ref), v18 (ref), v82 (ref), v86 (copy), v19 (ref), v85 (ref), l_addMaterials_1 (ref)
                local v87 = v25();
                local v88 = v83:GenerateMaterialVariantsAsync(v78, v87);
                if not v88 or not v88.materialVariants or #v88.materialVariants == 0 then
                    error("Returned no MaterialVariants");
                end;
                local l_materialVariants_1 = v88.materialVariants;
                local v92 = v3.collectArray(l_MaterialService_0:GetDescendants(), function(_, v91) --[[ Line: 57 ]]
                    if v91:IsA("MaterialVariant") then
                        return v91.Name;
                    else
                        return nil;
                    end;
                end);
                for _, v94 in l_materialVariants_1 do
                    local v95 = v24(v78, v92);
                    v94.Name = v95;
                    table.insert(v92, v95);
                end;
                if v18() then
                    v82:report("generateMaterials", v88.generationId, v86, #l_materialVariants_1, v78, v88.filteredText);
                end;
                if v19() then
                    v85.current(l_materialVariants_1, v78, v88.filteredText, v88.generationId);
                    return;
                else
                    l_addMaterials_1(l_materialVariants_1, v78, v88.filteredText, v88.generationId);
                    return;
                end;
            end):catch(function(v96) --[[ Line: 263 ]]
                -- upvalues: v26 (ref), v37 (ref), v81 (ref), v18 (ref), v82 (ref), v78 (ref), v80 (ref)
                local v97, v98 = v26(v96);
                local v99 = v37(v81, v97, v98);
                if v18() then
                    v82:report("generateMaterialsError", v78, v97, v99);
                end;
                v80.push(v99);
            end):finally(function() --[[ Line: 272 ]]
                -- upvalues: v75 (ref)
                v75.disable();
            end);
            return;
        end;
    end, {
        v75.enabled, 
        v78, 
        l_addMaterials_1, 
        v80
    });
    local v107 = v7.useCallback(function(v101) --[[ Line: 277 ]]
        -- upvalues: l_setMaterialStatus_1 (copy), l_getMaterialIdentifiers_0 (copy), l_PluginComponent_0 (copy), v80 (copy), v18 (ref), v82 (ref)
        l_setMaterialStatus_1(v101, "Uploading");
        local v102, v103 = l_getMaterialIdentifiers_0(v101);
        task.spawn(function() --[[ Line: 282 ]]
            -- upvalues: l_PluginComponent_0 (ref), v102 (copy), v103 (copy), l_setMaterialStatus_1 (ref), v101 (copy), v80 (ref), v18 (ref), v82 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 283 ]]
                -- upvalues: l_PluginComponent_0 (ref), v102 (ref), v103 (ref)
                return l_PluginComponent_0:UploadMaterialsAsync(v102, {
                    v103
                });
            end);
            if not l_status_0 then
                l_setMaterialStatus_1(v101, "None");
                v80.push(l_result_0);
                return;
            elseif not l_result_0 or #l_result_0 == 0 then
                l_setMaterialStatus_1(v101, "None");
                v80.push("Returned no materials");
                return;
            elseif #l_result_0 > 1 then
                l_setMaterialStatus_1(v101, "None");
                v80.push("Returned more than one MaterialVariant");
                return;
            else
                local v106 = l_result_0[1];
                v101.ColorMap = v106.ColorMap;
                if v106.NormalMap then
                    v101.NormalMap = v106.NormalMap;
                end;
                if v106.MetalnessMap then
                    v101.MetalnessMap = v106.MetalnessMap;
                end;
                if v106.RoughnessMap then
                    v101.RoughnessMap = v106.RoughnessMap;
                end;
                l_setMaterialStatus_1(v101, "Uploaded");
                if v18() then
                    v82:report("saveButtonClicked", v101, v102);
                end;
                return;
            end;
        end);
    end, {
        l_setMaterialStatus_1, 
        l_getMaterialIdentifiers_0
    });
    local v108 = {
        isGenerating = v75.enabled, 
        lastGeneratedPromptText = v76, 
        promptText = v78, 
        setPromptText = v79, 
        errorMessage = v80.getTop(), 
        popError = v80.pop, 
        generateMaterialVariants = v100, 
        uploadMaterialVariant = v107
    };
    return v7.createElement(v22.Provider, {
        value = v108
    }, v70.children);
end;
if v16() and v17() then
    return v109;
else
    return v69;
end;