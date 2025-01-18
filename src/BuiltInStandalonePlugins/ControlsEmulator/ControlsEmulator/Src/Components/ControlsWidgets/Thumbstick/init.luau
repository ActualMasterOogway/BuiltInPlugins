local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.RootContainerInputContext);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local l_getFFlagEnableGrayHoverDeviceEmulator_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableGrayHoverDeviceEmulator;
local v7 = require(l_script_FirstAncestor_0.Packages.React);
local v8 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 = v2.THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK;
local v10 = UDim2.new(0, 0, 0, 0);
local function _(v11) --[[ Line: 28 ]]
    local v12 = math.sqrt(v11.X.Offset ^ 2 + v11.Y.Offset ^ 2);
    local v13 = if v12 > 0 then math.abs(v11.X.Offset / v12) else 0;
    if v12 > 0 then
        return v13, (math.abs(v11.Y.Offset / v12));
    else
        return v13, 0;
    end;
end;
return v7.memo(function(v15) --[[ Line: 45 ]] --[[ Name: Thumbstick ]]
    -- upvalues: v3 (copy), v2 (copy), v7 (copy), v8 (copy), v10 (copy), v1 (copy), l_StudioDeviceEmulator_0 (copy), l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 (copy), l_joinTags_0 (copy), l_getFFlagEnableGrayHoverDeviceEmulator_0 (copy)
    local v16 = v3.Dictionary.join({
        relativeSocketSize = v2.DEFAULT_THUMBSTICK_SOCKET_SIZE_RELATIVE, 
        relativeStickSize = v2.DEFAULT_THUMBSTICK_SIZE_RELATIVE
    }, v15);
    local v17, v18 = v7.useState(1);
    local v19, v20 = v7.useState(false);
    local v21, v22 = v7.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v17 (copy), v16 (copy)
        return v17 / 2, v17 * v16.relativeStickSize;
    end, {
        v17, 
        v16.relativeStickSize
    });
    local l_gamepadId_0 = v7.useContext(v8).gamepadId;
    local v24 = v7.useRef(nil);
    local v25 = v7.useRef(nil);
    local v26 = v7.useRef(0);
    local v27 = v7.useRef(0);
    local v28 = v7.useRef(false);
    local v29 = v7.useRef(v10);
    local v30 = v7.useRef(nil);
    local v31 = v7.useRef(nil);
    local v32 = v7.useContext(v1);
    local l_InputChanged_0 = v32.InputChanged;
    local l_InputEnded_0 = v32.InputEnded;
    local v35 = v7.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: v16 (copy), v21 (copy)
        if v16.inputState == nil then
            return UDim2.new(0, 0, 0, 0);
        else
            return (UDim2.new(0, math.clamp(v16.inputState.X * v21, -v21, v21), 0, (math.clamp(-v16.inputState.Y * v21, -v21, v21))));
        end;
    end, {
        v16.inputState, 
        v21
    });
    local v43 = v7.useCallback(function(v36) --[[ Line: 96 ]]
        -- upvalues: v35 (copy), v21 (copy)
        local v37 = v36 + v35;
        local v38 = math.sqrt(v37.X.Offset ^ 2 + v37.Y.Offset ^ 2);
        local v39 = if v38 > 0 then math.abs(v37.X.Offset / v38) else 0;
        local v40 = if v38 > 0 then math.abs(v37.Y.Offset / v38) else 0;
        local l_v39_0 = v39;
        local l_v40_0 = v40;
        v37 = math.clamp(v35.X.Offset + v36.X.Offset, -v21 * l_v39_0, v21 * l_v39_0) + v21;
        v38 = math.clamp(v35.Y.Offset + v36.Y.Offset, -v21 * l_v40_0, v21 * l_v40_0) + v21;
        return UDim2.new(0, v37, 0, v38);
    end, {
        v35, 
        v21
    });
    local v50 = v7.useCallback(function(v44) --[[ Line: 113 ]]
        -- upvalues: v35 (copy), v21 (copy)
        local v45 = math.sqrt(v44.X.Offset ^ 2 + v44.Y.Offset ^ 2);
        local v46 = if v45 > 0 then math.abs(v44.X.Offset / v45) else 0;
        local v47 = if v45 > 0 then math.abs(v44.Y.Offset / v45) else 0;
        local l_v46_0 = v46;
        local l_v47_0 = v47;
        v45 = math.clamp(v35.X.Offset + v44.X.Offset, -v21 * l_v46_0, v21 * l_v46_0);
        v46 = math.clamp(v35.Y.Offset + v44.Y.Offset, -v21 * l_v47_0, v21 * l_v47_0);
        return (Vector3.new(math.clamp(v45 / v21, -1, 1), math.clamp(-v46 / v21, -1, 1), 0));
    end);
    local v52 = v7.useCallback(function(v51) --[[ Line: 134 ]]
        -- upvalues: v18 (copy)
        v18(v51.AbsoluteSize.X);
    end, {
        v18
    });
    local v58 = v7.useCallback(function(_, v54) --[[ Line: 139 ]]
        -- upvalues: v24 (copy), l_InputChanged_0 (copy), l_InputEnded_0 (copy), v26 (copy), v27 (copy), v28 (copy), v30 (copy), v31 (copy), v29 (copy), v43 (copy), v50 (copy), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy), v16 (copy), v25 (copy), l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 (ref), v2 (ref), v10 (ref)
        if v24.current == nil and l_InputChanged_0 ~= nil and l_InputEnded_0 ~= nil and v54.UserInputType == Enum.UserInputType.MouseButton1 and v26.current ~= nil and v27.current ~= nil then
            v26.current = v54.Position.X;
            v27.current = v54.Position.Y;
            v28.current = true;
            if v30.current and v31.current then
                v30.current:AddTag("Active");
                v31.current:AddTag("Active");
                v24.current = l_InputChanged_0:Connect(function(v55) --[[ Line: 155 ]]
                    -- upvalues: v28 (ref), v29 (ref), v26 (ref), v27 (ref), v30 (ref), v31 (ref), v43 (ref), v50 (ref), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v16 (ref)
                    if v55.UserInputType == Enum.UserInputType.MouseMovement then
                        v28.current = false;
                        v29.current = UDim2.new(0, v55.Position.X - v26.current, 0, v55.Position.Y - v27.current);
                        if v30.current and v31.current then
                            v30.current.Position = v43(v29.current);
                        end;
                        local v56 = v50(v29.current);
                        pcall(function() --[[ Line: 172 ]]
                            -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v16 (ref), v56 (copy)
                            l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v16.keyCode, v56, Vector3.zero);
                        end);
                    end;
                end);
                v25.current = l_InputEnded_0:Connect(function(v57) --[[ Line: 183 ]]
                    -- upvalues: v24 (ref), v25 (ref), v30 (ref), v31 (ref), v28 (ref), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 (ref), v16 (ref), v2 (ref), v29 (ref), v10 (ref), v43 (ref)
                    if v57.UserInputType == Enum.UserInputType.MouseButton1 and v24.current ~= nil and v25.current ~= nil then
                        v24.current:Disconnect();
                        v24.current = nil;
                        v25.current:Disconnect();
                        v25.current = nil;
                        if v30.current and v31.current then
                            v30.current:RemoveTag("Active");
                            v31.current:RemoveTag("Active");
                            if v28.current then
                                v28.current = false;
                                pcall(function() --[[ Line: 202 ]]
                                    -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0 (ref), v16 (ref), v2 (ref)
                                    l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0[v16.keyCode], v2.VECTOR_PRESSED, Vector3.zero);
                                    l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, l_THUMBSTICK_KEYCODE_TO_THUMBSTICK_CLICK_0[v16.keyCode], v2.VECTOR_RELEASED, Vector3.zero);
                                end);
                                return;
                            else
                                pcall(function() --[[ Line: 219 ]]
                                    -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v16 (ref)
                                    l_StudioDeviceEmulator_0:SendGamepadEventAsync(l_gamepadId_0, v16.keyCode, Vector3.zero, Vector3.zero);
                                end);
                                v29.current = v10;
                                v30.current.Position = v43(v29.current);
                            end;
                        end;
                    end;
                end);
            end;
        end;
    end, {
        l_InputChanged_0, 
        l_InputEnded_0, 
        l_gamepadId_0, 
        v16.keyCode, 
        v50, 
        v43
    });
    return v7.createElement("Frame", {
        [v7.Tag] = l_joinTags_0("Widget-Thumbstick", "X-Circle", "data-testid=Widget-Thumbstick", (not not v16.inputState or v16.clickInputState) and "Active" or nil), 
        Position = v16.Position, 
        ref = function(v59) --[[ Line: 258 ]] --[[ Name: ref ]]
            -- upvalues: v31 (copy)
            if v59 then
                v31.current = v59;
            end;
        end, 
        Size = UDim2.new(v16.relativeSocketSize, 0, v16.relativeSocketSize, 0), 
        [v7.Change.AbsoluteSize] = v52
    }, {
        Stick = v7.createElement("Frame", {
            Size = UDim2.new(0, v22, 0, v22), 
            Position = v43(v29.current), 
            ref = function(v60) --[[ Line: 269 ]] --[[ Name: ref ]]
                -- upvalues: v30 (copy)
                if v60 then
                    v30.current = v60;
                end;
            end, 
            [v7.Tag] = l_joinTags_0("X-Circle", "data-testid=Widget-Thumbstick-Stick", (not not v16.inputState or v16.clickInputState) and "Active" or nil, v19 and l_getFFlagEnableGrayHoverDeviceEmulator_0() and "Hovered" or nil), 
            [v7.Event.InputBegan] = v58, 
            [v7.Event.MouseEnter] = function() --[[ Line: 281 ]]
                -- upvalues: v20 (copy)
                v20(true);
            end, 
            [v7.Event.MouseLeave] = function() --[[ Line: 284 ]]
                -- upvalues: v20 (copy)
                v20(false);
            end
        })
    });
end);