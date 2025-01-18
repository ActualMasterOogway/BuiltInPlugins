local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(script.Parent);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = UDim2.new(1, 0, 0, 100);
    local l_Model_0 = Instance.new("Model");
    l_Model_0.Name = "My Model";
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = "My script with a lovely long name to test wrapping and I'll keep going so it will be long enough.";
    return {
        Model = v1.createElement(v2, {
            Instance = l_Model_0, 
            Size = v3
        }), 
        Script = v1.createElement(v2, {
            Instance = l_Script_0, 
            Size = v3
        })
    };
end;