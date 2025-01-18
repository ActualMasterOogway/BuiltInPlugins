local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if not v2:GetAttribute(v1.ProxyWrapAttributeName) then
        return false;
    elseif not v2:IsA("MeshPart") then
        return false;
    elseif not v2.Parent or not v2.Parent:IsA("WrapTarget") and not v2.Parent:IsA("WrapLayer") then
        return false;
    elseif #v2:GetDescendants() ~= 0 then
        return false;
    else
        local l_MeshContent_0 = v2.MeshContent;
        if not l_MeshContent_0 then
            return false;
        else
            local l_Object_0 = l_MeshContent_0.Object;
            if not l_Object_0 or not l_Object_0:IsA("EditableMesh") then
                return false;
            else
                return true;
            end;
        end;
    end;
end;