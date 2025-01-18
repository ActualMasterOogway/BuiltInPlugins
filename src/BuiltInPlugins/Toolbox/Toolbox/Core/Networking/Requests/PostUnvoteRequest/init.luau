local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.PostUnvote);
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v6) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), v5 (copy), v3 (ref), v1 (ref), v2 (ref)
        return v4:postUnvote(v5):andThen(function(v7) --[[ Line: 10 ]]
            -- upvalues: v6 (copy), v3 (ref), v5 (ref)
            local l_responseBody_0 = v7.responseBody;
            v6:dispatch(v3(v5, l_responseBody_0));
        end, function(v9) --[[ Line: 13 ]]
            -- upvalues: v1 (ref), v6 (copy), v2 (ref)
            if v1.shouldDebugWarnings() then
                warn("Unvoting unsucessful");
            end;
            v6:dispatch(v2(v9));
        end);
    end;
end;