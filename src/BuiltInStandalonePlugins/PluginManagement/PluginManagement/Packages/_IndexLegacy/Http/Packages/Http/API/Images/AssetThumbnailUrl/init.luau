local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.BaseUrl);
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v3 = v3 or 100;
    v4 = v4 or 100;
    assert(tonumber(v2) > -1, "Expected assetId to be a valid number");
    assert(type(v3) == "number", "Expected width to be a number");
    assert(type(v4) == "number", "Expected height to be a number");
    local v5 = v1.makeQueryString({
        assetId = v2, 
        width = v3, 
        height = v4
    });
    return string.format("%sasset-thumbnail/image?%s", v1.ASSET_GAME_URL, v5);
end;