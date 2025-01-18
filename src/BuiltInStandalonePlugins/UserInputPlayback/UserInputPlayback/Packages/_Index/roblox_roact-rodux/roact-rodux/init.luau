local v0 = require(script.StoreProvider);
local v1 = require(script.connect);
local v2 = require(script.getStore);
local v3 = require(script.TempConfig);
return {
    StoreProvider = v0, 
    connect = v1, 
    UNSTABLE_getStore = v2, 
    UNSTABLE_connect2 = v1, 
    TEMP_CONFIG = v3
};