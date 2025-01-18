local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v3 = {};
local v4 = {};
l_RunService_0.Heartbeat:Connect(function(v5) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v6 = {};
    for v7, _ in pairs(v3) do
        if v7(v5) then
            table.insert(v6, v7);
        end;
    end;
    for _, v10 in ipairs(v6) do
        v3[v10] = nil;
    end;
    for v11, _ in pairs(v4) do
        if v4[v11] == false then
            v4[v11] = nil;
        else
            v11:Fire(v5);
        end;
    end;
end);
local v13 = {};
local v14 = nil;
v13.setCurrentWindow = function(v15) --[[ Line: 35 ]] --[[ Name: setCurrentWindow ]]
    -- upvalues: v14 (ref)
    local l_v14_0 = v14;
    v14 = v15;
    return l_v14_0;
end;
v13.getCurrentWindow = function() --[[ Line: 41 ]] --[[ Name: getCurrentWindow ]]
    -- upvalues: v14 (ref)
    return v14;
end;
v13.waitForInputEventsProcessed = function() --[[ Line: 45 ]] --[[ Name: waitForInputEventsProcessed ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:WaitForInputEventsProcessed();
end;
v13.__asyncRun = function(v17) --[[ Line: 49 ]] --[[ Name: __asyncRun ]]
    -- upvalues: v3 (copy)
    v3[v17] = true;
end;
v13.__syncRun = function(v18) --[[ Line: 53 ]] --[[ Name: __syncRun ]]
    -- upvalues: v4 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v4[l_BindableEvent_0] = true;
    local v20 = 0;
    while not v18(v20) do
        v20 = l_BindableEvent_0.Event:Wait();
    end;
    v4[l_BindableEvent_0] = false;
end;
v13.__handleGuiInset = function(v21, v22) --[[ Line: 67 ]] --[[ Name: __handleGuiInset ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    return v21 + l_l_GuiService_0_GuiInset_0.X, v22 + l_l_GuiService_0_GuiInset_0.Y;
end;
return v13;