local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.flags.getFIntUGCValidationMaxMsPerFrame);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = v2() / 1000;
return function(v5) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v4 (copy)
    if v3() and v5.shouldYield and tick() - v5.lastTickSeconds >= v4 then
        task.wait();
        v5.lastTickSeconds = tick();
    end;
end;