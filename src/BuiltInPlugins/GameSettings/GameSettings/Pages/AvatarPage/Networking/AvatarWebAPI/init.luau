local l_HttpService_0 = game:GetService("HttpService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v3 = game:DefineFastFlag("GameSettingsFixPreviewAvatar", false);
local v4 = {};
local l_BaseUrl_0 = l_ContentProvider_0.BaseUrl;
for _, v7 in pairs({
    "/", 
    "www.", 
    "https:", 
    "http:"
}) do
    l_BaseUrl_0 = string.gsub(l_BaseUrl_0, v7, "");
end;
local v8 = "https://avatar." .. l_BaseUrl_0;
v4.Status = {
    PENDING = 0, 
    UNKNOWN_ERROR = -1, 
    NO_CONNECTIVITY = -2, 
    INVALID_JSON = -3, 
    BAD_TLS = -4, 
    MODERATED = -5, 
    OK = 200, 
    BAD_REQUEST = 400, 
    UNAUTHORIZED = 401, 
    FORBIDDEN = 403, 
    NOT_FOUND = 404, 
    REQUEST_TIMEOUT = 408, 
    INTERNAL_SERVER_ERROR = 500, 
    NOT_IMPLEMENTED = 501, 
    BAD_GATEWAY = 502, 
    SERVICE_UNAVAILABLE = 503, 
    GATEWAY_TIMEOUT = 504
};
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local function v15(v14) --[[ Line: 43 ]] --[[ Name: getAsyncFullUrl ]]
    -- upvalues: l_HttpRbxApiService_0 (copy)
    return l_HttpRbxApiService_0:GetAsyncFullUrl(v14);
end;
v4.GetAvatarData = function() --[[ Line: 47 ]] --[[ Name: GetAvatarData ]]
    -- upvalues: v13 (ref)
    local v16, v17 = v13("/v1/avatar");
    return v16, v17;
end;
v13 = function(v18) --[[ Line: 52 ]]
    -- upvalues: v8 (copy), v12 (ref)
    local v19 = v8 .. v18;
    local v20, v21 = v12(v19);
    return v21, v20;
end;
v9 = function(v22) --[[ Line: 60 ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONDecode(v22);
end;
v10 = function(v23) --[[ Line: 65 ]]
    return game:HttpGetAsync(v23);
end;
v11 = function(v24) --[[ Line: 69 ]]
    -- upvalues: v4 (copy)
    for _, v26 in pairs(v4.Status) do
        if v26 >= 100 and v24:find((tostring(v26))) then
            return v26;
        end;
    end;
    if v24:find("2%d%d") then
        return v4.Status.OK;
    elseif v24:find("curl_easy_perform") and v24:find("SSL") then
        return v4.Status.BAD_TLS;
    else
        return v4.Status.UNKNOWN_ERROR;
    end;
end;
v12 = function(v27) --[[ Line: 87 ]]
    -- upvalues: v3 (copy), v15 (copy), v10 (ref), v4 (copy), v11 (ref), v9 (ref)
    local v28 = nil;
    local v29 = nil;
    if v3 then
        local l_status_0, l_result_0 = pcall(v15, v27);
        v28 = l_status_0;
        v29 = l_result_0;
    else
        local l_status_1, l_result_1 = pcall(v10, v27);
        v28 = l_status_1;
        v29 = l_result_1;
    end;
    local v34 = v28 and v4.Status.OK or v11(v29);
    if v28 then
        local l_status_2, l_result_2 = pcall(v9, v29);
        v28 = l_status_2;
        v29 = l_result_2;
        v34 = v28 and v34 or v4.Status.INVALID_JSON;
    end;
    return v29, v34;
end;
return v4;