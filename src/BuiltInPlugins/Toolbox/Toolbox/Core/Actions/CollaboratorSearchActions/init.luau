local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local l_Action_0 = require(l_Packages_0.Framework).Util.Action;
return {
    LoadingLocalUserFriends = l_Action_0("LoadingLocalUserFriends", function() --[[ Line: 7 ]]
        return {};
    end), 
    LoadingLocalUserGroups = l_Action_0("LoadingLocalUserGroups", function() --[[ Line: 10 ]]
        return {};
    end), 
    LoadingWebResults = l_Action_0("LoadingWebResults", function(v2) --[[ Line: 13 ]]
        return {
            searchTerm = v2
        };
    end), 
    LoadedLocalUserFriends = l_Action_0("LoadedLocalUserFriends", function(v3, v4) --[[ Line: 19 ]]
        return {
            success = v3, 
            friends = v4
        };
    end), 
    LoadedLocalUserGroups = l_Action_0("LoadedLocalUserGroups", function(v5, v6) --[[ Line: 25 ]]
        return {
            success = v5, 
            groups = v6
        };
    end), 
    LoadedWebResults = l_Action_0("LoadedWebResults", function(v7, v8, v9) --[[ Line: 31 ]]
        return {
            success = v7, 
            key = v8, 
            results = v9
        };
    end), 
    SearchTextChanged = l_Action_0("SearchTextChanged", function(v10) --[[ Line: 39 ]]
        return {
            text = v10
        };
    end), 
    CollaboratorAdded = l_Action_0("CollaboratorAdded", function(v11, v12, v13) --[[ Line: 45 ]]
        return {
            collaboratorType = v11, 
            collaboratorId = v12, 
            action = v13
        };
    end)
};