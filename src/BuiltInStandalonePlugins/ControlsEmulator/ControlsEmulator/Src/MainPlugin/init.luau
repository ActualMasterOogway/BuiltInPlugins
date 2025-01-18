local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_DockWidget_0 = v2.UI.DockWidget;
local l_Dialog_0 = v2.UI.Dialog;
local v6 = v2.Util.LayoutOrderIterator.new();
local l_ContextServices_0 = v2.ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local v10 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local l_StudioTheme_0 = v2.Style.Themes.StudioTheme;
local l_registerPluginStyles_0 = v2.Styling.registerPluginStyles;
local l_Resources_0 = l_script_FirstAncestor_0.Src.Resources;
local l_SourceStrings_0 = l_Resources_0.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Resources_0.Localization.LocalizedStrings;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v17 = require(l_Components_0.DeviceBlueprint);
local v18 = require(l_Components_0.DeviceDropdown);
local v19 = require(l_Components_0.WidgetHeader);
local v20 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v21 = require(l_script_FirstAncestor_0.Src.Components.RootContainerInputContextProvider);
local v22 = require(l_script_FirstAncestor_0.Src.Components.MappingsContextProvider);
local v23 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v24 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v26 = require(l_script_FirstAncestor_0.Src.Components.MappingsDialog);
local v27 = require(l_script_FirstAncestor_0.Src.Components.KeyboardInputsForwarder);
local v28 = require(l_script_FirstAncestor_0.Src.Util.activeInputsReducer);
local v29 = require(l_script_FirstAncestor_0.Src.Components.DEPRECATED_VRControls);
local v30 = require(l_script_FirstAncestor_0.Src.Components.VRControls);
local v31 = require(l_script_FirstAncestor_0.Src.Util.devicePlatformEnumToControllerType);
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
local v33 = require(l_script_FirstAncestor_0.Src.Util.MockableEngineFeatures);
local l_LISTED_DEVICE_IDS_0 = v20.LISTED_DEVICE_IDS;
local v35 = v1.PureComponent:extend("MainPlugin");
local v36 = nil;
getLocalization = function() --[[ Line: 52 ]] --[[ Name: getLocalization ]]
    -- upvalues: v36 (ref), l_ContextServices_0 (copy), l_SourceStrings_0 (copy), l_LocalizedStrings_0 (copy)
    if not v36 then
        v36 = l_ContextServices_0.Localization.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = "ControlsEmulator"
        });
    end;
    return v36;
