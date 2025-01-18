local l_Parent_0 = script.Parent.Parent;
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: l_Parent_0 (copy)
    local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
    local l_Analytics_0 = l_ContextServices_0.Analytics;
    local l_Mouse_0 = l_ContextServices_0.Mouse;
    local l_Localization_0 = l_ContextServices_0.Localization;
    local l_Store_0 = l_ContextServices_0.Store;
    local v8 = require(l_Parent_0.Src.Resources.createAnalyticsHandlers);
    local v9 = require(l_Parent_0.Src.Resources.MakeTheme);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v12 = l_ContextServices_0.Plugin.new(v1);
    local v13 = l_Mouse_0.new(v1:getMouse());
    local v14 = l_Store_0.new(v2);
    local v15 = v9();
    local v16 = l_Localization_0.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "StandaloneExperimental"
    });
    local v17 = {
        GetClientId = function() --[[ Line: 37 ]] --[[ Name: GetClientId ]]
            return "client_id";
        end, 
        GetSessionId = function() --[[ Line: 40 ]] --[[ Name: GetSessionId ]]
            return "session_id";
        end, 
        SendEventDeferred = function() --[[ Line: 43 ]] --[[ Name: SendEventDeferred ]]

        end, 
        ReportCounter = function() --[[ Line: 44 ]] --[[ Name: ReportCounter ]]

        end
    };
    local v18 = l_Analytics_0.new(v8, v17);
    return {
        Plugin = v12, 
        Mouse = v13, 
        Store = v14, 
        Theme = v15, 
        Localization = v16, 
        Analytics = v18
    };
end;