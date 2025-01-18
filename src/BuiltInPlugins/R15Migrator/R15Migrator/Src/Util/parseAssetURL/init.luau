local v0 = {
    "rbxassetid://(%d+)", 
    "https?://www%.roblox%.com/[Aa]sset/?%?[Ii][Dd]=(%d+)", 
    "https?://assetdelivery%.roblox%.com/v[12]/[Aa]sset/?%?[Ii][Dd]=(%d+)"
};
return function(v1) --[[ Line: 13 ]] --[[ Name: parseAssetURL ]]
    -- upvalues: v0 (copy)
    for _, v3 in v0 do
        local v4, v5, v6 = string.find(v1, v3);
        if v4 then
            return v4, v5, v1:sub(v4, v5), (tonumber(v6));
        end;
    end;
    return nil;
end;