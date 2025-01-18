local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetFilter);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Util_0 = v1.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v15 = v2.PureComponent:extend("ScriptConversionPaneHeader");
v15.buildItems = function(v16) --[[ Line: 23 ]] --[[ Name: buildItems ]]
    -- upvalues: v3 (copy)
    local l_props_0 = v16.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_diagnostics_0 = l_props_0.diagnostics;
    local v20 = {};
    for _, v22 in l_diagnostics_0 do
        for _, v24 in v22:Get() do
            v20[v24.instanceName] = true;
        end;
    end;
    local v25 = v3.Dictionary.keys(v20);
    table.sort(v25);
    return v3.List.join({
        l_Localization_0:getText("ScriptConversion", "FilterNone")
    }, v25);
end;
v15.getFilterIndex = function(v26, v27, v28) --[[ Line: 42 ]] --[[ Name: getFilterIndex ]]
    if not v28 then
        v28 = v26.state.items;
    end;
    for v29, v30 in v28 do
        if v30 == v27 then
            return v29;
        end;
    end;
    return nil;
end;
v15.init = function(v31) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_TextLabel_0 (copy)
    v31.state = {
        items = {}
    };
    v31.onFilterSelected = function(v32) --[[ Line: 62 ]]
        -- upvalues: v31 (copy)
        v31.props.SetFilter(v32);
    end;
    v31.onRenderItem = function(v33, v34, v35, v36) --[[ Line: 66 ]]
        -- upvalues: v31 (copy), v2 (ref), l_Button_0 (ref), l_StyleModifier_0 (ref), l_TextLabel_0 (ref)
        local l_Stylizer_0 = v31.props.Stylizer;
        local l_ItemHeight_0 = l_Stylizer_0.ItemHeight;
        local l_ListItemTextSize_0 = l_Stylizer_0.ListItemTextSize;
        return v2.createElement(l_Button_0, {
            LayoutOrder = v34, 
            OnClick = v35, 
            Size = UDim2.new(1, 0, 0, l_ItemHeight_0), 
            StyleModifier = if v36 then l_StyleModifier_0.Hover else nil
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v33, 
                TextSize = l_ListItemTextSize_0, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_Stylizer_0.ListItemPadding)
                })
            })
        });
    end;
end;
v15.didMount = function(v40) --[[ Line: 95 ]] --[[ Name: didMount ]]
    v40:setState({
        items = v40:buildItems()
    });
end;
v15.didUpdate = function(v41, v42, _) --[[ Line: 101 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v41.props;
    local l_filter_0 = l_props_1.filter;
    local l_Localization_1 = l_props_1.Localization;
    if l_props_1.diagnostics ~= v42.diagnostics then
        local v47 = v41:buildItems();
        v41:setState({
            items = v47
        });
        if not v41:getFilterIndex(l_filter_0, v47) then
            v41.props.SetFilter(l_Localization_1:getText("ScriptConversion", "FilterNone"));
        end;
    end;
end;
v15.render = function(v48) --[[ Line: 118 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy)
    local l_props_2 = v48.props;
    local l_items_0 = v48.state.items;
    local l_Localization_2 = l_props_2.Localization;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_Size_0 = l_props_2.Size;
    local l_filter_1 = l_props_2.filter;
    local v56 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Padding = l_Stylizer_1.Padding, 
        Spacing = l_Stylizer_1.Spacing
    }, {
        FilterContainer = v2.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.FilterHeight), 
            LayoutOrder = v56:getNextOrder()
        }, {
            FilterLabel = v2.createElement(l_TextLabel_0, {
                Text = l_Localization_2:getText("ScriptConversion", "Filter"), 
                Position = UDim2.fromScale(0, 0.5), 
                AnchorPoint = Vector2.new(0, 0.5), 
                AutomaticSize = Enum.AutomaticSize.XY
            }), 
            Filter = v2.createElement(l_SelectInput_0, {
                AnchorPoint = Vector2.new(1, 0), 
                PlaceholderText = l_Localization_2:getText("ScriptConversion", "Filter"), 
                SelectedIndex = v48:getFilterIndex(l_filter_1), 
                Items = l_items_0, 
                OnItemActivated = v48.onFilterSelected, 
                OnRenderItem = v48.onRenderItem, 
                Size = UDim2.fromOffset(l_Stylizer_1.FilterWidth, l_Stylizer_1.FilterHeight), 
                Position = UDim2.fromScale(1, 0), 
                LayoutOrder = v56:getNextOrder()
            })
        })
    });
end;
v15 = l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15);
return v4.connect(function(v57, _) --[[ Line: 171 ]] --[[ Name: mapStateToProps ]]
    return {
        diagnostics = v57.ScriptConversion.diagnostics, 
        filter = v57.ScriptConversion.filter
    };
end, function(v59) --[[ Line: 178 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v6 (copy)
    return {
        SetFilter = function(v60) --[[ Line: 180 ]] --[[ Name: SetFilter ]]
            -- upvalues: v59 (copy), v6 (ref)
            v59(v6(v60));
        end
    };
end)(v15);