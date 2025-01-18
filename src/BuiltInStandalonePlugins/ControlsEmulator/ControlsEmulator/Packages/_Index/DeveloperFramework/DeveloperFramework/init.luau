local v0 = {
    ContextServices = require(script.ContextServices), 
    Dash = require(script.Parent.Dash), 
    DeveloperTools = if script.Parent:FindFirstChild("DeveloperTools") then require(script.Parent.DeveloperTools) else nil, 
    Http = require(script.Http), 
    Resources = require(script.Resources), 
    RobloxAPI = require(script.RobloxAPI), 
    SharedFlags = require(script.SharedFlags), 
    Style = require(script.Style), 
    Styling = require(script.Styling), 
    TestHelpers = require(script.TestHelpers), 
    UI = require(script.UI), 
    Url = require(script.RobloxAPI.Url), 
    Util = require(script.Util), 
    UIData = require(script.UI.Components.UIFolderData), 
    Wrappers = require(script.Wrappers)
};
if game:GetFastFlag("DebugDeveloperFrameworkSdk") and not script.Parent:FindFirstChild("DeveloperFramework_Replaced") and game:GetService("StudioService"):HasInternalPermission() then
    local l_StudioSdkService_0 = game:GetService("StudioSdkService");
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 31 ]]
        -- upvalues: l_StudioSdkService_0 (copy)
        return (l_StudioSdkService_0:GetSdk());
    end);
    if l_status_0 and l_result_0 then
        local l_DeveloperFramework_0 = l_result_0:FindFirstChild("DeveloperFramework");
        if l_DeveloperFramework_0 then
            script.Name = "DeveloperFramework_Replaced";
            l_DeveloperFramework_0.Parent = script.Parent;
            local l_script_FirstAncestorWhichIsA_0 = script:FindFirstAncestorWhichIsA("Plugin");
            if l_script_FirstAncestorWhichIsA_0 then
                print((("[DebugDeveloperFrameworkSdk] Hot loading DeveloperFramework for plugin %*"):format(l_script_FirstAncestorWhichIsA_0.Name)));
            else
                print("[DebugDeveloperFrameworkSdk] Hot loading DeveloperFramework");
            end;
            return (require(l_DeveloperFramework_0));
        end;
    end;
end;
return (require(script.Util.strict)(v0));