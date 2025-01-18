local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_join_0 = v1.join;
local l_joinTags_0 = v2.Styling.joinTags;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_PropertyCell_0 = l_UI_0.PropertyCell;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v18 = require(l_Util_0.Constants);
local v19 = require(script.styles);
local v20 = v3.PureComponent:extend("LayerViewCell");
v20.init = function(v21) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), l_PropertyCell_0 (copy)
    v21.state = {
        ForceRefresh = 0
    };
    v21.onToggle = function() --[[ Line: 39 ]]
        -- upvalues: v21 (copy)
        v21.props.CellProps.OnToggle(v21.props.Row);
    end;
    v21.textRef = v3.createRef();
    v21.fetchCellContentsWidthIfOverflow = function() --[[ Line: 45 ]]

    end;
    v21.onAbsoluteSizeChanged = function(_) --[[ Line: 54 ]]

    end;
    v21.onTextInputFocused = function(v23) --[[ Line: 65 ]]
        -- upvalues: v21 (copy)
        local l_props_0 = v21.props;
        local l_OnFocused_0 = l_props_0.CellProps.OnFocused;
        if l_OnFocused_0 then
            l_OnFocused_0(v23, l_props_0.Row, l_props_0.ColumnIndex);
        end;
    end;
    v21.onTextInputFocusLost = function(v26, v27) --[[ Line: 72 ]]
        -- upvalues: v21 (copy)
        local l_props_1 = v21.props;
        local l_OnFocusLost_0 = l_props_1.CellProps.OnFocusLost;
        if l_OnFocusLost_0 then
            l_OnFocusLost_0(v26, v27, l_props_1.Row, l_props_1.ColumnIndex);
        end;
    end;
    v21.onPressed = function(...) --[[ Line: 79 ]]
        -- upvalues: v21 (copy)
        local l_props_2 = v21.props;
        if l_props_2.CellProps.OnCellPressed then
            l_props_2.CellProps.OnCellPressed(l_props_2.Row.item.path, l_props_2.ColumnIndex, ...);
        end;
    end;
    v21.onDoubleClick = function(...) --[[ Line: 85 ]]
        -- upvalues: v21 (copy)
        local l_props_3 = v21.props;
        if l_props_3.CellProps.OnCellDoubleClick then
            l_props_3.CellProps.OnCellDoubleClick(l_props_3.Row.item.path, l_props_3.ColumnIndex, ...);
        end;
    end;
    v21.getTextFromProps = function(v32) --[[ Line: 92 ]]
        local v33 = v32.Columns[v32.ColumnIndex];
        local v34 = v33.Key or v33.Name;
        return v32.Row.item[v34];
    end;
    v21.getPropertyCell = function(v35) --[[ Line: 99 ]]
        -- upvalues: v21 (copy), v3 (ref), l_PropertyCell_0 (ref)
        local l_CellProps_0 = v21.props.CellProps;
        return v3.createElement(l_PropertyCell_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(1, -6, 1, 0), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            GetAutocompleteItems = l_CellProps_0.GetAutocompleteItems, 
            Item = v35.Item, 
            LayoutOrder = 3, 
            OnChanged = v21.onChanged, 
            OnDoubleClick = v35.OnDoubleClick, 
            OnPressed = v35.OnPressed, 
            Schema = v35.Schema, 
            Value = v35.Value
        });
    end;
    v21.onChanged = function(v37) --[[ Line: 116 ]]
        -- upvalues: v21 (copy)
        if v21.props.CellProps.OnCellEdited then
            v21.props.CellProps.OnCellEdited(v37, v21.props.Row.item.path, v21.props.ColumnIndex);
        end;
    end;
end;
v20.didUpdate = function(v38, v39) --[[ Line: 123 ]] --[[ Name: didUpdate ]]
    local l_props_4 = v38.props;
    if (v39.RowIndex ~= l_props_4.RowIndex or v38.getTextFromProps(v39) ~= v38.getTextFromProps(l_props_4)) and l_props_4.SetCellContentsWidth then
        l_props_4.SetCellContentsWidth(l_props_4.ColumnIndex, l_props_4.RowIndex, v38.fetchCellContentsWidthIfOverflow());
    end;
