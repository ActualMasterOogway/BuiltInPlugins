local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Button_0 = v3.UI.Button;
local l_Separator_0 = v3.UI.Separator;
local v7 = v2.PureComponent:extend("DropdownMenuItem");
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
v7.defaultProps = {
    Size = UDim2.new(0, 200, 0, 25)
};
local function _(v10) --[[ Line: 47 ]] --[[ Name: removeRichTextTags ]]
    return v10:gsub("[</>]", "");
end;
local function v18(v12, v13) --[[ Line: 52 ]] --[[ Name: getBoldedText ]]
    local v14 = v12:lower():gsub("[</>]", "");
    local v15 = v13:lower():gsub("[</>]", "");
    local v16 = string.find(v14, v15, 1, true);
    local _ = nil;
    return "<b>" .. (if v16 ~= nil then string.sub(v12, 0, v16 - 1) .. "</b>" .. string.sub(v12, v16, v16 + string.len(v13) - 1) .. "<b>" .. string.sub(v12, v16 + string.len(v13), (string.len(v12))) else v12) .. "</b>";
end;
v7.render = function(v19) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v2 (copy), l_Button_0 (copy), v9 (copy), l_Separator_0 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_TextSize_0 = l_Stylizer_0.TextSize;
    local v23 = nil;
    v23 = if l_props_0.FocusedText ~= nil then v18(l_props_0.Text, l_props_0.FocusedText) else l_props_0.Text;
    return v2.createElement(l_Button_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        OnClick = l_props_0.OnClick, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Style = if v9() then l_props_0.DropdownMenuItemButtonStyle else nil, 
        DisableHover = if v9() then l_props_0.DisableHover else nil, 
        OnMouseEnter = if v9() then l_props_0.OnMouseEnter else nil, 
        OnMouseLeave = if v9() then l_props_0.OnMouseLeave else nil
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ItemLabel = if v9() and v19.props.ItemButtonContentOverride then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            ItemLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                Font = l_Stylizer_0.Font, 
                LayoutOrder = 1, 
                RichText = true, 
                Size = UDim2.new(1, -40, 1, 0), 
                Text = v23, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextSize = l_TextSize_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 10)
                })
            }), 
            ButtonComponent = v19.props.ItemButtonContentOverride
        }) else v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            ClipsDescendants = true, 
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 1, 
            RichText = true, 
            Size = l_props_0.Size, 
            Text = v23, 
            TextColor3 = l_Stylizer_0.TextColor, 
            TextSize = l_TextSize_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 10)
            })
        }), 
        Separator = not l_props_0.HideSeparator and v2.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = 2
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));