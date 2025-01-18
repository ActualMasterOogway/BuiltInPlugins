local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local l_Box_0 = l_UI_0.Box;
local l_Util_0 = v2.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v13 = v1.PureComponent:extend("Tile");
l_Typecheck_0.wrap(v13, script);
v13.render = function(v14) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Button_0 (copy), l_Box_0 (copy), l_StyleModifier_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v14.props;
    local v16 = l_props_0.LayoutOrder or 1;
    local v17 = l_props_0.ZIndex or 1;
    local v18 = l_props_0.IsOn or false;
    local l_Text_0 = l_props_0.Text;
    local l_OnClick_0 = l_props_0.OnClick;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Image_1 = l_props_0.Image;
    local v23 = l_props_0.ImageSize or l_Stylizer_0.ImageSize;
    return v1.createElement(l_Button_0, {
        Style = {
            Background = l_Box_0, 
            BackgroundStyle = {
                Color = l_Stylizer_0.ButtonBackgroundColor, 
                BorderSize = 0
            }, 
            [l_StyleModifier_0.Pressed] = {
                BackgroundStyle = {
                    Color = l_Stylizer_0.ButtonPressedColor, 
                    BorderSize = 0
                }
            }
        }, 
        StyleModifier = if v18 then l_StyleModifier_0.Pressed else nil, 
        Size = v23, 
        Position = l_props_0.Position, 
        LayoutOrder = v16, 
        ZIndex = v17, 
        OnClick = l_OnClick_0
    }, {
        Image = v1.createElement(l_Image_0, {
            Style = {
                Image = l_Image_1, 
                Size = v23, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        }), 
        TextLabel = v1.createElement(l_TextLabel_0, {
            Text = l_Text_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            ZIndex = v17 + 1, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));