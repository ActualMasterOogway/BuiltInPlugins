local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Localization_0 = v3.ContextServices.Localization;
local v5 = v3.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v3.Styling.joinTags;
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v8 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local v9 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v10 = require(l_script_FirstAncestor_0.Src.Components.MappingsList);
local v11 = require(script.MappingsInputListener);
local v12 = require(l_script_FirstAncestor_0.Src.Components.WidgetHeader);
local v13 = require(l_script_FirstAncestor_0.Src.Components.DeviceDropdown);
local v14 = require(l_script_FirstAncestor_0.Src.Components.DeviceBlueprint);
local v15 = require(script.ResetMappingsConfirmationDialog);
local v16 = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
local v17 = require(script.ErrorsBanner);
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
local v19 = require(l_script_FirstAncestor_0.Src.Util.MockableEngineFeatures);
local l_KEY_NAMES_DEFINITIONS_0 = v16.KEY_NAMES_DEFINITIONS;
local l_LISTED_DEVICE_IDS_0 = v7.LISTED_DEVICE_IDS;
return v2.memo(function() --[[ Line: 34 ]] --[[ Name: MappingsDialog ]]
    -- upvalues: v2 (copy), v9 (copy), v8 (copy), l_Localization_0 (copy), v19 (copy), v1 (copy), l_KEY_NAMES_DEFINITIONS_0 (copy), v11 (copy), v5 (copy), v12 (copy), v13 (copy), l_getFFlagEnableVRControllers_0 (copy), l_LISTED_DEVICE_IDS_0 (copy), l_joinTags_0 (copy), v14 (copy), v10 (copy), v15 (copy), v17 (copy)
    local v22 = v2.useContext(v9);
    local v23 = v2.useContext(v8);
    local v24 = l_Localization_0:use();
    local l_saveMappings_0 = v23.saveMappings;
    local v26 = if v19.VREmulatorFullRelease then v2.useMemo(function() --[[ Line: 41 ]]
        -- upvalues: v1 (ref), v22 (copy)
        return not v1.isEmpty(v22.mappingsOverrides[v22.isUpdatingMappingForGamepadId] or {});
    end, {
        v22.mappingsOverrides, 
        v22.isUpdatingMappingForGamepadId
    }) else nil;
    local v27, v28 = v2.useState(nil);
    local v30 = v2.useCallback(function(v29) --[[ Line: 51 ]]
        -- upvalues: v28 (copy)
        v28(v29);
    end, {
        v28
    });
    local v32 = v2.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v27 (copy), l_KEY_NAMES_DEFINITIONS_0 (ref)
        if v27 == nil then
            return {};
        else
            local v31 = l_KEY_NAMES_DEFINITIONS_0[v27];
            return {
                [v31.keyCode] = v31.direction
            };
        end;
    end, {
        v27
    });
    local v33, v34 = v2.useState(false);
    local v35 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v34 (copy)
        v34(false);
    end, {
        v34
    });
    local v36 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v34 (copy)
        v34(true);
    end, {
        v34
    });
    local v37 = v2.useRef(0);
    local v38 = v2.useRef(nil);
    local v40 = v2.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v38 (copy), v37 (copy)
        if v38.current and v37.current ~= nil then
            local l_Y_0 = v38.current.AbsoluteSize.Y;
            if l_Y_0 < v37.current then
                v38.current.CanvasSize = UDim2.new(0, 0, v37.current / l_Y_0, 0);
                v38.current.ScrollBarThickness = 8;
                return;
            else
                v38.current.CanvasSize = UDim2.new(0, 0, 0, 0);
                v38.current.ScrollBarThickness = 0;
            end;
        end;
    end, {});
    local v42 = v2.useCallback(function(v41) --[[ Line: 87 ]]
        -- upvalues: v37 (copy), v40 (copy)
        v37.current = v41.AbsoluteSize.Y;
        v40();
    end, {});
    return v2.createElement("Frame", {
        [v2.Tag] = "Component-MappingsDialog X-Fill CX-Invisible data-testid=Component-MappingsDialog"
    }, {
        MappingsInputListener = v2.createElement(v11, {
            [v2.Tag] = "X-Fill CX-Invisible"
        }, {
            LayoutContainer = v2.createElement("Frame", {
                [v2.Tag] = "X-Column X-Fill CX-Invisible", 
                LayoutOrder = v5:getNextOrder()
            }, {
                WidgetHeader = v2.createElement(v12, {
                    [v2.Tag] = "Width-Scaling", 
                    LayoutOrder = v5:getNextOrder(), 
                    leftContents = v2.createElement(v13, {
                        [v2.Tag] = "DeviceSelectorDropdown", 
                        LayoutOrder = v5:getNextOrder(), 
                        onChanged = v23.connectGamepadId, 
                        deviceIds = if l_getFFlagEnableVRControllers_0() then v22.availableDeviceIds else l_LISTED_DEVICE_IDS_0, 
                        selectedGamepadId = v22.isUpdatingMappingForGamepadId or 101
                    }), 
                    rightContents = v2.createElement(v2.Fragment, {}, {
                        MappingsRestoreDefaultsButton = v2.createElement("TextButton", {
                            [v2.Tag] = "RestoreDefaultsButton HeaderButton Secondary", 
                            LayoutOrder = v5:getNextOrder(), 
                            Text = v24:getText("MappingsDialog", "RestoreDefaultsButtonLabel"), 
                            [v2.Event.Activated] = v36
                        }), 
                        MappingsSaveButton = v2.createElement("TextButton", {
                            [v2.Tag] = l_joinTags_0("SaveChangesButton", "data-testid=Component-SaveChangesButton", "HeaderButton", (not v19.VREmulatorFullRelease or v26) and "Primary" or "Inactive"), 
                            LayoutOrder = v5:getNextOrder(), 
                            Text = v24:getText("MappingsDialog", "SaveButtonLabel"), 
                            [v2.Event.Activated] = l_saveMappings_0, 
                            Active = not v19.VREmulatorFullRelease or v26
                        })
                    })
                }), 
                Divider = v2.createElement("Frame", {
                    [v2.Tag] = "CX-Divider", 
                    LayoutOrder = v5:getNextOrder()
                }), 
                HorizontalScrollingFrame = v2.createElement("ScrollingFrame", {
                    [v2.Tag] = "X-Fill CX-Invisible", 
                    LayoutOrder = v5:getNextOrder()
                }, {
                    BlueprintAndListContainer = v2.createElement("Frame", {
                        [v2.Tag] = "X-Row X-Fill CX-Invisible", 
                        LayoutOrder = v5:getNextOrder()
                    }, {
                        BlueprintContainer = v2.createElement("Frame", {
                            [v2.Tag] = "CX-Invisible", 
                            LayoutOrder = v5:getNextOrder()
                        }, {
                            DeviceBlueprint = v2.createElement(v14, {
                                LayoutOrder = v5:getNextOrder(), 
                                selectedGamepadId = v22.isUpdatingMappingForGamepadId, 
                                displayMappings = false, 
                                activeInputs = v32
                            })
                        }), 
                        ListScrollingContainer = v2.createElement("ScrollingFrame", {
                            [v2.Tag] = "CX-Invisible ", 
                            LayoutOrder = v5:getNextOrder(), 
                            ref = v38, 
                            [v2.Change.AbsoluteSize] = v40
                        }, {
                            Mappings = v2.createElement(v10, {
                                LayoutOrder = v5:getNextOrder(), 
                                onAbsoluteSizeChanged = v42, 
                                onHoveredMappingChanged = v30
                            })
                        })
                    })
                })
            })
        }), 
        MappingsConfirmationDialog = if v33 then v2.createElement(v15, {
            hideConfirmationDialog = v35
        }) else nil, 
        ErrorsBanner = v2.createElement(v17, {
            hideConfirmationDialog = v35
        })
    });
end);