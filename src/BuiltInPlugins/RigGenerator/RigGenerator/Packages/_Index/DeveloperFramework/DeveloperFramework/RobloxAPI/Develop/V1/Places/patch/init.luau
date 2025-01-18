local l_HttpService_0 = game:GetService("HttpService");
return function(v1, v2) --[[ Line: 11 ]]
    -- upvalues: l_HttpService_0 (copy)
    return function(v3, v4) --[[ Line: 14 ]]
        -- upvalues: v2 (copy), v1 (copy), l_HttpService_0 (ref)
        assert(type(v3) == "number", string.format("placeId must be number, received %s", (type(v3))));
        assert(type(v4) == "table", string.format("body must be of type table, received %s", (type(v4))));
        local v5 = v2.composeUrl(v2.DEVELOP_URL, string.format("v1/places/%d", v3));
        return {
            getUrl = function() --[[ Line: 21 ]] --[[ Name: getUrl ]]
                -- upvalues: v5 (copy)
                return v5;
            end, 
            makeRequest = function() --[[ Line: 25 ]] --[[ Name: makeRequest ]]
                -- upvalues: v1 (ref), v5 (copy), l_HttpService_0 (ref), v4 (copy)
                local v6 = v1:patch(v5, l_HttpService_0:JSONEncode(v4), {
                    ["Content-Type"] = "application/json"
                });
                return v1:parseJson(v6);
            end
        };
    end;
end;