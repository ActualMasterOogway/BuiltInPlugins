local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck.t);
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = v1.PureComponent:extend("DropShadow");
v5.wrap(v6, script);
v6.render = function(v7) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy)
    local l_props_0 = v7.props;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Color_0 = l_Stylizer_0.Color;
    local v12 = l_Stylizer_0.Offset or Vector2.new();
    local l_Transparency_0 = l_Stylizer_0.Transparency;
    assert(v4.optional(v4.numberConstrained(0, 1))(l_Transparency_0), "Transparency must be nil or between 0 and 1");
    local l_Image_0 = l_Stylizer_0.Image;
    local l_ImageSize_0 = l_Stylizer_0.ImageSize;
    assert(v4.numberPositive(l_ImageSize_0), "ImageSize must be a positive number");
    local v16 = l_Stylizer_0.Radius or 0;
    local v17 = l_ImageSize_0 / 2;
    local v18 = (v16 + 1) / v17;
    local v19 = Rect.new(v17, v17, v17, v17);
    local v20 = l_props_0[v1.Children] or {};
    return v1.createElement("ImageLabel", {
        Size = l_props_0.Size or UDim2.new(1, 0, 1, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        AutomaticSize = l_props_0.AutomaticSize, 
        Position = UDim2.new(0.5, v12.X, 0.5, v12.Y), 
        ZIndex = l_ZIndex_0, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = l_Image_0, 
        ImageColor3 = l_Color_0, 
        ImageTransparency = l_Transparency_0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v19, 
        SliceScale = v18
    }, {
        ShadowPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v16), 
            PaddingBottom = UDim.new(0, v16), 
            PaddingLeft = UDim.new(0, v16), 
            PaddingRight = UDim.new(0, v16)
        }); 
        v1.createFragment(v20)
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v6));