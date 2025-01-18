local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local v8 = require(l_script_FirstAncestor_0.Src.Util.loadMappingForKey);
local v9 = require(l_script_FirstAncestor_0.Src.Util.devicePlatformEnumToControllerType);
local v10 = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
local v12 = require(l_script_FirstAncestor_0.Src.Util.MockableEngineFeatures);
local l_Generic_0 = v5.GAMEPAD_TYPE_TO_ID.Generic;
local l_MAPPINGS_KEYS_BLACKLIST_0 = v5.MAPPINGS_KEYS_BLACKLIST;
local l_NO_CONNECTED_GAMEPAD_ID_0 = v5.NO_CONNECTED_GAMEPAD_ID;
local l_KEY_NAMES_DEFINITIONS_0 = v10.KEY_NAMES_DEFINITIONS;
local l_GAMEPAD_ID_TO_ENUM_0 = v5.GAMEPAD_ID_TO_ENUM;
local l_LISTED_DEVICE_IDS_0 = v5.LISTED_DEVICE_IDS;
local l_HAND_TRACKED_DEVICES_0 = v5.HAND_TRACKED_DEVICES;
local function _(v20, v21) --[[ Line: 37 ]]
    -- upvalues: v2 (copy)
    if v21.type == "UpdateMappingsForGamepadId" then
        return (v2.Dictionary.join(v20, {
            [v21.payload.gamepadId] = v21.payload.newMappingsForGamepadId
        }));
    else
        return v20;
    end;
end;
local function v25(v23, v24) --[[ Line: 47 ]]
    -- upvalues: v2 (copy)
    if v24.type == "UpdateMappingsForGamepadId" then
        return (v2.Dictionary.join(v23, {
            [v24.payload.gamepadId] = v2.Dictionary.join(v24.payload.newMappingsOverridesForGamepadId or {}, v23[v24.payload.gamepadId] or {})
        }));
    elseif v24.type == "KeepOverrides" then
        return {};
    elseif v24.type == "ResetCaches" then
        return v2.Dictionary.join(v23, {
            [v24.payload.gamepadId] = v2.None
        });
    else
        return v23;
    end;
end;
local function v28(v26, v27) --[[ Line: 69 ]]
    -- upvalues: v12 (copy), v2 (copy)
    assert(v12.VREmulatorFullRelease);
    if v27.type == "SetVRUserCFrameActive" then
        return (v2.Dictionary.join(v26, {
            [v27.payload.vrUserCFrame] = v27.payload.isActive
        }));
    else
        return v26;
    end;
