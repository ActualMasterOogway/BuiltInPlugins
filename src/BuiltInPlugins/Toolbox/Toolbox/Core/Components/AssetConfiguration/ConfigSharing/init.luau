local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_UI_0 = v3.UI;
local _ = l_UI_0.Button;
local _ = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local v14 = require(l_Util_0.Constants);
local v15 = require(l_Util_0.AssetConfigConstants);
local v16 = require(l_Util_0.ToolboxUtilities);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_GuiService_0 = game:GetService("GuiService");
local v21 = v4.PureComponent:extend("ConfigSharing");
local _ = UDim2.fromOffset(160, 32);
v21.init = function(v23) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_GuiService_0 (copy)
    v23.onLearnMoreActivated = function() --[[ Line: 45 ]]
        -- upvalues: v16 (ref), l_GuiService_0 (ref)
        local l_audioPublicationDisabledLink_0 = v16.getAssetConfigMessaging().audioPublicationDisabledLink;
        if l_audioPublicationDisabledLink_0 then
            l_GuiService_0:OpenBrowserWindow(l_audioPublicationDisabledLink_0);
        end;
    end;
end;
v21.render = function(v25) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: l_ToolboxVideoConfigSharing2_0 (copy), v16 (copy), l_ContentProvider_0 (copy), l_HttpService_0 (copy), l_GuiService_0 (copy), l_LayoutOrderIterator_0 (copy), v15 (copy), v4 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), v14 (copy), l_RadioButtonList_0 (copy)
    local l_props_0 = v25.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_assetConfig_0 = l_Stylizer_0.assetConfig;
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local l_AssetId_0 = l_props_0.AssetId;
    local l_AssetType_0 = l_props_0.AssetType;
    local l_AllowSelectPrivate_0 = l_props_0.AllowSelectPrivate;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_IsAssetPublic_0 = l_props_0.IsAssetPublic;
    local l_OnSelected_0 = l_props_0.OnSelected;
    local l_Localization_0 = l_props_0.Localization;
    local v37 = l_Localization_0:getText("AssetConfigSharing", "SubTitle");
    local _ = l_Localization_0:getText("General", "TermsOfUse");
    local v39 = l_Localization_0:getText("AssetConfigSharing", "PrivateSpecificExperiences");
    local v40 = l_Localization_0:getText("AssetConfigSharing", "PublicAllExperiences");
    local v41 = l_Localization_0:getText("AssetConfigSharing", "ExperiencesWithAccess");
    local v42 = nil;
    v42 = if l_AllowSelectPrivate_0 then l_Localization_0:getText("AssetConfigSharing", "PrivateInformation") else l_Localization_0:getText("AssetConfigSharing", "PrivateDisabledInformation");
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = true;
    if l_AssetType_0 == Enum.AssetType.Audio or l_ToolboxVideoConfigSharing2_0 and l_AssetType_0 == Enum.AssetType.Video then
        if l_IsAssetPublic_0 then
            v43 = l_Localization_0:getText("AssetConfigSharing", "PublicInformation");
        else
            v43 = if l_ToolboxVideoConfigSharing2_0 then if l_AssetType_0 == Enum.AssetType.Video then l_Localization_0:getText("AssetConfigSharing", "VideoPublicDisabledInformation") else l_Localization_0:getText("AssetConfigSharing", "PublicDisabledInformation") else l_Localization_0:getText("AssetConfigSharing", "PublicDisabledInformation");
            v46 = false;
            v44 = {
                Text = l_Localization_0:getText("AssetConfigSharing", "PublicDisabledLinkText"), 
                OnClick = v25.onLearnMoreActivated
            };
            v42 = l_Localization_0:getText("AssetConfigSharing", "PrivateInformationVersionTwo");
            if v16.getAssetConfigMessaging().showManageUniversePermissionsLink and l_AssetId_0 then
                v45 = {
                    Text = l_Localization_0:getText("AssetConfigSharing", "PrivateInformationLinkText"), 
                    OnClick = function() --[[ Line: 109 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_ContentProvider_0 (ref), l_HttpService_0 (ref), l_AssetId_0 (copy), l_GuiService_0 (ref)
                        local v47 = string.format("%slibrary/configure?id=%s#!/general", l_ContentProvider_0.BaseUrl, l_HttpService_0:urlEncode(l_AssetId_0));
                        return l_GuiService_0:OpenBrowserWindow(v47);
                    end
                };
            end;
        end;
    else
        v43 = l_Localization_0:getText("AssetConfigSharing", "PublicInformation");
    end;
    local v48 = l_LayoutOrderIterator_0.new();
    local v49 = if l_IsAssetPublic_0 then v15.SHARING_KEYS.Public else v15.SHARING_KEYS.Private;
    return v4.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_LayoutOrder_0, 
        Padding = {
            Bottom = 25
        }, 
        Size = UDim2.new(1, 0, 0, 0), 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Title = v4.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1, 
            Size = UDim2.new(0, v15.TITLE_GUTTER_WIDTH, 0, 0), 
            Text = v41, 
            TextColor = l_publishAsset_0.titleTextColor, 
            TextSize = v14.FONT_SIZE_TITLE, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        RightFrame = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -v15.TITLE_GUTTER_WIDTH, 0, 0), 
            Spacing = 2
        }, {
            ContentContainer = v4.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v48:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0), 
                Spacing = 10
            }, {
                SubtitleLabel = v4.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = v37, 
                    TextColor = l_assetConfig_0.brightText, 
                    TextSize = v14.FONT_SIZE_ASSET_CONFIG_INPUT, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                RadioButtonList = v4.createElement(l_RadioButtonList_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Buttons = {
                        {
                            Key = v15.SHARING_KEYS.Private, 
                            Text = v39, 
                            Description = v42, 
                            LinkProps = v45, 
                            Disabled = not l_AllowSelectPrivate_0
                        }, 
                        {
                            Key = v15.SHARING_KEYS.Public, 
                            Text = v40, 
                            Description = v43, 
                            LinkProps = v44, 
                            Disabled = not v46
                        }
                    }, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    LayoutOrder = 2, 
                    OnClick = l_OnSelected_0, 
                    CurrentSelectedKey = v49, 
                    SelectedKey = v49, 
                    Style = "AssetConfigRadioButtonList", 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21));