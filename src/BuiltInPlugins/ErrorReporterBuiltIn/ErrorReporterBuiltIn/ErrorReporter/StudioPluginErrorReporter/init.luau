local l_ReportOTAPluginVersionToBacktrace2_0 = game:GetFastFlag("ReportOTAPluginVersionToBacktrace2");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_PluginManagementService_0 = game:GetService("PluginManagementService");
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Packages.Framework);
local v9 = require(l_Parent_0.Packages.React);
local l_Networking_0 = v8.Http.Networking;
local l_t_0 = v8.Util.Typecheck.t;
local v12 = require(script.Parent.Backtrace.BacktraceReporter);
local l_FVariable_0 = settings():GetFVariable("StudioPluginsBacktraceToken");
local v14 = l_t_0.strictInterface({
    expectedSecurityLevel = l_t_0.integer, 
    expectedPrefix = l_t_0.string, 
    networking = l_t_0.optional(l_t_0.interface({
        request = l_t_0.callback
    })), 
    errorSignal = l_t_0.optional(l_t_0.interface({
        Connect = l_t_0.callback
    })), 
    services = l_t_0.optional(l_t_0.interface({
        HttpService = l_t_0.optional(l_t_0.interface({
            GetUserAgent = l_t_0.callback
        })), 
        RunService = l_t_0.optional(l_t_0.interface({
            GetRobloxVersion = l_t_0.callback
        })), 
        ContentProvider = l_t_0.optional(l_t_0.interface({
            BaseUrl = l_t_0.string
        }))
    }))
});
local function _(v15, v16) --[[ Line: 69 ]] --[[ Name: createCollectorName ]]
    return string.format("%s.%s", v15, v16);
end;
local v18 = {};
v18.__index = v18;
v18.new = function(v19) --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy), l_Networking_0 (copy), l_ScriptContext_0 (copy), l_RbxAnalyticsService_0 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), l_ContentProvider_0 (copy), v18 (copy), v12 (copy), l_FVariable_0 (copy), l_ReportOTAPluginVersionToBacktrace2_0 (copy), l_PluginManagementService_0 (copy), v9 (copy)
    assert(v14(v19), "Expected the correct args");
    local l_expectedSecurityLevel_0 = v19.expectedSecurityLevel;
    local l_expectedPrefix_0 = v19.expectedPrefix;
    assert(l_expectedPrefix_0 ~= "", "expectedPrefix must not be an empty string");
    local v22 = v19.networking or l_Networking_0.new({
        isInternal = true
    });
    local v23 = v19.errorSignal or l_ScriptContext_0.ErrorDetailed;
    local v24 = v19.services or {};
    local v25 = v24.AnalyticsService or l_RbxAnalyticsService_0;
    local v26 = v24.RunService or l_RunService_0;
    local v27 = v24.HttpService or l_HttpService_0;
    local v28 = v24.ContentProvider or l_ContentProvider_0;
    local l_v26_RobloxVersion_0 = v26:GetRobloxVersion();
    local l_v27_UserAgent_0 = v27:GetUserAgent();
    local l_BaseUrl_0 = v28.BaseUrl;
    local v32 = setmetatable({
        _hasReported = {}
    }, v18);
    v32.errorSignal = v23;
    v32.analyticsService = v25;
    v32.staticAttributes = {
        StudioVersion = l_v26_RobloxVersion_0, 
        UserAgent = l_v27_UserAgent_0, 
        BaseUrl = l_BaseUrl_0
    };
    v32.reporter = v12.new({
        networking = v22, 
        accessToken = l_FVariable_0, 
        processErrorReportMethod = function(v33) --[[ Line: 114 ]] --[[ Name: processErrorReportMethod ]]
            -- upvalues: v32 (copy)
            v33:addAttributes(v32.staticAttributes);
            return v33;
        end
    });
    v32.getOTAPluginVersion = l_ReportOTAPluginVersionToBacktrace2_0 and function(v34) --[[ Line: 121 ]]
        -- upvalues: l_expectedPrefix_0 (copy), l_PluginManagementService_0 (ref)
        local v35 = string.sub(v34, #l_expectedPrefix_0 + 2, #v34 - 5);
        local l_l_PluginManagementService_0_OTAPluginVersion_0 = l_PluginManagementService_0:GetOTAPluginVersion(v35);
        local v37 = {
            eventName = "ErrorReporter", 
            longPluginName = v34, 
            pluginName = v35, 
            otaVersion = l_l_PluginManagementService_0_OTAPluginVersion_0
        };
        game:GetService("RbxAnalyticsService"):ReportInfluxSeries("PluginOTAErrorAnalytics", v37, game:GetFastInt("PluginOTAErrorAnalyticsHundredthsPercentage"));
        return l_l_PluginManagementService_0_OTAPluginVersion_0;
    end or nil;
    if l_v26_RobloxVersion_0 ~= "0.0.0.1" then
        v32.errorToken = v32.errorSignal:Connect(function(v38, v39, _, v41, v42) --[[ Line: 141 ]]
            -- upvalues: l_expectedSecurityLevel_0 (copy), l_expectedPrefix_0 (copy), v9 (ref), v32 (copy)
            if v42 ~= l_expectedSecurityLevel_0 then
                return;
            elseif not string.find(v39, l_expectedPrefix_0) then
                return;
            elseif string.match(v38, "Requested module experienced an error while loading") then
                return;
            else
                local v43 = string.format("(%s_%%a+%%.rbxm)", l_expectedPrefix_0);
                local v44 = string.match(v39, v43);
                if v44 == nil then
                    return;
                else
                    local v45, v46 = v9.unstable_parseReactError(v38);
                    v38 = v45.message;
                    if v45.stack then
                        v39 = v45.stack;
                    end;
                    v41 = v41 or v46;
                    v32:_reportError(v44, v38, v39, v41);
                    return;
                end;
            end;
        end);
    end;
    return v32;
end;
v18._reportError = function(v47, v48, v49, v50, v51) --[[ Line: 187 ]] --[[ Name: _reportError ]]
    -- upvalues: l_ReportOTAPluginVersionToBacktrace2_0 (copy)
    local v52 = not v47._hasReported[v48];
    v47.reporter:updateSharedAttributes({
        PluginName = v48, 
        FirstErrorInSession = v52 and "true" or "false", 
        OTAPluginVersion = l_ReportOTAPluginVersionToBacktrace2_0 and v47.getOTAPluginVersion(v48) or nil
    });
    v47.reporter:reportErrorDeferred(v49, v50, v51, v52);
    v47.analyticsService:ReportCounter(string.format("%s.%s", "StudioPluginErrors", v48), 1);
    if not v47._hasReported[v48] then
        v47._hasReported[v48] = true;
        v47.analyticsService:ReportCounter(string.format("%s.%s", "StudioPluginErrorsBySession", v48), 1);
    end;
end;
v18.report = function(v53, v54, v55) --[[ Line: 207 ]] --[[ Name: report ]]
    assert(type(v54) == "string", "Expected pluginName to be a string");
    assert(type(v55) == "string", "Expected errorMessage to be a string");
    v53:_reportError(v54, v55, debug.traceback(), nil);
end;
v18.stop = function(v56) --[[ Line: 213 ]] --[[ Name: stop ]]
    v56.reporter:stop();
    if v56.errorToken ~= nil then
        v56.errorToken:Disconnect();
        v56.errorToken = nil;
    end;
end;
return v18;