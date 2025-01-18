local v0 = game:DefineFastFlag("StudioFixPluginManagementInfiniteLoading", false);
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(script.Parent.Parent.Promise);
local v3 = require(script.Parent.HttpResponse);
local v4 = require(script.Parent.StatusCodes);
local v5 = {
    NONE = 0, 
    REQUESTS = 1, 
    RESPONSES = 2, 
    DEBUG = 4, 
    VERBOSE = 7
};
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 46 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v6 (copy)
    if not v7 then
        v7 = {};
    end;
    local v8 = v7.httpImpl or game:GetService("HttpService");
    local l_isInternal_0 = v7.isInternal;
    local v10 = v7.loggingLevel or v5.NONE;
    local l_allowYielding_0 = v7.allowYielding;
    if l_isInternal_0 == nil then
        l_isInternal_0 = false;
    end;
    if l_allowYielding_0 == nil then
        l_allowYielding_0 = true;
    end;
    local v12 = l_isInternal_0 and "RequestInternal" or "RequestAsync";
    assert(v8[v12], string.format("Could not find %s defined on %s.", v12, v8.ClassName));
    local v14 = {
        _httpImpl = v8, 
        _isInternal = l_isInternal_0, 
        _loggingLevel = v10, 
        _allowYielding = l_allowYielding_0, 
        _isLoggingEnabled = function(v13) --[[ Line: 72 ]] --[[ Name: _isLoggingEnabled ]]
            -- upvalues: v10 (copy)
            return (bit32.btest(v10, v13));
        end
    };
    setmetatable(v14, v6);
    return v14;
end;
v6.mock = function(v15, v16) --[[ Line: 83 ]] --[[ Name: mock ]]
    -- upvalues: v6 (copy)
    local v22 = {
        ClassName = "Networking.lua's MockHttpService", 
        _defaultResponse = {
            Body = "{}", 
            Success = true, 
            StatusMessage = "OK", 
            StatusCode = 200
        }, 
        RequestAsync = function(v17, v18) --[[ Line: 96 ]] --[[ Name: RequestAsync ]]
            -- upvalues: v15 (copy)
            local l_Url_0 = v18.Url;
            if v15[l_Url_0] then
                return v15[l_Url_0];
            else
                for v20, v21 in pairs(v15) do
                    if l_Url_0:find(v20) then
                        return v21;
                    end;
                end;
                return v17._defaultResponse;
            end;
        end
    };
    return v6.new({
        httpImpl = v22, 
        loggingLevel = v16, 
        allowYielding = false
    });
end;
v6.parseJson = function(v23) --[[ Line: 124 ]] --[[ Name: parseJson ]]
    -- upvalues: l_HttpService_0 (copy)
    return v23:andThen(function(v24) --[[ Line: 125 ]]
        -- upvalues: l_HttpService_0 (ref)
        v24.responseBody = l_HttpService_0:JSONDecode(v24.responseBody);
        return v24;
    end, function(v25) --[[ Line: 128 ]]
        return v25;
    end);
end;
v6.handleRetry = function(v26, v27, v28, v29) --[[ Line: 136 ]] --[[ Name: handleRetry ]]
    -- upvalues: v2 (copy), v5 (copy)
    if not v28 then
        v28 = 3;
    end;
    if v29 == nil then
        v29 = false;
    end;
    return v27:andThen(function(v30) --[[ Line: 145 ]]
        return v30;
    end, function(v31) --[[ Line: 147 ]]
        -- upvalues: v2 (ref), v28 (ref), v26 (copy), v5 (ref), v29 (ref)
        return v2.new(function(v32, v33) --[[ Line: 151 ]]
            -- upvalues: v28 (ref), v26 (ref), v5 (ref), v29 (ref), v31 (copy)
            local v34 = 0;
            local function v35(v36) --[[ Line: 155 ]] --[[ Name: makeRequest ]]
                -- upvalues: v34 (ref), v28 (ref), v33 (copy), v26 (ref), v5 (ref), v29 (ref), v31 (ref), v32 (copy), v35 (copy)
                v34 = v34 + 1;
                if v28 < v34 then
                    v33(v36);
                    return;
                else
                    local v37 = false;
                    if v36.responseCode >= 400 then
                        v37 = v36.responseCode < 500;
                    end;
                    if v37 and v36.responseCode ~= 429 then
                        if v26._isLoggingEnabled(v5.DEBUG) then
                            print("Http request failed due to request errors. Ignoring retry.");
                        end;
                        v33(v36);
                        return;
                    else
                        if v26._isLoggingEnabled(v5.DEBUG) then
                            print(string.format("Http request failed. Attempting retry #%d", v34));
                        end;
                        if not v29 then
                            if v26._isLoggingEnabled(v5.DEBUG) then
                                print(string.format("- waiting for %d seconds before next attempt", (math.pow(2, v34))));
                            end;
                            wait((math.pow(2, v34)));
                        end;
                        local l_requestOptions_0 = v31.requestOptions;
                        v26:request(l_requestOptions_0):andThen(v32, v35);
                        return;
                    end;
                end;
            end;
            v35(v31);
        end);
    end);
