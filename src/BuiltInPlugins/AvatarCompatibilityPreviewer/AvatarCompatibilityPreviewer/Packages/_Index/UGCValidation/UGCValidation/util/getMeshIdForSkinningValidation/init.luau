local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local l_MeshId_0 = v2.MeshId;
    if not v3 then
        return l_MeshId_0;
    else
        local l_v2_Attribute_0 = v2:GetAttribute(v1.AlternateMeshIdAttributeName);
        if l_v2_Attribute_0 and l_v2_Attribute_0 ~= "" then
            return l_v2_Attribute_0;
        else
            return l_MeshId_0;
        end;
    end;
end;