local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.Analytics.Logs);
local l_Packages_0 = l_Parent_0.Packages;
local l_sendResultToKibana_0 = require(l_Packages_0.Framework).Util.sendResultToKibana;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local _ = game:GetFastInt("InfluxReportingPackageAnalyticsHundrethsPercent");
local function _(v7) --[[ Line: 14 ]] --[[ Name: makeSettingName ]]
    return "ToolboxAnalytics_" .. v7;
end;
return {
    sendEventImmediately = function(v9, v10, v11, v12) --[[ Line: 20 ]] --[[ Name: sendEventImmediately ]]
        -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
        v1.logAnalytics("sendEventImmediately", v9, v10, v11, v12);
        l_RbxAnalyticsService_0:SendEventImmediately(v9, v10, v11, v12);
    end, 
    sendEventDeferred = function(v13, v14, v15, v16) --[[ Line: 25 ]] --[[ Name: sendEventDeferred ]]
        -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
        v1.logAnalytics("sendEventDeferred", v13, v14, v15, v16);
        l_RbxAnalyticsService_0:SendEventDeferred(v13, v14, v15, v16);
    end, 
    reportCounter = function(v17, v18) --[[ Line: 30 ]] --[[ Name: reportCounter ]]
        -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
        v18 = v18 or 1;
        v1.logCounterEvent("reportCounter", v17, v18);
        l_RbxAnalyticsService_0:ReportCounter(v17, v18);
    end, 
    sendResultToKibana = function(v19) --[[ Line: 36 ]] --[[ Name: sendResultToKibana ]]
        -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (copy), l_sendResultToKibana_0 (copy)
        assert(l_NewPackageAnalyticsWithRefactor2_0);
        l_sendResultToKibana_0(v19);
    end
};