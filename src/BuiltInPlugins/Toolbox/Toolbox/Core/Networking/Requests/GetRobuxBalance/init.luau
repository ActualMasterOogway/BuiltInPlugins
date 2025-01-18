local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.getUserId);
local v3 = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetRobuxBalance);
return function(v5) --[[ Line: 16 ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy), v3 (copy)
    return function(v6) --[[ Line: 17 ]]
        -- upvalues: v2 (ref), v5 (copy), v4 (ref), v1 (ref), v3 (ref)
        local v7 = v2();
        return v5:getRobuxBalance(v7):andThen(function(v8) --[[ Line: 19 ]]
            -- upvalues: v6 (copy), v4 (ref)
            local l_responseBody_0 = v8.responseBody;
            v6:dispatch(v4((tonumber(l_responseBody_0.robux))));
        end, function(v10) --[[ Line: 22 ]]
            -- upvalues: v1 (ref), v6 (copy), v3 (ref)
            if v1.shouldDebugWarnings() then
                warn("Could not get Robux balance");
            end;
            v6:dispatch(v3(v10));
        end);
    end;
end;