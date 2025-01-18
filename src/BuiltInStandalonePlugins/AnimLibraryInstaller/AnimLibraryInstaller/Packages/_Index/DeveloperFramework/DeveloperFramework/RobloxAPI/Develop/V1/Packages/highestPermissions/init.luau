return function(v0, v1) --[[ Line: 27 ]]
    return function(v2) --[[ Line: 29 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "table", string.format("assetIds must be number, received %s", (type(v2))));
        local v3 = v1.composeUrl(v1.DEVELOP_URL, "v1/packages/highest-permissions", {
            assetIds = v2
        });
        return {
            getUrl = function() --[[ Line: 37 ]] --[[ Name: getUrl ]]
                -- upvalues: v3 (copy)
                return v3;
            end, 
            makeRequest = function() --[[ Line: 41 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v3 (copy)
                local v4 = v0:get(v3);
                local v5 = v0:handleRetry(v4);
                return v0:parseJson(v5);
            end
        };
    end;
end;