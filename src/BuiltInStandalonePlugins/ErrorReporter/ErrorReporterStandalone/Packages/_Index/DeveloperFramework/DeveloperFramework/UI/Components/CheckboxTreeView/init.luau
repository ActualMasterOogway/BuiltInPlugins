local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local l_UI_0 = l_Parent_0.UI;
local v4 = require(l_UI_0.Components.Checkbox);
local v5 = require(l_UI_0.Components.Pane);
local v6 = require(l_UI_0.Components.TreeView);
local _ = function(v7, v8) --[[ Line: 41 ]] --[[ Name: buildRootExpansion ]]
    local v9 = {};
    if not v7 then
        for _, v11 in pairs(v8) do
            v9[v11] = true;
        end;
    end;
    return v9;
end;
local function v15(v13) --[[ Line: 53 ]] --[[ Name: TreeRowCheckbox ]]
    -- upvalues: v1 (copy), v5 (copy), v4 (copy)
    local v14 = {
        LayoutOrder = v13.LayoutOrder, 
        Size = UDim2.fromOffset(24, 24), 
        Layout = Enum.FillDirection.Horizontal, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    };
    return v1.createElement(v5, v14, {
        Checkbox = v1.createElement(v4, {
            Checked = v13.Checked[v13.Item], 
            OnClick = function() --[[ Line: 64 ]] --[[ Name: OnClick ]]
                -- upvalues: v13 (copy)
                v13.OnCheck(v13.Item);
            end
        })
    });
end;
local function v29(v16, v17, v18, v19, v20) --[[ Line: 72 ]] --[[ Name: toggleAncestorsByAllChildren ]]
    -- upvalues: v4 (copy)
    local function v21(v22) --[[ Line: 73 ]] --[[ Name: toggleAncestorsRecursive ]]
        -- upvalues: v18 (copy), v20 (copy), v19 (copy), v17 (copy), v4 (ref), v21 (copy)
        local v23 = v18[v22];
        if not v23 or v20[v22] == nil then
            return;
        else
            local v24 = true;
            local v25 = false;
            for _, v27 in ipairs(v19(v23)) do
                local v28 = v20[v27];
                if v28 == nil then
                    v28 = v17[v27] or false;
                end;
                v24 = v24 and v28 ~= v4.Indeterminate and v28;
                v25 = v25 or v28 == v4.Indeterminate or v28;
            end;
            if v24 then
                if v17[v23] == true then
                    return;
                else
                    v20[v23] = true;
                end;
            elseif not v25 then
                if v17[v23] == false then
                    return;
                else
                    v20[v23] = false;
                end;
            elseif v17[v23] == v4.Indeterminate then
                return;
            else
                v20[v23] = v4.Indeterminate;
            end;
            v21(v23);
            return;
        end;
    end;
    v21(v16);
end;
local function v38(v30, v31, v32, v33) --[[ Line: 115 ]] --[[ Name: toggleAllChildren ]]
    local function v34(v35) --[[ Line: 116 ]] --[[ Name: toggleChildrenRecursive ]]
        -- upvalues: v32 (copy), v31 (copy), v33 (copy), v34 (copy)
        if v32(v35) then
            for _, v37 in ipairs(v32(v35)) do
                if v31[v37] ~= v33[v35] then
                    v33[v37] = v33[v35];
                    v34(v37);
                end;
            end;
        end;
    end;
    v34(v30);
end;
local v39 = v1.PureComponent:extend("CheckboxTreeView");
v39.UpPropagators = {
    toggleAncestorsByAllChildren = v29, 
    default = function() --[[ Line: 134 ]] --[[ Name: default ]]

    end
};
v39.DownPropagators = {
    toggleAllChildren = v38, 
    default = function() --[[ Line: 141 ]] --[[ Name: default ]]

    end
};
local function v50(v40, v41) --[[ Line: 146 ]] --[[ Name: buildAncestry ]]
    local v42 = {};
    local function v43(v44) --[[ Line: 149 ]] --[[ Name: buildAncestryPropogateDown ]]
        -- upvalues: v41 (copy), v42 (copy), v43 (copy)
        local v45 = v41(v44);
        if v45 then
            for _, v47 in pairs(v45) do
                v42[v47] = v44;
                v43(v47);
            end;
        end;
    end;
    for _, v49 in pairs(v40) do
        v43(v49);
    end;
    return v42;
