local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = {
    publishInProgress = {
        universe = {}, 
        place = {}, 
        isPublish = false, 
        failCount = 0, 
        requestInFlight = false
    }
};
return v1.createReducer(v3, {
    SetPublishInProgress = function(v4, v5) --[[ Line: 16 ]] --[[ Name: SetPublishInProgress ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            publishInProgress = v2.Dictionary.join(v4.publishInProgress, v5.publishInProgress)
        });
    end
});