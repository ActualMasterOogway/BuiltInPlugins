local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_0.Utility.Colors);
local v4 = v2.PureComponent:extend("FloatingValueInput");
local v5 = Color3.fromRGB(0, 139, 234);
local v6 = {
    Dark = {
        Background = Color3.fromRGB(37, 37, 37), 
        Border = v3.BLACK, 
        BorderHover = v5, 
        BorderSelected = v5, 
        Text = v3.WHITE
    }, 
    Light = {
        Background = v3.WHITE, 
        Border = Color3.fromRGB(182, 182, 182), 
        BorderHover = v5, 
        BorderSelected = v5, 
        Text = v3.BLACK
    }
};
v4.init = function(v7) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v7:setState({
        focused = false, 
        hovered = false
    });
    v7._textboxRef = v2.createRef();
    v7.onFocused = function() --[[ Line: 47 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            focused = true
        });
    end;
    v7.onFocusLost = function(v8, v9) --[[ Line: 52 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            focused = false
        });
        if v9 and not v7.props.OnChanged(v8.Text) then
            v8.Text = v7.props.Value;
        end;
    end;
    v7.onInputEnded = function(v10, v11) --[[ Line: 63 ]]
        if v11.UserInputType == Enum.UserInputType.MouseButton1 or v11.UserInputType == Enum.UserInputType.Touch then
            v10.SelectionStart = 0;
            v10.CursorPosition = #v10.Text + 1;
        end;
    end;
    v7.mouseEnter = function(_) --[[ Line: 72 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            hovered = true
        });
    end;
    v7.mouseLeave = function(_) --[[ Line: 77 ]]
        -- upvalues: v7 (copy)
        v7:setState({
            hovered = false
        });
    end;
end;
v4.willUnmount = function(v14) --[[ Line: 84 ]] --[[ Name: willUnmount ]]
    if v14.props.OnHidden then
        v14.props.OnHidden();
    end;
end;
v4.render = function(v15) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v2 (copy)
    local l_props_0 = v15.props;
    local l_state_0 = v15.state;
    local l_DraggerContext_0 = l_props_0.DraggerContext;
    if not l_props_0.Position then
        return nil;
    else
        local v19 = v6[l_DraggerContext_0:getTheme()];
        local v20 = nil;
        v20 = if l_state_0.focused then v19.BorderSelected else if l_state_0.hovered then v19.BorderHover else v19.Border;
        local v21 = nil;
        v21 = if l_props_0.OnChanged then v2.createElement("TextBox", {
            ClearTextOnFocus = false, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_props_0.Value, 
            Font = Enum.Font.SourceSansBold, 
            TextSize = 24, 
            BackgroundTransparency = 1, 
            TextColor3 = v19.Text, 
            Active = true, 
            [v2.Event.Focused] = v15.onFocused, 
            [v2.Event.FocusLost] = v15.onFocusLost, 
            [v2.Event.InputEnded] = v15.onInputEnded, 
            [v2.Event.MouseEnter] = v15.mouseEnter, 
            [v2.Event.MouseLeave] = v15.mouseLeave, 
            [v2.Ref] = v15._textboxRef, 
            ZIndex = 2
        }) else v2.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = l_props_0.Value, 
            BackgroundTransparency = 1, 
            Font = Enum.Font.SourceSansBold, 
            TextSize = 24, 
            BorderSizePixel = 0, 
            TextColor3 = v19.Text, 
            ZIndex = 2
        });
        return v2.createElement(v2.Portal, {
            target = l_props_0.DraggerContext:getGuiParent()
        }, {
            FloatingValueInput = v2.createElement("ScreenGui", {
                IgnoreGuiInset = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            }, {
                Background = v2.createElement("ImageLabel", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = l_props_0.Position, 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Image = "rbxasset://textures/StudioToolbox/RoundedBackground.png", 
                    SliceCenter = Rect.new(3, 3, 13, 13), 
                    ScaleType = Enum.ScaleType.Slice, 
                    ImageColor3 = v19.Background, 
                    BackgroundTransparency = 1, 
                    ZIndex = 0
                }, {
                    Border = v2.createElement("ImageLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Image = "rbxasset://textures/StudioToolbox/RoundedBorder.png", 
                        SliceCenter = Rect.new(3, 3, 13, 13), 
                        ScaleType = Enum.ScaleType.Slice, 
                        ImageColor3 = v20, 
                        BackgroundTransparency = 1, 
                        ZIndex = 1
                    }, {
                        v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 4), 
                            PaddingRight = UDim.new(0, 4), 
                            PaddingTop = UDim.new(0, 2), 
                            PaddingBottom = UDim.new(0, 4)
                        }); 
                        Label = v21
                    })
                })
            })
        });
    end;
end;
return v4;