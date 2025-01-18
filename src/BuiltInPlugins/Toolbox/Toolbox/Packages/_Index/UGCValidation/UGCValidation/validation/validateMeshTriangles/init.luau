local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.Analytics);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v8 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsExtendedMeshTests);
local v9 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v10, v11, v12) --[[ Line: 18 ]] --[[ Name: validateMeshTriangles ]]
    -- upvalues: v7 (copy), v8 (copy), v9 (copy), v4 (copy), v3 (copy), l_UGCValidationService_0 (copy), v5 (copy), v6 (copy)
    local l_isServer_0 = v12.isServer;
    if v7() and v8() then
        local v14 = nil;
        local v15 = nil;
        if v9() and v4() then
            local v16, v17 = v3(function() --[[ Line: 28 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v10 (copy)
                return l_UGCValidationService_0:ValidateEditableMeshTriangles(v10.editableMesh);
            end, v12);
            v14 = v16;
            v15 = v17;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 32 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v10 (copy)
                return l_UGCValidationService_0:ValidateMeshTriangles(v10.contentId);
            end);
            v14 = l_status_0;
            v15 = l_result_0;
        end;
        if not v14 then
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_FailedToExecute, nil, v12);
            if l_isServer_0 ~= nil and l_isServer_0 then
                error("Failed to execute validateMeshTriangles check");
            end;
            return false, {
                "Failed to execute validateMeshTriangles check"
            };
        elseif not v15 then
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_TooManyTriangles, nil, v12);
            return false, {
                "Your mesh exceeds the max triangle limit for UGC upload requirements."
            };
        end;
    else
        local v20 = nil;
        local v21 = nil;
        if v9() and v4() then
            local v22, v23 = v3(function() --[[ Line: 55 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v10 (copy)
                return l_UGCValidationService_0:GetEditableMeshTriCount(v10.editableMesh);
            end, v12);
            v20 = v22;
            v21 = v23;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 59 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v10 (copy)
                return l_UGCValidationService_0:GetMeshTriCount(v10.contentId);
            end);
            v20 = l_status_1;
            v21 = l_result_1;
        end;
        if v11 == nil then
            v11 = v6.MAX_HAT_TRIANGLES;
        end;
        if not v20 then
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_FailedToLoadMesh, nil, v12);
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v10.fullName));
            end;
            return false, {
                string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v10.fullName)
            };
        elseif v11 < v21 then
            v5.reportFailure(v5.ErrorType.validateMeshTriangles_TooManyTriangles, nil, v12);
            return false, {
                string.format("Model mesh %s resolution of %d is higher than max support value of %d. You need to retopologize your model and try again.", v10.fullName, v21, v11)
            };
        end;
    end;
    return true;
end;