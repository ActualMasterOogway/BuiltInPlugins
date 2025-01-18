local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateCageUVTriangleArea);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v7 = require(l_Parent_0.Analytics);
return function(v8, v9) --[[ Line: 18 ]] --[[ Name: validateCageUVTriangleArea ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), v3 (copy), l_UGCValidationService_0 (copy), v7 (copy)
    local v10 = tick();
    local l_isServer_0 = v9.isServer;
    if v5() then
        local v12 = nil;
        local v13 = nil;
        if v6() and v4() then
            local v14, v15 = v3(function() --[[ Line: 29 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v8 (copy)
                return l_UGCValidationService_0:ValidateEditableMeshCageUVTriangleArea(v8.editableMesh);
            end, v9);
            v12 = v14;
            v13 = v15;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v8 (copy)
                return l_UGCValidationService_0:ValidateCageUVTriangleArea(v8.contentId);
            end);
            v12 = l_status_0;
            v13 = l_result_0;
        end;
        if not v12 then
            if l_isServer_0 then
                error(string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", v8.fullName));
            end;
            v7.reportFailure(v7.ErrorType.validateCageUVTriangleArea_FailedToLoadMesh, nil, v9);
            return false, {
                string.format("Failed to load UVs for '%s'. Make sure the model has a valid UV map and try again.", v8.fullName)
            };
        elseif not v13 then
            v7.reportFailure(v7.ErrorType.validateCageUVTriangleArea_ZeroAreaTriangle, nil, v9);
            return false, {
                string.format("Detected zero-area triangle in UV map of '%s'. You need to edit the UV map to fix this issue.", v8.fullName)
            };
        end;
    end;
    v7.recordScriptTime(script.Name, v10, v9);
    return true;
end;