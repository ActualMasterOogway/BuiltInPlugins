local v0 = require(script.Parent.applyToBasePart);
return function(v1, v2, v3) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    for _, v5 in v1 do
        v0(v5, v2, v3);
        if v5:IsA("Model") then
            for _, v7 in v5:GetDescendants() do
                if v7:IsA("BasePart") then
                    v7.Material = v2;
                    v7.MaterialVariant = v3 or "";
                end;
            end;
        end;
    end;
end;