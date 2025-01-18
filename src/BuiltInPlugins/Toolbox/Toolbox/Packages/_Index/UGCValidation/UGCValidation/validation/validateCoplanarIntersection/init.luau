local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v3 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateCoplanarTriTest);
local v4 = require(l_Parent_0.flags.getFIntMaxCoplanarIntersectionsPercentage);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.pcallDeferred);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v8 = require(l_Parent_0.Analytics);
local function v19(v9, v10, v11) --[[ Line: 25 ]] --[[ Name: getTriangleCount ]]
    -- upvalues: v2 (copy), v7 (copy), v6 (copy), l_UGCValidationService_0 (copy), v8 (copy)
    local v12 = nil;
    local v13 = nil;
    if v2() and v7() then
        local v14, v15 = v6(function() --[[ Line: 32 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v9 (copy)
            return l_UGCValidationService_0:GetEditableMeshTriCount(v9.editableMesh);
        end, v10);
        v12 = v14;
        v13 = v15;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 36 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v9 (copy)
            return l_UGCValidationService_0:GetMeshTriCount(v9.contentId);
        end);
        v12 = l_status_0;
        v13 = l_result_0;
    end;
    if not v12 then
        local v18 = string.format("Failed to load model mesh %s. Make sure the mesh exists and try again.", v9.fullName);
        v8.reportFailure(v8.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, v10);
        if v11 ~= nil and v11 then
            error(v18);
        end;
        return false, {
            v18
        };
    else
        return true, nil, v13;
    end;
end;
return function(v20, v21, v22) --[[ Line: 60 ]] --[[ Name: validateCoplanarIntersection ]]
    -- upvalues: v3 (copy), v19 (copy), v4 (copy), v2 (copy), v7 (copy), v6 (copy), l_UGCValidationService_0 (copy), v8 (copy)
    if not v3() then
        return true;
    else
        local v23 = tick();
        local l_isServer_0 = v22.isServer;
        local v25, v26, v27 = v19(v20, v22, l_isServer_0);
        if not v25 then
            return false, v26;
        else
            local v28 = math.floor(v4() / 100 * v27);
            local v29 = nil;
            local v30 = nil;
            if v2() and v7() then
                local v31, v32 = v6(function() --[[ Line: 84 ]]
                    -- upvalues: l_UGCValidationService_0 (ref), v20 (copy), v28 (copy), v21 (copy)
                    return l_UGCValidationService_0:IsEditableMeshNumCoplanarIntersectionsOverLimit(v20.editableMesh, v28, v21, true);
                end, v22);
                v29 = v31;
                v30 = v32;
            else
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 93 ]]
                    -- upvalues: l_UGCValidationService_0 (ref), v20 (copy), v28 (copy), v21 (copy)
                    return l_UGCValidationService_0:IsNumCoplanarIntersectionsOverLimit(v20.contentId, v28, v21, true);
                end);
                v29 = l_status_1;
                v30 = l_result_1;
            end;
            if not v29 then
                local v35 = string.format("Failed to execute coplanar triangle intersection check for '%s'. Make sure mesh exists and try again.", v20.fullName);
                if l_isServer_0 ~= nil and l_isServer_0 then
                    error(v35);
                end;
                v8.reportFailure(v8.ErrorType.validateCoplanarIntersection_FailedToExecute, nil, v22);
                return false, {
                    v35
                };
            elseif v30 then
                v8.reportFailure(v8.ErrorType.validateCoplanarIntersection_CoplanarIntersection, nil, v22);
                return false, {
                    string.format("Detected too many coplanar triangles intersecting in model mesh '%s'. The maximum is %d intersections in a %d triangle mesh. Edit your mesh to reduce the number of coplanar triangle intersections.", v20.fullName, v28, v27)
                };
            else
                v8.recordScriptTime(script.Name, v23, v22);
                return true;
            end;
        end;
    end;
end;