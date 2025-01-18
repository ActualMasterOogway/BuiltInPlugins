local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.TestLoader);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if v1.isCli() then
        return true;
    else
        return game:GetFastFlag("KeepZeroInfluenceBones");
    end;
end;