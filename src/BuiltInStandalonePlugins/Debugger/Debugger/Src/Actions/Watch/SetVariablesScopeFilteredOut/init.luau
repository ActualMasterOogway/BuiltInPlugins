local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return l_Action_0(script.Name, function(v3, v4) --[[ Line: 17 ]]
    return {
        stepStateBundle = v3, 
        textFilterMap = v4
    };
end);