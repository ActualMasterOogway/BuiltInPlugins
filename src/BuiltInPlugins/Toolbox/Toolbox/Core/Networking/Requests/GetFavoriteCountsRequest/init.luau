local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.GetFavoriteCounts);
local v2 = require(l_Parent_0.Core.Actions.NetworkError);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v4 (copy), v1 (ref), v2 (ref)
        return v3:getFavoriteCounts(v4):andThen(function(v6) --[[ Line: 8 ]]
            -- upvalues: v5 (copy), v1 (ref), v4 (ref)
            v5:dispatch(v1(v4, v6.responseBody));
        end, function(v7) --[[ Line: 10 ]]
            -- upvalues: v5 (copy), v2 (ref)
            v5:dispatch(v2(v7));
        end);
    end;
end;