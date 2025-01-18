local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent;
local _ = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.getModelFromBackend);
local v4 = require(l_Parent_0.PreviewClothing);
local v5 = require(l_Parent_0.PreviewAvatar);
local v6 = {};
local function _(v7) --[[ Line: 17 ]] --[[ Name: isUserAddedAsset ]]
    local v8 = false;
    if type(v7) == "number" then
        v8 = math.floor(v7) == v7;
    end;
    return not v8;
end;
local function v14(v10, v11) --[[ Line: 21 ]] --[[ Name: getUserAddedAsset ]]
    if not v11 then
        return;
    else
        for _, v13 in ipairs(v11) do
            if v13.uniqueId == v10 then
                return v13.instance:Clone();
            end;
        end;
        return;
    end;
end;
local function _(v15, v16, v17, v18) --[[ Line: 33 ]] --[[ Name: getPreviewAsset ]]
    -- upvalues: v14 (copy), v3 (copy)
    local v19 = false;
    if type(v15) == "number" then
        v19 = math.floor(v15) == v15;
    end;
    if not v19 then
        return v14(v15, v16);
    else
        return v3(v17, v15, v18);
    end;
end;
v6.createUserAddedAsset = function(v21) --[[ Line: 41 ]] --[[ Name: createUserAddedAsset ]]
    -- upvalues: l_HttpService_0 (copy)
    return {
        instance = v21, 
        uniqueId = l_HttpService_0:GenerateGUID()
    };
end;
v6.createPreviewAvatars = function(v22, v23, v24, v25) --[[ Line: 48 ]] --[[ Name: createPreviewAvatars ]]
    -- upvalues: v14 (copy), v3 (copy), v5 (copy)
    local v26 = {};
    for _, v28 in ipairs(v22) do
        local v29 = false;
        if type(v28) == "number" then
            v29 = math.floor(v28) == v28;
        end;
        local v30 = if not v29 then v14(v28, v23) else v3(v25, v28, true);
        table.insert(v26, v5.new(v30, v24, v28));
    end;
    return v26;
end;
v6.addPreviewClothingFromIds = function(v31, v32, v33, v34) --[[ Line: 57 ]] --[[ Name: addPreviewClothingFromIds ]]
    -- upvalues: v14 (copy), v3 (copy), v4 (copy)
    for _, v36 in ipairs(v31) do
        for _, v38 in ipairs(v32) do
            local v39 = false;
            if type(v38) == "number" then
                v39 = math.floor(v38) == v38;
            end;
            local v40 = if not v39 then v14(v38, v33) else v3(v34, v38, false);
            v36:addLayer(v4.new(v40, true, v38));
        end;
    end;
end;
v6.addPreviewClothingFromInstance = function(v41, v42, v43) --[[ Line: 66 ]] --[[ Name: addPreviewClothingFromInstance ]]
    -- upvalues: v4 (copy)
    v41:addLayer((v4.new(v42, v43, v42.Name)));
end;
v6.addPreviewClothingFromInstances = function(v44, v45, v46) --[[ Line: 71 ]] --[[ Name: addPreviewClothingFromInstances ]]
    -- upvalues: v6 (copy)
    for _, v48 in ipairs(v44) do
        for _, v50 in ipairs(v45) do
            v6.addPreviewClothingFromInstance(v48, v50:Clone(), v46);
        end;
    end;
end;
return v6;