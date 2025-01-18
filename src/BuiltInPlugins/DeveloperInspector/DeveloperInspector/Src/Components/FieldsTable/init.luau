local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Util.InspectorContext);
local v5 = require(script.FieldTreeRow);
local l_RoactInspectorApi_0 = v3.DeveloperTools.RoactInspectorApi;
local v7 = require(l_Parent_0.Packages.Dash);
local l_flat_0 = v7.flat;
local l_values_0 = v7.values;
local l_sort_0 = table.sort;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TreeView_0 = v3.UI.TreeView;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v15 = require(l_Actions_0.RoactInspector.SelectField);
local v16 = require(l_Actions_0.RoactInspector.ToggleField);
local v17 = v1.PureComponent:extend("FieldsTable");
v17.init = function(v18) --[[ Line: 30 ]] --[[ Name: init ]]
    -- upvalues: l_RoactInspectorApi_0 (copy)
    v18.onToggleField = function(v19) --[[ Line: 31 ]]
        -- upvalues: v18 (copy), l_RoactInspectorApi_0 (ref)
        local l_item_0 = v19.item;
        local v21 = not v18.props.Expansion[l_item_0];
        v18.props.toggleField({
            [l_item_0] = v21
        });
        if v21 then
            local v22 = v18.props.Inspector:get():getTargetApi();
            if l_RoactInspectorApi_0.isInstance(v22) then
                v22:getFields(v18.props.SelectedPath, v18.props.SelectedNodeIndex, l_item_0.Path);
            end;
        end;
    end;
    v18.onSelectField = function(_) --[[ Line: 46 ]]

    end;
    v18.getRowProps = function(v24, _, v26, v27) --[[ Line: 50 ]]
        -- upvalues: v18 (copy)
        local l_Stylizer_0 = v18.props.Stylizer;
        return {
            Row = v24, 
            OnSelect = v18.onSelectField, 
            OnToggle = v18.onToggleField, 
            IsExpanded = v18.props.Expansion[v24.item], 
            IsSelected = false, 
            Position = v26, 
            Style = l_Stylizer_0, 
            Size = v27
        };
    end;
end;
local function v33(v29) --[[ Line: 65 ]] --[[ Name: getChildren ]]
    -- upvalues: l_values_0 (copy), l_sort_0 (copy)
    local v30 = l_values_0(v29.Children or {});
    l_sort_0(v30, function(v31, v32) --[[ Line: 68 ]]
        if typeof(v31) == typeof(v32) then
            return v31.Name < v32.Name;
        else
            return tostring(v31.Name) < tostring(v32.Name);
        end;
    end);
    return v30;
end;
v17.render = function(v34) --[[ Line: 80 ]] --[[ Name: render ]]
    -- upvalues: l_flat_0 (copy), v33 (copy), v1 (copy), l_TreeView_0 (copy), v5 (copy)
    local l_Children_0 = v34.props.Root.Children;
    local v36 = l_flat_0({
        {
            {
                Name = "Props", 
                IsHeading = true
            }
        }, 
        v33(l_Children_0.props), 
        {
            {
                Name = "State", 
                IsHeading = true
            }
        }, 
        v33(l_Children_0.state), 
        {
            {
                Name = "Context", 
                IsHeading = true
            }
        }, 
        (v33(l_Children_0._context))
    });
    return v1.createElement(l_TreeView_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Expansion = v34.props.Expansion, 
        RootItems = v36, 
        RowComponent = v5, 
        GetChildren = v33, 
        GetRowProps = v34.getRowProps, 
        ScrollingDirection = Enum.ScrollingDirection.Y, 
        Style = "BorderBox"
    });
end;
v17 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Inspector = v4
})(v17);
return v2.connect(function(v37, _) --[[ Line: 126 ]]
    return {
        SelectedPath = v37.RoactInspector.selectedPath, 
        SelectedNodeIndex = v37.RoactInspector.selectedNodeIndex, 
        Root = v37.RoactInspector.fields, 
        Selection = v37.RoactInspector.selectedFields, 
        Expansion = v37.RoactInspector.expandedFields
    };
end, function(v39) --[[ Line: 134 ]]
    -- upvalues: v15 (copy), v16 (copy)
    return {
        selectField = function(v40) --[[ Line: 136 ]] --[[ Name: selectField ]]
            -- upvalues: v39 (copy), v15 (ref)
            v39(v15(v40));
        end, 
        toggleField = function(v41) --[[ Line: 139 ]] --[[ Name: toggleField ]]
            -- upvalues: v39 (copy), v16 (ref)
            v39(v16(v41));
        end
    };
end)(v17);