end;
v20.didMount = function(v41) --[[ Line: 134 ]] --[[ Name: didMount ]]
    pcall(function() --[[ Line: 136 ]]
        -- upvalues: v41 (copy)
        v41.onThemeChanged = settings().Studio.ThemeChanged:Connect(function() --[[ Line: 137 ]]
            -- upvalues: v41 (ref)
            v41:setState({
                ForceRefresh = v41.state.ForceRefresh + 1
            });
        end);
    end);
end;
v20.willUnmount = function(v42) --[[ Line: 143 ]] --[[ Name: willUnmount ]]
    v42.onThemeChanged:Disconnect();
end;
v20.shouldComponentUpdate = function(v43, v44, v45) --[[ Line: 147 ]] --[[ Name: shouldComponentUpdate ]]
    local l_state_0 = v43.state;
    local l_props_5 = v43.props;
    if l_state_0.ForceRefresh ~= v45.ForceRefresh or l_props_5.StyleModifier ~= v44.StyleModifier then
        return true;
    else
        local l_CellProps_1 = l_props_5.CellProps;
        local l_CellProps_2 = v44.CellProps;
        local l_Row_0 = l_props_5.Row;
        local l_Row_1 = v44.Row;
        local l_Columns_0 = l_props_5.Columns;
        local l_Columns_1 = v44.Columns;
        local function _(v54, v55) --[[ Line: 159 ]] --[[ Name: xor ]]
            return v54 and not v55 or not v54 and v55;
        end;
        if l_CellProps_1 and not l_CellProps_2 or not l_CellProps_1 and l_CellProps_2 or l_Row_0 and not l_Row_1 or not l_Row_0 and l_Row_1 or l_Columns_0 and not l_Columns_1 or not l_Columns_0 and l_Columns_1 then
            return true;
        else
            if l_CellProps_1 and l_CellProps_2 and l_Columns_0 and l_Columns_1 then
                local v57 = l_Columns_0[l_props_5.ColumnIndex];
                local v58 = l_Columns_1[v44.ColumnIndex];
                local l_Key_0 = v57.Key;
                local l_Key_1 = v58.Key;
                local v61 = l_Row_0.item[l_Key_0];
                local v62 = l_Row_1.item[l_Key_1];
                if l_CellProps_1.Expansion[l_CellProps_1.GetItemId(l_Row_0.item)] ~= l_CellProps_2.Expansion[l_CellProps_2.GetItemId(l_Row_1.item)] then
                    return true;
                elseif v61 ~= v62 then
                    if typeof(v61) == "table" then
                        local v63 = true;
                        if v61.Value == v62.Value then
                            v63 = v61.Actions ~= v62.Actions;
                        end;
                        return v63;
                    else
                        return true;
                    end;
                end;
            end;
            return false;
        end;
    end;
