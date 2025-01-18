local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return require(l_Parent_0.Packages.Rodux).createReducer({
    creatorType = nil, 
    creatorId = nil, 
    creatorName = nil, 
    creatorFriends = nil, 
    groupOwnerId = nil, 
    groupOwnerName = nil
}, {
    ResetStore = function(_, _) --[[ Line: 17 ]] --[[ Name: ResetStore ]]
        return {};
    end, 
    SetCreatorType = function(v4, v5) --[[ Line: 21 ]] --[[ Name: SetCreatorType ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v4, {
            creatorType = v5.creatorType
        });
    end, 
    SetCreatorId = function(v6, v7) --[[ Line: 27 ]] --[[ Name: SetCreatorId ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v6, {
            creatorId = v7.creatorId
        });
    end, 
    SetCreatorName = function(v8, v9) --[[ Line: 33 ]] --[[ Name: SetCreatorName ]]
        -- upvalues: v1 (copy)
        return v1.Dictionary.join(v8, {
            creatorName = v9.creatorName
        });
    end, 
    SetCreatorFriends = function(v10, v11) --[[ Line: 39 ]] --[[ Name: SetCreatorFriends ]]
        -- upvalues: v1 (copy)
        assert(v10.creatorType == Enum.CreatorType.User, "Setting friends in non-user owned game");
        return v1.Dictionary.join(v10, {
            creatorFriends = v11.creatorFriends
        });
    end, 
    SetGroupOwnerId = function(v12, v13) --[[ Line: 46 ]] --[[ Name: SetGroupOwnerId ]]
        -- upvalues: v1 (copy)
        assert(v12.creatorType == Enum.CreatorType.Group, "Setting group owner id in non-group owned game");
        return v1.Dictionary.join(v12, {
            groupOwnerId = v13.groupOwnerId
        });
    end, 
    SetGroupOwnerName = function(v14, v15) --[[ Line: 53 ]] --[[ Name: SetGroupOwnerName ]]
        -- upvalues: v1 (copy)
        assert(v14.creatorType == Enum.CreatorType.Group, "Setting group owner name in non-group owned game");
        return v1.Dictionary.join(v14, {
            groupOwnerName = v15.groupOwnerName
        });
    end
});