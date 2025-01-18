local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_1.Packages.Framework).Util.Action;
local v3 = require(l_Parent_0.Util.StateModelTemplate);
return l_Action_0(script.Name, function() --[[ Line: 7 ]]
    -- upvalues: v3 (copy)
    return {
        templatesArrayToAdd = {
            v3.new()
        }
    };
end);