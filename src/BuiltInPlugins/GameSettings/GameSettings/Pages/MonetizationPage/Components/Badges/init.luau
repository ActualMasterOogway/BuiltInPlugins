local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = v1.PureComponent:extend(script.Name);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_TextService_0 = game:GetService("TextService");
local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local v13 = require(l_Parent_0.Src.Components.TableWithMenu);
local l_FitFrameOnAxis_0 = v3.Util.FitFrame.FitFrameOnAxis;
local v15 = require(l_Parent_0.Src.Util.KeyProvider);
local l_getCopyIdKeyName_0 = v15.getCopyIdKeyName;
local l_getConfigureKeyName_0 = v15.getConfigureKeyName;
local l_shouldAllowBadges_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).shouldAllowBadges;
v2.render = function(v19) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: l_shouldAllowBadges_0 (copy), l_TextService_0 (copy), v1 (copy), l_FitFrameOnAxis_0 (copy), l_TitledFrame_0 (copy), l_Button_0 (copy), l_StudioService_0 (copy), l_GuiService_0 (copy), l_HoverArea_0 (copy), v13 (copy), l_getCopyIdKeyName_0 (copy), l_getConfigureKeyName_0 (copy)
    if not l_shouldAllowBadges_0() then
        return nil;
    else
        local l_props_0 = v19.props;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local l_Localization_0 = l_props_0.Localization;
        local l_BadgeList_0 = l_props_0.BadgeList;
        local l_OnLoadMoreBadges_0 = l_props_0.OnLoadMoreBadges;
        local l_RefreshBadges_0 = l_props_0.RefreshBadges;
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local v27 = l_Localization_0:getText("General", "ButtonCreate");
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v27, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(1e999, 1e999));
        local v29 = {
            l_Localization_0:getText("Monetization", "BadgeImage"), 
            l_Localization_0:getText("Monetization", "BadgeName"), 
            l_Localization_0:getText("Monetization", "BadgeDescription")
        };
        local v30 = l_Localization_0:getText("Monetization", "NoBadges");
        return v1.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_0.badges.headerPadding), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        }, {
            BadgesTitle = v1.createElement(l_TitledFrame_0, {
                LayoutOrder = 1, 
                Title = l_Localization_0:getText("Monetization", "Badges")
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, l_Stylizer_0.badges.titlePadding)
                }), 
                Layout = v1.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                CreateButton = v1.createElement(l_Button_0, {
                    Style = "GameSettingsPrimaryButton", 
                    Text = v27, 
                    Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + l_Stylizer_0.createButton.PaddingX, 0, l_l_TextService_0_TextSize_0.Y + l_Stylizer_0.createButton.PaddingY), 
                    OnClick = function() --[[ Line: 90 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_StudioService_0 (ref), l_GuiService_0 (ref)
                        local l_l_StudioService_0_BadgeUploadUrl_0 = l_StudioService_0:GetBadgeUploadUrl();
                        if l_l_StudioService_0_BadgeUploadUrl_0 and string.len(l_l_StudioService_0_BadgeUploadUrl_0) > 0 then
                            l_GuiService_0:OpenBrowserWindow(l_l_StudioService_0_BadgeUploadUrl_0);
                            return;
                        else
                            error("Failed to open Badge Creation page");
                            return;
                        end;
                    end
                }, {
                    v1.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                })
            }), 
            BadgesTable = v1.createElement(v13, {
                Headers = v29, 
                Data = l_BadgeList_0, 
                TableHeight = l_Stylizer_0.table.height / 2, 
                LayoutOrder = 2, 
                NextPageFunc = l_OnLoadMoreBadges_0, 
                ScrollingFrameNextPageRequestDistance = 200, 
                EmptyText = v30, 
                ShowTableBackground = true, 
                MenuItems = {
                    {
                        Key = l_getCopyIdKeyName_0(), 
                        Text = l_Localization_0:getText("General", l_getCopyIdKeyName_0())
                    }, 
                    {
                        Key = l_getConfigureKeyName_0(), 
                        Text = l_Localization_0:getText("General", l_getConfigureKeyName_0())
                    }
                }, 
                OnItemClicked = function(v32, v33) --[[ Line: 118 ]] --[[ Name: OnItemClicked ]]
                    -- upvalues: l_getCopyIdKeyName_0 (ref), l_StudioService_0 (ref), l_getConfigureKeyName_0 (ref), l_GuiService_0 (ref)
                    if v32 == l_getCopyIdKeyName_0() then
                        l_StudioService_0:CopyToClipboard(v33);
                        return;
                    elseif v32 == l_getConfigureKeyName_0() then
                        local l_l_StudioService_0_BadgeConfigureUrl_0 = l_StudioService_0:GetBadgeConfigureUrl(v33);
                        if l_l_StudioService_0_BadgeConfigureUrl_0 and string.len(l_l_StudioService_0_BadgeConfigureUrl_0) > 0 then
                            l_GuiService_0:OpenBrowserWindow(l_l_StudioService_0_BadgeConfigureUrl_0);
                            return;
                        else
                            error("Failed to open Badge Configuration page");
                            return;
                        end;
                    else
                        assert(false);
                        return;
                    end;
                end, 
                HeaderButton = v1.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    Image = l_Stylizer_0.badges.refreshButton.icon, 
                    Size = UDim2.new(0, l_Stylizer_0.badges.refreshButton.size, 0, l_Stylizer_0.badges.refreshButton.size), 
                    Position = UDim2.new(0.5, l_Stylizer_0.badges.refreshButton.offset.x, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    [v1.Event.Activated] = l_RefreshBadges_0
                }, {
                    v1.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                })
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v2));