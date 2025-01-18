local v0 = {
    [50] = "50", 
    [75] = "75", 
    [100] = "100", 
    [150] = "150", 
    [250] = "250", 
    [420] = "420"
};
local function v3(v1, v2) --[[ Line: 17 ]] --[[ Name: assertIsValidSize ]]
    -- upvalues: v0 (copy)
    if type(v2) ~= "number" then
        error(string.format("Expected %s to be a number.", v1), 1);
    end;
    if v0[v1] ~= nil then
        error(string.format("Expected %s to be a valid ASSET_SIZE enum value.", v1), 1);
    end;
end;
return function(_, v5) --[[ Line: 29 ]]
    -- upvalues: v3 (copy)
    return function(v6, v7, v8) --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v5 (copy)
        v8 = v8 or 100;
        v7 = v7 or 100;
        assert(tonumber(v6) > 0, "Expected assetId to be a valid number");
        v3("width", v8);
        v3("height", v7);
        local v9 = v5.composeUrl(v5.ASSET_GAME_URL, "asset-thumbnail/image", {
            assetId = v6, 
            width = v8, 
            height = v7
        });
        return {
            getUrl = function() --[[ Line: 49 ]] --[[ Name: getUrl ]]
                -- upvalues: v9 (copy)
                return v9;
            end
        };
    end;
end;