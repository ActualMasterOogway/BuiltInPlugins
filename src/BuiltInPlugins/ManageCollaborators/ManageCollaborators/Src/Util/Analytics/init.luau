local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.IsTeamCreateEnabled);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
getCommonArgs = function() --[[ Line: 9 ]] --[[ Name: getCommonArgs ]]
    -- upvalues: l_RbxAnalyticsService_0 (copy)
    return {
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        placeId = game.PlaceId, 
        machineTimeStamp = os.time()
    };
end;
return {
    reportCollaborateButtonPressed = function() --[[ Line: 21 ]] --[[ Name: reportCollaborateButtonPressed ]]
        -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
        local v3 = getCommonArgs();
        v3.isTeamCreate = v1();
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "CollaborateButtonPressed", v3);
    end, 
    reportSaveToRobloxPressed = function() --[[ Line: 30 ]] --[[ Name: reportSaveToRobloxPressed ]]
        -- upvalues: l_RbxAnalyticsService_0 (copy)
        local v4 = getCommonArgs();
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "SaveToRobloxPressed", v4);
    end, 
    reportCancelPressed = function(v5) --[[ Line: 37 ]] --[[ Name: reportCancelPressed ]]
        -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
        local v6 = getCommonArgs();
        v6.isTeamCreate = v1();
        v6.gameType = v5 and "group" or "user";
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "CancelButtonPressed", v6);
    end, 
    reportSaveCollaboratorsPressed = function(v7, v8, v9) --[[ Line: 47 ]] --[[ Name: reportSaveCollaboratorsPressed ]]
        -- upvalues: v1 (copy), l_RbxAnalyticsService_0 (copy)
        local v10 = "";
        local v11 = "";
        local v12 = "";
        local v13 = "";
        for _, v15 in v8 do
            if string.len(v10) > 0 then
                v10 = v10 .. ",";
                v11 = v11 .. ",";
                v12 = v12 .. ",";
                v13 = v13 .. ",";
            end;
            v10 = v10 .. "add";
            v11 = v11 .. v15.subjectId;
            v12 = v12 .. v15.action;
            v13 = v13 .. v15.subjectType;
        end;
        for _, v17 in v9 do
            if string.len(v10) > 0 then
                v10 = v10 .. ",";
                v11 = v11 .. ",";
                v12 = v12 .. ",";
                v13 = v13 .. ",";
            end;
            v10 = v10 .. "delete";
            v11 = v11 .. v17.subjectId;
            v12 = v12 .. v17.action;
            v13 = v13 .. v17.subjectType;
        end;
        local v18 = getCommonArgs();
        v18.isTeamCreate = v1();
        v18.gameType = v7 and "group" or "user";
        v18.actions = v10;
        v18.ids = v11;
        v18.permissionLevels = v12;
        v18.types = v13;
        l_RbxAnalyticsService_0:SendEventDeferred("studio", "ManageCollaborators", "SaveCollaboratorsButtonPressed", v18);
    end
};