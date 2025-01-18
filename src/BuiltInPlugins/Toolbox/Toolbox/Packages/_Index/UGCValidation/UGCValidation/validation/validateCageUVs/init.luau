local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v7 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateCalculateUniqueUV);
local v8 = require(l_Parent_0.flags.getFIntUniqueUVTolerance);
local v9 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
return function(v11, v12, v13) --[[ Line: 25 ]] --[[ Name: validateCageUVs ]]
    -- upvalues: v6 (copy), v5 (copy), v7 (copy), v9 (copy), v3 (copy), v2 (copy), l_UGCValidationService_0 (copy), v8 (copy), v4 (copy)
    local v14 = tick();
    local l_isServer_0 = v13.isServer;
    if not v6() then
        return true;
    else
        local v16 = assert(v5.WRAP_TARGET_CAGE_MESH_UV_COUNTS[v12.Parent.Name], "WrapTarget is not parented to a MeshPart");
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        if v7() then
            if v9() and v3() then
                local v20, v21 = v2(function() --[[ Line: 47 ]]
                    -- upvalues: v19 (ref), l_UGCValidationService_0 (ref), v11 (copy), v16 (copy), v8 (ref)
                    v19 = l_UGCValidationService_0:CalculateEditableMeshUniqueUVCount(v11.editableMesh);
                    return math.abs(v19 - v16) <= v8();
                end, v13);
                v17 = v20;
                v18 = v21;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
                    -- upvalues: v19 (ref), l_UGCValidationService_0 (ref), v11 (copy), v16 (copy), v8 (ref)
                    v19 = l_UGCValidationService_0:CalculateUniqueUVCount(v11.contentId);
                    return math.abs(v19 - v16) <= v8();
                end);
                v17 = l_status_0;
                v18 = l_result_0;
            end;
        elseif v9() and v3() then
            local v25, v26 = v2(function() --[[ Line: 60 ]]
                -- upvalues: v8 (ref), l_UGCValidationService_0 (ref), v11 (copy), v16 (copy)
                for v24 = 0, v8() do
                    if l_UGCValidationService_0:ValidateEditableMeshUniqueUVCount(v11.editableMesh, v16 + v24) then
                        return true;
                    elseif v24 ~= 0 and v16 - v24 >= 0 and l_UGCValidationService_0:ValidateEditableMeshUniqueUVCount(v11.editableMesh, v16 - v24) then
                        return true;
                    end;
                end;
                return false;
            end, v13);
            v17 = v25;
            v18 = v26;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 87 ]]
                -- upvalues: v8 (ref), l_UGCValidationService_0 (ref), v11 (copy), v16 (copy)
                for v27 = 0, v8() do
                    if l_UGCValidationService_0:ValidateUniqueUVCount(v11.contentId, v16 + v27) then
                        return true;
                    elseif v27 ~= 0 and v16 - v27 >= 0 and l_UGCValidationService_0:ValidateUniqueUVCount(v11.contentId, v16 - v27) then
                        return true;
                    end;
                end;
                return false;
            end);
            v17 = l_status_1;
            v18 = l_result_1;
        end;
        if not v17 then
            local v30 = string.format("Failed to execute UV check for '%s'. Make sure the UV map exists and try again.", v12:GetFullName());
            if l_isServer_0 then
                error(v30);
            end;
            v4.reportFailure(v4.ErrorType.validateCageUVs_TestExecutedSuccessfully, nil, v13);
            return false, {
                v30
            };
        elseif not v18 then
            v4.reportFailure(v4.ErrorType.validateCageUVs_TestPassed, nil, v13);
            return false, {
                string.format("%s.%s ( %s ) should have %d unique UVs, but has %d. Please make sure the mesh has the required number of unique UVs and try again.", v12:GetFullName(), v11.fieldName, if v11.contentId then v11.contentId else "", v16, v19)
            };
        else
            v4.recordScriptTime(script.Name, v14, v13);
            return true;
        end;
    end;
end;