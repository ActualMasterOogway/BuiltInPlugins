local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v3 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageWaitForLogin)() and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioMoveStandaloneScope)();
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local v5 = if v2 then require(l_script_FirstAncestor_0.Src.Network.GameCache) else nil;
local l_UI_0 = v4.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v4.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Design_0 = l_ContextServices_0.Design;
local l_StudioTheme_0 = v4.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v4.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v17 = game:GetFastFlag("LoginPageCloseOnStartPageOpen") and require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagStudioMoveStandaloneScope)();
local v18 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryProtocol);
local v19 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local _ = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryProtocolTypes);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v22 = require(l_Components_0.PageController);
local v23 = v1.PureComponent:extend("MainPlugin");
v23.init = function(v24, v25) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v18 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy), l_Mouse_0 (copy), v3 (copy), v17 (copy)
    v24.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "StartPage"
    });
    v24.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 52 ]]
        return {};
    end, {});
    v24.telemetry = v18.new();
    v24.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v24.design = l_registerPluginStyles_0(v25.Plugin);
    v24.mouse = l_Mouse_0.new(v25.Plugin:GetMouse());
    v24.mouse:__pushCursor("Arrow", 0);
    if v3 then
        v24.state = {
            IsLoggedIn = game:GetService("StudioUserService").IsLoggedIn
        };
        if v17 then
            v24.startPageBridge = v25.Plugin:GetPluginComponent("StartPageBridge");
            v24.isRendering = false;
        end;
    end;
end;
v23.didMount = function(v26) --[[ Line: 75 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy)
    if v3 then
        local l_StudioUserService_0 = game:GetService("StudioUserService");
        v26.loggedInConnection = l_StudioUserService_0:GetPropertyChangedSignal("IsLoggedIn"):Connect(function() --[[ Line: 78 ]]
            -- upvalues: v26 (copy), l_StudioUserService_0 (copy)
            v26:setState({
                IsLoggedIn = l_StudioUserService_0.IsLoggedIn
            });
        end);
    end;
    if v2 then
        v5.load();
    end;
end;
v23.willUnmount = function(v28) --[[ Line: 88 ]] --[[ Name: willUnmount ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy)
    if v2 then
        v5.unload();
    end;
    if v3 then
        v28.loggedInConnection:Disconnect();
    end;
end;
v23.render = function(v29) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v17 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), v19 (copy), l_Design_0 (copy), v1 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy), v22 (copy)
    local l_Plugin_1 = v29.props.Plugin;
    if v3 then
        if not v29.state.IsLoggedIn then
            if v17 and v29.isRendering then
                v29.isRendering = false;
                task.defer(function() --[[ Line: 106 ]]
                    -- upvalues: v29 (copy)
                    v29.startPageBridge:OpenLoadingPageAsync();
                end);
            end;
            return nil;
        elseif v17 and not v29.isRendering then
            v29.isRendering = true;
            task.defer(function() --[[ Line: 116 ]]
                -- upvalues: v29 (copy)
                v29.startPageBridge:CloseLoadingPageAsync();
            end);
        end;
    end;
    return l_ContextServices_0.provide({
        Plugin = l_Plugin_0.new(l_Plugin_1), 
        Mouse = v29.mouse, 
        Stylizer = v29.DEPRECATED_stylizer, 
        Localization = v29.localization, 
        Analytics = v29.analytics, 
        Telemetry = v19.new(v29.telemetry), 
        Design = l_Design_0.new(v29.design)
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "StartPage", 
            Enabled = true, 
            ShouldRestore = false, 
            Title = v29.localization:getText("Plugin", "Name"), 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(1000, 1000), 
            MinSize = Vector2.new(1000, 1000), 
            CreateWidgetImmediately = true
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                PageController = v1.createElement(v22)
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v29.design
            })
        })
    });
end;
return v23;