local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = v1.PureComponent:extend("DragDestination");
v2.render = function(v3) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v3.props;
    local l_Theme_0 = l_props_0.Theme;
    local l_DragDestination_0 = l_Theme_0.DragDestination;
    local v7 = l_props_0.LayoutOrder or 1;
    return v1.createElement("ImageLabel", {
        BorderSizePixel = 0, 
        BackgroundTransparency = 0.85, 
        BackgroundColor3 = l_DragDestination_0.Background, 
        ImageColor3 = l_DragDestination_0.Border, 
        Image = l_Theme_0.DottedBorder.Image, 
        ResampleMode = Enum.ResamplerMode.Pixelated, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = l_Theme_0.DottedBorder.SliceCenter, 
        LayoutOrder = v7
    });
end;
return v2;