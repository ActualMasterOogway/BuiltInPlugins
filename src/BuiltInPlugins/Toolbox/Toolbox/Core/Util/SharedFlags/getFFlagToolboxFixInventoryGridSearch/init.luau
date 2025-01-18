game:DefineFastFlag("ToolboxFixInventoryGridSearch", false);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v1() and game:GetFastFlag("ToolboxFixInventoryGridSearch");
end;