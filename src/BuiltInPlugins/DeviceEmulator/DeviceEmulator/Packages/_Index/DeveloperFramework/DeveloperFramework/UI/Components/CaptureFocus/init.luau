local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v5 = v1.PureComponent:extend("CaptureFocus");
l_Typecheck_0.wrap(v5, script);
v5.render = function(v6) --[[ Line: 24 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local l_props_0 = v6.props;
    local v8 = l_props_0.Focus:get();
    local v9 = l_props_0.Priority or 0;
    return v1.createElement(v1.Portal, {
        target = v8
    }, {
        TopLevelDetector = v1.createElement("ImageButton", {
            ZIndex = v9 + 1000000, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v1.Event.Activated] = v6.props.OnFocusLost
        }, {
            ScrollBlocker = v1.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, 0), 
                ScrollingEnabled = true, 
                CanvasSize = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ScrollBarThickness = 0
            }, v6.props[v1.Children])
        })
    });
end;
return (l_withContext_0({
    Focus = v2.Focus
})(v5));