local l_Workspace_0 = game:GetService("Workspace");
local function _(v1, v2) --[[ Line: 11 ]] --[[ Name: defineFlag ]]
    -- upvalues: l_Workspace_0 (copy)
    local v3 = v2 or false;
    return function() --[[ Line: 13 ]]
        -- upvalues: l_Workspace_0 (ref), v1 (copy), v3 (copy)
        local l_DraggerFrameworkFlags_0 = l_Workspace_0:FindFirstChild("DraggerFrameworkFlags");
        if not l_DraggerFrameworkFlags_0 or not l_DraggerFrameworkFlags_0:FindFirstChild(v1) then
            return v3;
        else
            return l_DraggerFrameworkFlags_0[v1].Value;
        end;
    end;
end;
local v6 = {};
local v7 = "LogAnalytics";
local v8 = false;
v6.LogAnalytics = function() --[[ Line: 13 ]]
    -- upvalues: l_Workspace_0 (copy), v7 (copy), v8 (copy)
    local l_DraggerFrameworkFlags_1 = l_Workspace_0:FindFirstChild("DraggerFrameworkFlags");
    if not l_DraggerFrameworkFlags_1 or not l_DraggerFrameworkFlags_1:FindFirstChild(v7) then
        return v8;
    else
        return l_DraggerFrameworkFlags_1[v7].Value;
    end;
end;
return v6;