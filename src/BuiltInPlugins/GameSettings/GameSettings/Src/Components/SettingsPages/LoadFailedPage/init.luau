local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Button_0 = l_UI_0.Button;
local l_Container_0 = l_UI_0.Container;
local l_HoverArea_0 = l_UI_0.HoverArea;
local v11 = v2.Component:extend(script.Name);
v11.init = function(v12) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v12.failurePageRef = v2.createRef();
end;
v11.render = function(v13) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v2 (copy), l_Container_0 (copy), v3 (copy), l_Button_0 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v13.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnRetry_0 = l_props_0.OnRetry;
    local v18 = l_Localization_0:getText("General", "SettingsFailedToLoad");
    local v19 = l_Localization_0:getText("General", "ButtonRetry");
    local v20 = v13.failurePageRef:getValue() and v13.failurePageRef:getValue().AbsoluteSize.X - l_Stylizer_0.settingsPage.failLabelPaddingX or 1e999;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v18, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(v20, 1e999));
    local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v19, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(1e999, 1e999));
    return v2.createElement(l_Container_0, {
        [v2.Ref] = v13.failurePageRef
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, l_Stylizer_0.settingsPage.failPageListPaddingY)
        }), 
        Label = v2.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            LayoutOrder = 1, 
            Text = v18, 
            Size = UDim2.fromOffset(l_l_TextService_0_TextSize_0.X, l_l_TextService_0_TextSize_0.Y), 
            BackgroundTransparency = 1
        }), {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Stylizer_0.settingsPage.failLabelPaddingX / 2), 
                PaddingRight = UDim.new(0, l_Stylizer_0.settingsPage.failLabelPaddingX / 2)
            })
        }), 
        PublishButton = v2.createElement(l_Button_0, {
            LayoutOrder = 2, 
            Style = "GameSettingsPrimaryButton", 
            Text = v19, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_1.X + l_Stylizer_0.settingsPage.reloadButton.paddingX, 0, l_l_TextService_0_TextSize_1.Y + l_Stylizer_0.settingsPage.reloadButton.paddingY), 
            OnClick = function() --[[ Line: 95 ]] --[[ Name: OnClick ]]
                -- upvalues: l_OnRetry_0 (copy)
                l_OnRetry_0();
            end
        }, {
            v2.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));