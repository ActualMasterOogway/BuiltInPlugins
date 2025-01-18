local v0 = require(script.Parent.Otter);
local v1 = require(script.useAnimatedBinding);
local v2 = require(script.useMotor);
return {
    useAnimatedBinding = v1, 
    useMotor = v2, 
    spring = v0.spring, 
    instant = v0.instant
};