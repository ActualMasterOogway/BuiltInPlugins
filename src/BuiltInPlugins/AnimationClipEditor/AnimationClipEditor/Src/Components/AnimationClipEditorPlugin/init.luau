local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.SetDefaultEulerAnglesOrder);
local v7 = require(l_Actions_0.SetDefaultRotationType);
local v8 = require(l_Actions_0.SetShowAsSeconds);
local v9 = require(l_Actions_0.SetSnapMode);
local v10 = require(l_Actions_0.SetTimelineUnit);
local v11 = require(l_Actions_0.SetTool);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v13 = require(l_Components_0.AnimationClipEditor);
local v14 = require(l_Components_0.PluginWidget.DockWidget);
local v15 = require(l_Components_0.Draggers.DraggerWrapper);
local _ = require(l_Components_0.BlockingDialog.ErrorDialogContents);
local v17 = require(l_Components_0.BlockingDialog.ErrorList);
local l_Context_0 = l_script_FirstAncestor_0.Src.Context;
local v19 = require(l_Context_0.MainProvider);
local v20 = require(l_Context_0.Signals);
local v21 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_Localization_0 = l_ContextServices_0.Localization;
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.LocalizedStrings;
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v26 = require(l_Thunks_0.ReleaseEditor);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v28 = require(l_Util_0.CalloutController);
local v29 = require(l_Util_0.Constants);
local v30 = require(l_Util_0.DebugFlags);
local v31 = require(l_Util_0.MakePluginActions);
local v32 = require(l_Util_0.RigVisualization);
local v33 = require(l_Util_0.showBlockingDialog);
local v34 = require(l_Util_0.Theme);
local v35 = require(l_script_FirstAncestor_0.Src.Resources.AnalyticsHandlers);
local v36 = v2.PureComponent:extend("AnimationClipEditorPlugin");
local l_game_FastString_0 = game:GetFastString("FaceControlsEditorLink");
local v38 = game:DefineFastString("ACECurveEditorLink", "https://create.roblox.com/docs/building-and-visuals/animation/curve-editor");
local v39 = game:DefineFastString("ACEFaceRecorderLink", "https://create.roblox.com/docs/building-and-visuals/animation/face-recorder");
local v40 = game:DefineFastFlag("ACETemporaryToolHack", false);
local v41 = game:DefineFastFlag("ACEDeferClearMicrobones", false);
local v42 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v43 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
v36.handleButtonClick = function(v44, v45) --[[ Line: 73 ]] --[[ Name: handleButtonClick ]]
    -- upvalues: l_RunService_0 (copy), v33 (copy), v2 (copy), v17 (copy), v29 (copy)
    if l_RunService_0:IsRunning() then
        v33(v45, v2.createElement(v17, {
            ErrorKey = v29.EDITOR_ERRORS_KEY, 
            ErrorList = {
                {
                    ID = v29.EDITOR_ERRORS.OpenedWhileRunning
                }
            }
        }));
        return;
    else
        v44:setState(function(v46) --[[ Line: 85 ]]
            return {
                enabled = not v46.enabled
            };
        end);
        return;
    end;
end;
v36.createPluginButton = function(v47, _, _) --[[ Line: 93 ]] --[[ Name: createPluginButton ]]
    v47.toolbar = v47.props.pluginLoaderContext.toolbar;
    v47.mainButton = v47.props.pluginLoaderContext.mainButton;
