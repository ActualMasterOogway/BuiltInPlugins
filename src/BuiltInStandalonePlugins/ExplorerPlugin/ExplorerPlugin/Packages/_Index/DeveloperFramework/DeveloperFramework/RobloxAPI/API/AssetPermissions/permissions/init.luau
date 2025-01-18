local l_HttpService_0 = game:GetService("HttpService");
local v1 = {
    Invalid = true, 
    User = true, 
    Group = true, 
    GroupRoleset = true, 
    All = true, 
    Universe = true
};
local v2 = {
    Invalid = true, 
    Edit = true, 
    Download = true, 
    Use = true, 
    CopyFromRcc = true, 
    UpdateFromRcc = true
};
return function(v3, v4) --[[ Line: 39 ]]
    -- upvalues: v1 (copy), v2 (copy), l_HttpService_0 (copy)
    return function(v5, v6, v7, v8, v9) --[[ Line: 40 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (copy), l_HttpService_0 (ref), v3 (copy)
        assert(type(v5) == "table", (("assetIds must be table, received %*"):format((type(v5)))));
        if v6 then
            assert(v1[v6], (("%* is not a valid SubjectType"):format(v6)));
        end;
        if v8 then
            assert(v2[v8], (("%* is not a valid Action"):format(v8)));
        end;
        local v10 = nil;
        v10 = if #v5 == 1 then v4.composeUrl(v4.APIS_URL, (("asset-permissions-api/v1/assets/%*/permissions"):format(v5[1]))) else v4.composeUrl(v4.APIS_URL, "asset-permissions-api/v1/assets/permissions");
        local v11 = nil;
        v11 = if #v5 == 1 then {
            requests = {
                {
                    action = v8, 
                    subjectId = tostring(v7), 
                    subjectType = v6
                }
            }
        } else {
            subjectType = v6, 
            subjectId = tostring(v7), 
            action = v8, 
            assetIds = v5
        };
        local v12 = l_HttpService_0:JSONEncode(v11);
        return {
            getUrl = function() --[[ Line: 78 ]] --[[ Name: getUrl ]]
                -- upvalues: v10 (ref)
                return v10;
            end, 
            makeRequest = function() --[[ Line: 82 ]] --[[ Name: makeRequest ]]
                -- upvalues: v5 (copy), v6 (copy), v9 (copy), v3 (ref), v10 (ref), v12 (copy)
                local v13 = nil;
                v13 = if #v5 == 1 then if v6 then if v9 then v3:delete(v10, nil, v12) else v3:patch(v10, v12) else v3:get(v10) else v3:patch(v10, v12);
                local v14 = v3:handleRetry(v13);
                return v3:parseJson(v14);
            end
        };
    end;
end;