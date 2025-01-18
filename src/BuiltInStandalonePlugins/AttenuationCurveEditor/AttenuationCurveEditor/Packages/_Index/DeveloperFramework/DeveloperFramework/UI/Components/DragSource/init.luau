local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v3 = v1.PureComponent:extend("DragSource");
l_Typecheck_0.wrap(v3, script);
v3.init = function(v4) --[[ Line: 27 ]] --[[ Name: init ]]
    v4._dragging = false;
    v4._mouseDownPosition = nil;
    v4.click = function(_, v6, v7) --[[ Line: 31 ]]
        -- upvalues: v4 (copy)
        if not v4._dragging and v4.props.OnClick then
            v4.props.OnClick(v6, v7);
        end;
    end;
    v4.mouseButton1Down = function(_, v9, v10) --[[ Line: 37 ]]
        -- upvalues: v4 (copy)
        v4._mouseDownPosition = Vector2.new(v9, v10);
        v4._dragging = false;
    end;
    v4.mouseMoved = function(_, v12, v13) --[[ Line: 42 ]]
        -- upvalues: v4 (copy)
        if v4._dragging or not v4._mouseDownPosition then
            return;
        else
            if (Vector2.new(v12, v13) - v4._mouseDownPosition).Magnitude > 4 then
                v4._mouseDownPosition = nil;
                v4._dragging = true;
                if v4.props.OnDragBegan then
                    v4.props.OnDragBegan();
                end;
            end;
            return;
        end;
    end;
    v4.mouseButton1Up = function() --[[ Line: 57 ]]
        -- upvalues: v4 (copy)
        v4._mouseDownPosition = nil;
        v4._dragging = false;
    end;
    v4.rightClick = function() --[[ Line: 62 ]]
        -- upvalues: v4 (copy)
        if not v4._dragging and v4.props.OnRightClick then
            v4.props.OnRightClick();
        end;
    end;
end;
v3.render = function(v14) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v14.props;
    return v1.createElement("ImageButton", {
        AutomaticSize = l_props_0.AutomaticSize, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_props_0.Position, 
        Size = l_props_0.Size, 
        [v1.Event.Activated] = if l_props_0.OnClick then v14.click else nil, 
        [v1.Event.MouseButton1Down] = v14.mouseButton1Down, 
        [v1.Event.MouseButton1Up] = v14.mouseButton1Up, 
        [v1.Event.MouseButton2Click] = if l_props_0.OnRightClick then v14.rightClick else nil, 
        [v1.Event.MouseMoved] = v14.mouseMoved
    }, l_props_0[v1.Children]);
end;
return v3;