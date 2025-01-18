return function(v0, v1) --[[ Line: 12 ]]
    return function(v2, v3) --[[ Line: 13 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", (("userId must be number, received %*"):format((type(v2)))));
        local v4 = v1.composeUrl(v1.APIS_URL, ("creator-inventory-api/v1/users/%*/creator-inventory-items"):format(v2), v3);
        return {
            getUrl = function() --[[ Line: 23 ]] --[[ Name: getUrl ]]
                -- upvalues: v4 (copy)
                return v4;
            end, 
            makeRequest = function() --[[ Line: 27 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v4 (copy)
                local v5 = v0:get(v4);
                local v6 = v0:handleRetry(v5);
                return v0:parseJson(v6);
            end
        };
    end;
end;