local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = {
    assetsInView = {}, 
    assetsInRange = {}
};
return (v1.createContext(v2));