local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getFIntUGCValidationVertexDensityThreshold);
local v7 = require(l_Parent_0.Analytics);
return function(v8, v9, v10) --[[ Line: 15 ]] --[[ Name: validateMaxCubeDensity ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy), v7 (copy), v6 (copy)
    local v11 = tick();
    local l_isServer_0 = v9.isServer;
    local v13 = nil;
    local v14 = nil;
    if v2() and v5() then
        local v15, v16 = v4(function() --[[ Line: 25 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v10 (copy)
            return l_UGCValidationService_0:GetEditableMeshMaxNearbyVerticesCollisions(v8.editableMesh, v10);
        end, v9);
        v13 = v15;
        v14 = v16;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 29 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v10 (copy)
            return l_UGCValidationService_0:GetMaxNearbyVerticesCollisions(v8.contentId, v10);
        end);
        v13 = l_status_0;
        v14 = l_result_0;
    end;
    if not v13 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", v8.fullName));
        end;
        v7.reportFailure(v7.ErrorType.validateVertexDensity_FailedToExecute, nil, v9);
        return false, {
            string.format("Failed to execute vertex density check for '%s'. Make sure mesh exists and try again.", v8.fullName)
        };
    elseif v6() < v14 then
        v7.reportFailure(v7.ErrorType.validateVertexDensity_MaxDensityExceeded, nil, v9);
        return false, {
            "The maximum vertex density has been exceeded. Reduce the number of vertices that are very close to each other."
        };
    else
        v7.recordScriptTime(script.Name, v11, v9);
        return true;
    end;
end;