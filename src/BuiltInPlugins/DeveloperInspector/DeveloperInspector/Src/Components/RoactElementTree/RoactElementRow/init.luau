local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Util.getInspectorIcon);
local l_TweenService_0 = game:GetService("TweenService");
local l_mapOne_0 = require(l_Parent_0.Packages.Dash).mapOne;
local v6 = v2.PureComponent:extend("RoactElementRow");
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
v6.init = function(v10) --[[ Line: 23 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v10.state = {
        isHovering = false
    };
    v10.containerRef = v2.createRef();
    v10.onMouseEnter = function() --[[ Line: 30 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            isHovering = true
        });
        v10.props.OnEnterRow(v10.props.Row);
    end;
    v10.onMouseLeave = function() --[[ Line: 37 ]]
        -- upvalues: v10 (copy)
        v10:setState({
            isHovering = false
        });
        v10.props.OnLeaveRow(v10.props.Row);
    end;
    v10.onInputBegan = function(_, v12) --[[ Line: 44 ]]
        -- upvalues: v10 (copy)
        if v12.UserInputType == Enum.UserInputType.MouseButton1 then
            v10.props.OnSelect(v10.props.Row);
        end;
    end;
    v10.onToggle = function() --[[ Line: 50 ]]
        -- upvalues: v10 (copy)
        v10.props.OnToggle(v10.props.Row);
    end;
end;
v6.didUpdate = function(v13) --[[ Line: 55 ]] --[[ Name: didUpdate ]]
    if v13:isFlashing() then
        v13:flash(v13.props.Flash.heat);
    end;
end;
v6.isFlashing = function(v14) --[[ Line: 61 ]] --[[ Name: isFlashing ]]
    local l_Flash_0 = v14.props.Flash;
    if l_Flash_0 and os.clock() - l_Flash_0.time < 1 then
        return true;
    else
        return false;
    end;
end;
v6.flash = function(v16, v17) --[[ Line: 73 ]] --[[ Name: flash ]]
    -- upvalues: l_TweenService_0 (copy)
    local v18 = v16.containerRef:getValue();
    if not v18 then
        return;
    else
        if v16.flashTween then
            v16.flashTween:Cancel();
        end;
        local v19 = TweenInfo.new(1, Enum.EasingStyle.Linear);
        v16.flashTween = l_TweenService_0:create(v18, v19, {
            BackgroundColor3 = v16.props.Style.BackgroundColor
        });
        local v20 = math.max(0, 255 - v17 * 10);
        v18.BackgroundColor3 = Color3.fromRGB(255, v20, 100);
        v16.flashTween:Play();
        return;
    end;
end;
v6.render = function(v21) --[[ Line: 94 ]] --[[ Name: render ]]
    -- upvalues: l_mapOne_0 (copy), v3 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v21.props;
    local l_Style_0 = l_props_0.Style;
    local l_IsExpanded_0 = l_props_0.IsExpanded;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local l_Row_0 = l_props_0.Row;
    local l_item_0 = l_Row_0.item;
    local v28 = l_item_0.Children and l_mapOne_0(l_item_0.Children) ~= nil;
    local v29 = l_Row_0.depth * l_Style_0.Indent;
    local l_Size_0 = l_Style_0.Arrow.Size;
    local l_IconPadding_0 = l_Style_0.IconPadding;
    local v32 = v3(l_item_0.Icon);
    local v33 = v32.ImageRectSize or Vector2.new();
    local v34 = v29 + l_Size_0 + 2 * l_IconPadding_0;
    local v35 = v33.X + 3 * l_IconPadding_0;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.X, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        LayoutOrder = l_Row_0.index, 
        [v2.Ref] = v21.containerRef
    }, {
        Toggle = v28 and v2.createElement("ImageButton", {
            Position = UDim2.new(0, v29 + l_IconPadding_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(0, l_Size_0, 0, l_Size_0), 
            BackgroundTransparency = 1, 
            Image = l_Style_0.Arrow.Image, 
            ImageColor3 = l_Style_0.Arrow.Color, 
            ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
            ImageRectOffset = l_IsExpanded_0 and l_Style_0.Arrow.ExpandedOffset or l_Style_0.Arrow.CollapsedOffset, 
            [v2.Event.Activated] = v21.onToggle
        }) or nil, 
        Label = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            [v2.Event.MouseEnter] = v21.onMouseEnter, 
            [v2.Event.MouseLeave] = v21.onMouseLeave, 
            [v2.Event.InputBegan] = v21.onInputBegan, 
            BackgroundTransparency = v21.state.isHovering or l_IsSelected_0 and 0 or 1, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_IsSelected_0 and l_Style_0.SelectedColor or l_Style_0.HoverColor, 
            Position = UDim2.fromOffset(v34, 0), 
            Size = UDim2.fromScale(0, 1)
        }, {
            Icon = v2.createElement("ImageLabel", {
                Size = UDim2.fromOffset(v33.X, v33.Y), 
                BackgroundTransparency = 1, 
                Image = v32.Image, 
                ImageRectSize = v33, 
                ImageRectOffset = v32.ImageRectOffset, 
                Position = UDim2.new(0, l_IconPadding_0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5)
            }), 
            Text = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                Style = l_Style_0.Text, 
                Text = tostring(l_item_0.Name), 
                TextColor = l_IsSelected_0 and l_Style_0.SelectedTextColor or nil, 
                Size = UDim2.fromScale(0, 1), 
                Position = UDim2.new(0, v35, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    });
end;
return v6;