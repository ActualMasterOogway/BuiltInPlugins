local l_Actions_0 = script:FindFirstAncestor("R15Migrator").Src.Actions;
local v1 = require(l_Actions_0.ResetAllAnimationConversion);
local v2 = require(l_Actions_0.ResetAllCharacterConversion);
local v3 = require(l_Actions_0.ResetAllScriptConversion);
local v4 = require(l_Actions_0.ResetAllAdapter);
return function() --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref)
        v5:dispatch(v1());
        v5:dispatch(v2());
        v5:dispatch(v3());
        v5:dispatch(v4());
    end;
end;