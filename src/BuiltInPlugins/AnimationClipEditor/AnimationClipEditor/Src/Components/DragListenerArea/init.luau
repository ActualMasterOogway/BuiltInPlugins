local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_DragListener_0 = v2.UI.DragListener;
local v6 = v1.PureComponent:extend("DragListenerArea");
v6.init = function(v7) --[[ Line: 26 ]] --[[ Name: init ]]
    v7.state = {
        Dragging = false
    };
    v7.onMouseEnter = function() --[[ Line: 31 ]]
        -- upvalues: v7 (copy)
        if v7.props.Mouse then
            v7.props.Mouse:__pushCursor(v7.props.Cursor);
        end;
    end;
    v7.onMouseLeave = function() --[[ Line: 37 ]]
        -- upvalues: v7 (copy)
        if v7.props.Mouse and not v7.state.Dragging then
            v7.props.Mouse:__popCursor();
        end;
    end;
    v7.startDragging = function() --[[ Line: 43 ]]
        -- upvalues: v7 (copy)
        if v7.props.OnDragBegan then
            v7.props.OnDragBegan();
        end;
        v7:setState({
            Dragging = true
        });
    end;
    v7.onDragMoved = function(v8) --[[ Line: 52 ]]
        -- upvalues: v7 (copy)
        if v7.props.OnDragMoved then
            v7.props.OnDragMoved(v8);
        end;
    end;
end;
v6.didMount = function(v9) --[[ Line: 59 ]] --[[ Name: didMount ]]
    local l_Mouse_0 = v9.props.Mouse;
    v9.stopDragging = function() --[[ Line: 61 ]]
        -- upvalues: l_Mouse_0 (copy), v9 (copy)
        l_Mouse_0:__resetCursor();
        v9:setState({
            Dragging = false
        });
        if v9.props.OnDragEnded then
            v9.props.OnDragEnded();
        end;
    end;
end;
v6.willUnmount = function(v11) --[[ Line: 72 ]] --[[ Name: willUnmount ]]
    v11.props.Mouse:__resetCursor();
end;
v6.render = function(v12) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_DragListener_0 (copy)
    local l_state_0 = v12.state;
    local l_props_0 = v12.props;
    local l_Dragging_0 = l_state_0.Dragging;
    local v16 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local v17 = l_props_0.AnchorPoint or Vector2.new();
    return v1.createElement("ImageButton", {
        Size = v16, 
        AnchorPoint = v17, 
        ImageTransparency = 1, 
        BackgroundTransparency = 1, 
        [v1.Event.MouseEnter] = v12.onMouseEnter, 
        [v1.Event.MouseLeave] = v12.onMouseLeave, 
        [v1.Event.MouseButton1Down] = v12.startDragging
    }, {
        Target = l_Dragging_0 and v1.createElement(l_DragListener_0, {
            OnDragMoved = v12.onDragMoved, 
            OnDragEnded = v12.stopDragging
        })
    });
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse
})(v6));