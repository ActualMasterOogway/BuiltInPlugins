local v0 = UDim2.new(0, 9, 0, 5);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = v4.PureComponent:extend("ArrowButton");
v6.render = function(v7) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v0 (copy)
    local l_props_0 = v7.props;
    local l_scrollBarTheme_0 = l_props_0.Stylizer.scrollBarTheme;
    local l_Rotation_0 = l_props_0.Rotation;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    return v4.createElement("ImageButton", {
        Size = UDim2.new(0, v5.SCROLL_BAR_SIZE, 0, v5.SCROLL_BAR_SIZE), 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = l_scrollBarTheme_0.controlColor, 
        BorderColor3 = l_scrollBarTheme_0.borderColor, 
        ImageTransparency = 1, 
        [v4.Event.Activated] = l_props_0.OnActivated
    }, {
        Arrow = v4.createElement("ImageLabel", {
            Size = v0, 
            Rotation = l_Rotation_0, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = l_scrollBarTheme_0.arrowImage, 
            ImageColor3 = l_scrollBarTheme_0.imageColor, 
            BackgroundTransparency = 1
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));