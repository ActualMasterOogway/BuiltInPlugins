local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local _ = require(l_Parent_0.Src.Util.SharedTypes);
local v4 = {};
return function(v5) --[[ Line: 22 ]] --[[ Name: ActivityHistoryProvider ]]
    -- upvalues: v1 (copy), v4 (copy), v2 (copy)
    local v6 = v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: v5 (copy), v4 (ref)
        return {
            activityHistoryClient = v5.activityHistoryClient, 
            showSaveOrPublishPlaceToRobloxFn = v5.showSaveOrPublishPlaceToRobloxFn or function() --[[ Line: 27 ]]

            end, 
            useCollaborators = v5.useCollaborators or function() --[[ Line: 28 ]]
                -- upvalues: v4 (ref)
                return v4;
            end, 
            DEPRECATED_usePlaceAndUniverseId = v5.DEPRECATED_usePlaceAndUniverseId or function() --[[ Line: 31 ]]
                return 0, 0;
            end, 
            usePlaceAndUniverseId = v5.usePlaceAndUniverseId or function() --[[ Line: 34 ]]
                return 0, 0;
            end, 
            useConnectToDataModelSessionEffect = v5.useConnectToDataModelSessionEffect or function() --[[ Line: 37 ]]

            end, 
            openBrowserLink = v5.openBrowserLink or function() --[[ Line: 38 ]]

            end, 
            contextType = v5.contextType, 
            getActivityHistoryManager = v5.getActivityHistoryManager or function() --[[ Line: 40 ]]

            end
        };
    end, {
        v5.activityHistoryClient, 
        v5.showSaveOrPublishPlaceToRobloxFn, 
        v5.openBrowserLink, 
        v5.contextType, 
        v5.useCollaborators, 
        v5.DEPRECATED_usePlaceAndUniverseId, 
        v5.usePlaceAndUniverseId, 
        v5.useConnectToDataModelSessionEffect, 
        v5.getActivityHistoryManager
    });
    return v1.createElement(v2.Provider, {
        value = v6
    }, v5.children);
end;