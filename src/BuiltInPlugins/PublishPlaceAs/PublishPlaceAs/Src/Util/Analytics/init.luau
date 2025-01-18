local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Cryo);
return {
    reportSaveCancel = function(v4) --[[ Line: 20 ]] --[[ Name: reportSaveCancel ]]
        -- upvalues: l_StudioService_0 (copy), l_RbxAnalyticsService_0 (copy), v3 (copy)
        local v5 = v4 and "FilePublishPlaceAsCancel" or "FileSavePlaceAsCancel";
        local v6 = {
            userId = l_StudioService_0:GetUserId(), 
            studioSid = l_RbxAnalyticsService_0:GetSessionId()
        };
        if l_StudioService_0:GetPlaceIsPersistedToCloud() then
            v6 = v3.Dictionary.join(v6, {
                placeId = game.PlaceId
            });
        end;
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "TeamCreate", v5, v6);
    end, 
    reportDataSharingToEventIngest = function(v7, v8, v9, v10) --[[ Line: 36 ]] --[[ Name: reportDataSharingToEventIngest ]]
        -- upvalues: l_StudioService_0 (copy), l_RbxAnalyticsService_0 (copy)
        local v11 = {
            userId = l_StudioService_0:GetUserId(), 
            dataSharingFetchState = v7, 
            dataSharingEnabled = v8, 
            universeId = v9, 
            groupId = v10
        };
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "CreateNewGame", "DataSharingUniverseCreation", v11);
    end
};