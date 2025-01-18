local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getFIntUGCLCCagingRelevancyMinimum);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v8, v9, v10, v11, v12, v13) --[[ Line: 15 ]] --[[ Name: validateLCCagingRelevancy ]]
    -- upvalues: v7 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy), v2 (copy), v6 (copy)
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    if v7() and v5() then
        local v17, v18, v19 = v4(function() --[[ Line: 25 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
            return l_UGCValidationService_0:GetEditableCagingRelevancyMetrics(v8.editableMesh, v9.editableMesh, v10.editableMesh, v11, v12);
        end, v13);
        v14 = v17;
        v15 = v18;
        v16 = v19;
    else
        local v20, v21, v22 = pcall(function() --[[ Line: 35 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy)
            return l_UGCValidationService_0:GetCagingRelevancyMetrics(v8.contentId, v9.contentId, v10.contentId, v11, v12);
        end);
        v14 = v20;
        v15 = v21;
        v16 = v22;
    end;
    if not v14 then
        v2.reportFailure(v2.ErrorType.validateCagingRelevancy_FailedToExecute, nil, v13);
        return false, {
            string.format("Failed to execute cage relevancy detection for '%s'. Make sure the cage mesh exists and try again.", v10.fullName)
        };
    elseif v16 == 0 then
        return true;
    else
        local v23 = math.floor(100 * v15 / v16);
        if v23 < v6() then
            v2.reportFailure(v2.ErrorType.validateCagingRelevancy_IrrelevantCaging, nil, v13);
            return false, {
                string.format("Validation detected %d%% of the outer cage edits do not cover the accessory. Make sure you are moving the outer cage only where needed.", 100 - v23)
            };
        else
            return true;
        end;
    end;
end;