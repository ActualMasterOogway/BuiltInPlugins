local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v2 = require(script.Parent.HttpResponse);
local v3 = require(script.Parent.StatusCodes);
local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local function v9(v6) --[[ Line: 17 ]] --[[ Name: getHttpStatus ]]
    -- upvalues: v3 (copy)
    for _, v8 in pairs(v3) do
        if v8 >= 100 and v6:find((tostring(v8))) then
            return v8;
        end;
    end;
    if v6:find("2%d%d") then
        return v3.OK;
    elseif v6:find("curl_easy_perform") and v6:find("SSL") then
        return v3.BAD_TLS;
    else
        return v3.UNKNOWN_ERROR;
    end;
end;
local function v18(v10, v11, v12) --[[ Line: 41 ]] --[[ Name: baseHttpHandler ]]
    -- upvalues: v3 (copy), v9 (copy), v2 (copy)
    local v13 = tick();
    local l_status_0, l_result_0 = pcall(v12);
    local v16 = (tick() - v13) * 1000;
    local l_OK_0 = v3.OK;
    if not l_status_0 then
        l_OK_0 = v9(l_result_0);
    end;
    return v2.new(l_result_0, v16, l_OK_0, v10, v11);
end;
local function v21(v19, v20) --[[ Line: 65 ]] --[[ Name: httpGet ]]
    -- upvalues: v18 (copy)
    return v18("GET", v20, function() --[[ Line: 66 ]]
        -- upvalues: v19 (copy), v20 (copy)
        return v19:GetAsyncFullUrl(v20);
    end);
end;
local function v26(v22, v23, v24, v25) --[[ Line: 75 ]] --[[ Name: httpPost ]]
    -- upvalues: v18 (copy)
    if not v25 then
        v25 = Enum.HttpContentType.ApplicationJson;
    end;
    return v18("POST", v23, function() --[[ Line: 80 ]]
        -- upvalues: v22 (copy), v23 (copy), v24 (copy), v25 (ref)
        return v22:PostAsyncFullUrl(v23, v24, Enum.ThrottlingPriority.Default, v25);
    end);
end;
local function v29(v27, v28) --[[ Line: 88 ]] --[[ Name: httpDelete ]]
    -- upvalues: v18 (copy)
    return v18("DELETE", v28, function() --[[ Line: 89 ]]
        -- upvalues: v27 (copy), v28 (copy)
        return v27:RequestAsync(v28);
    end);
end;
local function v32(v30, v31) --[[ Line: 94 ]] --[[ Name: httpPatch ]]
    -- upvalues: v18 (copy)
    return v18("PATCH", v31, function() --[[ Line: 95 ]]
        -- upvalues: v30 (copy), v31 (copy)
        return v30:RequestAsync(v31);
    end);
end;
local function v35(v33, v34) --[[ Line: 100 ]] --[[ Name: httpPut ]]
    -- upvalues: v18 (copy)
    return v18("PUT", v34, function() --[[ Line: 101 ]]
        -- upvalues: v33 (copy), v34 (copy)
        return v33:RequestAsync(v34);
    end);
end;
local function v41(v36, ...) --[[ Line: 108 ]] --[[ Name: createHttpPromise ]]
    -- upvalues: l_Promise_0 (copy), v3 (copy)
    local v37 = {
        ...
    };
    return (l_Promise_0.new(function(v38, v39) --[[ Line: 111 ]]
        -- upvalues: v36 (copy), v37 (copy), v3 (ref)
        spawn(function() --[[ Line: 114 ]]
            -- upvalues: v36 (ref), v37 (ref), v3 (ref), v38 (copy), v39 (copy)
            local v40 = v36(unpack(v37));
            if v40.responseCode == v3.OK then
                v38(v40);
                return;
            else
                v39(v40);
                return;
            end;
        end);
    end));
end;
local v42 = {};
v42.__index = v42;
v42.new = function() --[[ Line: 135 ]] --[[ Name: new ]]
    -- upvalues: l_HttpRbxApiService_0 (copy), v42 (copy)
    local v43 = {
        _httpImpl = l_HttpRbxApiService_0
    };
    setmetatable(v43, v42);
    return v43;