end;
v20.render = function(v64) --[[ Line: 191 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_join_0 (copy), v18 (copy), v3 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_Tooltip_0 (copy), l_joinTags_0 (copy), l_TextLabel_0 (copy)
    local l_props_6 = v64.props;
    local l_Localization_1 = l_props_6.Localization;
    local v67 = l_props_6.Columns[l_props_6.ColumnIndex];
    local v68 = v67.Key or v67.Name;
    local v69 = l_props_6.Width or UDim.new(1 / #l_props_6.Columns, 0);
    local l_Row_2 = l_props_6.Row;
    local l_CellProps_3 = l_props_6.CellProps;
    local v72 = l_Row_2.item[v68];
    local l_v19_Attribute_0 = v19:GetAttribute("ActionIconSize");
    local l_v19_Attribute_1 = v19:GetAttribute("CellSpacing");
    local v75 = nil;
    local v76 = false;
    if typeof(v72) == "table" then
        v75 = tostring(v72.Value);
        if v72.Schema then
            v76 = true;
        end;
    else
        v75 = tostring(v72);
    end;
    local v77 = l_join_0(l_props_6.Style, l_CellProps_3.CellStyle);
    local v78 = l_CellProps_3.Expansion[l_CellProps_3.GetItemId(l_Row_2.item)];
    local l_Size_0 = v77.Arrow.Size;
    local v80 = l_Row_2.depth * v19:GetAttribute("Indent");
    local v81 = l_props_6.ColumnIndex == 1;
    local v82 = v81 and l_Row_2.hasChildren;
    local v83 = if v81 then v80 else 0;
    local v84 = nil;
    if typeof(v72) == "table" and v72.Actions then
        v83 = v83 + l_v19_Attribute_1;
        v84 = {};
        for v85, v86 in ipairs(v72.Actions) do
            if v86.Id == v18.LAYERVIEW_ACTIONS.NoOp then
                v84["Action " .. v85] = v3.createElement(l_Pane_0, {
                    LayoutOrder = v85, 
                    [v3.Tag] = "ActionIcon"
                });
            else
                v84[v86.Id] = v3.createElement(l_Button_0, {
                    Style = "Round", 
                    Size = UDim2.fromOffset(l_v19_Attribute_0, l_v19_Attribute_0), 
                    LayoutOrder = v85, 
                    OnClick = function() --[[ Line: 241 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_CellProps_3 (copy), v86 (copy), l_Row_2 (copy), l_props_6 (copy)
                        if l_CellProps_3.OnCellAction then
                            l_CellProps_3.OnCellAction(v86.Id, l_Row_2.item.path, l_props_6.ColumnIndex);
                        end;
                    end, 
                    [v3.Tag] = "ActionIcon"
                }, {
                    Icon = v3.createElement(l_Image_0, {
                        Image = v86.Icon
                    }), 
                    Tooltip = if v86.Tooltip then v3.createElement(l_Tooltip_0, {
                        Text = l_Localization_1:getText("Tooltips", v86.Tooltip)
                    }) else nil
                });
            end;
            v83 = v83 + (l_v19_Attribute_0 + l_v19_Attribute_1);
        end;
    end;
    local v87 = 0;
    if v82 then
        v87 = v87 + (v77.CellSpacing + l_Size_0);
    end;
    local v88 = UDim2.new(1, -v87, 1, 0);
    return v3.createElement(l_Pane_0, {
        Style = "Box", 
        Size = UDim2.new(v69.Scale, v69.Offset, 1, 0), 
        [v3.Change.AbsoluteSize] = v64.onAbsoluteSizeChanged, 
        [v3.Tag] = l_joinTags_0("LayerViewCell", l_Row_2.depth == 0 and "Section" or nil)
    }, {
        Left = v3.createElement(l_Pane_0, {
            LayoutOrder = l_props_6.ColumnIndex, 
            Size = UDim2.new(1, -v83, 1, 0), 
            Position = if v81 then UDim2.fromOffset(v80, 0) else nil, 
            [v3.Tag] = "X-RowS X-Middle"
        }, {
            Toggle = if v82 then v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1
            }, {
                Icon = v3.createElement("ImageButton", {
                    Size = UDim2.fromOffset(l_Size_0, l_Size_0), 
                    BackgroundTransparency = 1, 
                    Image = v77.Arrow.Image, 
                    ImageColor3 = v77.Arrow.Color, 
                    ImageRectSize = Vector2.new(l_Size_0, l_Size_0), 
                    ImageRectOffset = if v78 then v77.Arrow.ExpandedOffset else v77.Arrow.CollapsedOffset, 
                    [v3.Event.Activated] = v64.onToggle
                })
            }) else nil, 
            Text = if not v76 or v72.Disabled then v3.createElement(l_TextLabel_0, {
                LayoutOrder = 3, 
                Size = v88, 
                Position = UDim2.fromOffset(5, 0), 
                Text = v75, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                ref = v64.textRef
            }) else v64.getPropertyCell({
                OnDoubleClick = v64.onDoubleClick, 
                OnPressed = v64.onPressed, 
                Schema = v72.Schema, 
                Size = v88, 
                Value = v72.Value
            })
        }), 
        Right = if v84 then v3.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(1, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Position = UDim2.new(1, -3, 0.5, 0), 
            [v3.Tag] = "X-RowS"
        }, v84) else nil
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v20));