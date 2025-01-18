return function(v0) --[[ Line: 5 ]] --[[ Name: normalizeAssetId ]]
    local v1, v2 = string.find(v0, "rbxassetid://", 1, true);
    if v1 then
        return v0:sub(v2 + 1);
    else
        local v3, v4 = string.find(v0, "http[s]?://www.roblox.com/asset/%?id=");
        v1 = v3;
        v2 = v4;
        if v1 then
            return v0:sub(v2 + 1);
        else
            v3, v4 = string.find(v0, "rbxgameasset://Audio/", 1, true);
            v1 = v3;
            v2 = v4;
            if v1 then
                return nil;
            else
                return nil;
            end;
        end;
    end;
end;