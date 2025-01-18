local l_Workspace_0 = game:GetService("Workspace");
local v1 = pcall(function() --[[ Line: 5 ]]
    return game:GetService("ProcessService");
end);
local function _(v2, v3) --[[ Line: 10 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    v3 = v3 or false;
    return function() --[[ Line: 12 ]]
        -- upvalues: l_Workspace_0 (ref), v2 (copy), v3 (ref)
        local l_AnimationClipEditorFlags_0 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if not l_AnimationClipEditorFlags_0 or not l_AnimationClipEditorFlags_0:FindFirstChild(v2) then
            return v3;
        else
            return l_AnimationClipEditorFlags_0[v2].Value;
        end;
    end;
end;
local v6 = {};
local v7 = nil or false;
local v8 = "RunTests";
local l_v8_0 = v8 --[[ copy: 6 -> 7 ]];
local v10;
do
    local l_v7_0 = v7;
    v10 = function() --[[ Line: 12 ]]
        -- upvalues: l_Workspace_0 (copy), l_v8_0 (copy), l_v7_0 (ref)
        local l_AnimationClipEditorFlags_1 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if not l_AnimationClipEditorFlags_1 or not l_AnimationClipEditorFlags_1:FindFirstChild(l_v8_0) then
            return l_v7_0;
        else
            return l_AnimationClipEditorFlags_1[l_v8_0].Value;
        end;
    end;
end;
v6.RunTests = v10;
v7 = nil or false;
v8 = "RunRhodiumTests";
local l_v8_1 = v8 --[[ copy: 6 -> 8 ]];
do
    local l_v7_1 = v7;
    v10 = function() --[[ Line: 12 ]]
        -- upvalues: l_Workspace_0 (copy), l_v8_1 (copy), l_v7_1 (ref)
        local l_AnimationClipEditorFlags_2 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if not l_AnimationClipEditorFlags_2 or not l_AnimationClipEditorFlags_2:FindFirstChild(l_v8_1) then
            return l_v7_1;
        else
            return l_AnimationClipEditorFlags_2[l_v8_1].Value;
        end;
    end;
end;
v6.RunRhodiumTests = v10;
v7 = nil or false;
v8 = "LogRoduxEvents";
local l_v8_2 = v8 --[[ copy: 6 -> 9 ]];
do
    local l_v7_2 = v7;
    v10 = function() --[[ Line: 12 ]]
        -- upvalues: l_Workspace_0 (copy), l_v8_2 (copy), l_v7_2 (ref)
        local l_AnimationClipEditorFlags_3 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if not l_AnimationClipEditorFlags_3 or not l_AnimationClipEditorFlags_3:FindFirstChild(l_v8_2) then
            return l_v7_2;
        else
            return l_AnimationClipEditorFlags_3[l_v8_2].Value;
        end;
    end;
end;
v6.LogRoduxEvents = v10;
v7 = nil or false;
v8 = "LogAnalytics";
local l_v8_3 = v8 --[[ copy: 6 -> 10 ]];
do
    local l_v7_3 = v7;
    v10 = function() --[[ Line: 12 ]]
        -- upvalues: l_Workspace_0 (copy), l_v8_3 (copy), l_v7_3 (ref)
        local l_AnimationClipEditorFlags_4 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if not l_AnimationClipEditorFlags_4 or not l_AnimationClipEditorFlags_4:FindFirstChild(l_v8_3) then
            return l_v7_3;
        else
            return l_AnimationClipEditorFlags_4[l_v8_3].Value;
        end;
    end;
end;
v6.LogAnalytics = v10;
v7 = v1 or false;
v8 = "RunningUnderCLI";
do
    local l_v7_4 = v7;
    v10 = function() --[[ Line: 12 ]]
        -- upvalues: l_Workspace_0 (copy), v8 (copy), l_v7_4 (ref)
        local l_AnimationClipEditorFlags_5 = l_Workspace_0:FindFirstChild("AnimationClipEditorFlags");
        if not l_AnimationClipEditorFlags_5 or not l_AnimationClipEditorFlags_5:FindFirstChild(v8) then
            return l_v7_4;
        else
            return l_AnimationClipEditorFlags_5[v8].Value;
        end;
    end;
end;
v6.RunningUnderCLI = v10;
return v6;