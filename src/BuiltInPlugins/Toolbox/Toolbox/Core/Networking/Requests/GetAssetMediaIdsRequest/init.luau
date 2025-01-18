local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetAssetMediaIds);
return function(v5, v6, v7, v8) --[[ Line: 9 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    return function(v9) --[[ Line: 10 ]]
        -- upvalues: v8 (copy), v7 (copy), v6 (copy), v5 (copy), v4 (ref), v2 (ref), v3 (ref)
        if not v8 then
            local v10 = v9:getState();
            if v7 and v10 and v10.assetMediaIds or v10 and v10.assets and v10.assets.idToAssetMap and v10.assets.idToAssetMap[v6] and v10.assets.idToAssetMap[v6].Asset and v10.assets.idToAssetMap[v6].Asset.AssetMediaIds then
                return;
            end;
        end;
        return v5:getAssetMediaIds(v6):andThen(function(v11) --[[ Line: 28 ]]
            -- upvalues: v9 (copy), v4 (ref), v6 (ref)
            local v12 = if v11 and v11.responseBody and v11.responseBody.data then v11.responseBody.data else {};
            v9:dispatch(v4(v6, v12));
            return v12;
        end, function(v13) --[[ Line: 37 ]]
            -- upvalues: v2 (ref), v6 (ref), v9 (copy), v3 (ref)
            if v2.shouldDebugWarnings() then
                warn("Could not get asset media for asset id:", v6);
            end;
            v9:dispatch(v3(v13));
        end);
    end;
end;