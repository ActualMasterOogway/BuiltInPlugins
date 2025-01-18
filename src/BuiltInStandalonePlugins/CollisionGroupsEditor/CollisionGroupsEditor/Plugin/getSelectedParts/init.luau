local function v2(v0) --[[ Line: 1 ]] --[[ Name: testRestrictedInstance ]]
    local _ = v0.Name;
end;
return function() --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    local v3 = {};
    for _, v5 in pairs(game:GetService("Selection"):Get()) do
        if pcall(v2, v5) then
            if v5:IsA("BasePart") then
                table.insert(v3, v5);
            end;
            for _, v7 in pairs(v5:GetDescendants()) do
                if v7:IsA("BasePart") then
                    table.insert(v3, v7);
                end;
            end;
        end;
    end;
    return v3;
end;