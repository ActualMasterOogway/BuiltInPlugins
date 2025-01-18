return function(v0, v1) --[[ Line: 17 ]]
    return function(v2, v3) --[[ Line: 18 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("gameId must be number, received %s", (type(v2))));
        assert(type(v3) == "string", string.format("body must be string, received %s", (type(v3))));
        local v4 = v1.composeUrl(v1.GAMES_INTERNATIONALIZATION_URL, string.format("v1/supported-languages/games/%d", v2));
        local v5 = {
            ["Content-Type"] = "application/json"
        };
        return {
            getUrl = function() --[[ Line: 32 ]] --[[ Name: getUrl ]]
                -- upvalues: v4 (copy)
                return v4;
            end, 
            makeRequest = function() --[[ Line: 36 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v4 (copy), v3 (copy), v5 (copy)
                local v6 = v0:patch(v4, v3, v5);
                return v0:parseJson(v6);
            end
        };
    end;
end;