local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.util.pcallDeferred);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v5 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v6, v7) --[[ Line: 18 ]] --[[ Name: getVerts ]]
    -- upvalues: v5 (copy), v4 (copy), v3 (copy), l_UGCValidationService_0 (copy)
    local l_isServer_0 = v7.isServer;
    local v9 = nil;
    local v10 = nil;
    if v5() and v4() then
        local v11, v12 = v3(function() --[[ Line: 26 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v6 (copy)
            return l_UGCValidationService_0:GetEditableMeshVerts(v6.editableMesh);
        end, v7);
        v9 = v11;
        v10 = v12;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v6 (copy)
            return l_UGCValidationService_0:GetMeshVerts(v6.contentId);
        end);
        v9 = l_status_0;
        v10 = l_result_0;
    end;
    if not v9 then
        local v15 = "Failed to read mesh: " .. v6.fullName;
        if l_isServer_0 then
            error(v15);
        end;
        return false, {
            v15
        };
    else
        return true, nil, v10;
    end;
end;