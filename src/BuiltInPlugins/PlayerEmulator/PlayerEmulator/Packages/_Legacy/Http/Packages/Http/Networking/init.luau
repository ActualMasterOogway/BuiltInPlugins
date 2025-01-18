local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.Parent.Promise);
local v2 = require(script.Parent.HttpResponse);
local v3 = require(script.Parent.StatusCodes);
local v4 = {
    NONE = 0, 
    REQUESTS = 1, 
    RESPONSES = 2, 
    DEBUG = 4, 
    VERBOSE = 7
};
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy)
    if not v6 then
        v6 = {};
    end;
    local v7 = v6.httpImpl or game:GetService("HttpService");
    local l_isInternal_0 = v6.isInternal;
    local v9 = v6.loggingLevel or v4.NONE;
    local l_allowYielding_0 = v6.allowYielding;
    if l_isInternal_0 == nil then
        l_isInternal_0 = false;
    end;
    if l_allowYielding_0 == nil then
        l_allowYielding_0 = true;
    end;
    local v11 = l_isInternal_0 and "RequestInternal" or "RequestAsync";
    assert(v7[v11], string.format("Could not find %s defined on %s.", v11, v7.ClassName));
    local v13 = {
        _httpImpl = v7, 
        _isInternal = l_isInternal_0, 
        _loggingLevel = v9, 
        _allowYielding = l_allowYielding_0, 
        _isLoggingEnabled = function(v12) --[[ Line: 70 ]] --[[ Name: _isLoggingEnabled ]]
            -- upvalues: v9 (copy)
            return (bit32.btest(v9, v12));
        end
    };
    setmetatable(v13, v5);
    return v13;
