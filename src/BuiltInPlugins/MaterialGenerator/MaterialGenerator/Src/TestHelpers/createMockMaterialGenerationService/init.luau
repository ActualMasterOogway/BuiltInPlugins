local l_Parent_0 = script.Parent.Parent.Parent;
local l_ServiceWrapper_0 = require(l_Parent_0.Packages.Framework).TestHelpers.ServiceWrapper;
return function() --[[ Line: 11 ]]
    -- upvalues: l_ServiceWrapper_0 (copy)
    return l_ServiceWrapper_0.new("MaterialGenerationService", true):asService();
end;