local l_Parent_0 = script.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local l_Enum_0 = l_Parent_0.Src.Enum;
local v3 = require(l_Enum_0.GenerationErrorType);
return l_Action_0(script.Name, function(v4, v5) --[[ Line: 14 ]]
    -- upvalues: v3 (copy)
    assert(v3.isEnumValue(v4), "Bad generationErrorType");
    return {
        generationErrorType = v4, 
        message = v5
    };
end);