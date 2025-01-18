local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Src.Reducers.Status);
local v3 = require(l_script_FirstAncestor_0.Src.Reducers.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Reducers.History);
local v5 = require(l_script_FirstAncestor_0.Src.Reducers.Notifications);
return v1.combineReducers({
    Status = v2, 
    AnimationData = v3, 
    History = v4, 
    Notifications = v5
});