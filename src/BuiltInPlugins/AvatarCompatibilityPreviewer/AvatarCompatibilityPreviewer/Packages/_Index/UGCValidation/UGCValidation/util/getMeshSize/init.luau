local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v4) --[[ Line: 10 ]] --[[ Name: getMeshSize ]]
    -- upvalues: v3 (copy), l_UGCValidationService_0 (copy)
    local v5 = nil;
    v5 = if v3() then l_UGCValidationService_0:GetEditableMeshVerts(v4.editableMesh) else l_UGCValidationService_0:GetMeshVerts(v4.contentId);
    local v6 = 1e999;
    local v7 = -1e999;
    local v8 = 1e999;
    local v9 = -1e999;
    local v10 = 1e999;
    local v11 = -1e999;
    for v12 = 1, #v5 do
        local v13 = v5[v12];
        v6 = math.min(v6, v13.X);
        v8 = math.min(v8, v13.Y);
        v10 = math.min(v10, v13.Z);
        v7 = math.max(v7, v13.X);
        v9 = math.max(v9, v13.Y);
        v11 = math.max(v11, v13.Z);
    end;
    return (Vector3.new(v7 - v6, v9 - v8, v11 - v10));
end;