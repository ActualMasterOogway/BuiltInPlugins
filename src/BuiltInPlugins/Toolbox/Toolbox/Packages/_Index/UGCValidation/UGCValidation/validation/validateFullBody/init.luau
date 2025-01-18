local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureUGCValidationRequiredFolderContext);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v7 = require(l_Parent_0.util.validateWithSchema);
local v8 = require(l_Parent_0.validation.validateAssetBounds);
local v9 = require(l_Parent_0.validation.validateSingleInstance);
local v10 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
local v11 = require(l_Parent_0.util.createLimbsAndTorsoSchema);
local v12 = require(l_Parent_0.util.resetPhysicsData);
local v13 = require(l_Parent_0.util.ParseContentIds);
local _ = function(v14, v15) --[[ Line: 27 ]] --[[ Name: getInstance ]]
    for _, v17 in v14 do
        if v17.Name == v15 then
            return v17;
        end;
    end;
    return nil;
end;
local function v30(v19, v20, v21) --[[ Line: 38 ]] --[[ Name: validateAllAssetsWithSchema ]]
    -- upvalues: v9 (copy), v7 (copy), v10 (copy), v11 (copy)
    local v22 = false;
    for _, v24 in v19 do
        if Enum.AssetType.DynamicHead == v24.assetTypeEnum then
            if not v9(v24.allSelectedInstances, v21) then
                return false;
            elseif not v7(v10(v21), v24.allSelectedInstances[1], v21).success then
                return false;
            end;
        else
            for _, v26 in v20 do
                local v27;
                for _, v29 in v24.allSelectedInstances do
                    if v29.Name == v26 then
                        v27 = v29;
                        v22 = true;
                    end;
                    if v22 then
                        break;
                    end;
                end;
                if not v22 then
                    v27 = nil;
                end;
                v22 = false;
                if not v27 then
                    return false;
                elseif not v7(v11(v24.assetTypeEnum, v26, v21), v27, v21).success then
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v37(v31) --[[ Line: 77 ]] --[[ Name: validateCorrectAssetTypesExist ]]
    -- upvalues: v4 (copy)
    local v32 = {};
    local v33 = #v4.getBodyPartAssets();
    local v34 = 0;
    for _, v36 in v31 do
        if not v4.isBodyPart(v36.assetTypeEnum) then
            return false;
        elseif v32[v36.assetTypeEnum] then
            return false;
        else
            v32[v36.assetTypeEnum] = true;
            v34 = v34 + 1;
        end;
    end;
    return v34 == v33;
end;
local function v49(v38, v39) --[[ Line: 95 ]] --[[ Name: createAllBodyPartsTable ]]
    local v40 = false;
    local v41 = {};
    for _, v43 in v39 do
        if Enum.AssetType.DynamicHead == v43.assetTypeEnum then
            v41[v43.allSelectedInstances[1].Name] = v43.allSelectedInstances[1];
        else
            local v44;
            for _, v46 in v43.allSelectedInstances do
                if v46.Name == v38 then
                    v44 = v46;
                    v40 = true;
                end;
                if v40 then
                    break;
                end;
            end;
            if not v40 then
                v44 = nil;
            end;
            v40 = false;
            for _, v48 in v44:GetChildren() do
                v41[v48.Name] = v48;
            end;
        end;
    end;
    return v41;
end;
local function v58(v50, v51) --[[ Line: 110 ]] --[[ Name: validateMeshIds ]]
    -- upvalues: v13 (copy), v2 (copy)
    local v52 = {
        MeshPart = {
            "MeshId"
        }
    };
    local v53 = {
        MeshPart = {
            MeshId = true
        }
    };
    for _, v55 in v50 do
        for _, v57 in v55.allSelectedInstances do
            if not v13.parseWithErrorCheck({}, {}, v57, v52, v53, v51) then
                v2.reportFailure(v2.ErrorType.validateFullBody_MeshIdsMissing, nil, v51);
                return false, {
                    "Unable to run full body validation due to previous errors detected while processing individual body parts"
                };
            end;
        end;
    end;
    return true;
end;
local function v65(v59, v60, v61) --[[ Line: 147 ]] --[[ Name: validateInstanceHierarchy ]]
    -- upvalues: v37 (copy), v2 (copy), v30 (copy), v58 (copy)
    local v62 = if v61 then v61.isServer else nil;
    if not v37(v59) then
        v2.reportFailure(v2.ErrorType.validateFullBody_IncorrectAssetTypeSet, nil, v61);
        if v62 then
            error("Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again.");
        end;
        return false, {
            "Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again."
        };
    elseif not v30(v59, v60, v61) then
        v2.reportFailure(v2.ErrorType.validateFullBody_InstancesMissing, nil, v61);
        return false, {
            "Unable to run full body validation due to previous errors detected while processing individual body parts."
        };
    else
        local v63, v64 = v58(v59, v61);
        if not v63 then
            return false, v64;
        else
            return true;
        end;
    end;
end;
local function v71(v66) --[[ Line: 181 ]] --[[ Name: resetAllPhysicsData ]]
    -- upvalues: v12 (copy)
    for _, v68 in v66.fullBodyData do
        local v69, v70 = v12(v68.allSelectedInstances, v66);
        if not v69 then
            return false, {
                v70
            };
        end;
    end;
    return true;
end;
return function(v72) --[[ Line: 194 ]] --[[ Name: validateFullBody ]]
    -- upvalues: v3 (copy), v1 (copy), v65 (copy), v71 (copy), v6 (copy), v49 (copy), v8 (copy)
    assert(v72.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody");
    local l_fullBodyData_0 = v72.fullBodyData;
    local l_requireAllFolders_0 = v72.requireAllFolders;
    local l_isServer_0 = v72.isServer;
    local v76 = {
        v3.FOLDER_NAMES.R15ArtistIntent
    };
    if v1() then
        if l_requireAllFolders_0 then
            table.insert(v76, v3.FOLDER_NAMES.R15Fixed);
        end;
    elseif l_isServer_0 then
        table.insert(v76, v3.FOLDER_NAMES.R15Fixed);
    end;
    local v77, v78 = v65(l_fullBodyData_0, v76, v72);
    if not v77 then
        return false, v78;
    else
        local v79, v80 = v71(v72);
        v77 = v79;
        v78 = v80;
        if not v77 then
            return false, v78;
        else
            v79 = v6.new();
            for _, v82 in v76 do
                local v83 = v49(v82, l_fullBodyData_0);
                assert(v83);
                v79:updateReasons(v8(v83, nil, v72));
            end;
            return v79:getFinalResults();
        end;
    end;
end;