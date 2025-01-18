local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.getUserId);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetOwnsAsset);
local l_Packages_0 = l_Parent_0.Packages;
local v6 = require(l_Packages_0.Framework);
local l_RobloxAPI_0 = v6.RobloxAPI;
local l_Networking_0 = v6.Http.Networking;
local l_Promise_0 = v6.Util.Promise;
local v10 = l_RobloxAPI_0.new({
    networking = l_Networking_0.new({
        isInternal = true, 
        loggingLevel = v1.shouldDebugUrls() and 1 or nil
    })
});
return function(_, v12) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), l_Promise_0 (copy), v2 (copy), v10 (copy), v1 (copy), v3 (copy)
    return function(v13) --[[ Line: 31 ]]
        -- upvalues: v12 (ref), v4 (ref), l_Promise_0 (ref), v2 (ref), v10 (ref), v1 (ref), v3 (ref)
        local v14 = v13:getState().purchase.cachedOwnedAssets[tostring(v12)];
        if v14 ~= nil then
            v13:dispatch(v4(v14, v12));
            return l_Promise_0.resolve(v14);
        else
            local v15 = v2();
            if typeof(v12) == "string" then
                v12 = tonumber(v12) or 0;
            end;
            return (v10.Inventory.V1.Users.Items.isOwned(v15, Enum.AvatarItemType.Asset, v12):makeRequest():andThen(function(v16) --[[ Line: 49 ]]
                -- upvalues: v12 (ref), v13 (copy), v4 (ref)
                local v17 = tostring(v16.responseBody) == "true";
                v12 = tonumber(v12);
                v13:dispatch(v4(v17, v12));
                return v17;
            end, function(v18) --[[ Line: 54 ]]
                -- upvalues: v1 (ref), v13 (copy), v3 (ref)
                if v1.shouldDebugWarnings() then
                    warn("Could not get asset ownership");
                end;
                v13:dispatch(v3(v18));
            end));
        end;
    end;
end;