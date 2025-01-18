local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Util.Constants);
local v2 = {};
v2.__index = v2;
v2.new = function(v3, v4, v5, v6) --[[ Line: 18 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v7 = {
        VariableId = v3, 
        Name = v4, 
        Value = v5, 
        Type = v6, 
        Populated = false, 
        PopulatableType = "DebuggerVariable"
    };
    setmetatable(v7, v2);
    return v7;
end;
v2.MockSetChildren = function(v8, v9) --[[ Line: 32 ]] --[[ Name: MockSetChildren ]]
    v8.children = v9;
end;
v2.GetChildren = function(v10) --[[ Line: 36 ]] --[[ Name: GetChildren ]]
    return v10.children and v10.children or {};
end;
v2.GetVariableByIndex = function(_) --[[ Line: 40 ]] --[[ Name: GetVariableByIndex ]]
    -- upvalues: v2 (copy)
    return v2.new(0, "", "", "");
end;
v2.newDummyRow = function() --[[ Line: 45 ]] --[[ Name: newDummyRow ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.new(0, v1.DummyRowName, "", "");
end;
v2.GetDefaultFrameVariables = function() --[[ Line: 49 ]] --[[ Name: GetDefaultFrameVariables ]]
    -- upvalues: v2 (copy)
    return {
        Locals = v2.new(1, "", "", ""), 
        Globals = v2.new(1, "", "", ""), 
        Upvalues = v2.new(1, "", "", "")
    };
end;
return v2;