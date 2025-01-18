local l_Workspace_0 = game:GetService("Workspace");
local v1 = require(script.Parent.hasInternalPermission)();
local v2 = pcall(function() --[[ Line: 7 ]]
    return game:GetService("ProcessService");
end);
local function _(v3, v4) --[[ Line: 12 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    v4 = v4 or false;
    return function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (ref), v3 (copy), v4 (ref)
        local l_AssetManagerFlags_0 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_0 or not l_AssetManagerFlags_0:FindFirstChild(v3) then
            return v4;
        else
            return l_AssetManagerFlags_0[v3].Value;
        end;
    end;
end;
local v7 = {};
local v8 = v2 or false;
local v9 = "RunningUnderCLI";
local l_v9_0 = v9 --[[ copy: 7 -> 8 ]];
local v11;
do
    local l_v8_0 = v8;
    v11 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), l_v9_0 (copy), l_v8_0 (ref)
        local l_AssetManagerFlags_1 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_1 or not l_AssetManagerFlags_1:FindFirstChild(l_v9_0) then
            return l_v8_0;
        else
            return l_AssetManagerFlags_1[l_v9_0].Value;
        end;
    end;
end;
v7.RunningUnderCLI = v11;
v8 = false or false;
v9 = "RunTests";
local l_v9_1 = v9 --[[ copy: 7 -> 9 ]];
do
    local l_v8_1 = v8;
    v11 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), l_v9_1 (copy), l_v8_1 (ref)
        local l_AssetManagerFlags_2 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_2 or not l_AssetManagerFlags_2:FindFirstChild(l_v9_1) then
            return l_v8_1;
        else
            return l_AssetManagerFlags_2[l_v9_1].Value;
        end;
    end;
end;
v7.RunTests = v11;
v8 = nil or false;
v9 = "LogTestsQuiet";
local l_v9_2 = v9 --[[ copy: 7 -> 10 ]];
do
    local l_v8_2 = v8;
    v11 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), l_v9_2 (copy), l_v8_2 (ref)
        local l_AssetManagerFlags_3 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_3 or not l_AssetManagerFlags_3:FindFirstChild(l_v9_2) then
            return l_v8_2;
        else
            return l_AssetManagerFlags_3[l_v9_2].Value;
        end;
    end;
end;
v7.LogTestsQuiet = v11;
v8 = nil or false;
v9 = "LogAnalytics";
local l_v9_3 = v9 --[[ copy: 7 -> 11 ]];
do
    local l_v8_3 = v8;
    v11 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), l_v9_3 (copy), l_v8_3 (ref)
        local l_AssetManagerFlags_4 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_4 or not l_AssetManagerFlags_4:FindFirstChild(l_v9_3) then
            return l_v8_3;
        else
            return l_AssetManagerFlags_4[l_v9_3].Value;
        end;
    end;
end;
v7.LogAnalytics = v11;
v8 = nil or false;
v9 = "RunDeveloperFrameworkTests";
local l_v9_4 = v9 --[[ copy: 7 -> 12 ]];
do
    local l_v8_4 = v8;
    v11 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), l_v9_4 (copy), l_v8_4 (ref)
        local l_AssetManagerFlags_5 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_5 or not l_AssetManagerFlags_5:FindFirstChild(l_v9_4) then
            return l_v8_4;
        else
            return l_AssetManagerFlags_5[l_v9_4].Value;
        end;
    end;
end;
v7.RunDeveloperFrameworkTests = v11;
v8 = v2 or v1 or false;
v9 = "EnableRoactConfigs";
do
    local l_v8_5 = v8;
    v11 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), v9 (copy), l_v8_5 (ref)
        local l_AssetManagerFlags_6 = l_Workspace_0:FindFirstChild("AssetManagerFlags");
        if not l_AssetManagerFlags_6 or not l_AssetManagerFlags_6:FindFirstChild(v9) then
            return l_v8_5;
        else
            return l_AssetManagerFlags_6[v9].Value;
        end;
    end;
end;
v7.EnableRoactConfigs = v11;
return v7;