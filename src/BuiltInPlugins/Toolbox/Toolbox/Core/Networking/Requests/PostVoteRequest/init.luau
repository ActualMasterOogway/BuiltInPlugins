local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Actions.PostVote);
return function(v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy), v3 (ref), v1 (ref), v2 (ref)
        return v4:postVote(v5, v6):andThen(function(v8) --[[ Line: 10 ]]
            -- upvalues: v7 (copy), v3 (ref), v5 (ref), v6 (ref)
            local l_responseBody_0 = v8.responseBody;
            v7:dispatch(v3(v5, l_responseBody_0, v6));
        end, function(v10) --[[ Line: 13 ]]
            -- upvalues: v1 (ref), v7 (copy), v2 (ref)
            if v1.shouldDebugWarnings() then
                warn("Voting unsucessful");
            end;
            v7:dispatch(v2(v10));
        end);
    end;
end;