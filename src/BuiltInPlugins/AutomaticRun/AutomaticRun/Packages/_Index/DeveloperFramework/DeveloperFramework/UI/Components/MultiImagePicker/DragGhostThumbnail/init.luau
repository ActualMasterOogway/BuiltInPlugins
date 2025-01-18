local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = v1.PureComponent:extend("DragGhostThumbnail");
v2.init = function(v3) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    v3.imageRef = v1.createRef();
    v3.inputChanged = function(v4, v5) --[[ Line: 35 ]]
        -- upvalues: v3 (copy)
        if v5.UserInputType == Enum.UserInputType.MouseMovement then
            local l_current_0 = v3.imageRef.current;
            local l_AbsolutePosition_0 = v4.AbsolutePosition;
            l_current_0.Position = UDim2.new(0, v5.Position.x - l_AbsolutePosition_0.x, 0, v5.Position.y - l_AbsolutePosition_0.y);
        end;
    end;
    v3.inputEnded = function(_, v9) --[[ Line: 43 ]]
        -- upvalues: v3 (copy)
        local l_props_0 = v3.props;
        if v9.UserInputType == Enum.UserInputType.MouseButton1 then
            l_props_0.StopDragging();
        end;
    end;
end;
v2.render = function(v11) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_1 = v11.props;
    local l_Theme_0 = l_props_1.Theme;
    local l_Image_0 = l_props_1.Image;
    local l_Enabled_0 = l_props_1.Enabled;
    local l_ThumbnailSize_0 = l_props_1.ThumbnailSize;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 10, 
        [v1.Event.InputChanged] = v11.inputChanged, 
        [v1.Event.InputEnded] = v11.inputEnded
    }, {
        Ghost = v1.createElement("ImageLabel", {
            Visible = l_Enabled_0, 
            BackgroundTransparency = 0.85, 
            BackgroundColor3 = l_Theme_0.Colors.Blue, 
            BorderColor3 = l_Theme_0.Colors.Blue, 
            BorderSizePixel = 3, 
            Size = l_ThumbnailSize_0, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = l_Image_0 or l_Theme_0.VideoPlaceholder, 
            ImageColor3 = l_Image_0 == nil and l_Theme_0.Thumbnail.Background or nil, 
            ImageTransparency = 0.5, 
            ScaleType = Enum.ScaleType.Fit, 
            ZIndex = 3, 
            [v1.Ref] = v11.imageRef
        })
    });
end;
return v2;