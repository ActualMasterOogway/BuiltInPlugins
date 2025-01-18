local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = game:DefineFastFlag("LocalizationToolsFixLabeledImageButton", false);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v10 = v1.PureComponent:extend("LabeledImageButton");
v10.init = function(v11) --[[ Line: 21 ]] --[[ Name: init ]]
    v11.state = {
        hovered = false
    };
    v11.onMouseEnter = function() --[[ Line: 26 ]]
        -- upvalues: v11 (copy)
        if not v11.props.Active then
            return;
        else
            v11:setState({
                hovered = true
            });
            return;
        end;
    end;
    v11.onMouseLeave = function() --[[ Line: 38 ]]
        -- upvalues: v11 (copy)
        if not v11.props.Active then
            return;
        else
            v11:setState({
                hovered = false
            });
            return;
        end;
    end;
end;
v10.render = function(v12) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v12.props;
    local l_state_0 = v12.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LabelText_0 = l_props_0.LabelText;
    local l_ButtonText_0 = l_props_0.ButtonText;
    local l_ButtonImage_0 = l_props_0.ButtonImage;
    local l_Active_0 = l_props_0.Active;
    local v21 = l_Active_0 and l_props_0.OnButtonClick or function() --[[ Line: 60 ]]

    end;
    local l_hovered_0 = l_state_0.hovered;
    return v1.createElement("Frame", {
        AutomaticSize = if v3 then Enum.AutomaticSize.XY else nil, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            AutomaticSize = if v3 then Enum.AutomaticSize.Y else nil, 
            LayoutOrder = 1, 
            Size = if v3 then UDim2.new(0, l_Stylizer_0.LabelWidth, 0, 0) else UDim2.new(0, l_Stylizer_0.LabelWidth, 1, 0), 
            Text = l_LabelText_0, 
            StyleModifier = if l_Active_0 then nil else l_StyleModifier_0.Disabled, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        Button = v1.createElement("ImageButton", {
            AutoButtonColor = false, 
            AutomaticSize = if v3 then Enum.AutomaticSize.XY else nil, 
            BackgroundColor3 = l_hovered_0 and l_Stylizer_0.BackgroundColorHovered or l_Stylizer_0.BackgroundColor, 
            BorderSizePixel = 0, 
            LayoutOrder = 2, 
            Size = if v3 then UDim2.new(0, l_Stylizer_0.ImageButtonSize, 0, 0) else UDim2.new(0, l_Stylizer_0.ImageButtonSize, 0, l_Stylizer_0.ImageButtonSize), 
            [v1.Event.Activated] = v21, 
            [v1.Event.MouseEnter] = v12.onMouseEnter, 
            [v1.Event.MouseLeave] = v12.onMouseLeave
        }, {
            Layout = if v3 then v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }) else nil, 
            ImageLabel = v1.createElement("ImageLabel", {
                Position = if v3 then nil else UDim2.new(0.5, 0, 0, l_Stylizer_0.ImageLabelSize / 2), 
                AnchorPoint = if v3 then nil else Vector2.new(0.5, 0.5), 
                Size = UDim2.new(0, l_Stylizer_0.ImageLabelSize, 0, l_Stylizer_0.ImageLabelSize), 
                Image = l_ButtonImage_0, 
                BackgroundTransparency = 1
            }), 
            TextLabel = v1.createElement(l_TextLabel_0, {
                AutomaticSize = if v3 then Enum.AutomaticSize.Y else nil, 
                Position = if v3 then nil else UDim2.new(0.5, 0, 1, -l_Stylizer_0.TextLabelSize / 2), 
                AnchorPoint = if v3 then nil else Vector2.new(0.5, 0.5), 
                Size = if v3 then UDim2.new(0, l_Stylizer_0.ImageButtonSize, 0, 0) else UDim2.new(1, 0, 0, l_Stylizer_0.TextLabelSize), 
                LayoutOrder = v3 and 2 or nil, 
                Text = l_ButtonText_0, 
                StyleModifier = if l_Active_0 then nil else l_StyleModifier_0.Disabled, 
                Style = "Label", 
                TextWrapped = true
            }); 
            if v3 then nil else v1.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));