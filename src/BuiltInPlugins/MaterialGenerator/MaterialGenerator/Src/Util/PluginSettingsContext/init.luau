local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_createUnimplemented_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).createUnimplemented;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = {
    getSetting = l_createUnimplemented_0("getSetting"), 
    setSetting = l_createUnimplemented_0("setSetting"), 
    pluginSettings = {}
};
return v1.createContext(v4);