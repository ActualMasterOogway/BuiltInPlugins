local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({
        __networking = v3
    }, v2));
end;
v2.placesV2GET = function(v4, v5, v6) --[[ Line: 17 ]] --[[ Name: placesV2GET ]]
    return v4.__networking:get("develop", "/v2/universes/" .. v5 .. "/places", {
        Params = v6
    });
end;
v2.placesV2PATCH = function(v7, v8, v9) --[[ Line: 24 ]] --[[ Name: placesV2PATCH ]]
    return v7.__networking:patch("develop", "/v2/places/" .. v8, {
        Body = v9
    });
end;
v2.getPlaces = function(v10, v11, v12, v13) --[[ Line: 31 ]] --[[ Name: getPlaces ]]
    -- upvalues: l_Promise_0 (copy)
    local v14 = {};
    local v15 = v13 == nil and 1 or v13 + 1;
    local v16 = {
        limit = 10, 
        sortOrder = "Asc", 
        cursor = v12, 
        extendedSettings = true
    };
    return l_Promise_0.resolve(v10:placesV2GET(v11, v16)):andThen(function(v17) --[[ Line: 42 ]]
        -- upvalues: v15 (ref), v14 (copy)
        local l_responseBody_0 = v17.responseBody;
        for _, v20 in pairs(l_responseBody_0.data) do
            v20.index = v15;
            v14[v20.id] = v20;
            v15 = v15 + 1;
        end;
        local l_nextPageCursor_0 = l_responseBody_0.nextPageCursor;
        if l_nextPageCursor_0 == nil then
            l_nextPageCursor_0 = "";
        end;
        return v14, l_nextPageCursor_0, v15;
    end);
end;
v2.setName = function(v22, v23, v24) --[[ Line: 60 ]] --[[ Name: setName ]]
    v22:placesV2PATCH(v23, {
        name = v24
    }):await();
end;
v2.setMaxPlayerCount = function(v25, v26, v27) --[[ Line: 64 ]] --[[ Name: setMaxPlayerCount ]]
    v25:placesV2PATCH(v26, {
        maxPlayerCount = v27
    }):await();
end;
v2.setAllowCopying = function(v28, v29, v30) --[[ Line: 68 ]] --[[ Name: setAllowCopying ]]
    v28:placesV2PATCH(v29, {
        allowCopying = v30
    }):await();
end;
v2.setSocialSlotType = function(v31, v32, v33) --[[ Line: 72 ]] --[[ Name: setSocialSlotType ]]
    v31:placesV2PATCH(v32, {
        socialSlotType = v33
    }):await();
end;
v2.setCustomSocialSlotsCount = function(v34, v35, v36) --[[ Line: 76 ]] --[[ Name: setCustomSocialSlotsCount ]]
    v34:placesV2PATCH(v35, {
        customSocialSlotsCount = v36
    }):await();
end;
v2.assetPublishVersionV1GET = function(v37, v38) --[[ Line: 80 ]] --[[ Name: assetPublishVersionV1GET ]]
    return v37.__networking:get("develop", "/v1/assets/" .. v38 .. "/published-versions");
end;
v2.getAssetPublishedVersions = function(v39, v40) --[[ Line: 85 ]] --[[ Name: getAssetPublishedVersions ]]
    return v39:assetPublishVersionV1GET(v40):await().responseBody;
end;
return v2;