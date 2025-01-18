return function(_, v1) --[[ Line: 10 ]]
    return function(v2) --[[ Line: 11 ]]
        -- upvalues: v1 (copy)
        assert(type(v2) == "number", string.format("gameId must be number, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.BASE_URL, string.format("localization/games/%d/configure", v2));
        return {
            getUrl = function() --[[ Line: 17 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end
        };
    end;
end;