end;
v6.request = function(v39, v40) --[[ Line: 194 ]] --[[ Name: request ]]
    -- upvalues: v5 (copy), v2 (copy), v0 (copy), v3 (copy), v4 (copy)
    assert(v40.Url, "Options table requires a 'Url' field");
    assert(v40.Method, "Options table requires a 'Method' field");
    if v39._isLoggingEnabled(v5.REQUESTS) then
        local v41 = {
            "Outgoing Network Request :"
        };
        for v42, v43 in pairs(v40) do
            table.insert(v41, string.format(" - %s : %s", v42, v43));
        end;
        print(table.concat(v41, "\n"));
    end;
    local v44 = tick();
    return (v2.new(function(v45, v46) --[[ Line: 212 ]]
        -- upvalues: v44 (copy), v39 (copy), v5 (ref), v0 (ref), v3 (ref), v40 (copy), v4 (ref)
        local function v60(v47, v48) --[[ Line: 213 ]] --[[ Name: parseResponse ]]
            -- upvalues: v44 (ref), v39 (ref), v5 (ref), v0 (ref), v3 (ref), v40 (ref), v45 (copy), v46 (copy), v4 (ref)
            local v49 = (tick() - v44) * 1000;
            if v47 then
                if v39._isLoggingEnabled(v5.RESPONSES) then
                    local v50 = {
                        "Incoming Network Response :"
                    };
                    if v39._isLoggingEnabled(v5.DEBUG) then
                        for v51, v52 in pairs(v48) do
                            if type(v52) == "table" then
                                table.insert(v50, string.format(" - %s : {", v51));
                                for v53, v54 in pairs(v52) do
                                    table.insert(v50, string.format("\t- %s = %s", v53, (tostring(v54))));
                                end;
                                table.insert(v50, " }");
                            else
                                table.insert(v50, string.format(" - %s : %s", v51, (tostring(v52))));
                            end;
                        end;
                        table.insert(v50, string.format(" - Time (ms) : %s", (tostring(v49))));
                    else
                        table.insert(v50, string.format(" - Body : %s", (tostring(v48.Body))));
                    end;
                    print(table.concat(v50, "\n"));
                end;
                local l_Body_0 = v48.Body;
                local l_StatusMessage_0 = v48.StatusMessage;
                local l_StatusCode_0 = v48.StatusCode;
                local v58 = nil;
                v58 = if v39._isInternal then if v0 then l_StatusCode_0 == 200 else l_StatusMessage_0 == "OK" else v48.Success;
                local v59 = v3.new(l_Body_0, v49, l_StatusCode_0, v40);
                if v58 then
                    if v39._isLoggingEnabled(v5.DEBUG) then
                        print(string.format("Http request to %s resolved successfully.", v40.Url));
                    end;
                    v45(v59);
                    return;
                else
                    if v39._isLoggingEnabled(v5.DEBUG) then
                        print(string.format("Http request to %s rejected because request did not succeed.", v40.Url));
                    end;
                    v46(v59);
                    return;
                end;
            else
                if v39._isLoggingEnabled(v5.DEBUG) then
                    print(string.format("Http request to %s rejected because pcall returned false with message : %s", v40.Url, v48));
                end;
                v46(v3.new(v48, v49, v4.UNKNOWN_ERROR, v40));
                return;
            end;
        end;
        local function v65() --[[ Line: 279 ]] --[[ Name: handleRequest ]]
            -- upvalues: v39 (ref), v40 (ref), v60 (copy)
            if v39._isInternal then
                if v39._allowYielding then
                    v39._httpImpl:RequestInternal(v40):Start(function(v61, v62) --[[ Line: 283 ]]
                        -- upvalues: v60 (ref)
                        spawn(function() --[[ Line: 284 ]]
                            -- upvalues: v60 (ref), v61 (copy), v62 (copy)
                            v60(v61, v62);
                        end);
                    end);
                    return;
                else
                    v39._httpImpl:RequestInternal(v40):Start(v60);
                    return;
                end;
            else
                local l_status_0, l_result_0 = pcall(v39._httpImpl.RequestAsync, v39._httpImpl, v40);
                v60(l_status_0, l_result_0);
                return;
            end;
        end;
        if v39._allowYielding then
            spawn(v65);
            return;
        else
            v65();
            return;
        end;
    end));
end;
v6.get = function(v66, v67, v68) --[[ Line: 311 ]] --[[ Name: get ]]
    return v66:request({
        Url = v67, 
        Method = "GET", 
        Headers = v68
    });
end;
v6.post = function(v69, v70, v71, v72) --[[ Line: 324 ]] --[[ Name: post ]]
    return v69:request({
        Url = v70, 
        Body = v71, 
        Method = "POST", 
        Headers = v72
    });
end;
v6.delete = function(v73, v74, v75) --[[ Line: 337 ]] --[[ Name: delete ]]
    return v73:request({
        Url = v74, 
        Method = "DELETE", 
        Headers = v75
    });
end;
return v6;