local l_Workspace_0 = game:GetService("Workspace");
local v1 = script.Parent.Parent.Parent.Name .. "Flags";
local function _(v2, v3) --[[ Line: 12 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy), v1 (copy)
    v3 = v3 or false;
    return function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (ref), v1 (ref), v2 (copy), v3 (ref)
        local l_l_Workspace_0_FirstChild_0 = l_Workspace_0:FindFirstChild(v1);
        if not l_l_Workspace_0_FirstChild_0 or not l_l_Workspace_0_FirstChild_0:FindFirstChild(v2) then
            return v3;
        else
            return l_l_Workspace_0_FirstChild_0[v2].Value;
        end;
    end;
end;
local v6 = {};
local v7 = nil or false;
local v8 = "RunningUnderCLI";
local l_v8_0 = v8 --[[ copy: 7 -> 8 ]];
local v10;
do
    local l_v7_0 = v7;
    v10 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), v1 (copy), l_v8_0 (copy), l_v7_0 (ref)
        local l_l_Workspace_0_FirstChild_1 = l_Workspace_0:FindFirstChild(v1);
        if not l_l_Workspace_0_FirstChild_1 or not l_l_Workspace_0_FirstChild_1:FindFirstChild(l_v8_0) then
            return l_v7_0;
        else
            return l_l_Workspace_0_FirstChild_1[l_v8_0].Value;
        end;
    end;
end;
v6.RunningUnderCLI = v10;
v7 = false or false;
v8 = "RunTests";
local l_v8_1 = v8 --[[ copy: 7 -> 9 ]];
do
    local l_v7_1 = v7;
    v10 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), v1 (copy), l_v8_1 (copy), l_v7_1 (ref)
        local l_l_Workspace_0_FirstChild_2 = l_Workspace_0:FindFirstChild(v1);
        if not l_l_Workspace_0_FirstChild_2 or not l_l_Workspace_0_FirstChild_2:FindFirstChild(l_v8_1) then
            return l_v7_1;
        else
            return l_l_Workspace_0_FirstChild_2[l_v8_1].Value;
        end;
    end;
end;
v6.RunTests = v10;
v7 = nil or false;
v8 = "LogTestsQuiet";
local l_v8_2 = v8 --[[ copy: 7 -> 10 ]];
do
    local l_v7_2 = v7;
    v10 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), v1 (copy), l_v8_2 (copy), l_v7_2 (ref)
        local l_l_Workspace_0_FirstChild_3 = l_Workspace_0:FindFirstChild(v1);
        if not l_l_Workspace_0_FirstChild_3 or not l_l_Workspace_0_FirstChild_3:FindFirstChild(l_v8_2) then
            return l_v7_2;
        else
            return l_l_Workspace_0_FirstChild_3[l_v8_2].Value;
        end;
    end;
end;
v6.LogTestsQuiet = v10;
v7 = nil or false;
v8 = "LogAnalytics";
do
    local l_v7_3 = v7;
    v10 = function() --[[ Line: 14 ]]
        -- upvalues: l_Workspace_0 (copy), v1 (copy), v8 (copy), l_v7_3 (ref)
        local l_l_Workspace_0_FirstChild_4 = l_Workspace_0:FindFirstChild(v1);
        if not l_l_Workspace_0_FirstChild_4 or not l_l_Workspace_0_FirstChild_4:FindFirstChild(v8) then
            return l_v7_3;
        else
            return l_l_Workspace_0_FirstChild_4[v8].Value;
        end;
    end;
end;
v6.LogAnalytics = v10;
return v6;