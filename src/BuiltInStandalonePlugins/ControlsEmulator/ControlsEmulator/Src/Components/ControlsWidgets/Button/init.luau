local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local l_joinTags_0 = v1.Styling.joinTags;
local l_VECTOR_PRESSED_0 = v4.VECTOR_PRESSED;
local l_VECTOR_RELEASED_0 = v4.VECTOR_RELEASED;
return v2.memo(function(v9) --[[ Line: 26 ]] --[[ Name: Button ]]
    -- upvalues: v2 (copy), v5 (copy), l_StudioDeviceEmulator_0 (copy), l_VECTOR_PRESSED_0 (copy), l_VECTOR_RELEASED_0 (copy), l_joinTags_0 (copy)
    local v10 = v2.useContext(v5);
    local v11, v12 = v2.useState(false);
    local v13, v14 = v2.useState(false);
    local l_gamepadId_0 = v10.gamepadId;
    local function _() --[[ Line: 33 ]] --[[ Name: emulateButtonPress ]]
        -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v9 (copy), l_VECTOR_PRESSED_0 (ref)
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v9 (ref), l_VECTOR_PRESSED_0 (ref)
            l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v9.keyCode, l_VECTOR_PRESSED_0, Vector3.zero);
        end);
    end;
    local function _() --[[ Line: 39 ]] --[[ Name: emulateButtonRelease ]]
        -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v9 (copy), l_VECTOR_RELEASED_0 (ref)
        pcall(function() --[[ Line: 40 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v9 (ref), l_VECTOR_RELEASED_0 (ref)
            l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v9.keyCode, l_VECTOR_RELEASED_0, Vector3.zero);
        end);
    end;
    local v18 = v2.useCallback(function() --[[ Line: 45 ]]
        -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v9 (copy), l_VECTOR_PRESSED_0 (ref), v12 (copy)
        pcall(function() --[[ Line: 34 ]]
            -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v9 (ref), l_VECTOR_PRESSED_0 (ref)
            l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v9.keyCode, l_VECTOR_PRESSED_0, Vector3.zero);
        end);
        v12(true);
    end, {
        l_gamepadId_0, 
        v9.keyCode, 
        v12
    });
    local v19 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v9 (copy), l_VECTOR_RELEASED_0 (ref), v12 (copy)
        if v11 then
            pcall(function() --[[ Line: 40 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v9 (ref), l_VECTOR_RELEASED_0 (ref)
                l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v9.keyCode, l_VECTOR_RELEASED_0, Vector3.zero);
            end);
            v12(false);
        end;
    end, {
        l_gamepadId_0, 
        v9.keyCode, 
        v11, 
        v12
    });
    local v20 = v2.useCallback(function() --[[ Line: 55 ]]
        -- upvalues: v14 (copy)
        v14(true);
    end, {
        v14
    });
    local v21 = v2.useCallback(function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v11 (copy), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v9 (copy), l_VECTOR_RELEASED_0 (ref), v12 (copy)
        v14(false);
        if v11 then
            pcall(function() --[[ Line: 40 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v9 (ref), l_VECTOR_RELEASED_0 (ref)
                l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v9.keyCode, l_VECTOR_RELEASED_0, Vector3.zero);
            end);
            v12(false);
        end;
    end, {
        l_gamepadId_0, 
        v9.keyCode, 
        v11, 
        v14
    });
    local v22 = true;
    if v9.inputState == nil then
        v22 = v11;
    end;
    return v2.createElement("TextButton", {
        [v2.Tag] = l_joinTags_0("Widget-Button", v22 and "Active" or nil, v13 and "Hovered" or nil, "data-testid=Widget-Button" .. v9.keyCode.Name), 
        Text = "", 
        Position = v9.Position, 
        Size = v9.Size, 
        [v2.Event.MouseButton1Down] = v18, 
        [v2.Event.MouseButton1Up] = v19, 
        [v2.Event.MouseEnter] = v20, 
        [v2.Event.MouseLeave] = v21
    });
end);