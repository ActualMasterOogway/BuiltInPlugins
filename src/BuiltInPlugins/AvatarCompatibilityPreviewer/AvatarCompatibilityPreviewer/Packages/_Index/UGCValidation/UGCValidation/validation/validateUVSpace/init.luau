local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: validateUVSpace ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v2 (copy)
    local v7 = nil;
    local v8 = nil;
    if v4() then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshUVSpace(v5.editableMesh);
        end);
        v7 = l_status_0;
        v8 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 22 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
            return l_UGCValidationService_0:ValidateUVSpace(v5.contentId);
        end);
        v7 = l_status_1;
        v8 = l_result_1;
    end;
    if not v7 then
        v2.reportFailure(v2.ErrorType.validateUVSpace_FailedToExecute, nil, v6);
        return false, {
            string.format("Failed to execute validateUVSpace check on '%s'. Make sure the UV maps exists and try again.", v5.fullName)
        };
    elseif not v8 then
        v2.reportFailure(v2.ErrorType.validateUVSpace_InvalidUVSpace, nil, v6);
        return false, {
            string.format("Detected modified UV values for '%s'. The original UV map for this model can't be altered.", v5.fullName)
        };
    else
        return true;
    end;
end;