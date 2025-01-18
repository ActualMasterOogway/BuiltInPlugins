local v0 = {};
v0.__index = v0;
v0.new = function(_) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v2 = {
        SendGamepadEventAsync = function() --[[ Line: 6 ]] --[[ Name: SendGamepadEventAsync ]]

        end, 
        DEPRECATED_GetKeyboardShortcutAsync = function() --[[ Line: 9 ]] --[[ Name: DEPRECATED_GetKeyboardShortcutAsync ]]

        end, 
        GetKeyboardShortcutAsync = function() --[[ Line: 12 ]] --[[ Name: GetKeyboardShortcutAsync ]]

        end, 
        ConnectGamepadAsync = function() --[[ Line: 15 ]] --[[ Name: ConnectGamepadAsync ]]

        end, 
        UpdateKeyMappingAsync = function() --[[ Line: 18 ]] --[[ Name: UpdateKeyMappingAsync ]]
            return true;
        end, 
        GetCurrentlyEmulatedDeviceAsync = function() --[[ Line: 21 ]] --[[ Name: GetCurrentlyEmulatedDeviceAsync ]]

        end, 
        IsVREmulatorConnected = function() --[[ Line: 24 ]] --[[ Name: IsVREmulatorConnected ]]
            return false;
        end, 
        SetActiveVRController = function() --[[ Line: 27 ]] --[[ Name: SetActiveVRController ]]

        end, 
        DEPRECATED_SetVRActiveUserCFrameAsync = function() --[[ Line: 30 ]] --[[ Name: DEPRECATED_SetVRActiveUserCFrameAsync ]]

        end, 
        SetVRUserCFrameActiveAsync = function() --[[ Line: 33 ]] --[[ Name: SetVRUserCFrameActiveAsync ]]

        end
    };
    setmetatable(v2, {
        __index = v0
    });
    return v2;
end;
return v0;