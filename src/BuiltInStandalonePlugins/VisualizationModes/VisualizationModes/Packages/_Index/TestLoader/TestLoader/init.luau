local _ = require(script.types);
return {
    ModuleLoader = require(script.ModuleLoader), 
    getDebugFlags = require(script.getDebugFlags), 
    hasInternalPermission = require(script.hasInternalPermission), 
    isCli = require(script.isCli), 
    launch = require(script.launch), 
    isFTF = require(script.isFTF)
};