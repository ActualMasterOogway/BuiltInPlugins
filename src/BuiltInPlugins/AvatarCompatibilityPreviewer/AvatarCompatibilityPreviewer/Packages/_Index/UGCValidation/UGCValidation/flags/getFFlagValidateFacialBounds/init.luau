local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineUGCNewFACSChecks);
game:DefineFastFlag("ValidateFacialBounds", false);
return function() --[[ Line: 9 ]]
    -- upvalues: v1 (copy)
    return v1() and game:GetFastFlag("ValidateFacialBounds");
end;