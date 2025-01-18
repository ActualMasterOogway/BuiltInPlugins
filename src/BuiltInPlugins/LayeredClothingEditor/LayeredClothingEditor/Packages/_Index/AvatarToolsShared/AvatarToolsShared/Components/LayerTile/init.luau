local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Roact);
local v3 = require(l_Parent_1.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Util_0 = v3.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local _ = l_UI_0.AssetRenderModel;
local v12 = require(l_Parent_0.Components.StaticLCAssetRenderModel);
local v13 = v2.PureComponent:extend("LayerTile");
l_Typecheck_0.wrap(v13, script);
v13.render = function(v14) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v12 (copy), l_Pane_0 (copy), l_StyleModifier_0 (copy)
    local l_props_0 = v14.props;
    local v16 = l_props_0.LayoutOrder or 1;
    local v17 = l_props_0.ZIndex or 1;
    local v18 = l_props_0.IsOn or false;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v20 = l_props_0.TileSize or l_Stylizer_0.TileSize;
    local l_Model_0 = l_props_0.Model;
    local v22 = l_Model_0 and v2.createElement(v12, {
        Model = l_Model_0
    });
    return v2.createElement(l_Pane_0, {
        Style = l_Stylizer_0.paneStyle, 
        StyleModifier = if v18 then l_StyleModifier_0.Selected else nil, 
        Size = v20, 
        Position = l_props_0.Position, 
        LayoutOrder = v16, 
        ZIndex = v17
    }, {
        PreviewThumbnail = v22
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));