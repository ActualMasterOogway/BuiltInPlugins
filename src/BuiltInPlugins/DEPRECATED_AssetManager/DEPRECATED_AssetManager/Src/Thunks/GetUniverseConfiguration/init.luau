local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetUniverseName);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v1 (ref)
        v2.Develop.V2.Universes.configuration(game.GameId):makeRequest():andThen(function(v4) --[[ Line: 7 ]]
            -- upvalues: v3 (copy), v1 (ref)
            local l_responseBody_0 = v4.responseBody;
            if not l_responseBody_0 then
                return;
            else
                v3:dispatch(v1(l_responseBody_0.name));
                return;
            end;
        end, function() --[[ Line: 13 ]]
            error("Failed to load universe configuration");
        end);
    end;
end;