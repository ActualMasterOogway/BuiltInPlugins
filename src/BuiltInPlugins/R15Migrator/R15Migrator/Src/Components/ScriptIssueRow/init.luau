local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v12 = require(l_script_FirstAncestor_0.Src.Components.ScriptIconView);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v14 = v2.PureComponent:extend("ScriptIssueRow");
local l_R15MigShowLinkedText_0 = game:GetFastFlag("R15MigShowLinkedText");
v14.isDoubleClick = function(v16) --[[ Line: 28 ]] --[[ Name: isDoubleClick ]]
    local v17 = tick();
    local v18 = v17 < v16.lastClickTime + 0.5;
    v16.lastClickTime = v17;
    return v18;
end;
v14.init = function(v19) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy)
    v19.state = {
        maxLabelSizeX = 0
    };
    v19.rowContainerRef = v2.createRef();
    v19.lastClickTime = 0;
    v19.onToggle = function() --[[ Line: 43 ]]
        -- upvalues: v19 (copy)
        local l_props_0 = v19.props;
        l_props_0.OnToggle(l_props_0.Row);
    end;
    v19.onClick = function() --[[ Line: 48 ]]
        -- upvalues: v19 (copy)
        local l_props_1 = v19.props;
        l_props_1.OnClick(l_props_1.Row);
    end;
    v19.onDoubleClick = function() --[[ Line: 53 ]]
        -- upvalues: v19 (copy)
        local l_props_2 = v19.props;
        if v19:isDoubleClick() then
            l_props_2.OnDoubleClick(l_props_2.Row);
        end;
    end;
    v19.onRightClick = function() --[[ Line: 60 ]]
        -- upvalues: v19 (copy)
        local l_props_3 = v19.props;
        l_props_3.OnRightClick(l_props_3.Row);
    end;
    v19.onLinkClick = function() --[[ Line: 65 ]]
        -- upvalues: v19 (copy), l_GuiService_0 (ref)
        local l_props_4 = v19.props;
        print((("Row %*"):format((game.HttpService:JSONEncode(l_props_4.Row)))));
        l_GuiService_0:OpenBrowserWindow(l_props_4.Row.item.url);
    end;
    v19.onAbsoluteSizeChanged = function(v25) --[[ Line: 71 ]]
        -- upvalues: v19 (copy)
        if not v25 then
            return;
        else
            local v26 = 0;
            for _, v28 in v25:GetChildren() do
                if v28.Name ~= "Label" and v28:IsA("GuiObject") then
                    v26 = v26 + v28.AbsoluteSize.X;
                end;
            end;
            v19:setState({
                maxLabelSizeX = v25.AbsoluteSize.X - v26 - v19:calculateIndent()
            });
            return;
        end;
    end;
end;
local function _(v29) --[[ Line: 89 ]] --[[ Name: formatRangeText ]]
    return "(" .. v29.startLine .. "," .. v29.startCharacter .. ")";
end;
v14.calculateIndent = function(v31) --[[ Line: 93 ]] --[[ Name: calculateIndent ]]
    local l_props_5 = v31.props;
    local l_Stylizer_0 = l_props_5.Stylizer;
    return l_props_5.Row.depth * l_Stylizer_0.Indent;
end;
v14.didUpdate = function(v34, v35) --[[ Line: 101 ]] --[[ Name: didUpdate ]]
    if v34.props.Row ~= v35.Row then
        v34.onAbsoluteSizeChanged(v34.rowContainerRef.current);
    end;
end;
local function v40(v36, v37, v38, v39) --[[ Line: 107 ]] --[[ Name: getWarningLink ]]
    -- upvalues: l_R15MigShowLinkedText_0 (copy), v2 (copy), l_LinkText_0 (copy), l_TextLabel_0 (copy)
    if l_R15MigShowLinkedText_0 then
        return v2.createElement(l_LinkText_0, {
            Text = v36.codeText, 
            TextSize = v38.TextSize, 
            LayoutOrder = v37:getNextOrder(), 
            OnClick = v39, 
            Disabled = true
        });
    else
        return v2.createElement(l_TextLabel_0, {
            Text = ("<font color = \"rgb(43, 177, 255)\"> %* </font>"):format(v36.codeText), 
            TextSize = v38.TextSize, 
            LayoutOrder = v37:getNextOrder(), 
            RichText = true, 
            AutomaticSize = Enum.AutomaticSize.XY
        });
    end;
