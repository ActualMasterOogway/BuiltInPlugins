return function(v0, v1) --[[ Line: 11 ]]
    return function(v2, v3) --[[ Line: 12 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "table", (("pluginIds must be table, received %*"):format((type(v2)))));
        local v4 = v1.composeUrl(v1.APIS_URL, ("studio-plugin-api/v1/plugins?pluginIds=%*"):format((table.concat(v2, ","))), v3);
        return {
            getUrl = function() --[[ Line: 21 ]] --[[ Name: getUrl ]]
                -- upvalues: v4 (copy)
                return v4;
            end, 
            makeRequest = function() --[[ Line: 25 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v4 (copy)
                local v5 = v0:get(v4);
                local v6 = v0:handleRetry(v5);
                return v0:parseJson(v6);
            end
        };
    end;
end;