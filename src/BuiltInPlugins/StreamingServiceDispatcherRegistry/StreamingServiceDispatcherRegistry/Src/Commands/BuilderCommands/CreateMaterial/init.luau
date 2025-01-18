local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("MaterialGenerationService");
local v3 = v1.GetService("MaterialService");
local v4 = v1.GetService("ChatbotUIService");
local v5 = require(l_script_FirstAncestor_0.Packages.Promise);
local v6 = require(l_script_FirstAncestor_0.Packages.Dash);
local v7 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v10 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGenErrorTextFiltered);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewServiceAsyncApi);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagComponentizeMaterialGenerator);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagRejectMaterialGeneratorError);
local function v20(v15) --[[ Line: 38 ]] --[[ Name: findUniqueMaterialName ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v18 = v6.collectSet(v3:GetDescendants(), function(_, v17) --[[ Line: 39 ]]
        if v17:IsA("MaterialVariant") then
            return v17.Name;
        else
            return nil;
        end;
    end);
    if not v18[v15] then
        return v15;
    else
        local v19 = 1;
        while v18[v15 .. v19] do
            v19 = v19 + 1;
        end;
        return v15 .. v19;
    end;
end;
local function _(v21, v22) --[[ Line: 55 ]] --[[ Name: promiseGenerateMaterialVariants ]]
    -- upvalues: v5 (copy), v12 (copy), v2 (copy)
    assert(type(v21) == "string", "Bad materialDescription");
    assert(type(v22) == "number", "Bad amount");
    return v5.try(function() --[[ Line: 59 ]]
        -- upvalues: v12 (ref), v2 (ref), v21 (copy), v22 (copy)
        if v12() then
            return v2:GenerateMaterialVariantsAsync(v21, v22);
        else
            return v2:DEPRECATED_GenerateMaterialVariantsAync(v21, v22);
        end;
    end);
end;
local _ = function(v24) --[[ Line: 68 ]] --[[ Name: promiseUploadMaterialsAsync ]]
    -- upvalues: v5 (copy), v13 (copy), v1 (copy), v14 (copy), v2 (copy)
    assert(type(v24) == "table", "Bad materials");
    return v5.try(function() --[[ Line: 71 ]]
        -- upvalues: v13 (ref), v1 (ref), v24 (copy), v14 (ref), v2 (ref)
        if v13() then
            local v25 = v1.GetPluginComponent("MaterialGenerator");
            local v26 = {};
            for v27, _ in v24.materialVariants do
                table.insert(v26, v27 - 1);
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 82 ]]
                -- upvalues: v25 (copy), v24 (ref), v26 (copy)
                return v25:UploadMaterialsAsync(v24.generationId, v26);
            end);
            if not l_status_0 then
                if v14() then
                    error(l_result_0);
                    return l_result_0;
                else
                    return {};
                end;
            else
                return l_result_0;
            end;
        else
            return v2:DEPRECATED_UploadMaterialVariantsAsync(v24);
        end;
    end);
end;
local function _(v32, v33) --[[ Line: 99 ]] --[[ Name: getOrCreateFolder ]]
    local l_v32_FirstChild_0 = v32:FindFirstChild(v33);
    if l_v32_FirstChild_0 then
        return l_v32_FirstChild_0;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v33;
        l_Folder_0.Parent = v32;
        return l_Folder_0;
    end;
end;
local function _(v37) --[[ Line: 111 ]] --[[ Name: createApplyVariantsUrl ]]
    return string.format("studio://apply_material_variant/%s", v37);
end;
local function _(v39) --[[ Line: 115 ]] --[[ Name: _createInstancePreviewImageAndText ]]
    return string.format("![](image://instance/%s) %s", v39.ClassName, v39.Name);
