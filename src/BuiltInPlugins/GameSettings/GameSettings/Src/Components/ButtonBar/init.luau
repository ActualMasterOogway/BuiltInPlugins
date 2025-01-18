local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_Button_0 = v2.UI.Button;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v8 = v1.PureComponent:extend("ButtonBar");
v8.render = function(v9) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Button_0 (copy), v7 (copy), l_StyleModifier_0 (copy)
    local l_props_0 = v9.props;
    local l_HorizontalAlignment_0 = l_props_0.HorizontalAlignment;
    local l_Buttons_0 = l_props_0.Buttons;
    local v13 = l_props_0[v1.Children];
    local v14 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 25), 
            HorizontalAlignment = l_HorizontalAlignment_0, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }, v13)
    };
    if l_HorizontalAlignment_0 ~= Enum.HorizontalAlignment.Center then
        table.insert(v14, v1.createElement("UIPadding", {
            PaddingRight = UDim.new(0, 35)
        }));
    end;
    for v15, v16 in ipairs(l_Buttons_0) do
        table.insert(v14, v1.createElement(l_Button_0, {
            LayoutOrder = v15, 
            Style = v16.Default and "GameSettingsPrimaryButton" or "GameSettingsButton", 
            Size = UDim2.new(0, v7.BUTTON_WIDTH, 1, 0), 
            StyleModifier = if v16.Active then nil else l_StyleModifier_0.Disabled, 
            Text = v16.Name, 
            OnClick = function() --[[ Line: 63 ]] --[[ Name: OnClick ]]
                -- upvalues: v16 (copy), l_props_0 (copy)
                if v16.Active then
                    l_props_0.ButtonClicked(v16.Value);
                end;
            end
        }));
    end;
    return v1.createElement("Frame", {
        LayoutOrder = l_props_0.LayoutOrder or 1, 
        Size = UDim2.new(1, 0, 0, v7.BUTTON_HEIGHT), 
        AnchorPoint = l_props_0.AnchorPoint or Vector2.new(0, 0.5), 
        Position = l_props_0.Position or UDim2.new(0, 0, 0.5, 0), 
        BackgroundTransparency = 1
    }, v14);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));