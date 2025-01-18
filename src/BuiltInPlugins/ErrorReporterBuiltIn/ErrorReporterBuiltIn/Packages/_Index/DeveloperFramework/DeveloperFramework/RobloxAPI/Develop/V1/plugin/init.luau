return function(v0, v1) --[[ Line: 39 ]]
    return function(v2) --[[ Line: 41 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "table", "Expected an array of pluginIds.");
        local v3 = v1.composeUrl(v1.APIS_URL, "studio-plugin-api/v1/plugins", {
            pluginIds = v2
        });
        return {
            getUrl = function() --[[ Line: 49 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 53 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                local v5 = v0:handleRetry(v4);
                return v0:parseJson(v5);
            end
        };
    end;
end;