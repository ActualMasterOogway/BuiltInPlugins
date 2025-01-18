local l_Workspace_0 = game:GetService("Workspace");
local function _(v1, v2) --[[ Line: 5 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    v2 = v2 or false;
    return function() --[[ Line: 7 ]]
        -- upvalues: l_Workspace_0 (ref), v1 (copy), v2 (ref)
        local l_GameSettingsFlags_0 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if not l_GameSettingsFlags_0 or not l_GameSettingsFlags_0:FindFirstChild(v1) then
            return v2;
        else
            return l_GameSettingsFlags_0[v1].Value;
        end;
    end;
end;
local v5 = {};
local v6 = nil or false;
local v7 = "EnableRoactConfigs";
local l_v7_0 = v7 --[[ copy: 5 -> 6 ]];
local v9;
do
    local l_v6_0 = v6;
    v9 = function() --[[ Line: 7 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_0 (copy), l_v6_0 (ref)
        local l_GameSettingsFlags_1 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if not l_GameSettingsFlags_1 or not l_GameSettingsFlags_1:FindFirstChild(l_v7_0) then
            return l_v6_0;
        else
            return l_GameSettingsFlags_1[l_v7_0].Value;
        end;
    end;
end;
v5.EnableRoactConfigs = v9;
v6 = nil or false;
v7 = "RunningUnderCLI";
local l_v7_1 = v7 --[[ copy: 5 -> 7 ]];
do
    local l_v6_1 = v6;
    v9 = function() --[[ Line: 7 ]]
        -- upvalues: l_Workspace_0 (copy), l_v7_1 (copy), l_v6_1 (ref)
        local l_GameSettingsFlags_2 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if not l_GameSettingsFlags_2 or not l_GameSettingsFlags_2:FindFirstChild(l_v7_1) then
            return l_v6_1;
        else
            return l_GameSettingsFlags_2[l_v7_1].Value;
        end;
    end;
end;
v5.RunningUnderCLI = v9;
v6 = nil or false;
v7 = "RunTests";
do
    local l_v6_2 = v6;
    v9 = function() --[[ Line: 7 ]]
        -- upvalues: l_Workspace_0 (copy), v7 (copy), l_v6_2 (ref)
        local l_GameSettingsFlags_3 = l_Workspace_0:FindFirstChild("GameSettingsFlags");
        if not l_GameSettingsFlags_3 or not l_GameSettingsFlags_3:FindFirstChild(v7) then
            return l_v6_2;
        else
            return l_GameSettingsFlags_3[v7].Value;
        end;
    end;
end;
v5.RunTests = v9;
return v5;