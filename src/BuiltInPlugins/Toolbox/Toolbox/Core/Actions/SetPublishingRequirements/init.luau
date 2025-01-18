local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
local _ = require(l_Parent_0.Core.Types.PublishingRequirementsType);
return l_Action_0(script.Name, function(v4) --[[ Line: 8 ]]
    return {
        publishingRequirements = v4
    };
end);