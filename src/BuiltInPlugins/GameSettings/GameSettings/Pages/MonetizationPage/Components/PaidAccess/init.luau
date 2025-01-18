local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v3 = require(l_Parent_1.Packages.Cryo);
local v4 = require(l_Parent_1.Packages.Roact);
local v5 = require(l_Parent_1.Packages.Framework);
local l_Util_0 = v5.Util;
local v7 = if v2 then nil else l_Util_0.FitFrame.FitFrameOnAxis;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v5.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_GuiService_0 = game:GetService("GuiService");
local l_PaidAccessInFiat_0 = game:GetFastFlag("PaidAccessInFiat");
local v19 = require(l_Parent_0.Components.RobuxFeeBase);
local l_shouldDisablePrivateServersAndPaidAccess_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).shouldDisablePrivateServersAndPaidAccess;
local v21 = v4.PureComponent:extend("PaidAccess");
v21.render = function(v22) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: l_shouldDisablePrivateServersAndPaidAccess_0 (copy), l_PaidAccessInFiat_0 (copy), v2 (copy), l_GetTextSize_0 (copy), v4 (copy), l_Pane_0 (copy), v7 (copy), l_TitledFrame_0 (copy), l_LinkText_0 (copy), l_GuiService_0 (copy), l_ToggleButton_0 (copy), l_TextLabel_0 (copy), v3 (copy), v19 (copy)
    if l_shouldDisablePrivateServersAndPaidAccess_0() then
        return nil;
    else
        local l_props_0 = v22.props;
        local v24 = nil;
        if l_PaidAccessInFiat_0 then
            v24 = l_props_0.GameId;
        end;
        local l_Localization_0 = l_props_0.Localization;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v27 = l_Localization_0:getText("Monetization", "TitlePaidAccess");
        local v28 = l_Localization_0:getText("Monetization", "PriceTitle");
        local v29 = l_props_0.Price and l_props_0.Price or 0;
        local l_TaxRate_0 = l_props_0.TaxRate;
        local l_MinimumFee_0 = l_props_0.MinimumFee;
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local l_Enabled_0 = l_props_0.Enabled;
        local l_Selected_0 = l_props_0.Selected;
        local l_OnPaidAccessToggle_0 = l_props_0.OnPaidAccessToggle;
        local l_OnPaidAccessPriceChanged_0 = l_props_0.OnPaidAccessPriceChanged;
        local v37 = nil;
        local l_PriceError_0 = l_props_0.PriceError;
        if l_Enabled_0 and l_PriceError_0 then
            v37 = l_PriceError_0;
        end;
        local v39 = l_Localization_0:getText("Monetization", "PaidAccessHint");
        local v40 = if v2 then nil else l_GetTextSize_0(v39, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.robuxFeeBase.subText.width, 1e999));
        return v4.createElement(if v2 then l_Pane_0 else v7, if v2 then {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0, 
            Spacing = l_Stylizer_0.titleSpacing
        } else {
            axis = v7.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, if l_PaidAccessInFiat_0 then {
            PaidAccessTitle = v4.createElement(l_TitledFrame_0, {
                LayoutOrder = 1, 
                Title = v27
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 4)
                }), 
                LinkText = v4.createElement(l_LinkText_0, {
                    OnClick = function() --[[ Line: 132 ]] --[[ Name: OnClick ]]
                        -- upvalues: v24 (ref), l_GuiService_0 (ref)
                        local v41 = "https://create.roblox.com/dashboard/creations/experiences/" .. v24 .. "/access";
                        if v41 and string.len(v41) > 0 then
                            l_GuiService_0:OpenBrowserWindow(v41);
                            return;
                        else
                            error("Failed to open Creation Experiences Access page");
                            return;
                        end;
                    end, 
                    Text = l_Localization_0:getText("Monetization", "PaidAccessDeepLink"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                })
            })
        } else {
            ToggleAndSubscriptionsAndTotal = v4.createElement(l_TitledFrame_0, {
                LayoutOrder = 1, 
                Title = v27
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                ToggleButton = v4.createElement(l_ToggleButton_0, {
                    Disabled = not l_Enabled_0, 
                    LayoutOrder = 1, 
                    OnClick = l_OnPaidAccessToggle_0, 
                    Selected = l_Selected_0
                }), 
                SubText = not l_Selected_0 and if v2 then v4.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Style = "Label", 
                    Text = v39, 
                    LayoutOrder = 2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v4.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                    Size = UDim2.new(0, math.ceil(v40.X), 0, v40.Y), 
                    BackgroundTransparency = 1, 
                    Text = v39, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    LayoutOrder = 2
                }))
            }), 
            PriceConfigPaidOnly = l_Selected_0 and v4.createElement(l_TitledFrame_0, {
                FillDirection = if v2 then Enum.FillDirection.Horizontal else nil, 
                LayoutOrder = 3, 
                Style = v2 and "Subtitle" or nil, 
                Title = v28
            }, {
                RobuxFeeBase = v4.createElement(v19, {
                    Price = v29, 
                    TaxRate = l_TaxRate_0, 
                    MinimumFee = l_MinimumFee_0, 
                    SubText = v37, 
                    Enabled = l_Enabled_0, 
                    OnPriceChanged = l_OnPaidAccessPriceChanged_0
                })
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v21));