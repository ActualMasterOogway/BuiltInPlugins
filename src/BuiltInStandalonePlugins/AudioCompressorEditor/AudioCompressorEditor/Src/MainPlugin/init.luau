local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
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
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v14 = require(l_Components_0.AudioCompressorEditor);
local v15 = v1.PureComponent:extend("MainPlugin");
v15.init = function(v16, v17) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    local v18 = {
        InstanceType = "AudioLimiter", 
        Threshold = 0, 
        Ratio = 0, 
        Attack = 0, 
        Release = 0, 
        MakeupGain = 0, 
        Bypass = false
    };
    local v19 = {
        ShowEnvelope = true, 
        ShowInputWaveform = false, 
        ShowOutputWaveform = false, 
        ShowGainChange = true, 
        IsPaused = false
    };
    v16.state = {
        enabled = false, 
        instanceName = "", 
        initialData = v18, 
        displaySettings = v19, 
        closeDMConnection = nil, 
        forceRerender = false
    };
    v16.setDisabled = function() --[[ Line: 54 ]]
        -- upvalues: v16 (copy), v17 (copy), v18 (copy)
        if v16.state.closeDMConnection then
            v16.state.closeDMConnection:Disconnect();
        end;
        v17.Plugin:Invoke("OnStopEditing");
        v16:setState({
            enabled = false, 
            instanceName = "", 
            initialData = v18, 
            closeDMConnection = nil
        });
    end;
    v16.onChanged = function(v20) --[[ Line: 69 ]]
        -- upvalues: v17 (copy)
        v17.Plugin:Invoke("OnEdit", v20);
    end;
    v16.onAttachAnalyzer = function(v21) --[[ Line: 73 ]]
        -- upvalues: v17 (copy)
        v17.Plugin:Invoke("OnAttachAnalyzer", v21);
    end;
    v16.updateDisplaySettings = function(v22) --[[ Line: 77 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            displaySettings = v22
        });
    end;
    v16.onWidgetEnabledChanged = function(_) --[[ Line: 83 ]]
        -- upvalues: v16 (copy)
        v16.setDisabled();
        v16:setState({
            forceRerender = not v16.state.forceRerender
        });
    end;
    v16.closeOnDMChange = function() --[[ Line: 93 ]]
        -- upvalues: v17 (copy), v16 (copy)
        local l_FocusedDataModelSession_0 = v17.Plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
        if l_FocusedDataModelSession_0 then
            local v25 = l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 97 ]]
                -- upvalues: v16 (ref)
                v16.setDisabled();
            end);
            v16:setState({
                closeDMConnection = v25
            });
        end;
    end;
    v17.Plugin:OnInvoke("OnOpen", function(v26, v27) --[[ Line: 104 ]]
        -- upvalues: v16 (copy)
        v16.closeOnDMChange();
        v16:setState({
            enabled = true, 
            instanceName = v27, 
            initialData = v26
        });
    end);
    v17.Plugin:OnInvoke("OnInstanceChanged", function(v28) --[[ Line: 113 ]]
        -- upvalues: v16 (copy)
        v16:setState({
            initialData = v28
        });
    end);
    v16.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "AudioCompressorEditor"
    });
    v16.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 125 ]]
        return {};
    end, {});
    v16.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v16.design = l_registerPluginStyles_0(v17.Plugin);
end;
v15.render = function(v29) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v1 (copy), l_DockWidget_0 (copy), l_Pane_0 (copy), v14 (copy)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_enabled_0 = l_state_0.enabled;
    local v34 = "AudioCompressorEditor";
    if l_enabled_0 then
        v34 = ("%* - %*"):format(v29.localization:getText("Plugin", "AudioCompressorEditor"), l_state_0.instanceName);
    end;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v29.DEPRECATED_stylizer, 
        v29.localization, 
        v29.analytics
    }, {
        MainWidget = v1.createElement(l_DockWidget_0, {
            Id = "AudioCompressorEditor", 
            Enabled = l_enabled_0, 
            Title = v34, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            InitialDockState = Enum.InitialDockState.Float, 
            Size = Vector2.new(640, 480), 
            MinSize = Vector2.new(250, 200), 
            OnClose = v29.setDisabled, 
            Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
            OnWidgetCreated = v29.onDockWidgetCreated, 
            ShouldRestore = false, 
            [v1.Change.Enabled] = v29.onWidgetEnabledChanged
        }, {
            Wrapper = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Fill X-Column"
            }, {
                AudioCompressorEditor = v1.createElement(v14, {
                    Enabled = l_enabled_0, 
                    Data = l_state_0.initialData, 
                    OnChanged = v29.onChanged, 
                    DisplaySettings = v29.state.displaySettings, 
                    SetDisplaySettings = v29.updateDisplaySettings
                })
            }), 
            StyleLink = v1.createElement("StyleLink", {
                StyleSheet = v29.design
            })
        })
    });
end;
return v15;