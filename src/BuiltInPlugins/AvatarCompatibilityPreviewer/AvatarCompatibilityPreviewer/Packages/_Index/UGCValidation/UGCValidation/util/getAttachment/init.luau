local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateRigidMeshPartAccessories);
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: getAttachment ]]
    -- upvalues: v1 (copy)
    for _, v5 in pairs(v3) do
        local l_v2_FirstChild_0 = v2:FindFirstChild(v5);
        if l_v2_FirstChild_0 then
            if v1() and l_v2_FirstChild_0:IsA("Attachment") then
                return l_v2_FirstChild_0;
            else
                return l_v2_FirstChild_0;
            end;
        end;
    end;
    return nil;
end;