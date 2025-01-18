local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_AccessoryUtil_0 = l_AccessoryAndBodyToolShared_0.AccessoryUtil;
local l_Constants_0 = l_AccessoryAndBodyToolShared_0.Constants;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v14 = require(l_Parent_0.Src.Util.findLocalizedStringKey);
local v15 = require(l_Parent_0.Src.Util.makeDropdownList);
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local l_Util_0 = v4.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v20 = v1.PureComponent:extend("ScaleTypeDropdown");
l_Typecheck_0.wrap(v20, script);
v20.initWithPreviousScaleTypeInfo = function(v21) --[[ Line: 48 ]] --[[ Name: initWithPreviousScaleTypeInfo ]]
    -- upvalues: l_AccessoryUtil_0 (copy), l_Constants_0 (copy), v2 (copy)
    local l_props_0 = v21.props;
    local v23 = v21.props.EditingItemContext:getItem();
    local v24 = l_AccessoryUtil_0:getScaleType(v23);
    local v25 = nil;
    v25 = if v24 then l_props_0.Localization:getText("ScaleType", v24) else l_props_0.Localization:getText("ScaleType", l_Constants_0.SCALE_TYPES.Classic);
    v21.onClickScaleType(v25, v2.List.find(v21.scaleTypeList, v25));
end;
v20.didMount = function(v26) --[[ Line: 64 ]] --[[ Name: didMount ]]
    -- upvalues: v15 (copy), l_Constants_0 (copy), v14 (copy), l_AccessoryUtil_0 (copy)
    local l_props_1 = v26.props;
    v26.scaleTypeList = v15(l_props_1.Localization, "ScaleType", l_Constants_0.SCALE_TYPES);
    v26:initWithPreviousScaleTypeInfo();
    v26.editingItemChangedHandle = v26.props.EditingItemContext:getEditingItemChangedSignal():Connect(function(v28) --[[ Line: 72 ]]
        -- upvalues: v26 (copy), v14 (ref), l_props_1 (copy), l_Constants_0 (ref), l_AccessoryUtil_0 (ref)
        local v29 = v26.scaleTypeList[v26.state.selectedScaleTypeIndex];
        local v30 = v14(l_props_1.Localization, "ScaleType", v29, l_Constants_0.SCALE_TYPES);
        l_AccessoryUtil_0:setScaleType(v28, v30);
    end);
end;
v20.init = function(v31) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), l_Constants_0 (copy), l_AccessoryUtil_0 (copy)
    v31.state = {
        selectedScaleTypeIndex = nil
    };
    v31.onClickScaleType = function(v32, v33) --[[ Line: 85 ]]
        -- upvalues: v31 (copy), v14 (ref), l_Constants_0 (ref), l_AccessoryUtil_0 (ref)
        local l_props_2 = v31.props;
        local v35 = v14(l_props_2.Localization, "ScaleType", v32, l_Constants_0.SCALE_TYPES);
        l_AccessoryUtil_0:setScaleType(l_props_2.EditingItemContext:getItem(), v35);
        v31:setState({
            selectedScaleTypeIndex = v33
        });
    end;
end;
v20.render = function(v36) --[[ Line: 96 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_SelectInput_0 (copy)
    local l_props_3 = v36.props;
    local l_state_0 = v36.state;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_Localization_0 = l_props_3.Localization;
    local l_selectedScaleTypeIndex_0 = l_state_0.selectedScaleTypeIndex;
    local v43 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.DropdownHeight), 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_0.Spacing
    }, {
        SelectPartScalePrompt = v1.createElement(l_TextLabel_0, {
            Text = l_Localization_0:getText("ScaleType", "Select") .. ":", 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v43:getNextOrder()
        }), 
        AvatarPartScaleTypeDropdown = v1.createElement(l_SelectInput_0, {
            Size = UDim2.new(0, l_Stylizer_0.DropdownWidth, 1, 0), 
            Items = v36.scaleTypeList, 
            OnItemActivated = v36.onClickScaleType, 
            SelectedIndex = l_selectedScaleTypeIndex_0, 
            LayoutOrder = v43:getNextOrder()
        })
    });
end;
v20.willUnmount = function(v44) --[[ Line: 132 ]] --[[ Name: willUnmount ]]
    if v44.editingItemChangedHandle then
        v44.editingItemChangedHandle:Disconnect();
        v44.editingItemChangedHandle = nil;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    EditingItemContext = l_EditingItemContext_0
})(v20));