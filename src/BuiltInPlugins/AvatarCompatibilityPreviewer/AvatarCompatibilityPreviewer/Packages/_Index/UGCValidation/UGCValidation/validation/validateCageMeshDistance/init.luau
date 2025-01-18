local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getFIntUGCValidateCageMeshDistanceThreshold);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v8, v9, v10, v11, v12, v13) --[[ Line: 22 ]] --[[ Name: validateCageMeshDistance ]]
    -- upvalues: v7 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v6 (copy)
    local v14 = nil;
    local v15 = nil;
    if v7() and v5() then
        local v16, v17 = v4(function() --[[ Line: 32 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
            return l_UGCValidationService_0:CalculateAverageEditableCageMeshDistance(v8.editableMesh, v9.editableMesh, v10.editableMesh, v11, v12);
        end, v13);
        v14 = v16;
        v15 = v17;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 42 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
            return l_UGCValidationService_0:CalculateAverageCageMeshDistance(v8.contentId, v9.contentId, v10.contentId, v11, v12);
        end);
        v14 = l_status_0;
        v15 = l_result_0;
    end;
    if not v14 then
        v2.reportFailure(v2.ErrorType.validateCageMeshDistance_FailedToExecute, nil, v13);
        return false, {
            string.format("Failed to execute cage mesh distance validation for '%s'. Make sure the cage mesh exists and try again.", v10.fullName)
        };
    else
        local v20 = {};
        local v21 = true;
        if v15 * 100 > v6() or v15 < 0 then
            v21 = false;
            v2.reportFailure(v2.ErrorType.validateCageMeshDistance_OuterCageToMeshDistance, nil, v13);
            if v15 < 0 then
                table.insert(v20, "Average distance between outer cage to mesh is too high. Mesh seems to be outside of the outer cage.");
            else
                table.insert(v20, string.format("Average distance between outer cage to mesh is too high (%.2f). Make adjustment to cage to fit the mesh better.", v15));
            end;
        end;
        return v21, v20;
    end;
end;