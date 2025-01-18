local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local l_ContextItem_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem;
assert(not require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagDevFrameworkRibbonHooks)(), "Ribbon design context has been removed");
return l_ContextItem_0:createSimple("Design");