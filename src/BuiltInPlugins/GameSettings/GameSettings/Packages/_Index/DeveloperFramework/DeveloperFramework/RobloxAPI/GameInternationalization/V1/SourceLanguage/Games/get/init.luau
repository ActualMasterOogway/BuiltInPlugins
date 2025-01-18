return function(v0, v1) --[[ Line: 20 ]]
    return function(v2) --[[ Line: 21 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("universeId must be number, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.GAMES_INTERNATIONALIZATION_URL, string.format("v1/source-language/games/%d", v2));
        return {
            getUrl = function() --[[ Line: 30 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 34 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                return v0:parseJson(v0:handleRetry(v4));
            end
        };
    end;
end;