local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local _ = l_UI_0.Pane;
local l_Button_0 = l_UI_0.Button;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Box_0 = l_UI_0.Box;
local l_Util_0 = v3.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local _ = l_UI_0.AssetRenderModel;
local v15 = require(l_Parent_0.Components.StaticLCAssetRenderModel);
local v16 = v2.PureComponent:extend("PreviewTile");
l_Typecheck_0.wrap(v16, script);
v16.render = function(v17) --[[ Line: 41 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Button_0 (copy), l_Box_0 (copy), l_StyleModifier_0 (copy), v15 (copy), l_TextLabel_0 (copy)
    local l_props_0 = v17.props;
    local v19 = l_props_0.LayoutOrder or 1;
    local v20 = l_props_0.ZIndex or 1;
    local v21 = l_props_0.IsOn or false;
    local l_Text_0 = l_props_0.Text;
    local l_OnClick_0 = l_props_0.OnClick;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Model_0 = l_props_0.Model;
    return v2.createElement(l_Button_0, {
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
        StyleModifier = if v21 then l_StyleModifier_0.Pressed else nil, 
        Size = l_Stylizer_0.TileSize, 
        Position = l_props_0.Position, 
        LayoutOrder = v19, 
        ZIndex = v20, 
        OnClick = l_OnClick_0
    }, {
        PreviewThumbnail = v2.createElement(v15, {
            Model = l_Model_0
        }), 
        TextLabel = v2.createElement(l_TextLabel_0, {
            Text = l_Text_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom, 
            ZIndex = v20 + 1, 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            TextTruncate = Enum.TextTruncate.AtEnd
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16));