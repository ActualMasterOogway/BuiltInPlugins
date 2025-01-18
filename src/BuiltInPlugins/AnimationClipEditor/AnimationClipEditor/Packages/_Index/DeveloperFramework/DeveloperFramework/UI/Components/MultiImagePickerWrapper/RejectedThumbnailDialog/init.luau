local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_Components_0 = l_Parent_0.UI.Components;
local v4 = require(l_Components_0.TextLabel);
local v5 = require(l_Components_0.BulletList);
local v6 = require(l_Components_0.StyledDialog);
local v7 = require(l_Parent_0.Resources);
local l_LayoutOrderIterator_0 = require(l_Parent_0.Util).LayoutOrderIterator;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v10 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local v11 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget);
local l_LOCALIZATION_PROJECT_NAME_0 = v7.LOCALIZATION_PROJECT_NAME;
local v13 = v1.Component:extend("RejectedThumbnailDialog");
v13.render = function(v14) --[[ Line: 50 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), v6 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy), v4 (copy), l_join_0 (copy), v10 (copy), v5 (copy), v11 (copy)
    local l_props_0 = v14.props;
    local v16 = if l_props_0.Files ~= nil then l_props_0.Files else {};
    local l_Localization_0 = l_props_0.Localization;
    local l_Theme_0 = l_props_0.Theme;
    local v19 = l_LayoutOrderIterator_0.new();
    return v1.createElement(v6, {
        Buttons = {
            {
                Key = "OK", 
                Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "ReplyOK")
            }
        }, 
        ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Enabled = l_props_0.Enabled, 
        MinContentSize = Vector2.new(460, 100 + #v16 * l_Theme_0.FontStyle.SemiBold.TextSize), 
        OnButtonPressed = l_props_0.OnClose, 
        OnClose = l_props_0.OnClose, 
        Style = "Alert", 
        Title = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "RejectedDialogHeader")
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }), 
        Header = v1.createElement(v4, l_join_0(l_Theme_0.FontStyle.SemiBold, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v19:getNextOrder(), 
            Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "MultiImagePicker", "RejectedDialogBody", {
                maxThumbnailSize = v10 / 1000000
            }), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })), 
        List = v1.createElement(v5, {
            AutomaticSize = if v11() then nil else Enum.AutomaticSize.XY, 
            Items = v16, 
            LayoutOrder = v19:getNextOrder(), 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;
return (v2.withContext({
    Localization = v2.Localization
})(v13));