local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local _ = require(l_Parent_0.util.Types);
local v4 = require(l_Parent_0.util.pcallDeferred);
local v5 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v6 = require(l_Parent_0.flags.getFIntUGCLCCageVerticesSimilarityMaximum);
local v7 = require(l_Parent_0.Analytics);
return function(v8, v9, v10, v11) --[[ Line: 18 ]] --[[ Name: validateVerticesSimilarity ]]
    -- upvalues: v2 (copy), v5 (copy), v4 (copy), l_UGCValidationService_0 (copy), v7 (copy), v6 (copy)
    local v12 = tick();
    local l_isServer_0 = v9.isServer;
    local v14 = nil;
    local v15 = nil;
    if v2() and v5() then
        local v16, v17 = v4(function() --[[ Line: 30 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v10 (copy)
            return l_UGCValidationService_0:GetEditableMeshVerticesSimilarityRate(v8.editableMesh, v10);
        end, v9);
        v14 = v16;
        v15 = v17;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v8 (copy), v10 (copy)
            return l_UGCValidationService_0:GetMeshVerticesSimilarityRate(v8.contentId, v10);
        end);
        v14 = l_status_0;
        v15 = l_result_0;
    end;
    if not v14 then
        if l_isServer_0 ~= nil and l_isServer_0 then
            error(string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", v8.fullName));
        end;
        v7.reportFailure(v7.ErrorType.validateVerticesSimilarity_FailedToExecute, nil, v9);
        return false, {
            string.format("Failed to execute similarity mesh vertex check for '%s'. Make sure mesh exists and try again.", v8.fullName)
        };
    else
        v15 = math.floor(v15 * 100);
        if v6() < v15 then
            v7.reportFailure(v7.ErrorType.validateVerticesSimilarity_MaxSimilarityExceeded, nil, v9);
            return false, {
                string.format("%s has %d%% of vertices too close to each other. Please edit the vertices to have at most %d%% coincident or close to one another.", v11, v15, v6())
            };
        else
            v7.recordScriptTime(script.Name, v12, v9);
            return true;
        end;
    end;
end;