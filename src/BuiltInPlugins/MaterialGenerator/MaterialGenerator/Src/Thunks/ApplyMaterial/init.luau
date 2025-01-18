local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3) --[[ Line: 7 ]]
    return function(_) --[[ Line: 8 ]]
        -- upvalues: v2 (copy), v3 (copy)
        local l_MaterialVariant_0 = v2.MaterialVariant;
        local v6 = false;
        for _, v8 in v3:getService("Selection"):Get() do
            if v8:IsA("BasePart") then
                v8.Material = l_MaterialVariant_0.BaseMaterial;
                v8.MaterialVariant = l_MaterialVariant_0.Name;
                v6 = true;
            end;
        end;
        if v6 then
            v3:getService("ChangeHistoryService"):SetWaypoint("MaterialGenerator apply material");
        end;
    end;
end;