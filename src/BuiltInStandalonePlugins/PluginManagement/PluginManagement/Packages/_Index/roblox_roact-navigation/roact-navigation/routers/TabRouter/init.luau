local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.SwitchRouter);
local v2 = require(script.Parent.Parent.BackBehavior);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy)
    local v4 = v0.Dictionary.join({
        resetOnBlur = false, 
        backBehavior = v2.InitialRoute
    }, v3);
    return v1(v4);
end;