local v0 = {};
v0.hasInternalPermission = function() --[[ Line: 3 ]] --[[ Name: hasInternalPermission ]]
    -- upvalues: v0 (copy)
    if game:GetService("RunService"):IsStudio() then
        return game:GetService("StudioService"):HasInternalPermission();
    elseif v0.isRunningUnderCLI() then
        return true;
    else
        return false;
    end;
end;
v0.isRunningUnderCLI = function() --[[ Line: 14 ]] --[[ Name: isRunningUnderCLI ]]
    local l_RunningUnderCLI_0 = script.Parent:FindFirstChild("RunningUnderCLI");
    return l_RunningUnderCLI_0 and l_RunningUnderCLI_0.Value or false;
end;
v0.getStudioService = function() --[[ Line: 19 ]] --[[ Name: getStudioService ]]
    -- upvalues: v0 (copy)
    return v0.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("StudioService");
end;
v0.getCoreGui = function() --[[ Line: 23 ]] --[[ Name: getCoreGui ]]
    -- upvalues: v0 (copy)
    return v0.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("CoreGui");
end;
v0.getRobloxPluginGuiService = function() --[[ Line: 27 ]] --[[ Name: getRobloxPluginGuiService ]]
    -- upvalues: v0 (copy)
    return v0.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("RobloxPluginGuiService");
end;
return v0;