local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Container);
local v3 = require(l_Parent_0.UI.Components.HoverArea);
return v1.createElement(v2, {
    Size = UDim2.new(1, 0, 0, 300)
}, {
    BottomLabel = v1.createElement("TextLabel", {
        Size = UDim2.new(0, 100, 0, 60), 
        Text = "Priority 1\nPointingHand", 
        Position = UDim2.new(0.5, 0, 0.5, -25), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        HoverArea = v1.createElement(v3, {
            Cursor = "PointingHand"
        })
    }), 
    TopLabel = v1.createElement("TextLabel", {
        Size = UDim2.new(0, 100, 0, 60), 
        Text = "Priority 2\nOpenHand", 
        Position = UDim2.new(0.5, 20, 0.5, 25), 
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, {
        HoverArea = v1.createElement(v3, {
            Cursor = "OpenHand", 
            Priority = 2
        })
    })
});