local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(script.Parent.BacktraceInterfaces);
local v6 = require(script.Parent.BacktraceReport);
local v7 = require(script.Parent.Parent.ErrorQueue);
local l_Url_0 = v4.RobloxAPI.Url;
local l_IAnnotations_0 = v6.IAnnotations;
local l_IAttributes_0 = v6.IAttributes;
local v11 = l_RunService_0:IsStudio();
local v12 = {};
v12.__index = v12;
v12.new = function(v13) --[[ Line: 55 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), v12 (copy), v7 (copy)
    assert(v5.IBacktraceReporter(v13));
    assert(#v13.accessToken > 0, "Expected accessToken to be a non-empty string");
    local v14 = {
        _errorQueue = nil, 
        _networking = v13.networking, 
        _accessToken = v13.accessToken, 
        _processErrorReportMethod = v13.processErrorReportMethod, 
        _generateLogMethod = v13.generateLogMethod, 
        _sharedAttributes = {}, 
        _sharedAnnotations = {}, 
        _logIntervalInSeconds = v13.logIntervalInSeconds or 10, 
        _lastLogTime = 0, 
        _isEnabled = true
    };
    setmetatable(v14, v12);
    v14._errorQueue = v7.new(function(_, v16, v17) --[[ Line: 76 ]]
        -- upvalues: v14 (copy)
        local l_log_0 = v16.log;
        local l_backtraceReport_0 = v16.backtraceReport;
        l_backtraceReport_0:addAttributes({
            ErrorCount = v17
        });
        v14:sendErrorReport(l_backtraceReport_0, l_log_0);
    end, v13.queueOptions);
    if not _G.__TESTEZ_RUNNING_TEST__ then
        v14._errorQueue:startTimer();
    end;
    return v14;
end;
v12.getUploadUrl = function(v20, v21) --[[ Line: 93 ]] --[[ Name: getUploadUrl ]]
    -- upvalues: l_Url_0 (copy), v3 (copy)
    return l_Url_0.composeUrl("https://upload.crashes.rbxinfra.com", "post", v3.Dictionary.join({
        token = v20._accessToken
    }, v21));
end;
v12.sendErrorReport = function(v22, v23, v24) --[[ Line: 103 ]] --[[ Name: sendErrorReport ]]
    -- upvalues: l_HttpService_0 (copy)
    if _G.__TESTEZ_RUNNING_TEST__ then
        assert(v23:validate());
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 111 ]]
        -- upvalues: l_HttpService_0 (ref), v23 (copy)
        return l_HttpService_0:JSONEncode(v23);
    end);
    if not l_status_0 then
        warn("Cannot convert report to JSON");
        return;
    else
        local v27 = v22:getUploadUrl({
            format = "json"
        });
        local v28 = {
            ["Content-Type"] = "application/json"
        };
        local v29 = v22._networking:post(v27, l_result_0, v28);
        v22._networking:parseJson(v29):andThen(function(v30) --[[ Line: 128 ]]
            -- upvalues: v24 (copy), v22 (copy)
            if type(v24) ~= "string" or #v24 == 0 then
                return;
            else
                local l__rxid_0 = v30.responseBody._rxid;
                if l__rxid_0 == nil then
                    return;
                else
                    local v32 = v22:getUploadUrl({
                        object = l__rxid_0, 
                        attachment_name = "log.txt"
                    });
                    local v33 = {
                        ["Content-Type"] = "text/plain"
                    };
                    v22._networking:post(v32, v24, v33):catch(function(v34) --[[ Line: 149 ]]
                        warn("Failed to report a log with message : ", (tostring(v34)));
                    end);
                    return;
                end;
            end;
        end):catch(function(v35) --[[ Line: 154 ]]
            warn("Failed to send a report with message : ", (tostring(v35)));
        end);
        return;
    end;
