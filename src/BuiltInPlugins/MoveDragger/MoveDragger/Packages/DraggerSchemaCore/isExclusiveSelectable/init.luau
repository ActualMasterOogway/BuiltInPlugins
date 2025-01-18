local l_DraggerFramework_0 = script.Parent.Parent.Parent.Packages.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
return function(v2, _, v4) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    if v1() then
        return v4 and v4:IsA("Attachment") and not v2:shouldExtendSelection();
    else
        return v4:IsA("Attachment") and not v2:shouldExtendSelection();
    end;
end;