local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Util).Promise;
local v3 = require(script.Parent.HttpResponse);
local v4 = require(script.Parent.StatusCodes);
local v5 = game:DefineFastFlag("CheckStatusCodeInsteadOfMessage", false);
local v6 = game:DefineFastFlag("DevFrameworkHttpDeleteAddBody", false);
local v7 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkNetworkingBetterErrors);
local v8 = {
    NONE = 0, 
    REQUESTS = 1, 
    RESPONSES = 2, 
    DEBUG = 4, 
    VERBOSE = 7
};
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 91 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy), v9 (copy)
    if not v10 then
        v10 = {};
    end;
    local v11 = v10.loggingLevel or v8.NONE;
    assert(type(v11) == "number", "loggingLevel expected to be a LOGGING_CHANNELS enum");
    local v12 = false;
    if v8.NONE <= v11 then
        v12 = v11 <= v8.VERBOSE;
    end;
    assert(v12, "loggingLevel expected to be valid");
    local l_isInternal_0 = v10.isInternal;
    if l_isInternal_0 == nil then
        l_isInternal_0 = false;
    end;
    assert(type(l_isInternal_0) == "boolean", "isInternal is expected to be boolean");
    v12 = v10.allowYielding;
    if v12 == nil then
        v12 = true;
    end;
    assert(type(v12) == "boolean", "allowYielding is expected to be boolean");
    local v14 = v10.httpImpl or game:GetService("HttpService");
    local v15 = l_isInternal_0 and "RequestInternal" or "RequestAsync";
    assert(v14[v15], string.format("Could not find %s defined on %s.", tostring(v15), (tostring(v14.ClassName))));
    local v16 = {
        _httpImpl = v14, 
        _isInternal = l_isInternal_0, 
        _loggingLevel = v11, 
        _allowYielding = v12
    };
    setmetatable(v16, v9);
    return v16;
