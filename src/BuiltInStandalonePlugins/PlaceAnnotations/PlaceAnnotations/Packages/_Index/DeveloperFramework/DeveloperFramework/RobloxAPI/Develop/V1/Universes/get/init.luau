return function(v0, v1) --[[ Line: 28 ]]
    return function(v2) --[[ Line: 30 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", string.format("universeId must be number, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.DEVELOP_URL, string.format("v1/universes/%d", v2));
        return {
            getUrl = function() --[[ Line: 36 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 40 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                local v5 = v0:handleRetry(v4);
                return v0:parseJson(v5);
            end
        };
    end;
end;