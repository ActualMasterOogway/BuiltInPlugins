local v0 = require(script.createGroupMotor);
local v1 = require(script.createSingleMotor);
local v2 = require(script.spring);
local v3 = require(script.instant);
local _ = require(script.types);
local v5 = require(script.AnimationStepSignal);
return {
    createGroupMotor = v0, 
    createSingleMotor = v1, 
    spring = v2, 
    instant = v3, 
    __devAnimationStepSignal = v5
};