end;
v9.mock = function(v17) --[[ Line: 136 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy), v9 (copy)
    if not v17 then
        v17 = {};
    end;
    local v18 = v17.loggingLevel or v8.NONE;
    assert(type(v18) == "number", "loggingLevel expected to be a LOGGING_CHANNELS enum");
    local v19 = false;
    if v8.NONE <= v18 then
        v19 = v18 <= v8.VERBOSE;
    end;
    assert(v19, "loggingLevel expected to be valid");
    local v21 = v17.onRequest or function(v20) --[[ Line: 151 ]]
        -- upvalues: v18 (copy), v8 (ref)
        if v18 >= v8.DEBUG then
            warn(string.format("Unhandled request to %s. Returning default response.", v20.requestUrl));
        end;
        return {
            Body = "{}", 
            Success = true, 
            StatusMessage = "OK", 
            StatusCode = 200
        };
    end;
    assert(type(v21) == "function", "onRequest expected to be a function.");
    v19 = {
        ClassName = "Networking.lua's MockHttpService", 
        onRequestHandler = v21, 
        RequestAsync = function(v22, v23) --[[ Line: 169 ]] --[[ Name: RequestAsync ]]
            local v24 = v22.onRequestHandler(v23);
            assert(type(v24) == "table", "onRequest is expected to return a table");
            assert(type(v24.Body) == "string", "onRequest is expected to return a table with a string Body property");
            assert(type(v24.Success) == "boolean", "onRequest is expected to return a table with a boolean Success property");
            assert(type(v24.StatusMessage) == "string", "onRequest is expected to return a table with a string StatusMessage property");
            assert(type(v24.StatusCode) == "number", "onRequest is expected to return a table with a number StatusCode property");
            return v24;
        end
    };
    return (v9.new({
        httpImpl = v19, 
        loggingLevel = v18, 
        allowYielding = false
    }));
end;
v9._isLoggingEnabled = function(v25, v26) --[[ Line: 198 ]] --[[ Name: _isLoggingEnabled ]]
    return (bit32.btest(v25._loggingLevel, v26));
end;
v9.request = function(v27, v28) --[[ Line: 207 ]] --[[ Name: request ]]
    -- upvalues: v8 (copy), l_Promise_0 (copy), v5 (copy), v3 (copy), v7 (copy), v4 (copy)
    assert(v28.Url, "Options table requires a 'Url' field");
    assert(v28.Method, "Options table requires a 'Method' field");
    if v27:_isLoggingEnabled(v8.REQUESTS) then
        local v29 = {
            "Outgoing Network Request :"
        };
        for v30, v31 in pairs(v28) do
            table.insert(v29, string.format(" - %s : %s", v30, (tostring(v31))));
        end;
        print(table.concat(v29, "\n"));
    end;
    local v32 = tick();
    return (l_Promise_0.new(function(v33, v34) --[[ Line: 224 ]]
        -- upvalues: v32 (copy), v27 (copy), v8 (ref), v5 (ref), v3 (ref), v28 (copy), v7 (ref), v4 (ref)
        local function v49(v35, v36) --[[ Line: 225 ]] --[[ Name: parseResponse ]]
            -- upvalues: v32 (ref), v27 (ref), v8 (ref), v5 (ref), v3 (ref), v28 (ref), v33 (copy), v7 (ref), v34 (copy), v4 (ref)
            local v37 = (tick() - v32) * 1000;
            if v35 then
                if v27:_isLoggingEnabled(v8.RESPONSES) then
                    local v38 = {
                        "Incoming Network Response :"
                    };
                    if v27:_isLoggingEnabled(v8.DEBUG) then
                        for v39, v40 in pairs(v36) do
                            if type(v40) == "table" then
                                table.insert(v38, string.format(" - %s : {", v39));
                                for v41, v42 in pairs(v40) do
                                    table.insert(v38, string.format("\t- %s = %s", v41, (tostring(v42))));
                                end;
                                table.insert(v38, " }");
                            else
                                table.insert(v38, string.format(" - %s : %s", v39, (tostring(v40))));
                            end;
                        end;
                        table.insert(v38, string.format(" - Time (ms) : %s", (tostring(v37))));
                    else
                        table.insert(v38, string.format(" - Body : %s", (tostring(v36.Body))));
                    end;
                    print(table.concat(v38, "\n"));
                end;
                local l_Body_0 = v36.Body;
                local l_StatusCode_0 = v36.StatusCode;
                local l_StatusMessage_0 = v36.StatusMessage;
                local v46 = nil;
                v46 = if v27._isInternal then if v5 then l_StatusCode_0 == 200 else l_StatusMessage_0 == "OK" else v36.Success;
                local v47 = v3.new(l_Body_0, v37, l_StatusCode_0, v28);
                if v46 then
                    if v27:_isLoggingEnabled(v8.DEBUG) then
                        print(string.format("Http request to %s resolved successfully.", v28.Url));
                    end;
                    v33(v47);
                    return;
                else
                    if v7() then
                        v47.requestErrorMessage = ("Http request to %* rejected because request did not succeed."):format(v28.Url);
                        if v27:_isLoggingEnabled(v8.DEBUG) then
                            print(v47.requestErrorMessage);
                        end;
                    elseif v27:_isLoggingEnabled(v8.DEBUG) then
                        print(string.format("Http request to %s rejected because request did not succeed.", v28.Url));
                    end;
                    v34(v47);
                    return;
                end;
            elseif v7() then
                local v48 = v3.new(v36, v37, v4.UNKNOWN_ERROR, v28);
                v48.requestErrorMessage = ("Http request to %* rejected because pcall returned false with message: %*"):format(v28.Url, v36);
                if v27:_isLoggingEnabled(v8.DEBUG) then
                    print(v48.requestErrorMessage);
                end;
                v34(v48);
                return;
            else
                if v27:_isLoggingEnabled(v8.DEBUG) then
                    print(string.format("Http request to %s rejected because pcall returned false with message : %s", v28.Url, (tostring(v36))));
                end;
                v34(v3.new(v36, v37, v4.UNKNOWN_ERROR, v28));
                return;
            end;
        end;
        local function v54() --[[ Line: 323 ]] --[[ Name: handleRequest ]]
            -- upvalues: v27 (ref), v28 (ref), v49 (copy)
            if v27._isInternal then
                v27._httpImpl:RequestInternal(v28):Start(function(v50, v51) --[[ Line: 326 ]]
                    -- upvalues: v27 (ref), v49 (ref)
                    if v27._allowYielding then
                        spawn(function() --[[ Line: 328 ]]
                            -- upvalues: v49 (ref), v50 (copy), v51 (copy)
                            v49(v50, v51);
                        end);
                        return;
                    else
                        v49(v50, v51);
                        return;
                    end;
                end);
                return;
            else
                local l_status_0, l_result_0 = pcall(v27._httpImpl.RequestAsync, v27._httpImpl, v28);
                v49(l_status_0, l_result_0);
                return;
            end;
        end;
        if v27._allowYielding then
            spawn(v54);
            return;
        else
            v54();
            return;
        end;
    end));
end;
v9.delete = function(v55, v56, v57, v58) --[[ Line: 355 ]] --[[ Name: delete ]]
    -- upvalues: v6 (copy)
    local v59 = {
        Url = v56, 
        Method = "DELETE", 
        Headers = v57
    };
    if v6 and v58 then
        v59.Body = v58;
    end;
    return v55:request(v59);
end;
v9.get = function(v60, v61, v62) --[[ Line: 369 ]] --[[ Name: get ]]
    return v60:request({
        Url = v61, 
        Method = "GET", 
        Headers = v62
    });
end;
v9.patch = function(v63, v64, v65, v66) --[[ Line: 381 ]] --[[ Name: patch ]]
    return v63:request({
        Url = v64, 
        Body = v65, 
        Method = "PATCH", 
        Headers = v66
    });
end;
v9.post = function(v67, v68, v69, v70) --[[ Line: 394 ]] --[[ Name: post ]]
    return v67:request({
        Url = v68, 
        Body = v69, 
        Method = "POST", 
        Headers = v70
    });
end;
v9.put = function(v71, v72, v73) --[[ Line: 406 ]] --[[ Name: put ]]
    return v71:request({
        Url = v72, 
        Method = "PUT", 
        Headers = v73
    });
end;
v9.parseJson = function(v74, v75) --[[ Line: 416 ]] --[[ Name: parseJson ]]
    -- upvalues: v7 (copy), l_HttpService_0 (copy), v8 (copy), l_Promise_0 (copy)
    return v75:andThen(function(v76) --[[ Line: 417 ]]
        -- upvalues: v7 (ref), l_HttpService_0 (ref), v74 (copy), v8 (ref), l_Promise_0 (ref)
        if v7() then
            local l_status_1, l_result_1 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v76.responseBody);
            if l_status_1 then
                v76.responseBody = l_result_1;
                if v74:_isLoggingEnabled(v8.RESPONSES) then
                    print("ResponseBody parsed to JSON and stored into `result.responseBody`.");
                end;
                return v76;
            else
                v76.parseJsonErrorMessage = "Could not parse `result.responseBody` to JSON: " .. tostring(l_result_1);
                if v74:_isLoggingEnabled(v8.RESPONSES) then
                    warn(v76.parseJsonErrorMessage);
                end;
                return l_Promise_0.reject(v76);
            end;
        else
            v76.responseBody = l_HttpService_0:JSONDecode(v76.responseBody);
            if v74:_isLoggingEnabled(v8.RESPONSES) then
                print("ResponseBody parsed to JSON and stored into `result.responseBody`.");
            end;
            return v76;
        end;
    end, function(v79) --[[ Line: 443 ]]
        -- upvalues: v7 (ref), l_HttpService_0 (ref), v74 (copy), v8 (ref), l_Promise_0 (ref)
        if v7() then
            if type(v79) == "table" then
                if type(v79.responseBody) == "string" then
                    local l_status_2, l_result_2 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v79.responseBody);
                    if l_status_2 then
                        v79.responseBody = l_result_2;
                        if v74:_isLoggingEnabled(v8.RESPONSES) then
                            print("ResponseBody parsed to JSON and stored into `err.responseBody`.");
                        end;
                    else
                        v79.parseJsonErrorMessage = "Could not parse `err.responseBody` to JSON: " .. tostring(l_result_2);
                        if v74:_isLoggingEnabled(v8.DEBUG) then
                            warn(v79.parseJsonErrorMessage);
                        end;
                    end;
                else
                    v79.parseJsonErrorMessage = "ResponseBody was not parsed to JSON because failed request returned unexpected type.";
                    if v74:_isLoggingEnabled(v8.RESPONSES) then
                        warn(v79.parseJsonErrorMessage);
                    end;
                end;
            elseif v74:_isLoggingEnabled(v8.RESPONSES) then
                warn("ResponseBody was not parsed to JSON because failed request returned unexpected type.");
            end;
            return l_Promise_0.reject(v79);
        else
            if type(v79) == "table" then
                if type(v79.responseBody) == "string" then
                    local l_status_3, l_result_3 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v79.responseBody);
                    if l_status_3 then
                        v79.responseBody = l_result_3;
                        if v74:_isLoggingEnabled(v8.RESPONSES) then
                            print("ResponseBody parsed to JSON and stored into `err.responseBody`.");
                        end;
                    elseif v74:_isLoggingEnabled(v8.DEBUG) then
                        print("Could not parse `err.responseBody` to JSON.", l_result_3);
                    end;
                elseif v74:_isLoggingEnabled(v8.RESPONSES) then
                    warn("ResponseBody was not parsed to JSON because failed request returned unexpected type.");
                end;
            elseif v74:_isLoggingEnabled(v8.RESPONSES) then
                warn("ResponseBody was not parsed to JSON because failed request returned unexpected type.");
            end;
            return l_Promise_0.reject(v79);
        end;
    end);
