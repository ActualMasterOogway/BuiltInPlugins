local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_0.Rect);
local v5 = v3.PureComponent:extend("FitFrameOnAxis");
v5.Axis = {
    Horizontal = {}, 
    Vertical = {}, 
    Both = {}
};
v5.defaultProps = {
    axis = v5.Axis.Vertical, 
    minimumSize = UDim2.new(UDim.new(0, 0), UDim.new(0, 0)), 
    margin = v4.square(0), 
    FillDirection = Enum.FillDirection.Vertical, 
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    ImageSet = {}, 
    VerticalAlignment = Enum.VerticalAlignment.Top, 
    contentPadding = UDim.new(0, 0)
};
v5.init = function(v6) --[[ Line: 28 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v6.layoutRef = v3.createRef();
    v6.frameRef = v6.props[v3.Ref] or v3.createRef();
    v6.onResize = function() --[[ Line: 32 ]]
        -- upvalues: v6 (copy)
        local l_current_0 = v6.layoutRef.current;
        local l_current_1 = v6.frameRef.current;
        if not l_current_1 or not l_current_0 then
            return;
        else
            l_current_1.Size = v6:__getSize(l_current_0);
            return;
        end;
    end;
end;
v5.render = function(v9) --[[ Line: 43 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v2 (copy)
    assert(v9.props.Size == nil, "Size is not a valid property of FitFrameOnAxis. Did you mean `minimumSize`?");
    local v10 = v9.props[v3.Children] or {};
    local v11 = v9:__getFilteredProps();
    return v3.createElement("ImageLabel", v11, v2.Dictionary.join(v10, {
        ["$layout"] = v3.createElement("UIListLayout", {
            FillDirection = v9.props.FillDirection, 
            HorizontalAlignment = v9.props.HorizontalAlignment, 
            Padding = v9.props.contentPadding, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = v9.props.VerticalAlignment, 
            [v3.Change.AbsoluteContentSize] = v9.onResize, 
            [v3.Ref] = v9.layoutRef
        }), 
        ["$margin"] = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, v9.props.margin.left), 
            PaddingRight = UDim.new(0, v9.props.margin.right), 
            PaddingTop = UDim.new(0, v9.props.margin.top), 
            PaddingBottom = UDim.new(0, v9.props.margin.bottom)
        })
    }));
end;
v5.didMount = function(v12) --[[ Line: 70 ]] --[[ Name: didMount ]]
    v12.onResize();
end;
v5.didUpdate = function(v13) --[[ Line: 74 ]] --[[ Name: didUpdate ]]
    v13.onResize();
end;
v5.__getFilteredProps = function(v14) --[[ Line: 78 ]] --[[ Name: __getFilteredProps ]]
    -- upvalues: v2 (copy), v3 (copy), v5 (copy)
    local v15 = v2.Dictionary.join(v14.props.ImageSet, {
        [v3.Ref] = v14.frameRef
    });
    for v16, _ in pairs(v5.defaultProps) do
        v15[v16] = v2.None;
    end;
    return v2.Dictionary.join(v14.props, v15, {
        [v3.Children] = v2.None
    });
end;
v5.__getSize = function(v18, v19) --[[ Line: 96 ]] --[[ Name: __getSize ]]
    -- upvalues: v5 (copy)
    if v18.props.axis == v5.Axis.Both then
        return v18:__getBothAxisSize(v19);
    else
        local v20 = v18:__getAxisUDim(v19.AbsoluteContentSize);
        local v21 = v18:__getOtherUDim();
        if v18.props.axis == v5.Axis.Vertical then
            return UDim2.new(v21, v20);
        elseif v18.props.axis == v5.Axis.Horizontal then
            return UDim2.new(v20, v21);
        else
            return;
        end;
    end;
end;
v5.__getBothAxisSize = function(v22, v23) --[[ Line: 113 ]] --[[ Name: __getBothAxisSize ]]
    local l_minimumSize_0 = v22.props.minimumSize;
    local l_AbsoluteContentSize_0 = v23.AbsoluteContentSize;
    local v26 = UDim.new(l_minimumSize_0.X.Scale, l_AbsoluteContentSize_0.X + v22:__getHorizontalMargin());
    local v27 = UDim.new(l_minimumSize_0.Y.Scale, l_AbsoluteContentSize_0.Y + v22:__getVerticalMargin());
    return UDim2.new(v26, v27);
end;
v5.__getAxisUDim = function(v28, v29) --[[ Line: 123 ]] --[[ Name: __getAxisUDim ]]
    -- upvalues: v5 (copy)
    local l_minimumSize_1 = v28.props.minimumSize;
    local v31 = nil;
    local v32 = nil;
    if v28.props.axis == v5.Axis.Vertical then
        v31 = l_minimumSize_1.Y;
        v32 = v29.Y + v28:__getVerticalMargin();
    elseif v28.props.axis == v5.Axis.Horizontal then
        v31 = l_minimumSize_1.X;
        v32 = v29.X + v28:__getHorizontalMargin();
    end;
    return UDim.new(v31.Scale, (math.max(v32, v31.Offset)));
end;
v5.__getVerticalMargin = function(v33) --[[ Line: 141 ]] --[[ Name: __getVerticalMargin ]]
    return v33.props.margin.top + v33.props.margin.bottom;
end;
v5.__getHorizontalMargin = function(v34) --[[ Line: 145 ]] --[[ Name: __getHorizontalMargin ]]
    return v34.props.margin.left + v34.props.margin.right;
end;
v5.__getOtherUDim = function(v35) --[[ Line: 149 ]] --[[ Name: __getOtherUDim ]]
    -- upvalues: v5 (copy)
    local l_minimumSize_2 = v35.props.minimumSize;
    if v35.props.axis == v5.Axis.Vertical then
        return l_minimumSize_2.X;
    elseif v35.props.axis == v5.Axis.Horizontal then
        return l_minimumSize_2.Y;
    else
        return;
    end;
end;
return v5;