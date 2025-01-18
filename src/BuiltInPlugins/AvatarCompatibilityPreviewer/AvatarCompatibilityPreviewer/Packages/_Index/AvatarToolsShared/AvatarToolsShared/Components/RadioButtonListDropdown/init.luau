local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Pane_0 = l_UI_0.Pane;
local v9 = v1.PureComponent:extend("RadioButtonListDropdown");
v9.calculateDropdownOffset = function(v10, v11) --[[ Line: 15 ]] --[[ Name: calculateDropdownOffset ]]
    local l_Stylizer_0 = v10.props.Stylizer;
    local l_Spacing_0 = l_Stylizer_0.Spacing;
    local l_DropdownWidth_0 = l_Stylizer_0.DropdownWidth;
    local v15 = v10.frameRef:getValue();
    local v16 = v15.RadioButtonList[v11];
    if not v16 then
        return;
    else
        local l_AbsolutePosition_0 = v15.AbsolutePosition;
        local v18 = v16.AbsolutePosition.Y - l_AbsolutePosition_0.Y;
        local v19 = v16.AbsoluteSize.X + l_Spacing_0;
        local v20 = UDim2.fromOffset(v19, v18);
        local v21 = UDim2.fromOffset(v19 + l_Spacing_0 + l_DropdownWidth_0, v18);
        v10:setState({
            dropdownOffset = v20, 
            subListOffset = v21
        });
        return;
    end;
end;
v9.init = function(v22) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v22.frameRef = v1.createRef();
    v22.onRadioButtonClick = function(v23) --[[ Line: 48 ]]
        -- upvalues: v22 (copy)
        if v22.props.OnRadioButtonClick then
            v22.props.OnRadioButtonClick(v23);
        end;
        v22:calculateDropdownOffset(v23);
    end;
end;
v9.didMount = function(v24) --[[ Line: 56 ]] --[[ Name: didMount ]]
    if v24.props.InitialSelectedKey then
        v24:calculateDropdownOffset(v24.props.InitialSelectedKey);
    end;
end;
v9.render = function(v25) --[[ Line: 62 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_RadioButtonList_0 (copy), l_SelectInput_0 (copy)
    local l_props_0 = v25.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Buttons_0 = l_props_0.Buttons;
    local l_InitialSelectedKey_0 = l_props_0.InitialSelectedKey;
    local l_SelectedIndex_0 = l_props_0.SelectedIndex;
    local l_OnItemActivated_0 = l_props_0.OnItemActivated;
    local l_Items_0 = l_props_0.Items;
    local l_SubListItems_0 = l_props_0.SubListItems;
    local l_OnSubListItemActivated_0 = l_props_0.OnSubListItemActivated;
    local l_SubListSelectedIndex_0 = l_props_0.SubListSelectedIndex;
    local l_createElement_0 = v1.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v39 = {
        Size = UDim2.new(1, 0, 0, 2 * l_Stylizer_1.DropdownHeight), 
        LayoutOrder = l_LayoutOrder_0, 
        ForwardRef = v25.frameRef
    };
    local v40 = {
        RadioButtonList = v1.createElement(l_RadioButtonList_0, {
            Buttons = l_Buttons_0, 
            OnClick = v25.onRadioButtonClick, 
            SelectedKey = l_InitialSelectedKey_0
        })
    };
    local v41 = false;
    if l_Items_0 ~= nil then
        v41 = v1.createElement(l_SelectInput_0, {
            Position = v25.state.dropdownOffset, 
            Size = UDim2.fromOffset(l_Stylizer_1.DropdownWidth, l_Stylizer_1.DropdownHeight), 
            Items = l_Items_0, 
            OnItemActivated = l_OnItemActivated_0, 
            SelectedIndex = l_SelectedIndex_0
        });
    end;
    v40.Dropdown = v41;
    v41 = false;
    if l_SubListItems_0 ~= nil then
        v41 = v1.createElement(l_SelectInput_0, {
            Position = v25.state.subListOffset, 
            Size = UDim2.fromOffset(l_Stylizer_1.DropdownWidth, l_Stylizer_1.DropdownHeight), 
            Items = l_SubListItems_0, 
            OnItemActivated = l_OnSubListItemActivated_0, 
            SelectedIndex = l_SubListSelectedIndex_0
        });
    end;
    v40.SubListDropdown = v41;
    return l_createElement_0(l_l_Pane_0_0, v39, v40);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));