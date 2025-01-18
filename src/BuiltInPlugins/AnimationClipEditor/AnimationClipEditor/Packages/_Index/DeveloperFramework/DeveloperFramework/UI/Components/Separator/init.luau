local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck.t);
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = v1.PureComponent:extend("Separator");
v5.wrap(v6, script);
v6.render = function(v7) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v1 (copy)
    local l_props_0 = v7.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local v12 = l_props_0.DominantAxis or Enum.DominantAxis.Width;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Color_0 = l_Stylizer_0.Color;
    local l_StretchMargin_0 = l_Stylizer_0.StretchMargin;
    local l_Weight_0 = l_Stylizer_0.Weight;
    assert(v4.numberMin(0)(l_Weight_0), "Weight style must be a number >= 0");
    assert(v4.numberMin(0)(l_StretchMargin_0), "StretchMargin style must be a number >= 0");
    local v17 = nil;
    v17 = if v12 == Enum.DominantAxis.Width then UDim2.new(1, -l_StretchMargin_0 * 2, 0, l_Weight_0) else UDim2.new(0, l_Weight_0, 1, -l_StretchMargin_0 * 2);
    return v1.createElement("Frame", {
        Size = v17, 
        Position = l_Position_0, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundColor3 = l_Color_0, 
        BorderSizePixel = 0, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v6));