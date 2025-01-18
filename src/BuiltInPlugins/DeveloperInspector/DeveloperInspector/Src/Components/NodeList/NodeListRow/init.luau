local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Util.getInspectorIcon);
local l_TweenService_0 = game:GetService("TweenService");
local l_join_0 = require(l_Parent_0.Packages.Dash).join;
local v6 = v2.PureComponent:extend("NodeListRow");
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextLabel_0 = l_UI_0.TextLabel;
v6.init = function(v11) --[[ Line: 24 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v11.containerRef = v2.createRef();
    v11.state = {
        isHovering = false
    };
    v11.onMouseEnter = function() --[[ Line: 31 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            isHovering = true
        });
    end;
    v11.onMouseLeave = function() --[[ Line: 37 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            isHovering = false
        });
    end;
    v11.onInputBegan = function(_, v13) --[[ Line: 43 ]]
        -- upvalues: v11 (copy)
        if v13.UserInputType == Enum.UserInputType.MouseButton1 then
            v11.props.OnSelect(v11.props.Index);
        end;
    end;
    v11.onClick = function() --[[ Line: 49 ]]
        -- upvalues: v11 (copy)
        v11.props.OnClickLink(v11.props.Index);
    end;
end;
v6.didUpdate = function(v14) --[[ Line: 54 ]] --[[ Name: didUpdate ]]
    if v14.props.Flash then
        v14:flash(v14.props.Flash.heat);
    end;
end;
v6.flash = function(v15, v16) --[[ Line: 60 ]] --[[ Name: flash ]]
    -- upvalues: l_TweenService_0 (copy)
    local v17 = v15.containerRef:getValue();
    if not v17 then
        return;
    else
        if v15.flashTween then
            v15.flashTween:Cancel();
        end;
        if v15.props.IsSelected then
            return;
        else
            local v18 = TweenInfo.new(1, Enum.EasingStyle.Linear);
            v15.flashTween = l_TweenService_0:create(v17, v18, {
                BackgroundColor3 = v15.props.Style.BackgroundColor
            });
            local v19 = math.max(0, 255 - v16 * 10);
            v17.BackgroundColor3 = Color3.fromRGB(255, v19, 100);
            v15.flashTween:Play();
            return;
        end;
    end;
end;
v6.render = function(v20) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_join_0 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy)
    local l_props_0 = v20.props;
    local l_state_0 = v20.state;
    local l_Style_0 = l_props_0.Style;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local l_IconPadding_0 = l_Style_0.IconPadding;
    local v26 = v3(l_props_0.Icon);
    local l_X_0 = v26.ImageRectSize.X;
    local v28 = l_X_0 + 3 * l_IconPadding_0;
    local v29 = l_IsSelected_0 and l_Style_0.SelectedColor or l_state_0.isHovering and l_Style_0.HoverColor or l_Style_0.BackgroundColor;
    local v30 = l_IsSelected_0 and l_Style_0.SelectedTextColor or nil;
    local v31 = l_join_0(l_Style_0.Link, {
        TextColor = v30
    });
    return v2.createElement(l_Pane_0, {
        [v2.Event.MouseEnter] = v20.onMouseEnter, 
        [v2.Event.MouseLeave] = v20.onMouseLeave, 
        [v2.Event.InputBegan] = v20.onInputBegan, 
        [v2.Ref] = v20.containerRef, 
        LayoutOrder = l_props_0.Index, 
        BackgroundColor3 = v29, 
        Size = UDim2.new(1, 0, 0, l_Style_0.RowHeight)
    }, {
        Icon = v2.createElement("ImageLabel", {
            Size = UDim2.fromOffset(l_X_0, v26.ImageRectSize.Y), 
            BackgroundTransparency = 1, 
            Image = v26.Image, 
            ImageRectSize = v26.ImageRectSize, 
            ImageRectOffset = v26.ImageRectOffset, 
            Position = UDim2.new(0, l_IconPadding_0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5)
        }), 
        Text = v2.createElement(l_TextLabel_0, {
            Style = l_Style_0.Text, 
            Text = l_props_0.Name, 
            TextColor = v30, 
            Size = UDim2.new(1, 0, 0, l_Style_0.RowHeight), 
            Position = UDim2.fromOffset(v28, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Link = v2.createElement(l_LinkText_0, {
            OnClick = v20.onClick, 
            Style = v31, 
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, -10, 0, 0), 
            Text = v20.props.LinkText, 
            Size = UDim2.new(1, 0, 0, l_Style_0.RowHeight), 
            TextXAlignment = Enum.TextXAlignment.Right, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    });
end;
return v6;