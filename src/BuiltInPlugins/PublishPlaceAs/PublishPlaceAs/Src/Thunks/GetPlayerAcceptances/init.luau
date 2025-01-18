local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetPlayerAcceptance);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 5 ]]
        -- upvalues: v2 (copy), v1 (ref)
        v2.APIS.UserAgreements.V1.agreementsResolution("App"):makeRequest():andThen(function(v4) --[[ Line: 6 ]]
            -- upvalues: v3 (copy), v1 (ref)
            v3:dispatch(v1(next(v4.responseBody) == nil));
        end, function() --[[ Line: 8 ]]
            error("Failed to get Player user agreements acceptances.");
        end);
    end;
end;