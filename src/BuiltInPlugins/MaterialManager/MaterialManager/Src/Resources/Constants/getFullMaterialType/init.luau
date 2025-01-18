local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Resources.Constants.getMaterialName);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    local v5 = v3.MaterialVariant and "Variant" or "Material";
    return v4:getText("Materials", v2(v3.Material) .. v5);
end;