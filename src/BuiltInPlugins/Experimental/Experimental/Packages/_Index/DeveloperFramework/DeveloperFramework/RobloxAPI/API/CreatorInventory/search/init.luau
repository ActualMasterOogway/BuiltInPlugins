local function _(v0) --[[ Line: 12 ]] --[[ Name: getSourceField ]]
    if v0 == "User" then
        return "userids";
    elseif v0 == "Group" then
        return "groupids";
    elseif v0 == "Universe" then
        return "universeids";
    else
        error("Invalid sourceType");
        return;
    end;
end;
return function(v2, v3) --[[ Line: 24 ]]
    return function(v4, v5, v6, v7, v8) --[[ Line: 25 ]]
        -- upvalues: v3 (copy), v2 (copy)
        assert(type(v4) == "string", (("searchQuery must be string, received %*"):format((type(v4)))));
        assert(type(v5) == "string", (("assetType must be string, received %*"):format((type(v5)))));
        assert(type(v6) == "table", (("source must be table, received %*"):format((type(v6)))));
        if v7 == nil then
            v7 = 1;
        end;
        local l_Type_0 = v6.Type;
        local v10;
        if l_Type_0 == "User" then
            v10 = "userids";
        elseif l_Type_0 == "Group" then
            v10 = "groupids";
        elseif l_Type_0 == "Universe" then
            v10 = "universeids";
        else
            error("Invalid sourceType");
            v10 = nil;
        end;
        l_Type_0 = v3.composeUrl(v3.APIS_URL, (("creator-inventory-api/v1/-/creator-inventory-items:search?query=%*&filter=assetTypes=%*;%*=%*&maxPageSize=%*&pageToken=%*"):format(v4, v5, v10, v6.Id, v7, v8)));
        return {
            getUrl = function() --[[ Line: 48 ]] --[[ Name: getUrl ]]
                -- upvalues: l_Type_0 (copy)
                return l_Type_0;
            end, 
            makeRequest = function() --[[ Line: 52 ]] --[[ Name: makeRequest ]]
                -- upvalues: v2 (ref), l_Type_0 (copy)
                local v11 = v2:get(l_Type_0);
                local v12 = v2:handleRetry(v11);
                return v2:parseJson(v12);
            end
        };
    end;
end;