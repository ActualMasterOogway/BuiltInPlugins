local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.Styling.joinTags);
local v8 = require(l_Parent_0.UI.Components.TextLabel.styles);
local v9 = require(script.styles);
local l_v9_Attribute_0 = v9:GetAttribute("ArrowSize");
local l_v9_Attribute_1 = v9:GetAttribute("Spacing");
local v12 = require(l_Parent_0.UI.Components.Image);
local v13 = require(l_Parent_0.UI.Components.Pane);
local v14 = require(l_Parent_0.UI.Components.TextLabel);
local v15 = require(l_Parent_0.Util.prioritize);
local v16 = require(l_Parent_0.Util.LayoutOrderIterator);
local v17 = require(l_Parent_0.Util.StyleModifier);
local v18 = require(l_Parent_0.Util.Typecheck);
local v19 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v19.join;
local l_omit_0 = v19.omit;
local v22 = Vector2.new();
local v23 = v2.PureComponent:extend("ExpandablePane");
v18.wrap(v23, script);
v23.defaultProps = l_join_0({
    AlwaysExpanded = false, 
    AutomaticSize = if v6 then nil else Enum.AutomaticSize.Y, 
    Expanded = false, 
    HeaderComponentProps = {}, 
    Layout = if v6 then nil else Enum.FillDirection.Vertical, 
    HorizontalAlignment = if v6 then nil else Enum.HorizontalAlignment.Center, 
    VerticalAlignment = if v6 then nil else Enum.VerticalAlignment.Center, 
    PutHeaderLast = false
}, if v6 then {
    [v5.Tag] = "X-Pad X-ColumnM X-FitY"
} else nil);
v23.getTagFromDeprecatedProps = function(v24) --[[ Line: 89 ]] --[[ Name: getTagFromDeprecatedProps ]]
    -- upvalues: v7 (copy)
    local v25 = nil;
    if v24.AutomaticSize == Enum.AutomaticSize.X then
        v25 = "X-FitX";
    elseif v24.AutomaticSize == Enum.AutomaticSize.Y then
        v25 = "X-FitY";
    elseif v24.AutomaticSize == Enum.AutomaticSize.XY then
        v25 = "X-Fit";
    end;
    local v26 = nil;
    if v24.HorizontalAlignment == Enum.HorizontalAlignment.Left then
        v26 = "X-Left";
    elseif v24.HorizontalAlignment == Enum.HorizontalAlignment.Center then
        v26 = "X-Center";
    elseif v24.HorizontalAlignment == Enum.HorizontalAlignment.Right then
        v26 = "X-Right";
    end;
    local v27 = nil;
    if v24.VerticalAlignment == Enum.VerticalAlignment.Top then
        v27 = "X-Top";
    elseif v24.VerticalAlignment == Enum.VerticalAlignment.Center then
        v27 = "X-Middle";
    elseif v24.VerticalAlignment == Enum.VerticalAlignment.Bottom then
        v27 = "X-Bottom";
    end;
    local v28 = nil;
    if v24.Layout == Enum.FillDirection.Vertical then
        v28 = "X-Column";
    elseif v24.Layout == Enum.FillDirection.Horizontal then
        v28 = "X-Row";
    end;
    if v28 and v24.Spacing then
        v28 = v28 .. "M";
    end;
    local v29 = nil;
    if v24.Padding then
        v29 = "X-Pad";
    end;
    return v7(v25, v26, v27, v28, v29);
end;
v23.render = function(v30) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v5 (copy), v7 (copy), v23 (ref), l_join_0 (copy), l_omit_0 (copy), v2 (copy), v15 (copy), v13 (copy)
    local l_props_0 = v30.props;
    local v32 = if v6 then l_props_0.Style or {} else l_props_0.Stylizer;
    local v33 = l_props_0.AlwaysExpanded or l_props_0.Expanded;
    local v34 = if v6 then l_props_0[v5.Tag] or "X-ColumnM X-FitY" else nil;
    local v35 = if v6 then v7(l_props_0[v5.Tag], v23.getTagFromDeprecatedProps({
        AutomaticSize = l_props_0.AutomaticSize, 
        Padding = l_props_0.ContentPadding, 
        Spacing = l_props_0.ContentSpacing, 
        HorizontalAlignment = l_props_0.HorizontalAlignment, 
        VerticalAlignment = l_props_0.VerticalAlignment, 
        Layout = l_props_0.Layout
    })) else nil;
    local v36 = l_join_0(l_props_0, if v6 then {
        [v5.Tag] = v7("Component-ExpandablePane", v34, v33 and "Expanded" or nil)
    } else {
        BackgroundColor = v32.BackgroundColor, 
        BorderColor = v32.BorderColor, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = v32.Padding, 
        Style = v32
    });
    v36 = l_omit_0(v36, {
        v2.Children, 
        "AlwaysExpanded", 
        "ContentPadding", 
        "Expanded", 
        "HeaderComponent", 
        "HeaderComponentProps", 
        "HeaderOverride", 
        "HorizontalAlignment", 
        "OnExpandedChanged", 
        "Text", 
        "ContentSpacing", 
        "PutHeaderLast"
    });
    local v37 = if v6 then nil else v15(l_props_0.ContentPadding, v32.Content.Padding);
    local v38 = if v6 then nil else v15(l_props_0.ContentSpacing, v32.Content.Spacing);
    local v39 = l_props_0.PutHeaderLast and 1 or 2;
    return v2.createElement(v13, v36, {
        Header = l_props_0.HeaderOverride or v30:_renderHeader(), 
        Content = v33 and v2.createElement(v13, if v6 then {
            LayoutOrder = v39, 
            [v5.Tag] = v35
        } else {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = l_props_0.Layout, 
            LayoutOrder = v39, 
            Padding = v37, 
            Spacing = v38, 
            HorizontalAlignment = l_props_0.HorizontalAlignment, 
            VerticalAlignment = l_props_0.VerticalAlignment
        }, l_props_0[v2.Children])
    });