end;
v36.init = function(v50, v51) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v30 (copy), v21 (copy), l_Localization_0 (copy), v29 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy), v28 (copy), l_game_FastString_0 (copy), v38 (copy), v42 (copy), v39 (copy), l_ContextServices_0 (copy), v31 (copy), v20 (copy), v35 (copy), l_RunService_0 (copy), v11 (copy), v41 (copy), v32 (copy), v26 (copy), v40 (copy), v34 (copy)
    assert(v51.plugin ~= nil, "AnimationClipEditorPlugin requires a Plugin.");
    local v52 = {
        v3.thunkMiddleware
    };
    if v30.LogRoduxEvents() then
        table.insert(v52, v3.loggerMiddleware);
    end;
    v50.store = v3.Store.new(v21, nil, v52);
    v50.localization = l_Localization_0.new({
        pluginName = v29.PLUGIN_NAME, 
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0
    });
    v50.calloutController = v28.new();
    local v53 = v50.localization:getText("FaceControlsEditorButtonCallout", "Title");
    local v54 = v50.localization:getText("FaceControlsEditorButtonCallout", "Description");
    local l_l_game_FastString_0_0 = l_game_FastString_0;
    v50.calloutController:defineCallout("FaceControlsEditorCallout", v53, v54, l_l_game_FastString_0_0);
    v50.calloutController:defineCallout("CurveEditorCallout", v50.localization:getText("CurveEditorCallout", "Title"), v50.localization:getText("CurveEditorCallout", "Description"), v38);
    if v42() then
        v50.calloutController:defineCallout("FaceRecorderCallout", v50.localization:getText("FaceCapture", "TeachingCalloutTitle"), v50.localization:getText("FaceCapture", "TeachingCalloutDescription"), v39);
    end;
    v50.actions = l_ContextServices_0.PluginActions.new(v51.plugin, v31(v51.plugin, v50.localization));
    v50.state = {
        enabled = false, 
        pluginGui = nil
    };
    v50.signals = v20.new(v29.SIGNAL_KEYS);
    v50.analytics = l_ContextServices_0.Analytics.new(v35);
    v50.onDockWidgetLoaded = function(v56) --[[ Line: 154 ]]
        -- upvalues: v50 (copy)
        v50.dockWidget = v56;
    end;
    v50:createPluginButton(v51.plugin, v50.localization);
    v50.mainButton:SetActive(v50.state.enabled);
    task.defer(function() --[[ Line: 162 ]]
        -- upvalues: v51 (copy), v50 (copy)
        v51.pluginLoaderContext.mainButtonClickedSignal:Connect(function() --[[ Line: 163 ]]
            -- upvalues: v50 (ref), v51 (ref)
            v50:handleButtonClick(v51.plugin);
        end);
    end);
    v50.onDockWidgetEnabledChanged = function(v57) --[[ Line: 168 ]]
        -- upvalues: v50 (copy)
        if v50.state.enabled == v57 then
            return;
        else
            v50:setState({
                enabled = v57
            });
            return;
        end;
    end;
    v50.onToolSelected = function(v58) --[[ Line: 181 ]]
        -- upvalues: v51 (copy), v50 (copy), l_RunService_0 (ref), v11 (ref)
        local l_plugin_0 = v51.plugin;
        if (v58 == Enum.RibbonTool.Select or v58 == Enum.RibbonTool.Rotate or v58 == Enum.RibbonTool.Move or v58 == Enum.RibbonTool.Scale) and v50.state.enabled then
            local v60 = nil;
            v60 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 191 ]]
                -- upvalues: v60 (ref), v50 (ref), l_plugin_0 (copy)
                v60:Disconnect();
                v50.mainButton:SetActive(true);
                l_plugin_0:Activate(true);
            end);
            v58 = v58 == Enum.RibbonTool.Scale and Enum.RibbonTool.Select or v58;
            v50.store:dispatch(v11(v58));
            v50.analytics:report("onToolChanged", v58.Name);
            return true;
        else
            return;
        end;
    end;
    v50.deactivationInProgress = false;
    local function v62() --[[ Line: 210 ]] --[[ Name: deactivationContinuation ]]
        -- upvalues: v51 (copy), v50 (copy), v41 (ref), v32 (ref), v26 (ref)
        local l_SelectedRibbonTool_0 = v51.plugin:GetSelectedRibbonTool();
        if l_SelectedRibbonTool_0 ~= Enum.RibbonTool.None and v50.onToolSelected(l_SelectedRibbonTool_0) then
            return;
        else
            if v50.state.enabled then
                if v41 then
                    v32.clearMicrobones();
                end;
                v50.store:dispatch(v26(v50.analytics));
            end;
            return;
        end;
    end;
    v50.deactivationListener = v50.props.plugin.Deactivation:Connect(function() --[[ Line: 226 ]]
        -- upvalues: v51 (copy), v41 (ref), v32 (ref), v40 (ref), v50 (copy), v62 (copy), v26 (ref)
        local l_plugin_1 = v51.plugin;
        if not v41 then
            v32.clearMicrobones();
        end;
        if v40 then
            v50.deactivationInProgress = true;
            task.wait();
            task.wait();
            v62();
            v50.deactivationInProgress = false;
            return;
        else
            if v41 then
                v32.clearMicrobones();
            end;
            local l_l_plugin_1_SelectedRibbonTool_0 = l_plugin_1:GetSelectedRibbonTool();
            if l_l_plugin_1_SelectedRibbonTool_0 ~= Enum.RibbonTool.None and v50.onToolSelected(l_l_plugin_1_SelectedRibbonTool_0) then
                return;
            else
                if v50.state.enabled then
                    v50.store:dispatch(v26(v50.analytics));
                end;
                return;
            end;
        end;
    end);
    v50.unloadingListener = if v40 then v50.props.plugin.Unloading:Connect(function() --[[ Line: 259 ]]
        -- upvalues: v50 (copy), v62 (copy)
        if v50.deactivationInProgress then
            v62();
            v50.deactivationInProgress = false;
        end;
    end) else nil;
    v50.mouse = v50.props.plugin:GetMouse();
    v50.theme = v34();
    v50.closeWidget = function() --[[ Line: 270 ]]
        -- upvalues: v50 (copy)
        v50:setState({
            enabled = false
        });
    end;
