local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.getEditableMeshFromContext);
local v3 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
return function(v4, v5) --[[ Line: 15 ]] --[[ Name: getMeshInfo ]]
    -- upvalues: v3 (copy), v2 (copy)
    local l_v4_FullName_0 = v4:GetFullName();
    local v7 = nil;
    if v3() then
        local v8 = nil;
        local v9, v10 = v2(v4, "MeshId", v5);
        v8 = v9;
        v7 = v10;
        if not v8 then
            return false, {
                string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", l_v4_FullName_0)
            };
        end;
    end;
    return true, nil, {
        fullName = l_v4_FullName_0, 
        fieldName = "MeshId", 
        contentId = v4.MeshId, 
        context = v4.ClassName, 
        editableMesh = v7
    };
end;