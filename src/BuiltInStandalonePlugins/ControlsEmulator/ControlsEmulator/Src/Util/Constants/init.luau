local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.KeyNamesConstants);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
local v4 = {
    Generic = Enum.GamepadType.Unknown, 
    PS4 = Enum.GamepadType.PS4, 
    PS5 = Enum.GamepadType.PS5, 
    XboxOne = Enum.GamepadType.XboxOne, 
    Quest2 = Enum.GamepadType.Unknown, 
    Quest3 = Enum.GamepadType.Unknown
};
local v5 = {
    Generic = 101, 
    PS4 = 102, 
    PS5 = 103, 
    XboxOne = 104, 
    Quest2 = 105, 
    Quest3 = 106
};
local v6 = {
    [Enum.KeyCode.Thumbstick1] = Enum.KeyCode.ButtonL3, 
    [Enum.KeyCode.Thumbstick2] = Enum.KeyCode.ButtonR3
};
local v7 = {
    [v5.Quest2] = true, 
    [v5.Quest3] = true
};
local v11 = v2.reduce(v2.keys(v5), function(v8, v9) --[[ Line: 42 ]]
    -- upvalues: v4 (copy), v5 (copy)
    local v10 = v4[v9];
    v8[v5[v9]] = v10;
    return v8;
end, {});
local v14 = v2.reduce(v2.keys(v5), function(v12, v13) --[[ Line: 49 ]]
    -- upvalues: v5 (copy)
    v12[v5[v13]] = v13;
    return v12;
end, {});
local v15 = v2.values(v5);
if not l_getFFlagEnableVRControllers_0() then
    v15 = v2.filter(v15, function(v16) --[[ Line: 59 ]]
        -- upvalues: v7 (copy)
        return v7[v16] ~= true;
    end);
end;
local v20 = v2.reduce(v2.keys(v1.KEY_NAMES_DEFINITIONS), function(v17, v18) --[[ Line: 68 ]]
    -- upvalues: v1 (copy)
    local v19 = v1.KEY_NAMES_DEFINITIONS[v18];
    if v17[v19.keyCode] == nil then
        v17[v19.keyCode] = {};
    end;
    v17[v19.keyCode][v19.direction] = v18;
    return v17;
end, {});
return {
    NO_CONNECTED_GAMEPAD_ID = nil, 
    DEFAULT_THUMBSTICK_SIZE_RELATIVE = 0.3, 
    DEFAULT_THUMBSTICK_SOCKET_SIZE_RELATIVE = 0.15, 
    KEY_TO_KEY_NAME = v20, 
    VECTOR_PRESSED = Vector3.new(0, 0, 1, 0), 
    VECTOR_RELEASED = Vector3.zero, 
    DEFAULT_ROOT_CONTAINER_INPUT_CONTEXT_STATE = {
        InputChanged = nil, 
        InputEnded = nil, 
        InputBegan = nil
    }, 
    DEFAULT_MAPPINGS_STATE = {
        mappings = {}, 
        mappingsOverrides = {}, 
        gamepadId = nil, 
        isUpdatingMappingForGamepadId = nil, 
        isUpdatingMappingForKey = nil, 
        isMappingsDialogOpen = false, 
        latestErrorMessage = nil, 
        isVRConnected = false, 
        emulatedDeviceId = nil, 
        availableDeviceIds = {
            v5.Generic
        }, 
        DEPRECATED_vrActiveUserCFrame = Enum.UserCFrame.Head, 
        activeVRUserCFrames = {
            [Enum.UserCFrame.Head] = true, 
            [Enum.UserCFrame.LeftHand] = true, 
            [Enum.UserCFrame.RightHand] = true
        }, 
        shouldVRControlsRespond = false
    }, 
    GAMEPAD_TYPE_TO_ID = v5, 
    HAND_TRACKED_DEVICES = v7, 
    GAMEPAD_ID_TO_ENUM = v11, 
    GAMEPAD_ID_TO_TYPE = v14, 
    LISTED_DEVICE_IDS = v15, 
    MAPPING_LABELS_OFFSET_FROM_CENTER = 0.075, 
    MAPPING_LABELS_TEXT_GAP_X = 0.04, 
    MAPPING_LABELS_TEXT_GAP_Y = 0.01, 
    MAPPING_LABELS_TEXT_SCALE = 1.8, 
    THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK = v6, 
    NUMBER_OF_HORIZONTAL_BARS_TRIGGER = 10, 
    MAPPINGS_KEYS_BLACKLIST = {
        Enum.KeyCode.Backspace, 
        Enum.KeyCode.Delete
    }, 
    DEFAULT_EMULATED_DEVICE_ID = "default", 
    PS4_EMULATED_DEVICE_ID = "ps4", 
    QUEST2_EMULATED_DEVICE_ID = "meta_quest_2", 
    QUEST3_EMULATED_DEVICE_ID = "meta_quest_3", 
    META_QUEST_3_NAME = "Meta Quest 3"
};