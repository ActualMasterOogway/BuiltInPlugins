local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v5 = v1.PureComponent:extend("ShowOnTop");
l_Typecheck_0.wrap(v5, script);
v5.render = function(v6) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    local v7 = v6.props.Focus:get();
    local v8 = v6.props.Priority or 0;
    return v1.createElement(v1.Portal, {
        target = v7
    }, {
        TopLevelFrame = v1.createElement("Frame", {
            ZIndex = v8 + 1000000, 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v6.props[v1.Children])
    });
end;
return (l_withContext_0({
    Focus = v2.Focus
})(v5));