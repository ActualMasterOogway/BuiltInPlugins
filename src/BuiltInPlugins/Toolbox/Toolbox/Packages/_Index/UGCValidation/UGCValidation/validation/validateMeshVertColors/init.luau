local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.Analytics);
return function(v7, v8, v9) --[[ Line: 15 ]] --[[ Name: validateMeshVertexColors ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy), v6 (copy)
    local v10 = tick();
    local l_isServer_0 = v9.isServer;
    local v12 = nil;
    local v13 = nil;
    if v2() and v5() then
        local v14, v15 = v4(function() --[[ Line: 26 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshVertColors(v7.editableMesh, v8);
        end, v9);
        v12 = v14;
        v13 = v15;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v7 (copy), v8 (copy)
            return l_UGCValidationService_0:ValidateMeshVertColors(v7.contentId, v8);
        end);
        v12 = l_status_0;
        v13 = l_result_0;
    end;
    if not v12 then
        v6.reportFailure(v6.ErrorType.validateMeshVertexColors_FailedToLoadMesh, nil, v9);
        local v18 = string.format("Failed to load vertex color map for model mesh %s. Make sure it exists and try again.", v7.fullName);
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(v18);
        end;
        return false, {
            v18
        };
    elseif not v13 then
        v6.reportFailure(v6.ErrorType.validateMeshVertexColors_NonNeutralVertexColors, nil, v9);
        return false, {
            string.format("Invalid vertex color found in mesh model '%s'. You need to edit the color map to be all white %s and try again.", v7.fullName, v8 and "with no transarency" or "")
        };
    else
        v6.recordScriptTime(script.Name, v10, v9);
        return true;
    end;
end;