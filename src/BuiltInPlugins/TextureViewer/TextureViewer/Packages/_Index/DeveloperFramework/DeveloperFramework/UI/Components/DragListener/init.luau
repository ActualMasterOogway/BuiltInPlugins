local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v3 = require(l_Parent_0.UI.Components.CaptureFocus);
local v4 = v1.PureComponent:extend("DragListener");
l_Typecheck_0.wrap(v4, script);
v4.init = function(v5) --[[ Line: 23 ]] --[[ Name: init ]]
    v5.inputChanged = function(_, v7) --[[ Line: 24 ]]
        -- upvalues: v5 (copy)
        if v7.UserInputType == Enum.UserInputType.MouseMovement and v5.props.OnDragMoved then
            v5.props.OnDragMoved(v7);
        end;
    end;
    v5.inputEnded = function() --[[ Line: 32 ]]
        -- upvalues: v5 (copy)
        if v5.props.OnDragEnded then
            v5.props.OnDragEnded();
        end;
    end;
end;
v4.render = function(v8) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    return v1.createElement(v3, {
        OnFocusLost = v8.inputEnded
    }, {
        Listener = v1.createElement("ImageButton", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v1.Event.InputChanged] = v8.inputChanged, 
            [v1.Event.InputEnded] = v8.inputEnded, 
            [v1.Event.MouseButton1Up] = v8.inputEnded, 
            [v1.Event.MouseButton2Up] = v8.inputEnded
        }, v8.props[v1.Children])
    });
end;
return v4;