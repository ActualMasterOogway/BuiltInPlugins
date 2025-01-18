local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local l_game_FastInt_0 = game:GetFastInt("InfluxReportingPackageAnalyticsHundrethsPercent");
local function v5(v3) --[[ Line: 10 ]] --[[ Name: __sendResultToKibana ]]
    -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), l_RbxAnalyticsService_0 (copy), l_game_FastInt_0 (copy)
    assert(l_NewPackageAnalyticsWithRefactor2_0, "FFlagNewPackageAnalyticsWithRefactor2 not set");
    local v4 = {
        responseCode = v3.responseCode
    };
    if v3.responseBody and v3.responseCode ~= 200 then
        v4.responseBody = v3.responseBody;
    end;
    if v3.responseTimeMs then
        v4.responseTimeMs = v3.responseTimeMs;
    end;
    if v3.url then
        v4.url = v3.url;
    end;
    if v3.Method then
        v4.requestType = v3.Method;
    end;
    if v3.requestType then
        v4.requestType = v3.requestType;
    end;
    l_RbxAnalyticsService_0:reportInfluxSeries("StudioPackagesEndpointsStatus", v4, l_game_FastInt_0);
end;
return function(v6) --[[ Line: 38 ]] --[[ Name: formatForKibana ]]
    -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), v5 (copy)
    assert(l_NewPackageAnalyticsWithRefactor2_0, "FFlagNewPackageAnalyticsWithRefactor2 not set");
    if v6.responseBody and v6.responseBody.ErrorMessage then
        v6.responseBody = v6.responseBody.ErrorMessage;
        v6.responseBody.ErrorMessage = nil;
    end;
    if v6.requestOptions then
        if v6.requestOptions.Url then
            v6.url = v6.requestOptions.Url;
            v6.requestOptions.url = nil;
        end;
        if v6.requestOptions.url then
            v6.url = v6.requestOptions.url;
            v6.requestOptions.url = nil;
        end;
        if v6.requestOptions.Method then
            v6.requestType = v6.requestOptions.Method;
            v6.requestOptions.Method = nil;
        end;
    end;
    if v6.url.Url then
        v6.url = v6.url.Url;
    end;
    v5(v6);
end;