end;
local function v69(v41, v42, v43, v44, v45) --[[ Line: 120 ]] --[[ Name: promiseMaterialVariantImpl ]]
    -- upvalues: v9 (copy), v7 (copy), v5 (copy), v12 (copy), v2 (copy), v13 (copy), v1 (copy), v14 (copy), v3 (copy), v20 (copy), v10 (copy), v4 (copy)
    local v46 = v9:getText("CreateMaterial", "Description", {
        baseMaterial = tostring(v43), 
        description = tostring(v42), 
        materialPattern = tostring(v45)
    });
    v7.streamText(v41.requestId, string.format("\n%s\n", v46));
    assert(type(v42) == "string", "Bad materialDescription");
    assert(true, "Bad amount");
    local l_try_0 = v5.try;
    local v48 = 4;
    return l_try_0(function() --[[ Line: 59 ]]
        -- upvalues: v12 (ref), v2 (ref), v42 (copy), v48 (copy)
        if v12() then
            return v2:GenerateMaterialVariantsAsync(v42, v48);
        else
            return v2:DEPRECATED_GenerateMaterialVariantsAync(v42, v48);
        end;
    end):andThen(function(v49) --[[ Line: 136 ]]
        -- upvalues: v5 (ref), v13 (ref), v1 (ref), v14 (ref), v2 (ref), v3 (ref), v42 (copy), v20 (ref), v44 (copy), v43 (copy), v45 (copy), v10 (ref), v41 (copy), v4 (ref)
        assert(type(v49) == "table", "Bad materials");
        return v5.try(function() --[[ Line: 71 ]]
            -- upvalues: v13 (ref), v1 (ref), v49 (copy), v14 (ref), v2 (ref)
            if v13() then
                local v50 = v1.GetPluginComponent("MaterialGenerator");
                local v51 = {};
                for v52, _ in v49.materialVariants do
                    table.insert(v51, v52 - 1);
                end;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 82 ]]
                    -- upvalues: v50 (copy), v49 (ref), v51 (copy)
                    return v50:UploadMaterialsAsync(v49.generationId, v51);
                end);
                if not l_status_1 then
                    if v14() then
                        error(l_result_1);
                        return l_result_1;
                    else
                        return {};
                    end;
                else
                    return l_result_1;
                end;
            else
                return v2:DEPRECATED_UploadMaterialVariantsAsync(v49);
            end;
        end):andThen(function(v56) --[[ Line: 137 ]]
            -- upvalues: v3 (ref), v42 (ref), v13 (ref), v49 (copy), v20 (ref), v44 (ref), v43 (ref), v45 (ref), v10 (ref), v41 (ref), v4 (ref)
            local l_v3_0 = v3;
            local l_AssistantMaterials_0 = l_v3_0:FindFirstChild("AssistantMaterials");
            local v59;
            if l_AssistantMaterials_0 then
                v59 = l_AssistantMaterials_0;
            else
                local l_Folder_1 = Instance.new("Folder");
                l_Folder_1.Name = "AssistantMaterials";
                l_Folder_1.Parent = l_v3_0;
                v59 = l_Folder_1;
            end;
            l_AssistantMaterials_0 = string.format("Material: %s", v42);
            local l_v59_FirstChild_0 = v59:FindFirstChild(l_AssistantMaterials_0);
            if l_v59_FirstChild_0 then
                l_v3_0 = l_v59_FirstChild_0;
            else
                local l_Folder_2 = Instance.new("Folder");
                l_Folder_2.Name = l_AssistantMaterials_0;
                l_Folder_2.Parent = v59;
                l_v3_0 = l_Folder_2;
            end;
            l_AssistantMaterials_0 = {};
            l_v59_FirstChild_0 = 0;
            local v63 = false;
            local v64 = nil;
            v64 = if v13() then v56 else v49;
            for _, v66 in v64 do
                local l_v66_DebugId_0 = v66:GetDebugId(10);
                v66.Name = v20(v44);
                v66.BaseMaterial = Enum.Material[v43];
                v66.MaterialPattern = Enum.MaterialPattern[v45];
                v66.Parent = l_v3_0;
                v10.guidToInfo[l_v66_DebugId_0] = {
                    instance = v66
                };
                l_v59_FirstChild_0 = v66.StudsPerTile;
                v63 = v66.MaterialPattern == Enum.MaterialPattern.Organic;
                table.insert(l_AssistantMaterials_0, {
                    guid = l_v66_DebugId_0, 
                    url = v66.ColorMap, 
                    action = string.format("studio://apply_material_variant/%s", l_v66_DebugId_0), 
                    tooltip = v66.Name
                });
            end;
            local v68 = {
                requestId = v41.requestId or "", 
                instanceData = l_AssistantMaterials_0, 
                studsPerTile = l_v59_FirstChild_0, 
                isOrganic = v63
            };
            v4:DisplayContent("Materials", v68);
            return v64[1];
        end);
    end);
end;
local function _(v70, v71, v72, v73, v74) --[[ Line: 187 ]] --[[ Name: promiseMaterialVariant ]]
    -- upvalues: v69 (copy)
    return v69(v70, v71, v72, v73, v74);
end;
return function(v76) --[[ Line: 191 ]] --[[ Name: createMaterialVariant ]]
    -- upvalues: v10 (copy), v69 (copy), v9 (copy), v11 (copy), v7 (copy)
    local l_arguments_0 = v76.arguments;
    assert(type(l_arguments_0.materialDescription) == "string", "Bad request.materialDescription");
    local v78 = l_arguments_0.materialId or l_arguments_0.instanceId;
    assert(v78, "Bad request.materialId");
    l_arguments_0.materialId = v78;
    v10.StartRecordingActions(v76.requestId);
    local l_materialDescription_0 = l_arguments_0.materialDescription;
    local l_baseMaterial_0 = l_arguments_0.baseMaterial;
    local l_materialId_0 = l_arguments_0.materialId;
    local l_materialPattern_0 = l_arguments_0.materialPattern;
    local v83;
    v83, l_materialDescription_0 = v69(v76, l_materialDescription_0, l_baseMaterial_0, l_materialId_0, l_materialPattern_0):await();
    if not v83 then
        l_baseMaterial_0 = v9:getText("CreateMaterial", "FailedToCreateMaterialImprovedError", {});
        if v11() and string.find(tostring(l_materialDescription_0), "text is fully filtered") then
            l_baseMaterial_0 = v9:getText("CreateMaterial", "FailedToCreateMaterialTextFilteredError", {});
        end;
        v7.streamText(v76.requestId, string.format("\n%s\n", l_baseMaterial_0));
        v10.EndRecordingActions(v76.requestId);
        error(l_baseMaterial_0);
    end;
    if l_arguments_0.materialId then
        v10.set(l_arguments_0.materialId, l_materialDescription_0);
    end;
    v10.EndRecordingActions(v76.requestId);
end;