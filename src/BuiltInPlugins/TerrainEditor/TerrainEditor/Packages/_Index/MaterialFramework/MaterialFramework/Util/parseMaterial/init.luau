local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
return function(v2) --[[ Line: 4 ]]
    local v3 = nil;
    local v4 = nil;
    if typeof(v2) == "EnumItem" then
        return v2, v4;
    else
        if typeof(v2) == "Instance" and v2:IsA("MaterialVariant") then
            v4 = v2;
            v3 = v4.BaseMaterial;
        end;
        return v3, v4;
    end;
end;