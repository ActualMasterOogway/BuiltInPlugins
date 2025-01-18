local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = v1.PureComponent:extend("RoundBox");
v4.wrap(v5, script);
v5.render = function(v6) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Color_0 = l_Stylizer_0.Color;
    local l_BorderColor_0 = l_Stylizer_0.BorderColor;
    local l_Transparency_0 = l_Stylizer_0.Transparency;
    local l_BorderTransparency_0 = l_Stylizer_0.BorderTransparency;
    local l_BackgroundImage_0 = l_Stylizer_0.BackgroundImage;
    local l_BorderImage_0 = l_Stylizer_0.BorderImage;
    local l_SliceCenter_0 = l_Stylizer_0.SliceCenter;
    local l_ZIndex_0 = l_Stylizer_0.ZIndex;
    return v1.createElement("ImageLabel", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageTransparency = l_Transparency_0, 
        ImageColor3 = l_Color_0, 
        BorderSizePixel = 0, 
        Image = l_BackgroundImage_0, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = l_SliceCenter_0, 
        ZIndex = l_ZIndex_0
    }, {
        Border = v1.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ImageTransparency = l_BorderTransparency_0, 
            ImageColor3 = l_BorderColor_0, 
            BorderSizePixel = 0, 
            Image = l_BorderImage_0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = l_SliceCenter_0
        }, l_props_0[v1.Children])
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v5));