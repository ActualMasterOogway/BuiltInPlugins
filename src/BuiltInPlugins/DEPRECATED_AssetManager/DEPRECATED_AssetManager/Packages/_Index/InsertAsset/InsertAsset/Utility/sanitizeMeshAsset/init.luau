return function(_, v1) --[[ Line: 1 ]]
    local v2 = false;
    local v3 = {};
    for _, v5 in ipairs(v1) do
        if v5:IsA("MeshPart") then
            if #v5:GetChildren() > 0 then
                v5:ClearAllChildren();
                v2 = true;
            end;
            table.insert(v3, v5);
        else
            v5:Destroy();
            v2 = true;
        end;
    end;
    return v3, v2;
end;