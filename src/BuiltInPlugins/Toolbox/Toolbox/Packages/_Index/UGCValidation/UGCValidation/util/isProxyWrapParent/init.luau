local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return function(v2) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    if not v2 or not v2:IsA("WrapTarget") then
        return false;
    else
        for _, v4 in v2:GetChildren() do
            if v4:IsA("MeshPart") and v4:GetAttribute(v1.ProxyWrapAttributeName) then
                return true;
            end;
        end;
        return false;
    end;
end;