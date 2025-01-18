return function(v0, v1) --[[ Line: 19 ]]
    return function() --[[ Line: 20 ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v2 = v1.composeUrl(v1.DEVELOP_URL, "v1/user/groups/canmanage");
        return {
            getUrl = function() --[[ Line: 24 ]] --[[ Name: getUrl ]]
                -- upvalues: v2 (copy)
                return v2;
            end, 
            makeRequest = function() --[[ Line: 28 ]] --[[ Name: makeRequest ]]
                -- upvalues: v0 (ref), v2 (copy)
                local v3 = v0:get(v2);
                local v4 = v0:handleRetry(v3);
                return v0:parseJson(v4);
            end
        };
    end;
end;