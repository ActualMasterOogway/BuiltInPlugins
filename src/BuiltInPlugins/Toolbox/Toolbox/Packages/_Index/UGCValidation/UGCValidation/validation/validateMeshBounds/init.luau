local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidatePartSizeWithinRenderSizeLimits);
local v8 = require(l_Parent_0.Analytics);
local v9 = game:DefineFastFlag("UGCValidationPositionCheck", false);
local function v15(v10, v11, v12) --[[ Line: 20 ]] --[[ Name: pointInBounds ]]
    local v13 = v11:PointToObjectSpace(v10);
    local v14 = false;
    if v13.X >= -v12.X / 2 then
        v14 = false;
        if v13.X <= v12.X / 2 then
            v14 = false;
            if v13.Y >= -v12.Y / 2 then
                v14 = false;
                if v13.Y <= v12.Y / 2 then
                    v14 = false;
                    if v13.Z >= -v12.Z / 2 then
                        v14 = v13.Z <= v12.Z / 2;
                    end;
                end;
            end;
        end;
    end;
    return v14;
end;
local function _(v16, v17) --[[ Line: 30 ]] --[[ Name: isSizeWithinBounds ]]
    local v18 = false;
    if v16.Size.X <= v17.X then
        v18 = false;
        if v16.Size.Y <= v17.Y then
            v18 = v16.Size.Z <= v17.Z;
        end;
    end;
    return v18;
end;
local function _(v20) --[[ Line: 34 ]] --[[ Name: truncate ]]
    return math.floor(v20 * 100) / 100;
end;
local function v25(v22, v23, v24) --[[ Line: 38 ]] --[[ Name: getErrors ]]
    return {
        string.format("%s has size larger than max allowed bounding size. The max size for type %s is [%.2f, %.2f, %.2f]", v22, v23, math.floor(v24.X * 100) / 100, math.floor(v24.Y * 100) / 100, math.floor(v24.Z * 100) / 100)
    };
end;
return function(v26, v27, v28, v29, v30, v31, v32) --[[ Line: 51 ]] --[[ Name: validateMeshBounds ]]
    -- upvalues: v9 (copy), v5 (copy), v6 (copy), v4 (copy), v3 (copy), l_UGCValidationService_0 (copy), v8 (copy), v25 (copy), v15 (copy), v7 (copy)
    local l_isServer_0 = v32.isServer;
    local l_size_0 = v30.size;
    local v35 = v30.offset or Vector3.new(0, 0, 0, 0);
    local v36 = v26.CFrame * v27.CFrame * CFrame.new(v35);
    if v9 then
        if v26.Position.X > 10000 or v26.Position.X < -10000 or v26.Position.Y > 10000 or v26.Position.Y < -10000 or v26.Position.Z > 10000 or v26.Position.Z < -10000 then
            return false, {
                "Position is outside of bounds"
            };
        elseif v36.Position.X > 10000 or v36.Position.X < -10000 or v36.Position.Y > 10000 or v36.Position.Y < -10000 or v36.Position.Z > 10000 or v36.Position.Z < -10000 then
            return false, {
                "Position is outside of bounds"
            };
        end;
    end;
    if v5() then
        local v37 = nil;
        local v38 = nil;
        if v6() and v4() then
            local v39, v40 = v3(function() --[[ Line: 91 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v28 (copy), v29 (copy), v35 (copy), v27 (copy), v26 (copy)
                return l_UGCValidationService_0:ValidateEditableMeshBounds(v28.editableMesh, v29, v35, v27.CFrame, v26.CFrame);
            end, v32);
            v37 = v39;
            v38 = v40;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 101 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v28 (copy), v29 (copy), v35 (copy), v27 (copy), v26 (copy)
                return l_UGCValidationService_0:ValidateMeshBounds(v28.contentId, v29, v35, v27.CFrame, v26.CFrame);
            end);
            v37 = l_status_0;
            v38 = l_result_0;
        end;
        if not v37 then
            if l_isServer_0 ~= nil and l_isServer_0 then
                error("Failed to execute validateMeshBounds check");
            end;
            v8.reportFailure(v8.ErrorType.validateMeshBounds_FailedToExecute, nil, v32);
            return false, {
                "Failed to execute validateMeshBounds check"
            };
        elseif not v38 then
            v8.reportFailure(v8.ErrorType.validateMeshBounds_TooLarge, nil, v32);
            return false, (v25(v28.context, v31, l_size_0));
        end;
    else
        local v43 = nil;
        local v44 = nil;
        if v6() then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 130 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v28 (copy)
                return l_UGCValidationService_0:GetEditableMeshVerts(v28.editableMesh);
            end);
            v43 = l_status_1;
            v44 = l_result_1;
        else
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 134 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v28 (copy)
                return l_UGCValidationService_0:GetMeshVerts(v28.contentId);
            end);
            v43 = l_status_2;
            v44 = l_result_2;
        end;
        if not v43 then
            v8.reportFailure(v8.ErrorType.validateMeshBounds_FailedToLoadMesh, nil, v32);
            if l_isServer_0 ~= nil and l_isServer_0 then
                error(string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", v28.fullName));
            end;
            return false, {
                string.format("Failed to load body part mesh %s. Make sure body part exists and try again.", v28.fullName)
            };
        else
            for _, v50 in pairs(v44) do
                local v51 = v26.CFrame:PointToWorldSpace(v50 * v29);
                if not v15(v51, v36, l_size_0) then
                    v8.reportFailure(v8.ErrorType.validateMeshBounds_TooLarge, nil, v32);
                    return false, (v25(v28.context, v31, l_size_0));
                end;
            end;
        end;
    end;
    if v7() then
        local v52 = false;
        if v26.Size.X <= l_size_0.X then
            v52 = false;
            if v26.Size.Y <= l_size_0.Y then
                v52 = v26.Size.Z <= l_size_0.Z;
            end;
        end;
        if not v52 then
            v8.reportFailure(v8.ErrorType.validateMeshBounds_TooLarge, nil, v32);
            return false, (v25(v26:GetFullName(), v31, l_size_0));
        end;
    end;
    return true;
end;