end;
v36.getPluginSettings = function(v65) --[[ Line: 277 ]] --[[ Name: getPluginSettings ]]
    -- upvalues: v29 (copy), v9 (copy), v43 (copy), v10 (copy), v8 (copy), v7 (copy), v6 (copy)
    local l_plugin_2 = v65.props.plugin;
    local l_l_plugin_2_Setting_0 = l_plugin_2:GetSetting(v29.SETTINGS.SnapMode);
    local l_l_plugin_2_Setting_1 = l_plugin_2:GetSetting(v29.SETTINGS.ShowAsSeconds);
    local l_l_plugin_2_Setting_2 = l_plugin_2:GetSetting(v29.SETTINGS.TimelineUnit);
    if l_l_plugin_2_Setting_0 ~= nil then
        v65.store:dispatch(v9(l_l_plugin_2_Setting_0));
    else
        l_l_plugin_2_Setting_0 = l_plugin_2:GetSetting("SnapMode");
        if l_l_plugin_2_Setting_0 ~= nil then
            v65.store:dispatch(v9(l_l_plugin_2_Setting_0));
        else
            v65.store:dispatch(v9(v29.SNAP_MODES.Keyframes));
        end;
    end;
    if v43() then
        if l_l_plugin_2_Setting_2 then
            v65.store:dispatch(v10(l_l_plugin_2_Setting_2));
        elseif l_l_plugin_2_Setting_1 ~= nil then
            local v70 = if l_l_plugin_2_Setting_1 then v29.TIMELINE_UNITS.Seconds else v29.TIMELINE_UNITS.Frames;
            v65.store:dispatch(v10(v70));
        end;
    elseif l_l_plugin_2_Setting_1 ~= nil then
        v65.store:dispatch(v8(l_l_plugin_2_Setting_1));
    else
        l_l_plugin_2_Setting_1 = l_plugin_2:GetSetting("ShowAsSeconds");
        if l_l_plugin_2_Setting_1 ~= nil then
            v65.store:dispatch(v8(l_l_plugin_2_Setting_1));
        end;
    end;
    local l_l_plugin_2_Setting_3 = l_plugin_2:GetSetting(v29.SETTINGS.RotationType);
    if l_l_plugin_2_Setting_3 then
        v65.store:dispatch(v7(l_l_plugin_2_Setting_3));
    else
        l_l_plugin_2_Setting_3 = l_plugin_2:GetSetting("RotationType");
        if l_l_plugin_2_Setting_3 then
            v65.store:dispatch(v7(l_l_plugin_2_Setting_3));
        else
            v65.store:dispatch(v7(v29.TRACK_TYPES.EulerAngles));
        end;
    end;
    local l_l_plugin_2_Setting_4 = l_plugin_2:GetSetting(v29.SETTINGS.EulerAnglesOrder);
    v65.store:dispatch(v6(if l_l_plugin_2_Setting_4 then Enum.RotationOrder[l_l_plugin_2_Setting_4] else Enum.RotationOrder.XYZ));
end;
v36.setPluginSettings = function(v73) --[[ Line: 338 ]] --[[ Name: setPluginSettings ]]
    -- upvalues: v43 (copy), v29 (copy)
    local l_plugin_3 = v73.props.plugin;
    local l_Status_0 = v73.store:getState().Status;
    if v43() then
        l_plugin_3:SetSetting(v29.SETTINGS.TimelineUnit, l_Status_0.TimelineUnit);
    else
        l_plugin_3:SetSetting(v29.SETTINGS.ShowAsSeconds, l_Status_0.ShowAsSeconds);
    end;
    l_plugin_3:SetSetting(v29.SETTINGS.SnapMode, l_Status_0.SnapMode);
    l_plugin_3:SetSetting(v29.SETTINGS.RotationType, l_Status_0.DefaultRotationType);
    l_plugin_3:SetSetting(v29.SETTINGS.EulerAnglesOrder, l_Status_0.DefaultEulerAnglesOrder);
