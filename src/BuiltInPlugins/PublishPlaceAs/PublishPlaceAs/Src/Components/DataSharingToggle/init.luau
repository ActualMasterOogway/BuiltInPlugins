local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_Dash_0 = require(l_Parent_0.Packages.Framework).Dash;
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v11 = require(l_Parent_0.Src.Types.DataSharingFetchState);
local v12 = require(l_Parent_0.Src.Network.Http);
local v13 = require(l_Parent_0.Src.Flags.getFStringCAP1107DisplayUrl);
local v14 = require(l_Parent_0.Src.Flags.getFStringCAP1107SettingsUrl);
local l_BrowserService_0 = game:GetService("BrowserService");
local v16 = v1.PureComponent:extend("DataSharingToggle");
v16.render = function(v17) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v11 (copy), v1 (copy), l_TitledFrame_0 (copy), l_ToggleButton_0 (copy), l_TextWithLinks_0 (copy), v12 (copy), v14 (copy), l_BrowserService_0 (copy), v13 (copy), l_Dash_0 (copy)
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_DataSharingEnabled_0 = l_props_0.DataSharingEnabled;
    local l_DataSharingDefault_0 = l_props_0.DataSharingDefault;
    local l_isOwningCreator_0 = l_props_0.isOwningCreator;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnClick_0 = l_props_0.OnClick;
    local v26 = l_LayoutOrderIterator_0.new();
    local v27 = l_DataSharingDefault_0 == v11.FINISHED;
    if not l_isOwningCreator_0 or not v27 then
        return nil;
    else
        return v1.createElement(l_TitledFrame_0, {
            LayoutOrder = l_LayoutOrder_0, 
            Title = l_Localization_0:getText("DataSharing", "Title")
        }, {
            ToggleButton = v1.createElement(l_ToggleButton_0, {
                Disabled = false, 
                Selected = l_DataSharingEnabled_0, 
                LayoutOrder = v26:getNextOrder(), 
                OnClick = l_OnClick_0, 
                Size = UDim2.fromOffset(40, 24)
            }), 
            LinkText = v1.createElement(l_TextWithLinks_0, {
                LinkMap = {
                    ["[settingsPage]"] = {
                        LinkText = l_Localization_0:getText("DataSharing", "SettingsHyperlink"), 
                        LinkCallback = function() --[[ Line: 74 ]] --[[ Name: LinkCallback ]]
                            -- upvalues: v12 (ref), v14 (ref), l_BrowserService_0 (ref)
                            local v28 = v12.BuildRobloxUrl("create", v14());
                            l_BrowserService_0:OpenBrowserWindow(v28);
                        end
                    }, 
                    ["[link]"] = {
                        LinkText = l_Localization_0:getText("DataSharing", "LinkText"), 
                        LinkCallback = function() --[[ Line: 81 ]] --[[ Name: LinkCallback ]]
                            -- upvalues: v12 (ref), v13 (ref), l_BrowserService_0 (ref)
                            local v29 = v12.BuildRobloxUrl("create", v13());
                            l_BrowserService_0:OpenBrowserWindow(v29);
                        end
                    }
                }, 
                Text = l_Localization_0:getText("DataSharing", "ToggleDescription"), 
                MaxWidth = l_Stylizer_0.textWithInlineLink.maxWidth, 
                LayoutOrder = v26:getNextOrder(), 
                TextProps = l_Dash_0.join(l_Stylizer_0.fontStyle.Subtext, {
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                TextWrapped = true, 
                AutomaticSize = Enum.AutomaticSize.Y
            }), 
            UIPadding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 0), 
                PaddingBottom = UDim.new(0, 16), 
                PaddingLeft = UDim.new(0, 0), 
                PaddingRight = UDim.new(0, 20)
            })
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v16));