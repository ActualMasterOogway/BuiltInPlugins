local function v0(v1, v2) --[[ Line: 1 ]] --[[ Name: getDescendants ]]
    -- upvalues: v0 (copy)
    if not v2:IsA("Model") or v2.Name ~= "AnimSaves" then
        for _, v4 in ipairs(v2:GetChildren()) do
            table.insert(v1, v4);
            v0(v1, v4);
        end;
    end;
    return v1;
end;
return v0;