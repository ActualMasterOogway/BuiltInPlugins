local l_HttpService_0 = game:GetService("HttpService");
return function(v1, v2) --[[ Line: 70 ]]
    -- upvalues: l_HttpService_0 (copy)
    return function(v3, v4) --[[ Line: 73 ]]
        -- upvalues: v2 (copy), v1 (copy), l_HttpService_0 (ref)
        assert(type(v3) == "number", string.format("universeId must be of type number, received %s", (type(v3))));
        if v4 ~= nil then
            assert(type(v4) == "table", string.format("body must be of type table, received %s", (type(v4))));
        end;
        local v5 = v2.composeUrl(v2.DEVELOP_URL, string.format("v2/universes/%d/configuration", v3));
        return {
            getUrl = function() --[[ Line: 85 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 89 ]] --[[ Name: makeRequest ]]
                -- upvalues: v4 (copy), v1 (ref), v5 (copy), l_HttpService_0 (ref)
                if v4 == nil then
                    local v6 = v1:get(v5);
                    local v7 = v1:handleRetry(v6);
                    return v1:parseJson(v7);
                else
                    local v8 = v1:patch(v5, l_HttpService_0:JSONEncode(v4), {
                        ["Content-Type"] = "application/json"
                    });
                    return v1:parseJson(v8);
                end;
            end
        };
    end;
end;