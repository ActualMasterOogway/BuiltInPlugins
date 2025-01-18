local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_prioritize_0 = require(l_Parent_0.Util).prioritize;
local v5 = require(l_Parent_0.Util.Typecheck);
local l_UI_0 = l_Parent_0.UI;
local v7 = require(l_UI_0.Components.Pane);
local v8 = require(l_UI_0.Components.RadioButton);
local v9 = v1.PureComponent:extend("RadioButtonList");
v5.wrap(v9, script);
v9.defaultProps = {
    OnClick = function() --[[ Line: 38 ]] --[[ Name: OnClick ]]

    end
};
v9.init = function(v10) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: l_prioritize_0 (copy)
    v10.state = {
        selectedKey = v10.props.SelectedKey
    };
    v10.onClick = function(v11, v12) --[[ Line: 46 ]]
        -- upvalues: v10 (copy), l_prioritize_0 (ref)
        local l_props_0 = v10.props;
        local l_state_0 = v10.state;
        local l_CurrentSelectedKey_0 = l_props_0.CurrentSelectedKey;
        local l_OnClick_0 = l_props_0.OnClick;
        if v12 then
            return;
        else
            if l_prioritize_0(l_CurrentSelectedKey_0, l_state_0.selectedKey) ~= v11 then
                l_OnClick_0(v11);
                v10:setState({
                    selectedKey = v11
                });
            end;
            return;
        end;
    end;
end;
v9.render = function(v17) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v1 (copy), v8 (copy), v7 (copy)
    local l_props_1 = v17.props;
    local l_state_1 = v17.state;
    local l_AutomaticSize_0 = v17.props.AutomaticSize;
    local l_Buttons_0 = l_props_1.Buttons;
    local l_CurrentSelectedKey_1 = l_props_1.CurrentSelectedKey;
    local l_FillDirection_0 = l_props_1.FillDirection;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_TextSize_0 = l_props_1.TextSize;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_RadioButtonStyle_0 = l_Stylizer_0.RadioButtonStyle;
    local v28 = {};
    local v29 = l_prioritize_0(v17.props.TextWrapped, l_Stylizer_0.TextWrapped);
    local v30 = l_prioritize_0(v17.props.TextXAlignment, l_Stylizer_0.TextXAlignment);
    local v31 = l_prioritize_0(v17.props.VerticalAlignment, l_Stylizer_0.VerticalAlignment);
    for v32, v33 in ipairs(l_Buttons_0) do
        local v34 = l_prioritize_0(l_CurrentSelectedKey_1, l_state_1.selectedKey) == v33.Key;
        local v35 = nil;
        if l_AutomaticSize_0 == Enum.AutomaticSize.Y then
            v35 = UDim2.new(1, 0, 0, 0);
        end;
        v28[v33.Key] = v1.createElement(v8, {
            AutomaticSize = l_AutomaticSize_0, 
            Description = v33.Description, 
            LinkProps = v33.LinkProps, 
            Disabled = v33.Disabled, 
            Key = v33.Key, 
            LayoutOrder = v32, 
            OnClick = function() --[[ Line: 104 ]] --[[ Name: OnClick ]]
                -- upvalues: v17 (copy), v33 (copy)
                v17.onClick(v33.Key, v33.Disabled);
            end, 
            Size = v35, 
            Style = l_RadioButtonStyle_0, 
            Selected = v34, 
            Text = v33.Text, 
            TextSize = l_TextSize_0, 
            TextWrapped = v29, 
            TextXAlignment = v30, 
            VerticalAlignment = v31
        });
    end;
    return v1.createElement(v7, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Spacing = UDim.new(0, l_Stylizer_0.Padding), 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = l_prioritize_0(l_FillDirection_0, l_Stylizer_0.FillDirection, Enum.FillDirection.Vertical), 
        LayoutOrder = l_LayoutOrder_0
    }, v28);
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v9));