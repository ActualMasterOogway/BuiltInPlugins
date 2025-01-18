local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return l_Action_0(script.Name, function(v3, v4, v5) --[[ Line: 18 ]]
    return {
        stepStateBundle = v3, 
        parentPath = v4, 
        isVariablesTab = v5
    };
end);