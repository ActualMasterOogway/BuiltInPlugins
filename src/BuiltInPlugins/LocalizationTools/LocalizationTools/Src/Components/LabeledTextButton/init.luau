local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_LocalizationToolsUpdateTextScraperUI_0 = game:GetFastFlag("LocalizationToolsUpdateTextScraperUI");
local v11 = v1.PureComponent:extend("LabeledTextButton");
v11.render = function(v12) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_LocalizationToolsUpdateTextScraperUI_0 (copy), l_Button_0 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LabelText_0 = l_props_0.LabelText;
    local l_ButtonText_0 = l_props_0.ButtonText;
    local l_Active_0 = l_props_0.Active;
    local v19 = l_Active_0 and l_props_0.OnButtonClick or function() --[[ Line: 29 ]]

    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.Height)
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_Stylizer_0.LabelWidth, 1, 0), 
            Text = l_LabelText_0, 
            StyleModifier = if l_Active_0 then nil else l_StyleModifier_0.Disabled, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = l_LocalizationToolsUpdateTextScraperUI_0
        }), 
        ButtonContainer = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 1, 0)
        }, {
            Button = v1.createElement(l_Button_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                OnClick = v19, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonHeight), 
                Style = l_Active_0 and "TextButton" or "DisabledTextButton", 
                Text = l_ButtonText_0
            }, {
                v1.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));