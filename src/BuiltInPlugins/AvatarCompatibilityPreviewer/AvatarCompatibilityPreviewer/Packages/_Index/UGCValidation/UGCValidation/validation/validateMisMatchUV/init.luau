local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v5, v6, v7) --[[ Line: 12 ]] --[[ Name: validateMisMatchUV ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v2 (copy)
    assert(v5.context == v6.context);
    local v8 = nil;
    local v9 = nil;
    if v4() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v5 (copy), v6 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshMisMatchUV(v5.editableMesh, v6.editableMesh);
        end);
        v8 = l_status_0;
        v9 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 28 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v5 (copy), v6 (copy)
            return l_UGCValidationService_0:ValidateMisMatchUV(v5.contentId, v6.contentId);
        end);
        v8 = l_status_1;
        v9 = l_result_1;
    end;
    if not v8 then
        v2.reportFailure(v2.ErrorType.validateMisMatchUV_FailedToExecute, nil, v7);
        return false, {
            string.format("Failed to execute UV mismatch check for '%s'. Make sure UV map exists and try again.", v5.context)
        };
    elseif not v9 then
        v2.reportFailure(v2.ErrorType.validateMisMatchUV_UVMismatch, nil, v7);
        return false, {
            string.format("Inner and Outer cage UV for '%s' are mismatched. The Roblox provided cage template should be used to create inner and outer cages with no modifications to the UV map.", v5.context)
        };
    else
        return true;
    end;
end;