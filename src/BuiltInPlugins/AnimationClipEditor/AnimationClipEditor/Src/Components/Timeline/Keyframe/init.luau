local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = v1.PureComponent:extend("Keyframe");
v4.render = function(v5) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v5.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_KeyframeStyle_0 = l_props_0.KeyframeStyle;
    local l_Selected_0 = l_props_0.Selected;
    local l_Named_0 = l_props_0.Named;
    local v11 = l_KeyframeStyle_0 and l_Stylizer_0.keyframe[l_KeyframeStyle_0] or l_Stylizer_0.keyframe.Default;
    local v12 = l_Selected_0 and v11.selected or v11;
    local l_Position_0 = l_props_0.Position;
    local v14 = l_props_0.BorderSizePixel or 2;
    local v15 = l_props_0.Width or 10;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_OnActivated_0 = l_props_0.OnActivated;
    local l_OnRightClick_0 = l_props_0.OnRightClick;
    local l_OnInputBegan_0 = l_props_0.OnInputBegan;
    local l_OnInputEnded_0 = l_props_0.OnInputEnded;
    local v21 = l_props_0.Filled and v12.backgroundColor or l_Stylizer_0.backgroundColor;
    return v1.createElement("ImageButton", {
        Size = UDim2.new(0, v15, 0, v15), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = l_Position_0, 
        Rotation = if l_Named_0 then nil else 45, 
        ZIndex = l_ZIndex_0, 
        ImageTransparency = 1, 
        BackgroundTransparency = 0, 
        AutoButtonColor = false, 
        BorderSizePixel = v14, 
        BorderColor3 = v12.borderColor, 
        BackgroundColor3 = v21, 
        [v1.Event.Activated] = l_OnActivated_0, 
        [v1.Event.MouseButton2Click] = l_OnRightClick_0, 
        [v1.Event.InputBegan] = l_OnInputBegan_0, 
        [v1.Event.InputEnded] = l_OnInputEnded_0
    }, l_props_0[v1.Children]);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v4));