end;
v5.mock = function(v14, v15) --[[ Line: 81 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy)
    local v21 = {
        ClassName = "Networking.lua's MockHttpService", 
        _defaultResponse = {
            Body = "{}", 
            Success = true, 
            StatusMessage = "OK", 
            StatusCode = 200
        }, 
        RequestAsync = function(v16, v17) --[[ Line: 94 ]] --[[ Name: RequestAsync ]]
            -- upvalues: v14 (copy)
            local l_Url_0 = v17.Url;
            if v14[l_Url_0] then
                return v14[l_Url_0];
            else
                for v19, v20 in pairs(v14) do
                    if l_Url_0:find(v19) then
                        return v20;
                    end;
                end;
                return v16._defaultResponse;
            end;
        end
    };
    return v5.new({
        httpImpl = v21, 
        loggingLevel = v15, 
        allowYielding = false
    });
end;
v5.parseJson = function(v22) --[[ Line: 122 ]] --[[ Name: parseJson ]]
    -- upvalues: l_HttpService_0 (copy)
    return v22:andThen(function(v23) --[[ Line: 123 ]]
        -- upvalues: l_HttpService_0 (ref)
        v23.responseBody = l_HttpService_0:JSONDecode(v23.responseBody);
        return v23;
    end, function(v24) --[[ Line: 126 ]]
        return v24;
    end);
end;
v5.handleRetry = function(v25, v26, v27, v28) --[[ Line: 134 ]] --[[ Name: handleRetry ]]
    -- upvalues: v1 (copy), v4 (copy)
    if not v27 then
        v27 = 3;
    end;
    if v28 == nil then
        v28 = false;
    end;
    return v26:andThen(function(v29) --[[ Line: 143 ]]
        return v29;
    end, function(v30) --[[ Line: 145 ]]
        -- upvalues: v1 (ref), v27 (ref), v25 (copy), v4 (ref), v28 (ref)
        return v1.new(function(v31, v32) --[[ Line: 149 ]]
            -- upvalues: v27 (ref), v25 (ref), v4 (ref), v28 (ref), v30 (copy)
            local v33 = 0;
            local function v34(v35) --[[ Line: 153 ]] --[[ Name: makeRequest ]]
                -- upvalues: v33 (ref), v27 (ref), v32 (copy), v25 (ref), v4 (ref), v28 (ref), v30 (ref), v31 (copy), v34 (copy)
                v33 = v33 + 1;
                if v27 < v33 then
                    v32(v35);
                    return;
                else
                    if v25._isLoggingEnabled(v4.DEBUG) then
                        print(string.format("Http request failed. Attempting retry #%d", v33));
                    end;
                    if not v28 then
                        if v25._isLoggingEnabled(v4.DEBUG) then
                            print(string.format("- waiting for %d seconds before next attempt", (math.pow(2, v33))));
                        end;
                        if v25._allowYielding then
                            wait((math.pow(2, v33)));
                        end;
                    end;
                    local l_requestOptions_0 = v30.requestOptions;
                    v25:request(l_requestOptions_0):andThen(v31, v34);
                    return;
                end;
            end;
            v34(v30);
        end);
    end);
end;
v5.request = function(v37, v38) --[[ Line: 185 ]] --[[ Name: request ]]
    -- upvalues: v4 (copy), v1 (copy), v2 (copy), v3 (copy)
    assert(v38.Url, "Options table requires a 'Url' field");
    assert(v38.Method, "Options table requires a 'Method' field");
    if v37._isLoggingEnabled(v4.REQUESTS) then
        local v39 = {
            "Outgoing Network Request :"
        };
        for v40, v41 in pairs(v38) do
            table.insert(v39, string.format(" - %s : %s", v40, v41));
        end;
        print(table.concat(v39, "\n"));
    end;
    local v42 = tick();
    return (v1.new(function(v43, v44) --[[ Line: 203 ]]
        -- upvalues: v42 (copy), v37 (copy), v4 (ref), v2 (ref), v38 (copy), v3 (ref)
        local function v58(v45, v46) --[[ Line: 204 ]] --[[ Name: parseResponse ]]
            -- upvalues: v42 (ref), v37 (ref), v4 (ref), v2 (ref), v38 (ref), v43 (copy), v44 (copy), v3 (ref)
            local v47 = (tick() - v42) * 1000;
            if v45 then
                if v37._isLoggingEnabled(v4.RESPONSES) then
                    local v48 = {
                        "Incoming Network Response :"
                    };
                    if v37._isLoggingEnabled(v4.DEBUG) then
                        for v49, v50 in pairs(v46) do
                            if type(v50) == "table" then
                                table.insert(v48, string.format(" - %s : {", v49));
                                for v51, v52 in pairs(v50) do
                                    table.insert(v48, string.format("\t- %s = %s", v51, (tostring(v52))));
                                end;
                                table.insert(v48, " }");
                            else
                                table.insert(v48, string.format(" - %s : %s", v49, (tostring(v50))));
                            end;
                        end;
                        table.insert(v48, string.format(" - Time (ms) : %s", (tostring(v47))));
                    else
                        table.insert(v48, string.format(" - Body : %s", (tostring(v46.Body))));
                    end;
                    print(table.concat(v48, "\n"));
                end;
                local l_Body_0 = v46.Body;
                local _ = v46.StatusMessage;
                local l_StatusCode_0 = v46.StatusCode;
                local v56 = nil;
                v56 = if v37._isInternal then v45 else v46.Success;
                local v57 = v2.new(l_Body_0, v47, l_StatusCode_0, v38);
                if v56 then
                    if v37._isLoggingEnabled(v4.DEBUG) then
                        print(string.format("Http request to %s resolved successfully.", v38.Url));
                    end;
                    v43(v57);
                    return;
                else
                    if v37._isLoggingEnabled(v4.DEBUG) then
                        print(string.format("Http request to %s rejected because request did not succeed.", v38.Url));
                    end;
                    v44(v57);
                    return;
                end;
            else
                if v37._isLoggingEnabled(v4.DEBUG) then
                    print(string.format("Http request to %s rejected because pcall returned false with message : %s", v38.Url, v46));
                end;
                v44(v2.new(v46, v47, v3.UNKNOWN_ERROR, v38));
                return;
            end;
        end;
        local function v61() --[[ Line: 268 ]] --[[ Name: handleRequest ]]
            -- upvalues: v37 (ref), v38 (ref), v58 (copy)
            if v37._isInternal then
                v37._httpImpl:RequestInternal(v38):Start(v58);
                return;
            else
                local l_status_0, l_result_0 = pcall(v37._httpImpl.RequestAsync, v37._httpImpl, v38);
                v58(l_status_0, l_result_0);
                return;
            end;
        end;
        if v37._allowYielding then
            spawn(v61);
            return;
        elseif v37._isInternal then
            v37._httpImpl:RequestInternal(v38):Start(v58);
            return;
        else
            local l_status_1, l_result_1 = pcall(v37._httpImpl.RequestAsync, v37._httpImpl, v38);
            v58(l_status_1, l_result_1);
            return;
        end;
    end));
end;
v5.get = function(v64, v65, v66) --[[ Line: 292 ]] --[[ Name: get ]]
    return v64:request({
        Url = v65, 
        Method = "GET", 
        Headers = v66
    });
end;
v5.post = function(v67, v68, v69, v70) --[[ Line: 305 ]] --[[ Name: post ]]
    return v67:request({
        Url = v68, 
        Body = v69, 
        Method = "POST", 
        Headers = v70
    });
end;
v5.delete = function(v71, v72, v73) --[[ Line: 318 ]] --[[ Name: delete ]]
    return v71:request({
        Url = v72, 
        Method = "DELETE", 
        Headers = v73
    });
end;
return v5;