local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.Analytics);
local v4 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: validateCageNonManifoldAndHoles ]]
    -- upvalues: v4 (copy), l_UGCValidationService_0 (copy), v3 (copy)
    local v7 = nil;
    local v8 = nil;
    local v9 = nil;
    if v4() then
        local v10, v11, v12 = pcall(function() --[[ Line: 18 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
            return l_UGCValidationService_0:ValidateEditableMeshCageNonManifoldAndHoles(v5.editableMesh);
        end);
        v7 = v10;
        v8 = v11;
        v9 = v12;
    else
        local v13, v14, v15 = pcall(function() --[[ Line: 22 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v5 (copy)
            return l_UGCValidationService_0:ValidateCageNonManifoldAndHoles(v5.contentId);
        end);
        v7 = v13;
        v8 = v14;
        v9 = v15;
    end;
    if not v7 then
        v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_FailedToExecute, nil, v6);
        return false, {
            string.format("Failed to execute cage non-manifold check for '%s'. Make sure cage mesh exists and try again.", v5.fullName)
        };
    else
        local v16 = {};
        local v17 = true;
        if not v8 then
            v17 = false;
            v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_NonManifold, nil, v6);
            table.insert(v16, string.format("'%s' is non-manifold (i.e. there are edges with 3 or more incident faces). Some vertices are likely too close and welded together as a single vertex causing edges to collapse into a non-manifold. You need to edit the cage mesh so that vertices aren't too close together.", v5.fullName));
        end;
        if not v9 then
            v17 = false;
            v3.reportFailure(v3.ErrorType.validateCageNonManifoldAndHoles_CageHoles, nil, v6);
            table.insert(v16, string.format("'%s' is not watertight (i.e. detected holes in the mesh). You need to edit the mesh and close the holes (may leave eyes and mouth areas open when applicable).", v5.fullName));
        end;
        return v17, v16;
    end;
end;