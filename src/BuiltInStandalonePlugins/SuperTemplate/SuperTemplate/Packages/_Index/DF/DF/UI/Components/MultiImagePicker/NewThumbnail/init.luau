local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = v1.PureComponent:extend("NewThumbnail");
v4.init = function(v5) --[[ Line: 31 ]] --[[ Name: init ]]
    v5.mouseEnter = function() --[[ Line: 32 ]]
        -- upvalues: v5 (copy)
        v5:mouseHoverChanged(true);
    end;
    v5.mouseLeave = function() --[[ Line: 36 ]]
        -- upvalues: v5 (copy)
        v5:mouseHoverChanged(false);
    end;
end;
v4.mouseHoverChanged = function(v6, v7) --[[ Line: 41 ]] --[[ Name: mouseHoverChanged ]]
    local l_props_0 = v6.props;
    if v7 then
        l_props_0.Mouse:__pushCursor("PointingHand");
        return;
    else
        l_props_0.Mouse:__resetCursor();
        return;
    end;
end;
v4.render = function(v9) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_1 = v9.props;
    local l_Theme_0 = l_props_1.Theme;
    local l_NewThumbnail_0 = l_Theme_0.NewThumbnail;
    return v1.createElement("ImageButton", {
        BorderSizePixel = 0, 
        BackgroundColor3 = l_NewThumbnail_0.Background, 
        Size = UDim2.new(1, 0, 1, 0), 
        ImageColor3 = l_NewThumbnail_0.Border, 
        LayoutOrder = l_props_1.LayoutOrder or 1, 
        Image = l_Theme_0.DottedBorder.Image, 
        ResampleMode = Enum.ResamplerMode.Pixelated, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = l_Theme_0.DottedBorder.SliceCenter, 
        [v1.Event.MouseEnter] = v9.mouseEnter, 
        [v1.Event.MouseLeave] = v9.mouseLeave, 
        [v1.Event.Activated] = l_props_1.OnClick
    }, {
        Plus = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_NewThumbnail_0.Plus.Image, 
            ImageColor3 = l_NewThumbnail_0.PlusColor, 
            ImageTransparency = 0.4, 
            Size = UDim2.new(0, 24, 0, 24), 
            ImageRectSize = l_NewThumbnail_0.Plus.RectSize, 
            ImageRectOffset = l_NewThumbnail_0.Plus.RectOffset, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            ZIndex = 2
        })
    });
end;
return (l_withContext_0({
    Mouse = v2.Mouse
})(v4));