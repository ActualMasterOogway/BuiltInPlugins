local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local _ = require(l_Parent_0.Src.Types);
local function v3() --[[ Line: 6 ]] --[[ Name: getAnalyticsService ]]
    return {
        GetClientId = function() --[[ Line: 11 ]] --[[ Name: GetClientId ]]
            return "client_id";
        end, 
        GetSessionId = function() --[[ Line: 15 ]] --[[ Name: GetSessionId ]]
            return "session_id";
        end, 
        SendEventDeferred = function() --[[ Line: 19 ]] --[[ Name: SendEventDeferred ]]

        end, 
        ReportCounter = function() --[[ Line: 21 ]] --[[ Name: ReportCounter ]]

        end
    };
end;
return function(v4, v5) --[[ Line: 25 ]]
    -- upvalues: l_Parent_0 (copy), v3 (copy)
    local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
    local l_Analytics_0 = l_ContextServices_0.Analytics;
    local l_Localization_0 = l_ContextServices_0.Localization;
    local l_Mouse_0 = l_ContextServices_0.Mouse;
    local l_Plugin_0 = l_ContextServices_0.Plugin;
    local l_Store_0 = l_ContextServices_0.Store;
    local v12 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
    local v13 = require(l_Parent_0.Src.Resources.createTheme);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v16 = l_Plugin_0.new(v4);
    local v17 = l_Mouse_0.new(v4:GetMouse());
    local v18 = l_Store_0.new(v5);
    local v19 = v13();
    local v20 = l_Localization_0.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "Experimental"
    });
    return {
        Analytics = l_Analytics_0.new(v12, (v3())), 
        Localization = v20, 
        Mouse = v17, 
        Plugin = v16, 
        Store = v18, 
        Theme = v19
    };
end;