end;
local function v37(v29, v30) --[[ Line: 80 ]]
    -- upvalues: v2 (copy), v25 (copy), v12 (copy), v28 (copy), v3 (copy)
    local l_join_0 = v2.Dictionary.join;
    local l_v29_0 = v29;
    local v33 = {};
    local l_mappings_0 = v29.mappings;
    v33.mappings = if v30.type == "UpdateMappingsForGamepadId" then v2.Dictionary.join(l_mappings_0, {
        [v30.payload.gamepadId] = v30.payload.newMappingsForGamepadId
    }) else l_mappings_0;
    v29 = l_join_0(l_v29_0, v33);
    v29 = v2.Dictionary.join(v29, {
        mappingsOverrides = v25(v29.mappingsOverrides, v30)
    });
    if v12.VREmulatorFullRelease and v30.type == "SetVRUserCFrameActive" then
        v29 = v2.Dictionary.join(v29, {
            activeVRUserCFrames = v28(v29.activeVRUserCFrames, v30), 
            shouldVRControlsRespond = v30.payload.shouldVRControlsRespond
        });
    end;
    if v30.type == "SetConnectedGamepadId" then
        return v2.Dictionary.join(v29, {
            gamepadId = v30.payload.gamepadId
        });
    elseif v30.type == "UpdateMappingsForGamepadId" then
        return v2.Dictionary.join(v29, {
            isUpdatingMappingForKey = v2.None, 
            isUpdatingMappingForGamepadId = v30.payload.gamepadId, 
            latestErrorMessage = v30.payload.latestErrorMessage
        });
    elseif v30.type == "SetGamepadId" then
        return v2.Dictionary.join(v29, {
            gamepadId = v30.payload.gamepadId, 
            isUpdatingMappingForGamepadId = v30.payload.gamepadId
        });
    elseif v30.type == "SetIsUpdatingMappingFor" then
        return v2.Dictionary.join(v29, {
            isUpdatingMappingForGamepadId = v30.payload.gamepadId or v29.isUpdatingMappingForGamepadId, 
            isUpdatingMappingForKey = v30.payload.keyName or v29.isUpdatingMappingForKey
        });
    elseif v30.type == "OpenMappingsDialog" then
        return v2.Dictionary.join(v29, {
            isMappingsDialogOpen = true
        });
    elseif v30.type == "CloseMappingsDialog" then
        return v2.Dictionary.join(v29, {
            isMappingsDialogOpen = false, 
            mappings = v3.map(v29.mappings, function(v35, v36) --[[ Line: 124 ]]
                -- upvalues: v2 (ref), v29 (ref)
                return v2.Dictionary.join(v35, v29.mappingsOverrides[v36] or {});
            end), 
            mappingsOverrides = {}, 
            latestErrorMessage = v2.None
        });
    elseif v30.type == "ResetCaches" then
        return v2.Dictionary.join(v29, {
            isUpdatingMappingForKey = v2.None, 
            latestErrorMessage = v2.None
        });
    elseif v30.type == "ShowErrorBanner" then
        return v2.Dictionary.join(v29, {
            latestErrorMessage = v30.payload.errorMessage
        });
    elseif v30.type == "SetVRConnected" then
        return v2.Dictionary.join(v29, {
            isVRConnected = v30.payload.isConnected
        });
    elseif v30.type == "ChangeEmulatedDevice" then
        return v2.Dictionary.join(v29, {
            emulatedDeviceId = v30.payload.emulatedDeviceId, 
            availableDeviceIds = v30.payload.availableDeviceIds
        });
    elseif v30.type == "DEPRECATED_SetVRActiveUserCFrame" then
        assert(not v12.VREmulatorFullRelease);
        return v2.Dictionary.join(v29, {
            DEPRECATED_vrActiveUserCFrame = v30.payload.DEPRECATED_vrActiveUserCFrame
        });
    else
        return v29;
    end;