end;
v9.handleRetry = function(v84, v85, v86, v87) --[[ Line: 511 ]] --[[ Name: handleRetry ]]
    -- upvalues: l_Promise_0 (copy), v7 (copy), v8 (copy)
    if not v86 then
        v86 = 3;
    end;
    if v87 == nil then
        v87 = false;
    end;
    return v85:andThen(function(v88) --[[ Line: 520 ]]
        return v88;
    end, function(v89) --[[ Line: 522 ]]
        -- upvalues: l_Promise_0 (ref), v86 (ref), v7 (ref), v84 (copy), v8 (ref), v87 (ref)
        return l_Promise_0.new(function(v90, v91) --[[ Line: 526 ]]
            -- upvalues: v86 (ref), v7 (ref), v84 (ref), v8 (ref), v89 (copy), v87 (ref)
            local v92 = 0;
            local function v93(v94) --[[ Line: 530 ]] --[[ Name: makeRequest ]]
                -- upvalues: v92 (ref), v86 (ref), v7 (ref), v84 (ref), v8 (ref), v91 (copy), v89 (ref), v87 (ref), v90 (copy), v93 (copy)
                v92 = v92 + 1;
                if v86 < v92 then
                    if v7() then
                        v94.handleRetryErrorMessage = ("Reached maximum number of retries (%*). Rejecting request."):format(v86);
                        if v84:_isLoggingEnabled(v8.RESPONSES) then
                            print(v94.handleRetryErrorMessage);
                        end;
                    elseif v84:_isLoggingEnabled(v8.RESPONSES) then
                        print("Reached maximum number of retries. Rejecting request.");
                    end;
                    v91(v94);
                    return;
                elseif v94.responseCode >= 400 and v94.responseCode < 500 then
                    if v7() then
                        v94.handleRetryErrorMessage = "4xx error response. Rejecting request.";
                        if v84:_isLoggingEnabled(v8.RESPONSES) then
                            print(v94.handleRetryErrorMessage);
                        end;
                    elseif v84:_isLoggingEnabled(v8.RESPONSES) then
                        print("4xx error response. Rejecting request.");
                    end;
                    v91(v94);
                    return;
                else
                    local l_Method_0 = v89.requestOptions.Method;
                    if l_Method_0 == "POST" or l_Method_0 == "PATCH" then
                        if v7() then
                            v94.handleRetryErrorMessage = ("Error response to %* request. Rejecting request."):format(l_Method_0);
                            if v84:_isLoggingEnabled(v8.RESPONSES) then
                                print(v94.handleRetryErrorMessage);
                            end;
                        elseif v84:_isLoggingEnabled(v8.RESPONSES) then
                            print("Error response to " .. l_Method_0 .. " request. Rejecting request.");
                        end;
                        v91(v94);
                        return;
                    else
                        if v84:_isLoggingEnabled(v8.DEBUG) then
                            print(string.format("Http request failed. Attempting retry #%d", v92));
                        end;
                        if not v87 then
                            if v84:_isLoggingEnabled(v8.DEBUG) then
                                print(string.format("- waiting for %d seconds before next attempt", (math.pow(2, v92))));
                            end;
                            wait((math.pow(2, v92)));
                        end;
                        local l_requestOptions_0 = v89.requestOptions;
                        v84:request(l_requestOptions_0):andThen(v90, v93);
                        return;
                    end;
                end;
            end;
            v93(v89);
        end);
    end);
end;
return v9;