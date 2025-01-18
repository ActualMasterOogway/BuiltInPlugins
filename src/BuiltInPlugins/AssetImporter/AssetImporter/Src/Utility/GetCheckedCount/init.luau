return function(v0) --[[ Line: 6 ]]
    local v1 = v0.ShouldImport and 1 or 0;
    for _, v3 in pairs(v0:GetDescendants()) do
        if v3.ShouldImport then
            v1 = v1 + 1;
        end;
    end;
    return v1;
end;