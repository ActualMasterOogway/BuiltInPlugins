local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetAssetFavorited);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    return function(v5) --[[ Line: 6 ]]
        -- upvalues: v2 (copy), v3 (copy), v4 (copy), v1 (ref)
        v2.Catalog.V1.Favorites.Assets.favorite(v3, v4):makeRequest():andThen(function(v6) --[[ Line: 7 ]]
            -- upvalues: v5 (copy), v1 (ref), v3 (ref)
            if v6.responseBody ~= "null" then
                v5:dispatch(v1(v3, true));
                return;
            else
                v5:dispatch(v1(v3, false));
                return;
            end;
        end, function() --[[ Line: 14 ]]
            -- upvalues: v3 (ref)
            error("Failed to get asset favorite information for asset id: ", v3);
        end);
    end;
end;