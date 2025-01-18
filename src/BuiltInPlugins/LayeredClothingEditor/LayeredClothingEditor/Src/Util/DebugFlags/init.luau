local l_Workspace_0 = game:GetService("Workspace");
local v1 = {};
local function _(v2) --[[ Line: 5 ]] --[[ Name: checkFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_0 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_0 then
        return l_LayeredClothingEditorFlags_0:FindFirstChild(v2) and l_LayeredClothingEditorFlags_0[v2].Value;
    else
        return false;
    end;
end;
v1.RunTests = function() --[[ Line: 14 ]] --[[ Name: RunTests ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_1 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_1 then
        local l_RunTests_0 = l_LayeredClothingEditorFlags_1:FindFirstChild("RunTests");
        if l_RunTests_0 then
            return l_LayeredClothingEditorFlags_1.RunTests.Value;
        else
            return l_RunTests_0;
        end;
    else
        return false;
    end;
end;
v1.RunRhodiumTests = function() --[[ Line: 18 ]] --[[ Name: RunRhodiumTests ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_2 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_2 then
        local l_RunRhodiumTests_0 = l_LayeredClothingEditorFlags_2:FindFirstChild("RunRhodiumTests");
        if l_RunRhodiumTests_0 then
            return l_LayeredClothingEditorFlags_2.RunRhodiumTests.Value;
        else
            return l_RunRhodiumTests_0;
        end;
    else
        return false;
    end;
end;
v1.LogRoduxEvents = function() --[[ Line: 22 ]] --[[ Name: LogRoduxEvents ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_3 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_3 then
        local l_LogRoduxEvents_0 = l_LayeredClothingEditorFlags_3:FindFirstChild("LogRoduxEvents");
        if l_LogRoduxEvents_0 then
            return l_LayeredClothingEditorFlags_3.LogRoduxEvents.Value;
        else
            return l_LogRoduxEvents_0;
        end;
    else
        return false;
    end;
end;
v1.LogAnalytics = function() --[[ Line: 26 ]] --[[ Name: LogAnalytics ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_4 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_4 then
        local l_LogAnalytics_0 = l_LayeredClothingEditorFlags_4:FindFirstChild("LogAnalytics");
        if l_LogAnalytics_0 then
            return l_LayeredClothingEditorFlags_4.LogAnalytics.Value;
        else
            return l_LogAnalytics_0;
        end;
    else
        return false;
    end;
end;
v1.MockItemHasFullCage = function() --[[ Line: 30 ]] --[[ Name: MockItemHasFullCage ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_5 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_5 then
        local l_MockItemHasFullCage_0 = l_LayeredClothingEditorFlags_5:FindFirstChild("MockItemHasFullCage");
        if l_MockItemHasFullCage_0 then
            return l_LayeredClothingEditorFlags_5.MockItemHasFullCage.Value;
        else
            return l_MockItemHasFullCage_0;
        end;
    else
        return false;
    end;
end;
v1.UseMockCages = function() --[[ Line: 34 ]] --[[ Name: UseMockCages ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_LayeredClothingEditorFlags_6 = l_Workspace_0:FindFirstChild("LayeredClothingEditorFlags");
    if l_LayeredClothingEditorFlags_6 then
        local l_UseMockCages_0 = l_LayeredClothingEditorFlags_6:FindFirstChild("UseMockCages");
        if l_UseMockCages_0 then
            return l_LayeredClothingEditorFlags_6.UseMockCages.Value;
        else
            return l_UseMockCages_0;
        end;
    else
        return false;
    end;
end;
return v1;