local l_Workspace_0 = game:GetService("Workspace");
local function _(v1, v2) --[[ Line: 11 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    v2 = v2 or false;
    return function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (ref), v1 (copy), v2 (ref)
        local l_DebuggerFlags_0 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_0 or not l_DebuggerFlags_0:FindFirstChild(v1) then
            return v2;
        else
            return l_DebuggerFlags_0[v1].Value;
        end;
    end;
end;
local v5 = {};
local v6 = nil or false;
local v7 = "RunningUnderCLI";
local l_v7_0 = v7 --[[ copy: 5 -> 6 ]];
local v9;
do
    local l_v6_0 = v6;
    v9 = function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_0 (copy), l_v6_0 (ref)
        local l_DebuggerFlags_1 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_1 or not l_DebuggerFlags_1:FindFirstChild(l_v7_0) then
            return l_v6_0;
        else
            return l_DebuggerFlags_1[l_v7_0].Value;
        end;
    end;
end;
v5.RunningUnderCLI = v9;
v6 = false or false;
v7 = "RunTests";
local l_v7_1 = v7 --[[ copy: 5 -> 7 ]];
do
    local l_v6_1 = v6;
    v9 = function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_1 (copy), l_v6_1 (ref)
        local l_DebuggerFlags_2 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_2 or not l_DebuggerFlags_2:FindFirstChild(l_v7_1) then
            return l_v6_1;
        else
            return l_DebuggerFlags_2[l_v7_1].Value;
        end;
    end;
end;
v5.RunTests = v9;
v6 = nil or false;
v7 = "LogTestsQuiet";
local l_v7_2 = v7 --[[ copy: 5 -> 8 ]];
do
    local l_v6_2 = v6;
    v9 = function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_2 (copy), l_v6_2 (ref)
        local l_DebuggerFlags_3 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_3 or not l_DebuggerFlags_3:FindFirstChild(l_v7_2) then
            return l_v6_2;
        else
            return l_DebuggerFlags_3[l_v7_2].Value;
        end;
    end;
end;
v5.LogTestsQuiet = v9;
v6 = nil or false;
v7 = "LogAnalytics";
local l_v7_3 = v7 --[[ copy: 5 -> 9 ]];
do
    local l_v6_3 = v6;
    v9 = function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_3 (copy), l_v6_3 (ref)
        local l_DebuggerFlags_4 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_4 or not l_DebuggerFlags_4:FindFirstChild(l_v7_3) then
            return l_v6_3;
        else
            return l_DebuggerFlags_4[l_v7_3].Value;
        end;
    end;
end;
v5.LogAnalytics = v9;
v6 = nil or false;
v7 = "RunDeveloperFrameworkTests";
local l_v7_4 = v7 --[[ copy: 5 -> 10 ]];
do
    local l_v6_4 = v6;
    v9 = function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_4 (copy), l_v6_4 (ref)
        local l_DebuggerFlags_5 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_5 or not l_DebuggerFlags_5:FindFirstChild(l_v7_4) then
            return l_v6_4;
        else
            return l_DebuggerFlags_5[l_v7_4].Value;
        end;
    end;
end;
v5.RunDeveloperFrameworkTests = v9;
v6 = false or false;
v7 = "EnableRoactConfigs";
do
    local l_v6_5 = v6;
    v9 = function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (copy), v7 (copy), l_v6_5 (ref)
        local l_DebuggerFlags_6 = l_Workspace_0:FindFirstChild("DebuggerFlags");
        if not l_DebuggerFlags_6 or not l_DebuggerFlags_6:FindFirstChild(v7) then
            return l_v6_5;
        else
            return l_DebuggerFlags_6[v7].Value;
        end;
    end;
end;
v5.EnableRoactConfigs = v9;
return v5;