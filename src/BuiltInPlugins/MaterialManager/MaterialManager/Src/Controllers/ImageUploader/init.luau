local l_Parent_0 = script.Parent.Parent.Parent;
local l_PublishService_0 = game:GetService("PublishService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v4 = {};
v4.__index = v4;
v4.new = function() --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: l_PublishService_0 (copy), v4 (copy)
    local v5 = {
        _publishService = l_PublishService_0, 
        _promises = {}
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.mock = function(v6) --[[ Line: 22 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    assert(v6, "ImageUploader.mock expects a mock PublishService");
    local v7 = v4.new();
    v7._publishService = v6;
    return v7;
end;
v4.destroy = function(v8) --[[ Line: 29 ]] --[[ Name: destroy ]]
    v8._publishService = nil;
    v8._promises = {};
end;
v4.upload = function(v9, v10, v11, v12, v13) --[[ Line: 50 ]] --[[ Name: upload ]]
    -- upvalues: l_Promise_0 (copy), l_StudioService_0 (copy)
    assert(type(v10) == "string", "ImageUploader:upload() expects tempId to be a string");
    assert(type(v11) == "string", "ImageUploader:upload() expects name to be a string");
    local v14 = true;
    if type(v12) ~= "string" then
        v14 = type(v12) == "nil";
    end;
    assert(v14, "ImageUploader:upload() expects description to be a string or nil");
    assert(type(v13) == "string", "ImageUploader:upload() expects contents to be a string");
    v12 = v12 or "";
    if v9._promises[v10] then
        return v9._promises[v10];
    else
        local v21 = l_Promise_0.new(function(v15, _, _) --[[ Line: 67 ]]
            -- upvalues: l_StudioService_0 (ref), v9 (copy), v13 (copy), v11 (copy), v12 (ref)
            local l_User_0 = Enum.AssetCreatorType.User;
            local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
            v15(v9._publishService:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(v13, l_User_0, l_l_StudioService_0_UserId_0, "Image", 0, v11, v12, "", "", 0));
        end):andThen(function(v20) --[[ Line: 87 ]]
            return v20.AssetId;
        end);
        v9._promises[v10] = v21;
        return v21;
    end;
end;
return v4;