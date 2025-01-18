local l_Workspace_0 = game:GetService("Workspace");
local v1 = require(script.Parent.hasInternalPermission)();
local v2 = pcall(function() --[[ Line: 13 ]]
    return game:GetService("ProcessService");
end);
local function _(v3, v4) --[[ Line: 18 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    local v5 = v4 or false;
    return function() --[[ Line: 20 ]]
        -- upvalues: l_Workspace_0 (ref), v3 (copy), v5 (copy)
        local l_ExperimentalFlags_0 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
        if not l_ExperimentalFlags_0 or not l_ExperimentalFlags_0:FindFirstChild(v3) then
            return v5;
        else
            return l_ExperimentalFlags_0[v3].Value;
        end;
    end;
end;
local v8 = {};
local v9 = v2 or false;
local v10 = "RunningUnderCLI";
local l_v10_0 = v10 --[[ copy: 7 -> 9 ]];
local l_v9_0 = v9 --[[ copy: 6 -> 10 ]];
v8.RunningUnderCLI = function() --[[ Line: 20 ]]
    -- upvalues: l_Workspace_0 (copy), l_v10_0 (copy), l_v9_0 (copy)
    local l_ExperimentalFlags_1 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
    if not l_ExperimentalFlags_1 or not l_ExperimentalFlags_1:FindFirstChild(l_v10_0) then
        return l_v9_0;
    else
        return l_ExperimentalFlags_1[l_v10_0].Value;
    end;
end;
v9 = "RunTests";
v10 = false;
local l_v9_1 = v9 --[[ copy: 6 -> 11 ]];
local l_v10_1 = v10 --[[ copy: 7 -> 12 ]];
v8.RunTests = function() --[[ Line: 20 ]]
    -- upvalues: l_Workspace_0 (copy), l_v9_1 (copy), l_v10_1 (copy)
    local l_ExperimentalFlags_2 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
    if not l_ExperimentalFlags_2 or not l_ExperimentalFlags_2:FindFirstChild(l_v9_1) then
        return l_v10_1;
    else
        return l_ExperimentalFlags_2[l_v9_1].Value;
    end;
end;
v9 = "LogTestsQuiet";
v10 = false;
local l_v9_2 = v9 --[[ copy: 6 -> 13 ]];
local l_v10_2 = v10 --[[ copy: 7 -> 14 ]];
v8.LogTestsQuiet = function() --[[ Line: 20 ]]
    -- upvalues: l_Workspace_0 (copy), l_v9_2 (copy), l_v10_2 (copy)
    local l_ExperimentalFlags_3 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
    if not l_ExperimentalFlags_3 or not l_ExperimentalFlags_3:FindFirstChild(l_v9_2) then
        return l_v10_2;
    else
        return l_ExperimentalFlags_3[l_v9_2].Value;
    end;
end;
v9 = "LogAnalytics";
v10 = false;
local l_v9_3 = v9 --[[ copy: 6 -> 15 ]];
local l_v10_3 = v10 --[[ copy: 7 -> 16 ]];
v8.LogAnalytics = function() --[[ Line: 20 ]]
    -- upvalues: l_Workspace_0 (copy), l_v9_3 (copy), l_v10_3 (copy)
    local l_ExperimentalFlags_4 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
    if not l_ExperimentalFlags_4 or not l_ExperimentalFlags_4:FindFirstChild(l_v9_3) then
        return l_v10_3;
    else
        return l_ExperimentalFlags_4[l_v9_3].Value;
    end;
end;
v9 = "RunDeveloperFrameworkTests";
v10 = false;
local l_v10_4 = v10 --[[ copy: 7 -> 17 ]];
v8.RunDeveloperFrameworkTests = function() --[[ Line: 20 ]]
    -- upvalues: l_Workspace_0 (copy), v9 (copy), l_v10_4 (copy)
    local l_ExperimentalFlags_5 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
    if not l_ExperimentalFlags_5 or not l_ExperimentalFlags_5:FindFirstChild(v9) then
        return l_v10_4;
    else
        return l_ExperimentalFlags_5[v9].Value;
    end;
end;
v10 = v2 or v1 or false;
local v25 = "EnableRoactConfigs";
v8.EnableRoactConfigs = function() --[[ Line: 20 ]]
    -- upvalues: l_Workspace_0 (copy), v25 (copy), v10 (copy)
    local l_ExperimentalFlags_6 = l_Workspace_0:FindFirstChild("ExperimentalFlags");
    if not l_ExperimentalFlags_6 or not l_ExperimentalFlags_6:FindFirstChild(v25) then
        return v10;
    else
        return l_ExperimentalFlags_6[v25].Value;
    end;
end;
return v8;