local v0 = {};
v0.__index = v0;
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local l_UserInputService_0 = game:GetService("UserInputService");
v0.new = function() --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: l_CoreGui_0 (copy), l_Players_0 (copy), v0 (copy)
    local v6 = {};
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 14 ]]
        -- upvalues: l_CoreGui_0 (ref)
        return l_CoreGui_0.Parent.CoreGui;
    end);
    if l_status_0 == false then
        repeat
            task.wait();
        until l_Players_0.LocalPlayer;
        l_result_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerGui");
    end;
    local l_InputVisualizer_0 = l_result_0:FindFirstChild("InputVisualizer");
    if not l_InputVisualizer_0 then
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "InputVisualizer";
        l_ScreenGui_0.DisplayOrder = 1000000;
        l_ScreenGui_0.Parent = l_result_0;
        l_InputVisualizer_0 = l_ScreenGui_0;
    end;
    v6.guiRoot = l_InputVisualizer_0;
    setmetatable(v6, v0);
    return v6;
end;
v0.onInputBegan = function(v11, v12) --[[ Line: 47 ]] --[[ Name: onInputBegan ]]
    if v12.UserInputType == Enum.UserInputType.MouseButton1 or v12.UserInputType == Enum.UserInputType.Touch then
        v11:click(Vector2.new(v12.Position.X, v12.Position.Y));
    end;
end;
v0.click = function(v13, v14, v15) --[[ Line: 53 ]] --[[ Name: click ]]
    -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
    local v16 = nil;
    if v16 == nil then
        v16 = Instance.new("ImageLabel");
        v16.Image = "rbxassetid://1549893588";
        v16.BackgroundTransparency = 1;
        v16.Parent = v15 or v13.guiRoot;
        v16.Size = UDim2.new(0, 20, 0, 20);
        v16.Name = "MouseClick";
        v16.ZIndex = 10;
    end;
    v16.Visible = true;
    v16.Position = UDim2.new(0, v14.X - v16.Size.X.Offset / 2, 0, v14.Y - v16.Size.Y.Offset / 2);
    v16.ImageTransparency = 0;
    local v17 = {
        ImageTransparency = 1
    };
    local v18 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false);
    l_TweenService_0:Create(v16, v18, v17):Play();
    l_Debris_0:AddItem(v16, 0.5);
end;
v0.enable = function(v19) --[[ Line: 76 ]] --[[ Name: enable ]]
    -- upvalues: l_UserInputService_0 (copy)
    v19.handler = l_UserInputService_0.InputBegan:Connect(function(v20, _) --[[ Line: 77 ]]
        -- upvalues: v19 (copy)
        v19:onInputBegan(v20);
    end);
end;
v0.disable = function(v22) --[[ Line: 82 ]] --[[ Name: disable ]]
    local l_handler_0 = v22.handler;
    if l_handler_0 then
        l_handler_0:Disconnect();
        v22.handler = nil;
    end;
end;
return v0;