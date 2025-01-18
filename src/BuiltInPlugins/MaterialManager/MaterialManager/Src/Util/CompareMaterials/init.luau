local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3) --[[ Line: 4 ]]
    if not v2 and not v3 then
        return true;
    elseif not v2 or not v3 then
        return false;
    elseif v2.MaterialVariant and v3.MaterialVariant then
        return v2.MaterialVariant == v3.MaterialVariant;
    elseif v2.MaterialVariant and not v3.MaterialVariant or not v2.MaterialVariant and v3.MaterialVariant then
        return false;
    else
        return v2.Material == v3.Material;
    end;
end;