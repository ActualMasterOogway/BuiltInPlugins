local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Box);
local v3 = require(l_Parent_0.UI.Components.Container);
return v1.createElement(v3, {
    Size = UDim2.fromOffset(100, 100)
}, {
    Decoration = v1.createElement(v2)
});