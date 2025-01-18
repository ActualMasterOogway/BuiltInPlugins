local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_ServiceWrapper_0 = v1.TestHelpers.ServiceWrapper;
local v3 = v1.ContextServices.ContextItem:extend("MultiTouchController");
v3.new = function(v4) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: l_ServiceWrapper_0 (copy), v3 (copy)
    local v5 = setmetatable({
        _studioDeviceEmulatorService = l_ServiceWrapper_0.new("StudioDeviceEmulatorService", v4), 
        _screenGui = nil, 
        _pivot = nil, 
        _touches = {}, 
        _connectingLines = {}, 
        _mock = v4
    }, v3);
    v5._screenGui = v5:initScreenGui();
    v5._pivot = v5:makeNewPivotCircle();
    for v6 = 1, v5._studioDeviceEmulatorService:asService():GetMaxNumTouches() do
        v5._touches[v6] = v5:makeNewControlCircle();
        v5._connectingLines[v6] = v5:makeNewConnectingLine();
    end;
    if not v4 then
        v5._isMultiTouchEnabledChanged = v5._studioDeviceEmulatorService:asInstance():GetPropertyChangedSignal("IsMultiTouchEnabled"):Connect(function() --[[ Line: 38 ]]
            -- upvalues: v5 (copy)
            if v5._studioDeviceEmulatorService:asService().IsMultiTouchEnabled then
                v5._screenGui.Enabled = true;
                local l_PivotPosition_0 = v5._studioDeviceEmulatorService:asService().PivotPosition;
                v5:updateControlCirclePos(v5._pivot, l_PivotPosition_0);
                for v8 = 1, #v5._touches do
                    v5:updateControlCirclePos(v5._touches[v8], v5._studioDeviceEmulatorService:asService():GetTouchPosition(v8 - 1));
                    v5:updateConnectingLine(v5._connectingLines[v8], v5._touches[v8]);
                end;
                return;
            else
                v5._screenGui.Enabled = false;
                return;
            end;
        end);
        v5._pivotPositionChanged = v5._studioDeviceEmulatorService:asInstance():GetPropertyChangedSignal("PivotPosition"):Connect(function() --[[ Line: 60 ]]
            -- upvalues: v5 (copy)
            local l_PivotPosition_1 = v5._studioDeviceEmulatorService:asService().PivotPosition;
            v5:updateControlCirclePos(v5._pivot, l_PivotPosition_1);
            for v10 = 1, #v5._touches do
                v5:updateConnectingLine(v5._connectingLines[v10], v5._touches[v10]);
            end;
        end);
        v5._touchPositionsChanged = v5._studioDeviceEmulatorService:asService().TouchPositionsChanged:Connect(function() --[[ Line: 70 ]]
            -- upvalues: v5 (copy)
            for v11 = 1, #v5._touches do
                v5:updateControlCirclePos(v5._touches[v11], v5._studioDeviceEmulatorService:asService():GetTouchPosition(v11 - 1));
                v5:updateConnectingLine(v5._connectingLines[v11], v5._touches[v11]);
            end;
        end);
        v5._touchInBoundsChanged = v5._studioDeviceEmulatorService:asService().TouchInBoundsChanged:Connect(function() --[[ Line: 82 ]]
            -- upvalues: v5 (copy)
            for v12 = 1, #v5._touches do
                v5:updateControlCircleColor(v5._touches[v12], v5._studioDeviceEmulatorService:asService():GetTouchInBounds(v12 - 1));
            end;
        end);
    end;
    return v5;
end;
v3.mock = function() --[[ Line: 95 ]] --[[ Name: mock ]]
    -- upvalues: v3 (copy)
    return v3.new(true);
end;
v3.destroy = function(v13) --[[ Line: 99 ]] --[[ Name: destroy ]]
    if not v13._mock then
        v13._isMultiTouchEnabledChanged:Disconnect();
        v13._pivotPositionChanged:Disconnect();
        v13._touchPositionsChanged:Disconnect();
        v13._touchInBoundsChanged:Disconnect();
    end;
    if v13._screenGui then
        v13._screenGui:Destroy();
    end;
    v13._studioDeviceEmulatorService:destroy();
