return function(v0, v1) --[[ Line: 25 ]]
    return function(v2) --[[ Line: 27 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "string", string.format("applicationName must be a string, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.APIS_URL, "user-agreements/v1/agreements-resolution/" .. v2);
        return {
            getUrl = function() --[[ Line: 34 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 37 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                local v5 = v0:handleRetry(v4);
                return v0:parseJson(v5);
            end
        };
    end;
end;