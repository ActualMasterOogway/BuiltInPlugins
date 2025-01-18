local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Issue);
local v2 = require(l_Parent_0.R6Info);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    return (setmetatable({
        StartIndex = v4, 
        EndIndex = v5, 
        Issues = {}, 
        Children = {}, 
        Lines = {}, 
        Variables = {}
    }, v3));
end;
local function _(v6, v7) --[[ Line: 19 ]] --[[ Name: setParent ]]
    v6.Parent = v7;
end;
v3.AddChild = function(v9, v10) --[[ Line: 23 ]] --[[ Name: AddChild ]]
    table.insert(v9.Children, v10);
    v10.Parent = v9;
end;
v3.AddVariable = function(v11, v12, v13, v14, v15) --[[ Line: 28 ]] --[[ Name: AddVariable ]]
    v11.Variables[v12] = {
        Value = v13, 
        LineNo = v14, 
        StartIndex = v15
    };
end;
v3.SetVariableValue = function(v16, v17, v18) --[[ Line: 36 ]] --[[ Name: SetVariableValue ]]
    if v16.Variables[v17] then
        v16.Variables[v17].Value = v18;
    end;
end;
v3.IsHumanoidVariable = function(v19, v20) --[[ Line: 42 ]] --[[ Name: IsHumanoidVariable ]]
    -- upvalues: v2 (copy)
    if v19.Variables[v20] then
        local l_Value_0 = v19.Variables[v20].Value;
        return v2.IsHumanoidName(v20) or v2.IsHumanoidName(l_Value_0);
    else
        return false;
    end;
end;
v3.AddIssue = function(v22, ...) --[[ Line: 51 ]] --[[ Name: AddIssue ]]
    -- upvalues: v1 (copy)
    table.insert(v22.Issues, v1.new(...));
end;
return v3;