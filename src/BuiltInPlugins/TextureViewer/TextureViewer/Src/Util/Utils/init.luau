return {
    round = function(v0, v1) --[[ Line: 3 ]] --[[ Name: round ]]
        return string.format("%." .. (v1 or 0) .. "f", v0);
    end, 
    doesTextureAliasContainId = function(v2) --[[ Line: 7 ]] --[[ Name: doesTextureAliasContainId ]]
        return string.match(v2, "%?id=") or string.match(v2, "rbxassetid://");
    end, 
    parseIdFromTextureAlias = function(v3) --[[ Line: 11 ]] --[[ Name: parseIdFromTextureAlias ]]
        local v4, v5 = string.find(v3, "?id=");
        if v5 then
            return (string.sub(v3, v5 + 1));
        else
            local v6, v7 = string.find(v3, "rbxassetid://");
            v4 = v6;
            v5 = v7;
            if v5 then
                return (string.sub(v3, v5 + 1));
            else
                return v3;
            end;
        end;
    end
};