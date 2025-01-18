local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_withContext_0 = require(l_Parent_0.UI.ContextServices).withContext;
local v2 = require(l_Parent_0.Parent.Roact);
local l_Stylizer_0 = require(l_Parent_0.Style).Stylizer;
local v4 = require(script.Parent.Box);
local v5 = v2.PureComponent:extend("Dialog");
v5.render = function(v6) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_Stylizer_1 = v6.props.Stylizer;
    return v2.createElement("Frame", {
        Size = v6.props.Size, 
        Position = v6.props.Position, 
        BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
        BackgroundTransparency = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        FrontText = v2.createElement("TextLabel", {
            Text = l_Stylizer_1:getPathString(), 
            Size = UDim2.new(1, 0, 1, -60), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            TextColor3 = l_Stylizer_1.TextColor3
        }), 
        Box = v2.createElement(v4, {
            Position = UDim2.fromOffset(10, 10), 
            Size = UDim2.new(1, -20, 0, 100)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v5));