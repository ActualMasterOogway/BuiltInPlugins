return function(v0, v1) --[[ Line: 13 ]]
    return function(v2, v3, v4) --[[ Line: 14 ]]
        -- upvalues: v1 (copy), v0 (copy)
        assert(type(v2) == "number", (("groupId must be number, received %*"):format((type(v2)))));
        assert(type(v3) == "string", (("assetType must be string, received %*"):format((type(v3)))));
        local v5 = v1.composeUrl(v1.APIS_URL, ("toolbox-service/v1/creations/group/%*/%*"):format(v2, v3), v4);
        return {
            getUrl = function() --[[ Line: 25 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 29 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v5 (copy)
                local v6 = v0:get(v5);
                local v7 = v0:handleRetry(v6);
                return v0:parseJson(v7);
            end
        };
    end;
end;