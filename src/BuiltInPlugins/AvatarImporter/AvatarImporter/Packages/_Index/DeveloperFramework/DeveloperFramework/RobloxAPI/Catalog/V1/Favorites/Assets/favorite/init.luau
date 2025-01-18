return function(v0, v1) --[[ Line: 38 ]]
    return function(v2, v3, v4) --[[ Line: 41 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(tonumber(v2) > 0, "Expected assetId to be a positive number.");
        assert(tonumber(v3) > 0, "Expected userId to be a positive number.");
        local v5 = v1.composeUrl(v1.CATALOG_URL, string.format("v1/favorites/users/%s/assets/%s/favorite", v3, v2));
        return {
            getUrl = function() --[[ Line: 50 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 54 ]] --[[ Name: makeRequest ]]
                -- upvalues: v4 (copy), v0 (ref), v5 (copy)
                local v6 = nil;
                if v4 == nil then
                    v6 = v0:get(v5);
                elseif v4 == true then
                    v6 = v0:delete(v5);
                elseif v4 == false then
                    v6 = v0:post(v5, "");
                end;
                return v0:handleRetry(v6);
            end
        };
    end;
end;