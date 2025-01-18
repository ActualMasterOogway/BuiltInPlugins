local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_BrowserService_0 = game:GetService("BrowserService");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportDialogButtonsAndStyling);
local v13 = v3.PureComponent:extend("SuccessWidget");
v13.init = function(v14) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: l_BrowserService_0 (copy)
    v14.viewCreatorHubCallback = function() --[[ Line: 26 ]]
        -- upvalues: l_BrowserService_0 (ref), v14 (copy)
        l_BrowserService_0:OpenBrowserWindow(("https://create.roblox.com/dashboard/creations/store/%d/configure"):format(v14.props.AssetId));
    end;
end;
v13.render = function(v15) --[[ Line: 31 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Pane_0 (copy), v12 (copy), l_TextLabel_0 (copy), l_TextWithLinks_0 (copy)
    local l_props_0 = v15.props;
    local l_Localization_1 = v15.props.Localization;
    local l_UploadWidget_0 = l_props_0.Stylizer.UploadWidget;
    return v3.createElement(l_Pane_0, {
        LayoutOrder = 1, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = if v12() then Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top, 
        HorizontalAlignment = if v12() then Enum.HorizontalAlignment.Center else nil, 
        Size = UDim2.new(0, l_UploadWidget_0.Width, 0, l_UploadWidget_0.Height)
    }, {
        Title = v3.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = l_UploadWidget_0.TextLabelSize, 
            Text = l_Localization_1:getText("Upload", "Success"), 
            TextSize = l_UploadWidget_0.TextSize, 
            TextXAlignment = l_UploadWidget_0.TextAlignment, 
            TextColor = l_UploadWidget_0.SuccessColor
        }), 
        Description = if l_props_0.AddedToInventory then v3.createElement(l_TextLabel_0, {
            LayoutOrder = 2, 
            Size = l_UploadWidget_0.TextLabelSize, 
            Text = l_Localization_1:getText("Upload", "SuccessDescription"), 
            TextSize = l_UploadWidget_0.SubtextSize, 
            TextXAlignment = l_UploadWidget_0.TextAlignment
        }) else nil, 
        ViewCreatorHubLink = if v12() and l_props_0.AssetId then v3.createElement(l_TextWithLinks_0, {
            LayoutOrder = 3, 
            TextWrapped = true, 
            Text = "[ViewCreatorHub]", 
            TextProps = l_UploadWidget_0.SuccessWidget.TextProps, 
            LinkMap = {
                ["[ViewCreatorHub]"] = {
                    LinkText = l_Localization_1:getText("Upload", "ViewCreatorHub"), 
                    LinkCallback = v15.viewCreatorHubCallback
                }
            }
        }) else nil
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v13));