end;
v3.initScreenGui = function(_) --[[ Line: 114 ]] --[[ Name: initScreenGui ]]
    local l_MultiTouchScreenGui_0 = game.CoreGui:FindFirstChild("MultiTouchScreenGui");
    if l_MultiTouchScreenGui_0 then
        l_MultiTouchScreenGui_0:ClearAllChildren();
        return l_MultiTouchScreenGui_0;
    else
        l_MultiTouchScreenGui_0 = Instance.new("ScreenGui");
        l_MultiTouchScreenGui_0.Name = "MultiTouchScreenGui";
        l_MultiTouchScreenGui_0.IgnoreGuiInset = true;
        l_MultiTouchScreenGui_0.Enabled = false;
        l_MultiTouchScreenGui_0.Parent = game.CoreGui;
        return l_MultiTouchScreenGui_0;
    end;
end;
v3.makeNewControlCircle = function(v16) --[[ Line: 129 ]] --[[ Name: makeNewControlCircle ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Size = UDim2.new(0.05, 0, 0.05, 0);
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.BackgroundTransparency = 0.5;
    l_Frame_0.Parent = v16._screenGui;
    local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_0.AspectRatio = 1;
    l_UIAspectRatioConstraint_0.Parent = l_Frame_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.CornerRadius = UDim.new(1, 0);
    l_UICorner_0.Parent = l_Frame_0;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Transparency = 0.5;
    l_UIStroke_0.Parent = l_Frame_0;
    return l_Frame_0;
end;
v3.makeNewPivotCircle = function(v21) --[[ Line: 152 ]] --[[ Name: makeNewPivotCircle ]]
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.Parent = v21._screenGui;
    l_Frame_1.Size = UDim2.new(0.01, 0, 0.01, 0);
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_1.BackgroundTransparency = 0.5;
    local l_UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint");
    l_UIAspectRatioConstraint_1.AspectRatio = 1;
    l_UIAspectRatioConstraint_1.Parent = l_Frame_1;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.CornerRadius = UDim.new(1, 0);
    l_UICorner_1.Parent = l_Frame_1;
    return l_Frame_1;
end;
v3.makeNewConnectingLine = function(v25) --[[ Line: 171 ]] --[[ Name: makeNewConnectingLine ]]
    local l_Frame_2 = Instance.new("Frame");
    l_Frame_2.Parent = v25._screenGui;
    l_Frame_2.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    return l_Frame_2;
end;
v3.updateControlCirclePos = function(_, v28, v29) --[[ Line: 180 ]] --[[ Name: updateControlCirclePos ]]
    v28.Position = UDim2.new(0, v29.x, 0, v29.y);
end;
v3.updateControlCircleColor = function(_, v31, v32) --[[ Line: 184 ]] --[[ Name: updateControlCircleColor ]]
    if v32 then
        v31.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
        return;
    else
        v31.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
        return;
    end;
end;
v3.updateConnectingLine = function(v33, v34, v35) --[[ Line: 192 ]] --[[ Name: updateConnectingLine ]]
    local l_Offset_0 = v33._pivot.Position.X.Offset;
    local l_Offset_1 = v33._pivot.Position.Y.Offset;
    local l_Offset_2 = v35.Position.X.Offset;
    local l_Offset_3 = v35.Position.Y.Offset;
    v34.Size = UDim2.new(0, math.sqrt((l_Offset_2 - l_Offset_0) ^ 2 + (l_Offset_3 - l_Offset_1) ^ 2), 0, 0.5);
    v34.Position = UDim2.new(0, (l_Offset_0 + l_Offset_2) / 2, 0, (l_Offset_1 + l_Offset_3) / 2);
    v34.Rotation = math.deg((math.atan2(l_Offset_3 - l_Offset_1, l_Offset_2 - l_Offset_0)));
end;
return v3;