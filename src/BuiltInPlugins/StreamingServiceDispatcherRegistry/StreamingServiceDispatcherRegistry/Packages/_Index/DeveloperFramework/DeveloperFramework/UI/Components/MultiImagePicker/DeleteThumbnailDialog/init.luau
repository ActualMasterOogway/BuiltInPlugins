local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.ContextServices);
local l_Components_0 = l_Parent_0.UI.Components;
local v5 = require(l_Components_0.TextLabel);
local v6 = require(l_Components_0.StyledDialog);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v8 = v2.Component:extend("DeleteThumbnailDialog");
v8.render = function(v9) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: l_LOCALIZATION_PROJECT_NAME_0 (copy), l_TextService_0 (copy), v2 (copy), v6 (copy), v5 (copy)
    local l_props_0 = v9.props;
    local l_Theme_0 = l_props_0.Theme;
    local l_DeleteThumbnailDialog_0 = l_Theme_0.DeleteThumbnailDialog;
    local l_Localization_0 = l_props_0.Localization;
    local v14 = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "DeleteDialogBody");
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v14, l_Theme_0.FontStyle.Normal.TextSize, l_Theme_0.FontStyle.Normal.Font, Vector2.new(l_DeleteThumbnailDialog_0.MinContentWidth, l_DeleteThumbnailDialog_0.MinContentHeight));
    return v2.createElement(v6, {
        Buttons = {
            {
                Key = false, 
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ReplyNo"), 
                Style = "RoundLargeText"
            }, 
            {
                Key = true, 
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ReplyYes"), 
                Style = "RoundLargeTextPrimary"
            }
        }, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Enabled = l_props_0.Enabled, 
        MinContentSize = Vector2.new(l_DeleteThumbnailDialog_0.MinContentWidth, l_l_TextService_0_TextSize_0.Y), 
        OnButtonPressed = function(v16) --[[ Line: 69 ]] --[[ Name: OnButtonPressed ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.OnClose();
            if v16 then
                l_props_0.DeleteThumbnail();
            end;
        end, 
        OnClose = l_props_0.OnClose, 
        Style = "Alert", 
        Title = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "DeleteDialogHeader")
    }, {
        TextLabel = v2.createElement(v5, {
            LayoutOrder = 1, 
            TextWrapped = true, 
            Style = "Normal", 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Text = v14
        })
    });
end;
return (v3.withContext({
    Localization = v3.Localization
})(v8));