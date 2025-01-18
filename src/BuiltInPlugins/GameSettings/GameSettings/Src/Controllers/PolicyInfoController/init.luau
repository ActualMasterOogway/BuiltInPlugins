local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
local function _(v2) --[[ Line: 12 ]] --[[ Name: appAgreementsResolutionV1GET ]]
    return v2:get("apis", "/user-agreements/v1/agreements-resolution/App");
end;
local function v7(v4, v5, v6) --[[ Line: 16 ]] --[[ Name: studioModerationContactPOST ]]
    return v4:post("apis", "/studio-moderation/v1/" .. v5 .. "/contacts", {
        Body = {
            email = v6
        }
    });
end;
v0.getPlayerAcceptances = function(v8) --[[ Line: 24 ]] --[[ Name: getPlayerAcceptances ]]
    local v9 = v8.__networking:get("apis", "/user-agreements/v1/agreements-resolution/App"):await();
    return next(v9.responseBody) == nil;
end;
v0.postContactEmail = function(v10, v11, v12) --[[ Line: 31 ]] --[[ Name: postContactEmail ]]
    -- upvalues: v7 (copy)
    assert(type(v11) == "number", string.format("universeId must be a number, received %s", (type(v11))));
    assert(type(v12) == "string", string.format("contactemail must be a string, received %s", (type(v12))));
    local l___networking_0 = v10.__networking;
    local v14 = nil;
    v7(l___networking_0, v11, v12):catch(function(v15) --[[ Line: 42 ]]
        -- upvalues: v14 (ref)
        v14 = v15.responseCode;
    end):await();
    return v14;
end;
return v0;