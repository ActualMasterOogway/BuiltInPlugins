local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(script.RoactElementRow);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local v7 = require(l_Parent_0.Packages.Dash);
local l_shallowEqual_0 = v7.shallowEqual;
local l_mapOne_0 = v7.mapOne;
local l_values_0 = v7.values;
local l_sort_0 = table.sort;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TreeView_0 = v3.UI.TreeView;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v16 = require(l_Actions_0.RoactInspector.SelectInstance);
local v17 = require(l_Actions_0.RoactInspector.ToggleInstance);
local v18 = v1.PureComponent:extend("RoactElementTree");
v18.init = function(v19) --[[ Line: 33 ]] --[[ Name: init ]]
    -- upvalues: l_RoactInspectorApi_0 (copy), l_mapOne_0 (copy), l_shallowEqual_0 (copy)
    v19.onToggleInstance = function(v20) --[[ Line: 34 ]]
        -- upvalues: v19 (copy), l_RoactInspectorApi_0 (ref)
        local l_item_0 = v20.item;
        local v22 = not v19.props.Expansion[l_item_0];
        v19.props.toggleInstance({
            [l_item_0] = v22
        });
        if v22 then
            local v23 = v19.props.Inspector:get():getTargetApi();
            if l_RoactInspectorApi_0.isInstance(v23) then
                v23:getChildren(l_item_0.Path);
            end;
        end;
    end;
    v19.onSelectInstance = function(v24) --[[ Line: 49 ]]
        -- upvalues: v19 (copy), l_RoactInspectorApi_0 (ref)
        local l_item_1 = v24.item;
        if not v19.props.Expansion[l_item_1] then
            v19.onToggleInstance(v24);
        end;
        v19.props.selectInstance({
            [l_item_1] = true
        });
        local v26 = v19.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v26) then
            v26:getBranch(l_item_1.Path);
        end;
    end;
    v19.onEnterRow = function(v27) --[[ Line: 65 ]]
        -- upvalues: v19 (copy), l_RoactInspectorApi_0 (ref)
        v19.hoveredItem = v27.item;
        local v28 = v19.props.Inspector:get():getTargetApi();
        if l_RoactInspectorApi_0.isInstance(v28) then
            v28:highlight(v27.item.Path);
        end;
    end;
    v19.onLeaveRow = function(v29) --[[ Line: 74 ]]
        -- upvalues: v19 (copy), l_RoactInspectorApi_0 (ref)
        if v29.item ~= v19.hoveredItem then
            return;
        else
            local v30 = v19.props.Inspector:get():getTargetApi();
            if l_RoactInspectorApi_0.isInstance(v30) then
                v30:dehighlight();
            end;
            return;
        end;
    end;
    v19.getRowProps = function(v31, _, v33, v34) --[[ Line: 85 ]]
        -- upvalues: v19 (copy), l_mapOne_0 (ref), l_shallowEqual_0 (ref)
        local l_Stylizer_0 = v19.props.Stylizer;
        local v38 = l_mapOne_0(v19.props.Flash, function(v36, v37) --[[ Line: 87 ]]
            -- upvalues: l_shallowEqual_0 (ref), v31 (copy)
            if l_shallowEqual_0(v37, v31.item.Path) then
                return v36;
            else
                return nil;
            end;
        end);
        return {
            Row = v31, 
            OnEnterRow = v19.onEnterRow, 
            OnLeaveRow = v19.onLeaveRow, 
            OnSelect = v19.onSelectInstance, 
            OnToggle = v19.onToggleInstance, 
            Position = v33, 
            Flash = v38, 
            IsExpanded = v19.props.Expansion[v31.item], 
            IsSelected = v19.props.Selection[v31.item], 
            Size = v34, 
            Style = l_Stylizer_0
        };
    end;
end;
local function v43(v39) --[[ Line: 110 ]] --[[ Name: getChildren ]]
    -- upvalues: l_values_0 (copy), l_sort_0 (copy)
    local v40 = v39.Children and l_values_0(v39.Children) or {};
    l_sort_0(v40, function(v41, v42) --[[ Line: 112 ]]
        return v41.Name < v42.Name;
    end);
    return v40;
end;
v18.render = function(v44) --[[ Line: 118 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TreeView_0 (copy), v43 (copy), v5 (copy)
    local l_props_0 = v44.props;
    return v1.createElement(l_TreeView_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Expansion = l_props_0.Expansion, 
        GetRowProps = v44.getRowProps, 
        RootItems = v43(l_props_0.RootInstance), 
        RowComponent = v5, 
        GetChildren = v43, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Style = "BorderBox"
    });
end;
v18 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Inspector = v4
})(v18);
return v2.connect(function(v46, _) --[[ Line: 138 ]]
    return {
        SelectedNodeIndex = v46.RoactInspector.selectedNodeIndex, 
        RootInstance = v46.RoactInspector.rootInstance, 
        Flash = v46.RoactInspector.flashInstances, 
        Selection = v46.RoactInspector.selectedInstances, 
        Expansion = v46.RoactInspector.expandedInstances
    };
end, function(v48) --[[ Line: 146 ]]
    -- upvalues: v16 (copy), v17 (copy)
    return {
        selectInstance = function(v49) --[[ Line: 148 ]] --[[ Name: selectInstance ]]
            -- upvalues: v48 (copy), v16 (ref)
            v48(v16(v49));
        end, 
        toggleInstance = function(v50) --[[ Line: 151 ]] --[[ Name: toggleInstance ]]
            -- upvalues: v48 (copy), v17 (ref)
            v48(v17(v50));
        end
    };
end)(v18);