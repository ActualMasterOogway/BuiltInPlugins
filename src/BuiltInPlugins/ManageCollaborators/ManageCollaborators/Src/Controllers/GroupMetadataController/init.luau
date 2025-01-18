local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v1, 
        __metadataCache = {}, 
        __rolesetCache = {}
    }, v0));
end;
v0.groupsV1GET = function(v2, v3) --[[ Line: 34 ]] --[[ Name: groupsV1GET ]]
    return v2.__networking:get("groups", "/v1/groups/" .. v3);
end;
v0.groupsRolesV1GET = function(v4, v5) --[[ Line: 40 ]] --[[ Name: groupsRolesV1GET ]]
    return v4.__networking:get("groups", "/v1/groups/" .. v5 .. "/roles");
end;
v0.getGroupMetadata = function(v6, v7) --[[ Line: 46 ]] --[[ Name: getGroupMetadata ]]
    if not v6.__metadataCache[v7] then
        local v8 = v6:groupsV1GET(v7):await();
        if not v6.__metadataCache[v7] then
            local l_responseBody_0 = v8.responseBody;
            v6.__metadataCache[v7] = {
                name = l_responseBody_0.name, 
                ownerId = if l_responseBody_0.owner then l_responseBody_0.owner.userId else 0, 
                memberCount = l_responseBody_0.memberCount, 
                isSequestered = l_responseBody_0.isLocked
            };
        end;
    end;
    return v6.__metadataCache[v7];
end;
v0.getRolesetMetadata = function(v10, v11) --[[ Line: 65 ]] --[[ Name: getRolesetMetadata ]]
    if not v10.__rolesetCache[v11] then
        local v12 = v10:groupsRolesV1GET(v11):await();
        if not v10.__rolesetCache[v11] then
            local l_responseBody_1 = v12.responseBody;
            local v14 = {};
            for _, v16 in ipairs(l_responseBody_1.roles) do
                v14[v16.id] = {
                    name = v16.name, 
                    rank = v16.rank, 
                    memberCount = v16.memberCount
                };
            end;
            v10.__rolesetCache[v11] = v14;
        end;
    end;
    return v10.__rolesetCache[v11];
end;
v0.getName = function(v17, v18) --[[ Line: 89 ]] --[[ Name: getName ]]
    return v17:getGroupMetadata(v18).name;
end;
v0.getOwnerName = function(v19, v20) --[[ Line: 95 ]] --[[ Name: getOwnerName ]]
    return v19:getGroupMetadata(v20).ownerName;
end;
v0.getOwnerId = function(v21, v22) --[[ Line: 101 ]] --[[ Name: getOwnerId ]]
    return v21:getGroupMetadata(v22).ownerId;
end;
v0.getNumMembers = function(v23, v24) --[[ Line: 107 ]] --[[ Name: getNumMembers ]]
    return v23:getGroupMetadata(v24).memberCount;
end;
v0.isSequestered = function(v25, v26) --[[ Line: 113 ]] --[[ Name: isSequestered ]]
    return v25:getGroupMetadata(v26).isSequestered;
end;
v0.getRolesets = function(v27, v28) --[[ Line: 119 ]] --[[ Name: getRolesets ]]
    return (v27:getRolesetMetadata(v28));
end;
return v0;