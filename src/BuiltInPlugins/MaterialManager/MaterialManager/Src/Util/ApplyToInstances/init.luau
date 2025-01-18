local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.ApplyToBasePart);
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: v2 (copy)
    for _, v7 in ipairs(v3) do
        v2(v7, v4, v5);
        if v7:IsA("Model") then
            local l_v7_Descendants_0 = v7:GetDescendants();
            for _, v10 in ipairs(l_v7_Descendants_0) do
                if v10:IsA("BasePart") then
                    v10.Material = v4;
                    v10.MaterialVariant = v5 or "";
                end;
            end;
        end;
    end;
end;