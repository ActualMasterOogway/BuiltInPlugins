local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.Framework);
local v5 = require(l_Parent_1.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local l_Util_0 = v4.Util;
local v7 = if v5 then nil else l_Util_0.FitFrame.FitFrameOnAxis;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_1.Src.Components.RadioButtonSet);
local v13 = require(l_Parent_0.Components.RobuxFeeBase);
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_shouldDisablePrivateServersAndPaidAccess_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).shouldDisablePrivateServersAndPaidAccess;
local v20 = v3.PureComponent:extend("VIPServers");
v20.init = function(v21) --[[ Line: 66 ]] --[[ Name: init ]]
    v21.lastNonFreePrice = 10;
end;
v20.render = function(v22) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: l_shouldDisablePrivateServersAndPaidAccess_0 (copy), l_LayoutOrderIterator_0 (copy), v5 (copy), l_GetTextSize_0 (copy), v3 (copy), v13 (copy), l_Pane_0 (copy), v7 (copy), l_TitledFrame_0 (copy), l_ToggleButton_0 (copy), l_TextLabel_0 (copy), v2 (copy), v12 (copy)
    if l_shouldDisablePrivateServersAndPaidAccess_0() then
        return nil;
    else
        local l_props_0 = v22.props;
        local l_Localization_0 = l_props_0.Localization;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v26 = l_LayoutOrderIterator_0.new();
        local v27 = l_Localization_0:getText("Monetization", "PrivateServersTitle");
        local v28 = l_Localization_0:getText("Monetization", "PriceTitle");
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local v30 = l_props_0.VIPServersData and l_props_0.VIPServersData or {};
        local l_Enabled_0 = l_props_0.Enabled;
        local l_TaxRate_0 = l_props_0.TaxRate;
        local l_MinimumFee_0 = l_props_0.MinimumFee;
        local l_isEnabled_0 = v30.isEnabled;
        local v35 = v30.price and v30.price or 0;
        local v36 = v30.activeServersCount and v30.activeServersCount or 0;
        local v37 = v30.activeSubscriptionsCount and v30.activeSubscriptionsCount or 0;
        local l_changed_0 = v30.changed;
        local l_willShutdown_0 = v30.willShutdown;
        local v40 = v35 == 0;
        if not v40 then
            v22.lastNonFreePrice = v35;
        end;
        local l_OnVipServersToggled_0 = l_props_0.OnVipServersToggled;
        local l_OnVipServersPriceChanged_0 = l_props_0.OnVipServersPriceChanged;
        local v43 = nil;
        local v44 = nil;
        v43 = if v37 < 0 then l_Localization_0:getText("Monetization", "OverPrivateServerSubscriptions", {
            numOfSubscriptions = v37 * -1
        }) else l_Localization_0:getText("Monetization", "PrivateServerSubscriptions", {
            numOfSubscriptions = v37
        });
        v44 = l_Localization_0:getText("Monetization", "PrivateServersActive", {
            totalVipServers = v36
        });
        local v45 = if v5 then nil else l_Enabled_0 and l_Stylizer_0.robuxFeeBase.transparency.enabled or l_Stylizer_0.robuxFeeBase.transparency.disabled;
        local v46 = nil;
        local v47 = nil;
        local l_PriceError_0 = l_props_0.PriceError;
        local v49 = nil;
        if l_Enabled_0 and l_PriceError_0 then
            v46 = l_PriceError_0;
        elseif l_changed_0 then
            v46 = l_Localization_0:getText("Monetization", "PrivateServersPriceChangeWarning");
            v49 = true;
        end;
        v47 = l_Localization_0:getText("Monetization", "PrivateServersHint");
        if l_willShutdown_0 then
            v47 = l_Localization_0:getText("Monetization", "PrivateServersShutdownWarning");
        end;
        local v50 = if v5 then nil else l_GetTextSize_0(v47, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.robuxFeeBase.subText.width, 1e999));
        local v51 = not l_isEnabled_0 or not l_isEnabled_0 and l_changed_0;
        local v52 = not l_isEnabled_0 and (l_changed_0 or l_willShutdown_0) and l_Stylizer_0.fontStyle.SmallError or l_Stylizer_0.fontStyle.Subtext;
        local v53 = {
            {
                Id = true, 
                Title = l_Localization_0:getText("Monetization", "Free")
            }, 
            {
                Id = false, 
                Title = l_Localization_0:getText("Monetization", "Paid"), 
                Children = {
                    RobuxFeeBase = v3.createElement(v13, {
                        Price = v35, 
                        TaxRate = l_TaxRate_0, 
                        MinimumFee = l_MinimumFee_0, 
                        SubText = v46, 
                        Enabled = not v40, 
                        OnPriceChanged = l_OnVipServersPriceChanged_0, 
                        HasPriceChanged = l_changed_0, 
                        LayoutOrder = v26:getNextOrder(), 
                        ShowPriceChangeWarning = v49
                    })
                }
            }
        };
        return v3.createElement(if v5 then l_Pane_0 else v7, if v5 then {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0, 
            Spacing = if v5 then l_Stylizer_0.titleSpacing else nil
        } else {
            axis = v7.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            ToggleAndSubscriptionsAndTotal = v3.createElement(l_TitledFrame_0, {
                LayoutOrder = 1, 
                Title = v27
            }, {
                UIListLayout = if v5 then nil else v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                ToggleButton = v3.createElement(l_ToggleButton_0, {
                    Disabled = not l_Enabled_0, 
                    Selected = l_isEnabled_0, 
                    OnClick = l_OnVipServersToggled_0, 
                    LayoutOrder = 1
                }), 
                SubText = v51 and if v5 then v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Style = "Label", 
                    Text = v47, 
                    LayoutOrder = 2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v3.createElement("TextLabel", v2.Dictionary.join(v52, {
                    Size = UDim2.new(0, math.ceil(v50.X), 0, v50.Y), 
                    BackgroundTransparency = 1, 
                    Text = v47, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    LayoutOrder = 2
                })), 
                Subscriptions = l_isEnabled_0 and if v5 then v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    Style = "Label", 
                    Text = v43, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v3.createElement("TextLabel", {
                    Font = l_Stylizer_0.fontStyle.Normal.Font, 
                    TextSize = l_Stylizer_0.fontStyle.Normal.TextSize, 
                    TextColor3 = l_isEnabled_0 and l_Stylizer_0.fontStyle.Normal.TextColor3 or l_Stylizer_0.fontStyle.Subtext.TextColor3, 
                    Text = v43, 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = v45, 
                    LayoutOrder = 2
                }), 
                TotalVIPServers = l_isEnabled_0 and if v5 then v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 3, 
                    Style = "Label", 
                    Text = v44, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v3.createElement("TextLabel", {
                    Font = l_Stylizer_0.fontStyle.Normal.Font, 
                    TextSize = l_Stylizer_0.fontStyle.Normal.TextSize, 
                    TextColor3 = l_isEnabled_0 and l_Stylizer_0.fontStyle.Normal.TextColor3 or l_Stylizer_0.fontStyle.Subtext.TextColor3, 
                    Text = v44, 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = v45, 
                    LayoutOrder = 3
                })
            }), 
            PriceConfig = l_isEnabled_0 and v3.createElement(v12, {
                Title = v28, 
                FillDirection = if v5 then Enum.FillDirection.Horizontal else nil, 
                Buttons = v53, 
                Enabled = l_isEnabled_0, 
                Selected = v40, 
                SelectionChanged = function(v54) --[[ Line: 304 ]] --[[ Name: SelectionChanged ]]
                    -- upvalues: l_OnVipServersPriceChanged_0 (copy), v22 (copy)
                    if v54.Id then
                        l_OnVipServersPriceChanged_0(0);
                        return;
                    else
                        l_OnVipServersPriceChanged_0(v22.lastNonFreePrice);
                        return;
                    end;
                end, 
                LayoutOrder = 2
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v20));