local v0 = require(script.Parent.Promise);
local v1 = require(script.Parent.HttpResponse);
local v2 = require(script.Parent.StatusCodes);
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local function v8(v5) --[[ Line: 14 ]] --[[ Name: getHttpStatus ]]
    -- upvalues: v2 (copy)
    for _, v7 in pairs(v2) do
        if v7 >= 100 and v5:find((tostring(v7))) then
            return v7;
        end;
    end;
    if v5:find("2%d%d") then
        return v2.OK;
    elseif v5:find("curl_easy_perform") and v5:find("SSL") then
        return v2.BAD_TLS;
    else
        return v2.UNKNOWN_ERROR;
    end;
end;
local function v17(v9, v10, v11) --[[ Line: 38 ]] --[[ Name: baseHttpHandler ]]
    -- upvalues: v2 (copy), v8 (copy), v1 (copy)
    local v12 = tick();
    local l_status_0, l_result_0 = pcall(v11);
    local v15 = (tick() - v12) * 1000;
    local l_OK_0 = v2.OK;
    if not l_status_0 then
        l_OK_0 = v8(l_result_0);
    end;
    return v1.new(l_result_0, v15, l_OK_0, v9, v10);
end;
local function v20(v18, v19) --[[ Line: 62 ]] --[[ Name: httpGet ]]
    -- upvalues: v17 (copy)
    return v17("GET", v19, function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy), v19 (copy)
        return v18:GetAsyncFullUrl(v19);
    end);
end;
local function v25(v21, v22, v23, v24) --[[ Line: 72 ]] --[[ Name: httpPost ]]
    -- upvalues: v17 (copy)
    if not v24 then
        v24 = Enum.HttpContentType.ApplicationJson;
    end;
    return v17("POST", v22, function() --[[ Line: 77 ]]
        -- upvalues: v21 (copy), v22 (copy), v23 (copy), v24 (ref)
        return v21:PostAsyncFullUrl(v22, v23, Enum.ThrottlingPriority.Default, v24);
    end);
end;
local function v28(v26, v27) --[[ Line: 85 ]] --[[ Name: httpDelete ]]
    -- upvalues: v17 (copy)
    return v17("DELETE", v27, function() --[[ Line: 86 ]]
        -- upvalues: v26 (copy), v27 (copy)
        return v26:RequestAsync(v27);
    end);
end;
local function v31(v29, v30) --[[ Line: 91 ]] --[[ Name: httpPatch ]]
    -- upvalues: v17 (copy)
    return v17("PATCH", v30, function() --[[ Line: 92 ]]
        -- upvalues: v29 (copy), v30 (copy)
        return v29:RequestAsync(v30);
    end);
end;
local function v37(v32, ...) --[[ Line: 99 ]] --[[ Name: createHttpPromise ]]
    -- upvalues: v0 (copy), v2 (copy)
    local v33 = {
        ...
    };
    return (v0.new(function(v34, v35) --[[ Line: 102 ]]
        -- upvalues: v32 (copy), v33 (copy), v2 (ref)
        spawn(function() --[[ Line: 105 ]]
            -- upvalues: v32 (ref), v33 (ref), v2 (ref), v34 (copy), v35 (copy)
            local v36 = v32(unpack(v33));
            if v36.responseCode == v2.OK then
                v34(v36);
                return;
            else
                v35(v36);
                return;
            end;
        end);
    end));
end;
local v38 = {};
v38.__index = v38;
v38.new = function() --[[ Line: 126 ]] --[[ Name: new ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), v38 (copy)
    local v39 = {
        _httpImpl = l_HttpRbxApiService_0
    };
    setmetatable(v39, v38);
    return v39;
end;
v38.jsonEncode = function(_, v41) --[[ Line: 137 ]] --[[ Name: jsonEncode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode(v41);
end;
v38.jsonDecode = function(_, v43) --[[ Line: 141 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONDecode(v43);
end;
v38.httpGetJson = function(v44, v45) --[[ Line: 149 ]] --[[ Name: httpGetJson ]]
    -- upvalues: v37 (copy), v20 (copy)
    return v37(v20, v44._httpImpl, v45):andThen(function(v46) --[[ Line: 152 ]]
        -- upvalues: v44 (copy)
        v46.responseBody = v44:jsonDecode(v46.responseBody);
        return v46;
    end, function(v47) --[[ Line: 157 ]]
        return v47;
    end);
end;
v38.httpPostJson = function(v48, v49, v50) --[[ Line: 166 ]] --[[ Name: httpPostJson ]]
    -- upvalues: v37 (copy), v25 (copy)
    return v37(v25, v48._httpImpl, v49, v50):andThen(function(v51) --[[ Line: 167 ]]
        -- upvalues: v48 (copy)
        v51.responseBody = v48:jsonDecode(v51.responseBody);
        return v51;
    end, function(v52) --[[ Line: 170 ]]
        return v52;
    end);
end;
v38.httpPost = function(v53, v54, v55) --[[ Line: 178 ]] --[[ Name: httpPost ]]
    -- upvalues: v37 (copy), v25 (copy)
    return v37(v25, v53._httpImpl, v54, v55);
end;
v38.httpGet = function(v56, v57) --[[ Line: 183 ]] --[[ Name: httpGet ]]
    -- upvalues: v37 (copy), v20 (copy)
    return v37(v20, v56._httpImpl, v57);
end;
v38.httpDelete = function(v58, v59) --[[ Line: 188 ]] --[[ Name: httpDelete ]]
    -- upvalues: v37 (copy), v28 (copy)
    local v60 = {
        Url = v59, 
        Method = "DELETE"
    };
    return v37(v28, v58._httpImpl, v60);
end;
v38.httpPatch = function(v61, v62, v63) --[[ Line: 197 ]] --[[ Name: httpPatch ]]
    -- upvalues: v37 (copy), v31 (copy)
    local v64 = {
        Url = v62, 
        Method = "PATCH", 
        Body = v63, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v37(v31, v61._httpImpl, v64);
end;
v38.requestInternal = function(_, v66) --[[ Line: 210 ]] --[[ Name: requestInternal ]]
    -- upvalues: v0 (copy), l_HttpService_0 (copy), v2 (copy)
    return v0.new(function(v67, v68) --[[ Line: 211 ]]
        -- upvalues: l_HttpService_0 (ref), v66 (copy), v2 (ref)
        spawn(function() --[[ Line: 213 ]]
            -- upvalues: l_HttpService_0 (ref), v66 (ref), v2 (ref), v68 (copy), v67 (copy)
            l_HttpService_0:RequestInternal(v66):Start(function(v69, v70) --[[ Line: 214 ]]
                -- upvalues: v2 (ref), v68 (ref), v67 (ref)
                if v69 then
                    if v70.StatusCode >= v2.BAD_REQUEST then
                        v68("HTTP error: " .. tostring(v70.StatusCode));
                        return;
                    else
                        v67(v70.Body);
                        return;
                    end;
                else
                    v68("HTTP error: " .. tostring(v70.HttpError));
                    return;
                end;
            end);
        end);
    end);
end;
return v38;