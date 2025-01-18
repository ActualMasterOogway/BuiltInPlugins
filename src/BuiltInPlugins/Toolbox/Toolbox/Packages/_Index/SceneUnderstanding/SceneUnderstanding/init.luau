local v0 = require(script.options.ViewportQueryOptions);
local v1 = require(script.options.RangeQueryOptions);
return {
    ViewportQueryOptions = v0, 
    RangeQueryOptions = v1, 
    getSourceAssetsInView = require(script.getSourceAssetsInView), 
    getSourceAssetsInRange = require(script.getSourceAssetsInRange)
};