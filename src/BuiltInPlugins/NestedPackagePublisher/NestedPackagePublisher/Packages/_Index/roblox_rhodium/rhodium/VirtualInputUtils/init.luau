local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = {};
local v3 = {};
l_RunService_0.Heartbeat:Connect(function(v4) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v5 = {};
    for v6, _ in pairs(v2) do
        if v6(v4) then
            table.insert(v5, v6);
        end;
    end;
    for _, v9 in ipairs(v5) do
        v2[v9] = nil;
    end;
    for v10, _ in pairs(v3) do
        if v10 == false then
            v3[v10] = nil;
        else
            v10:Fire(v4);
        end;
    end;
end);
local v12 = {};
local v13 = nil;
v12.setCurrentWindow = function(v14) --[[ Line: 33 ]] --[[ Name: setCurrentWindow ]]
    -- upvalues: v13 (ref)
    local l_v13_0 = v13;
    v13 = v14;
    return l_v13_0;
end;
v12.getCurrentWindow = function() --[[ Line: 39 ]] --[[ Name: getCurrentWindow ]]
    -- upvalues: v13 (ref)
    return v13;
end;
v12.__asyncRun = function(v16) --[[ Line: 43 ]] --[[ Name: __asyncRun ]]
    -- upvalues: v2 (copy)
    v2[v16] = true;
end;
v12.__syncRun = function(v17) --[[ Line: 47 ]] --[[ Name: __syncRun ]]
    -- upvalues: v3 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    v3[l_BindableEvent_0] = true;
    local v19 = 0;
    while not v17(v19) do
        v19 = l_BindableEvent_0.Event:Wait();
    end;
    v3[l_BindableEvent_0] = false;
end;
v12.__handleGuiInset = function(v20, v21) --[[ Line: 59 ]] --[[ Name: __handleGuiInset ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    return v20 + l_l_GuiService_0_GuiInset_0.X, v21 + l_l_GuiService_0_GuiInset_0.Y;
end;
return v12;