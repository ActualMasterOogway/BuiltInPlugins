local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local l_UI_0 = l_Parent_0.UI;
local v6 = require(l_UI_0.Components.TreeView);
local v7 = require(script.InstanceTreeRow);
local v8 = v1.PureComponent:extend("InstanceTreeView");
v4.wrap(v8, script);
v8.defaultProps = {};
v8.init = function(v9) --[[ Line: 40 ]] --[[ Name: init ]]
    v9.toggleRow = function(v10) --[[ Line: 41 ]]
        -- upvalues: v9 (copy)
        local v11 = {
            [v10.item] = not v9.props.Expansion[v10.item]
        };
        v9.props.OnExpansionChange(v11);
    end;
    v9.selectRow = function(v12) --[[ Line: 48 ]]
        -- upvalues: v9 (copy)
        local v13 = {
            [v12.item] = true
        };
        v9.props.OnSelectionChange(v13);
    end;
    v9.getRowProps = function(v14, v15, v16, v17) --[[ Line: 54 ]]
        -- upvalues: v9 (copy)
        local l_item_0 = v14.item;
        local l_props_0 = v9.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v21 = l_props_0.Selection[l_item_0];
        local v22 = l_props_0.Expansion[l_item_0];
        return {
            row = v14, 
            style = l_Stylizer_0, 
            isSelected = v21, 
            isExpanded = v22, 
            Key = l_item_0.Name .. "#" .. tostring(v15), 
            onToggled = v9.toggleRow, 
            onSelected = v9.selectRow, 
            Position = v16, 
            Size = v17
        };
    end;
    v9.getChildren = function(v23) --[[ Line: 73 ]]
        return v23:GetChildren();
    end;
    v9.getItemKey = function(v24, v25) --[[ Line: 77 ]]
        return v24.Name .. "#" .. tostring(v25);
    end;
end;
v8.render = function(v26) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v6 (copy), v7 (copy)
    local l_props_1 = v26.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    return v1.createElement(v6, {
        LayoutOrder = l_props_1.LayoutOrder, 
        RootItems = l_props_1.Instances, 
        GetChildren = v26.getChildren, 
        GetItemKey = v26.getItemKey, 
        GetRowProps = v26.getRowProps, 
        RowComponent = v7, 
        Size = l_props_1.Size, 
        Expansion = l_props_1.Expansion, 
        Style = l_Stylizer_1
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v8));