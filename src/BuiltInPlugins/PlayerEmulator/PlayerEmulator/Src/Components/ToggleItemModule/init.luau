local l_EnablePseudolocalizationInPlayerEmulator2_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator2");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v10 = v2.PureComponent:extend("ToggleItemModule");
v10.init = function(v11, v12) --[[ Line: 31 ]] --[[ Name: init ]]
    v11.onToggle = function(v13) --[[ Line: 32 ]]
        -- upvalues: v11 (copy), v12 (copy)
        if v11.props.Enabled then
            local l_Key_0 = v12.Key;
            v12.ToggleCallback(l_Key_0, v13, v12.Plugin:get());
        end;
    end;
end;
v10.render = function(v15) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_EnablePseudolocalizationInPlayerEmulator2_0 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_ToggleButton_0 (copy)
    local l_props_0 = v15.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Key_1 = l_props_0.Key;
    local l_IsOn_0 = l_props_0.IsOn;
    local l_Enabled_0 = l_props_0.Enabled;
    return v2.createElement("Frame", {
        AutomaticSize = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.AutomaticSize.Y else nil, 
        Size = if l_EnablePseudolocalizationInPlayerEmulator2_0 then UDim2.new(1, 0, 0, l_Stylizer_0.TOGGLE_BUTTON_HEIGHT) else l_Stylizer_0.TOGGLE_ITEM_FRAME_SIZE, 
        BackgroundTransparency = 1
    }, {
        Layout = if l_EnablePseudolocalizationInPlayerEmulator2_0 then v2.createElement("UIListLayout", {
            HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }) else nil, 
        TextLabel = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            StyleModifier = if l_Enabled_0 then nil else l_StyleModifier_0.Disabled, 
            Text = l_Key_1, 
            TextXAlignment = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.TextXAlignment.Left else nil, 
            TextWrapped = l_EnablePseudolocalizationInPlayerEmulator2_0 and true or nil, 
            TextTruncate = if l_EnablePseudolocalizationInPlayerEmulator2_0 then Enum.TextTruncate.SplitWord else nil, 
            LayoutOrder = l_EnablePseudolocalizationInPlayerEmulator2_0 and 1 or nil
        }, {
            FlexItem = if l_EnablePseudolocalizationInPlayerEmulator2_0 then v2.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Shrink
            }) else nil
        }), 
        Toggle = v2.createElement(l_ToggleButton_0, {
            AnchorPoint = if l_EnablePseudolocalizationInPlayerEmulator2_0 then nil else Vector2.new(0, 0.5), 
            Disabled = not l_Enabled_0, 
            OnClick = v15.onToggle, 
            Position = if l_EnablePseudolocalizationInPlayerEmulator2_0 then nil else UDim2.new(0, l_Stylizer_0.TOGGLE_BUTTON_OFFSET, 0.5, -l_Stylizer_0.TOGGLE_BUTTON_HEIGHT / 2), 
            Selected = l_IsOn_0, 
            LayoutOrder = l_EnablePseudolocalizationInPlayerEmulator2_0 and 2 or nil
        })
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));