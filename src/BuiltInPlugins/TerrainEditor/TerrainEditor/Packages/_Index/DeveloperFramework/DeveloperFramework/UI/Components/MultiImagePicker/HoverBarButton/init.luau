local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = v1.PureComponent:extend("HoverBarButton");
v4.init = function(v5) --[[ Line: 36 ]] --[[ Name: init ]]
    v5.state = {
        Hovering = false
    };
end;
v4.mouseHoverChanged = function(v6, v7) --[[ Line: 42 ]] --[[ Name: mouseHoverChanged ]]
    local l_props_0 = v6.props;
    if v7 then
        l_props_0.Mouse:__pushCursor("PointingHand");
    else
        l_props_0.Mouse:__resetCursor();
    end;
    v6:setState({
        Hovering = v7
    });
end;
v4.render = function(v9) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_Hovering_0 = v9.state.Hovering;
    local l_props_1 = v9.props;
    local v12 = l_props_1.Position or UDim2.new();
    local v13 = l_props_1.AnchorPoint or Vector2.new();
    local l_Image_0 = l_props_1.Image;
    local l_HoverBarButton_0 = l_props_1.Theme.HoverBarButton;
    return v1.createElement("ImageButton", {
        BackgroundTransparency = 1, 
        ImageTransparency = l_Hovering_0 and 0.9 or 1, 
        Image = l_HoverBarButton_0.RoundedBackgroundImage, 
        Size = UDim2.new(0, 28, 0, 28), 
        Position = v12, 
        AnchorPoint = v13, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = l_HoverBarButton_0.RoundedFrameSlice, 
        [v1.Event.Activated] = l_props_1.ButtonPressed, 
        [v1.Event.MouseEnter] = function() --[[ Line: 80 ]]
            -- upvalues: v9 (copy)
            v9:mouseHoverChanged(true);
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 84 ]]
            -- upvalues: v9 (copy)
            v9:mouseHoverChanged(false);
        end
    }, {
        Icon = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = l_Image_0
        })
    });
end;
return (l_withContext_0({
    Mouse = v2.Mouse
})(v4));