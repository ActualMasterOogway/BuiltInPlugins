local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("RobloxAPI").Parent;
local v2 = require(l_Parent_0.Util.Typecheck.t);
return function(v3, v4) --[[ Line: 19 ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return function(v5, v6) --[[ Line: 21 ]]
        -- upvalues: v2 (ref), v4 (copy), v3 (copy), l_HttpService_0 (ref)
        assert(v2.number(v5), string.format("universeId must be a number, received %s", (type(v5))));
        assert(v2.string(v6), string.format("contactEmail must be a string, received %s", (type(v6))));
        local v7 = v4.composeUrl(v4.APIS_URL, "studio-moderation/v1/" .. v5 .. "/contacts");
        return {
            getUrl = function() --[[ Line: 28 ]] --[[ Name: getUrl ]]
                -- upvalues: v7 (copy)
                return v7;
            end, 
            makeRequest = function() --[[ Line: 31 ]] --[[ Name: makeRequest ]]
                -- upvalues: v3 (ref), v7 (copy), l_HttpService_0 (ref), v6 (copy)
                local v8 = v3:post(v7, l_HttpService_0:JSONEncode({
                    email = v6
                }), {
                    ["Content-Type"] = "application/json"
                });
                return v3:parseJson(v8);
            end
        };
    end;
end;