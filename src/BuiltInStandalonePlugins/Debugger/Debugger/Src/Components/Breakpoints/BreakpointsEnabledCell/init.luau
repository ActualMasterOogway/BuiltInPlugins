local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.Constants);
local v5 = require(l_Parent_0.Src.Util.BreakpointHelperFunctions);
local l_ContextServices_0 = v3.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v12 = v1.PureComponent:extend("BreakpointsEnabledCell");
v12.init = function(v13) --[[ Line: 18 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v13.onToggle = function() --[[ Line: 19 ]]
        -- upvalues: v13 (copy)
        v13.props.CellProps.OnToggle(v13.props.Row);
    end;
    v13.onBreakpointIconClicked = function() --[[ Line: 24 ]]
        -- upvalues: v13 (copy), v5 (ref)
        local l_Row_0 = v13.props.Row;
        local l_BreakpointById_0 = game:GetService("MetaBreakpointManager"):GetBreakpointById(l_Row_0.item.id);
        v5.setBreakpointRowEnabled(l_BreakpointById_0, l_Row_0, v13.props.Analytics, "LuaBreakpointsTable.BreakpointIconClicked", v13.props.CurrentConnectionId);
    end;
end;
local function v17(v16) --[[ Line: 38 ]] --[[ Name: fetchDebugpointIcon ]]
    -- upvalues: v4 (copy)
    if not v16.item.isValid then
        return v4.DebugpointIconTable.invalidBreakpoint;
    elseif v16.item.debugpointType == "Breakpoint" then
        if not v16.item.condition or v16.item.condition == "" then
            return v16.item.isEnabled and v4.DebugpointIconTable.breakpointEnabled or v4.DebugpointIconTable.breakpointDisabled;
        else
            return v16.item.isEnabled and v4.DebugpointIconTable.conditionalEnabled or v4.DebugpointIconTable.conditionalDisabled;
        end;
    else
        return v16.item.isEnabled and v4.DebugpointIconTable.logpointEnabled or v4.DebugpointIconTable.logpointDisabled;
    end;
end;
v12.render = function(v18) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v17 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v4 (copy), l_Image_0 (copy)
    local l_props_0 = v18.props;
    local l_Row_1 = l_props_0.Row;
    local l_Style_0 = l_props_0.Style;
    local l_HasChildren_0 = l_props_0.HasChildren;
    local v23 = l_props_0.ColumnIndex == 1;
    local v24 = l_Row_1.depth * l_Style_0.Indent;
    local v25 = l_Style_0.CellPadding.Left + v24;
    if not l_HasChildren_0 then
        v25 = v25 + v24 * 2;
    end;
    local l_Size_0 = l_Style_0.Arrow.Size;
    local v27 = l_props_0.CellProps.Expansion[l_Row_1.item];
    local v28 = v23 and {
        Top = l_Style_0.CellPadding.Top, 
        Left = v25, 
        Right = l_Style_0.CellPadding.Right, 
        Bottom = l_Style_0.CellPadding.Bottom
    } or l_Style_0.CellPadding;
    local v29 = v17(l_Row_1);
    return v1.createElement(l_Pane_0, {
        Style = "Box", 
        BackgroundColor3 = l_props_0.BackgroundColor, 
        BorderSizePixel = 1, 
        BorderColor3 = l_Style_0.Border, 
        Size = UDim2.new(l_props_0.Width.Scale, l_props_0.Width.Offset, 1, 0), 
        ClipsDescendants = true
    }, {
        Left = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 0, 
            Padding = v28, 
            Spacing = l_Style_0.CellSpacing, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            Toggle = l_HasChildren_0 and v1.createElement("ImageButton", {
                LayoutOrder = 0, 
                Size = UDim2.new(0, l_Size_0, 0, l_Size_0), 
                BackgroundTransparency = 1, 
                Image = l_Style_0.Arrow.Image, 
                ImageColor3 = l_Style_0.Arrow.Color, 
                ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
                ImageRectOffset = v27 and l_Style_0.Arrow.ExpandedOffset or l_Style_0.Arrow.CollapsedOffset, 
                [v1.Event.Activated] = v18.onToggle
            }) or nil, 
            ChildCountIndicator = l_HasChildren_0 and v1.createElement(l_TextLabel_0, {
                Text = "(x" .. #l_Row_1.item.children .. ")", 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v4.ICON_SIZE, 0, v4.ICON_SIZE)
            }), 
            BreakpointIconPane = v1.createElement(l_Pane_0, {
                LayoutOrder = 2, 
                OnPress = v18.onBreakpointIconClicked, 
                AutomaticSize = Enum.AutomaticSize.XY
            }, {
                BreakpointIcon = v1.createElement(l_Image_0, {
                    Size = UDim2.new(0, v4.ICON_SIZE, 0, v4.ICON_SIZE), 
                    Image = v29
                })
            })
        })
    });
end;
v12 = l_ContextServices_0.withContext({
    Analytics = l_Analytics_0
})(v12);
return (v2.connect(function(v30, _) --[[ Line: 133 ]]
    return {
        CurrentConnectionId = v30.Common.currentDebuggerConnectionId
    };
end)(v12));