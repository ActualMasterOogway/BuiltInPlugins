local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_Pane_0 = v2.UI.Pane;
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v12 = require(l_script_FirstAncestor_0.Src.Types);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.AudioEqualizerEditor);
local v15 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
local v16 = v1.PureComponent:extend("MainPlugin");
v16.init = function(v17, v18) --[[ Line: 38 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v15 (copy), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    local v19 = {
        InstanceType = v12.NO_INSTANCE, 
        Bypass = false
    };
    v17.state = {
        enabled = false, 
        instanceId = -1, 
        instanceName = "", 
        initialData = v19, 
        analysisEnabled = true, 
        closeDMConnection = nil, 
        forceRerender = false
    };
    v17.setDisabled = function() --[[ Line: 55 ]]
        -- upvalues: v17 (copy), v18 (copy), v19 (copy)
        if v17.state.closeDMConnection then
            v17.state.closeDMConnection:Disconnect();
        end;
        v18.Plugin:Invoke("OnStopEditing");
        v17:setState({
            enabled = false, 
            instanceId = -1, 
            instanceName = "", 
            initialData = v19, 
            closeDMConnection = nil
        });
    end;
    v17.onChanged = function(v20) --[[ Line: 71 ]]
        -- upvalues: v18 (copy)
        v18.Plugin:Invoke("OnEdit", v20);
    end;
    v17.onAttachAnalyzer = function(v21) --[[ Line: 75 ]]
        -- upvalues: v18 (copy)
        v18.Plugin:Invoke("OnAttachAnalyzer", v21);
    end;
    v17.setAnalysisEnabled = function(v22) --[[ Line: 79 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            analysisEnabled = v22
        });
    end;
    v17.onWidgetEnabledChanged = function(_) --[[ Line: 85 ]]
        -- upvalues: v17 (copy)
        v17.setDisabled();
        v17:setState({
            forceRerender = not v17.state.forceRerender
        });
    end;
    v17.closeOnDMChange = function() --[[ Line: 95 ]]
        -- upvalues: v18 (copy), v17 (copy)
        local l_FocusedDataModelSession_0 = v18.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 then
            local v25 = l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 99 ]]
                -- upvalues: v17 (ref)
                v17.setDisabled();
            end);
            v17:setState({
                closeDMConnection = v25
            });
        end;
    end;
    v18.Plugin:OnInvoke("OnOpen", function(v26, v27, v28) --[[ Line: 106 ]]
        -- upvalues: v17 (copy), v15 (ref)
        v17.closeOnDMChange();
        v15.setInstanceType(v26.InstanceType);
        v17:setState({
            enabled = true, 
            instanceId = v27, 
            instanceName = v28, 
            initialData = v26
        });
    end);
    v18.Plugin:OnInvoke("OnInstanceChanged", function(v29) --[[ Line: 118 ]]
        -- upvalues: v17 (copy)
        v17:setState({
            initialData = v29
        });
    end);
    v17.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AudioEqualizerEditor"
    });
    v17.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 130 ]]
        return {};
    end, {});
    v17.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v17.design = l_registerPluginStyles_0(v18.Plugin);
end;
v16.render = function(v30) --[[ Line: 146 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v14 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy)
    local l_props_0 = v30.props;
    local l_state_0 = v30.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v35 = {
        [("AudioEqualizerEditor_%*"):format(l_state_0.instanceId)] = v1.createElement(v14, {
            Enabled = l_enabled_0, 
            Data = l_state_0.initialData, 
            OnChanged = v30.onChanged, 
            AnalysisEnabled = v30.state.analysisEnabled, 
            SetAnalysisEnabled = v30.setAnalysisEnabled
        })
    };
    local v36 = "AudioEqualizerEditor";
    if l_enabled_0 then
        v36 = ("%* - %*"):format(v30.localization:getText("Plugin", (("%*Editor"):format(l_state_0.initialData.InstanceType))), l_state_0.instanceName);
    end;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v30.DEPRECATED_stylizer, 
        v30.localization, 
        v30.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AudioEqualizerEditor", 
            Enabled = l_enabled_0, 
            Title = v36, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v30.setDisabled, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v30.onDockWidgetCreated, 
            ShouldRestore = false, 
            [v1.Change.Enabled] = v30.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                v35
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v30.design
            })
        })
    });
end;
return v16;