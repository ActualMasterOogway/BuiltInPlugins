local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = {
    groupInfo = {
        groups = {}, 
        ownedGroups = {}
    }
};
return v1.createReducer(v3, {
    SetGroupInfo = function(v4, v5) --[[ Line: 10 ]] --[[ Name: SetGroupInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v4, {
            groupInfo = v2.Dictionary.join(v4.groupInfo, v5.groupInfo)
        });
    end, 
    ResetInfo = function(v6, v7) --[[ Line: 16 ]] --[[ Name: ResetInfo ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v6, {
            groupInfo = v2.Dictionary.join(v6.groupInfo, v7.groupInfo)
        });
    end
});