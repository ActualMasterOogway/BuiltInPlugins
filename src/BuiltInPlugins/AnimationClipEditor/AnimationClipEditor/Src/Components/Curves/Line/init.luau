local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = v1.PureComponent:extend("Line");
v2.render = function(v3) --[[ Line: 28 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v3.props;
    local l_A_0 = l_props_0.A;
    local l_B_0 = l_props_0.B;
    if l_A_0.X > l_B_0.X then
        local l_l_B_0_0 = l_B_0;
        l_B_0 = l_A_0;
        l_A_0 = l_l_B_0_0;
    end;
    local v8 = UDim2.new(0, (l_A_0.X + l_B_0.X) / 2, 0, (l_A_0.Y + l_B_0.Y) / 2);
    local v9 = math.sqrt((l_B_0.X - l_A_0.X) * (l_B_0.X - l_A_0.X) + (l_B_0.Y - l_A_0.Y) * (l_B_0.Y - l_A_0.Y));
    local v10 = UDim2.new(0, v9 + 1, 0, l_props_0.Width or 1);
    local v11 = math.atan2(l_B_0.Y - l_A_0.Y, l_B_0.X - l_A_0.X);
    return v1.createElement("Frame", {
        Position = v8, 
        Size = v10, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = l_props_0.Transparency, 
        BackgroundColor3 = l_props_0.Color, 
        BorderSizePixel = 0, 
        BorderColor3 = l_props_0.Color, 
        Rotation = math.deg(v11), 
        ZIndex = l_props_0.ZIndex
    });
end;
return v2;