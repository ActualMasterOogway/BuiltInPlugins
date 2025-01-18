local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetGameConfiguration);
local v2 = require(l_Parent_0.Src.Actions.SetChooseGameQueryState);
local v3 = require(l_Parent_0.Src.Resources.Constants);
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v6) --[[ Line: 7 ]]
        -- upvalues: v5 (copy), v4 (copy), v1 (ref), v2 (ref), v3 (ref)
        v5.Develop.V2.Universes.configuration(v4):makeRequest():andThen(function(v7) --[[ Line: 8 ]]
            -- upvalues: v6 (copy), v1 (ref)
            local l_responseBody_0 = v7.responseBody;
            v6:dispatch(v1(l_responseBody_0));
        end, function(_) --[[ Line: 11 ]]
            -- upvalues: v6 (copy), v2 (ref), v3 (ref)
            v6:dispatch(v2(v3.QUERY_STATE.QUERY_STATE_FAILED));
        end);
    end;
end;