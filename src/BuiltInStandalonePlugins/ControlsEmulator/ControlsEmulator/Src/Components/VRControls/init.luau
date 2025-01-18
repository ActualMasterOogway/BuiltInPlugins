local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v1.ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.MockableEngineFeatures);
local l_joinTags_0 = v1.Styling.joinTags;
local l_Checkbox_0 = v1.UI.Checkbox;
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
return v3.memo(function(v14) --[[ Line: 44 ]] --[[ Name: VRControls ]]
    -- upvalues: v7 (copy), l_Localization_0 (copy), v3 (copy), v5 (copy), v6 (copy), l_HAND_TRACKED_DEVICES_0 (copy), l_joinTags_0 (copy), v10 (copy), l_Checkbox_0 (copy), v13 (copy)
    assert(v7.VREmulatorFullRelease);
    local v15 = l_Localization_0:use();
    local v16 = v3.useContext(v5);
    local l_setVRUserCFrameActive_0 = v3.useContext(v6).setVRUserCFrameActive;
    local l_activeVRUserCFrames_0 = v16.activeVRUserCFrames;
    if not l_setVRUserCFrameActive_0 or not l_activeVRUserCFrames_0 then
        return;
    else
        local v19, v20 = v3.useState(false);
        local v21 = v3.useCallback(function() --[[ Line: 58 ]]
            -- upvalues: v20 (copy)
            v20(true);
        end, {
            v20
        });
        local v22 = v3.useCallback(function() --[[ Line: 61 ]]
            -- upvalues: v20 (copy)
            v20(false);
        end, {
            v20
        });
        local l_gamepadId_0 = v16.gamepadId;
        local v24 = v3.useMemo(function() --[[ Line: 66 ]]
            -- upvalues: l_HAND_TRACKED_DEVICES_0 (ref), l_gamepadId_0 (copy)
            return l_HAND_TRACKED_DEVICES_0[l_gamepadId_0] == true;
        end, {
            l_gamepadId_0
        });
        local v25, v26 = v3.useState(l_activeVRUserCFrames_0[Enum.UserCFrame.Head]);
        local v27, v28 = v3.useState(l_activeVRUserCFrames_0[Enum.UserCFrame.LeftHand]);
        local v29, v30 = v3.useState(l_activeVRUserCFrames_0[Enum.UserCFrame.RightHand]);
        local function _(v31) --[[ Line: 74 ]]
            if v31 then
                return 1;
            else
                return 0;
            end;
        end;
        local function _(v33, v34) --[[ Line: 78 ]]
            -- upvalues: v25 (copy), v27 (copy), v29 (copy)
            local v35 = (v25 and 1 or 0) + (v27 and 1 or 0) + (v29 and 1 or 0) == 1;
            if not v33 and v35 then
                return;
            else
                v34(v33);
                return;
            end;
        end;
        v3.useEffect(function() --[[ Line: 88 ]]
            -- upvalues: v24 (copy), v26 (copy), v28 (copy), v30 (copy)
            if not v24 then
                v26(true);
                v28(false);
                v30(false);
            end;
        end, {
            v24
        });
        v3.useEffect(function() --[[ Line: 96 ]]
            -- upvalues: v16 (copy), v26 (copy), v28 (copy), v30 (copy)
            if v16.shouldVRControlsRespond then
                v26(v16.activeVRUserCFrames[Enum.UserCFrame.Head]);
                v28(v16.activeVRUserCFrames[Enum.UserCFrame.LeftHand]);
                v30(v16.activeVRUserCFrames[Enum.UserCFrame.RightHand]);
            end;
        end, {
            v16.activeVRUserCFrames
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
                    CheckboxFrame = v3.createElement("Frame", {
                        LayoutOrder = v10:getNextOrder()
                    }, {
                        UILayout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left
                        }), 
                        HeadsetBox = v3.createElement(l_Checkbox_0, {
                            Checked = v25, 
                            Key = Enum.UserCFrame.Head.Name, 
                            OnClick = function() --[[ Line: 135 ]] --[[ Name: OnClick ]]
                                -- upvalues: v25 (copy), v26 (copy), v27 (copy), v29 (copy), l_setVRUserCFrameActive_0 (copy)
                                local v37 = not v25;
                                local l_v26_0 = v26;
                                local v39 = (v25 and 1 or 0) + (v27 and 1 or 0) + (v29 and 1 or 0) == 1;
                                if v37 or not v39 then
                                    l_v26_0(v37);
                                end;
                                l_setVRUserCFrameActive_0(Enum.UserCFrame.Head, v37, false);
                            end, 
                            Text = v15:getText("VRControls", "HeadsetLabel"), 
                            Disabled = false, 
                            LayoutOrder = v10:getNextOrder()
                        }), 
                        LeftHandBox = v3.createElement(l_Checkbox_0, {
                            Checked = v27, 
                            Key = Enum.UserCFrame.LeftHand.Name, 
                            OnClick = function() --[[ Line: 147 ]] --[[ Name: OnClick ]]
                                -- upvalues: v27 (copy), v28 (copy), v25 (copy), v29 (copy), l_setVRUserCFrameActive_0 (copy)
                                local v40 = not v27;
                                local l_v28_0 = v28;
                                local v42 = (v25 and 1 or 0) + (v27 and 1 or 0) + (v29 and 1 or 0) == 1;
                                if v40 or not v42 then
                                    l_v28_0(v40);
                                end;
                                l_setVRUserCFrameActive_0(Enum.UserCFrame.LeftHand, v40, false);
                            end, 
                            Text = v15:getText("VRControls", "LeftControllerLabel"), 
                            Disabled = not v24, 
                            LayoutOrder = v10:getNextOrder()
                        }), 
                        RightHandBox = v3.createElement(l_Checkbox_0, {
                            Checked = v29, 
                            Key = Enum.UserCFrame.RightHand.Name, 
                            OnClick = function() --[[ Line: 159 ]] --[[ Name: OnClick ]]
                                -- upvalues: v29 (copy), v30 (copy), v25 (copy), v27 (copy), l_setVRUserCFrameActive_0 (copy)
                                local v43 = not v29;
                                local l_v30_0 = v30;
                                local v45 = (v25 and 1 or 0) + (v27 and 1 or 0) + (v29 and 1 or 0) == 1;
                                if v43 or not v45 then
                                    l_v30_0(v43);
                                end;
                                l_setVRUserCFrameActive_0(Enum.UserCFrame.RightHand, v43, false);
                            end, 
                            Text = v15:getText("VRControls", "RightControllerLabel"), 
                            Disabled = not v24, 
                            LayoutOrder = v10:getNextOrder()
                        })
                    })
                }), 
                TooltipButton = v3.createElement("TextButton", {
                    [v3.Tag] = "X-Circle CX-Invisible", 
                    Text = v15:getText("VRControls", "TooltipQuestionmarkLabel"), 
                    LayoutOrder = v10:getNextOrder(), 
                    [v3.Event.MouseEnter] = v21, 
                    [v3.Event.MouseLeave] = v22
                }), 
                Tooltip = v19 and v3.createElement("Frame", {
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
    end;
end);