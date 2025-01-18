local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v3 = {};
    setmetatable(v3, v2);
    return v3;
end;
v2.CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync_Impl = function(_, ...) --[[ Line: 15 ]] --[[ Name: CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync_Impl ]]
    return {
        AssetId = "123"
    };
end;
v2.CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync = function(v5, ...) --[[ Line: 20 ]] --[[ Name: CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync ]]
    -- upvalues: l_Promise_0 (copy)
    local v6 = {
        ...
    };
    return l_Promise_0.new(function(v7, _) --[[ Line: 22 ]]
        -- upvalues: v5 (copy), v6 (copy)
        v7(v5:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync_Impl(unpack(v6)));
    end);
end;
return v2;