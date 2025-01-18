local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v3 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTotalSurfaceAreaTest);
local v4 = require(l_Parent_0.flags.getFIntMaxTotalSurfaceArea);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidateFixTotalSurfaceAreaTestErrorString);
local _ = require(l_Parent_0.util.Types);
local v7 = require(l_Parent_0.util.pcallDeferred);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v9 = require(l_Parent_0.Analytics);
return function(v10, v11, v12) --[[ Line: 28 ]] --[[ Name: validateTotalSurfaceArea ]]
    -- upvalues: v3 (copy), v2 (copy), v8 (copy), v7 (copy), l_UGCValidationService_0 (copy), v9 (copy), v4 (copy), v5 (copy)
    if not v3() then
        return true;
    else
        local v13 = tick();
        local l_isServer_0 = v12.isServer;
        local v15 = nil;
        local v16 = nil;
        if v2() and v8() then
            local v17, v18 = v7(function() --[[ Line: 43 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v10 (copy), v11 (copy)
                return l_UGCValidationService_0:CalculateEditableMeshTotalSurfaceArea(v10.editableMesh, v11);
            end, v12);
            v15 = v17;
            v16 = v18;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 47 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v10 (copy), v11 (copy)
                return l_UGCValidationService_0:CalculateTotalSurfaceArea(v10.contentId, v11);
            end);
            v15 = l_status_0;
            v16 = l_result_0;
        end;
        if not v15 then
            local v21 = string.format("Failed to execute max total surface area check for '%s'. Make sure mesh exists and try again.", v10.fullName);
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(v21);
            end;
            v9.reportFailure(v9.ErrorType.validateTotalSurfaceArea_FailedToExecute, nil, v12);
            return false, {
                v21
            };
        elseif v4() < v16 then
            v9.reportFailure(v9.ErrorType.validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded, nil, v12);
            return false, {
                if v5() then string.format("The total surface area of model mesh '%s' is %.2f, it cannot be greater than %d. You must reduce the number and/or size of all triangles.", v10.fullName, v16, v4()) else string.format("The total surface area of model mesh '%s' is greater than %d. You must reduce the number and/or size of all triangles.", v10.fullName, v4())
            };
        else
            v9.recordScriptTime(script.Name, v13, v12);
            return true;
        end;
    end;
end;