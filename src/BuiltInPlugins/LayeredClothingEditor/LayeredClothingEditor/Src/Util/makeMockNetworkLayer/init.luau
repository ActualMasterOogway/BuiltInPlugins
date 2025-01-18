local l_HttpService_0 = game:GetService("HttpService");
local function _(v1) --[[ Line: 5 ]] --[[ Name: findQuestionMark ]]
    return v1 and string.find(tostring(v1), "?");
end;
local function _(v3) --[[ Line: 11 ]] --[[ Name: getEndpoint ]]
    local v4 = v3 and string.find(tostring(v3), "?");
    return v4 and v4 > 1 and v3:sub(1, v4 - 1) or nil;
end;
local function _(v6) --[[ Line: 18 ]] --[[ Name: getArgs ]]
    local v7 = v6 and string.find(tostring(v6), "?");
    return v7 and v7 < string.len(v6) and v6:sub(v7 + 1) or nil;
end;
return function(v9) --[[ Line: 23 ]] --[[ Name: mockNetworkLayer ]]
    -- upvalues: l_HttpService_0 (copy)
    local v19 = {
        ["https://develop.roblox.com/v1/assets"] = function(v10) --[[ Line: 25 ]]
            -- upvalues: l_HttpService_0 (ref)
            local v15 = (function(v11) --[[ Line: 26 ]] --[[ Name: parseIds ]]
                local v12 = {};
                for v13 in (string.gsub(v11, "^assetIds=", "") .. ","):gmatch("(.-),") do
                    local v14 = tonumber(v13);
                    if v14 then
                        table.insert(v12, v14);
                    end;
                end;
                return v12;
            end)(v10);
            local v16 = {
                data = {}
            };
            for v17, v18 in ipairs(v15) do
                v16.data[v17] = {
                    canHaveThumbnail = false, 
                    isArchivable = false, 
                    id = v18, 
                    isPublicDomainEnabled = false, 
                    typeId = 19, 
                    isModerated = false, 
                    isVersioningEnabled = false, 
                    name = "Merely's ROBLOX Tablet", 
                    description = "Winner: Merely. ROBLOX will be in touch to redeem this prize.", 
                    enableComments = false, 
                    isCopyingAllowed = false
                };
            end;
            return l_HttpService_0:JSONEncode(v16);
        end
    };
    local l_Url_0 = v9.Url;
    local v21 = l_Url_0 and string.find(tostring(l_Url_0), "?");
    local v22 = v21 and v21 > 1 and l_Url_0:sub(1, v21 - 1) or nil;
    v21 = v9.Url;
    local v23 = v21 and string.find(tostring(v21), "?");
    l_Url_0 = v23 and v23 < string.len(v21) and v21:sub(v23 + 1) or nil;
    return {
        Body = (v19[v22] or function() --[[ Line: 65 ]]
            -- upvalues: l_HttpService_0 (ref)
            return l_HttpService_0:JSONEncode({
                data = {}
            });
        end)(l_Url_0), 
        Success = true, 
        StatusMessage = "OK", 
        StatusCode = 200
    };
end;