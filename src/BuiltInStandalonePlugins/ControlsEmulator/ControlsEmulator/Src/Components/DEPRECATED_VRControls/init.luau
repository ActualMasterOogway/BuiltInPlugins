local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v1.ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.MockableEngineFeatures);
local l_joinTags_0 = v1.Styling.joinTags;
local l_RadioButtonList_0 = v1.UI.RadioButtonList;
local v10 = v1.Util.LayoutOrderIterator.new();
local l_HAND_TRACKED_DEVICES_0 = v4.HAND_TRACKED_DEVICES;
local function v13(v12) --[[ Line: 24 ]] --[[ Name: VRMappingLabel ]]
    -- upvalues: v3 (copy), v10 (copy)
    return v3.createElement("Frame", {
        [v3.Tag] = "X-Row Component-VRMappingLabel", 
        LayoutOrder = v12.LayoutOrder
    }, {
        LeftText = v3.createElement("TextLabel", {
            [v3.Tag] = "CX-Invisible", 
            Text = v12.leftText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = v10:getNextOrder()
        }), 
        RightText = v3.createElement("TextLabel", {
            [v3.Tag] = "CX-Invisible", 
            Text = v12.rightText, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = v10:getNextOrder()
        })
    });
end;
return v3.memo(function(v14) --[[ Line: 44 ]] --[[ Name: DEPRECATED_VRControls ]]
    -- upvalues: v7 (copy), l_Localization_0 (copy), v3 (copy), v5 (copy), v6 (copy), l_HAND_TRACKED_DEVICES_0 (copy), l_joinTags_0 (copy), v10 (copy), l_RadioButtonList_0 (copy), v13 (copy)
    assert(not v7.VREmulatorFullRelease);
    local v15 = l_Localization_0:use();
    local v16 = v3.useContext(v5);
    local l_DEPRECATED_setVRActiveUserCFrame_0 = v3.useContext(v6).DEPRECATED_setVRActiveUserCFrame;
    local v18, v19 = v3.useState(false);
    local v20 = v3.useCallback(function() --[[ Line: 52 ]]
        -- upvalues: v19 (copy)
        v19(true);
    end, {
        v19
    });
    local v21 = v3.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v19 (copy)
        v19(false);
    end, {
        v19
    });
    local l_gamepadId_0 = v16.gamepadId;
    local v23 = v3.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: l_HAND_TRACKED_DEVICES_0 (ref), l_gamepadId_0 (copy)
        return l_HAND_TRACKED_DEVICES_0[l_gamepadId_0] == true;
    end, {
        l_gamepadId_0
    });
    local l_DEPRECATED_vrActiveUserCFrame_0 = v16.DEPRECATED_vrActiveUserCFrame;
    local v25 = l_DEPRECATED_vrActiveUserCFrame_0 and l_DEPRECATED_vrActiveUserCFrame_0.Name or Enum.UserCFrame.Head.Name;
    local v26, v27 = v3.useState(v25);
    v3.useEffect(function() --[[ Line: 68 ]]
        -- upvalues: v16 (copy), v27 (copy)
        if v16.DEPRECATED_vrActiveUserCFrame then
            v27(v16.DEPRECATED_vrActiveUserCFrame.Name);
        end;
    end, {
        v16.DEPRECATED_vrActiveUserCFrame
    });
    v3.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: l_DEPRECATED_setVRActiveUserCFrame_0 (copy), v26 (copy)
        if l_DEPRECATED_setVRActiveUserCFrame_0 then
            l_DEPRECATED_setVRActiveUserCFrame_0(Enum.UserCFrame[v26]);
        end;
    end, {
        v26
    });
    return v3.createElement("Frame", {
        [v3.Tag] = l_joinTags_0("Component-VRControls CX-Invisible"), 
        LayoutOrder = v14.LayoutOrder
    }, {
        InnerContainer = v3.createElement("Frame", {
            [v3.Tag] = "CX-Invisible", 
            LayoutOrder = v10:getNextOrder()
        }, {
            Separator = v3.createElement("Frame", {
                LayoutOrder = v10:getNextOrder()
            }), 
            Controls = v3.createElement("Frame", {
                [v3.Tag] = "X-Column CX-Invisible", 
                LayoutOrder = v10:getNextOrder()
            }, {
                Label = v3.createElement("TextLabel", {
                    [v3.Tag] = "CX-Invisible", 
                    Text = v15:getText("VRControls", "MoveAndRotateLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                RadioButtonList = v3.createElement(l_RadioButtonList_0, {
                    LayoutOrder = v10:getNextOrder(), 
                    Buttons = {
                        {
                            Key = Enum.UserCFrame.Head.Name, 
                            Text = v15:getText("VRControls", "HeadsetLabel"), 
                            Disabled = false
                        }, 
                        {
                            Key = Enum.UserCFrame.LeftHand.Name, 
                            Text = v15:getText("VRControls", "LeftControllerLabel"), 
                            Disabled = not v23
                        }, 
                        {
                            Key = Enum.UserCFrame.RightHand.Name, 
                            Text = v15:getText("VRControls", "RightControllerLabel"), 
                            Disabled = not v23
                        }
                    }, 
                    CurrentSelectedKey = v26, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    OnClick = v27
                })
            }), 
            TooltipButton = v3.createElement("TextButton", {
                [v3.Tag] = "X-Circle CX-Invisible", 
                Text = v15:getText("VRControls", "TooltipQuestionmarkLabel"), 
                LayoutOrder = v10:getNextOrder(), 
                [v3.Event.MouseEnter] = v20, 
                [v3.Event.MouseLeave] = v21
            }), 
            Tooltip = v18 and v3.createElement("Frame", {
                [v3.Tag] = "data-testid=Tooltip"
            }, {
                MoveMapping = v3.createElement(v13, {
                    leftText = v15:getText("VRControls", "MoveHelpLabel"), 
                    rightText = v15:getText("VRControls", "ShiftWASDLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                FlyMapping = v3.createElement(v13, {
                    leftText = v15:getText("VRControls", "FlyUpDownHelpLabel"), 
                    rightText = v15:getText("VRControls", "ShiftEQLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                RotateMapping = v3.createElement(v13, {
                    leftText = v15:getText("VRControls", "RotateHelpLabel"), 
                    rightText = v15:getText("VRControls", "MouseMoveHelpLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                TiltMapping = v3.createElement(v13, {
                    leftText = v15:getText("VRControls", "TiltHelpLabel"), 
                    rightText = v15:getText("VRControls", "RightClickAndMouseMoveHelpLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                ToggleCursorLock = v3.createElement(v13, {
                    leftText = v15:getText("VRControls", "ToggleCursorLockLabel"), 
                    rightText = v15:getText("VRControls", "ToggleCursorShortcutLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                SwitchControllers = v3.createElement(v13, {
                    leftText = v15:getText("VRControls", "SwitchControllersLabel"), 
                    rightText = v15:getText("VRControls", "ShiftLeftRightLabel"), 
                    LayoutOrder = v10:getNextOrder()
                }), 
                MouseMapping1 = v3.createElement("TextLabel", {
                    [v3.Tag] = "CX-Invisible", 
                    Text = v15:getText("VRControls", "MouseInteractionHelpLabel1"), 
                    LayoutOrder = v10:getNextOrder()
                })
            })
        })
    });
end);