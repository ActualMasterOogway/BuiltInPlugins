local l_DraggerFramework_0 = script.Parent.Parent.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Flags.getFFlagDraggerExternalHover);
return function(v2, v3, v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    v2:setHoverInstance(if v1() then v3 else v4);
end;