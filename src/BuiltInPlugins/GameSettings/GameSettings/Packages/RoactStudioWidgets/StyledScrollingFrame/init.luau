local v0 = require(script.Parent.Internal.RequireRoact);
local v1 = require(script.Parent.Internal.ThemeChangeListener);
local v2 = require(script.Parent.Internal.Theme);
local v3 = nil;
local v4 = v0.PureComponent:extend("StyledScrollingFrame");
v4.render = function(v5) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v3 (ref), v0 (copy), v1 (copy)
    local function v14() --[[ Line: 34 ]] --[[ Name: renderInternal ]]
        -- upvalues: v5 (copy), v3 (ref), v0 (ref)
        local v6 = v5.props.Position or UDim2.new(0, 0, 0, 0);
        local v7 = v5.props.Size or UDim2.new(1, 0, 1, 0);
        local v8 = v5.props.CanvasSize or UDim2.new(1, 0, 1, 0);
        local v9 = v5.props.LayoutOrder or 1;
        local v10 = v5.props.ZIndex or 1;
        local v11 = v5.props.Visible ~= nil and v5.props.Visible or v5.props.Visible == nil;
        local v12 = v5.props.ShowBackground ~= nil and v5.props.ShowBackground or v5.props.ShowBackground == nil;
        local v13 = v3(v5);
        return v0.createElement("Frame", {
            Position = v6, 
            Size = v7, 
            BackgroundTransparency = 1, 
            LayoutOrder = v9, 
            ZIndex = v10, 
            Visible = v11, 
            ClipsDescendants = v5.props.ClipsDescendants
        }, {
            ScrollBarBackground = v12 and v0.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, 0, 0.5, 0), 
                Size = UDim2.new(0, 19, 2, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v13.ScrollBarBackgroundColor
            }), 
            ScrollingFrame = v0.createElement("ScrollingFrame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, -6, 1, 0), 
                CanvasSize = v8, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 8, 
                ScrollBarImageColor3 = v13.scrollBarColor, 
                ZIndex = 2, 
                TopImage = "rbxasset://textures/GameSettings/ScrollBarTop_Wide.png", 
                MidImage = "rbxasset://textures/GameSettings/ScrollBarMiddle_Wide.png", 
                BottomImage = "rbxasset://textures/GameSettings/ScrollBarBottom_Wide.png", 
                ScrollingEnabled = not v5.props.DisableScrolling, 
                ElasticBehavior = Enum.ElasticBehavior.Always, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                CanvasPosition = v5.props.CanvasPosition, 
                [v0.Change.CanvasPosition] = v5.props.onScroll, 
                [v0.Ref] = v5.props[v0.Ref]
            }, v5.props[v0.Children])
        });
    end;
    return v0.createElement(v1, {
        render = v14
    });
end;
v3 = function(v15) --[[ Line: 95 ]]
    -- upvalues: v2 (copy)
    local v16 = {
        scrollBarBackgroundColor = v2.getScrollBarBackgroundColor(), 
        scrollBarColor = v2.getScrollBarColor()
    };
    local v17 = {};
    for v18, v19 in pairs(v16) do
        v17[v18] = v15.props.Style and v15.props.Style[v18] or v19;
    end;
    return v17;
end;
return v4;