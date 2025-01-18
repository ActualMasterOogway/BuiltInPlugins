local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local l_join_0 = require(l_Parent_1.Dash).join;
local v4 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_TreeView_0 = l_UI_0.TreeView;
local l_Pane_0 = l_UI_0.Pane;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Util_0 = v4.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_AccessoryAndBodyToolShared_0 = l_Parent_0.Util.AccessoryAndBodyToolShared;
local v15 = require(l_AccessoryAndBodyToolShared_0.PreviewConstants);
local v16 = require(l_AccessoryAndBodyToolShared_0.Constants);
local v17 = v2.PureComponent:extend("PreviewCategoryList");
l_Typecheck_0.wrap(v17, script);
v17.defaultProps = {
    LayoutOrder = 1
};
v17.init = function(v18) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_join_0 (copy)
    v18.state = {
        selection = {}, 
        expansion = {}, 
        expanded = true
    };
    v18.onExpansionChange = function(v19) --[[ Line: 52 ]]
        -- upvalues: v18 (copy), l_join_0 (ref)
        v18:setState({
            expansion = l_join_0(v18.state.expansion, v19)
        });
    end;
    v18.onSelectionChange = function(v20) --[[ Line: 58 ]]
        -- upvalues: v18 (copy)
        local v21 = next(v20);
        v18:setState({
            selection = v20
        });
        if v21 then
            v18.props.OnCategoryChanged(v21.key, v21.categoryFilter);
        end;
    end;
    v18.onArrowClick = function() --[[ Line: 68 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            expanded = not v18.state.expanded
        });
        if v18.props.OnArrowClick then
            v18.props.OnArrowClick();
        end;
    end;
end;
v17.buildCategoryList = function(v22) --[[ Line: 78 ]] --[[ Name: buildCategoryList ]]
    -- upvalues: v15 (copy), v16 (copy)
    if v22.items then
        return;
    else
        local l_Localization_0 = v22.props.Localization;
        v22.items = {};
        for v24, v25 in pairs(v15.TABS_INFO) do
            local v26 = {};
            for _, v28 in pairs(v15.CategoryPrefixes) do
                table.insert(v26, {
                    key = v24, 
                    categoryFilter = v28, 
                    text = l_Localization_0:getText(v16.LOCALIZATION_KEYS.Preview, v28)
                });
            end;
            table.insert(v22.items, {
                key = v24, 
                text = l_Localization_0:getText(v16.LOCALIZATION_KEYS.Preview, v25.LocalizationKey), 
                children = v26
            });
        end;
        return;
    end;
end;
v17.render = function(v29) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_TreeView_0 (copy), l_IconButton_0 (copy)
    local l_props_0 = v29.props;
    local l_state_0 = v29.state;
    local l_expanded_0 = l_state_0.expanded;
    local l_expansion_0 = l_state_0.expansion;
    local l_selection_0 = l_state_0.selection;
    local _ = l_props_0.OnArrowClick;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_IconSize_0 = l_Stylizer_0.IconSize;
    v29:buildCategoryList();
    local v39 = if l_expanded_0 then l_Stylizer_0.Width else l_IconSize_0;
    local v40 = if l_expanded_0 then l_Stylizer_0.Expanded else l_Stylizer_0.Collapsed;
    local v41 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(0, v39, 1, 0), 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = l_LayoutOrder_0, 
        Style = "Box"
    }, {
        ListContainer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 1, -l_IconSize_0), 
            LayoutOrder = v41:getNextOrder()
        }, {
            CategoryTreeView = l_expanded_0 and v2.createElement(l_TreeView_0, {
                Expansion = l_expansion_0, 
                Selection = l_selection_0, 
                RootItems = v29.items, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                OnExpansionChange = v29.onExpansionChange, 
                OnSelectionChange = v29.onSelectionChange
            })
        }), 
        ArrowContainer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_IconSize_0), 
            LayoutOrder = v41:getNextOrder()
        }, {
            Arrow = v2.createElement(l_IconButton_0, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, 0, 0, 0), 
                BackgroundStyle = "None", 
                Size = UDim2.fromOffset(l_IconSize_0, l_IconSize_0), 
                IconSize = l_IconSize_0, 
                LeftIcon = v40, 
                OnClick = v29.onArrowClick
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v17));