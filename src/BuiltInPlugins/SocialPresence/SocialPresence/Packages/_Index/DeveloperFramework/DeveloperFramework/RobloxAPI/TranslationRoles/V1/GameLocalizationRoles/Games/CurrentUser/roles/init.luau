return function(v0, v1) --[[ Line: 21 ]]
    return function(v2) --[[ Line: 22 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("gameId must be number, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.TRANSLATION_ROLES_URL, string.format("v1/game-localization-roles/games/%d/current-user/roles", v2));
        return {
            getUrl = function() --[[ Line: 31 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 35 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                return v0:parseJson(v4);
            end
        };
    end;
end;