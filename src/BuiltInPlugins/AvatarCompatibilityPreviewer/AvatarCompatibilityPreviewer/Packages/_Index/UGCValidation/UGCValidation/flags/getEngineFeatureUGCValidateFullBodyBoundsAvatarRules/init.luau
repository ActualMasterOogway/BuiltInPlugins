local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUGCValidateConfigurableFullBodyBounds);
return function() --[[ Line: 7 ]]
    -- upvalues: v1 (copy)
    return v1() and game:GetEngineFeature("EngineUGCValidateFullBodyBoundsAvatarRules");
end;