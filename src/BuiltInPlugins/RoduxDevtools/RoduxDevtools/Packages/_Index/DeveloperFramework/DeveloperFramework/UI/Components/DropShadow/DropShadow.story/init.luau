local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Container);
local v3 = require(l_Parent_0.UI.Components.DropShadow);
return v1.createElement("Frame", {
    Size = UDim2.new(0, 200, 0, 100), 
    BackgroundTransparency = 0, 
    BackgroundColor3 = Color3.new(1, 1, 1)
}, {
    v1.createElement(v2, {
        Size = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }, {
        DropShadow = v1.createElement(v3, {}, {
            v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = "Some text"
            })
        })
    })
});