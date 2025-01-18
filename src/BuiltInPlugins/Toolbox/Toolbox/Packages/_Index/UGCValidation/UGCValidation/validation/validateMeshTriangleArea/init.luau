local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateMeshTriangleArea);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v8, v9) --[[ Line: 18 ]] --[[ Name: validateMeshTriangleArea ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v4 (copy)
    local v10 = tick();
    local v11 = if v9 then v9.isServer else nil;
    if v5() then
        local v12 = nil;
        local v13 = nil;
        if v6() and v3() then
            local v14, v15 = v2(function() --[[ Line: 29 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v8 (copy)
                return l_UGCValidationService_0:ValidateEditableMeshTriangleArea(v8.editableMesh);
            end, v9);
            v12 = v14;
            v13 = v15;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v8 (copy)
                return l_UGCValidationService_0:validateMeshTriangleArea(v8.contentId);
            end);
            v12 = l_status_0;
            v13 = l_result_0;
        end;
        if not v12 then
            v4.reportFailure(v4.ErrorType.validateMeshTriangleArea_FailedToLoadMesh, nil, v9);
            if v11 then
                error(string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", v8.fullName));
            end;
            return false, {
                string.format("Failed to load model mesh %s. Make sure mesh exists and try again.", v8.fullName)
            };
        elseif not v13 then
            v4.reportFailure(v4.ErrorType.validateMeshTriangleArea_NoArea, nil, v9);
            return false, {
                string.format("Detected zero-area triangle in model mesh %s. You need to edit the mesh to remove zero-area triangles.", v8.fullName)
            };
        end;
    end;
    v4.recordScriptTime(script.Name, v10, v9);
    return true;
end;