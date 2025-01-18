local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.prioritize);
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.Styling.joinTags);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local l_UI_0 = l_Parent_0.UI;
local v10 = require(l_UI_0.Components.Pane);
local v11 = require(l_UI_0.Components.List);
local v12 = require(l_UI_0.Components.TreeViewRow);
local v13 = v1.PureComponent:extend("TreeView");
v13.defaultProps = {};
v13.init = function(v14) --[[ Line: 68 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v14.state = {
        rows = {}
    };
    v14.defaultGetChildren = function(v15) --[[ Line: 72 ]]
        return v15.children;
    end;
    v14.getChildren = v14.props.GetChildren or v14.defaultGetChildren;
    v14.defaultGetItemId = function(v16) --[[ Line: 76 ]]
        return v16;
    end;
    v14.getItemId = v14.props.GetItemId or v14.defaultGetItemId;
    v14.onToggle = function(v17) --[[ Line: 80 ]]
        -- upvalues: v14 (copy)
        local l_Item_0 = v17.Item;
        if v14.props.OnExpansionChange then
            local v19 = v14.getItemId(l_Item_0);
            v14.props.OnExpansionChange({
                [v19] = not v14.props.Expansion[v19]
            });
        end;
    end;
    v14.onSelect = function(v20) --[[ Line: 89 ]]
        -- upvalues: v14 (copy)
        local l_Item_1 = v20.Item;
        if v14.props.OnSelectionChange then
            local v22 = v14.getItemId(l_Item_1);
            v14.props.OnSelectionChange({
                [v22] = true
            });
        end;
    end;
    v14._getRowProps = function(v23, v24, v25, v26) --[[ Line: 98 ]]
        -- upvalues: v14 (copy), l_join_0 (ref)
        local l_props_0 = v14.props;
        local v28 = v14.getChildren(v23.item);
        local v29 = v14.getItemId(v23.item);
        return l_join_0({
            Key = if l_props_0.GetItemKey then l_props_0.GetItemKey(v23.item, v24) else v24, 
            Index = v24, 
            Item = v23.item, 
            Depth = v23.depth, 
            Position = v25, 
            Size = v26, 
            Selected = l_props_0.Selection and l_props_0.Selection[v29], 
            Children = v28 or {}, 
            OnToggle = v14.onToggle, 
            OnPress = v14.onSelect, 
            Expanded = l_props_0.Expansion[v29] or false
        }, l_props_0.RowProps);
    end;
end;
v13.didMount = function(v30) --[[ Line: 118 ]] --[[ Name: didMount ]]
    v30:calculateRows();
end;
v13.willUpdate = function(v31, v32) --[[ Line: 122 ]] --[[ Name: willUpdate ]]
    if v32.GetChildren ~= v31.props.GetChildren then
        v31.getChildren = v32.GetChildren or v31.defaultGetChildren;
    end;
    if v32.GetItemId ~= v31.props.GetItemId then
        v31.getItemId = v32.GetItemId or v31.defaultGetItemId;
    end;
end;
v13.didUpdate = function(v33, v34) --[[ Line: 131 ]] --[[ Name: didUpdate ]]
    v33:calculateRows(v34);
end;
v13.calculateRows = function(v35, v36) --[[ Line: 135 ]] --[[ Name: calculateRows ]]
    if v36 and v35.props.RootItems == v36.RootItems and v35.props.GetChildren == v36.GetChildren and v35.props.GetItemKey == v36.GetItemKey and v35.props.Expansion == v36.Expansion and v35.props.Selection == v36.Selection then
        return;
    else
        local v37 = {};
        for _, v39 in pairs(v35.props.RootItems) do
            v35:contributeItem(v39, 0, v37);
        end;
        v35:setState({
            rows = v37
        });
        return;
    end;
end;
v13.contributeItem = function(v40, v41, v42, v43) --[[ Line: 156 ]] --[[ Name: contributeItem ]]
    local l_props_1 = v40.props;
    local v45 = v40.getItemId(v41);
    table.insert(v43, {
        index = #v43 + 1, 
        depth = v42, 
        item = v41
    });
    if l_props_1.Expansion[v45] then
        local v46 = v40.getChildren(v41);
        if l_props_1.SortChildren then
            table.sort(v46, l_props_1.SortChildren);
        end;
        for _, v48 in pairs(v46) do
            v40:contributeItem(v48, v42 + 1, v43);
        end;
    end;
    return v43;
end;
v13._renderList = function(v49) --[[ Line: 177 ]] --[[ Name: _renderList ]]
    -- upvalues: v6 (copy), v1 (copy), v11 (copy), v4 (copy), v12 (copy)
    local l_props_2 = v49.props;
    local v51 = if v6 then l_props_2.Style or {} else l_props_2.Stylizer;
    return v1.createElement(v11, {
        Rows = v49.state.rows, 
        GetRowProps = l_props_2.GetRowProps or v49._getRowProps, 
        RowHeight = if v6 then l_props_2.RowHeight else v4(l_props_2.RowHeight, v51.RowHeight), 
        RowComponent = l_props_2.RowComponent or v12
    });
end;
v13.render = function(v52) --[[ Line: 188 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v1 (copy), v10 (copy), v5 (copy), v7 (copy)
    local l_props_3 = v52.props;
    local v54 = if v6 then l_props_3.Style or {} else l_props_3.Stylizer;
    return v1.createElement(v10, if v6 then {
        Size = l_props_3.Size, 
        LayoutOrder = l_props_3.LayoutOrder, 
        ZIndex = l_props_3.ZIndex, 
        [v5.Tag] = v7("Component-TreeView", l_props_3[v5.Tag] or "Input X-PadS X-Stroke X-Corner")
    } else {
        Padding = v54.Padding, 
        Size = l_props_3.Size, 
        LayoutOrder = l_props_3.LayoutOrder, 
        ZIndex = l_props_3.ZIndex, 
        Style = v54
    }, {
        List = v52:_renderList()
    });
end;
return (l_withContext_0({
    Stylizer = if v6 then nil else v2.Stylizer
})(v13));