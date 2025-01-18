return function() --[[ Line: 3 ]]
    local v0 = {};
    local v1 = {};
    local l_game_Descendants_0 = game:GetDescendants();
    for _, v4 in pairs(l_game_Descendants_0) do
        if v4:IsA("Model") then
            local l_PackageLink_0 = v4:FindFirstChildWhichIsA("PackageLink");
            if l_PackageLink_0 then
                local v6 = string.sub(l_PackageLink_0.PackageId, 14);
                if not v1[v6] then
                    v1[v6] = true;
                    local v7 = {
                        AssetId = v6, 
                        Name = v4.Name
                    };
                    v7.Image = string.format("rbxthumb://type=Asset&w=150&h=150&id=%s", v7.AssetId);
                    table.insert(v0, v7);
                end;
            end;
        end;
    end;
    return v0;
end;