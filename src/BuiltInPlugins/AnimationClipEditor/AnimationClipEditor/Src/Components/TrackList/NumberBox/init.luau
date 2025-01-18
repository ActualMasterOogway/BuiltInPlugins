local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Components.DragListenerArea);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Pane_0 = v5.UI.Pane;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v10 = v1.PureComponent:extend("NumberBox");
v10.init = function(v11) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v11.state = {
        focused = false
    };
    v11.getTextWidth = function(v12, v13) --[[ Line: 51 ]]
        -- upvalues: v2 (ref)
        local l_font_0 = v13.font;
        local l_textSize_0 = v13.trackTheme.textSize;
        return v2.getTextWidth(v12, l_textSize_0, l_font_0);
    end;
    v11.focusChanged = function(v16, v17, v18) --[[ Line: 57 ]]
        -- upvalues: v11 (copy)
        v11:setState({
            focused = v17
        });
        if not v17 then
            if v18 then
                local v19 = tonumber(v16.Text);
                if v19 and v11.props.SetNumber then
                    local v20 = v11.props.SetNumber(v19);
                    if v20 then
                        v16.Text = v11:formatNumber(v20);
                        return;
                    end;
                else
                    v16.Text = v11.props.Number;
                    return;
                end;
            else
                v16.Text = v11.props.Number;
            end;
        end;
    end;
    v11.onDragMoved = function(v21) --[[ Line: 80 ]]
        -- upvalues: v11 (copy)
        if v11.props.OnDragMoved then
            v11.props.OnDragMoved(v21);
        end;
    end;
    v11.onDragBegan = function(v22) --[[ Line: 86 ]]
        -- upvalues: v11 (copy)
        if v11.props.OnDragBegan then
            v11.props.OnDragBegan(v22);
        end;
    end;
end;
v10.formatNumber = function(v23, v24) --[[ Line: 93 ]] --[[ Name: formatNumber ]]
    -- upvalues: v3 (copy)
    local v25 = v23.props.Precision or v3.NUMBER_PRECISION;
    return (tostring(math.floor(0.5 + v24 * v25) / v25));
end;
v10.render = function(v26) --[[ Line: 98 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v4 (copy), v9 (copy)
    local l_props_0 = v26.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_textBox_0 = l_Stylizer_0.textBox;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_state_0 = v26.state;
    local l_Name_0 = l_props_0.Name;
    local l_Color_0 = l_props_0.Color;
    local l_Size_0 = l_props_0.Size;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Number_0 = l_props_0.Number;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ReadOnly_0 = l_props_0.ReadOnly;
    local v40 = l_state_0.focused and l_textBox_0.focusedBorder or l_textBox_0.defaultBorder;
    local v41 = v26.getTextWidth(l_Name_0, l_Stylizer_0) + 12;
    return v1.createElement(l_Pane_0, {
        Style = "BorderBox", 
        Size = l_Size_0, 
        Position = l_Position_0, 
        ZIndex = 2, 
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundColor3 = l_textBox_0.backgroundColor, 
        BorderColor3 = v40, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        LabelFrame = v1.createElement(l_Pane_0, {
            Style = "BorderBox", 
            Size = UDim2.new(0, v41, 1, 0), 
            BackgroundColor3 = l_trackTheme_0.shadedBackgroundColor, 
            BorderColor3 = v40, 
            LayoutOrder = 1
        }, {
            NameLabel = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 2, 
                Text = l_Name_0, 
                Font = l_Stylizer_0.font, 
                TextSize = l_trackTheme_0.textSize, 
                TextColor3 = l_Color_0 or l_trackTheme_0.textColor, 
                TextXAlignment = Enum.TextXAlignment.Center
            }), 
            LeftBorderOverlay = v1.createElement("Frame", {
                Size = UDim2.new(0, 5, 1, -2), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundColor3 = l_trackTheme_0.shadedBackgroundColor, 
                BorderSizePixel = 0
            }), 
            RightBorderOverlay = v1.createElement("Frame", {
                Size = UDim2.new(0, 5, 1, -2), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundColor3 = l_textBox_0.backgroundColor, 
                BorderSizePixel = 0
            }), 
            DragArea = not l_ReadOnly_0 and v1.createElement(v4, {
                Size = UDim2.new(1, 0, 1, 0), 
                Cursor = "SizeEW", 
                OnDragMoved = v26.onDragMoved, 
                OnDragBegan = v26.onDragBegan
            }) or nil
        }), 
        TextBox = v1.createElement(v9, {
            Size = UDim2.new(1, -v41, 1, 0), 
            Text = v26:formatNumber(l_Number_0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ReadOnly = l_ReadOnly_0, 
            LayoutOrder = 2, 
            ClearTextOnFocus = false, 
            FocusChanged = v26.focusChanged
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));