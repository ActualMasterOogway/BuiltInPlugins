return function(v0, v1) --[[ Line: 50 ]]
    return function(v2, v3, v4) --[[ Line: 53 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("universeId must be number, received %s", (type(v2))));
        assert(type(v3) == "number", string.format("maxPageSize must be number, received %s", (type(v3))));
        if v4 then
            assert(type(v4) == "string", string.format("pageCursor must be string, received %s", (type(v4))));
        end;
        local v5 = v1.composeUrl(v1.APIS_URL, "content-aliases-api/v1/universes/" .. tostring(v2) .. "/aliases", {
            maxPageSize = v3, 
            pageToken = v4
        });
        return {
            getUrl = function() --[[ Line: 75 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 79 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v5 (copy)
                local v6 = v0:get(v5);
                local v7 = v0:handleRetry(v6);
                return v0:parseJson(v7);
            end
        };
    end;
end;