local l_Actions_0 = script.Parent.Parent.Parent.Parent.Core.Actions;
local v1 = require(l_Actions_0.CreateFavorite);
local v2 = require(l_Actions_0.DeleteFavorite);
local v3 = require(l_Actions_0.NetworkError);
return function(v4, v5, v6, v7) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return function(v8) --[[ Line: 9 ]]
        -- upvalues: v7 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (ref), v3 (ref), v1 (ref)
        if v7 then
            return v4:deleteFavorite(v5, v6):andThen(function(_) --[[ Line: 11 ]]
                -- upvalues: v8 (copy), v2 (ref), v6 (ref)
                v8:dispatch(v2(v6));
            end, function(v10) --[[ Line: 13 ]]
                -- upvalues: v8 (copy), v3 (ref)
                v8:dispatch(v3(v10));
            end);
        else
            return v4:postFavorite(v5, v6):andThen(function(_) --[[ Line: 17 ]]
                -- upvalues: v8 (copy), v1 (ref), v6 (ref)
                v8:dispatch(v1(v6));
            end, function(v12) --[[ Line: 19 ]]
                -- upvalues: v8 (copy), v3 (ref)
                v8:dispatch(v3(v12));
            end);
        end;
    end;
end;