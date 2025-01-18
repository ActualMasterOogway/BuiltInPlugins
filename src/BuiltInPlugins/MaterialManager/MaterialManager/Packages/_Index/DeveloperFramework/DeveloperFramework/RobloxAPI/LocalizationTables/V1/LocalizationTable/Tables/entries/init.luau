return function(v0, v1) --[[ Line: 42 ]]
    return function(v2, v3, v4) --[[ Line: 44 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "string", string.format("tableId must be string, received %s", (type(v2))));
        assert(type(v3) == "string", string.format("cursor must be string, received %s", (type(v3))));
        assert(type(v4) == "number", string.format("gameId must be number, received %s", (type(v4))));
        local v5 = v1.composeUrl(v1.LOCALIZATION_TABLES_URL, string.format("v1/localization-table/tables/%s/entries?cursor=%s&gameId=%d", v2, v3, v4));
        return {
            getUrl = function() --[[ Line: 55 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 59 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v5 (copy)
                local v6 = v0:get(v5);
                return v0:parseJson(v6);
            end
        };
    end;
end;