end;
v35.init = function(v37, v38) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_StudioDeviceEmulator_0 (copy), v31 (copy), l_getFFlagEnableVRControllers_0 (copy), v33 (copy), v3 (copy), v28 (copy), l_ContextServices_0 (copy), l_StudioTheme_0 (copy), l_registerPluginStyles_0 (copy)
    v37.state = {
        enabled = false, 
        wrapperRef = nil, 
        activeInputs = {}, 
        isVRConnected = false, 
        DEPRECATED_vrActiveUserCFrame = Enum.UserCFrame.Head, 
        activeVRUserCFrames = {
            [Enum.UserCFrame.Head] = true, 
            [Enum.UserCFrame.LeftHand] = true, 
            [Enum.UserCFrame.RightHand] = true
        }
    };
    v37.callbacksRef = v1.createRef();
    v37.connEmulatedDeviceChanged = nil;
    v37.updateEmulatedDevice = function(v39) --[[ Line: 81 ]]
        -- upvalues: l_StudioDeviceEmulator_0 (ref), v31 (ref), l_getFFlagEnableVRControllers_0 (ref), v37 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 82 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref)
            return l_StudioDeviceEmulator_0:GetCurrentlyEmulatedDeviceAsync();
        end);
        if not l_status_0 then
            warn("ControllersEmulator: Failed to get currently emulated device: ", l_result_0);
        end;
        local v42 = v31(l_result_0.platform, if l_getFFlagEnableVRControllers_0() then l_result_0.deviceId else nil);
        if v37.callbacksRef and v37.callbacksRef.current and v37.callbacksRef.current.changeEmulatedDevice then
            v37:setState({
                enabled = v39 or v42 ~= nil
            });
            v37.callbacksRef.current.changeEmulatedDevice(l_result_0);
        end;
    end;
    v37.connVRActiveUserCFrameChanged = nil;
    v37.connectToVRActiveUserCFrameChanged = function() --[[ Line: 101 ]]
        -- upvalues: v37 (copy), v33 (ref), l_StudioDeviceEmulator_0 (ref), v3 (ref)
        if v37.connVRActiveUserCFrameChanged ~= nil then
            return;
        elseif v33.VREmulatorFullRelease then
            v37.connVRActiveUserCFrameChanged = l_StudioDeviceEmulator_0.VRUserCFrameChanged:Connect(function(v43, v44) --[[ Line: 108 ]]
                -- upvalues: v37 (ref), v3 (ref)
                v37:setState(function(v45) --[[ Line: 109 ]]
                    -- upvalues: v3 (ref), v43 (copy), v44 (copy)
                    return {
                        activeVRUserCFrames = v3.Dictionary.join(v45.activeVRUserCFrames, {
                            [v43] = v44
                        })
                    };
                end);
                if v37.callbacksRef and v37.callbacksRef.current and v37.callbacksRef.current.setVRUserCFrameActive then
                    v37.callbacksRef.current.setVRUserCFrameActive(v43, v44, true);
                end;
            end);
            return;
        else
            pcall(function() --[[ Line: 128 ]]
                -- upvalues: v37 (ref), l_StudioDeviceEmulator_0 (ref)
                v37.connVRActiveUserCFrameChanged = l_StudioDeviceEmulator_0.DEPRECATED_VRActiveUserCFrameChanged:Connect(function(v46) --[[ Line: 130 ]]
                    -- upvalues: v37 (ref)
                    if v37.callbacksRef and v37.callbacksRef.current and v37.callbacksRef.current.DEPRECATED_setVRActiveUserCFrame then
                        v37:setState({
                            DEPRECATED_vrActiveUserCFrame = v46
                        });
                        v37.callbacksRef.current.DEPRECATED_setVRActiveUserCFrame(v46);
                    end;
                end);
            end);
            return;
        end;
    end;
    v37.connectToEmulatedDeviceChange = function() --[[ Line: 147 ]]
        -- upvalues: v37 (copy), l_StudioDeviceEmulator_0 (ref), v31 (ref), l_getFFlagEnableVRControllers_0 (ref)
        if v37.connEmulatedDeviceChanged ~= nil then
            return;
        else
            pcall(function() --[[ Line: 152 ]]
                -- upvalues: v37 (ref), l_StudioDeviceEmulator_0 (ref), v31 (ref), l_getFFlagEnableVRControllers_0 (ref)
                v37.connEmulatedDeviceChanged = l_StudioDeviceEmulator_0.EmulatedDeviceChanged:Connect(function(v47) --[[ Line: 154 ]]
                    -- upvalues: v31 (ref), l_getFFlagEnableVRControllers_0 (ref), v37 (ref)
                    local v48 = v31(v47.platform, if l_getFFlagEnableVRControllers_0() then v47.deviceId else nil);
                    v37:setState({
                        enabled = v48 ~= nil
                    });
                    if v37.callbacksRef and v37.callbacksRef.current and v37.callbacksRef.current.changeEmulatedDevice then
                        v37.callbacksRef.current.changeEmulatedDevice(v47);
                    end;
                end);
            end);
            return;
        end;
    end;
    v37.toggleEnabled = function() --[[ Line: 174 ]]
        -- upvalues: v37 (copy)
        v37:setState(function(v49) --[[ Line: 175 ]]
            -- upvalues: v37 (ref)
            local v50 = not v49.enabled;
            if v50 then
                v37.updateEmulatedDevice(true);
            end;
            return {
                enabled = v50
            };
        end);
    end;
    v37.onClose = function() --[[ Line: 186 ]]
        -- upvalues: v37 (copy), l_getFFlagEnableVRControllers_0 (ref), l_StudioDeviceEmulator_0 (ref)
        v37:setState({
            enabled = false
        });
        if l_getFFlagEnableVRControllers_0() then
            coroutine.wrap(function() --[[ Line: 191 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                pcall(function() --[[ Line: 192 ]]
                    -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                    l_StudioDeviceEmulator_0:DisconnectGamepadAsync(v37.state.gamepadId);
                end);
            end)();
        end;
    end;
    v37.onRestore = function(v51) --[[ Line: 199 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            enabled = v51
        });
        v37.updateEmulatedDevice(v51);
    end;
    v37.onWidgetEnabledChanged = function(v52) --[[ Line: 206 ]]
        -- upvalues: v37 (copy)
        v37:setState({
            enabled = v52.Enabled
        });
        v37.updateEmulatedDevice(v52.Enabled);
    end;
    v37.onDockWidgetCreated = function() --[[ Line: 213 ]]
        -- upvalues: v37 (copy), l_StudioDeviceEmulator_0 (ref), v28 (ref), l_getFFlagEnableVRControllers_0 (ref), v33 (ref)
        v37.props.PluginLoaderContext.mainButtonClickedSignal:Connect(v37.toggleEnabled);
        l_StudioDeviceEmulator_0.EmulatedGamepadEvent:Connect(function(_, v54, v55, v56) --[[ Line: 216 ]]
            -- upvalues: v37 (ref), v28 (ref)
            v37:setState(function(v57) --[[ Line: 217 ]]
                -- upvalues: v28 (ref), v54 (copy), v55 (copy), v56 (copy)
                return {
                    activeInputs = v28(v57.activeInputs, v54, v55, v56)
                };
            end);
        end);
        if l_getFFlagEnableVRControllers_0() then
            if v33.VREmulatorFullRelease then
                l_StudioDeviceEmulator_0.VREmulatorStartUp:Connect(function() --[[ Line: 226 ]]
                    -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                    pcall(function() --[[ Line: 227 ]]
                        -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                        l_StudioDeviceEmulator_0:SetVREmulationEnabledAsync(v37.state.enabled and v37.state.isVRConnected);
                        for v58, v59 in pairs(v37.state.activeVRUserCFrames) do
                            l_StudioDeviceEmulator_0:SetVRUserCFrameActiveAsync(v58, v59);
                        end;
                    end);
                end);
            else
                l_StudioDeviceEmulator_0.VREmulatorStartUp:Connect(function() --[[ Line: 236 ]]
                    -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                    pcall(function() --[[ Line: 237 ]]
                        -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                        l_StudioDeviceEmulator_0:SetVREmulationEnabledAsync(v37.state.enabled and v37.state.isVRConnected);
                        l_StudioDeviceEmulator_0:DEPRECATED_SetVRActiveUserCFrameAsync(v37.state.DEPRECATED_vrActiveUserCFrame);
                    end);
                end);
            end;
        end;
        l_StudioDeviceEmulator_0.GamepadEmulatorStartUp:Connect(function() --[[ Line: 247 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
            pcall(function() --[[ Line: 248 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), v37 (ref)
                l_StudioDeviceEmulator_0:SetGamepadEmulationEnabledAsync(v37.state.enabled);
            end);
        end);
        v37:setState({
            enabled = v37.props.PluginLoaderContext.mainDockWidget.Enabled
        });
        v37.updateEmulatedDevice(v37.props.PluginLoaderContext.mainDockWidget.Enabled);
        v37.connectToEmulatedDeviceChange();
        v37.connectToVRActiveUserCFrameChanged();
    end;
    v37.props.Plugin.Unloading:Connect(function() --[[ Line: 262 ]]
        -- upvalues: v37 (copy)
        if v37.connEmulatedDeviceChanged then
            v37.connEmulatedDeviceChanged:Disconnect();
            v37.connEmulatedDeviceChanged = nil;
        end;
        if v37.connVRActiveUserCFrameChanged then
            v37.connVRActiveUserCFrameChanged:Disconnect();
            v37.connVRActiveUserCFrameChanged = nil;
        end;
    end);
    v37.localization = getLocalization();
    v37.analytics = l_ContextServices_0.Analytics.new(function() --[[ Line: 279 ]]
        return {};
    end, {});
    v37.DEPRECATED_stylizer = l_StudioTheme_0.new();
    v37.design = l_registerPluginStyles_0(v38.Plugin);
end;
v35.didMount = function(v60) --[[ Line: 287 ]] --[[ Name: didMount ]]
    v60.props.Plugin:GetPluginComponent("PlaceManager").PlaceDocPanelClosed:Connect(function() --[[ Line: 293 ]]
        -- upvalues: v60 (copy)
        v60:setState({
            enabled = false
        });
    end);
end;
v35.didUpdate = function(v61) --[[ Line: 300 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_StudioDeviceEmulator_0 (copy), l_getFFlagEnableVRControllers_0 (copy)
    v61.props.PluginLoaderContext.mainButton:SetActive(v61.state.enabled);
    pcall(function() --[[ Line: 302 ]]
        -- upvalues: l_StudioDeviceEmulator_0 (ref), v61 (copy), l_getFFlagEnableVRControllers_0 (ref)
        l_StudioDeviceEmulator_0:SetGamepadEmulationEnabledAsync(v61.state.enabled);
        if l_getFFlagEnableVRControllers_0() then
            l_StudioDeviceEmulator_0:SetVREmulationEnabledAsync(v61.state.enabled and v61.state.isVRConnected);
        end;
    end);
end;
v35.render = function(v62) --[[ Line: 310 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v24 (copy), v23 (copy), l_getFFlagEnableVRControllers_0 (copy), v33 (copy), l_ContextServices_0 (copy), l_Plugin_0 (copy), l_Mouse_0 (copy), v10 (copy), l_DockWidget_0 (copy), v19 (copy), v6 (copy), v18 (copy), l_LISTED_DEVICE_IDS_0 (copy), v21 (copy), v27 (copy), v20 (copy), v17 (copy), v30 (copy), v29 (copy), l_Dialog_0 (copy), v26 (copy)
    local l_props_0 = v62.props;
    local l_state_0 = v62.state;
    local l_Plugin_1 = l_props_0.Plugin;
    local l_localization_0 = v62.localization;
    return v1.createElement(v24.Consumer, nil, function(v67) --[[ Line: 316 ]]
        -- upvalues: v1 (ref), v23 (ref), v62 (copy), l_getFFlagEnableVRControllers_0 (ref), v33 (ref), l_ContextServices_0 (ref), l_Plugin_0 (ref), l_Plugin_1 (copy), l_Mouse_0 (ref), v10 (ref), l_DockWidget_0 (ref), l_state_0 (copy), l_localization_0 (copy), l_props_0 (copy), v19 (ref), v6 (ref), v18 (ref), l_LISTED_DEVICE_IDS_0 (ref), v21 (ref), v27 (ref), v20 (ref), v17 (ref), v30 (ref), v29 (ref), l_Dialog_0 (ref), v26 (ref)
        return v1.createElement(v23.Consumer, nil, function(v68) --[[ Line: 317 ]]
            -- upvalues: v62 (ref), v67 (copy), l_getFFlagEnableVRControllers_0 (ref), v33 (ref), l_ContextServices_0 (ref), l_Plugin_0 (ref), l_Plugin_1 (ref), l_Mouse_0 (ref), v10 (ref), v1 (ref), l_DockWidget_0 (ref), l_state_0 (ref), l_localization_0 (ref), l_props_0 (ref), v19 (ref), v6 (ref), v18 (ref), l_LISTED_DEVICE_IDS_0 (ref), v21 (ref), v27 (ref), v20 (ref), v17 (ref), v30 (ref), v29 (ref), l_Dialog_0 (ref), v26 (ref)
            v62.callbacksRef.current = v67;
            local function v69() --[[ Line: 319 ]]
                -- upvalues: v62 (ref)
                task.delay(0, function() --[[ Line: 322 ]]
                    -- upvalues: v62 (ref)
                    v62.callbacksRef.current.setIsMappingsDialogOpen(false);
                end);
            end;
            if l_getFFlagEnableVRControllers_0() then
                local l_gamepadId_0 = v68.gamepadId;
                v62:setState({
                    gamepadId = l_gamepadId_0
                });
                if v33.VREmulatorFullRelease then
                    v62:setState({
                        isVRConnected = v68.isVRConnected, 
                        activeVRUserCFrames = v68.activeVRUserCFrames
                    });
                else
                    v62:setState({
                        isVRConnected = v68.isVRConnected, 
                        DEPRECATED_vrActiveUserCFrame = v68.DEPRECATED_vrActiveUserCFrame
                    });
                end;
            end;
            return l_ContextServices_0.provide({
                l_Plugin_0.new(l_Plugin_1), 
                l_Mouse_0.new(l_Plugin_1:getMouse()), 
                v10(), 
                v62.localization, 
                v62.analytics
            }, {
                MainWidget = v1.createElement(l_DockWidget_0, {
                    Id = "ControlsEmulator", 
                    Enabled = l_state_0.enabled, 
                    Title = l_localization_0:getText("MainWidget", "WidgetTitle"), 
                    Name = l_localization_0:getText("Plugin", "Name"), 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    InitialDockState = Enum.InitialDockState.Bottom, 
                    Size = Vector2.new(640, 480), 
                    OnClose = v62.onClose, 
                    Widget = l_props_0.PluginLoaderContext.mainDockWidget, 
                    OnWidgetCreated = v62.onDockWidgetCreated, 
                    [v1.Change.Enabled] = v62.onWidgetEnabledChanged
                }, {
                    LayoutContainer = if v62.state.enabled then v1.createElement("Frame", {
                        [v1.Tag] = "X-Fill X-Column X-Center"
                    }, {
                        WidgetHeader = v1.createElement(v19, {
                            [v1.Tag] = "Component-WidgetHeader", 
                            LayoutOrder = v6:getNextOrder(), 
                            leftContents = v1.createElement(v18, {
                                [v1.Tag] = "DeviceSelectorDropdown", 
                                LayoutOrder = v6:getNextOrder(), 
                                Size = UDim2.new(0, 250, 0, 40), 
                                onChanged = v67.connectGamepadId, 
                                deviceIds = if l_getFFlagEnableVRControllers_0() then v68.availableDeviceIds else l_LISTED_DEVICE_IDS_0, 
                                selectedGamepadId = v68.gamepadId
                            }), 
                            rightContents = v1.createElement("TextButton", {
                                [v1.Tag] = "EditMappingsButton HeaderButton Secondary", 
                                LayoutOrder = v6:getNextOrder(), 
                                Text = l_localization_0:getText("MainWidget", "EditMappingsButtonLabel"), 
                                [v1.Event.Activated] = function() --[[ Line: 387 ]]
                                    -- upvalues: v67 (ref), v68 (copy)
                                    v67.setIsMappingsDialogOpen(not v68.isMappingsDialogOpen);
                                end
                            })
                        }), 
                        Divider = v1.createElement("Frame", {
                            [v1.Tag] = "CX-Divider", 
                            LayoutOrder = v6:getNextOrder()
                        }), 
                        ScrollableBlueprintContainer = v1.createElement("ScrollingFrame", {
                            [v1.Tag] = v68.isVRConnected and "Includes-VR-Footer" or nil, 
                            LayoutOrder = v6:getNextOrder()
                        }, {
                            InputTrackingWrapper = v1.createElement(v21, {}, {
                                KeyboardInputsForwarder = v1.createElement(v27), 
                                GamepadAndVRLayoutContainer = v1.createElement("Frame", {
                                    [v1.Tag] = "CX-Invisible X-Fill"
                                }, {
                                    DeviceBlueprint = if v68.gamepadId ~= v20.NO_CONNECTED_GAMEPAD_ID then v1.createElement(v17, {
                                        LayoutOrder = v6:getNextOrder(), 
                                        selectedGamepadId = v68.gamepadId, 
                                        activeInputs = v62.state.activeInputs, 
                                        displayMappings = true
                                    }) else nil, 
                                    VRControls = if v68.isVRConnected then if v33.VREmulatorFullRelease then v1.createElement(v30, {
                                        LayoutOrder = v6:getNextOrder()
                                    }) else v1.createElement(v29, {
                                        LayoutOrder = v6:getNextOrder()
                                    }) else nil
                                })
                            })
                        })
                    }) else nil, 
                    StyleLink = v1.createElement("StyleLink", {
                        StyleSheet = v62.design
                    })
                }), 
                MappingsDialog = if v68.isMappingsDialogOpen then v1.createElement(l_Dialog_0, {
                    Id = "ControlsEmulatorMappings", 
                    Enabled = true, 
                    Title = "Edit Mappings", 
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    Resizable = true, 
                    ZIndex = 10, 
                    Modal = true, 
                    Size = Vector2.new(600, 620), 
                    MinSize = Vector2.new(400, 400), 
                    OnClose = v69
                }, {
                    InputTrackingWrapper = v1.createElement(v21, {}, {
                        KeyboardInputsForwarder = v1.createElement(v27), 
                        MappingsDialog = v1.createElement(v26)
                    }), 
                    StyleLink = v1.createElement("StyleLink", {
                        StyleSheet = v62.design
                    })
                }) else nil
            });
        end);
    end);
end;
return function(v71) --[[ Line: 461 ]]
    -- upvalues: v1 (copy), v22 (copy), v35 (copy)
    return v1.createElement(v22, {
        getLocalization = getLocalization
    }, {
        MainPlugin = v1.createElement(v35, v71)
    });
end;