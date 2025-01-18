local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local l_StudioDeviceEmulator_0 = require(l_script_FirstAncestor_0.Src.Util.MockableProxyPluginComponents).StudioDeviceEmulator;
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
return function(v3, v4, v5) --[[ Line: 6 ]]
    -- upvalues: l_getFFlagEnableVRControllers_0 (copy), l_StudioDeviceEmulator_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
        -- upvalues: l_getFFlagEnableVRControllers_0 (ref), l_StudioDeviceEmulator_0 (ref), v3 (copy), v4 (copy), v5 (copy)
        if l_getFFlagEnableVRControllers_0() then
            return l_StudioDeviceEmulator_0:GetKeyboardShortcutAsync(v3, v4, v5);
        else
            return l_StudioDeviceEmulator_0:DEPRECATED_GetKeyboardShortcutAsync(v3, v4, v5);
        end;
    end);
    if l_status_0 then
        return l_result_0;
    else
        return {};
    end;
end;