local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_GuiService_0 = game:GetService("GuiService");
local v10 = v1.PureComponent:extend("RewardedOnDemandAdsSetting");
game:DefineFastString("RewardedVideoAdsDocumentationUrl", "https://www.roblox.com");
local l_game_FastString_0 = game:GetFastString("RewardedVideoAdsDocumentationUrl");
v10.init = function(v12) --[[ Line: 21 ]] --[[ Name: init ]]
    v12.state = {
        IsEnabled = v12.props.IsEnabled
    };
end;
v10.render = function(v13) --[[ Line: 27 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v1 (copy), l_Pane_0 (copy), l_TitledFrame_0 (copy), l_ToggleButton_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_game_FastString_0 (copy), l_GuiService_0 (copy)
    local l_props_0 = v13.props;
    if l_props_0.IsEligible then
        local _ = l_props_0.IsEnabled;
    end;
    local l_OnToggled_0 = l_props_0.OnToggled;
    local l_Title_0 = l_props_0.Title;
    local l_SubText_0 = l_props_0.SubText;
    local l_LinkText_1 = l_props_0.LinkText;
    local v20 = v2.Util.LayoutOrderIterator.new();
    v13.updateToggleState = function() --[[ Line: 38 ]]
        -- upvalues: v13 (copy), l_OnToggled_0 (copy)
        v13:setState(function(v21) --[[ Line: 39 ]]
            -- upvalues: l_OnToggled_0 (ref)
            local v22 = not v21.IsEnabled;
            l_OnToggled_0(v22);
            return {
                IsEnabled = v22
            };
        end);
    end;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = v13.props.LayoutOrder
    }, {
        ToggleRewardedVideoAds = v1.createElement(l_TitledFrame_0, {
            LayoutOrder = v20:getNextOrder(), 
            Title = l_Title_0
        }, {
            ToggleButton = v1.createElement(l_ToggleButton_0, {
                Disabled = false, 
                Selected = v13.state.IsEnabled, 
                OnClick = v13.updateToggleState, 
                LayoutOrder = v20:getNextOrder()
            }), 
            TextContents = v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v20:getNextOrder()
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                SubText = v1.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Body", 
                    Text = l_SubText_0 .. " ", 
                    TextWrapped = true, 
                    LayoutOrder = v20:getNextOrder()
                }), 
                LinkText = v1.createElement(l_LinkText_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Style = "Body", 
                    Text = l_LinkText_1, 
                    OnClick = function() --[[ Line: 87 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_game_FastString_0 (ref), l_GuiService_0 (ref)
                        local l_l_game_FastString_0_0 = l_game_FastString_0;
                        if l_l_game_FastString_0_0 and string.len(l_l_game_FastString_0_0) > 0 then
                            l_GuiService_0:OpenBrowserWindow(l_l_game_FastString_0_0);
                            return;
                        else
                            error("Failed to open rewarded ads documentation");
                            return;
                        end;
                    end, 
                    LayoutOrder = v20:getNextOrder()
                })
            })
        })
    });
end;
return v10;