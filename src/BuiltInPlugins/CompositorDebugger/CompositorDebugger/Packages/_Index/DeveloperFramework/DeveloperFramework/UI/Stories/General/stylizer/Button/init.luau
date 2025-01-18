local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_withContext_0 = require(l_Parent_0.UI.ContextServices).withContext;
local v2 = require(l_Parent_0.Parent.Roact);
local l_Stylizer_0 = require(l_Parent_0.Style).Stylizer;
local v4 = v2.PureComponent:extend("Button");
v4.render = function(v5) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_Stylizer_1 = v5.props.Stylizer;
    return v2.createElement("TextButton", {
        Size = v5.props.Size, 
        Position = v5.props.Position, 
        BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
        BackgroundTransparency = 0, 
        LayoutOrder = v5.props.LayoutOrder or 0, 
        Text = v5.props.Text or l_Stylizer_1:getPathString(), 
        TextColor3 = l_Stylizer_1.TextColor3, 
        [v2.Event.Activated] = v5.props.OnClick
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v4));