end;
local v38 = nil;
local function v107(v39, v40, v41) --[[ Line: 166 ]]
    -- upvalues: v2 (copy), l_KEY_NAMES_DEFINITIONS_0 (copy), v8 (copy), l_NO_CONNECTED_GAMEPAD_ID_0 (copy), l_Generic_0 (copy), l_StudioDeviceEmulator_0 (copy), l_GAMEPAD_ID_TO_ENUM_0 (copy), v38 (ref), v3 (copy), l_MAPPINGS_KEYS_BLACKLIST_0 (copy), v12 (copy), l_getFFlagEnableVRControllers_0 (copy), v9 (copy), v5 (copy), l_LISTED_DEVICE_IDS_0 (copy), l_HAND_TRACKED_DEVICES_0 (copy)
    local function v43(...) --[[ Line: 167 ]]
        -- upvalues: v41 (copy)
        local v42 = if v41 ~= nil then v41() else {
            getText = nil
        };
        if v42.getText == nil then
            return "";
        else
            return v42:getText(...);
        end;
    end;
    local function v50(v44, v45) --[[ Line: 175 ]]
        -- upvalues: v40 (copy), v2 (ref), v39 (copy), l_KEY_NAMES_DEFINITIONS_0 (ref), v8 (ref)
        if v40.mappings[v44] and not v2.isEmpty(v40.mappings[v44]) and not v45 then
            v39({
                type = "SetIsUpdatingMappingFor", 
                payload = {
                    gamepadId = v44
                }
            });
            return;
        else
            local v46 = {};
            for v47, v48 in l_KEY_NAMES_DEFINITIONS_0 do
                local v49 = v8(v44, v48.keyCode, v48.direction);
                if v49 then
                    v46[v47] = v49 or {};
                end;
            end;
            v39({
                type = "UpdateMappingsForGamepadId", 
                payload = {
                    newMappingsForGamepadId = v46, 
                    gamepadId = v44
                }
            });
            return;
        end;
    end;
    local function v52(v51) --[[ Line: 197 ]]
        -- upvalues: v39 (copy), v50 (copy)
        v39({
            type = "ResetCaches", 
            payload = {
                gamepadId = v51
            }
        });
        v50(v51, true);
    end;
    local function v54(v53) --[[ Line: 205 ]]
        -- upvalues: v40 (copy), l_NO_CONNECTED_GAMEPAD_ID_0 (ref), l_Generic_0 (ref), l_StudioDeviceEmulator_0 (ref), l_GAMEPAD_ID_TO_ENUM_0 (ref), v50 (copy), v39 (copy)
        if v40.gamepadId == v53 then
            return;
        else
            if v53 == l_NO_CONNECTED_GAMEPAD_ID_0 then
                v53 = l_Generic_0;
            end;
            pcall(function() --[[ Line: 214 ]]
                -- upvalues: v40 (ref), l_NO_CONNECTED_GAMEPAD_ID_0 (ref), l_StudioDeviceEmulator_0 (ref), v53 (ref), l_GAMEPAD_ID_TO_ENUM_0 (ref)
                if v40.gamepadId ~= l_NO_CONNECTED_GAMEPAD_ID_0 then
                    l_StudioDeviceEmulator_0:DisconnectGamepadAsync(v40.gamepadId);
                end;
                l_StudioDeviceEmulator_0:ConnectGamepadAsync(v53, l_GAMEPAD_ID_TO_ENUM_0[v53]);
                l_StudioDeviceEmulator_0:SetActiveGamepadAsync(v53);
            end);
            v50(v53);
            v39({
                type = "SetGamepadId", 
                payload = {
                    gamepadId = v53
                }
            });
            return;
        end;
    end;
    local function v57(v55, v56) --[[ Line: 230 ]]
        -- upvalues: v38 (ref), v39 (copy), v2 (ref)
        v38 = task.delay(4, function() --[[ Line: 231 ]]
            -- upvalues: v39 (ref), v2 (ref)
            v39({
                type = "SetIsUpdatingMappingFor", 
                payload = {
                    keyName = v2.None
                }
            });
        end);
        v39({
            type = "SetIsUpdatingMappingFor", 
            payload = {
                gamepadId = v55, 
                keyName = v56
            }
        });
    end;
    local function v74(v58) --[[ Line: 244 ]]
        -- upvalues: v40 (copy), l_KEY_NAMES_DEFINITIONS_0 (ref), v3 (ref), l_MAPPINGS_KEYS_BLACKLIST_0 (ref), v38 (ref), v8 (ref), l_StudioDeviceEmulator_0 (ref), v39 (copy), v2 (ref), v43 (copy), v52 (copy)
        local l_isUpdatingMappingForGamepadId_0 = v40.isUpdatingMappingForGamepadId;
        local l_keyCode_0 = l_KEY_NAMES_DEFINITIONS_0[v40.isUpdatingMappingForKey].keyCode;
        local l_direction_0 = l_KEY_NAMES_DEFINITIONS_0[v40.isUpdatingMappingForKey].direction;
        if #v58 then
            for _, v63 in v58 do
                if v3.includes(l_MAPPINGS_KEYS_BLACKLIST_0, v63) == true then
                    return;
                end;
            end;
        end;
        if l_isUpdatingMappingForGamepadId_0 == nil or l_keyCode_0 == nil then
            return;
        else
            task.cancel(v38);
            local v64 = v40.mappings[l_isUpdatingMappingForGamepadId_0];
            local v65 = nil;
            if v64 ~= nil then
                for v66, v67 in v64 do
                    if v66 ~= v40.isUpdatingMappingForKey then
                        local v68 = #v67 == #v58;
                        if v68 then
                            for _, v70 in v58 do
                                if v3.includes(v67, v70) == false then
                                    v68 = false;
                                    break;
                                end;
                            end;
                        end;
                        if v68 then
                            v65 = v66;
                            break;
                        end;
                    end;
                end;
            end;
            local v71 = v8(l_isUpdatingMappingForGamepadId_0, l_keyCode_0, l_direction_0);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 293 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), l_isUpdatingMappingForGamepadId_0 (copy), v58 (copy), l_keyCode_0 (copy), l_direction_0 (copy)
                return l_StudioDeviceEmulator_0:UpdateKeyMappingAsync(l_isUpdatingMappingForGamepadId_0, v58, l_keyCode_0, l_direction_0);
            end);
            if l_status_0 then
                v39({
                    type = "UpdateMappingsForGamepadId", 
                    payload = {
                        newMappingsForGamepadId = v2.Dictionary.join(v40.mappings[l_isUpdatingMappingForGamepadId_0] or {}, v2.Dictionary.join({
                            [v40.isUpdatingMappingForKey] = v58
                        }, if v65 then {
                            [v65] = {}
                        } else {})), 
                        newMappingsOverridesForGamepadId = v2.Dictionary.join(v40.mappingsOverrides[l_isUpdatingMappingForGamepadId_0] or {}, v2.Dictionary.join({
                            [v40.isUpdatingMappingForKey] = v71
                        }, if v65 then {
                            [v65] = v58
                        } else {})), 
                        gamepadId = l_isUpdatingMappingForGamepadId_0, 
                        latestErrorMessage = if v65 then v43("MappingsMessages", "MappingDeletedWarning", {
                            prevDestKey = v65
                        }) else nil
                    }
                });
                return;
            else
                v39({
                    type = "ShowErrorBanner", 
                    payload = {
                        errorMessage = v43("MappingsMessages", "MappingsUpdateFailedError", {
                            errorMsg = l_result_0
                        })
                    }
                });
                v52(v40.isUpdatingMappingForGamepadId);
                return;
            end;
        end;
    end;
    local function v78() --[[ Line: 340 ]]
        -- upvalues: v40 (copy), l_StudioDeviceEmulator_0 (ref), v12 (ref), v52 (copy), v50 (copy), v39 (copy), v43 (copy)
        local l_isUpdatingMappingForGamepadId_1 = v40.isUpdatingMappingForGamepadId;
        if l_isUpdatingMappingForGamepadId_1 == nil then
            return;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 346 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), l_isUpdatingMappingForGamepadId_1 (copy)
                return l_StudioDeviceEmulator_0:ResetToDefaultKeyMappingAsync(l_isUpdatingMappingForGamepadId_1);
            end);
            if l_status_1 then
                if v12.VREmulatorFullRelease then
                    v52(v40.isUpdatingMappingForGamepadId);
                    return;
                else
                    v50(l_isUpdatingMappingForGamepadId_1, true);
                    return;
                end;
            else
                v39({
                    type = "ShowErrorBanner", 
                    payload = {
                        errorMessage = v43("MappingsMessages", "MappingsResetToDefaultFailedError", {
                            errorMsg = l_result_1
                        })
                    }
                });
                v52(v40.isUpdatingMappingForGamepadId);
                return;
            end;
        end;
    end;
    local function v88(v79) --[[ Line: 372 ]]
        -- upvalues: v39 (copy), v40 (copy), l_KEY_NAMES_DEFINITIONS_0 (ref), l_StudioDeviceEmulator_0 (ref), v43 (copy), v52 (copy)
        if v79 then
            v39({
                type = "OpenMappingsDialog"
            });
            return;
        else
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 378 ]]
                -- upvalues: v40 (ref), l_KEY_NAMES_DEFINITIONS_0 (ref), l_StudioDeviceEmulator_0 (ref)
                for v80, v81 in v40.mappingsOverrides do
                    for v82, v83 in v81 do
                        local l_keyCode_1 = l_KEY_NAMES_DEFINITIONS_0[v82].keyCode;
                        local l_direction_1 = l_KEY_NAMES_DEFINITIONS_0[v82].direction;
                        l_StudioDeviceEmulator_0:UpdateKeyMappingAsync(v80, v83, l_keyCode_1, l_direction_1);
                    end;
                end;
            end);
            if not l_status_2 then
                v39({
                    type = "ShowErrorBanner", 
                    payload = {
                        errorMessage = v43("MappingsMessages", "MappingsUpdateFailedError", {
                            errorMsg = l_result_2
                        })
                    }
                });
                print(error);
                v52(v40.isUpdatingMappingForGamepadId);
            end;
            v39({
                type = "CloseMappingsDialog"
            });
            return;
        end;
    end;
    local function v89() --[[ Line: 410 ]]
        -- upvalues: v39 (copy)
        v39({
            type = "KeepOverrides"
        });
        v39({
            type = "CloseMappingsDialog"
        });
    end;
    local function v92(v90, v91) --[[ Line: 427 ]]
        -- upvalues: l_getFFlagEnableVRControllers_0 (ref), v40 (copy), l_StudioDeviceEmulator_0 (ref), v39 (copy)
        if l_getFFlagEnableVRControllers_0() then
            pcall(function() --[[ Line: 429 ]]
                -- upvalues: v40 (ref), v90 (copy), l_StudioDeviceEmulator_0 (ref), v91 (copy)
                if v40.isVRConnected ~= v90 then
                    if v90 then
                        l_StudioDeviceEmulator_0:ConnectVRDeviceAsync(v91, Enum.VRDeviceType.OculusQuest);
                        return;
                    else
                        l_StudioDeviceEmulator_0:DisconnectVRDeviceAsync(v40.gamepadId);
                    end;
                end;
            end);
        end;
        v39({
            type = "SetVRConnected", 
            payload = {
                isConnected = v90
            }
        });
    end;
    local function v94(v93) --[[ Line: 446 ]]
        -- upvalues: v12 (ref), l_getFFlagEnableVRControllers_0 (ref), l_StudioDeviceEmulator_0 (ref), v39 (copy)
        assert(not v12.VREmulatorFullRelease);
        if l_getFFlagEnableVRControllers_0() then
            pcall(function() --[[ Line: 449 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), v93 (copy)
                l_StudioDeviceEmulator_0:DEPRECATED_SetVRActiveUserCFrameAsync(v93);
            end);
        end;
        v39({
            type = "DEPRECATED_SetVRActiveUserCFrame", 
            payload = {
                DEPRECATED_vrActiveUserCFrame = v93
            }
        });
    end;
    local function v98(v95, v96, v97) --[[ Line: 460 ]]
        -- upvalues: v12 (ref), l_getFFlagEnableVRControllers_0 (ref), l_StudioDeviceEmulator_0 (ref), v39 (copy)
        assert(v12.VREmulatorFullRelease);
        if l_getFFlagEnableVRControllers_0() then
            pcall(function() --[[ Line: 463 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), v95 (copy), v96 (copy)
                l_StudioDeviceEmulator_0:SetVRUserCFrameActiveAsync(v95, v96);
            end);
        end;
        v39({
            type = "SetVRUserCFrameActive", 
            payload = {
                vrUserCFrame = v95, 
                isActive = v96, 
                shouldVRControlsRespond = v97
            }
        });
    end;
    local function v106(v99) --[[ Line: 478 ]]
        -- upvalues: v40 (copy), l_NO_CONNECTED_GAMEPAD_ID_0 (ref), v9 (ref), l_getFFlagEnableVRControllers_0 (ref), v5 (ref), l_LISTED_DEVICE_IDS_0 (ref), l_HAND_TRACKED_DEVICES_0 (ref), v92 (copy), v3 (ref), v39 (copy), v54 (copy)
        if v40.emulatedDeviceId == v99.deviceId then
            return;
        else
            local l_deviceId_0 = v99.deviceId;
            local l_l_NO_CONNECTED_GAMEPAD_ID_0_0 = l_NO_CONNECTED_GAMEPAD_ID_0;
            local v102 = v9(v99.platform, if l_getFFlagEnableVRControllers_0() then l_deviceId_0 else nil);
            if v102 ~= nil then
                l_l_NO_CONNECTED_GAMEPAD_ID_0_0 = v5.GAMEPAD_TYPE_TO_ID[v102];
            end;
            if v40.gamepadId == l_l_NO_CONNECTED_GAMEPAD_ID_0_0 then
                return;
            else
                local l_l_LISTED_DEVICE_IDS_0_0 = l_LISTED_DEVICE_IDS_0;
                if l_getFFlagEnableVRControllers_0() then
                    local v104 = l_HAND_TRACKED_DEVICES_0[l_l_NO_CONNECTED_GAMEPAD_ID_0_0] == true;
                    v92(v104, l_l_NO_CONNECTED_GAMEPAD_ID_0_0);
                    l_l_LISTED_DEVICE_IDS_0_0 = v3.filter(l_LISTED_DEVICE_IDS_0, function(v105) --[[ Line: 501 ]]
                        -- upvalues: v104 (copy), l_HAND_TRACKED_DEVICES_0 (ref)
                        return v104 or l_HAND_TRACKED_DEVICES_0[v105] ~= true;
                    end);
                end;
                v39({
                    type = "ChangeEmulatedDevice", 
                    payload = {
                        emulatedDeviceId = l_deviceId_0, 
                        availableDeviceIds = l_l_LISTED_DEVICE_IDS_0_0
                    }
                });
                v54(l_l_NO_CONNECTED_GAMEPAD_ID_0_0);
                return;
            end;
        end;
    end;
    return {
        connectGamepadId = v54, 
        setMapping = v74, 
        loadMappingsForGamepad = v50, 
        setIsUpdatingMappingFor = v57, 
        restoreDefaults = v78, 
        saveMappings = v89, 
        setIsMappingsDialogOpen = v88, 
        setVRConnected = v92, 
        changeEmulatedDevice = v106, 
        DEPRECATED_setVRActiveUserCFrame = if not v12.VREmulatorFullRelease then v94 else nil, 
        setVRUserCFrameActive = if v12.VREmulatorFullRelease then v98 else nil
    };
end;
MappingsContextProvider = function(v108) --[[ Line: 535 ]] --[[ Name: MappingsContextProvider ]]
    -- upvalues: v1 (copy), v37 (copy), v5 (copy), v107 (copy), l_NO_CONNECTED_GAMEPAD_ID_0 (copy), l_Generic_0 (copy), v6 (copy), v7 (copy)
    local v109, v110 = v1.useReducer(v37, v5.DEFAULT_MAPPINGS_STATE);
    local v111 = v1.useMemo(function() --[[ Line: 537 ]]
        -- upvalues: v107 (ref), v110 (copy), v109 (copy), v108 (copy)
        return (v107(v110, v109, v108.getLocalization));
    end, {
        v110, 
        v109, 
        v108.getLocalization
    });
    v1.useEffect(function() --[[ Line: 542 ]]
        -- upvalues: v109 (copy), l_NO_CONNECTED_GAMEPAD_ID_0 (ref), v111 (copy), l_Generic_0 (ref)
        if v109.gamepadId == l_NO_CONNECTED_GAMEPAD_ID_0 then
            v111.connectGamepadId(l_Generic_0);
        end;
    end, {
        v109.gamepadId, 
        v111.connectGamepadId, 
        v111.loadMappingsForGamepad
    });
    return v1.createElement(v6.Provider, {
        value = v109
    }, {
        MappingsActionsContextProvider = v1.createElement(v7.Provider, {
            value = v111
        }, v108.children)
    });
end;
return v1.memo(MappingsContextProvider);