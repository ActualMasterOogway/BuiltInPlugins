local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_getFFlagEnableVRControllers_0 = require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags).getFFlagEnableVRControllers;
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: l_getFFlagEnableVRControllers_0 (copy), v1 (copy)
    if v3 == Enum.Platform.XBoxOne then
        return "XboxOne";
    elseif v3 == Enum.Platform.XBox360 then
        return "XboxOne";
    elseif v3 == Enum.Platform.PS3 then
        return "PS4";
    elseif v3 == Enum.Platform.PS4 then
        return "PS4";
    elseif v3 == Enum.Platform.PS5 then
        return "PS5";
    elseif v3 == Enum.Platform.MetaOS then
        if l_getFFlagEnableVRControllers_0() then
            if v4 and (string.find(v4, v1.QUEST3_EMULATED_DEVICE_ID) or string.find(v4, v1.META_QUEST_3_NAME)) then
                return "Quest3";
            else
                return "Quest2";
            end;
        elseif v4 == "Quest 3" then
            return "Quest3";
        else
            return "Quest2";
        end;
    else
        return nil;
    end;
end;