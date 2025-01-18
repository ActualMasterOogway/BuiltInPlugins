require(script.Parent.defineLuaFlags);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SimulationStep");
plugin.Name = l_script_FirstAncestor_0.Name;
local l_RunService_0 = game:GetService("RunService");
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v9 = {
    pauseButtons = function(v8) --[[ Line: 29 ]]
        -- upvalues: l_RunService_0 (copy), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref)
        if l_RunService_0:IsEdit() then
            v2.Enabled = false;
            v3.Enabled = false;
            v4.Enabled = false;
            v5.Enabled = false;
            v6.Enabled = false;
            v7.Enabled = false;
            return;
        elseif v8 then
            v2.Enabled = true;
            v3.Enabled = true;
            v4.Enabled = false;
            v5.Enabled = false;
            v6.Enabled = true;
            v7.Enabled = true;
            return;
        else
            v2.Enabled = false;
            v3.Enabled = false;
            v4.Enabled = true;
            v5.Enabled = true;
            v6.Enabled = false;
            v7.Enabled = false;
            return;
        end;
    end
};
v9.checkRunState = l_RunService_0:GetPropertyChangedSignal("RunState"):Connect(function() --[[ Line: 56 ]] --[[ Name: trackRunState ]]
    -- upvalues: v9 (copy), l_RunService_0 (copy)
    v9.pauseButtons(not l_RunService_0:IsRunning());
end);
v9.onPause = function() --[[ Line: 62 ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy)
    l_RunService_0:Pause();
    v9.pauseButtons(true);
end;
v9.onResume = function() --[[ Line: 67 ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy)
    l_RunService_0:Run();
    v9.pauseButtons(false);
end;
v9.onStepForward = function() --[[ Line: 72 ]]
    -- upvalues: l_RunService_0 (copy)
    if not l_RunService_0:IsRunning() then
        workspace:StepPhysics(0.016666666666666666);
    end;
end;
v9.invokeAction = function(v10) --[[ Line: 80 ]]
    -- upvalues: l_RunService_0 (copy), v9 (copy)
    if l_RunService_0:IsEdit() then
        return;
    elseif v10 == "Pause" then
        v9.onPause();
        return;
    elseif v10 == "Resume" then
        v9.onResume();
        return;
    else
        if v10 == "StepForward" then
            v9.onStepForward();
        end;
        return;
    end;
end;
plugin:OnInvoke("syncRunState", v9.invokeAction);
v9.pauseAll = function() --[[ Line: 97 ]]
    plugin:Invoke("syncRunState", "Pause");
end;
v9.resumeAll = function() --[[ Line: 101 ]]
    plugin:Invoke("syncRunState", "Resume");
end;
v9.stepForwardAll = function() --[[ Line: 105 ]]
    plugin:Invoke("syncRunState", "StepForward");
end;
local v11 = not l_RunService_0:IsRunning();
local l_plugin_Toolbar_0 = plugin:CreateToolbar("simulationStep");
v2 = l_plugin_Toolbar_0:CreateButton("ResumeAll", "", "rbxlocaltheme://Resume");
v2.ClickableWhenViewportHidden = true;
v2.Click:Connect(v9.resumeAll);
v3 = l_plugin_Toolbar_0:CreateButton("Resume", "", "rbxlocaltheme://Resume");
v3.ClickableWhenViewportHidden = true;
v3.Click:Connect(v9.onResume);
v4 = l_plugin_Toolbar_0:CreateButton("PauseAll", "", "rbxlocaltheme://Pause");
v4.ClickableWhenViewportHidden = true;
v4.Click:Connect(v9.pauseAll);
v5 = l_plugin_Toolbar_0:CreateButton("Pause", "", "rbxlocaltheme://Pause");
v5.ClickableWhenViewportHidden = true;
v5.Click:Connect(v9.onPause);
v6 = l_plugin_Toolbar_0:CreateButton("StepForwardAll", "", "rbxlocaltheme://Fwd");
v6.ClickableWhenViewportHidden = true;
v6.Click:Connect(v9.stepForwardAll);
v7 = l_plugin_Toolbar_0:CreateButton("StepForward", "", "rbxlocaltheme://Fwd");
v7.ClickableWhenViewportHidden = true;
v7.Click:Connect(v9.onStepForward);
v9.pauseButtons(v11);