local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Roact);
local l_Components_0 = l_Parent_0.Components;
local v4 = require(l_Components_0.InstanceSelectorButton);
local v5 = require(l_Parent_0.Resources);
local v6 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Util_0 = v6.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v15 = v2.PureComponent:extend("PreviewTopBar");
l_Typecheck_0.wrap(v15, script);
v15.defaultProps = {
    LayoutOrder = 1
};
v15.render = function(v16) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v5 (copy), v2 (copy), l_Pane_0 (copy), v4 (copy), l_SearchBar_0 (copy)
    local l_props_0 = v16.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_Padding_0 = l_Stylizer_0.Padding;
    local l_OnSearchRequested_0 = l_props_0.OnSearchRequested;
    local l_OnClickAddNewInstance_0 = l_props_0.OnClickAddNewInstance;
    local l_OnInstanceSelectorValidSelection_0 = l_props_0.OnInstanceSelectorValidSelection;
    local l_OnInstanceSelectorInvalidSelection_0 = l_props_0.OnInstanceSelectorInvalidSelection;
    local l_IsSelectedInstanceValid_0 = l_props_0.IsSelectedInstanceValid;
    local v27 = l_LayoutOrderIterator_0.new();
    local v28 = l_Localization_0:getProjectText(v5.LOCALIZATION_PROJECT_NAME, "PreviewTopBar", "Tooltip");
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height), 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Padding_0, 
        Padding = {
            Left = l_Padding_0, 
            Right = l_Padding_0
        }
    }, {
        AddItemButton = v2.createElement(v4, {
            Size = UDim2.fromOffset(l_Stylizer_0.ButtonWidth, l_Stylizer_0.Height), 
            LayoutOrder = v27:getNextOrder(), 
            IsSelectedInstanceValid = l_IsSelectedInstanceValid_0, 
            Tooltip = v28, 
            OnClickAddNewInstance = l_OnClickAddNewInstance_0, 
            OnInstanceSelectorValidSelection = l_OnInstanceSelectorValidSelection_0, 
            OnInstanceSelectorInvalidSelection = l_OnInstanceSelectorInvalidSelection_0
        }), 
        SearchBarContainer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, -l_Stylizer_0.ButtonWidth - l_Padding_0 * 3, 0, l_Stylizer_0.Height), 
            LayoutOrder = v27:getNextOrder()
        }, {
            SearchBar = v2.createElement(l_SearchBar_0, {
                PlaceholderText = l_Localization_0:getProjectText(v5.LOCALIZATION_PROJECT_NAME, "PreviewTopBar", "SearchBarPlaceholder"), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                OnSearchRequested = l_OnSearchRequested_0
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15));