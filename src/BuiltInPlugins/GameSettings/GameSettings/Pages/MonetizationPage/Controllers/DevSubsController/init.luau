local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 5 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __networking = v1
    }, v0));
end;
v0.devSubsV1GET = function(v2, v3, v4) --[[ Line: 13 ]] --[[ Name: devSubsV1GET ]]
    return v2.__networking:get("apis", "/developer-subscriptions/v1/universes/" .. v3 .. "/plans", {
        Params = v4
    });
end;
v0.moderationV1GET = function(v5, v6) --[[ Line: 20 ]] --[[ Name: moderationV1GET ]]
    return v5.__networking:get("apis", "/developer-subscriptions/v1/universes/plans/check-name-and-description", {
        Params = {
            name = v6
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.uploadImagePOST = function(v7, v8) --[[ Line: 30 ]] --[[ Name: uploadImagePOST ]]
    return v7.__networking:post("www", "/ide/publish/UploadNewImage", {
        Params = {
            name = "DevSubImage", 
            description = "None"
        }, 
        Body = v8:GetBinaryContents(), 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
        }
    });
end;
v0.devSubsCreateV1POST = function(v9, v10, v11, v12, v13, v14) --[[ Line: 45 ]] --[[ Name: devSubsCreateV1POST ]]
    return v9.__networking:post("apis", "/developer-subscriptions/v1/universes/" .. v10 .. "/plans", {
        Body = {
            imageAssetId = v14, 
            name = v11, 
            prepaidOptions = v12, 
            priceInRobux = v13
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.devSubsDiscontinueV1PATCH = function(v15, v16) --[[ Line: 58 ]] --[[ Name: devSubsDiscontinueV1PATCH ]]
    return v15.__networking:patch("apis", "/developer-subscriptions/v1/universes/plans/" .. v16, {
        Body = {
            status = "Closed"
        }, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.devSubsChangeV1PATCH = function(v17, v18, v19, v20, v21, v22, v23, v24) --[[ Line: 68 ]] --[[ Name: devSubsChangeV1PATCH ]]
    local l___networking_0 = v17.__networking;
    if v24 == nil then
        v24 = string.match(v21, "%d+");
    end;
    local v26 = {
        imageAssetId = v24, 
        name = v22 or v19, 
        prepaidOptions = v23 or v20
    };
    return l___networking_0:patch("apis", "/developer-subscriptions/v1/universes/plans/" .. v18, {
        Body = v26, 
        CachePolicy = Enum.HttpCachePolicy.None
    });
end;
v0.getDevSubs = function(v27, v28, v29, v30) --[[ Line: 84 ]] --[[ Name: getDevSubs ]]
    local v31 = {};
    local l_responseBody_0 = v27:devSubsV1GET(v28, {
        status = v29 and "Open" or "Closed", 
        sortOrder = "Asc", 
        cursor = v30
    }):await().responseBody;
    for _, v34 in pairs(l_responseBody_0.data) do
        local v35 = {
            IsNew = false, 
            Key = tostring(v34.id), 
            Id = v34.id, 
            Image = "rbxassetid://" .. v34.imageAssetId, 
            Name = v34.name, 
            Price = v34.priceInRobux, 
            CreationDate = v34.created, 
            Active = v34.status == "Open", 
            Subscribers = 999, 
            PendingEarning = 9999, 
            Prepaid = 6
        };
        v31[v35.Key] = v35;
    end;
    local l_nextPageCursor_0 = l_responseBody_0.nextPageCursor;
    if l_nextPageCursor_0 == nil then
        l_nextPageCursor_0 = "";
    end;
    return v31, l_nextPageCursor_0;
end;
v0.createDevSub = function(v37, v38, v39) --[[ Line: 122 ]] --[[ Name: createDevSub ]]
    local l_responseBody_1 = v37:uploadImagePOST(v39.Image):await().responseBody;
    v37:devSubsCreateV1POST(v38, v39.Name, v39.Prepaid, v39.Price, l_responseBody_1):await();
end;
v0.changeDevSub = function(v41, v42, v43) --[[ Line: 128 ]] --[[ Name: changeDevSub ]]
    if v43.Image then
        local l_responseBody_2 = v41:uploadImagePOST(v43.Image):await().responseBody;
        v41:devSubsChangeV1PATCH(v42.Id, v42.Name, v42.Prepaid, v42.Image, v43.Name, v43.Prepaid, l_responseBody_2):await();
        return;
    else
        v41:devSubsChangeV1PATCH(v42.Id, v42.Name, v42.Prepaid, v42.Image, v43.Name, v43.Prepaid):await();
        return;
    end;
end;
v0.discontinueDevSub = function(v45, v46) --[[ Line: 139 ]] --[[ Name: discontinueDevSub ]]
    v45:devSubsDiscontinueV1PATCH(v46.Id):await();
end;
v0.getFilteredDevSub = function(v47, v48) --[[ Line: 143 ]] --[[ Name: getFilteredDevSub ]]
    if v48.Name == nil or v48.Name == "" then
        return true, nil, nil;
    else
        local l_responseBody_3 = v47:moderationV1GET(v48.Name):await().responseBody;
        local l_isAcceptable_0 = l_responseBody_3.isAcceptable;
        local l_filteredName_0 = l_responseBody_3.filteredName;
        if l_filteredName_0 == "" then
            l_filteredName_0 = nil;
        end;
        return l_isAcceptable_0, l_filteredName_0;
    end;
end;
return v0;