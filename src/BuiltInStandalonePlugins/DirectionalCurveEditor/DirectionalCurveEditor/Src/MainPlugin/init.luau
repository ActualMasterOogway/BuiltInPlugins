local l_script_FirstAncestor_0 = script:FindFirstAncestor("DirectionalCurveEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_DockWidget_0 = l_UI_0.DockWidget;
local l_Pane_0 = l_UI_0.Pane;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v9 = require(l_script_FirstAncestor_0.Src.Types);
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.AttenuationCurveRenderer);
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, v18) --[[ Line: 37 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    local v19 = {
        InstanceType = v9.NO_INSTANCE, 
        DistanceCurve = {}, 
        AngleCurve = {}
    };
    v17.state = {
        enabled = false, 
        instanceId = -1, 
        instanceName = "", 
        initialData = v19, 
        initialPropertyType = "None", 
        closeDMConnection = nil, 
        forceRerender = false
    };
    v17.setDisabled = function() --[[ Line: 56 ]]
        -- upvalues: v17 (copy), v18 (copy), v19 (copy)
        if v17.state.closeDMConnection then
            v17.state.closeDMConnection:Disconnect();
        end;
        v18.Plugin:Invoke("OnStopEditing");
        v17:setState({
            enabled = false, 
            initialData = v19, 
            initialPropertyType = "None", 
            instanceId = -1, 
            instanceName = "", 
            closeDMConnection = nil
        });
    end;
    v17.onChanged = function(v20, v21) --[[ Line: 73 ]]
        -- upvalues: v18 (copy)
        v18.Plugin:Invoke("OnEdit", v20, v21);
    end;
    v17.onWidgetEnabledChanged = function(_) --[[ Line: 77 ]]
        -- upvalues: v17 (copy)
        v17.setDisabled();
        v17:setState({
            forceRerender = not v17.state.forceRerender
        });
    end;
    v17.closeOnDMChange = function() --[[ Line: 87 ]]
        -- upvalues: v18 (copy), v17 (copy)
        local l_FocusedDataModelSession_0 = v18.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 then
            local v24 = l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 91 ]]
                -- upvalues: v17 (ref)
                v17.setDisabled();
            end);
            v17:setState({
                closeDMConnection = v24
            });
        end;
    end;
    v18.Plugin:OnInvoke("OnOpen", function(v25, v26, v27, v28) --[[ Line: 100 ]]
        -- upvalues: v17 (copy)
        v17.closeOnDMChange();
        v17:setState({
            enabled = true, 
            instanceId = v27, 
            instanceName = v28, 
            initialData = v25, 
            initialPropertyType = v26
        });
    end);
    v18.Plugin:OnInvoke("OnInstanceChanged", function(v29, v30, v31) --[[ Line: 115 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            instanceId = v30, 
            instanceName = v31, 
            initialData = v29
        });
    end);
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "DirectionalCurveEditor"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 136 ]]
        return {};
    end, {});
    v17.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v17.design = l_registerPluginStyles_0(v18.Plugin);
end;
v16.didUpdate = function(_) --[[ Line: 144 ]] --[[ Name: didUpdate ]]

end;
v16.render = function(v33) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v15 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy)
    local l_props_0 = v33.props;
    local l_state_0 = v33.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v38 = {
        ["DirectionalCurveEditor_" .. l_state_0.instanceId] = v1.createElement(v15, {
            Enabled = l_enabled_0, 
            Data = l_state_0.initialData, 
            OnChanged = v33.onChanged, 
            InitialPropertyType = l_state_0.initialPropertyType
        })
    };
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        nil, 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v33.DEPRECATED_stylizer, 
        v33.localization, 
        v33.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "DirectionalCurveEditor", 
            Enabled = l_enabled_0, 
            Title = v33.localization:getText("Plugin", "Name") .. " - " .. l_state_0.instanceName, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(540, 540), 
            MinSize = Vector2.new(540, 300), 
            OnClose = v33.setDisabled, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v33.onDockWidgetCreated, 
            ShouldRestore = false, 
            [v1.Change.Enabled] = v33.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, v38), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v33.design
            })
        })
    });
end;
return v16;