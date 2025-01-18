local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v6 = require(l_Parent_0.flags.getFIntUGCValidateCageDuplicateUVThreshold);
local v7 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v8 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v10, v11, v12, v13) --[[ Line: 24 ]] --[[ Name: validateCageUVDuplicates ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v8 (copy), v6 (copy), v7 (copy)
    local v14 = {};
    for _, v16 in pairs(v4) do
        for _, v18 in pairs(v16) do
            table.insert(v14, v18);
        end;
    end;
    local function v28(v19, v20, v21) --[[ Line: 37 ]] --[[ Name: checkCageUV ]]
        -- upvalues: v5 (ref), v3 (ref), v2 (ref), l_UGCValidationService_0 (ref), v13 (copy), v8 (ref), v12 (copy), v6 (ref)
        local v22 = nil;
        local v23 = nil;
        if v5() and v3() then
            local v24, v25 = v2(function() --[[ Line: 44 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v19 (copy), v20 (copy)
                return l_UGCValidationService_0:ValidateEditableMeshUVDuplicates(v19, v20.editableMesh);
            end, v13);
            v22 = v24;
            v23 = v25;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 51 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v19 (copy), v20 (copy)
                return l_UGCValidationService_0:validateUVDuplicates(v19, v20.contentId);
            end);
            v22 = l_status_0;
            v23 = l_result_0;
        end;
        if not v22 then
            v8.reportFailure(v8.ErrorType.validateCageUVDuplicate_FailedToExecute, nil, v13);
            return false, {
                (string.format("Failed to load UVs for Inner cage of '%s'. Make sure the UV map exists and try again.", v12.fullName))
            };
        elseif v6() < v23 then
            v8.reportFailure(v8.ErrorType.validateCageUVDuplicate_UnexpectedUVValue, nil, v13);
            return false, {
                string.format("There are %d UV values in %s cage that do not belong to the template. Please correct the cage UV.", v23, v21 and "inner" or "outer")
            };
        else
            return true;
        end;
    end;
    local v29 = v7.new();
    v29:updateReasons(v28(v14, v10, true));
    v29:updateReasons(v28(v14, v11, false));
    return v29:getFinalResults();
end;