end;
v12._generateLog = function(v36) --[[ Line: 159 ]] --[[ Name: _generateLog ]]
    local v37 = tick() - v36._lastLogTime > v36._logIntervalInSeconds;
    if v36._generateLogMethod ~= nil and v37 then
        v36._lastLogTime = tick();
        local l_status_1, l_result_1 = pcall(v36._generateLogMethod);
        if l_status_1 and type(l_result_1) == "string" and #l_result_1 > 0 then
            return l_result_1;
        end;
    end;
    return nil;
end;
v12._generateErrorReport = function(v40, v41, v42, v43) --[[ Line: 173 ]] --[[ Name: _generateErrorReport ]]
    -- upvalues: v6 (copy)
    local v44 = v6.fromMessageAndStack(v41, v42);
    v44:addAttributes(v40._sharedAttributes);
    v44:addAnnotations(v40._sharedAnnotations);
    if type(v43) == "string" and v43 ~= "" then
        v44:addAnnotations({
            stackDetails = v43
        });
    end;
    return v44;
end;
v12.reportErrorImmediately = function(v45, v46, v47, v48) --[[ Line: 189 ]] --[[ Name: reportErrorImmediately ]]
    if not v45._isEnabled then
        return;
    else
        local v49 = v45:_generateErrorReport(v46, v47, v48);
        if v45._processErrorReportMethod ~= nil then
            v49 = v45._processErrorReportMethod(v49);
        end;
        v45:sendErrorReport(v49, (v45:_generateLog()));
        return;
    end;
end;
v12.reportErrorDeferred = function(v50, v51, v52, v53, v54) --[[ Line: 205 ]] --[[ Name: reportErrorDeferred ]]
    -- upvalues: l_HttpService_0 (copy)
    if not v50._isEnabled then
        return;
    else
        local v55 = string.format("%s | %s | %s", v51, v52, v54 and l_HttpService_0:GenerateGUID(false) or "");
        local v56 = {};
        if not v50._errorQueue:hasError(v55) then
            local v57 = v50:_generateErrorReport(v51, v52, v53);
            if v50._processErrorReportMethod ~= nil then
                v57 = v50._processErrorReportMethod(v57);
            end;
            v56 = {
                backtraceReport = v57, 
                log = v50:_generateLog()
            };
        end;
        v50._errorQueue:addError(v55, v56);
        return;
    end;
end;
v12.updateSharedAttributes = function(v58, v59) --[[ Line: 236 ]] --[[ Name: updateSharedAttributes ]]
    -- upvalues: v3 (copy), l_IAttributes_0 (copy)
    local v60 = v3.Dictionary.join(v58._sharedAttributes, v59);
    local v61, v62 = l_IAttributes_0(v60);
    if not v61 then
        if _G.__TESTEZ_RUNNING_TEST__ then
            assert(v61, v62);
        else
            return;
        end;
    end;
    v58._sharedAttributes = v60;
end;
v12.updateSharedAnnotations = function(v63, v64) --[[ Line: 253 ]] --[[ Name: updateSharedAnnotations ]]
    -- upvalues: v3 (copy), l_IAnnotations_0 (copy), v11 (copy)
    local v65 = v3.Dictionary.join(v63._sharedAnnotations, v64);
    local v66, v67 = l_IAnnotations_0(v65);
    if not v66 then
        if v11 or _G.__TESTEZ_RUNNING_TEST__ then
            assert(v66, v67);
        else
            return;
        end;
    end;
    v63._sharedAnnotations = v65;
end;
v12.reportAllErrors = function(v68) --[[ Line: 270 ]] --[[ Name: reportAllErrors ]]
    if v68._errorQueue ~= nil then
        v68._errorQueue:reportAllErrors();
    end;
end;
v12.stop = function(v69) --[[ Line: 276 ]] --[[ Name: stop ]]
    v69._isEnabled = false;
    if v69._errorQueue ~= nil then
        v69._errorQueue:stopTimer();
    end;
end;
return v12;