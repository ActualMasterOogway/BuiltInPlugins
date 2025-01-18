local l_Parent_0 = script.Parent.Parent;
local _ = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Util.DeserializeFromRequest);
local v3 = require(l_Parent_0.Util.SerializeForRequest);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    return (setmetatable({
        __networking = v5
    }, v4));
end;
v4.universesV1GET = function(v6, v7) --[[ Line: 24 ]] --[[ Name: universesV1GET ]]
    return v6.__networking:get("develop", "/v1/universes/" .. v7);
end;
v4.universesActivateV1POST = function(v8, v9) --[[ Line: 30 ]] --[[ Name: universesActivateV1POST ]]
    return v8.__networking:post("develop", "/v1/universes/" .. v9 .. "/activate", {
        Body = {}
    });
end;
v4.universesDeactivateV1POST = function(v10, v11) --[[ Line: 38 ]] --[[ Name: universesDeactivateV1POST ]]
    return v10.__networking:post("develop", "/v1/universes/" .. v11 .. "/deactivate", {
        Body = {}
    });
end;
v4.configurationV2GET = function(v12, v13) --[[ Line: 46 ]] --[[ Name: configurationV2GET ]]
    return v12.__networking:get("develop", "/v2/universes/" .. v13 .. "/configuration");
end;
v4.configurationV2PATCH = function(v14, v15, v16) --[[ Line: 52 ]] --[[ Name: configurationV2PATCH ]]
    return v14.__networking:patch("develop", "/v2/universes/" .. v15 .. "/configuration", {
        Body = v16
    });
end;
v4.permissionsV2GET = function(v17, v18) --[[ Line: 60 ]] --[[ Name: permissionsV2GET ]]
    return v17.__networking:get("develop", "/v2/universes/" .. v18 .. "/permissions");
end;
v4.permissionsBatchedV2POST = function(v19, v20, v21) --[[ Line: 66 ]] --[[ Name: permissionsBatchedV2POST ]]
    return v19.__networking:post("develop", "/v2/universes/" .. v20 .. "/permissions_batched", {
        Body = v21
    });
end;
v4.permissionsBatchedV2DELETE = function(v22, v23, v24) --[[ Line: 74 ]] --[[ Name: permissionsBatchedV2DELETE ]]
    return v22.__networking:delete("develop", "/v2/universes/" .. v23 .. "/permissions_batched", {
        Body = v24
    });
end;
v4.isFriendsOnly = function(v25, v26) --[[ Line: 82 ]] --[[ Name: isFriendsOnly ]]
    return v25:configurationV2GET(v26):await().responseBody.isFriendsOnly;
end;
v4.setFriendsOnly = function(v27, v28, v29) --[[ Line: 88 ]] --[[ Name: setFriendsOnly ]]
    v27:configurationV2PATCH(v28, {
        isFriendsOnly = v29
    }):await();
end;
v4.isActive = function(v30, v31) --[[ Line: 92 ]] --[[ Name: isActive ]]
    return v30:universesV1GET(v31):await().responseBody.isActive;
end;
v4.setActive = function(v32, v33, v34) --[[ Line: 98 ]] --[[ Name: setActive ]]
    if v34 then
        v32:universesActivateV1POST(v33):await();
        return;
    else
        v32:universesDeactivateV1POST(v33):await();
        return;
    end;
end;
v4.getPermissions = function(v35, v36, v37, v38, v39) --[[ Line: 106 ]] --[[ Name: getPermissions ]]
    -- upvalues: v2 (copy)
    local l_data_0 = v35:permissionsV2GET(v36):await().responseBody.data;
    return v2.DeserializePermissions(l_data_0, v37, v38, v39);
end;
v4.setPermissions = function(v41, v42, v43, v44) --[[ Line: 112 ]] --[[ Name: setPermissions ]]
    -- upvalues: v3 (copy)
    local v45, v46 = v3.SerializePermissions(v43, v44);
    local v47 = #v45 + #v46;
    if v47 > 60 then
        error("Too many changes (" .. v47 .. ") to permissions. Maximum at once is " + 60);
    end;
    if #v45 > 0 then
        v41:permissionsBatchedV2POST(v42, v45):await();
    end;
    if #v46 > 0 then
        v41:permissionsBatchedV2DELETE(v42, v46):await();
    end;
end;
return v4;