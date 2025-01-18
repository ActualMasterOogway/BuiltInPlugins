local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v5 = require(l_Parent_0.Styling.supportsStyleSheets);
local v6 = require(l_Parent_0.Styling.joinTags);
local v7 = require(script.styles);
local v8 = require(l_Parent_0.Util.Typecheck);
local v9 = require(l_Parent_0.Parent.Dash);
local l_assign_0 = v9.assign;
local l_join_0 = v9.join;
local v12 = require(l_Parent_0.Wrappers.withControl);
local l_UI_0 = l_Parent_0.UI;
local v14 = require(l_UI_0.Components.Image);
local v15 = require(l_UI_0.Components.Pane);
local v16 = require(l_UI_0.Components.TextLabel);
local v17 = require(l_UI_0.Components.Tooltip);
local v18 = v1.PureComponent:extend("TreeViewRow");
v8.wrap(v18, script);
v18.init = function(v19) --[[ Line: 61 ]] --[[ Name: init ]]
    v19.onToggle = function() --[[ Line: 62 ]]
        -- upvalues: v19 (copy)
        v19.props.OnToggle(v19.props);
    end;
end;
v18.render = function(v20) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v7 (copy), v1 (copy), l_join_0 (copy), v15 (copy), v4 (copy), v14 (copy), v16 (copy), v17 (copy), l_assign_0 (copy), v6 (copy)
    local l_props_0 = v20.props;
    local v22 = if v5 then l_props_0.Style or {} else l_props_0.Stylizer;
    local l_Index_0 = l_props_0.Index;
    local l_Item_0 = l_props_0.Item;
    local l_Depth_0 = l_props_0.Depth;
    local v26 = #l_props_0.Children > 0;
    local l_Expanded_0 = l_props_0.Expanded;
    local v28 = if v5 then v7:GetAttribute("ArrowSize") else v22.Arrow.Size;
    local l_BeforeToggle_0 = l_props_0.BeforeToggle;
    local l_BeforeIcon_0 = l_props_0.BeforeIcon;
    local l_AfterItem_0 = l_props_0.AfterItem;
    local l_TailItem_0 = l_props_0.TailItem;
    local l_BeforeIndentItem_0 = l_props_0.BeforeIndentItem;
    local l_ExpandableRoot_0 = l_props_0.ExpandableRoot;
    local l_Position_0 = l_props_0.Position;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = if v5 then v7:GetAttribute("ArrowExpandedOffset") else v22.Arrow.ExpandedOffset;
    local v40 = if v5 then v7:GetAttribute("ArrowCollapsedOffset") else v22.Arrow.CollapsedOffset;
    if l_props_0.GetContents then
        local v41, v42 = l_props_0.GetContents(l_Item_0);
        v36 = v41;
        v37 = v42;
    else
        v36 = l_Item_0.text;
        v37 = l_Item_0.icon;
        v38 = l_Item_0.tooltip;
    end;
    local v43 = true;
    if l_Depth_0 == 0 then
        v43 = l_ExpandableRoot_0;
    end;
    local v44 = (l_Depth_0 - (not l_ExpandableRoot_0 and 1 or 0)) * if v5 then v7:GetAttribute("Indent") else v22.Indent;
    local v45 = if v5 then nil else {
        Top = v22.Padding.Top, 
        Left = v22.Padding.Left, 
        Right = v22.Padding.Right, 
        Bottom = v22.Padding.Bottom
    };
    local v46 = {
        BeforeIndentItem = if l_BeforeIndentItem_0 then v1.createElement(l_BeforeIndentItem_0, l_join_0(l_props_0, {
            LayoutOrder = 1
        })) else nil, 
        Spacer = if v43 then v1.createElement(v15, {
            LayoutOrder = 2, 
            Size = UDim2.new(0, v44, 0, 0)
        }) else nil, 
        BeforeToggle = if l_BeforeToggle_0 then v1.createElement(l_BeforeToggle_0, l_join_0(l_props_0, {
            LayoutOrder = 3
        })) else nil, 
        Toggle = if v43 then if v26 then v1.createElement("ImageButton", if v5 then {
            ImageRectOffset = if l_Expanded_0 then v39 else v40, 
            LayoutOrder = 4, 
            [v1.Event.Activated] = v20.onToggle, 
            [v4.Tag] = "Arrow"
        } else {
            LayoutOrder = 4, 
            Size = UDim2.new(0, v28, 0, v28), 
            BackgroundTransparency = 1, 
            Image = v22.Arrow.Image, 
            ImageColor3 = v22.Arrow.Color, 
            ImageRectSize = Vector2.new(v28, v28), 
            ImageRectOffset = if l_Expanded_0 then v39 else v40, 
            [v1.Event.Activated] = v20.onToggle
        }) else v1.createElement(v15, {
            LayoutOrder = 4, 
            Size = UDim2.new(0, v28, 0, v28)
        }) else nil, 
        BeforeIcon = if l_BeforeIcon_0 then v1.createElement(l_BeforeIcon_0, l_join_0(l_props_0, {
            LayoutOrder = 5
        })) else nil, 
        LeftIcon = if v37 then v1.createElement(v14, l_join_0({
            LayoutOrder = 6
        }, v37)) else nil, 
        Text = if v36 then v1.createElement(v16, {
            TextColor = v22.TextColor, 
            LayoutOrder = 7, 
            Text = v36, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, if v38 then {
            Tooltip = v1.createElement(v17, {
                Text = v38
            })
        } else nil) else nil, 
        AfterItem = if l_AfterItem_0 then v1.createElement(l_AfterItem_0, l_join_0(l_props_0, {
            LayoutOrder = 8
        })) else nil
    };
    return v1.createElement(v15, l_assign_0({
        OnClick = function() --[[ Line: 211 ]] --[[ Name: OnClick ]]

        end, 
        LayoutOrder = l_BeforeIndentItem_0 and 2 or l_Index_0, 
        Position = l_Position_0, 
        Size = l_props_0.Size
    }, l_props_0.WrapperProps, if v5 then {
        [v4.Tag] = v6("Component-TreeViewRow", l_props_0[v4.Tag] or "Row Fit-X X-Stroke X-Corner X-RowM X-Middle")
    } else {
        AutomaticSize = Enum.AutomaticSize.X, 
        Style = "Box", 
        Layout = if l_TailItem_0 then nil else Enum.FillDirection.Horizontal, 
        HorizontalAlignment = if l_TailItem_0 then nil else Enum.HorizontalAlignment.Left, 
        BackgroundColor3 = v22.Background, 
        Padding = v45, 
        Size = l_props_0.Size or UDim2.new(1, 0, 0, v22.RowHeight), 
        Spacing = v22.Spacing
    }), if l_TailItem_0 then {
        Row = v1.createElement(v15, {
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, v46), 
        Tail = v1.createElement(v15, if v5 then {
            [v4.Tag] = "Tail"
        } else {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Padding = v22.TailPadding, 
            Position = UDim2.fromScale(1, 0), 
            Size = UDim2.fromScale(0, 1), 
            BackgroundColor3 = v22.Background, 
            ZIndex = 2
        }, {
            Child = v1.createElement(l_TailItem_0, l_props_0)
        })
    } else v46);
end;
v18.defaultProps = {
    ExpandableRoot = true
};
return v12((l_withContext_0({
    Stylizer = if v5 then nil else v2.Stylizer
})(v18)));