end;
v42.jsonEncode = function(_, v45) --[[ Line: 146 ]] --[[ Name: jsonEncode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONEncode(v45);
end;
v42.jsonDecode = function(_, v47) --[[ Line: 150 ]] --[[ Name: jsonDecode ]]
    -- upvalues: l_HttpService_0 (copy)
    return l_HttpService_0:JSONDecode(v47);
end;
v42.httpGetJson = function(v48, v49) --[[ Line: 158 ]] --[[ Name: httpGetJson ]]
    -- upvalues: v41 (copy), v21 (copy)
    return v41(v21, v48._httpImpl, v49):andThen(function(v50) --[[ Line: 161 ]]
        -- upvalues: v48 (copy)
        v50.responseBody = v48:jsonDecode(v50.responseBody);
        return v50;
    end);
end;
v42.httpPostJson = function(v51, v52, v53) --[[ Line: 171 ]] --[[ Name: httpPostJson ]]
    -- upvalues: v41 (copy), v26 (copy)
    return v41(v26, v51._httpImpl, v52, v53):andThen(function(v54) --[[ Line: 172 ]]
        -- upvalues: v51 (copy)
        v54.responseBody = v51:jsonDecode(v54.responseBody);
        return v54;
    end);
end;
v42.httpPost = function(v55, v56, v57) --[[ Line: 181 ]] --[[ Name: httpPost ]]
    -- upvalues: v41 (copy), v26 (copy)
    return v41(v26, v55._httpImpl, v56, v57);
end;
v42.httpGet = function(v58, v59) --[[ Line: 186 ]] --[[ Name: httpGet ]]
    -- upvalues: v41 (copy), v21 (copy)
    return v41(v21, v58._httpImpl, v59);
end;
v42.httpDelete = function(v60, v61) --[[ Line: 191 ]] --[[ Name: httpDelete ]]
    -- upvalues: v41 (copy), v29 (copy)
    local v62 = {
        Url = v61, 
        Method = "DELETE"
    };
    return v41(v29, v60._httpImpl, v62);
end;
v42.httpDeleteWithPayload = function(v63, v64, v65) --[[ Line: 202 ]] --[[ Name: httpDeleteWithPayload ]]
    -- upvalues: v41 (copy), v29 (copy)
    local v66 = {
        Url = v64, 
        Method = "DELETE", 
        Body = v65, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v41(v29, v63._httpImpl, v66);
end;
v42.httpPatch = function(v67, v68, v69) --[[ Line: 215 ]] --[[ Name: httpPatch ]]
    -- upvalues: v41 (copy), v32 (copy)
    local v70 = {
        Url = v68, 
        Method = "PATCH", 
        Body = v69, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v41(v32, v67._httpImpl, v70);
end;
v42.httpPut = function(v71, v72, v73) --[[ Line: 228 ]] --[[ Name: httpPut ]]
    -- upvalues: v41 (copy), v35 (copy)
    local v74 = {
        Url = v72, 
        Method = "PUT", 
        Body = v73, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    return v41(v35, v71._httpImpl, v74);
end;
v42.requestInternal = function(_, v76) --[[ Line: 241 ]] --[[ Name: requestInternal ]]
    -- upvalues: l_Promise_0 (copy), l_HttpService_0 (copy), v3 (copy)
    return l_Promise_0.new(function(v77, v78) --[[ Line: 242 ]]
        -- upvalues: l_HttpService_0 (ref), v76 (copy), v3 (ref)
        spawn(function() --[[ Line: 244 ]]
            -- upvalues: l_HttpService_0 (ref), v76 (ref), v3 (ref), v78 (copy), v77 (copy)
            l_HttpService_0:RequestInternal(v76):Start(function(v79, v80) --[[ Line: 245 ]]
                -- upvalues: v3 (ref), v78 (ref), v77 (ref)
                if v79 then
                    if v80.StatusCode >= v3.BAD_REQUEST then
                        v78("HTTP error: " .. tostring(v80.StatusCode));
                        return;
                    else
                        v77(v80.Body);
                        return;
                    end;
                else
                    v78("HTTP error: " .. tostring(v80.HttpError));
                    return;
                end;
            end);
        end);
    end);
end;
v42.requestInternalRaw = function(_, v82) --[[ Line: 260 ]] --[[ Name: requestInternalRaw ]]
    -- upvalues: l_Promise_0 (copy), l_HttpService_0 (copy), v3 (copy)
    return l_Promise_0.new(function(v83, v84) --[[ Line: 261 ]]
        -- upvalues: l_HttpService_0 (ref), v82 (copy), v3 (ref)
        spawn(function() --[[ Line: 262 ]]
            -- upvalues: l_HttpService_0 (ref), v82 (ref), v3 (ref), v83 (copy), v84 (copy)
            l_HttpService_0:RequestInternal(v82):Start(function(v85, v86) --[[ Line: 263 ]]
                -- upvalues: v3 (ref), v83 (ref), v84 (ref)
                if v85 and v86.StatusCode < v3.BAD_REQUEST then
                    v83(v86);
                    return;
                else
                    v84(v86);
                    return;
                end;
            end);
        end);
    end);
end;
return v42;