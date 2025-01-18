local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Dash);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.React);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.AssetConfigConstants);
local v8 = require(l_script_FirstAncestor_0.Libs.Http.Url);
local l_ContextServices_0 = v3.ContextServices;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local _ = v3.Util.StyleModifier;
local l_AssetConfiguration_0 = l_script_FirstAncestor_0.Core.Components.AssetConfiguration;
local v19 = require(l_AssetConfiguration_0.ConfigSectionWrapper);
local v20 = game:DefineFastString("DataSharing_PreferencesUrlSuffix", "settings/data-collection?tab=avatar-items");
local v21 = game:DefineFastString("DataSharing_TermsUrlSuffix", "docs/ai-data-sharing");
return function(v22) --[[ Line: 41 ]] --[[ Name: DataConsentToggle ]]
    -- upvalues: l_ContextServices_0 (copy), l_LayoutOrderIterator_0 (copy), v4 (copy), v19 (copy), l_Pane_0 (copy), l_ToggleButton_0 (copy), l_TextLabel_0 (copy), v2 (copy), l_TextWithLinks_0 (copy), l_BrowserService_0 (copy), v8 (copy), v20 (copy), v21 (copy)
    local v23 = l_ContextServices_0.Stylizer:use();
    local v24 = l_ContextServices_0.Localization:use();
    local v25 = l_LayoutOrderIterator_0.new();
    local v26 = {
        Font = v23.Font, 
        Style = "Body", 
        TextSize = 16, 
        TextXAlignment = Enum.TextXAlignment.Left
    };
    return v4.createElement(v19, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v22.LayoutOrder, 
        Title = v24:getText("AssetConfig", "ShareDataHeader")
    }, {
        DescriptionPane = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v25:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = v23.toggle.verticalListPadding
        }, {
            ToggleButton = v4.createElement(l_ToggleButton_0, {
                LayoutOrder = v25:getNextOrder(), 
                OnClick = v22.onDataConsentToggleClick, 
                Selected = v22.dataSharingToggled, 
                Size = UDim2.new(0, v23.toggle.buttonWidth, 0, v23.toggle.buttonHeight)
            }), 
            DescriptionTextPane = v4.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v25:getNextOrder(), 
                Spacing = v23.toggle.verticalTextSpacing
            }, {
                DescriptionText = v4.createElement(l_TextLabel_0, v2.join({
                    Text = v24:getText("AssetConfig", "ShareDataDescriptionText"), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = v25:getNextOrder(), 
                    MaxWidth = v23.MaxWidth, 
                    TextWrapped = true
                }, v26)), 
                LinkText = v4.createElement(l_TextWithLinks_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = v25:getNextOrder(), 
                    LinkMap = {
                        ["[link1]"] = {
                            LinkText = v24:getText("AssetConfig", "ShareDataDescriptionLinkPreferences"), 
                            LinkCallback = function() --[[ Line: 98 ]] --[[ Name: LinkCallback ]]
                                -- upvalues: l_BrowserService_0 (ref), v8 (ref), v20 (ref)
                                l_BrowserService_0:OpenBrowserWindow(v8.CREATE_URL .. v20);
                            end
                        }, 
                        ["[link2]"] = {
                            LinkText = v24:getText("AssetConfig", "ShareDataDescriptionLinkLearnMore"), 
                            LinkCallback = function() --[[ Line: 106 ]] --[[ Name: LinkCallback ]]
                                -- upvalues: l_BrowserService_0 (ref), v8 (ref), v21 (ref)
                                l_BrowserService_0:OpenBrowserWindow(v8.CREATE_URL .. v21);
                            end
                        }
                    }, 
                    Text = v24:getText("AssetConfig", "ShareDataDescriptionLinks"), 
                    TextProps = v26, 
                    TextWrapped = true
                })
            })
        })
    });
end;