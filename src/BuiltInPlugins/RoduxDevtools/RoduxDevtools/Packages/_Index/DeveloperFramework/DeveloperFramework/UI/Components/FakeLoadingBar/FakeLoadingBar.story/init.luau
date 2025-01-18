local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.FakeLoadingBar);
return v1.createElement(v2, {
    LoadingTime = 5, 
    Size = UDim2.fromOffset(120, 8)
});