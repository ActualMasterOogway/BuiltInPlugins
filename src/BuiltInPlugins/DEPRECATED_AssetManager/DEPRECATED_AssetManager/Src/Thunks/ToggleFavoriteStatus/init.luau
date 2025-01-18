local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.IncrementAssetFavoriteCount);
local v2 = require(l_Parent_0.Src.Actions.SetAssetFavorited);
return function(v3, v4, v5, v6) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy), v2 (ref), v1 (ref)
        v3.Catalog.V1.Favorites.Assets.favorite(v4, v5, v6):makeRequest():andThen(function(v8) --[[ Line: 11 ]]
            -- upvalues: v7 (copy), v2 (ref), v4 (ref), v6 (ref), v1 (ref)
            local l_responseBody_0 = v8.responseBody;
            if l_responseBody_0 == "{}" or l_responseBody_0 == "null" then
                v7:dispatch(v2(v4, not v6));
                if v6 then
                    v7:dispatch(v1(v4, -1));
                    return;
                else
                    v7:dispatch(v1(v4, 1));
                end;
            end;
        end, function() --[[ Line: 21 ]]
            -- upvalues: v4 (ref)
            error("Failed to get asset favorite information for asset id: ", v4);
        end);
    end;
end;