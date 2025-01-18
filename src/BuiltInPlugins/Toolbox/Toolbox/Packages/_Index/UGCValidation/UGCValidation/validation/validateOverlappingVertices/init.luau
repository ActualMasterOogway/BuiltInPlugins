local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.Analytics);
return function(v7, v8) --[[ Line: 14 ]] --[[ Name: validateOverlappingVertices ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy), v6 (copy)
    local v9 = tick();
    local l_isServer_0 = v8.isServer;
    local v11 = nil;
    local v12 = nil;
    if v2() and v5() then
        local v13, v14 = v4(function() --[[ Line: 24 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshOverlappingVertices(v7.editableMesh);
        end, v8);
        v11 = v13;
        v12 = v14;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 28 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy)
            return l_UGCValidationService_0:ValidateOverlappingVertices(v7.contentId);
        end);
        v11 = l_status_0;
        v12 = l_result_0;
    end;
    if not v11 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute overlapping mesh vertex check for '%s'. Make sure mesh exists and try again.", v7.fullName));
        end;
        v6.reportFailure(v6.ErrorType.validateOverlappingVertices_FailedToExecute, nil, v8);
        return false, {
            string.format("Failed to execute overlapping mesh vertex check for '%s'. Make sure mesh exists and try again.", v7.fullName)
        };
    elseif not v12 then
        v6.reportFailure(v6.ErrorType.validateOverlappingVertices_OverlappingVertices, nil, v8);
        return false, {
            string.format("Detected two or more vertices in model mesh '%s' sharing near identical positions. You need to position vertices further apart from each other.", v7.fullName)
        };
    else
        v6.recordScriptTime(script.Name, v9, v8);
        return true;
    end;
end;