local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.Analytics);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v7, v8) --[[ Line: 13 ]] --[[ Name: validateFullBodyCageDeletion ]]
    -- upvalues: v6 (copy), v4 (copy), v3 (copy), l_UGCValidationService_0 (copy), v5 (copy)
    local v9 = tick();
    local l_isServer_0 = v8.isServer;
    local v11 = nil;
    local v12 = nil;
    if v6() and v4() then
        local v13, v14 = v3(function() --[[ Line: 23 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshFullBodyCageDeletion(v7.editableMesh);
        end, v8);
        v11 = v13;
        v12 = v14;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 27 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy)
            return l_UGCValidationService_0:ValidateFullBodyCageDeletion(v7.contentId);
        end);
        v11 = l_status_0;
        v12 = l_result_0;
    end;
    if not v11 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute body cage detection for '%s'. Make sure the cage mesh exists and try again.", v7.fullName));
        end;
        v5.reportFailure(v5.ErrorType.validateFullBodyCageDeletion_FailedToExecute, nil, v8);
        return false, {
            string.format("Failed to execute cage detection for '%s'. Make sure the cage mesh exists and try again.", v7.fullName)
        };
    elseif not v12 then
        v5.reportFailure(v5.ErrorType.validateFullBodyCageDeletion_GeometryRemoved, nil, v8);
        return false, {
            string.format("Missing cage for '%s'. You need to provide a cage mesh for each of the 15 body parts making up the R15 body.", v7.fullName)
        };
    else
        v5.recordScriptTime(script.Name, v9, v8);
        return true;
    end;
end;