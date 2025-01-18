local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = v1.PureComponent:extend("Box");
v4.wrap(v5, script);
v5.render = function(v6) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Color_0 = l_Stylizer_0.Color;
    local l_Transparency_0 = l_Stylizer_0.Transparency;
    local l_BorderColor_0 = l_Stylizer_0.BorderColor;
    local v12 = l_Stylizer_0.BorderSize or 0;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderColor3 = l_BorderColor_0, 
        BorderSizePixel = v12
    }, l_props_0[v1.Children]);
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v5));