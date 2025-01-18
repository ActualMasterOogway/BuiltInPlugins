local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Promise_0 = v1.Util.Promise;
local v4 = l_ContextItem_0:extend("ImportAssetHandler");
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v7 = setmetatable({
        _imageUploader = v5, 
        _userId = v6 or game:GetService("StudioService"):GetUserId()
    }, v4);
    assert(v7._imageUploader, "ImportAssetHandler expects an ImageUploader");
    return v7;
end;
v4.mock = function(v8, v9) --[[ Line: 29 ]] --[[ Name: mock ]]
    -- upvalues: v4 (copy)
    return v4.new(v8, v9);
end;
v4.handleAsset = function(v10, v11, v12) --[[ Line: 33 ]] --[[ Name: handleAsset ]]
    -- upvalues: l_Promise_0 (copy)
    assert(v11, "ImportAssetHandler:handleAsset() requires an assetFile");
    if v12 then
        v12(true);
    end;
    local l_v11_TemporaryId_0 = v11:GetTemporaryId();
    local v14 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
        -- upvalues: v14 (ref), v11 (copy)
        v14 = v11:GetBinaryContents();
    end);
    if not l_status_0 then
        return l_Promise_0.reject(l_result_0);
    else
        return v10._imageUploader:upload(l_v11_TemporaryId_0, v11.Name, "", v14):andThen(function(v17) --[[ Line: 49 ]]
            -- upvalues: l_v11_TemporaryId_0 (copy)
            local v18 = tonumber(v17);
            if not v18 then
                local v19 = ("Asset id \"%s\" for temp id \"%s\" could not be cast to an integer"):format(v17, l_v11_TemporaryId_0);
                warn(v19);
                assert(v18, v19);
            end;
            return "rbxassetid://" .. v18;
        end);
    end;
end;
return v4;