local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v7, v8, v9, v10) --[[ Line: 14 ]] --[[ Name: validateCageMeshIntersection ]]
    -- upvalues: v6 (copy), v2 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy)
    local l_assetTypeEnum_0 = v10.assetTypeEnum;
    if v6() then
        if not v9.editableMesh then
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_InvalidRefMeshId, nil, v10);
            return false, {
                string.format("The meshId reference for cage '%s' is invalid or doesn't exist. Please, verify you are using a valid mesh asset and try again.", v9.fullName)
            };
        end;
    elseif v9.contentId == "" then
        v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_InvalidRefMeshId, nil, v10);
        return false, {
            string.format("The meshId reference for cage '%s' is invalid or doesn't exist. Please, verify you are using a valid mesh asset and try again.", v9.fullName)
        };
    end;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    if v6() and v5() then
        local v17, v18, v19, v20, v21 = v4(function() --[[ Line: 56 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy), v9 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshCageMeshIntersection(v7.editableMesh, v8.editableMesh, v9.editableMesh);
        end, v10);
        v12 = v17;
        v13 = v18;
        v14 = v19;
        v15 = v20;
        v16 = v21;
    else
        local v22, v23, v24, v25, v26 = pcall(function() --[[ Line: 67 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy), v9 (copy)
            return l_UGCValidationService_0:ValidateCageMeshIntersection(v7.contentId, v8.contentId, v9.contentId);
        end);
        v12 = v22;
        v13 = v23;
        v14 = v24;
        v15 = v25;
        v16 = v26;
    end;
    if not v12 then
        v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_FailedToExecute, nil, v10);
        return false, {
            string.format("Failed to execute cage intersection detection for '%s'. Make sure the cage mesh exists and try again.", v9.fullName)
        };
    else
        local v27 = {};
        local v28 = true;
        if not v13 then
            v28 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_Intersection, nil, v10);
            table.insert(v27, string.format("There are cage vertices inside the layered accessory mesh '%s', which could lead to interpenetration issues during fitting. You need to edit the cage mesh to fix this intersection issue.", v8.context));
        end;
        if not v14 then
            v28 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_IrrelevantCageModified, nil, v10);
            table.insert(v27, string.format("Outer cage of '%s' has mesh edits on regions that don't correspond to its current asset type '%s' (i.e. edits on the lower leg cages when asset type is set to 'Head'). You need to check the asset type for the layered accessory '%s'.", v8.fullName, l_assetTypeEnum_0.Name, v8.context));
        end;
        if not v15 then
            v28 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_OuterCageFarExtendedFromMesh, nil, v10);
            table.insert(v27, string.format("Outer cage of '%s' has mesh edits that place vertices too far away from the model mesh. You need to edit the cage vertices to be closer to the model.", v8.fullName));
        end;
        if not v16 then
            v28 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshIntersection_AverageOuterCageToMeshVertDistances, nil, v10);
            table.insert(v27, string.format("The average distance between the layered accessory '%s' and its outer cage is too large. You need to edit the cage mesh to be closer to the accessory.", v8.context));
        end;
        return v28, v27;
    end;
end;