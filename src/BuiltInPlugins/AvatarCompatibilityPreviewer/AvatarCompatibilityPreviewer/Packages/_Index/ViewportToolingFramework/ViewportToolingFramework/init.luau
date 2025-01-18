local v0 = game:DefineFastFlag("ViewportToolingFrameworkRemoveTypes", false);
local v1 = require(script.Types);
return {
    SharedFlags = require(script.SharedFlags), 
    Toolbar = require(script.Components.Toolbar), 
    Types = if v0 then nil else v1
};