local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Clients.MockActivityHistoryClient);
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local v4 = {};
local v5 = {
    activityHistoryClient = v2, 
    showSaveOrPublishPlaceToRobloxFn = function() --[[ Line: 13 ]] --[[ Name: showSaveOrPublishPlaceToRobloxFn ]]

    end, 
    getActivityHistoryManager = function() --[[ Line: 14 ]] --[[ Name: getActivityHistoryManager ]]
        return nil;
    end, 
    useCollaborators = function() --[[ Line: 17 ]] --[[ Name: useCollaborators ]]
        -- upvalues: v4 (copy)
        return v4;
    end, 
    DEPRECATED_usePlaceAndUniverseId = function() --[[ Line: 20 ]] --[[ Name: DEPRECATED_usePlaceAndUniverseId ]]
        return 0, 0;
    end, 
    usePlaceAndUniverseId = function() --[[ Line: 23 ]] --[[ Name: usePlaceAndUniverseId ]]
        return 0, 0;
    end, 
    useConnectToDataModelSessionEffect = function() --[[ Line: 26 ]] --[[ Name: useConnectToDataModelSessionEffect ]]

    end, 
    openBrowserLink = function() --[[ Line: 27 ]] --[[ Name: openBrowserLink ]]

    end, 
    contextType = "mock context (default)"
};
return (v1.createContext(v5));