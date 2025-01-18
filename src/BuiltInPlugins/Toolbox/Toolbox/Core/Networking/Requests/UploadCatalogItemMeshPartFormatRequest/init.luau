local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.NetworkError);
local v2 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Util_0.AssetConfigConstants);
local v6 = require(l_Util_0.SerializeInstances);
local v7 = require(l_Util_0.convertSpecialMeshAccessory);
local v8 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
return function(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 14 ]]
    -- upvalues: v8 (copy), v4 (copy), v1 (copy), v2 (copy), v7 (copy), v6 (copy), v5 (copy)
    return function(v16, v17) --[[ Line: 15 ]]
        -- upvalues: v8 (ref), v9 (copy), v10 (copy), v15 (copy), v4 (ref), v1 (ref), v2 (ref), v7 (ref), v14 (copy), v6 (ref), v11 (copy), v12 (copy), v13 (copy), v5 (ref)
        local function v19(_) --[[ Line: 16 ]]
            -- upvalues: v16 (copy), v8 (ref), v9 (ref), v10 (ref), v15 (ref)
            v16:dispatch(v8(v9, v10, {}, v15));
        end;
        local function v21(v20) --[[ Line: 20 ]]
            -- upvalues: v4 (ref), v16 (copy), v1 (ref), v2 (ref)
            if v4.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v16:dispatch(v1((tostring(v20))));
            v16:dispatch(v2(false));
        end;
        local function v23(v22) --[[ Line: 29 ]]
            -- upvalues: v16 (copy), v1 (ref), v2 (ref)
            v16:dispatch(v1(v22));
            v16:dispatch(v2(false));
        end;
        local v24 = v7(v14[1]);
        return v6({
            v24
        }, v17.StudioAssetService):andThen(function(v25) --[[ Line: 36 ]]
            -- upvalues: v9 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref), v5 (ref), v19 (copy), v23 (copy)
            return v9:uploadCatalogItemFormat(v10, v11.Name, v12, v13, true, v5.AVATAR_MESHPART_ACCESSORY_FORMAT, v25):andThen(v19, v23);
        end, v21);
    end;
end;