local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetAssetFavoriteCount);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (ref)
        v2.Catalog.V1.Favorites.Assets.count(v3):makeRequest():andThen(function(v5) --[[ Line: 7 ]]
            -- upvalues: v4 (copy), v1 (ref), v3 (ref)
            local l_responseBody_0 = v5.responseBody;
            if l_responseBody_0 then
                v4:dispatch(v1(v3, l_responseBody_0));
                return;
            else
                v4:dispatch(v1(v3, 0));
                return;
            end;
        end, function() --[[ Line: 14 ]]
            -- upvalues: v3 (ref)
            error("Failed to get asset favorite count information for asset id: ", v3);
        end);
    end;
end;