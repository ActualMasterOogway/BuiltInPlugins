local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v3.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v12 = require(l_script_FirstAncestor_0.Src.Util.AttenuationUtil);
local l_StudioTheme_0 = v3.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v3.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v18 = require(l_Components_0.AttenuationCurveRenderer);
local v19 = v1.PureComponent:extend("MainPlugin");
v19.init = function(v20, v21) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v2 (copy), v11 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v20.state = {
        enabled = false, 
        instanceId = -1, 
        instanceName = "", 
        initialCurveData = {}, 
        closeDMConnection = nil, 
        forceRerender = false
    };
    v20.setDisabled = function() --[[ Line: 47 ]]
        -- upvalues: v20 (copy), v21 (copy)
        if v20.state.closeDMConnection then
            v20.state.closeDMConnection:Disconnect();
        end;
        v21.Plugin:Invoke("OnStopEditing");
        v20:setState({
            enabled = false, 
            initialCurveData = {}, 
            instanceId = -1, 
            instanceName = "", 
            closeDMConnection = nil
        });
    end;
    v20.onChanged = function(v22) --[[ Line: 63 ]]
        -- upvalues: v21 (copy), v12 (ref)
        v21.Plugin:Invoke("OnEdit", v12.stringifyCurveTable(v22));
    end;
    v20.onWidgetEnabledChanged = function(_) --[[ Line: 67 ]]
        -- upvalues: v20 (copy)
        v20.setDisabled();
        v20:setState({
            forceRerender = not v20.state.forceRerender
        });
    end;
    v20.closeOnDMChange = function() --[[ Line: 77 ]]
        -- upvalues: v21 (copy), v20 (copy)
        local l_FocusedDataModelSession_0 = v21.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 then
            local v25 = l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 81 ]]
                -- upvalues: v20 (ref)
                v20.setDisabled();
            end);
            v20:setState({
                closeDMConnection = v25
            });
        end;
    end;
    v21.Plugin:OnInvoke("OnOpen", function(v26, v27) --[[ Line: 88 ]]
        -- upvalues: v20 (copy), v12 (ref)
        v20.closeOnDMChange();
        local v28 = v12.destringifyCurveTable(v26);
        v20:setState({
            enabled = true, 
            instanceId = v20.state.instanceId + 1, 
            instanceName = v27, 
            initialCurveData = v28
        });
    end);
    v21.Plugin:OnInvoke("OnInstanceChanged", function(v29) --[[ Line: 100 ]]
        -- upvalues: v20 (copy), v12 (ref)
        v20:setState({
            initialCurveData = v12.destringifyCurveTable(v29)
        });
    end);
    v20.store = v2.Store.new(v11, nil, {
        v2.thunkMiddleware
    }, nil);
    v20.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AttenuationCurveEditor"
    });
    v20.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 116 ]]
        return {};
    end, {});
    v20.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v20.design = l_registerPluginStyles_0(v21.Plugin);
end;
v19.render = function(v30) --[[ Line: 131 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v18 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v35 = {
        AttenuationCurveEditor = v1.createElement(v18, {
            CurveData = l_state_0.initialCurveData, 
            Enabled = l_enabled_0, 
            InstanceId = l_state_0.instanceId, 
            OnChanged = v30.onChanged
        })
    };
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v30.DEPRECATED_stylizer, 
        v30.localization, 
        v30.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AttenuationCurveEditor", 
            Enabled = l_enabled_0, 
            Title = v30.localization:getText("Plugin", "Name") .. " - " .. l_state_0.instanceName, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(540, 300), 
            OnClose = v30.setDisabled, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v30.onDockWidgetCreated, 
            ShouldRestore = false, 
            [v1.Change.Enabled] = v30.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, v35), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v30.design
            })
        })
    });
end;
return v19;