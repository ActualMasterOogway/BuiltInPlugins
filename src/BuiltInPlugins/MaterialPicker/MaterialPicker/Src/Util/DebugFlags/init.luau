local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.TestLoader);
local v3 = v2.hasInternalPermission();
local v4 = v2.isCli();
local function _(v5, v6) --[[ Line: 17 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    local v7 = v6 or false;
    return function() --[[ Line: 19 ]]
        -- upvalues: l_Workspace_0 (ref), v5 (copy), v7 (copy)
        local l_MaterialPickerFlags_0 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
        if not l_MaterialPickerFlags_0 or not l_MaterialPickerFlags_0:FindFirstChild(v5) then
            return v7;
        else
            return l_MaterialPickerFlags_0[v5].Value;
        end;
    end;
end;
local v10 = {};
local v11 = v4 or false;
local v12 = "RunningUnderCLI";
local l_v12_0 = v12 --[[ copy: 9 -> 11 ]];
local l_v11_0 = v11 --[[ copy: 8 -> 12 ]];
v10.RunningUnderCLI = function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), l_v12_0 (copy), l_v11_0 (copy)
    local l_MaterialPickerFlags_1 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
    if not l_MaterialPickerFlags_1 or not l_MaterialPickerFlags_1:FindFirstChild(l_v12_0) then
        return l_v11_0;
    else
        return l_MaterialPickerFlags_1[l_v12_0].Value;
    end;
end;
v11 = "RunTests";
v12 = false;
local l_v11_1 = v11 --[[ copy: 8 -> 13 ]];
local l_v12_1 = v12 --[[ copy: 9 -> 14 ]];
v10.RunTests = function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), l_v11_1 (copy), l_v12_1 (copy)
    local l_MaterialPickerFlags_2 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
    if not l_MaterialPickerFlags_2 or not l_MaterialPickerFlags_2:FindFirstChild(l_v11_1) then
        return l_v12_1;
    else
        return l_MaterialPickerFlags_2[l_v11_1].Value;
    end;
end;
v11 = "LogTestsQuiet";
v12 = false;
local l_v11_2 = v11 --[[ copy: 8 -> 15 ]];
local l_v12_2 = v12 --[[ copy: 9 -> 16 ]];
v10.LogTestsQuiet = function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), l_v11_2 (copy), l_v12_2 (copy)
    local l_MaterialPickerFlags_3 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
    if not l_MaterialPickerFlags_3 or not l_MaterialPickerFlags_3:FindFirstChild(l_v11_2) then
        return l_v12_2;
    else
        return l_MaterialPickerFlags_3[l_v11_2].Value;
    end;
end;
v11 = "LogAnalytics";
v12 = false;
local l_v11_3 = v11 --[[ copy: 8 -> 17 ]];
local l_v12_3 = v12 --[[ copy: 9 -> 18 ]];
v10.LogAnalytics = function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), l_v11_3 (copy), l_v12_3 (copy)
    local l_MaterialPickerFlags_4 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
    if not l_MaterialPickerFlags_4 or not l_MaterialPickerFlags_4:FindFirstChild(l_v11_3) then
        return l_v12_3;
    else
        return l_MaterialPickerFlags_4[l_v11_3].Value;
    end;
end;
v11 = "RunDeveloperFrameworkTests";
v12 = false;
local l_v12_4 = v12 --[[ copy: 9 -> 19 ]];
v10.RunDeveloperFrameworkTests = function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), v11 (copy), l_v12_4 (copy)
    local l_MaterialPickerFlags_5 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
    if not l_MaterialPickerFlags_5 or not l_MaterialPickerFlags_5:FindFirstChild(v11) then
        return l_v12_4;
    else
        return l_MaterialPickerFlags_5[v11].Value;
    end;
end;
v12 = v4 or v3 or false;
local v27 = "EnableRoactConfigs";
v10.EnableRoactConfigs = function() --[[ Line: 19 ]]
    -- upvalues: l_Workspace_0 (copy), v27 (copy), v12 (copy)
    local l_MaterialPickerFlags_6 = l_Workspace_0:FindFirstChild("MaterialPickerFlags");
    if not l_MaterialPickerFlags_6 or not l_MaterialPickerFlags_6:FindFirstChild(v27) then
        return v12;
    else
        return l_MaterialPickerFlags_6[v27].Value;
    end;
end;
return v10;