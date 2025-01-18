local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateTotalSurfaceAreaTest);
game:DefineFastFlag("UGCValidateTotalSurfaceAreaTestAccessory", false);
return function() --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    return v1() and game:GetFastFlag("UGCValidateTotalSurfaceAreaTestAccessory");
end;