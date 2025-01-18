local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v2.UI.Pane;
local v6 = v1.PureComponent:extend("TimeTag");
v6.render = function(v7) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy)
    local l_props_0 = v7.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Time_0 = l_props_0.Time;
    local l_ZIndex_0 = l_props_0.ZIndex;
    return v1.createElement(l_Pane_0, {
        Style = "BorderBox", 
        BackgroundColor3 = l_Stylizer_0.scaleControlsTheme.mainColor, 
        BorderSizePixel = 0, 
        AnchorPoint = l_AnchorPoint_0, 
        Size = l_Size_0, 
        Position = l_Position_0, 
        ZIndex = l_ZIndex_0
    }, {
        Time = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, -4, 1, -2), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Text = l_Time_0, 
            TextColor3 = l_Stylizer_0.scaleControlsTheme.textColor, 
            TextSize = l_Stylizer_0.scaleControlsTheme.textSize, 
            Font = l_Stylizer_0.font
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));