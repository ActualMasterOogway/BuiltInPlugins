local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.Util.parseMaterial);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v2 (copy)
    if typeof(v3) == "Instance" and v3:IsA("BasePart") then
        if v3.MaterialVariant and v3.MaterialVariant ~= "" then
            return v3.MaterialVariant .. "__" .. v3.Material.Name;
        else
            return v3.Material.Name;
        end;
    else
        local v4, v5 = v2(v3);
        if v5 and v5.Name ~= "" then
            return v5.Name .. "__" .. v4.Name;
        else
            return v4.Name;
        end;
    end;
end;