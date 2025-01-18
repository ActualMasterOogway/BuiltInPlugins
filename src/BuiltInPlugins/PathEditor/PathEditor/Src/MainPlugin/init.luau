local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Rodux);
local v5 = require(l_Parent_0.Packages.Dash);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Util_0 = l_Parent_0.Src.Util;
local v18 = require(l_Util_0.MakePluginActions);
local v19 = require(l_Util_0.TelemetryGlobals);
local v20 = require(l_Util_0.Telemetry.Path2dToolUsage);
local v21 = require(l_Util_0.Telemetry.TelemetryProtocol);
local _ = require(l_Util_0.Telemetry.TelemetryProtocolTypes);
local l_Components_0 = l_Parent_0.Src.Components;
local v24 = require(l_Components_0.ControlPointEditGui);
local v25 = require(l_Components_0.SelectionListener);
local v26 = require(l_Components_0.PathToolbar);
local v27 = require(l_Components_0.MoveBaseGui);
local v28 = require(l_Components_0.VisualizationGui);
local v29 = require(l_Components_0.AddPointComponent);
local v30 = v2.PureComponent:extend("MainPlugin");
local l_PathEditorRBXTelemetryFixes_0 = game:GetFastFlag("PathEditorRBXTelemetryFixes");
v30.init = function(v32, v33) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v13 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v5 (copy), l_RbxAnalyticsService_0 (copy), v19 (copy), v20 (copy), v21 (copy), l_RunService_0 (copy), l_PathEditorRBXTelemetryFixes_0 (copy), v18 (copy)
    v32.state = {};
    v32.store = v4.Store.new(v13, nil, {
        v4.thunkMiddleware
    }, nil);
    v32.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "PathEditor"
    });
    v32.log = function(v34, v35) --[[ Line: 70 ]]
        -- upvalues: v32 (copy), v5 (ref), l_RbxAnalyticsService_0 (ref)
        v32.telemetry:logRobloxTelemetryEvent(v34, nil, v5.join({
            placeId = game.PlaceId, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId()
        }, v35));
    end;
    v32.logUsageReport = function() --[[ Line: 81 ]]
        -- upvalues: v19 (ref), v32 (copy), v20 (ref)
        if v19:totalCount() > 0 then
            v32.log(v20, {
                selectModeCount = v19.selectModeCount, 
                addPointModeCount = v19.addPointModeCount, 
                addTangentModeCount = v19.addTangentModeCount
            });
            v19:reset();
        end;
    end;
    v32.telemetry = v21.new();
    v32.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 94 ]]
        return {};
    end, {});
    if game:GetFastFlag("PathEditorRBXTelemetry") and not l_RunService_0:IsClient() and not l_PathEditorRBXTelemetryFixes_0 then
        game:BindToClose(function() --[[ Line: 100 ]]
            -- upvalues: v32 (copy)
            v32.logUsageReport();
        end);
    end;
    v32.actions = l_ContextServices_0.PluginActions.new(v33.Plugin, v18(v33.plugin, v32.localization));
end;
v30.render = function(v36) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Store_0 (copy), l_Mouse_0 (copy), v14 (copy), v3 (copy), v2 (copy), v24 (copy), v26 (copy), v27 (copy), v28 (copy), v29 (copy), l_CoreGui_0 (copy), v25 (copy), l_PathEditorRBXTelemetryFixes_0 (copy)
    local l_Plugin_1 = v36.props.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v36.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v36.localization, 
        v36.analytics, 
        v36.actions
    }, {
        Portal = v3.createPortal({
            PathEditFolder = v2.createElement("Folder", {
                Name = "PathEditFolder"
            }, {
                ControlPointEditGui = v2.createElement(v24), 
                PathToolbar = v2.createElement(v26), 
                MoveBaseGui = v2.createElement(v27), 
                VisualizationGui = v2.createElement(v28), 
                AddPointComponent = v2.createElement(v29)
            })
        }, l_CoreGui_0), 
        SelectionListener = v2.createElement(v25, {
            LogUsageReport = if l_PathEditorRBXTelemetryFixes_0 then v36.logUsageReport else nil
        })
    });
end;
return v30;