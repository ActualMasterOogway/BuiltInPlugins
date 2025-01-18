local v1 = {
    isRunningUnderCLI = function() --[[ Line: 3 ]] --[[ Name: isRunningUnderCLI ]]
        local l_RunningUnderCLI_0 = script.Parent:FindFirstChild("RunningUnderCLI");
        return l_RunningUnderCLI_0 and l_RunningUnderCLI_0.Value or false;
    end
};
v1.getStudioService = function() --[[ Line: 8 ]] --[[ Name: getStudioService ]]
    -- upvalues: v1 (copy)
    return v1.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("StudioService");
end;
v1.getCoreGui = function() --[[ Line: 12 ]] --[[ Name: getCoreGui ]]
    -- upvalues: v1 (copy)
    return v1.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("CoreGui");
end;
v1.getRobloxPluginGuiService = function() --[[ Line: 16 ]] --[[ Name: getRobloxPluginGuiService ]]
    -- upvalues: v1 (copy)
    return v1.isRunningUnderCLI() and Instance.new("Frame") or game:GetService("RobloxPluginGuiService");
end;
return v1;