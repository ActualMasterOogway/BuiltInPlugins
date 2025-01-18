local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local v4 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v4.UI;
local l_PluginButton_0 = l_UI_0.PluginButton;
local l_PluginToolbar_0 = l_UI_0.PluginToolbar;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v11 = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocol);
local v12 = require(l_Parent_0.Src.Util.Telemetry.WindsockOrigin);
local v13 = require(l_Parent_0.Src.Util.Telemetry.WindsockUsage);
local _ = require(l_Parent_0.Src.Util.Telemetry.TelemetryProtocolTypes);
local v15 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local v16 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_Parent_0.Src.Components;
local v20 = require(l_Components_0.MainGui);
local v21 = v1.PureComponent:extend("MainPlugin");
v21.init = function(v22, _) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy), v15 (copy), v13 (copy), v12 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v11 (copy), l_MemStorageService_0 (copy)
    v22:setState({
        enabled = false
    });
    v22.log = function(v24, v25) --[[ Line: 62 ]]
        -- upvalues: v22 (copy), l_join_0 (ref)
        v22.telemetry:logRobloxTelemetryEvent(v24, nil, l_join_0({
            placeId = game.PlaceId
        }, v25));
    end;
    v22.logUsageReport = function(v26) --[[ Line: 72 ]]
        -- upvalues: v15 (ref), v22 (copy), v13 (ref)
        if v15:totalCount() > 0 then
            v22.log(v13, {
                ctx = v26, 
                textFieldCount = v15.textFieldCount, 
                sliderCount = v15.sliderCount, 
                greenCircleCount = v15.greenCircleCount
            });
            v15:reset();
        end;
    end;
    v22.toggleEnabled = function() --[[ Line: 84 ]]
        -- upvalues: v22 (copy)
        v22:setState(function(v27) --[[ Line: 85 ]]
            return {
                enabled = not v27.enabled
            };
        end);
    end;
    v22.toggleFromRibbon = function() --[[ Line: 92 ]]
        -- upvalues: v22 (copy), v12 (ref)
        v22.toggleEnabled();
        if not v22.state.enabled then
            v22.log(v12, {
                ctx = "ribbon"
            });
            return;
        else
            v22.logUsageReport("widgetDisabled");
            return;
        end;
    end;
    v22.toggleFromProperties = function() --[[ Line: 101 ]]
        -- upvalues: v22 (copy), v12 (ref)
        v22.toggleEnabled();
        if not v22.state.enabled then
            v22.log(v12, {
                ctx = "properties"
            });
            return;
        else
            v22.logUsageReport("widgetDisabled");
            return;
        end;
    end;
    v22.onClose = function() --[[ Line: 110 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            enabled = false
        });
    end;
    v22.onRestore = function(v28) --[[ Line: 116 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            enabled = v28
        });
    end;
    v22.onWidgetEnabledChanged = function(v29) --[[ Line: 122 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            enabled = v29.Enabled
        });
    end;
    v22.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "WindControl"
    });
    v22.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 134 ]]
        return {};
    end, {});
    v22.telemetry = v11.new();
    v22.onOpenWindControlEditorConnection = l_MemStorageService_0:bind("openGlobalWindControl", v22.toggleFromProperties);
end;
v21.renderButtons = function(v30, v31) --[[ Line: 143 ]] --[[ Name: renderButtons ]]
    -- upvalues: v1 (copy), l_PluginButton_0 (copy)
    local l_enabled_0 = v30.state.enabled;
    return {
        Toggle = v1.createElement(l_PluginButton_0, {
            Toolbar = v31, 
            Active = l_enabled_0, 
            Title = "WindControl", 
            Tooltip = "", 
            Icon = "", 
            OnClick = v30.toggleFromRibbon, 
            ClickableWhenViewportHidden = false
        })
    };
end;
v21.render = function(v33) --[[ Line: 159 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v16 (copy), v1 (copy), v20 (copy), l_PluginToolbar_0 (copy)
    local l_Plugin_1 = v33.props.Plugin;
    local l_enabled_1 = v33.state.enabled;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v16(), 
        v33.localization, 
        v33.analytics
    }, {
        MainGui = l_enabled_1 and v1.createElement(v20, {}), 
        Toolbar = v1.createElement(l_PluginToolbar_0, {
            Title = "windControl", 
            RenderButtons = function(v36) --[[ Line: 177 ]] --[[ Name: RenderButtons ]]
                -- upvalues: v33 (copy)
                return v33:renderButtons(v36);
            end
        })
    });
end;
v21.willUnmount = function(v37) --[[ Line: 184 ]] --[[ Name: willUnmount ]]
    if v37.analytics then
        v37.logUsageReport("placeClosing");
    end;
    if v37.onOpenWindControlEditorConnection then
        v37.onOpenWindControlEditorConnection:Disconnect();
        v37.onOpenWindControlEditorConnection = nil;
    end;
end;
return v21;