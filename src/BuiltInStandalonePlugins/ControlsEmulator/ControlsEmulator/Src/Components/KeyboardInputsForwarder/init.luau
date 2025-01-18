local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.RootContainerInputContext);
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local v4 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
KeyboardInputsForwarder = function(v5) --[[ Line: 12 ]] --[[ Name: KeyboardInputsForwarder ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), l_StudioDeviceEmulator_0 (copy)
    local v6 = v1.useContext(v2);
    local v7 = v1.useContext(v4);
    local l_gamepadId_0 = v7.gamepadId;
    local l_isUpdatingMappingForKey_0 = v7.isUpdatingMappingForKey;
    local v11 = v1.useCallback(function(v10) --[[ Line: 18 ]]
        -- upvalues: l_isUpdatingMappingForKey_0 (copy), l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (copy)
        if v10.UserInputType == Enum.UserInputType.Keyboard and l_isUpdatingMappingForKey_0 == nil then
            pcall(function() --[[ Line: 20 ]]
                -- upvalues: l_StudioDeviceEmulator_0 (ref), l_gamepadId_0 (ref), v10 (copy)
                l_StudioDeviceEmulator_0:SendKeyboardEventAsync(l_gamepadId_0, v10.KeyCode, v10.UserInputState == Enum.UserInputState.Begin);
            end);
        end;
    end, {
        l_gamepadId_0, 
        l_isUpdatingMappingForKey_0
    });
    v1.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v6 (copy), v11 (copy)
        local v12 = nil;
        local v13 = nil;
        local v14 = nil;
        if v6.InputBegan and v6.InputChanged and v6.InputEnded then
            v12 = v6.InputBegan:Connect(v11);
            v13 = v6.InputChanged:Connect(v11);
            v14 = v6.InputEnded:Connect(v11);
        end;
        return function() --[[ Line: 43 ]]
            -- upvalues: v12 (ref), v13 (ref), v14 (ref)
            if v12 ~= nil then
                v12:Disconnect();
            end;
            if v13 ~= nil then
                v13:Disconnect();
            end;
            if v14 ~= nil then
                v14:Disconnect();
            end;
        end;
    end, {
        v6, 
        v11
    });
    return v5.children;
end;
return v1.memo(KeyboardInputsForwarder);