end;
local function v59(v51, v52, v53, v54, v55, v56) --[[ Line: 167 ]] --[[ Name: buildChange ]]
    -- upvalues: v39 (copy)
    local v57 = {};
    local v58 = not v52[v51];
    if v58 == nil then
        return v57;
    else
        v57[v51] = v58;
        if v55 then
            v55(v51, v52, v53, v54, v57);
        else
            v39.UpPropagators.default(v51, v52, v53, v54, v57);
        end;
        if v56 then
            v56(v51, v52, v54, v57);
            return v57;
        else
            v39.DownPropagators.default(v51, v52, v54, v57);
            return v57;
        end;
    end;
end;
v39.defaultProps = {
    GetChildren = function(v60) --[[ Line: 192 ]] --[[ Name: GetChildren ]]
        return v60.children;
    end, 
    ExpandableRoot = true
};
v39.init = function(v61) --[[ Line: 198 ]] --[[ Name: init ]]
    -- upvalues: v50 (copy), l_join_0 (copy), v15 (copy), v59 (copy)
    local l_ExpandableRoot_0 = v61.props.ExpandableRoot;
    local l_RootItems_0 = v61.props.RootItems;
    local v64 = {};
    if not l_ExpandableRoot_0 then
        for _, v66 in pairs(l_RootItems_0) do
            v64[v66] = true;
        end;
    end;
    v61.state = {
        expansion = v64
    };
    v61.ancestry = v50(v61.props.RootItems, v61.props.GetChildren);
    v61.onExpansionChange = function(v67) --[[ Line: 207 ]]
        -- upvalues: v61 (copy), l_join_0 (ref)
        v61:setState({
            expansion = l_join_0(v61.state.expansion, v67)
        });
    end;
    l_ExpandableRoot_0 = v61.props.ExpandableRoot;
    v61.rowProps = {
        BeforeIndentItem = v15, 
        ExpandableRoot = l_ExpandableRoot_0, 
        AfterItem = v61.props.AfterItem, 
        OnCheck = function(v68) --[[ Line: 219 ]] --[[ Name: OnCheck ]]
            -- upvalues: v61 (copy), v59 (ref)
            v61.props.OnCheck((v59(v68, v61.props.Checked, v61.ancestry, v61.props.GetChildren, v61.props.ToggleAncestors, v61.props.ToggleDescendants)));
        end
    };
end;
v39.didUpdate = function(v69, v70) --[[ Line: 234 ]] --[[ Name: didUpdate ]]
    -- upvalues: v50 (copy), l_join_0 (copy)
    v69.ancestry = v50(v69.props.RootItems, v69.props.GetChildren);
    if not v69.props.ExpandableRoot and v70.ExpandableRoot ~= v69.props.ExpandableRoot then
        local l_ExpandableRoot_1 = v69.props.ExpandableRoot;
        local l_RootItems_1 = v69.props.RootItems;
        local v73 = {};
        if not l_ExpandableRoot_1 then
            for _, v75 in pairs(l_RootItems_1) do
                v73[v75] = true;
            end;
        end;
        v69:setState({
            expansion = l_join_0(v69.state.expansion, {
                v73
            })
        });
    end;
end;
v39.render = function(v76) --[[ Line: 248 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v1 (copy), v6 (copy)
    assert(v76.props.Expansion and v76.props.OnExpansionChange or not v76.props.Expansion and not v76.props.OnExpansionChange, "Expansion is either entirely handled externally, or entirely handled by CheckboxTreeView.");
    local v77 = l_join_0(v76.rowProps, {
        Checked = v76.props.Checked, 
        GetContents = v76.props.GetContents, 
        OnSecondaryPress = v76.props.OnRightClick
    });
    return v1.createElement(v6, {
        Size = v76.props.Size, 
        Expansion = v76.props.Expansion or v76.state.expansion, 
        Selection = v76.props.Selection, 
        RootItems = v76.props.RootItems, 
        RowProps = v77, 
        Style = v76.props.Style, 
        OnExpansionChange = v76.props.OnExpansionChange or v76.onExpansionChange, 
        OnHoverRow = v76.props.OnHoverRow, 
        OnSelectionChange = v76.props.OnSelectionChange, 
        SortChildren = v76.props.SortChildren, 
        ScrollingDirection = v76.props.ScrollingDirection, 
        LayoutOrder = v76.props.LayoutOrder, 
        GetChildren = v76.props.GetChildren
    });
end;
return v39;