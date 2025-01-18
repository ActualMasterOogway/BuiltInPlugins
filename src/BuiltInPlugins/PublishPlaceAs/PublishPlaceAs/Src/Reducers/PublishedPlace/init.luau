local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = {
    isPublishing = false, 
    publishInfo = {
        id = 0, 
        name = "", 
        parentGameName = "", 
        parentGameId = 0, 
        settings = {}, 
        message = ""
    }
};
return v1.createReducer(v3, {
    SetIsPublishing = function(v4, v5) --[[ Line: 18 ]] --[[ Name: SetIsPublishing ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            isPublishing = v5.isPublishing
        });
    end, 
    SetPublishInfo = function(v6, v7) --[[ Line: 24 ]] --[[ Name: SetPublishInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            publishInfo = v2.Dictionary.join(v6.publishInfo, v7.publishInfo)
        });
    end, 
    ResetInfo = function(v8, v9) --[[ Line: 30 ]] --[[ Name: ResetInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v8, {
            publishInfo = v2.Dictionary.join(v8.publishInfo, v9.publishInfo), 
            isPublishing = v9.isPublishing
        });
    end
});