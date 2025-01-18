local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local l_Models_0 = l_Parent_0.Src.Models;
local _ = require(l_Models_0.Watch.VariableRow);
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return l_Action_0(script.Name, function(v5, v6, v7) --[[ Line: 20 ]]
    local v8 = {};
    local v9 = {};
    for _, v11 in ipairs(v7) do
        table.insert(v8, v11.pathColumn);
        v9[v11.pathColumn] = v11;
    end;
    return {
        stepStateBundle = v5, 
        parentPath = v6, 
        childKeys = v8, 
        newVarsMapping = v9
    };
end);