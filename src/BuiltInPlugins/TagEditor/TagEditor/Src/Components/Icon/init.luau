local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Packages.Emoji);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_prioritize_0 = v3.Util.prioritize;
local v14 = require(l_Parent_0.Src.FamFamFam);
local v15 = v2.PureComponent:extend("Icon");
v15.render = function(v16) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Image_0 (copy), v4 (copy), l_TextLabel_0 (copy), v14 (copy), l_Pane_0 (copy), l_prioritize_0 (copy)
    local l_props_0 = v16.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local v19 = nil;
    if l_props_0.Name then
        if l_props_0.Name:find("^rbxassetid://") or l_props_0.Name:find("^rbxasset://") then
            v19 = v2.createElement(l_Image_0, {
                Size = UDim2.fromScale(1, 1), 
                Image = l_props_0.Name, 
                ImageColor3 = if l_props_0.Name:find("^rbxasset://") then l_Stylizer_1.IconColor else nil
            });
        elseif l_props_0.Name:find("emoji:") then
            local _, v21 = l_props_0.Name:find("emoji:");
            local v22 = l_props_0.Name:sub(v21 + 1, -1);
            local v23 = v4.getNamedEmoji(v22);
            if not v23 and not v22:match("^[a-zA-Z%-_]+$") then
                v23 = v22;
            elseif not v23 then
                v23 = "\226\157\140";
            end;
            v19 = v2.createElement(l_TextLabel_0, {
                TextSize = l_Stylizer_1.TextSize, 
                Text = v23, 
                Size = l_Stylizer_1.Size
            });
        else
            local v24 = v14.Lookup(l_props_0.Name) or v14.Lookup("computer_error");
            v19 = v2.createElement(l_Image_0, {
                Size = UDim2.fromScale(1, 1), 
                Image = v24.Image, 
                Style = {
                    ImageRectSize = v24.ImageRectSize - Vector2.new(0.5, 0.5), 
                    ImageRectOffset = v24.ImageRectOffset + Vector2.new(0.25, 0.25)
                }
            });
        end;
    end;
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        OnClick = l_props_0.OnClick, 
        Padding = l_Stylizer_1.Padding, 
        Position = l_props_0.Position, 
        Size = l_prioritize_0(l_props_0.Size, l_Stylizer_1.Size), 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        [v2.Event.MouseEnter] = l_props_0.OnMouseEnter, 
        [v2.Event.MouseLeave] = l_props_0.OnMouseLeave
    }, {
        ChildDecoration = v19
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Stylizer = l_Stylizer_0
})(v15));