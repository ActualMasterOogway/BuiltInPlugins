return function(v0, v1) --[[ Line: 12 ]]
    return function(v2) --[[ Line: 15 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(tonumber(v2) > 0, "Expected assetId to be a positive number.");
        local v3 = v1.composeUrl(v1.CATALOG_URL, string.format("v1/favorites/assets/%s/count", v2));
        return {
            getUrl = function() --[[ Line: 21 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 25 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                return v0:handleRetry(v4);
            end
        };
    end;
end;