end;
local function _(v76) --[[ Line: 351 ]] --[[ Name: getAnimationUploadSuccessEvent ]]
    -- upvalues: v29 (copy)
    if not v76 then
        return nil;
    else
        return v76:FindFirstChild(v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
    end;
end;
local function _(v78) --[[ Line: 359 ]] --[[ Name: getOrCreateAnimationUploadSuccessEvent ]]
    -- upvalues: v29 (copy)
    local v79 = if not v78 then nil else v78:FindFirstChild(v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
    if not v79 then
        v79 = Instance.new("BindableEvent");
        v79.Name = v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME;
        v79.Parent = v78;
    end;
    return v79;
end;
local function _(v81) --[[ Line: 369 ]] --[[ Name: destroyAnimationUploadSuccessEvent ]]
    -- upvalues: v29 (copy)
    local v82 = if not v81 then nil else v81:FindFirstChild(v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
    if v82 then
        v82:Destroy();
    end;
end;
v36.didMount = function(v84) --[[ Line: 376 ]] --[[ Name: didMount ]]
    -- upvalues: v29 (copy)
    v84:setState({
        pluginGui = v84.dockWidget, 
        enabled = v84.dockWidget.Enabled
    });
    v84:getPluginSettings();
    local l_dockWidget_0 = v84.dockWidget;
    if not if not l_dockWidget_0 then nil else l_dockWidget_0:FindFirstChild(v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME) then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME;
        l_BindableEvent_0.Parent = l_dockWidget_0;
    end;
end;
v36.willUnmount = function(v87) --[[ Line: 386 ]] --[[ Name: willUnmount ]]
    -- upvalues: v40 (copy), v29 (copy)
    if v87.deactivationListener then
        v87.deactivationListener:Disconnect();
    end;
    if v40 and v87.unloadingListener then
        v87.unloadingListener:Disconnect();
    end;
    local l_dockWidget_1 = v87.dockWidget;
    local v89 = if not l_dockWidget_1 then nil else l_dockWidget_1:FindFirstChild(v29.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
    if v89 then
        v89:Destroy();
    end;
    v87:setPluginSettings();
    v87.theme:destroy();
end;
v36.render = function(v90) --[[ Line: 398 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v14 (copy), v19 (copy), v13 (copy), v15 (copy)
    local l_props_0 = v90.props;
    local l_store_0 = v90.store;
    local l_localization_0 = v90.localization;
    local l_plugin_4 = l_props_0.plugin;
    local l_actions_0 = v90.actions;
    local l_analytics_0 = v90.analytics;
    local l_mouse_0 = v90.mouse;
    local l_theme_0 = v90.theme;
    local l_pluginGui_0 = v90.state.pluginGui;
    local v100 = l_pluginGui_0 ~= nil;
    local l_enabled_0 = v90.state.enabled;
    v90.mainButton:SetActive(l_enabled_0);
    return v2.createElement(v14, {
        Id = "AnimationClipEditor", 
        Title = l_localization_0:getText("Plugin", "Name"), 
        Name = "AnimationClipEditor", 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Widget = l_props_0.pluginLoaderContext.mainDockWidget, 
        Enabled = l_enabled_0, 
        [v2.Ref] = v90.onDockWidgetLoaded, 
        [v2.Change.Enabled] = v90.onDockWidgetEnabledChanged, 
        OnClose = v90.closeWidget
    }, {
        MainProvider = v100 and l_enabled_0 and v2.createElement(v19, {
            theme = l_theme_0, 
            focusGui = l_pluginGui_0, 
            store = l_store_0, 
            plugin = l_plugin_4, 
            localization = l_localization_0, 
            pluginActions = l_actions_0, 
            mouse = l_mouse_0, 
            analytics = l_analytics_0, 
            signals = v90.signals, 
            calloutController = v90.calloutController
        }, {
            AnimationClipEditor = v2.createElement(v13), 
            Dragger = v2.createElement(v15)
        })
    });
end;
return v36;