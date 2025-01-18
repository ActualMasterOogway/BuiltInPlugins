local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.Constants);
local v2 = require(script.Parent.Internal.Mouse);
local v3 = require(script.Parent.Internal.ThemeChangeListener);
local v4 = require(script.Parent.Internal.Theme);
local v5 = nil;
local v6 = v0.PureComponent:extend("RoundTextButton");
v6.init = function(v7) --[[ Line: 39 ]] --[[ Name: init ]]
    v7.state = {
        Hovering = false, 
        Pressed = false
    };
    v7.mouseEnter = function() --[[ Line: 45 ]]
        -- upvalues: v7 (copy)
        if v7.props.Enabled then
            v7:mouseHoverChanged(true);
        end;
    end;
    v7.mouseLeave = function() --[[ Line: 51 ]]
        -- upvalues: v7 (copy)
        if v7.props.Enabled then
            v7:mouseHoverChanged(false);
            v7:setState({
                Pressed = false
            });
        end;
    end;
end;
v6.mouseHoverChanged = function(v8, v9) --[[ Line: 61 ]] --[[ Name: mouseHoverChanged ]]
    -- upvalues: v2 (copy)
    if v9 then
        v2.onEnter(v8.props.Mouse);
    else
        v2.onLeave(v8.props.Mouse);
    end;
    if v8.props.OnHoverChanged ~= nil then
        v8.props.OnHoverChanged(v8.props.Value, v9);
    end;
    v8:setState({
        Hovering = v9
    });
end;
v6.render = function(v10) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v5 (ref), v1 (copy), v0 (copy), v3 (copy)
    local function v20() --[[ Line: 78 ]] --[[ Name: renderInternal ]]
        -- upvalues: v10 (copy), v5 (ref), v1 (ref), v0 (ref)
        local l_Enabled_0 = v10.props.Enabled;
        local l_Hovering_0 = v10.state.Hovering;
        local v13 = v5(v10);
        local l_BorderMatchesBackground_0 = v10.props.BorderMatchesBackground;
        local v19 = {
            BackgroundTransparency = 1, 
            Image = v1.ROUNDED_BACKGROUND_IMAGE, 
            ImageTransparency = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v1.ROUNDED_FRAME_SLICE, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v10.props.Size or UDim2.new(0, v1.BUTTON_WIDTH, 0, v1.BUTTON_HEIGHT), 
            LayoutOrder = v10.props.LayoutOrder or 1, 
            ZIndex = v10.props.ZIndex or 1, 
            [v0.Event.MouseEnter] = v10.mouseEnter, 
            [v0.Event.MouseLeave] = v10.mouseLeave, 
            [v0.Event.Activated] = function() --[[ Line: 101 ]]
                -- upvalues: l_Enabled_0 (copy), v10 (ref)
                if l_Enabled_0 then
                    v10.props.OnClicked(v10.props.Value);
                end;
            end, 
            [v0.Event.InputBegan] = function(_, v16) --[[ Line: 107 ]]
                -- upvalues: l_Enabled_0 (copy), v10 (ref)
                if l_Enabled_0 and v16.UserInputType == Enum.UserInputType.MouseButton1 then
                    v10:setState({
                        Pressed = true
                    });
                end;
            end, 
            [v0.Event.InputEnded] = function(_, v18) --[[ Line: 115 ]]
                -- upvalues: l_Enabled_0 (copy), v10 (ref)
                if l_Enabled_0 and v18.UserInputType == Enum.UserInputType.MouseButton1 then
                    v10:setState({
                        Pressed = false
                    });
                end;
            end
        };
        if l_Enabled_0 then
            if v10.props.ShowPressed and v10.state.Pressed then
                v19.ImageColor3 = v13.ButtonPressedColor;
            else
                v19.ImageColor3 = l_Hovering_0 and v13.ButtonHoverColor or v13.ButtonColor;
            end;
        else
            v19.ImageColor3 = v13.ButtonDisabledColor;
        end;
        return v0.createElement("ImageButton", v19, {
            Border = v0.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = v1.ROUNDED_BORDER_IMAGE, 
                ImageColor3 = l_BorderMatchesBackground_0 and v19.ImageColor3 or v13.BorderColor, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v1.ROUNDED_FRAME_SLICE, 
                ZIndex = v10.props.ZIndex or 1
            }), 
            Text = v0.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Font = Enum.Font.SourceSans, 
                TextColor3 = l_Enabled_0 and v13.TextColor or v13.TextDisabledColor, 
                TextSize = 22, 
                Text = v10.props.Name, 
                ZIndex = v10.props.ZIndex or 1
            })
        });
    end;
    return v0.createElement(v3, {
        render = v20
    });
end;
v5 = function(v21) --[[ Line: 163 ]]
    -- upvalues: v4 (copy)
    local v22 = v4.getDefaultButtonProps();
    local v23 = {};
    for v24, v25 in pairs(v22) do
        v23[v24] = v21.props.Style and v21.props.Style[v24] or v25;
    end;
    return v23;
end;
return v6;