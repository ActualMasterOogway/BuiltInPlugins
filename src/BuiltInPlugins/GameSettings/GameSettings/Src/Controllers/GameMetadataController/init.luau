local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v1, 
        __metadataCache = {}
    }, v0));
end;
v0.universesV1GET = function(v2, v3) --[[ Line: 22 ]] --[[ Name: universesV1GET ]]
    return v2.__networking:get("develop", "/v1/universes/" .. v3);
end;
v0.getUniverseMetadata = function(v4, v5) --[[ Line: 28 ]] --[[ Name: getUniverseMetadata ]]
    if not v4.__metadataCache[v5] then
        local v6 = v4:universesV1GET(v5):await();
        if not v4.__metadataCache[v5] then
            local l_responseBody_0 = v6.responseBody;
            v4.__metadataCache[v5] = {
                rootPlaceId = l_responseBody_0.rootPlaceId, 
                creatorId = l_responseBody_0.creatorTargetId, 
                creatorName = l_responseBody_0.creatorName, 
                creatorType = Enum.CreatorType[l_responseBody_0.creatorType]
            };
        end;
    end;
    return v4.__metadataCache[v5];
end;
v0.getRootPlace = function(v8, v9) --[[ Line: 47 ]] --[[ Name: getRootPlace ]]
    return v8:getUniverseMetadata(v9).rootPlaceId;
end;
v0.getCreatorId = function(v10, v11) --[[ Line: 53 ]] --[[ Name: getCreatorId ]]
    return v10:getUniverseMetadata(v11).creatorId;
end;
v0.getCreatorName = function(v12, v13) --[[ Line: 59 ]] --[[ Name: getCreatorName ]]
    return v12:getUniverseMetadata(v13).creatorName;
end;
v0.getCreatorType = function(v14, v15) --[[ Line: 65 ]] --[[ Name: getCreatorType ]]
    return v14:getUniverseMetadata(v15).creatorType;
end;
return v0;