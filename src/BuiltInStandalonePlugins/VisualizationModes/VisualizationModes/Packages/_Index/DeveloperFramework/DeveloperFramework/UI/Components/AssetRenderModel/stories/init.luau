local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_Model_0 = Instance.new("Model");
    Instance.new("Part").Parent = l_Model_0;
    return {
        Model = v1.createElement(v2, {
            Model = l_Model_0, 
            Size = UDim2.new(1, 0, 0, 200)
        }), 
        Controls = v1.createElement(v2, {
            Model = l_Model_0, 
            Size = UDim2.new(1, 0, 0, 200), 
            ShowAxisIndicator = true, 
            ShowResetCamera = true
        })
    };
end;