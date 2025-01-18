local v0 = {};
local v1 = require(script.Parent.CoreGuiManager);
local l_TextService_0 = game:GetService("TextService");
local v3 = Vector2.new(12, 4);
v0.getSize = function(v4) --[[ Line: 24 ]] --[[ Name: getSize ]]
    return v4.m_imageLabel.Size;
end;
v0.setPosition = function(v5, v6) --[[ Line: 29 ]] --[[ Name: setPosition ]]
    v5.m_imageLabel.Position = v6;
end;
v0.setAnchorPoint = function(v7, v8) --[[ Line: 34 ]] --[[ Name: setAnchorPoint ]]
    v7.m_imageLabel.AnchorPoint = v8;
end;
local function _(v9) --[[ Line: 41 ]] --[[ Name: calcTextSize ]]
    -- upvalues: l_TextService_0 (copy)
    return l_TextService_0:GetTextSize(v9.Text, v9.TextSize, v9.Font, Vector2.new(0, 0));
end;
v0.setText = function(v11, v12) --[[ Line: 46 ]] --[[ Name: setText ]]
    -- upvalues: v1 (copy), l_TextService_0 (copy), v3 (copy)
    local v13 = v1:findOrCreateScreenGui("ValueBoxes");
    v11.m_textLabel.Text = v12;
    local v14 = math.clamp(0.025 * v13.AbsoluteSize.Y, 12, 15);
    v11.m_textLabel.TextSize = v14;
    local l_m_textLabel_0 = v11.m_textLabel;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_m_textLabel_0.Text, l_m_textLabel_0.TextSize, l_m_textLabel_0.Font, Vector2.new(0, 0));
    l_m_textLabel_0 = math.clamp(0.008571428571428572 * v13.AbsoluteSize.X, 0, v3.X);
    local v17 = l_m_textLabel_0 / v3.X * v3.Y;
    v11.m_textLabel.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
    local v18 = l_l_TextService_0_TextSize_0.X + 2 * l_m_textLabel_0;
    local v19 = l_l_TextService_0_TextSize_0.Y + 2 * v17;
    v11.m_imageLabel.Size = UDim2.new(0, v18, 0, v19);
end;
v0.setVisible = function(v20, v21) --[[ Line: 72 ]] --[[ Name: setVisible ]]
    v20.m_imageLabel.Visible = v21;
    v20.m_textLabel.Visible = v21;
end;
local function v24() --[[ Line: 78 ]] --[[ Name: createImageLabel ]]
    -- upvalues: v1 (copy)
    local l_ImageLabel_0 = Instance.new("ImageLabel");
    l_ImageLabel_0.Name = "UIEditorValueBoxImageLabel";
    local v23 = v1:findOrCreateScreenGui("ValueBoxes");
    v23.DisplayOrder = 1;
    l_ImageLabel_0.Parent = v23;
    l_ImageLabel_0.BackgroundTransparency = 1;
    l_ImageLabel_0.Image = "rbxasset://textures/StudioUIEditor/valueBoxRoundedRectangle.png";
    l_ImageLabel_0.ImageColor3 = Color3.fromRGB(255, 205, 0);
    l_ImageLabel_0.ScaleType = Enum.ScaleType.Slice;
    l_ImageLabel_0.SliceCenter = Rect.new(3, 3, 13, 13);
    return l_ImageLabel_0;
end;
local function v26() --[[ Line: 98 ]] --[[ Name: createTextLabel ]]
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "UIEditorValueBoxTexLabel";
    l_TextLabel_0.TextColor3 = Color3.new(0, 0, 0);
    l_TextLabel_0.BackgroundColor3 = Color3.fromRGB(118, 118, 118);
    l_TextLabel_0.BackgroundTransparency = 1;
    l_TextLabel_0.BorderSizePixel = 0;
    l_TextLabel_0.Font = Enum.Font.SourceSans;
    l_TextLabel_0.TextXAlignment = Enum.TextXAlignment.Center;
    l_TextLabel_0.TextYAlignment = Enum.TextYAlignment.Center;
    l_TextLabel_0.TextSize = 15;
    l_TextLabel_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_TextLabel_0.Position = UDim2.new(0.5, 0, 0.5, -2);
    return l_TextLabel_0;
end;
v0.new = function(v27) --[[ Line: 119 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy), v26 (copy), v0 (copy)
    local v28 = {
        m_imageLabel = v24()
    };
    if v27 ~= nil then
        v28.m_imageLabel.Parent = v27;
    end;
    v28.m_textLabel = v26();
    v28.m_textLabel.Parent = v28.m_imageLabel;
    return (setmetatable(v28, v0));
end;
v0.__index = v0;
v0.Destroy = function(v29) --[[ Line: 135 ]] --[[ Name: Destroy ]]
    v29.m_imageLabel:Destroy();
end;
return v0;