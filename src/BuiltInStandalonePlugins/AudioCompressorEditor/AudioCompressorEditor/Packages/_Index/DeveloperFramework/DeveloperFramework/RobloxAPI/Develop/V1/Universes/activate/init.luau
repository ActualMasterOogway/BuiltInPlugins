return function(v0, v1) --[[ Line: 15 ]]
    return function(v2) --[[ Line: 17 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("universeId must be number, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.DEVELOP_URL, string.format("v1/universes/%d/activate", v2));
        return {
            getUrl = function() --[[ Line: 23 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 27 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:post(v3, "");
                return v0:parseJson(v4);
            end
        };
    end;
end;