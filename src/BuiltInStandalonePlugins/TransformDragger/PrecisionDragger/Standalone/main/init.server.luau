local l_StudioService_0 = game:GetService("StudioService");
local l_plugin_0 = plugin;
local _ = settings;
local l_Button_0 = l_plugin_0:CreateToolbar("Transform"):CreateButton("Transform", "Precision Dragger", "");
l_Button_0.Click:connect(function() --[[ Line: 8 ]]
    -- upvalues: l_plugin_0 (copy)
    l_plugin_0:Invoke("buttonClicked", "");
end);
l_plugin_0:OnInvoke("setActive", function(v4) --[[ Line: 12 ]]
    -- upvalues: l_Button_0 (copy)
    l_Button_0:SetActive(v4 == "true");
end);
l_Button_0.Enabled = not l_StudioService_0.DraggerSolveConstraints;
l_StudioService_0.PromptTransformPluginCheckEnable:Connect(function() --[[ Line: 19 ]]
    -- upvalues: l_StudioService_0 (copy), l_plugin_0 (copy), l_Button_0 (copy)
    if l_StudioService_0.DraggerSolveConstraints then
        l_plugin_0:Invoke("Disable");
    end;
    l_Button_0.Enabled = not l_StudioService_0.DraggerSolveConstraints;
end);