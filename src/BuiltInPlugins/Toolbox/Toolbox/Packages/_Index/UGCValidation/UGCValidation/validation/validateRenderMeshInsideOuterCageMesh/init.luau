local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v4 = require(l_Parent_0.flags.getFIntUGCValidateRenderMeshInsideOuterCageMeshThreshold);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local _ = require(l_Parent_0.util.Types);
local v7 = require(l_Parent_0.util.pcallDeferred);
return function(v8, v9, v10, v11) --[[ Line: 21 ]] --[[ Name: validateRenderMeshInsideOuterCageMesh ]]
    -- upvalues: v3 (copy), v5 (copy), v7 (copy), l_UGCValidationService_0 (copy), v2 (copy), v4 (copy)
    local v12 = tick();
    local v13 = nil;
    local v14 = nil;
    if v3() and v5() then
        local v15, v16 = v7(function() --[[ Line: 34 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v9 (copy), v10 (copy), v8 (copy)
            return l_UGCValidationService_0:CalculateEditableMeshInsideMeshPercentage(v9.editableMesh, v10.editableMesh, v8.CageOrigin:Inverse(), (Vector3.new(1, 1, 1, 0)));
        end, v11);
        v13 = v15;
        v14 = v16;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 43 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v9 (copy), v10 (copy), v8 (copy)
            return l_UGCValidationService_0:CalculateMeshInsideMeshPercentage(v9.contentId, v10.contentId, v8.CageOrigin:Inverse(), (Vector3.new(1, 1, 1, 0)));
        end);
        v13 = l_status_0;
        v14 = l_result_0;
    end;
    if not v13 then
        local v19 = string.format("Failed to execute render mesh inside outer mesh check for '%s' and '%s'. Make sure the meshes exists and try again.", v9.fullName, v10.fullName);
        if v11.isServer then
            error(v19);
        end;
        v2.reportFailure(v2.ErrorType.validateRenderMeshInsideOuterCageMesh_FailedToExecute, nil, v11);
        return false, {
            v19
        };
    else
        v14 = v14 * 100;
        if v14 < v4() then
            v2.reportFailure(v2.ErrorType.validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded, nil, v11);
            return false, {
                string.format("Validation detected %d%% of the accessory is outside its outer cage. Make adjustments to have more of the accessory placed between the cages", 100 - math.floor(v14))
            };
        else
            v2.recordScriptTime(script.Name, v12, v11);
            return true;
        end;
    end;
end;