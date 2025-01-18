local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.SetPluginData);
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (ref), v1 (ref), v2 (ref)
        return v4:getPluginInfo(v5):andThen(function(v7) --[[ Line: 10 ]]
            -- upvalues: v6 (copy), v3 (ref)
            local l_data_0 = v7.responseBody.data;
            v6:dispatch(v3(l_data_0[1]));
        end, function(v9) --[[ Line: 15 ]]
            -- upvalues: v1 (ref), v6 (copy), v2 (ref)
            if v1.shouldDebugWarnings() then
                warn("Unable to fetch plugin data");
            end;
            v6:dispatch(v2(v9));
        end);
    end;
end;