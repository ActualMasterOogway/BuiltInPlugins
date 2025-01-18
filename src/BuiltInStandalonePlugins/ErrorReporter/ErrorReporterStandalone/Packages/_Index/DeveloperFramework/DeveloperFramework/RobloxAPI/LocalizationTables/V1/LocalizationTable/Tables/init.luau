return function(v0, v1) --[[ Line: 9 ]]
    return function(v2, v3, v4) --[[ Line: 13 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "string", string.format("tableId must be string, received %s", (type(v2))));
        assert(type(v3) == "number", string.format("gameId must be number, received %s", (type(v3))));
        assert(type(v4) == "string", string.format("patch must be string, received %s", (type(v4))));
        local v5 = v1.composeUrl(v1.LOCALIZATION_TABLES_URL, string.format("v1/localization-table/tables/%s?gameId=%d", v2, v3));
        local v6 = {
            ["Content-Type"] = "application/json"
        };
        return {
            getUrl = function() --[[ Line: 28 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 32 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v5 (copy), v4 (copy), v6 (copy)
                local v7 = v0:patch(v5, v4, v6);
                return v0:parseJson(v7);
            end
        };
    end;
end;