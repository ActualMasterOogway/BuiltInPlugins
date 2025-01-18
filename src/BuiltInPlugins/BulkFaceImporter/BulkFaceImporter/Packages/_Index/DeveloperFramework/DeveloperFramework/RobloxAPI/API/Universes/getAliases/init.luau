return function(v0, v1) --[[ Line: 51 ]]
    return function(v2, v3) --[[ Line: 54 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("universeId must be number, received %s", (type(v2))));
        assert(type(v3) == "number", string.format("universeId must be number, received %s", (type(v3))));
        local v4 = v1.composeUrl(v1.APIS_URL, "content-aliases-api/v1/universes/get-aliases", {
            universeId = v2, 
            page = v3
        });
        return {
            getUrl = function() --[[ Line: 63 ]] --[[ Name: getUrl ]]
                -- upvalues: v4 (copy)
                return v4;
            end, 
            makeRequest = function() --[[ Line: 67 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v4 (copy)
                local v5 = v0:get(v4);
                local v6 = v0:handleRetry(v5);
                return v0:parseJson(v6);
            end
        };
    end;
end;