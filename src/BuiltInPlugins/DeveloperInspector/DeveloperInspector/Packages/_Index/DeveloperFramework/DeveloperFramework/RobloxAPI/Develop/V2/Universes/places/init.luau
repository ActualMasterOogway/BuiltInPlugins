return function(v0, v1) --[[ Line: 33 ]]
    return function(v2, v3, v4, v5) --[[ Line: 38 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("universeId must be number, received %s", (type(v2))));
        if v3 then
            assert(type(v3) == "string", string.format("cursor must be number, received %s", (type(v3))));
        end;
        v4 = v4 or 10;
        assert(type(v4) == "number", string.format("limit must be number, received %s", (type(v4))));
        v5 = v5 or "Asc";
        assert(type(v5) == "string", string.format("sortOrder must be string, received %s", (type(v5))));
        local v6 = v1.composeUrl(v1.DEVELOP_URL, string.format("v2/universes/%d/places", v2), {
            limit = v4, 
            sortOrder = v5, 
            cursor = v3
        });
        return {
            getUrl = function() --[[ Line: 55 ]] --[[ Name: getUrl ]]
                -- upvalues: v6 (copy)
                return v6;
            end, 
            makeRequest = function() --[[ Line: 59 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v6 (copy)
                local v7 = v0:get(v6);
                local v8 = v0:handleRetry(v7);
                return v0:parseJson(v8);
            end
        };
    end;
end;