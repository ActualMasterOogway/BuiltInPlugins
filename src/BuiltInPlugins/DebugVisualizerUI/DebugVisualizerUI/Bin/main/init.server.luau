game:DefineFastFlag("ShowDebugVisualizerUI", false);
if not game:GetFastFlag("ShowDebugVisualizerUI") then
    return;
else
    local v0 = nil;
    local l_Parent_0 = script.Parent.Parent;
    local v2 = require(l_Parent_0.Src.tr);
    local function v3() --[[ Line: 12 ]] --[[ Name: showOrHideTimesteps ]]
        -- upvalues: v0 (ref)
        if settings().Physics.AreTimestepsShown then
            v0.Parent = game:GetService("CoreGui");
            return;
        else
            v0.Parent = nil;
            return;
        end;
    end;
    local function v10(v4, v5) --[[ Line: 21 ]] --[[ Name: createItemWithColorAndLabel ]]
        local l_Frame_0 = Instance.new("Frame");
        l_Frame_0.Size = UDim2.new(1, 0, 0, 15);
        l_Frame_0.BackgroundTransparency = 1;
        local l_UIListLayout_0 = Instance.new("UIListLayout");
        l_UIListLayout_0.Parent = l_Frame_0;
        l_UIListLayout_0.FillDirection = "Horizontal";
        l_UIListLayout_0.HorizontalAlignment = "Center";
        l_UIListLayout_0.VerticalAlignment = "Center";
        local l_Frame_1 = Instance.new("Frame");
        l_Frame_1.Size = UDim2.new(0, 15, 0, 15);
        l_Frame_1.Parent = l_Frame_0;
        l_Frame_1.BackgroundColor3 = v4;
        l_Frame_1.BorderSizePixel = 0;
        local l_TextLabel_0 = Instance.new("TextLabel");
        l_TextLabel_0.Text = v5;
        l_TextLabel_0.Parent = l_Frame_0;
        l_TextLabel_0.Size = UDim2.new(1, -15, 0, 15);
        l_TextLabel_0.BackgroundTransparency = 1;
        l_TextLabel_0.TextColor3 = Color3.new(1, 1, 1);
        return l_Frame_0;
    end;
    local function v17() --[[ Line: 47 ]] --[[ Name: init ]]
        -- upvalues: v0 (ref), v2 (copy), v10 (copy)
        v0 = Instance.new("ScreenGui");
        v0.Name = "AdaptiveTimeSteppingLegend";
        v0.Enabled = true;
        local l_Frame_2 = Instance.new("Frame");
        l_Frame_2.Parent = v0;
        l_Frame_2.Size = UDim2.new(0, 120, 0, 80);
        l_Frame_2.Position = UDim2.new(0, 0, 0, 0);
        l_Frame_2.BackgroundColor3 = Color3.new(0, 0, 0);
        local l_TextLabel_1 = Instance.new("TextLabel");
        l_TextLabel_1.Parent = l_Frame_2;
        l_TextLabel_1.Size = UDim2.new(1, 0, 0, 25);
        l_TextLabel_1.TextColor3 = Color3.new(1, 1, 1);
        l_TextLabel_1.Text = v2("Studio.DebugVisualizerUI.AdaptiveTimesteppingLegend.LegendLabel");
        l_TextLabel_1.BackgroundTransparency = 1;
        l_TextLabel_1.LayoutOrder = 0;
        local l_UIListLayout_1 = Instance.new("UIListLayout");
        l_UIListLayout_1.Parent = l_Frame_2;
        l_UIListLayout_1.FillDirection = "Vertical";
        l_UIListLayout_1.HorizontalAlignment = "Center";
        l_UIListLayout_1.VerticalAlignment = "Center";
        l_UIListLayout_1.SortOrder = "LayoutOrder";
        local v14 = v10(Color3.new(255, 0, 0), "240hz");
        v14.Parent = l_Frame_2;
        v14.LayoutOrder = 1;
        local v15 = v10(Color3.fromRGB(255, 198, 0), "120hz");
        v15.Parent = l_Frame_2;
        v15.LayoutOrder = 2;
        local v16 = v10(Color3.fromRGB(64, 166, 81), "60hz");
        v16.Parent = l_Frame_2;
        v16.LayoutOrder = 3;
        plugin.Name = "DebugVisualizerUI";
    end;
    plugin.Unloading:Connect(function() --[[ Line: 88 ]]
        -- upvalues: v0 (ref)
        v0.Parent = nil;
    end);
    settings().Physics:GetPropertyChangedSignal("AreTimestepsShown"):Connect(v3);
    v17();
    if settings().Physics.AreTimestepsShown then
        v0.Parent = game:GetService("CoreGui");
    else
        v0.Parent = nil;
    end;
    return;
end;