end;
v23._computeHeaderComponentFitWidth = function(v40) --[[ Line: 217 ]] --[[ Name: _computeHeaderComponentFitWidth ]]
    -- upvalues: v6 (copy), l_v9_Attribute_0 (copy), l_v9_Attribute_1 (copy), v8 (copy), l_TextService_0 (copy), v22 (copy)
    local l_props_1 = v40.props;
    local v42 = if v6 then (l_props_1.Style or {}).Header or {} else l_props_1.Stylizer.Header;
    local v43 = if v6 then l_v9_Attribute_0 else v42.Arrow.Size;
    local v44 = if v6 then l_v9_Attribute_1 else v42.Spacing;
    local v45 = if v6 then v43 + v44 else v43.X.Offset + v44;
    if l_props_1.Text then
        local l_Text_0 = v42.Text;
        local v47 = if v6 then v8:GetAttribute("TextLabelFont") else l_Text_0.Font;
        local v48 = if v6 then v8:GetAttribute("TextLabelTitleSize") else l_Text_0.TextSize;
        v45 = v45 + (l_TextService_0:GetTextSize(l_props_1.Text, v48, v47, v22).X + v44);
    end;
    return v45;
end;
v23._renderHeader = function(v49) --[[ Line: 237 ]] --[[ Name: _renderHeader ]]
    -- upvalues: v6 (copy), v16 (copy), v2 (copy), v12 (copy), v5 (copy), v17 (copy), v14 (copy), l_join_0 (copy), l_omit_0 (copy), v13 (copy)
    local l_props_2 = v49.props;
    local v51 = if v6 then (l_props_2.Style or {}).Header or {} else l_props_2.Stylizer.Header;
    local v52 = v16.new();
    local v53 = {};
    if not l_props_2.AlwaysExpanded then
        v53.Image = v2.createElement(v12, if v6 then {
            LayoutOrder = v52:getNextOrder(), 
            [v5.Tag] = "Arrow"
        } else {
            LayoutOrder = v52:getNextOrder(), 
            Style = v51.Arrow, 
            StyleModifier = l_props_2.Expanded and v17.Selected or nil
        });
    end;
    if l_props_2.Text then
        v53.Title = v2.createElement(v14, if v6 then {
            LayoutOrder = v52:getNextOrder(), 
            Text = l_props_2.Text, 
            [v5.Tag] = "Title Wrap X-Fit"
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v52:getNextOrder(), 
            Style = v51.Text, 
            Text = l_props_2.Text, 
            TextWrapped = true
        });
    end;
    if l_props_2.HeaderComponent then
        local v54 = nil;
        if not l_props_2.HeaderComponentProps.Size then
            local v55 = v49:_computeHeaderComponentFitWidth();
            v54 = UDim2.new(1, -v55, 1, 0);
        end;
        local v56 = l_join_0(l_props_2.HeaderComponentProps, {
            LayoutOrder = v52:getNextOrder(), 
            Size = v54
        });
        v53.HeaderComponent = v2.createElement(l_props_2.HeaderComponent, v56);
    end;
    local v57 = nil;
    if l_props_2.Size then
        v57 = l_props_2.Size;
    elseif not v6 then
        v57 = v51.Size;
        local l_Height_0 = v51.Height;
        if typeof(l_Height_0) == "number" then
            v57 = UDim2.new(v51.Size.X, UDim.new(0, l_Height_0));
        elseif typeof(l_Height_0) == "UDim" then
            v57 = UDim2.new(v51.Size.X, l_Height_0);
        end;
    end;
    local v59 = if v6 then l_omit_0(v51, {
        "Arrow", 
        "Text"
    }) else nil;
    local v60 = l_props_2.PutHeaderLast and 2 or 1;
    return v2.createElement(v13, if v6 then {
        LayoutOrder = v60, 
        OnClick = l_props_2.OnExpandedChanged, 
        [v5.Tag] = "Header X-Fit X-RowM X-Middle"
    } else {
        HorizontalAlignment = v51.HorizontalAlignment, 
        LayoutOrder = v60, 
        Layout = Enum.FillDirection.Horizontal, 
        OnClick = l_props_2.OnExpandedChanged, 
        Padding = v51.Padding, 
        Size = v57, 
        Style = v59, 
        Spacing = v51.Spacing, 
        VerticalAlignment = v51.VerticalAlignment
    }, v53);
end;
if not v6 then
    v23 = l_withContext_0({
        Stylizer = v3.Stylizer
    })(v23);
end;
return v23;