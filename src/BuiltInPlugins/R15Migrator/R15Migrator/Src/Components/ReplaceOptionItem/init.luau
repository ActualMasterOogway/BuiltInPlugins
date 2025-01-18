local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v10 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.R6Info);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v12 = v1.PureComponent:extend("ReplaceOptionItem");
v12.buildItems = function(v13) --[[ Line: 21 ]] --[[ Name: buildItems ]]
    -- upvalues: v10 (copy), v3 (copy)
    local l_FromText_0 = v13.props.FromText;
    local v15 = v10.Conversions[v10.PartsKey];
    local v16 = {};
    local v17 = v15[l_FromText_0];
    if not v17 then
        return;
    else
        for _, v19 in v17 do
            v16[v19] = true;
        end;
        v13.toItems = v3.Dictionary.keys(v16);
        table.sort(v13.toItems);
        return;
    end;
end;
v12.getIndex = function(_, v21, v22) --[[ Line: 41 ]] --[[ Name: getIndex ]]
    for v23, v24 in v22 do
        if v24 == v21 then
            return v23;
        end;
    end;
    return nil;
end;
v12.init = function(v25) --[[ Line: 51 ]] --[[ Name: init ]]
    v25:buildItems();
    v25.onToSelected = function(v26, _) --[[ Line: 54 ]]
        -- upvalues: v25 (copy)
        local l_props_0 = v25.props;
        local l_Enabled_0 = l_props_0.Enabled;
        local l_FromText_1 = l_props_0.FromText;
        local l_Key_0 = l_props_0.Key;
        l_props_0.UpdateReplaceRules(l_Key_0, l_FromText_1, v26, l_Enabled_0);
    end;
    v25.onChecked = function() --[[ Line: 62 ]]
        -- upvalues: v25 (copy)
        local l_props_1 = v25.props;
        local l_Enabled_1 = l_props_1.Enabled;
        local l_FromText_2 = l_props_1.FromText;
        local l_ToText_0 = l_props_1.ToText;
        local l_Key_1 = l_props_1.Key;
        l_props_1.UpdateReplaceRules(l_Key_1, l_FromText_2, l_ToText_0, not l_Enabled_1);
    end;
end;
v12.render = function(v37) --[[ Line: 72 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy)
    local l_props_2 = v37.props;
    local l_FromText_3 = l_props_2.FromText;
    local l_ToText_1 = l_props_2.ToText;
    local l_Enabled_2 = l_props_2.Enabled;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Size_0 = l_props_2.Size;
    local l_Position_0 = l_props_2.Position;
    local l_Selectable_0 = l_props_2.Selectable;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_0 = l_props_2.Localization;
    local v48 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Size = l_Size_0, 
        Position = l_Position_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Container = v1.createElement(l_Pane_0, {
            Position = UDim2.fromScale(0.5, 0.5), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(0, 0, 1, 0), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Spacing = l_Stylizer_0.Spacing, 
            Padding = l_Stylizer_0.Padding
        }, {
            EnabledToggle = v1.createElement(l_Pane_0, {
                Size = l_Stylizer_0.ToggleSize, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v48:getNextOrder()
            }, {
                Checkbox = if l_Selectable_0 then v1.createElement(l_Checkbox_0, {
                    Checked = l_Enabled_2, 
                    OnClick = v37.onChecked
                }) else nil
            }), 
            From = v1.createElement(l_TextLabel_0, {
                Text = l_FromText_3, 
                Size = l_Stylizer_0.FromLabelSize, 
                LayoutOrder = v48:getNextOrder(), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Style = not l_Selectable_0 and "Bold" or nil
            }), 
            To = if l_Selectable_0 then v1.createElement(l_SelectInput_0, {
                PlaceholderText = l_Localization_0:getText("ReplaceRulesPane", "WithPlaceholder"), 
                SelectedIndex = v37:getIndex(l_ToText_1, v37.toItems), 
                Items = v37.toItems, 
                OnItemActivated = v37.onToSelected, 
                Size = l_Stylizer_0.TextInputSize, 
                LayoutOrder = v48:getNextOrder()
            }) else v1.createElement(l_TextLabel_0, {
                Text = l_ToText_1, 
                Size = l_Stylizer_0.TextInputSize, 
                LayoutOrder = v48:getNextOrder(), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Style = not l_Selectable_0 and "Bold" or nil
            })
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v12));