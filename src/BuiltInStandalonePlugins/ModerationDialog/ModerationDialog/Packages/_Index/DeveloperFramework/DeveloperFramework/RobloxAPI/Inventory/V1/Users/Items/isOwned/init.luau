return function(v0, v1) --[[ Line: 13 ]]
    return function(v2, v3, v4) --[[ Line: 17 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(v2 > 0, "Expected userId to be a positive number.");
        assert(v4 > 0, "Expected itemTargetId to be a positive number.");
        local v5 = v1.composeUrl(v1.INVENTORY_URL, string.format("v1/users/%d/items/%s/%d/is-owned", v2, v3.Name, v4));
        return {
            getUrl = function() --[[ Line: 27 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 31 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v5 (copy)
                local v6 = v0:get(v5);
                return v0:handleRetry(v6);
            end
        };
    end;
end;