end;
v14.render = function(v41) --[[ Line: 127 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), v40 (copy), l_TextLabel_0 (copy), l_Tooltip_0 (copy), v12 (copy)
    local l_state_0 = v41.state;
    local l_props_6 = v41.props;
    local l_Stylizer_1 = l_props_6.Stylizer;
    local l_Size_0 = l_props_6.Size;
    local l_item_0 = l_props_6.Row.item;
    local l_Expanded_0 = l_props_6.Expanded;
    local l_Selected_0 = l_props_6.Selected;
    local v49 = l_item_0.children and #l_item_0.children > 0;
    local v50 = v41:calculateIndent();
    local l_Size_1 = l_Stylizer_1.Arrow.Size;
    local v52 = l_item_0.codeText ~= nil;
    local l_initialIssueCount_0 = l_item_0.initialIssueCount;
    local l_maxLabelSizeX_0 = l_state_0.maxLabelSizeX;
    local v55 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v58 = {
        Style = "Box", 
        BorderSizePixel = 0, 
        Size = l_Size_0, 
        Position = l_props_6.Position, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    };
    local v59 = {};
    local l_createElement_1 = v2.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v62 = {
        LayoutOrder = v55:getNextOrder(), 
        Size = UDim2.new(1, -l_Stylizer_1.IconViewSize.X.Offset - l_Stylizer_1.Spacing, 1, 0), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        OnClick = v41.onDoubleClick, 
        OnRightClick = v41.onRightClick, 
        Padding = {
            Left = v50
        }, 
        ForwardRef = v41.rowContainerRef, 
        [v2.Change.AbsoluteSize] = v41.onAbsoluteSizeChanged
    };
    local v63 = {
        Checkbox = v2.createElement(l_Checkbox_0, {
            LayoutOrder = v55:getNextOrder(), 
            Checked = l_Selected_0, 
            OnClick = v41.onClick
        }), 
        Arrow = v49 and v2.createElement("ImageButton", {
            LayoutOrder = v55:getNextOrder(), 
            Size = UDim2.new(0, l_Size_1, 0, l_Size_1), 
            BackgroundTransparency = 1, 
            Image = l_Stylizer_1.Arrow.Image, 
            ImageColor3 = l_Stylizer_1.Arrow.Color, 
            ImageRectSize = Vector2.new(l_Size_1, l_Size_1), 
            ImageRectOffset = if l_Expanded_0 then l_Stylizer_1.Arrow.ExpandedOffset else l_Stylizer_1.Arrow.CollapsedOffset, 
            [v2.Event.Activated] = v41.onToggle
        }), 
        ArrowPadding = v2.createElement(l_Pane_0, {
            Size = UDim2.fromOffset(l_Stylizer_1.Arrow.Padding, 0), 
            LayoutOrder = v55:getNextOrder()
        }), 
        WarningLink = v52 and v40(l_item_0, v55, l_Stylizer_1, v41.onLinkClick)
    };
    local l_v52_0 = v52;
    if l_v52_0 then
        l_v52_0 = v2.createElement;
        local l_l_TextLabel_0_0 = l_TextLabel_0;
        local v66 = {};
        local l_range_0 = l_item_0.range;
        v66.Text = "(" .. l_range_0.startLine .. "," .. l_range_0.startCharacter .. ")";
        v66.TextSize = l_Stylizer_1.TextSize;
        v66.AutomaticSize = Enum.AutomaticSize.XY;
        v66.LayoutOrder = v55:getNextOrder();
        l_v52_0 = l_v52_0(l_l_TextLabel_0_0, v66);
    end;
    v63.RangeLabel = l_v52_0;
    v63.Separator = v52 and v2.createElement(l_TextLabel_0, {
        Text = ": ", 
        TextSize = l_Stylizer_1.TextSize, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v55:getNextOrder()
    });
    v63.Label = v2.createElement(l_TextLabel_0, {
        Text = l_item_0.text, 
        TextSize = l_Stylizer_1.TextSize, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v55:getNextOrder(), 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left
    }, {
        SizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(l_maxLabelSizeX_0, l_Size_0.Y.Offset)
        }), 
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = l_item_0.text
        })
    });
    l_v52_0 = false;
    if l_initialIssueCount_0 ~= nil then
        l_v52_0 = v2.createElement(l_TextLabel_0, {
            Text = "(" .. l_initialIssueCount_0 .. ")", 
            Style = "Label", 
            TextSize = l_Stylizer_1.TextSize, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v55:getNextOrder()
        });
    end;
    v63.IssueCount = l_v52_0;
    v59.RowContainer = l_createElement_1(l_l_Pane_0_1, v62, v63);
    v59.IconContainer = if l_item_0.statuses then v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v55:getNextOrder()
    }, {
        ScriptIconView = v2.createElement(v12, {
            Size = l_Stylizer_1.IconViewSize, 
            Statuses = l_item_0.statuses, 
            ShowCounts = not v52
        })
    }) else nil;
    return l_createElement_0(l_l_Pane_0_0, v58, v59);
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v14));