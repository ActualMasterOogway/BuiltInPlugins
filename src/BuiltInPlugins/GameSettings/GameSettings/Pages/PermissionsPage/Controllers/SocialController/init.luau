local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
v0.friendsV1GET = function(v2, v3) --[[ Line: 12 ]] --[[ Name: friendsV1GET ]]
    return v2.__networking:get("friends", "/v1/users/" .. v3 .. "/friends");
end;
v0.getUserFriends = function(v4, v5) --[[ Line: 18 ]] --[[ Name: getUserFriends ]]
    local l_data_0 = v4:friendsV1GET(v5):await().responseBody.data;
    local v7 = {};
    for _, v9 in ipairs(l_data_0) do
        table.insert(v7, v9.id);
    end;
    return v7;
end;
return v0;