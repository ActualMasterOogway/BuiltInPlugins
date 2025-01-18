local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.WrapTargetCageUVReferenceValues);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateUVValuesInReference);
local v7 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v8 = require(l_Parent_0.Analytics);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v10, v11, v12) --[[ Line: 26 ]] --[[ Name: validateCageUVValues ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy), v7 (copy), v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v8 (copy)
    local v13 = tick();
    local l_isServer_0 = v12.isServer;
    if not v5() then
        return true;
    elseif not v6() then
        return true;
    else
        local v15 = assert(v4[v11.Parent.Name], "WrapTarget is not parented to a MeshPart");
        local v16 = nil;
        local v17 = nil;
        if v7() and v3() then
            local v18, v19 = v2(function() --[[ Line: 49 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v15 (copy), v10 (copy)
                return l_UGCValidationService_0:ValidateEditableMeshUVValuesInReference(v15, v10.editableMesh);
            end, v12);
            v16 = v18;
            v17 = v19;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 56 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v15 (copy), v10 (copy)
                return l_UGCValidationService_0:ValidateUVValuesInReference(v15, v10.contentId);
            end);
            v16 = l_status_0;
            v17 = l_result_0;
        end;
        if not v16 then
            v8.reportFailure(v8.ErrorType.validateCageUVValues_FailedToLoadMesh, nil, v12);
            local v22 = string.format("Failed to load UVs for '%s'. Make sure the UV map exists and try again.", v11:GetFullName());
            if l_isServer_0 then
                error(v22);
            end;
            return false, {
                v22
            };
        elseif not v17 then
            v8.reportFailure(v8.ErrorType.validateCageUVValues_UnexpectedUVValue, nil, v12);
            return false, {
                string.format("Found invalid UV value outside [0, 1] range for '%s'. You need to edit the UV map to fix this issue.", v11:GetFullName())
            };
        else
            v8.recordScriptTime(script.Name, v13, v12);
            return true;
        end;
    end;
end;