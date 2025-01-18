local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
local v3 = require(l_Parent_0.Core.Networking.Requests.GetVersionsHistoryRequest);
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v1 (copy), v2 (copy)
    return function(v7) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v5 (copy), v6 (copy), v3 (ref), v1 (ref), v2 (ref)
        return v4:postRevertVersion(v5, v6):andThen(function(_) --[[ Line: 11 ]]
            -- upvalues: v7 (copy), v3 (ref), v4 (ref), v5 (ref)
            v7:dispatch(v3(v4, v5));
        end, function(v9) --[[ Line: 14 ]]
            -- upvalues: v1 (ref), v7 (copy), v2 (ref)
            if v1.shouldDebugWarnings() then
                warn("Got false response from ReverVersion");
            end;
            v7:dispatch(v2(v9));
        end);
    end;
end;