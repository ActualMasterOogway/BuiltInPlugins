local v0 = {};
v0.__index = v0;
local l_TweenService_0 = game:GetService("TweenService");
local l_Debris_0 = game:GetService("Debris");
local l_UserInputService_0 = game:GetService("UserInputService");
v0.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v4 = {};
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
        return game.CoreGui.Parent.CoreGui;
    end);
    if l_status_0 == false then
        local l_LocalPlayer_0 = game.Players.LocalPlayer;
        while l_LocalPlayer_0 == nil do
            l_LocalPlayer_0 = game.Players.LocalPlayer;
            wait();
        end;
        l_result_0 = l_LocalPlayer_0.PlayerGui;
    end;
    if l_result_0:FindFirstChild("InputVisualizer") == nil then
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "InputVisualizer";
        l_ScreenGui_0.DisplayOrder = 1000000;
        l_ScreenGui_0.Parent = l_result_0;
    end;
    v4.guiRoot = l_result_0.InputVisualizer;
    setmetatable(v4, v0);
    return v4;
end;
v0.onInputBegan = function(v9, v10) --[[ Line: 34 ]] --[[ Name: onInputBegan ]]
    if v10.UserInputType == Enum.UserInputType.MouseButton1 then
        v9:click(Vector2.new(v10.Position.X, v10.Position.Y));
        return;
    else
        if v10.UserInputType == Enum.UserInputType.Touch then
            v9:click(Vector2.new(v10.Position.X, v10.Position.Y));
        end;
        return;
    end;
end;
v0.click = function(v11, v12, v13) --[[ Line: 42 ]] --[[ Name: click ]]
    -- upvalues: l_TweenService_0 (copy), l_Debris_0 (copy)
    local v14 = nil;
    if v14 == nil then
        v14 = Instance.new("ImageLabel");
        v14.Image = "rbxassetid://1549893588";
        v14.BackgroundTransparency = 1;
        v14.Parent = v13 or v11.guiRoot;
        v14.Size = UDim2.new(0, 20, 0, 20);
        v14.Name = "MouseClick";
        v14.ZIndex = 10;
    end;
    v14.Visible = true;
    v14.Position = UDim2.new(0, v12.X - v14.Size.X.Offset / 2, 0, v12.Y - v14.Size.Y.Offset / 2);
    v14.ImageTransparency = 0;
    local v15 = {
        ImageTransparency = 1
    };
    local v16 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, false);
    l_TweenService_0:Create(v14, v16, v15):Play();
    l_Debris_0:AddItem(v14, 0.5);
end;
v0.enable = function(v17) --[[ Line: 65 ]] --[[ Name: enable ]]
    -- upvalues: l_UserInputService_0 (copy)
    v17.handler = l_UserInputService_0.InputBegan:connect(function(v18, v19) --[[ Line: 67 ]]
        -- upvalues: v17 (copy)
        v17:onInputBegan(v18, v19);
    end);
end;
v0.disable = function(v20) --[[ Line: 72 ]] --[[ Name: disable ]]
    if v20.handler then
        v20.handler:Disconnect();
    end;
    v20.handler = nil;
end;
return v0;