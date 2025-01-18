local l_TextService_0 = game:GetService("TextService");
local v1 = require(script.Parent.Internal.RequireRoact);
local v2 = require(script.Parent.Internal.Constants);
local v3 = require(script.Parent.Internal.ThemeChangeListener);
local v4 = require(script.Parent.Internal.Theme);
local v5 = require(script.Parent.Internal.Mouse);
local v6 = nil;
local v7 = v1.PureComponent:extend("RadioButton");
v7.init = function(v8, v9) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), l_TextService_0 (copy)
    v8.mouseEnter = function() --[[ Line: 36 ]]
        -- upvalues: v8 (copy), v5 (ref)
        if v8.props.Enabled then
            v5.onEnter(v8.props.Mouse);
        end;
    end;
    v8.mouseLeave = function() --[[ Line: 42 ]]
        -- upvalues: v8 (copy), v5 (ref)
        if v8.props.Enabled then
            v5.onLeave(v8.props.Mouse);
        end;
    end;
    local l_Title_0 = v9.Title;
    local v11 = v9.Description or "";
    v8.state = {
        TitleWidth = l_TextService_0:GetTextSize(l_Title_0, 22, Enum.Font.SourceSans, Vector2.new()).X, 
        DescriptionWidth = l_TextService_0:GetTextSize(v11, 16, Enum.Font.SourceSans, Vector2.new()).X
    };
end;
v7.render = function(v12) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v6 (ref), v1 (copy), v2 (copy), v4 (copy), v3 (copy)
    local function v19() --[[ Line: 66 ]] --[[ Name: renderInternal ]]
        -- upvalues: v12 (copy), v6 (ref), v1 (ref), v2 (ref), v4 (ref)
        local l_Title_1 = v12.props.Title;
        local v14 = v12.props.Description or "";
        local l_TitleWidth_0 = v12.state.TitleWidth;
        local l_DescriptionWidth_0 = v12.state.DescriptionWidth;
        local v17 = v12.props.Description and true or false;
        local v18 = v6(v12);
        return v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v2.RADIO_BUTTON_SIZE * (v17 and 2 or 1)), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Button = v1.createElement("ImageButton", {
                Size = UDim2.new(0, v2.RADIO_BUTTON_SIZE, 0, v2.RADIO_BUTTON_SIZE), 
                BackgroundTransparency = 1, 
                ImageTransparency = v12.props.Enabled and 0 or 0.4, 
                Image = "rbxasset://textures/GameSettings/RadioButton.png", 
                ImageColor3 = v18.BackgroundColor, 
                LayoutOrder = v12.props.LayoutOrder or 1, 
                [v1.Event.MouseEnter] = v12.mouseEnter, 
                [v1.Event.MouseLeave] = v12.mouseLeave, 
                [v1.Event.Activated] = function() --[[ Line: 92 ]]
                    -- upvalues: v12 (ref)
                    if v12.props.Enabled then
                        v12.props.OnClicked();
                    end;
                end
            }, {
                Highlight = v1.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Size = v4.isDarkerTheme() and UDim2.new(0.4, 0, 0.4, 0) or UDim2.new(0.5, 0, 0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Visible = v12.props.Enabled and v12.props.Selected, 
                    Image = "rbxasset://textures/ui/LuaApp/icons/ic-blue-dot.png"
                }), 
                TitleLabel = v1.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, l_TitleWidth_0, 1, 0), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(1, 5, 0.5, 0), 
                    TextColor3 = v18.TextColor, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 22, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = v12.props.Enabled and 0 or 0.5, 
                    Text = l_Title_1, 
                    [v1.Event.MouseEnter] = v12.mouseEnter, 
                    [v1.Event.MouseLeave] = v12.mouseLeave, 
                    [v1.Event.Activated] = function() --[[ Line: 125 ]]
                        -- upvalues: v12 (ref)
                        if v12.props.Enabled then
                            v12.props.OnClicked();
                        end;
                    end
                }), 
                DescriptionLabel = v17 and v1.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Size = UDim2.new(0, l_DescriptionWidth_0, 1, 0), 
                    Position = UDim2.new(1, 5, 1, 1), 
                    TextColor3 = v18.TextDescriptionColor, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 16, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top, 
                    Text = v14, 
                    [v1.Event.MouseEnter] = v12.mouseEnter, 
                    [v1.Event.MouseLeave] = v12.mouseLeave, 
                    [v1.Event.Activated] = function() --[[ Line: 148 ]]
                        -- upvalues: v12 (ref)
                        if v12.props.Enabled then
                            v12.props.OnClicked();
                        end;
                    end
                }) or nil
            })
        });
    end;
    return v1.createElement(v3, {
        render = v19
    });
end;
v6 = function(v20) --[[ Line: 163 ]]
    -- upvalues: v4 (copy)
    local v21 = {
        BackgroundColor = v4.getBackgroundColor(), 
        TextColor = v4.getRadioButtonTextColor(), 
        TextDescriptionColor = v4.getTextDescriptionColor()
    };
    local v22 = {};
    for v23, v24 in pairs(v21) do
        v22[v23] = v20.props.Style and v20.props.Style[v23] or v24;
    end;
    return v22;
end;
return v7;