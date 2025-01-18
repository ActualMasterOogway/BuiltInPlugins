return function(v0, v1, v2) --[[ Line: 1 ]]
    if v0 and v0:IsA("BasePart") then
        v0.Material = v1;
        v0.MaterialVariant = v2 or "";
    end;
end;